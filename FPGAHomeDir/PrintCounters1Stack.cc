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
    
    uint64_t dataStack[30];
    for(int i=0;i<30;++i){
	dataStack[i] = reg64_addr[i];
    }

    for(int iEvt=0;iEvt<10;++iEvt){
        uint64_t iCounter = reg64_addr[iEvt*3] & 0x007FFFFFFFFFFFFF;
	printf("Event=%d , Counter = %llu\n", iEvt, iCounter);
    }
    // Cleanup
    munmap(map_base, PAGE_SIZE);
    close(fd);
    return 0;
}
