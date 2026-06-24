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

#include <thread>
#include <mutex>
#include <condition_variable>
#include <atomic>

#define REG0_ADDRESS   0x80020100  // reg_ro_out
#define REG1_ADDRESS   0x80030100  // reg_ro_out1
#define REG_RW_ADDRESS 0x80020000  // PS-written control bank; update if needed

#define PAGE_SIZE   4096
#define PAGE_MASK   (~(PAGE_SIZE - 1))

#define BANK_WORDS 32

#define WORDS_PER_SNAP 3
#define SNAP_PER_READ  20
#define SNAP_PER_PACKET 20

#define STATUS_COUNT_WORD 61
#define STATUS_SEQ_WORD   62

#define LOWER_55  ((UINT64_C(1) << 55) - 1)
#define SEEN_SIZE 80

typedef struct {
    uint64_t w0;
    uint64_t w1;
    uint64_t w2;
} muon_t;

typedef struct {
    uint64_t n_events;
    muon_t   events[SNAP_PER_PACKET];
} packet_t;

struct SharedQueue {
    packet_t packet;
    bool ready = false;
    bool done  = false;
    std::mutex mtx;
    std::condition_variable cv;
};

static volatile uint64_t *map_regs64(int fd, off_t addr, int prot, void **map_base_out) {
    off_t page_base   = addr & PAGE_MASK;
    off_t page_offset = addr & ~PAGE_MASK;

    void *map_base = mmap(NULL, PAGE_SIZE, prot, MAP_SHARED, fd, page_base);
    if (map_base == MAP_FAILED) {
        perror("mmap");
        *map_base_out = NULL;
        return NULL;
    }

    *map_base_out = map_base;
    return (volatile uint64_t *)((char *)map_base + page_offset);
}

static inline uint64_t read_word64(volatile uint64_t *reg0,
                                   volatile uint64_t *reg1,
                                   uint32_t word_index)
{
    if (word_index < BANK_WORDS) {
        return reg0[word_index];
    }

    return reg1[word_index - BANK_WORDS];
}

static inline uint32_t read_stack_count(volatile uint64_t *reg0,
                                        volatile uint64_t *reg1)
{
    uint64_t v = read_word64(reg0, reg1, STATUS_COUNT_WORD);
    uint32_t count = (uint32_t)(v & 0x1f);

    if (count > SNAP_PER_READ) {
        count = SNAP_PER_READ;
    }

    return count;
}

static inline uint32_t read_stack_seq(volatile uint64_t *reg0,
                                      volatile uint64_t *reg1)
{
    return (uint32_t)(read_word64(reg0, reg1, STATUS_SEQ_WORD) & 0xffffffffu);
}

static inline void send_ps_ack_toggle(volatile uint64_t *reg_rw) {
    static uint64_t ack_toggle = 0;

    ack_toggle ^= UINT64_C(1);
    reg_rw[0] = ack_toggle;
}

static int send_all(int sockfd, const void *data, size_t len) {
    uint16_t header[2] = {7, (uint16_t)len};

    ssize_t h = send(sockfd, &header, sizeof(header), 0);
    if (h != (ssize_t)sizeof(header)) {
        perror("send header");
        return 0;
    }

    size_t total = 0;
    while (total < len) {
        ssize_t n = send(sockfd, (const char*)data + total, len - total, 0);
        if (n == -1) {
            perror("send");
            return 0;
        }
        if (n == 0) {
            fprintf(stderr, "send returned 0\n");
            return 0;
        }

        total += (size_t)n;
    }

    return 1;
}

static inline int already_seen(uint64_t *seen, int seen_count, uint64_t val) {
    for (int j = 0; j < seen_count; j++) {
        uint64_t diff = (val > seen[j]) ? (val - seen[j]) : (seen[j] - val);
        if (diff < 20) {
            return 1;
        }
    }

    return 0;
}

void consumer_thread(int sockfd, SharedQueue &q) {
    while (true) {
        packet_t pkt_to_send;

        {
            std::unique_lock<std::mutex> lock(q.mtx);
            q.cv.wait(lock, [&]{ return q.ready || q.done; });

            if (q.done && !q.ready) {
                break;
            }

            pkt_to_send = q.packet;
            q.ready = false;
        }

        q.cv.notify_one();

        size_t payload_len =
            sizeof(pkt_to_send.n_events) +
            pkt_to_send.n_events * sizeof(muon_t);

        if (!send_all(sockfd, &pkt_to_send, payload_len)) {
            fprintf(stderr, "send_all failed, len=%zu\n", payload_len);
        } else {
            printf("Sent %zu bytes (%llu events)\n",
                   payload_len,
                   (unsigned long long)pkt_to_send.n_events);
        }
    }
}

