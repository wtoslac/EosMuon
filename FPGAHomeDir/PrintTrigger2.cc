#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/mman.h>
#include <stdint.h>

#define REG_ADDRESS 0x80020100
#define PAGE_SIZE   4096
#define PAGE_MASK   (~(PAGE_SIZE - 1))

#define TOTAL_BITS   2048
#define TOTAL_BYTES  (TOTAL_BITS / 8)      // 256
#define WORDS32      (TOTAL_BYTES / 4)     // 64 x 32-bit
#define SNAP_BITS    192
#define SNAP_COUNT   10
#define POLL_US      100000                // 10 Hz

static inline uint32_t rd32(volatile uint32_t *p, int idx) {
    return p[idx];
}

static uint8_t get_bit_modeA(uint32_t *w32, int bit_index) {
    // LSB-first across the 2048-bit space, 32-bit lanes in natural order
    int word = bit_index / 32;
    int bit  = bit_index % 32;
    return (w32[word] >> bit) & 1u;
}

static uint8_t get_bit_modeB(uint32_t *w32, int bit_index) {
    // MSB-first across the 2048-bit space: global bit 0 is MSB of word 63
    // Convert to LSB-first index to read from 32-bit array.
    int msb_first_idx = bit_index;                 // 0..2047 (MSB-first)
    int lsb_idx = (TOTAL_BITS - 1) - msb_first_idx;
    int word = lsb_idx / 32;
    int bit  = lsb_idx % 32;
    return (w32[word] >> bit) & 1u;
}

int main(void) {
    int fd = open("/dev/mem", O_RDONLY | O_SYNC);
    if (fd < 0) { perror("open"); return 1; }

    off_t page_base   = REG_ADDRESS & PAGE_MASK;
    off_t page_offset = REG_ADDRESS & ~PAGE_MASK;
    void *map = mmap(NULL, PAGE_SIZE, PROT_READ, MAP_SHARED, fd, page_base);
    if (map == MAP_FAILED) { perror("mmap"); close(fd); return 1; }

    volatile uint32_t *reg32 = (volatile uint32_t *)((char*)map + page_offset);

    printf("Trigger bits (A=LSB-first/32-lane, B=MSB-first). 10 Hz:\n");
    while (1) {
        uint32_t data32[WORDS32];
        for (int i = 0; i < WORDS32; i++) data32[i] = rd32(reg32, i);

        // Mode A: assume frame 0 starts at bit 0, trigger at 55 + i*192
        printf("A[");
        for (int i = 0; i < SNAP_COUNT; i++) {
            int idx = 55 + i * SNAP_BITS;
            printf("%u%s", get_bit_modeA(data32, idx), (i+1<10) ? " " : "");
        }
        printf("]  ");

        // Mode B: assume stack is packed from MSB downward; same per-frame offset,
        // but measured from the MSB end of the 2048-bit register space.
        // The bit position of frame i’s trigger in MSB-first counting is:
        // base_of_frame_i = i*SNAP_BITS (from MSB side)
        // trigger offset within frame = (SNAP_BITS-1 - 55)
        // global (MSB-first) index = base + (SNAP_BITS-1 - 55)
        printf("B[");
        for (int i = 0; i < SNAP_COUNT; i++) {
            int msb_side_idx = i*SNAP_BITS + (SNAP_BITS - 1 - 55);
            printf("%u%s", get_bit_modeB(data32, msb_side_idx), (i+1<10) ? " " : "");
        }
        printf("]\n");
        fflush(stdout);

        usleep(POLL_US);
    }

    munmap(map, PAGE_SIZE);
    close(fd);
    return 0;
}
