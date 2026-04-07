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

// === Binary print helper ===
static void print_binary_137(uint64_t w0, uint64_t w1, uint64_t w2) {
    int bitcount = 137;
    for (int b = bitcount - 1; b >= 0; --b) {
        int bit_index = b + 55; // shift to absolute bit index in the frame
        int word = bit_index / 64;
        int offset = bit_index % 64;
        uint64_t val = (word == 0) ? w0 : (word == 1 ? w1 : w2);
        int bit = (val >> offset) & 1;
        putchar(bit ? '1' : '0');
    }
    putchar('\n');
}

int main(int argc, char **argv) {
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
    printf("Attempting to connect to 192.168.1.245:8765...\n");
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    struct sockaddr_in saddr;
    memset(&saddr, 0, sizeof(saddr));
    saddr.sin_family = AF_INET;
    saddr.sin_addr.s_addr = inet_addr("192.168.1.245");
    saddr.sin_port = htons(8765);
    int s = connect(sockfd, (struct sockaddr*) &saddr, sizeof(saddr));
    if (s < 0) {
        printf("Connection failed with error %i\n", s);
        perror("connect");
        close(sockfd);
        sleep(5);
    }

    uint64_t dataA64[NWORDS];
    uint64_t dataB64[NWORDS];
    packet_t packet;
    packet.n_events = SNAP_PER_PACKET;

    // === Repeat 60 times, once per second ===
    for (int iter = 0; iter < 60; ++iter) {
        // Read A
        for (int i = 0; i < NWORDS; ++i)
            dataA64[i] = reg64_addr[i];

        // Read B
        for (int i = 0; i < NWORDS; ++i)
            dataB64[i] = reg64_addr[i];

        // Pack 10 from A
        for (int i = 0; i < SNAP_PER_READ; ++i) {
            packet.events[i].w0 = dataA64[3*i + 0];
            packet.events[i].w1 = dataA64[3*i + 1];
            packet.events[i].w2 = dataA64[3*i + 2];
        }
        // Pack 10 from B
        for (int k = 10; k < 20; ++k) {
            packet.events[k].w0 = dataB64[3*(k-10) + 0];
            packet.events[k].w1 = dataB64[3*(k-10) + 1];
            packet.events[k].w2 = dataB64[3*(k-10) + 2];
        }

        size_t payload_len = sizeof(packet);
        printf("[%02d] Sending packet...\n", iter + 1);
        if (!send_all(sockfd, &packet, payload_len)) {
            fprintf(stderr, "send_all failed (len=%zu)\n", payload_len);
        } else {
            printf("[%02d] Sent %zu bytes: %u events\n",
                   iter + 1, payload_len, (unsigned)packet.n_events);
        }

        // === Decode and print first snapshot for debug ===
        muon_t *m = &packet.events[0];
        uint64_t muon_counter = m->w0 & ((1ULL << 55) - 1); // bits [54:0]
        printf("[%02d] Counter (54 bits): %llu\n", iter + 1,
               (unsigned long long)muon_counter);
        printf("[%02d] Data (55-191 bits): ", iter + 1);
        print_binary_137(m->w0, m->w1, m->w2);

        sleep(1);
    }

    // Cleanup
    close(sockfd);
    munmap(map_base, PAGE_SIZE);
    close(fd);
    return 0;
}
