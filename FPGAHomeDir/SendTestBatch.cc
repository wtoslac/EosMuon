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

// ====== Struct layout ======
#define N_BITS      192
#define N_WORDS     (N_BITS/64)     // 3 words (192 bits)
#define BATCH_SIZE  10              // 10 snapshots per batch

typedef struct {
    uint64_t data[N_WORDS];
} muon_t;

typedef struct {
    uint64_t n_events;
    muon_t   events[BATCH_SIZE];
} muon_t_batch;

// ====== FPGA mapping ======
#ifndef REG_ADDRESS
#define REG_ADDRESS 0x80020100      // Base address of reg_ro_out
#endif
#define PAGE_SIZE    4096
#define PAGE_MASK    (~(PAGE_SIZE - 1))

#define TOTAL_BITS   2048
#define TOTAL_BYTES  (TOTAL_BITS / 8)
#define SNAP_BITS    192
#define SNAP_BYTES   (SNAP_BITS / 8)
#define SNAP_COUNT   10
#define STACK_BYTES  (SNAP_COUNT * SNAP_BYTES) 

// ====== TCP helpers ======
static int connect_tcp(const char *ip, uint16_t port) {
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    if (sockfd < 0) { perror("socket"); return -1; }

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

static int send_all_with_header(int sockfd, const void *data, size_t len) {
    uint16_t header[2];
    header[0] = 7;                // packet type
    header[1] = (uint16_t)len;    // payload length (host-endian)
    if (send(sockfd, header, sizeof(header), 0) == -1) {
        perror("send header");
        return 0;
    }

    const char *p = (const char*)data;
    size_t left = len;
    while (left > 0) {
        ssize_t n = send(sockfd, p, left, 0);
        if (n == -1) { perror("send payload"); return 0; }
        p += n;
        left -= (size_t)n;
    }
    return 1;
}

int main(int argc, char **argv) {
    const char *ip   = (argc > 1) ? argv[1] : "192.168.1.245";
    uint16_t    port = (argc > 2) ? (uint16_t)atoi(argv[2]) : 8765;

    // Map reg_ro_out
    int fd = open("/dev/mem", O_RDONLY | O_SYNC);
    if (fd < 0) { perror("open /dev/mem"); return EXIT_FAILURE; }

    off_t page_base   = REG_ADDRESS & PAGE_MASK;
    off_t page_offset = REG_ADDRESS & ~PAGE_MASK;
    void *map_base = mmap(NULL, PAGE_SIZE, PROT_READ, MAP_SHARED, fd, page_base);
    if (map_base == MAP_FAILED) { perror("mmap"); close(fd); return EXIT_FAILURE; }

    volatile uint8_t *reg_bytes = (volatile uint8_t *)((char*)map_base + page_offset);

    // Connect with retries
    int sockfd = -1;
    for (int tries = 0; tries < 5 && sockfd < 0; ++tries) {
        sockfd = connect_tcp(ip, port);
        if (sockfd < 0) { fprintf(stderr, "Retrying in 3s...\n"); sleep(3); }
    }
    if (sockfd < 0) {
        fprintf(stderr, "Failed to connect.\n");
        munmap(map_base, PAGE_SIZE);
        close(fd);
        return EXIT_FAILURE;
    }

    while (1) {
        // Read 256B region
        uint8_t region[TOTAL_BYTES];
        for (int i = 0; i < TOTAL_BYTES; ++i)
            region[i] = reg_bytes[i];

        // Fill muon_t_batch with 10 × 192-bit entries
        muon_t_batch packet = {0};
        packet.n_events = SNAP_COUNT;

        for (int i = 0; i < SNAP_COUNT; ++i) {
            const uint8_t *src = &region[i * SNAP_BYTES]; // 24 bytes per snapshot
            memcpy(packet.events[i].data, src, SNAP_BYTES);
        }

        // Send the batch
        size_t payload_len = sizeof(packet);
        if (send_all_with_header(sockfd, &packet, payload_len)) {
            printf("Sent muon_t_batch: n_events=%llu, payload=%zu bytes\n",
                   (unsigned long long)packet.n_events, payload_len);
        } else {
            close(sockfd);
            sockfd = connect_tcp(ip, port);
            if (sockfd < 0) {
                fprintf(stderr, "Reconnect failed. Exiting.\n");
                break;
            }
        }

        sleep(1);
    }

    munmap(map_base, PAGE_SIZE);
    close(fd);
    if (sockfd >= 0) close(sockfd);
    return 0;
}
