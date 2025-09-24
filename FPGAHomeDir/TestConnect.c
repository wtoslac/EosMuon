#include <sys/types.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <netinet/in.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <pthread.h>
#include <stdio.h>
#include <stdint.h>
#include <time.h>
#include <inttypes.h>
#include <unistd.h>
#include <stdlib.h>
#define N_BITS 136
#define N_WORDS 3

typedef struct {
    uint64_t timestamp;
    uint64_t data[N_WORDS];
} muon_t;

// 64-bit host<->network byte order helpers
static inline uint64_t htonll(uint64_t x) {
#if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
    return ((uint64_t)htonl((uint32_t)(x >> 32))) |
           ((uint64_t)htonl((uint32_t)(x & 0xFFFFFFFF)) << 32);
#else
    return x;
#endif
}
static inline uint64_t ntohll(uint64_t x) { return htonll(x); }

// Ensure we send all bytes, even if send() returns a partial count
static int send_all(int fd, const void *buf, size_t len) {
    const uint8_t *p = (const uint8_t *)buf;
    size_t total = 0;
    while (total < len) {
        ssize_t n = send(fd, p + total, len - total, 0);
        if (n < 0) return -1;          // error
        if (n == 0) break;             // peer closed
        total += (size_t)n;
    }
    return (total == len) ? 0 : -1;
}

int main() {
    
	// Seed PRNG with nanoseconds
	struct timespec ts;
	clock_gettime(CLOCK_REALTIME, &ts);
	srand((unsigned)(ts.tv_nsec ^ ts.tv_sec));
	while (1) {
		clock_gettime(CLOCK_REALTIME, &ts);
		uint64_t ns = (uint64_t)ts.tv_sec * 1000000000ull + ts.tv_nsec;
		//printf("timestamp: %" PRIu64 "\n", ns);
		
		// fill fake data
		muon_t packet = {0};
		packet.timestamp = ns;

		// generate 136 random bits into m.data[0..2], LSB-first
		for (int i = 0; i < N_BITS; i++) {
			int word = i / 64;
			int offset = i % 64;
			uint64_t bit = (uint64_t)(rand() & 1);
			packet.data[word] |= (bit << offset);
		}
		// uncomment to print for testing
		//printf("ts,data [0x%016" PRIx64 ",0x%016" PRIx64 ", 0x%016" PRIx64 ", 0x%016" PRIx64 "]\n",
		//		packet.timestamp, packet.data[0], packet.data[1], packet.data[2]);
		//fflush(stdout);
		
		int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    	struct sockaddr_in saddr;
    	saddr.sin_family = AF_INET;
    	saddr.sin_addr.s_addr = inet_addr("192.168.1.144");
    	saddr.sin_port = htons(5000);
    	int s = connect(sockfd, (struct sockaddr*) &saddr, sizeof(saddr));
    	if (s < 0) {
        	printf("oh no an error %i\n", s);
        	pthread_exit(NULL);
    	}
		 // --- serialize to network byte order and send ---
        // Layout: [timestamp][data0][data1][data2] (4 x uint64_t = 32 bytes)
        uint64_t netbuf[1 + N_WORDS];
        netbuf[0] = htonll(packet.timestamp);
        for (int i = 0; i < N_WORDS; i++) {
            netbuf[1 + i] = htonll(packet.data[i]);
        }

        if (send_all(sockfd, netbuf, sizeof(netbuf)) != 0) {
            perror("send");
        } 
        // Clean up socket for this iteration
        close(sockfd);
		
		
		sleep(5);
	}
    return 0;
}

