#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/mman.h>
#include <stdint.h>
#include <string.h>
#include <time.h>

#define REG_ADDRESS 0x80020100
#define PAGE_SIZE   4096
#define PAGE_MASK   (~(PAGE_SIZE - 1))
#define NWORDS 32

#define SNAP_BITS   192
#define SNAP_BYTES  (SNAP_BITS / 8)
#define SNAP_COUNT  10

int main(void) {
    int fd = open("/dev/mem", O_RDONLY | O_SYNC);
    if (fd < 0) { perror("open"); return 1; }

    off_t page_base   = REG_ADDRESS & PAGE_MASK;
    off_t page_offset = REG_ADDRESS & ~PAGE_MASK;

    void *map_base = mmap(NULL, PAGE_SIZE, PROT_READ, MAP_SHARED, fd, page_base);
    if (map_base == MAP_FAILED) { perror("mmap"); close(fd); return 1; }

    volatile uint64_t *reg64_addr = (volatile uint64_t *)((char *)map_base + page_offset);

    uint64_t ntrig = 0;

    while (1) {
        uint64_t data64[NWORDS];
        for (int i = 0; i < NWORDS; i++)
            data64[i] = reg64_addr[i];

        for (int snap = 0; snap < SNAP_COUNT; snap++) {
            const uint8_t *s = ((const uint8_t *)data64) + snap * SNAP_BYTES;

            uint64_t low64;
            memcpy(&low64, s, sizeof(low64));

            if ((low64 >> 55) & 1ULL)
                ntrig++;
        }

        printf("Cumulative PTBTrigger count: %llu\n", ntrig);
        fflush(stdout);

        sleep(1);
    }

    munmap(map_base, PAGE_SIZE);
    close(fd);
    return 0;
}
