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
#include <time.h>

// C++ threading
#include <thread>
#include <mutex>
#include <condition_variable>
#include <atomic>

#define REG_ADDRESS 0x80020100
#define PAGE_SIZE   4096
#define PAGE_MASK   (~(PAGE_SIZE - 1))
#define TOTAL_BITS  2048
#define TOTAL_BYTES (TOTAL_BITS / 8)   // 256 bytes
#define NWORDS      (TOTAL_BYTES / 8)  // 32 x uint64_t
#define SNAP_BITS   192
#define SNAP_BYTES  (SNAP_BITS / 8)    // 24 bytes
#define SNAP_PER_READ    10
#define SNAP_PER_PACKET  20

#define LOWER_55  ((UINT64_C(1) << 55) - 1)
#define SEEN_SIZE 40

typedef struct {
    uint64_t w0;
    uint64_t w1;
    uint64_t w2;
} muon_t;

typedef struct {
    uint64_t n_events;
    muon_t   events[SNAP_PER_PACKET];
} packet_t;

// Shared state between producer and consumer 
struct SharedQueue {
    packet_t        packet;          // the ready-to-send packet
    bool            ready = false;   // consumer: packet waiting?
    bool            done  = false;   // signal consumer to exit
    std::mutex      mtx;
    std::condition_variable cv;
};

// send_all
static int send_all(int sockfd, const void *data, size_t len) {
    uint16_t header[2] = {7, (uint16_t)len};
    send(sockfd, &header, sizeof(header), 0);

    size_t total = 0;
    while (total < len) {
        ssize_t n = send(sockfd, (const char*)data + total, len - total, 0);
        if (n == -1) { perror("send"); return 0; }
        if (n != (ssize_t)(len - total))
            printf("Partial send: %zd of %zu bytes\n", n, len - total);
        total += n;
    }
    return 1;
}

//  already_seen (counter diff < 20) �
static inline int already_seen(uint64_t *seen, int seen_count, uint64_t val) {
    for (int j = 0; j < seen_count; j++) {
        uint64_t diff = (val > seen[j]) ? (val - seen[j]) : (seen[j] - val);
        if (diff < 20) return 1;
    }
    return 0;
}

// Consumer thread: blocks until a packet is ready, then sends it 
void consumer_thread(int sockfd, SharedQueue &q) {
    while (true) {
        packet_t pkt_to_send;

        {
            std::unique_lock<std::mutex> lock(q.mtx);
            // Wait until there's a packet ready or we're told to stop
            q.cv.wait(lock, [&]{ return q.ready || q.done; });

            if (q.done && !q.ready)
                break;  // no more data, exit cleanly

            pkt_to_send = q.packet;  // copy out while holding the lock
            q.ready = false;
        }
        q.cv.notify_one();  // tell producer the slot is free

        // Send outside the lock — producer can keep polling freely
        size_t payload_len = sizeof(pkt_to_send);
        if (!send_all(sockfd, &pkt_to_send, payload_len))
            fprintf(stderr, "send_all failed (len=%zu)\n", payload_len);
        else
            printf("Sent %zu bytes (%llu events)\n",
                   payload_len, (unsigned long long)pkt_to_send.n_events);
    }
}

// Producer: polls FPGA, accumulates events, hands off to consumer 
void producer_thread(volatile uint64_t *reg64_addr, SharedQueue &q) {
    uint64_t data64[NWORDS];
    packet_t staging;          // fill this locally, no lock needed
    int filled = 0;

    uint64_t seen[SEEN_SIZE] = {0};
    int seen_count = 0;
    int seen_head  = 0;

    struct timespec ts = {0, 1000};  // 1 µs poll interval
    struct timespec last_send;
    clock_gettime(CLOCK_MONOTONIC, &last_send);

    printf("Looking for Triggers\n");

    while (true) {
        // Read 2048 bits from FPGA 
        for (int i = 0; i < NWORDS; ++i)
            data64[i] = reg64_addr[i];

        // Extract up to 10 events from the snapshot stack 
        for (int i = 0; i < SNAP_PER_READ && filled < SNAP_PER_PACKET; ++i) {
            uint64_t w0 = data64[3*i + 0];
            uint64_t w1 = data64[3*i + 1];
            uint64_t w2 = data64[3*i + 2];

	    uint64_t counter = w0 & LOWER_55;
	    if (counter != 0) {
		if (!already_seen(seen, seen_count, counter)) {
                    printf("counter = %llu\n", (unsigned long long)counter);
                    staging.events[filled].w0 = w0;
                    staging.events[filled].w1 = w1;
                    staging.events[filled].w2 = w2;
                    ++filled;

                    seen[seen_head] = counter;
                    seen_head = (seen_head + 1) % SEEN_SIZE;
                    if (seen_count < SEEN_SIZE) seen_count++;
                }
            }
        }

        // Decide whether to hand off to consumer 
        struct timespec now;
        clock_gettime(CLOCK_MONOTONIC, &now);
        double elapsed = (now.tv_sec  - last_send.tv_sec) +
                         (now.tv_nsec - last_send.tv_nsec) * 1e-9;

        bool should_send = (filled >= SNAP_PER_PACKET) ||
                           (elapsed >= 0.1 && filled > 0);

        if (should_send) {
            staging.n_events = filled;

            // ── Hand packet to consumer (wait if consumer is still busy) ──
            {
                std::unique_lock<std::mutex> lock(q.mtx);
                // Back-pressure: if consumer hasn't picked up the last packet
                // yet, wait briefly rather than overwriting it.
                q.cv.wait(lock, [&]{ return !q.ready; });
                q.packet = staging;  // copy into shared slot
                q.ready  = true;
            }
            q.cv.notify_one();  // wake consumer

            filled = 0;
            clock_gettime(CLOCK_MONOTONIC, &last_send);
        }

        nanosleep(&ts, NULL);
    }
}

int main(void) {
    // Map /dev/mem
    int fd = open("/dev/mem", O_RDONLY | O_SYNC);
    if (fd < 0) { perror("open /dev/mem"); return 1; }

    off_t page_base   = REG_ADDRESS & PAGE_MASK;
    off_t page_offset = REG_ADDRESS & ~PAGE_MASK;
    void *map_base = mmap(NULL, PAGE_SIZE, PROT_READ, MAP_SHARED, fd, page_base);
    if (map_base == MAP_FAILED) { perror("mmap"); close(fd); return 1; }

    volatile uint64_t *reg64_addr =
        (volatile uint64_t *)((char *)map_base + page_offset);

    // Connect TCP
    printf("Connecting to 192.168.1.245:8765...\n");
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    if (sockfd < 0) { perror("socket"); return 1; }

    struct sockaddr_in saddr = {};
    saddr.sin_family      = AF_INET;
    saddr.sin_addr.s_addr = inet_addr("192.168.1.245");
    saddr.sin_port        = htons(8765);

    if (connect(sockfd, (struct sockaddr*)&saddr, sizeof(saddr)) < 0) {
        perror("connect");
        close(sockfd); munmap(map_base, PAGE_SIZE); close(fd);
        return 1;
    }

    //Launch threads
    SharedQueue q;

    std::thread sender(consumer_thread, sockfd, std::ref(q));
    std::thread poller(producer_thread, reg64_addr, std::ref(q));

    // Both threads run indefinitely; join on Ctrl-C or add signal handling
    poller.join();

    {
        std::lock_guard<std::mutex> lock(q.mtx);
        q.done = true;
    }
    q.cv.notify_one();
    sender.join();

    // Cleanup
    close(sockfd);
    munmap(map_base, PAGE_SIZE);
    close(fd);
    return 0;
}
