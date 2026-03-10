#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <time.h>

#define REG_ADDRESS 0x80020100
#define PAGE_SIZE   4096
#define PAGE_MASK   (~(PAGE_SIZE - 1))
#define TOTAL_BITS  2048
#define TOTAL_BYTES (TOTAL_BITS / 8)        // 256 bytes
#define NWORDS      (TOTAL_BYTES / 8)       // 32 x uint64_t

#define SNAP_BITS       192
#define SNAP_BYTES      (SNAP_BITS / 8)     // 24 bytes
#define SNAP_QWORDS     (SNAP_BYTES / 8)    // 3 x uint64_t
#define SNAP_PER_READ   10                  // 1920 bits per stack inside reg
#define SNAP_PER_PACKET 20                  // send 20 triggered events

typedef struct {
    uint64_t w0;   // [63:0]
    uint64_t w1;   // [127:64]
    uint64_t w2;   // [191:128]
} muon_t;

typedef struct {
    uint64_t n_events;                 // keep your existing header field
    muon_t   events[SNAP_PER_PACKET];  // 20 events payload
} packet_t;

// === send_all ===
static int send_all(int sockfd, const void *data, size_t len) {
    int total = 0;
    int bytesleft = len;
    int n;
    uint16_t header[2];
    header[0] = 7;
    header[1] = len;
    n = send(sockfd, &header, sizeof(header), 0);
    while (total < len) {
        n = send(sockfd, (char*)data + total, bytesleft, 0);
        if (n != len)
            printf("Sent %i bytes of %zu at address: %p\n", n, len, (char*)data + total);
        if (n == -1) {
            perror("Error: client: send");
            break;
        }
        total += n;
        bytesleft -= n;
    }
    return (total == len);
}

int main(void) {
    // Map reg_ro_out
    int fd = open("/dev/mem", O_RDONLY | O_SYNC);
    if (fd < 0) { perror("open /dev/mem"); return 1; }

    off_t page_base   = REG_ADDRESS & PAGE_MASK;
    off_t page_offset = REG_ADDRESS & ~PAGE_MASK;
    void *map_base = mmap(NULL, PAGE_SIZE, PROT_READ, MAP_SHARED, fd, page_base);
    if (map_base == MAP_FAILED) { perror("mmap"); close(fd); return 1; }

    volatile uint64_t *reg64_addr =
        (volatile uint64_t *)((char *)map_base + page_offset);

    // Connect TCP
    printf("Connecting to 192.168.1.245:8765...\n");
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    if (sockfd < 0) { perror("socket"); return 1; }
    struct sockaddr_in saddr;
    memset(&saddr, 0, sizeof(saddr));
    saddr.sin_family = AF_INET;
    saddr.sin_addr.s_addr = inet_addr("192.168.1.245");
    saddr.sin_port = htons(8765);
    if (connect(sockfd, (struct sockaddr*) &saddr, sizeof(saddr)) < 0) {
        perror("connect");
        // You can choose to exit or keep trying; here we exit for clarity.
        close(sockfd);
        munmap(map_base, PAGE_SIZE);
        close(fd);
        return 1;
    }

    uint64_t data64[NWORDS];
    packet_t packet;
    int filled = 0;

    // 1 microsecond sleep setup
    struct timespec ts;
    ts.tv_sec  = 0;
    ts.tv_nsec = 1000; // 1 us
	printf("Looking for Triggers\n");
    // Continuous loop: poll every 1 us, collect 20 triggers, send, repeat
    while(1) {
        // Read full 2048 bits (32 x 64b) once per poll
        for (int i = 0; i < NWORDS; ++i) {
            data64[i] = reg64_addr[i];
        }

        // The 1920-bit snapshot stack packs 10 frames of 192 bits:
        // frame i => words [3*i + 0 .. 3*i + 2]
        for (int i = 0; i < SNAP_PER_READ && filled < SNAP_PER_PACKET; ++i) {
            uint64_t w0 = data64[3*i + 0];
            uint64_t w1 = data64[3*i + 1];
            uint64_t w2 = data64[3*i + 2];

            if ((w0 >> 55) & 0x01) {
                packet.events[filled].w0 = w0;
                packet.events[filled].w1 = w1;
                packet.events[filled].w2 = w2;
                ++filled;
            }
        }

        // If we've collected 20 triggered events, send the packet
        if (filled >= SNAP_PER_PACKET) {
            packet.n_events = SNAP_PER_PACKET;
            size_t payload_len = sizeof(packet);
            if (!send_all(sockfd, &packet, payload_len)) {
                fprintf(stderr, "send_all failed (len=%zu)\n", payload_len);
            } else {
                printf("Sent %zu bytes (%d events)\n", payload_len, SNAP_PER_PACKET);
            }
            filled = 0; // reset for next packet
        }

        // Sleep ~1 microsecond before next poll
        nanosleep(&ts, NULL);
    }

    // Cleanup (unreached in this infinite loop)
    close(sockfd);
    munmap(map_base, PAGE_SIZE);
    close(fd);
    return 0;
}