void producer_thread(volatile uint64_t *reg0,
                     volatile uint64_t *reg1,
                     volatile uint64_t *reg_rw,
                     SharedQueue &q)
{
    uint64_t event_words[SNAP_PER_READ * WORDS_PER_SNAP];

    packet_t staging;
    memset(&staging, 0, sizeof(staging));
    int filled = 0;

    uint64_t seen[SEEN_SIZE] = {0};
    int seen_count = 0;
    int seen_head  = 0;

    struct timespec ts = {0, 1000};  // 1 us poll interval
    struct timespec last_send;
    clock_gettime(CLOCK_MONOTONIC, &last_send);

    printf("Looking for triggers\n");

    while (true) {
        uint32_t seq0;
        uint32_t seq1;
        uint32_t count;
        bool consumed_any_from_stack = false;

        do {
            seq0  = read_stack_seq(reg0, reg1);
            count = read_stack_count(reg0, reg1);

            uint32_t words_to_read = count * WORDS_PER_SNAP;

            for (uint32_t i = 0; i < words_to_read; ++i) {
                event_words[i] = read_word64(reg0, reg1, i);
            }

            seq1 = read_stack_seq(reg0, reg1);
        } while (seq0 != seq1);

        for (uint32_t i = 0; i < count && filled < SNAP_PER_PACKET; ++i) {
            uint64_t w0 = event_words[WORDS_PER_SNAP * i + 0];
            uint64_t w1 = event_words[WORDS_PER_SNAP * i + 1];
            uint64_t w2 = event_words[WORDS_PER_SNAP * i + 2];

            uint64_t counter = w0 & LOWER_55;

            if (counter != 0 && !already_seen(seen, seen_count, counter)) {
                printf("counter = %llu\n", (unsigned long long)counter);

                staging.events[filled].w0 = w0;
                staging.events[filled].w1 = w1;
                staging.events[filled].w2 = w2;
                ++filled;

                consumed_any_from_stack = true;

                seen[seen_head] = counter;
                seen_head = (seen_head + 1) % SEEN_SIZE;
                if (seen_count < SEEN_SIZE) {
                    seen_count++;
                }
            }
        }

        if (consumed_any_from_stack) {
            send_ps_ack_toggle(reg_rw);
        }

        struct timespec now;
        clock_gettime(CLOCK_MONOTONIC, &now);

        double elapsed =
            (now.tv_sec  - last_send.tv_sec) +
            (now.tv_nsec - last_send.tv_nsec) * 1e-9;

        bool should_send =
            (filled >= SNAP_PER_PACKET) ||
            (elapsed >= 0.1 && filled > 0);

        if (should_send) {
            staging.n_events = filled;

            {
                std::unique_lock<std::mutex> lock(q.mtx);
                q.cv.wait(lock, [&]{ return !q.ready; });

                q.packet = staging;
                q.ready = true;
            }

            q.cv.notify_one();

            memset(&staging, 0, sizeof(staging));
            filled = 0;
            clock_gettime(CLOCK_MONOTONIC, &last_send);
        }

        nanosleep(&ts, NULL);
    }
}

int main(void) {
    int fd = open("/dev/mem", O_RDWR | O_SYNC);
    if (fd < 0) {
        perror("open /dev/mem");
        return 1;
    }

    void *map0_base  = NULL;
    void *map1_base  = NULL;
    void *maprw_base = NULL;

    volatile uint64_t *reg0 = map_regs64(fd, REG0_ADDRESS, PROT_READ, &map0_base);
    if (!reg0) {
        close(fd);
        return 1;
    }

    volatile uint64_t *reg1 = map_regs64(fd, REG1_ADDRESS, PROT_READ, &map1_base);
    if (!reg1) {
        munmap(map0_base, PAGE_SIZE);
        close(fd);
        return 1;
    }

    volatile uint64_t *reg_rw =
        map_regs64(fd, REG_RW_ADDRESS, PROT_READ | PROT_WRITE, &maprw_base);
    if (!reg_rw) {
        munmap(map1_base, PAGE_SIZE);
        munmap(map0_base, PAGE_SIZE);
        close(fd);
        return 1;
    }

    printf("Connecting to 192.168.1.245:8765...\n");

    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    if (sockfd < 0) {
        perror("socket");
        munmap(maprw_base, PAGE_SIZE);
        munmap(map1_base, PAGE_SIZE);
        munmap(map0_base, PAGE_SIZE);
        close(fd);
        return 1;
    }

    struct sockaddr_in saddr = {};
    saddr.sin_family      = AF_INET;
    saddr.sin_addr.s_addr = inet_addr("192.168.1.245");
    saddr.sin_port        = htons(8765);

    if (connect(sockfd, (struct sockaddr*)&saddr, sizeof(saddr)) < 0) {
        perror("connect");
        close(sockfd);
        munmap(maprw_base, PAGE_SIZE);
        munmap(map1_base, PAGE_SIZE);
        munmap(map0_base, PAGE_SIZE);
        close(fd);
        return 1;
    }

    SharedQueue q;

    std::thread sender(consumer_thread, sockfd, std::ref(q));
    std::thread poller(producer_thread, reg0, reg1, reg_rw, std::ref(q));

    poller.join();

    {
        std::lock_guard<std::mutex> lock(q.mtx);
        q.done = true;
    }

    q.cv.notify_one();
    sender.join();

    close(sockfd);
    munmap(maprw_base, PAGE_SIZE);
    munmap(map1_base, PAGE_SIZE);
    munmap(map0_base, PAGE_SIZE);
    close(fd);

    return 0;
}
