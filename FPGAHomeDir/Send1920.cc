#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/mman.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <string.h>
#include <errno.h>
#include <time.h>

#define REG_ADDRESS 0x80020100   // Base address of reg_ro_out
#define PAGE_SIZE   4096
#define PAGE_MASK   (~(PAGE_SIZE - 1))

#define TOTAL_BITS  2048
#define TOTAL_BYTES (TOTAL_BITS / 8)   // 256 bytes
#define SNAP_BITS   192
#define SNAP_BYTES  (SNAP_BITS / 8)    // 24 bytes
#define SNAP_COUNT  10
#define PAYLOAD_BYTES (SNAP_COUNT * SNAP_BYTES)  // 240 bytes

// ---- TCP helper (from MuonGenData.cc style) ----
static int send_all(int sockfd, const void *data, size_t len) {
    int total = 0;
    int bytesleft = (int)len;
    int n;
    uint16_t header[2];
    header[0] = 7;             // Packet type
    header[1] = (uint16_t)len; // Payload length (kept host-endian to match your original)
    n = send(sockfd, &header, sizeof(header), 0);
    if (n == -1) {
        perror("Error: send header");
        return 0;
    }
    while (total < (int)len) {
        n = send(sockfd, (const char*)data + total, bytesleft, 0);
        if (n != bytesleft) {
            // diagnostic like your original
            printf("Sent %d bytes of %zu at address: %p\n", n, len, (const char*)data + total);
        }
        if (n == -1) {
            perror("Error: client: send");
            break;
        }
        total += n;
        bytesleft -= n;
    }
    return (total == (int)len);
}

static int connect_tcp(const char *ip, uint16_t port) {
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    if (sockfd < 0) {
        perror("socket");
        return -1;
    }
    struct sockaddr_in saddr;
    memset(&saddr, 0, sizeof(saddr));
    saddr.sin_family = AF_INET;
    saddr.sin_port   = htons(port);
    if (inet_aton(ip, &saddr.sin_addr) == 0) {
        fprintf(stderr, "Invalid IP: %s\n", ip);
        close(sockfd);
        return -1;
    }
    printf("Connecting to %s:%u...\n", ip, (unsigned)port);
    if (connect(sockfd, (struct sockaddr*)&saddr, sizeof(saddr)) < 0) {
        perror("connect");
        close(sockfd);
        return -1;
    }
    printf("Connected.\n");
    return sockfd;
}

int main(int argc, char **argv) {
    const char *ip   = (argc > 1) ? argv[1] : "192.168.1.245";
    uint16_t    port = (argc > 2) ? (uint16_t)atoi(argv[2]) : 8765;

    // ---- Map reg_ro_out via /dev/mem (from Print1920Stack.cc) ----
    int fd = open("/dev/mem", O_RDONLY | O_SYNC);
    if (fd < 0) {
        perror("Error opening /dev/mem");
        return EXIT_FAILURE;
    }

    off_t page_base   = REG_ADDRESS & PAGE_MASK;
    off_t page_offset = REG_ADDRESS & ~PAGE_MASK;
    void *map_base = mmap(NULL, PAGE_SIZE, PROT_READ, MAP_SHARED, fd, page_base);
    if (map_base == MAP_FAILED) {
        perror("Error mapping memory");
        close(fd);
        return EXIT_FAILURE;
    }

    volatile uint64_t *reg64_addr = (volatile uint64_t *)((char *)map_base + page_offset);

    // Reusable buffers
    uint64_t data64[TOTAL_BYTES / 8]; // 32 x 64-bit words = 256 bytes
    uint8_t  payload[PAYLOAD_BYTES];  // 240 bytes for the 10x snapshots

    // TCP connect (retry a few times)
    int sockfd = -1;
    for (int tries = 0; tries < 5 && sockfd < 0; ++tries) {
        sockfd = connect_tcp(ip, port);
        if (sockfd < 0) {
            fprintf(stderr, "Retrying in 3s...\n");
            sleep(3);
        }
    }
    if (sockfd < 0) {
        fprintf(stderr, "Failed to connect after retries. Exiting.\n");
        munmap(map_base, PAGE_SIZE);
        close(fd);
        return EXIT_FAILURE;
    }

    // Main loop: read once per 5 seconds and send the 1920-bit block
    while (1) {
        // Read entire 2048-bit region (32 words × 8 bytes)
        for (int i = 0; i < (int)(TOTAL_BYTES / 8); i++) {
            data64[i] = reg64_addr[i];
        }

        // Extract exactly the 10x192-bit snapshot stack (first 240 bytes)
        // In Print1920Stack.cc, snapshots are at bytes[0..239] as 10 frames of 24 bytes each.
        uint8_t *bytes = (uint8_t *)data64; // little-endian interpretation is fine for raw forwarding
        memcpy(payload, bytes, PAYLOAD_BYTES);

        // Optional: log PTBTrig / MuonCounter like Print1920Stack.cc (not sent)
        uint64_t word0 = data64[0];
        uint64_t muon_counter = word0 & ((1ULL << 55) - 1ULL); // bits [54:0]
        uint8_t  ptb_trig     = (word0 >> 55) & 0x1;           // bit [55]
        printf("PTBTrig=%u  MuonCounter=0x%013llX (%llu)  Sending %d bytes...\n",
               (unsigned)ptb_trig,
               (unsigned long long)muon_counter,
               (unsigned long long)muon_counter,
               (int)PAYLOAD_BYTES);

        // Send the 1920-bit payload with simple header {type=7, len=240}
        if (!send_all(sockfd, payload, PAYLOAD_BYTES)) {
            perror("send payload");
            // Try to reconnect once on failure
            close(sockfd);
            sockfd = connect_tcp(ip, port);
            if (sockfd < 0) {
                fprintf(stderr, "Reconnect failed. Exiting.\n");
                break;
            }
        } else {
            printf("Payload sent.\n");
        }

        // Pace like your original example
        sleep(1);
    }

    if (munmap(map_base, PAGE_SIZE) == -1)
        perror("Error unmapping memory");
    close(fd);
    if (sockfd >= 0) close(sockfd);
    return 0;
}
