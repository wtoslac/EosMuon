#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/mman.h>
#include <stdint.h>

#define REG_ADDRESS 0x80020100   // Base address of reg_ro_out
#define PAGE_SIZE   4096
#define PAGE_MASK   (~(PAGE_SIZE - 1))

int main() {
    int fd;
    void *map_base;
    volatile uint64_t *reg64_addr;

    // Open /dev/mem
    fd = open("/dev/mem", O_RDONLY | O_SYNC);
    if (fd < 0) {
        perror("Error opening /dev/mem");
        return EXIT_FAILURE;
    }

    // Map page containing the register
    off_t page_base   = REG_ADDRESS & PAGE_MASK;
    off_t page_offset = REG_ADDRESS & ~PAGE_MASK;
    map_base = mmap(NULL, PAGE_SIZE, PROT_READ, MAP_SHARED, fd, page_base);
    if (map_base == MAP_FAILED) {
        perror("Error mapping memory");
        close(fd);
        return EXIT_FAILURE;
    }

    // Cast to 64-bit pointer (must be 8-byte aligned!)
    reg64_addr = (volatile uint64_t *)((char *)map_base + page_offset);

    // Read the first 64-bit word
    uint64_t word0 = reg64_addr[0];

    // Mask to 55 bits for MuonCounter
    uint64_t muon_counter = word0 & ((1ULL << 55) - 1ULL);
    uint8_t ptb_trig	= (word0 >> 55) & 0x1;

    printf("MuonCounter (55 bits): 0x%013lX (%lu)\n",
           muon_counter, muon_counter);
    printf("PTBTrig: %u\n",ptb_trig);

    // Clean up
    if (munmap(map_base, PAGE_SIZE) == -1) {
        perror("Error unmapping memory");
    }
    close(fd);

    return EXIT_SUCCESS;
}
