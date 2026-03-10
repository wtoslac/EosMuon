#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/mman.h>
#include <stdint.h>
#include <string.h>
#include <time.h>

#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>

#define REG_ADDRESS 0x80020100
#define PAGE_SIZE   4096
#define PAGE_MASK   (~(PAGE_SIZE - 1))
#define NWORDS      3
#define COUNTER_MASK ((1ULL << 55) - 1)

// === send_all ===
static int send_all(int sockfd, const void *data, size_t len) {
    int total = 0;
    int bytesleft = len;
    int n;
    uint16_t header[2];
    header[0] = 7;
    header[1] = len;
    n = send(sockfd, &header, sizeof(header), 0);
    while (total < len) {
        n = send(sockfd, (char*)data + total, bytesleft, 0);
        if (n != len)
            printf("Sent %i bytes of %zu at address: %p\n", n, len, (char*)data + total);
        if (n == -1) {
            perror("Error: client: send");
            break;
        }
        total += n;
        bytesleft -= n;
    }
    return (total == len);
}


int main(void) {
    
    // Prepare to copy FPGA Registers to Muon Packet[iEvents]
    int fd = open("/dev/mem", O_RDONLY);
    if (fd < 0) { perror("open"); return 1; }

    off_t page_base   = REG_ADDRESS & PAGE_MASK;
    off_t page_offset = REG_ADDRESS & ~PAGE_MASK;

    void *map_base = mmap(NULL, PAGE_SIZE, PROT_READ, MAP_SHARED, fd, page_base);
    if (map_base == MAP_FAILED) { perror("mmap"); close(fd); return 1; }

    volatile uint64_t *reg64_addr =
        (volatile uint64_t *)((char *)map_base + page_offset);
    uint64_t packet[60]; 

    // Connect TCP
    printf("Connecting to 192.168.1.245:8765...\n");
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    if (sockfd < 0) { perror("socket"); return 1; }
    struct sockaddr_in saddr;
    memset(&saddr, 0, sizeof(saddr));
    saddr.sin_family = AF_INET;
    saddr.sin_addr.s_addr = inet_addr("192.168.1.245");
    saddr.sin_port = htons(8765);
    if (connect(sockfd, (struct sockaddr*) &saddr, sizeof(saddr)) < 0) {
        perror("connect");
        // You can choose to exit or keep trying; here we exit for clarity.
        close(sockfd);
        munmap(map_base, PAGE_SIZE);
        close(fd);
        return 1;
    }

    uint64_t LastCounter= ~0ULL; // set the counter to zero.
    int iEvent=0;
    while(1){
        uint64_t Counter  = reg64_addr[0] & COUNTER_MASK;
	if(Counter == LastCounter) continue;
        else{            
            LastCounter = Counter;
            iEvent++;
            packet[iEvent] = reg64_addr[0];
	    packet[iEvent+1] = reg64_addr[1];
            packet[iEvent+2] = reg64_addr[2];
            printf("Event[%2d]: %016llx %016llx %016llx\n",iEvent,
	    	(unsigned long long)packet[iEvent + 0],
              (unsigned long long)packet[iEvent + 1],
              (unsigned long long)packet[iEvent + 2]);
            if(iEvent == 20){
		iEvent = 0;
		size_t payload_len = sizeof(packet);
		printf("Sending Packet of 20\n");
		send_all(sockfd, &packet, payload_len);
            }
        }
    }
    munmap(map_base, PAGE_SIZE);
    close(fd);
    return 0;
}
