#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/mman.h>

#define REG_ADDRESS 0x80020100  // Address of the register
#define PAGE_SIZE   4096        // Page size for mmap
#define PAGE_MASK   (~(PAGE_SIZE - 1))

int main() {
        int fd;
        void *map_base;
        volatile unsigned int *reg_addr;
        // Open /dev/mem for reading
        fd = open("/dev/mem", O_RDONLY | O_SYNC);
        if (fd < 0) {
                perror("Error opening /dev/mem");
                return EXIT_FAILURE;
        }
        else printf("fd=%d.\n",fd);

        // Map the memory page containing the register
        map_base = mmap(NULL, PAGE_SIZE, PROT_READ, MAP_SHARED, fd, REG_ADDRESS & PAGE_MASK);
        if (map_base == MAP_FAILED) {
                perror("Error mapping memory");
                close(fd);
                return EXIT_FAILURE;
        }
        // Calculate the address within the mapped page
        reg_addr = (volatile unsigned int *)((char *)map_base + (REG_ADDRESS & ~PAGE_MASK));
	// Container for the values of the 22 slats.
        int data[22];
	// Loop through the addresses and put the data into data[].
        for(int i = 0; i<22;i++){
                data[i] = reg_addr[i];
                //printf("Register value at address 0x%X: 0x%X\n", REG_ADDRESS, *reg_addr);
        }
        // Clean up
        printf("(char *)map_base %s \n", map_base);
        if (munmap(map_base, PAGE_SIZE) == -1) {
                perror("Error unmapping memory");
        }
        close(fd);

        for(int j = 0; j<22;j++){
              printf("0x%X\n",data[j]);
        }
	return EXIT_SUCCESS;
}
