#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/mman.h>
#include <string.h>
#include <errno.h>
#include <time.h>

#define REG_ADDRESS0 0x80020100
#define REG_ADDRESS1 0x80030100
#define REG_ADDRESS2 0x80040100
#define PAGE_SIZE 4096
#define PAGE_MASK (~(PAGE_SIZE - 1))

int main() { 
	int fd;
        void *map_base0; volatile unsigned int *reg_addr0;
	void *map_base1; volatile unsigned int *reg_addr1;
	void *map_base2; volatile unsigned int *reg_addr2;
    	// Open /dev/mem
    	fd = open("/dev/mem", O_RDONLY | O_SYNC); 
	if (fd < 0) { perror("Error opening /dev/mem"); 
	return EXIT_FAILURE;
 }

    // Map the memory
    map_base0 = mmap(NULL, PAGE_SIZE, PROT_READ, MAP_SHARED, fd, REG_ADDRESS0 & PAGE_MASK);
    if (map_base0 == MAP_FAILED) {
        perror("Error mapping memory");
        close(fd); return EXIT_FAILURE;
    }
    reg_addr0 = (volatile unsigned int *)((char *)map_base0 + (REG_ADDRESS0 & ~PAGE_MASK));
    
    // Map the memory
    map_base1 = mmap(NULL, PAGE_SIZE, PROT_READ, MAP_SHARED, fd, REG_ADDRESS1 & PAGE_MASK);
    if (map_base1 == MAP_FAILED) {
        perror("Error mapping memory 1");
        close(fd); return EXIT_FAILURE;
    }
    reg_addr1 = (volatile unsigned int *)((char *)map_base1 + (REG_ADDRESS1 & ~PAGE_MASK));

    // Map the memory
    map_base2 = mmap(NULL, PAGE_SIZE, PROT_READ, MAP_SHARED, fd, REG_ADDRESS2 & PAGE_MASK);
    if (map_base2 == MAP_FAILED) {
        perror("Error mapping memory 2");
        close(fd); return EXIT_FAILURE;
    }
    reg_addr2 = (volatile unsigned int *)((char *)map_base2 + (REG_ADDRESS2 & ~PAGE_MASK));



    int data[136];

    while (1) {
        // Read current values
        for (int i = 0; i < 136; i++) {
            if(i < 64) data[i] = reg_addr[i];
	    else if(i < 128) data[i] = reg_addr1[i-64];
	    else data[i] = reg_addr2[i-128];
        }
        sleep(5); // Wait 5 seconds
    }

    // Cleanup (unreachable, but good practice)
    munmap(map_base, PAGE_SIZE);
    close(fd);
    return EXIT_SUCCESS;
}
