#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/mman.h>
#include <string.h>
#include <errno.h>
#include <time.h>

#define REG_ADDRESS 0x80020100
#define PAGE_SIZE 4096
#define PAGE_MASK (~(PAGE_SIZE - 1))

int main() { int fd; void *map_base; volatile unsigned int *reg_addr;

    // Open /dev/mem
    fd = open("/dev/mem", O_RDONLY | O_SYNC); if (fd < 0) { perror("Error opening /dev/mem"); return EXIT_FAILURE;
    }

    // Map the memory
    map_base = mmap(NULL, PAGE_SIZE, PROT_READ, MAP_SHARED, fd, REG_ADDRESS & PAGE_MASK);
    if (map_base == MAP_FAILED) {
        perror("Error mapping memory");
        close(fd); return EXIT_FAILURE;
    }

    reg_addr = (volatile unsigned int *)((char *)map_base + (REG_ADDRESS & ~PAGE_MASK));

    int prev_data[64] = {0};
    int curr_data[64];
    float slats[64] = {0, 0, 11.1,11.2,38.1,38.2, 96.1, 96.2, 307.1, 307.2, 52.1, 52.2, //Btm
        102.1, 102.2, 124.2, 124.1, 48.2, 48.1, 75.2, 75.1, 109.2, 109.1, 123.2, 123.1, //Btm
        26.1,26.2,66.1,66.2,10.1,10.2,58.1,58.2,306.1,306.2,9.1,9.2,57.1,57.2, //Barrel
        79.1,79.2,116.1,116.2,13.1,13.2,76.1,76.2,17.1,17.2,125.1,125.2,0.0,0.0,//Barrel
        104.1,104.2,119.1,119.2,64.1,64.2,29.1,29.2,53.1,53.2,77.1,77.2}; //Barrel

    printf("\033[2J\033[H"); // Clear the screen
    while (1) {
        // Read current values
        for (int i = 0; i < 64; i++) {
            curr_data[i] = reg_addr[i];
        }
        printf("\033[H");
        // Print differences
        printf("Register diffs at time %ld:\n", time(NULL));
        for (int i = 1; i < 64; i++) {
            int diff = curr_data[i] - prev_data[i];
            printf("Slat[%5.1f]: Rate = %8.1f\t\t", slats[i], diff/5.0);
            if((i+1)%4 == 0) printf("\n\n");
            prev_data[i] = curr_data[i]; // Update for next iteration
        }

        fflush(stdout);
        sleep(5); // Wait 5 seconds
    }

    // Cleanup (unreachable, but good practice)
    munmap(map_base, PAGE_SIZE);
    close(fd);
    return EXIT_SUCCESS;
}
