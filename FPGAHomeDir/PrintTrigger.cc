#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/mman.h>
#include <stdint.h>
#include <time.h>

#define REG_ADDRESS 0x80020100   // Base address of reg_ro_out
#define PAGE_SIZE   4096
#define PAGE_MASK   (~(PAGE_SIZE - 1))
#define TOTAL_BITS  2048
#define TOTAL_BYTES (TOTAL_BITS / 8)   // 256 bytes
#define WORDS64     (TOTAL_BYTES / 8)  // 32 words (256B / 8)
#define SNAP_BITS   192
#define SNAP_COUNT  10
#define REFRESH_US  100000   // 100 ms = 10 Hz

int main(void) {
    int fd;
    void *map_base;
    volatile uint64_t *reg64_addr;

    // --- Open /dev/mem ---
    fd = open("/dev/mem", O_RDONLY | O_SYNC);
    if (fd < 0) {
        perror("Error opening /dev/mem");
        return EXIT_FAILURE;
    }

    // --- Map the hardware register space ---
    off_t page_base   = REG_ADDRESS & PAGE_MASK;
    off_t page_offset = REG_ADDRESS & ~PAGE_MASK;
    map_base = mmap(NULL, PAGE_SIZE, PROT_READ, MAP_SHARED, fd, page_base);
    if (map_base == MAP_FAILED) {
        perror("Error mapping memory");
        close(fd);
        return EXIT_FAILURE;
    }

    // --- Access as 64-bit words ---
    reg64_addr = (volatile uint64_t *)((char *)map_base + page_offset);

    printf("Monitoring trigger bits (updates every 100 ms):\n");
    printf("------------------------------------------------\n");

    // --- Continuous monitor loop ---
    while (1) {
        uint64_t data64[WORDS64];
        for (int i = 0; i < WORDS64; i++) {
            data64[i] = reg64_addr[i];
        }

        printf("[");
        for (int snap = 0; snap < SNAP_COUNT; snap++) {
            int bit_index = 55 + snap * SNAP_BITS;   // global bit index in reg_ro_out
            int word_idx  = bit_index / 64;
            int bit_in_word = bit_index % 64;

            uint8_t trigger = (data64[word_idx] >> bit_in_word) & 0x1;
            printf("%u", trigger);
            if (snap < SNAP_COUNT - 1) printf(" ");
        }
        printf("]\n");
        fflush(stdout);

        usleep(REFRESH_US);  // sleep 100 ms between reads
    }

    // --- Cleanup ---
    if (munmap(map_base, PAGE_SIZE) == -1)
        perror("Error unmapping memory");
    close(fd);

    return EXIT_SUCCESS;
}
