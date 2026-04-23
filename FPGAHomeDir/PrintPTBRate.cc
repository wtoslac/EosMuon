#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>

#define REG_ADDRESS 0x80020100
#define PAGE_SIZE   4096
#define PAGE_MASK   (~(PAGE_SIZE - 1))

//typedef struct {
//   uint64_t data[3];
//}muon_t;

int main(int argc, char **argv) {
    // Map reg_ro_out
    int fd = open("/dev/mem", O_RDONLY | O_SYNC);
    if (fd < 0) { perror("open /dev/mem"); return 1; }

    off_t page_base   = REG_ADDRESS & PAGE_MASK;
    off_t page_offset = REG_ADDRESS & ~PAGE_MASK;
    void *map_base = mmap(NULL, PAGE_SIZE, PROT_READ, MAP_SHARED, fd, page_base);
    if (map_base == MAP_FAILED) { perror("mmap"); close(fd); return 1; }

    volatile uint64_t *reg64_addr =
        (volatile uint64_t *)((char *)map_base + page_offset);
    
    uint64_t packet[10][3];
    packet[0][0] = reg64_addr[0];
    packet[0][1] = reg64_addr[1];    
    packet[0][2] = reg64_addr[2];

    uint64_t prevCounter = packet[0][0] & 0x007FFFFFFFFFFFFF;
    uint64_t startCounter = prevCounter;
    uint64_t lastCounter=0;
    int iEvt = 1;
    while(iEvt < 10) {
        uint64_t iCounter = reg64_addr[iEvt*3] & 0x007FFFFFFFFFFFFF;
	if(iCounter != prevCounter){
	    prevCounter = iCounter;
	    packet[iEvt][0] = reg64_addr[iEvt*3+0];
            packet[iEvt][1] = reg64_addr[iEvt*3+1];
            packet[iEvt][2] = reg64_addr[iEvt*3+2];
	   // printf("iEvt = %d, iCounter = %llu\n",iEvt,iCounter);
	    iEvt++;
	    if(iEvt == 10) lastCounter = iCounter;
	}
    }
    printf("lastCounter= %llu\nstartCounter= %llu\n",lastCounter,startCounter);
    printf("Diff = %llu\n", lastCounter-startCounter);
    // Cleanup
    munmap(map_base, PAGE_SIZE);
    close(fd);
    return 0;
}
