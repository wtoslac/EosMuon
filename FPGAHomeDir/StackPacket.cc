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

int main(void) {
    int fd = open("/dev/mem", O_RDONLY);
    if (fd < 0) { perror("open"); return 1; }

    off_t page_base   = REG_ADDRESS & PAGE_MASK;
    off_t page_offset = REG_ADDRESS & ~PAGE_MASK;

    void *map_base = mmap(NULL, PAGE_SIZE, PROT_READ, MAP_SHARED, fd, page_base);
    if (map_base == MAP_FAILED) { perror("mmap"); close(fd); return 1; }

    volatile uint64_t *reg64_addr =
        (volatile uint64_t *)((char *)map_base + page_offset);
    uint64_t packet[3]; 

    struct timespec start,end;
    clock_gettime(CLOCK_MONOTONIC_RAW, &start);
    //memcpy(&packet,(const void*)reg64_addr,30*sizeof(uint64_t)); // speed goes from 9-17 us
    for (int i = 0; i < 3; ++i) { // this is always 10 us
        packet[i] = reg64_addr[i];
    }
    clock_gettime(CLOCK_MONOTONIC_RAW, &end);
    long long dt_ns = (end.tv_sec - start.tv_sec) * 1000000000LL +
                  (end.tv_nsec - start.tv_nsec);
    printf("Copy+pack time: %lld ns (%.3f µs)\n", dt_ns, dt_ns / 1000.0);

    // Print first few 64-bit words to confirm contents
    for (int i = 0; i < 1; ++i) {
        printf("SNAP[%2d]: %016llx %016llx %016llx\n",
           i,(unsigned long long)packet[i*3 + 0],
           (unsigned long long)packet[i*3 + 1],
           (unsigned long long)packet[i*3 + 2]);

    }
    munmap(map_base, PAGE_SIZE);
    close(fd);
    return 0;
}
