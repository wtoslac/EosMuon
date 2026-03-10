#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/mman.h>
#include <stdint.h>

#define REG_ADDRESS 0x80020100   // Base address of reg_ro_out
#define PAGE_SIZE   4096
#define PAGE_MASK   (~(PAGE_SIZE - 1))
#define TOTAL_BITS  2048
#define TOTAL_BYTES (TOTAL_BITS / 8)   // 256 bytes
#define LAST_BITS   136
#define LAST_BYTES  ((LAST_BITS + 7) / 8)   // 17 bytes
#define WORDS64     (TOTAL_BYTES / 8)       // 32 words (256B / 8)
#define SNAP_BITS   192
#define SNAP_BYTES  (SNAP_BITS / 8)         // 24 bytes
#define SNAP_COUNT  10

// Print a value in binary (MSB first)
void print_binary(uint8_t val) {
    for (int i = 7; i >= 0; i--)
        putchar((val & (1 << i)) ? '1' : '0');
}

int main(void) {
    int fd;
    void *map_base;
    volatile uint64_t *reg64_addr;

    // Open /dev/mem
    fd = open("/dev/mem", O_RDONLY | O_SYNC);
    if (fd < 0) {
        perror("Error opening /dev/mem");
        return EXIT_FAILURE;
    }

    // Map page
    off_t page_base   = REG_ADDRESS & PAGE_MASK;
    off_t page_offset = REG_ADDRESS & ~PAGE_MASK;
    map_base = mmap(NULL, PAGE_SIZE, PROT_READ, MAP_SHARED, fd, page_base);
    if (map_base == MAP_FAILED) {
        perror("Error mapping memory");
        close(fd);
        return EXIT_FAILURE;
    }

    // 64-bit pointer
    reg64_addr = (volatile uint64_t *)((char *)map_base + page_offset);

    // Read entire 2048-bit region (32 words × 8 bytes)
    uint64_t data64[WORDS64];
    for (int i = 0; i < WORDS64; i++) {
        data64[i] = reg64_addr[i];
    }

    // --- Extract PTBTrig and MuonCounter from first 64 bits ---
    uint64_t word0 = data64[0];
    uint64_t muon_counter = word0 & ((1ULL << 55) - 1ULL);   // bits [54:0]
    uint8_t  ptb_trig     = (word0 >> 55) & 0x1;             // bit [55]

    printf("PTBTrig: %u\n", ptb_trig);
    printf("MuonCounter Hex (Dec): 0x%013lX (%lu)\n\n",
           muon_counter, muon_counter);

    // --- Print all 10 snapshots (192 bits each) ---
    uint8_t *bytes = (uint8_t *)data64;  // reinterpret as byte array (little-endian)
    printf("Snapshot stack (10 x 192-bit frames):\n");

    for (int snap = 0; snap < SNAP_COUNT; snap++) {
        int start = snap * SNAP_BYTES;
        int end   = start + SNAP_BYTES - 1;

        printf("Snapshot %d (reg_ro_out[%d:%d]):\n", 
               snap, end * 8 + 7, start * 8);

        // Print bytes MSB-first per snapshot (oldest bits last)
        for (int i = end; i >= start; i--) {
            print_binary(bytes[i]);
            putchar(' ');
        }
        putchar('\n');
    }

    // Clean up
    if (munmap(map_base, PAGE_SIZE) == -1)
        perror("Error unmapping memory");
    close(fd);

    return EXIT_SUCCESS;
}
