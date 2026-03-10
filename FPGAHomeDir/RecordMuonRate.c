#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/mman.h>
#include <string.h>
#include <errno.h>
#include <time.h>

#define REG_ADDRESS 0x80020100
#define REG_ADDRESS1 0x80030100
#define PAGE_SIZE 4096
#define PAGE_MASK (~(PAGE_SIZE - 1))

int main() { 
	int fd; void *map_base; volatile unsigned int *reg_addr;
	void *map_base1; volatile unsigned int *reg_addr1;

	// File handling and timestamp additions
	FILE *outfile;
	char timestr[64];
	time_t now;
	struct tm *tm_info;

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
    // Map the memory
    map_base1 = mmap(NULL, PAGE_SIZE, PROT_READ, MAP_SHARED, fd, REG_ADDRESS1 & PAGE_MASK);
    if (map_base == MAP_FAILED) {
        perror("Error mapping memory");
        close(fd); return EXIT_FAILURE;
    }
    reg_addr1 = (volatile unsigned int *)((char *)map_base1 + (REG_ADDRESS1 & ~PAGE_MASK));


    int prev_data[132] = {0};
    int curr_data[132];
    float slats[132] = {0, 0, 11.1,11.2,38.1,38.2, 96.1, 96.2, 307.1, 307.2, 52.1, 52.2, //Btm
        102.1, 102.2, 124.2, 124.1, 48.2, 48.1, 75.2, 75.1, 109.2, 109.1, 123.2, 123.1, //Btm
        26.1,26.2,66.1,66.2,10.1,10.2,58.1,58.2,306.1,306.2,9.1,9.2,57.1,57.2, //Barrel
        79.1,79.2,116.1,116.2,13.1,13.2,76.1,76.2,17.1,17.2,125.1,125.2,0.0,0.0,//Barrel
        104.1,104.2,119.1,119.2,64.1,64.2,29.1,29.2,53.1,53.2,77.1,77.2, 37.1, 37.2, //Barrel
	70.1, 70.2, 28.1, 28.2, 0.1, 0.2, 25.1, 25.2, 301.1, 301.2, 304.1, 304.2, //Barrel
	22.1, 22.2, 4.1, 4.2, 12.1, 12.2, 99.1, 99.2, 56.1, 56.2, 122.1, 122.2, 55.1, //Barrel
	55.2, 83.1, 83.2, 97.1, 97.2, 84.1, 84.2, 305.1, 305.2, 2.1, 2.2, 45.1, 45.2//Barrel
	}; 

    printf("\033[2J\033[H"); // Clear the screen
    while (1) {
        // Read current values
        for (int i = 0; i < 132; i++) {
            if(i < 64) curr_data[i] = reg_addr[i];
	    else curr_data[i] = reg_addr1[i-64];
        }
	// Get formatted timestamp
	now = time(NULL);
	tm_info = localtime(&now);
	strftime(timestr, sizeof(timestr), "%Y-%m-%d %H:%M:%S", tm_info);

	// Open CSV file in append mode
	outfile = fopen("muon_rates.csv", "a");
	if (outfile == NULL) {
		perror("Error opening output file");
		break;
	}

        printf("\033[H");
        // Print differences and write to datafile
        printf("Register diffs at time %ld:\n", time(NULL));
        for (int i = 1; i < 132; i++) {
            int diff = curr_data[i] - prev_data[i];
            printf("Slat[%5.1f]: Rate = %8.1f\t\t", slats[i], diff/5.0);
            if((i+1)%4 == 0) printf("\n");

		// Write to file
		fprintf(outfile, "%s,%.1f,%.1f\n", timestr, slats[i], diff/5.0);
            prev_data[i] = curr_data[i]; // Update for next iteration
        }

	fclose(outfile);
        fflush(stdout);
        sleep(5); // Wait 5 seconds
    }

    // Cleanup (unreachable, but good practice)
    munmap(map_base, PAGE_SIZE);
    close(fd);
    return EXIT_SUCCESS;
}
