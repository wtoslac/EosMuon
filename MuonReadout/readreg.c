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
        printf("PAGE_MASK = %d \n",PAGE_MASK);
        printf("~PAGE_MASK = %d \n",~PAGE_MASK);
        printf("REG_ADDRESS & ~ PAGE_MASK = %d \n",(REG_ADDRESS & ~PAGE_MASK));
        reg_addr = (volatile unsigned int *)((char *)map_base + (REG_ADDRESS & ~PAGE_MASK));
        printf("reg_addr = 0x%x.\n",reg_addr);
        // Read the value from the register

        int data[40], data2[40];

        for(int i = 0; i<40;i++){
                data[i] = *reg_addr;
                data2[i] = *reg_addr;
                //printf("Register value at address 0x%X: 0x%X\n", REG_ADDRESS, *reg_addr);
        }
        // Clean up
        printf("(char *)map_base %s \n", map_base);

        if (munmap(map_base, PAGE_SIZE) == -1) {
                perror("Error unmapping memory");
        }
        close(fd);

        //for(int j = 0; j<40;j++){
        //      printf("0x%X\n",data[j]);
        //}
        printf("%d\n",data[0]);
        printf("%d\n",data2[0]);
        printf("%d\n",data[39]-data[0]);
        printf("%d\n",data2[39]-data2[0]);
        return EXIT_SUCCESS;
}
