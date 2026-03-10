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
#define TOTAL_BITS  2048
#define TOTAL_BYTES (TOTAL_BITS / 8)
#define NWORDS      (TOTAL_BYTES / 8)

#define SNAP_BITS   192
#define SNAP_BYTES  (SNAP_BITS / 8)   // 24 bytes
#define SNAP_COUNT  10

static inline uint64_t read_55bit_counter_le(const uint8_t *s) {
    uint64_t v = 0;
    v |= (uint64_t)s[0];
    v |= (uint64_t)s[1] << 8;
    v |= (uint64_t)s[2] << 16;
    v |= (uint64_t)s[3] << 24;
    v |= (uint64_t)s[4] << 32;
    v |= (uint64_t)s[5] << 40;
    v |= (uint64_t)s[6] << 48;
    return v & ((1ULL << 55) - 1); // bits [54:0]
}

int main(void) {
    int fd = open("/dev/mem", O_RDONLY | O_SYNC);
    if (fd < 0) { perror("open"); return 1; }

    off_t page_base   = REG_ADDRESS & PAGE_MASK;
    off_t page_offset = REG_ADDRESS & ~PAGE_MASK;

    void *map_base = mmap(NULL, PAGE_SIZE, PROT_READ, MAP_SHARED, fd, page_base);
    if (map_base == MAP_FAILED) { perror("mmap"); close(fd); return 1; }

    volatile uint64_t *reg64_addr =
        (volatile uint64_t *)((char *)map_base + page_offset);

    const uint64_t COUNTER_MASK = (1ULL << 55) - 1;

    while (1) {
        uint64_t data64[NWORDS];
        for (int i = 0; i < NWORDS; i++)
            data64[i] = reg64_addr[i];

        const uint8_t *base = (const uint8_t *)data64;

        // Count triggers across all 10 snapshots
        uint64_t n_trig = 0;
        for (int snap = 0; snap < SNAP_COUNT; ++snap) {
            const uint8_t *s = base + snap * SNAP_BYTES;
            uint64_t w0;
            memcpy(&w0, s, sizeof(w0));     // lowest 64 bits of snapshot
            n_trig += (w0 >> 55) & 1ULL;    // PTBTrigger is bit 55
        }

        // Time window from oldest to newest (adjust direction if needed)
        const uint8_t *s0 = base + 0 * SNAP_BYTES;   // assume newest
        const uint8_t *s9 = base + 9 * SNAP_BYTES;   // assume oldest
        uint64_t c0 = read_55bit_counter_le(s0);
        uint64_t c9 = read_55bit_counter_le(s9);

        // If your stack is oldest at index 0 and newest at 9, swap operands.
        uint64_t dcount = (c0 - c9) & COUNTER_MASK;  // ticks between s9 -> s0

        double rate_hz = (dcount > 0) ? ( (double)n_trig * 1e8 / (double)dcount ) : 0.0;

        printf("PTBTrigger Rate: %.3f Hz (n=%llu, Δcount=%llu)\n",
               rate_hz, (unsigned long long)n_trig, (unsigned long long)dcount);
        fflush(stdout);

        sleep(1);
    }

    munmap(map_base, PAGE_SIZE);
    close(fd);
    return 0;
}
