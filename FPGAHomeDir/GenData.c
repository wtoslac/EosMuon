// Program to generate muon data packets for testing only.
// Tested to compile on eos-mu: gcc GenData.c -o GenData
// wto@csustan.edu, 20250912.
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

int main(void) {
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
		// print for testing
		printf("ts,data [0x%016" PRIx64 ",0x%016" PRIx64 ", 0x%016" PRIx64 ", 0x%016" PRIx64 "]\n",
				packet.timestamp, packet.data[0], packet.data[1], packet.data[2]);
		fflush(stdout);
		sleep(5);
	}
	return 0;
}
