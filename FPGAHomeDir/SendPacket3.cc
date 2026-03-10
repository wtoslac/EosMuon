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
#define TIMEOUT 3

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

static inline double seconds_since(struct timespec a, struct timespec b) {
    // returns a - b in seconds
    return (double)(a.tv_sec - b.tv_sec) +
           (double)(a.tv_nsec - b.tv_nsec) / 1e9;
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
    uint64_t packet[60] ={0}; 

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
    bool SkipFirst = true;
	
	
    struct timespec last_change, now;
	// Get the OS time in nanoseconds
    clock_gettime(CLOCK_MONOTONIC, &last_change);
	
    while(1){
		usleep(1000);
		uint64_t Counter  = reg64_addr[0] & COUNTER_MASK;
		if(Counter == LastCounter) continue;
		LastCounter = Counter;
		// Check the time now
		clock_gettime(CLOCK_MONOTONIC, &now);

		// Skip the first event seen after program start
		if (SkipFirst) {
		    SkipFirst = false;
		    continue;
		}            
		packet[iEvent*3  ] = reg64_addr[0];
		packet[iEvent*3+1] = reg64_addr[1];
		packet[iEvent*3+2] = reg64_addr[2];
		// DEBUG MESSAGES
		printf("Event[%2d]: %016llx %016llx %016llx\n",iEvent,
					(unsigned long long)packet[iEvent*3  ],
					(unsigned long long)packet[iEvent*3+1],
					(unsigned long long)packet[iEvent*3+2]);
		iEvent++;
		if(iEvent == 20){
			// DEBUG MESSAGES
			printf("Sending Packet of 20\n");
			size_t payload_len = sizeof(packet);
			send_all(sockfd, &packet, payload_len);
			iEvent = 0;
		}
		else if (seconds_since(now, last_change) >= TIMEOUT) {
			// DEBUG MESSAGES
			printf("TIMEOUT Sending event(s).\n",iEvent);
			for(;iEvent<20;++iEvent){
				packet[iEvent*3] = 0;
				packet[iEvent*3+1] = 0;
				packet[iEvent*3+2] = 0;
			}
			size_t payload_len = sizeof(packet);
			send_all(sockfd, &packet[0], payload_len);
			iEvent = 0;
			last_change = now;
		}
    }
    munmap(map_base, PAGE_SIZE);
    close(fd);
    return 0;
}
