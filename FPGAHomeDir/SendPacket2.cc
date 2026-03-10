#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/mman.h>
#include <stdint.h>
#include <string.h>
#include <time.h>
#include <errno.h>

#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>

#define REG_ADDRESS 0x80020100
#define PAGE_SIZE   4096
#define PAGE_MASK   (~(PAGE_SIZE - 1))
#define NWORDS      3
#define COUNTER_MASK ((1ULL << 55) - 1)
#define TIMEOUT_SEC 3

// === send_all ===
static int send_all(int sockfd, const void *data, size_t len) {
    size_t total = 0;
    size_t bytesleft = len;
    ssize_t n;

    uint16_t header[2];
    header[0] = 7;
    header[1] = (uint16_t)len;
    n = send(sockfd, &header, sizeof(header), 0);
    if (n == -1) {
        perror("Error: client: send header");
        return 0;
    }

    while (total < len) {
        n = send(sockfd, (const char*)data + total, bytesleft, 0);
        if (n == -1) {
            perror("Error: client: send");
            break;
        }
        if ((size_t)n != bytesleft) {
            printf("Sent %zd bytes of %zu at address: %p\n",
                   n, bytesleft, (const char*)data + total);
        }
        total     += (size_t)n;
        bytesleft -= (size_t)n;
    }
    return (total == len);
}

static inline double seconds_since(struct timespec a, struct timespec b) {
    // returns a - b in seconds
    return (double)(a.tv_sec - b.tv_sec) +
           (double)(a.tv_nsec - b.tv_nsec) / 1e9;
}

int main(void) {
    // Prepare to copy FPGA Registers to Muon Packet[iEvents]
    int fd = open("/dev/mem", O_RDONLY);
    if (fd < 0) { perror("open"); return 1; }

    off_t page_base   = REG_ADDRESS & PAGE_MASK;
    off_t page_offset = REG_ADDRESS & ~PAGE_MASK;

    void *map_base = mmap(NULL, PAGE_SIZE, PROT_READ, MAP_SHARED, fd, page_base);
    if (map_base == MAP_FAILED) { perror("mmap"); close(fd); return 1; }

    volatile uint64_t *reg64_addr =
        (volatile uint64_t *)((char *)map_base + page_offset);

    // 20 events * 3 qwords/event = 60 qwords total
    uint64_t packet[60];

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
        close(sockfd);
        munmap(map_base, PAGE_SIZE);
        close(fd);
        return 1;
    }

    uint64_t LastCounter = ~0ULL; // force first read to count as a change
    int iEvent = 0;

    struct timespec last_change, now;
    clock_gettime(CLOCK_MONOTONIC, &last_change);

    while (1) {
        uint64_t Counter = reg64_addr[0] & COUNTER_MASK;

        if (Counter != LastCounter) {
            // New event
            LastCounter = Counter;
            clock_gettime(CLOCK_MONOTONIC, &last_change);

            // Pack this event in  three 64-bit words
            int base = iEvent * NWORDS;
            packet[base + 0] = reg64_addr[0];
            packet[base + 1] = reg64_addr[1];
            packet[base + 2] = reg64_addr[2];

            printf("Event[%2d]: %016llx %016llx %016llx\n", iEvent + 1,
                   (unsigned long long)packet[base + 0],
                   (unsigned long long)packet[base + 1],
                   (unsigned long long)packet[base + 2]);

            iEvent++;

            if (iEvent == 20) {
                size_t payload_len = (size_t)(iEvent * NWORDS) * sizeof(uint64_t);
                printf("Sending Packet of 20\n");
                (void)send_all(sockfd, &packet[0], payload_len);
                iEvent = 0;
            }
        }
	/*else {
            clock_gettime(CLOCK_MONOTONIC, &now);
            if (seconds_since(now, last_change) >= TIMEOUT_SEC) {
                if (iEvent > 0) {
                    size_t payload_len = (size_t)(iEvent * NWORDS) * sizeof(uint64_t);
                    printf("No counter change for %d s. Sending partial packet of %d event(s).\n",
                           TIMEOUT_SEC, iEvent);
                    (void)send_all(sockfd, &packet[0], payload_len);
                    iEvent = 0;
                }
                // Reset the timer so we don't repeatedly trigger every loop
                last_change = now;
            }
            usleep(1000);
        }*/

        // (optional) tiny pause to avoid 100% CPU spin:
        //struct timespec ts = {.tv_sec = 0, .tv_nsec = 1000}; // 1 ms
        //nanosleep(&ts, NULL);
    }

    munmap(map_base, PAGE_SIZE);
    close(fd);
    return 0;
}
