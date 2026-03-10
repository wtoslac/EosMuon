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
#define BATCH_SIZE 20

typedef struct {
    uint64_t timestamp;
    uint64_t data[N_WORDS];
} muon_t;

static int send_all(int sockfd, const void *data, size_t len) {
	int total = 0;
	int bytesleft = len;
	int n;
	uint16_t header[2];
	header[0] = 7;  // Packet type
	header[1] = len;
	n = send(sockfd, &header, sizeof(header), 0);
	while(total < len) {
		n = send(sockfd, (char*)data+total, bytesleft, 0);
		if (n!= len) printf("Sent %i bytes of %zu at address: %p\n", n, len, (char*)data+total);
		if (n == -1) {
		  perror("Error: client: send");
		  break;
		}
		total += n;
		bytesleft -= n;
	}
	return (total == len);
}

int main() {
    
	printf("Attempting to connect to 172.16.0.26:8765...\n");
	int sockfd = socket(AF_INET, SOCK_STREAM, 0);
	struct sockaddr_in saddr;
	saddr.sin_family = AF_INET;
	saddr.sin_addr.s_addr = inet_addr("172.16.0.26");
	saddr.sin_port = htons(8765);
	int s = connect(sockfd, (struct sockaddr*) &saddr, sizeof(saddr));
	if (s < 0) {
		printf("Connection failed with error %i\n", s);
		perror("connect");
		close(sockfd);
		sleep(5);
	}
	
	struct timespec ts;
	clock_gettime(CLOCK_REALTIME, &ts);
	while (1) {
		muon_t packet[20] = {0};
		// fill fake data
		for(int i=0; i<BATCH_SIZE;i++){
			clock_gettime(CLOCK_REALTIME, &ts);
			uint64_t timestamp_ns = (uint64_t)ts.tv_sec * 1000000000ull + ts.tv_nsec;
			packet[i].timestamp = timestamp_ns; // ns;
			packet[i].data[0] = 0x111111111;
			packet[i].data[1] = 0x222222222;
			packet[i].data[2] = 0x333333333;
		}
		
		// print fake data
		for(int i=0; i<BATCH_SIZE;i++){
			printf("ts,data [0x%016" PRIx64 ",0x%016" PRIx64 ", 0x%016" PRIx64 ", 0x%016" PRIx64 "]\n",
				packet[i].timestamp, packet[i].data[0], packet[i].data[1], packet[i].data[2]);
			fflush(stdout);
		}
        printf("Sending %zu bytes of data...\n", sizeof(packet));

		if (send_all(sockfd, &packet, sizeof(packet)) != 0) {
            perror("send");
        } else {
            printf("Data sent successfully!\n");
        }
		
		sleep(5);
	}
    // Clean up socket for this iteration
	close(sockfd);
	//printf("Socket closed. Waiting 5 seconds...\n");
    return 0;
}
