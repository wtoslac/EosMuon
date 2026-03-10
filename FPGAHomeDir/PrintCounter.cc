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

#define SNAP_BITS    192
#define SNAP_BYTES   (SNAP_BITS / 8)     // 24
#define SNAP_COUNT   10
#define COUNTER_MASK ((1ULL << 55) - 1)  // bits [54:0]

int main(void) {
    int fd = open("/dev/mem", O_RDONLY);
    if (fd < 0) { perror("open"); return 1; }

    off_t page_base   = REG_ADDRESS & PAGE_MASK;
    off_t page_offset = REG_ADDRESS & ~PAGE_MASK;

    void *map_base = mmap(NULL, PAGE_SIZE, PROT_READ, MAP_SHARED, fd, page_base);
    if (map_base == MAP_FAILED) { perror("mmap"); close(fd); return 1; }

    volatile uint64_t *reg64_addr =
        (volatile uint64_t *)((char *)map_base + page_offset);
    uint64_t data64[NWORDS];
    uint64_t counters[SNAP_COUNT];    

    struct timespec start,end;
    clock_gettime(CLOCK_MONOTONIC_RAW, &start);
    memcpy(data64, (const void*)reg64_addr,TOTAL_BYTES);

    //uint64_t counter0 = data64[0] & ((1ULL << 55) - 1);
    for (int i = 0; i < SNAP_COUNT; ++i) {
        int bit_start = i * 192;
        int word_index = bit_start / 64;
        int bit_offset = bit_start % 64;

        uint64_t w0 = data64[word_index];
        uint64_t w1 = data64[word_index + 1];
        uint64_t combined = (w0 >> bit_offset) | (w1 << (64 - bit_offset));

        counters[i] = combined & ((1ULL << 55) - 1);
    }


    clock_gettime(CLOCK_MONOTONIC_RAW, &end);

    long long dt_ns = (end.tv_sec - start.tv_sec) * 1000000000LL +
                  (end.tv_nsec - start.tv_nsec);

    //printf("Copy time: %lld ns (%.3f µs), counter: %llu\n", dt_ns, dt_ns / 1000.0,(unsigned long long)counter0);
        // Print timing and all 10 counters in decimal
    printf("Copy+map time: %lld ns (%.3f µs)\n", dt_ns, dt_ns / 1000.0);
    for (int i = 0; i < SNAP_COUNT; ++i) {
        printf("counter[%d] = %llu\n", i, (unsigned long long)counters[i]);
    }


    munmap(map_base, PAGE_SIZE);
    close(fd);
    return 0;
}
