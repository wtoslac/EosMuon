#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/mman.h>
#include <stdint.h>
#include <time.h>

#define REG_ADDRESS  0x80020100
#define REG_ADDRESS1 0x80030100
#define PAGE_SIZE 4096
#define PAGE_MASK (~(PAGE_SIZE - 1))

#define NREG 132
#define NREG0 64

// REPLACE THIS with your CURRENT slats_code_mem[] (index = FPGA register index)
static const int slats_code_mem[132] = {
    0, 0,
    111, 112, 381, 382, 961, 962, 3071, 3072, 521, 522,
    1021, 1022, 1242, 1241, 482, 481, 752, 751, 1092, 1091, 1232, 1231,
    261, 262, 661, 662, 101, 102, 581, 582, 3061, 3062, 91, 92, 571, 572,
    791, 792, 1161, 1162, 131, 132, 761, 762, 171, 172, 1251, 1252, 3031, 612,
    1041, 1042,
    882, 611, 881, 3032, 3001, 3002, 801, 802, 1032, 1031,
    371, 372,
    701, 702, 281, 282, 541, 542, 251, 252, 3011, 3012, 3041, 3042,
    221, 222, 41, 42, 121, 122, 991, 992, 561, 562, 1221, 1222, 551,
    552, 831, 832, 971, 972, 841, 842, 3051, 3052, 21, 22, 451, 452,
    781, 782,
    341, 342, 741, 902, 742, 901, 471, 1672, 472, 1671, 1151, 462,
    1152, 461, 3021, 3022, 621, 622, 441, 442, 302, 301
};

static inline uint32_t read_reg(volatile uint32_t *reg0, volatile uint32_t *reg1, int idx) {
    if (idx < NREG0) return reg0[idx];
    return reg1[idx - NREG0];
}

static inline uint32_t addr_for_index(int idx) {
    if (idx < NREG0) return (uint32_t)(REG_ADDRESS + 4U * (uint32_t)idx);
    return (uint32_t)(REG_ADDRESS1 + 4U * (uint32_t)(idx - NREG0));
}

static void code_to_label(int code, char *out, size_t out_sz) {
    if (code == 0) {
        snprintf(out, out_sz, "UNMAPPED");
        return;
    }
    int paddle = code / 10;
    int slat = code % 10;
    snprintf(out, out_sz, "%d.%d", paddle, slat);
}

int main(int argc, char **argv) {
    int sleep_s = 1;          // seconds between polls
    uint32_t min_delta = 1;   // only print if delta >= this

    if (argc >= 2) sleep_s = atoi(argv[1]);
    if (argc >= 3) min_delta = (uint32_t)atoi(argv[2]);
    if (sleep_s <= 0) sleep_s = 1;

    int fd = open("/dev/mem", O_RDONLY | O_SYNC);
    if (fd < 0) { perror("open /dev/mem"); return 1; }

    void *map0 = mmap(NULL, PAGE_SIZE, PROT_READ, MAP_SHARED, fd, REG_ADDRESS & PAGE_MASK);
    if (map0 == MAP_FAILED) { perror("mmap REG_ADDRESS"); close(fd); return 1; }

    void *map1 = mmap(NULL, PAGE_SIZE, PROT_READ, MAP_SHARED, fd, REG_ADDRESS1 & PAGE_MASK);
    if (map1 == MAP_FAILED) { perror("mmap REG_ADDRESS1"); munmap(map0, PAGE_SIZE); close(fd); return 1; }

    // IMPORTANT: add the register offset within the page (0x100)
    volatile uint32_t *reg0 = (volatile uint32_t *)((char *)map0 + (REG_ADDRESS & ~PAGE_MASK));
    volatile uint32_t *reg1 = (volatile uint32_t *)((char *)map1 + (REG_ADDRESS1 & ~PAGE_MASK));

    uint32_t prev[NREG];
    uint32_t curr[NREG];

    // Prime baseline twice to avoid startup garbage
    for (int i = 0; i < NREG; i++) prev[i] = read_reg(reg0, reg1, i);
    sleep(1);
    for (int i = 0; i < NREG; i++) prev[i] = read_reg(reg0, reg1, i);

    printf("Watching active counters every %d s (min_delta=%u). Ctrl-C to stop.\n", sleep_s, (unsigned)min_delta);

    while (1) {
        sleep(sleep_s);

        // Read all
        for (int i = 0; i < NREG; i++) curr[i] = read_reg(reg0, reg1, i);

        time_t t = time(NULL);
        int printed_any = 0;

        for (int i = 0; i < NREG; i++) {
            if (slats_code_mem[i] == 0) {  // skip unmapped
                prev[i] = curr[i];
                continue;
            }

            uint32_t delta = curr[i] - prev[i]; // unsigned handles wrap
            if (delta >= min_delta) {
                char lbl[32];
                code_to_label(slats_code_mem[i], lbl, sizeof(lbl));

                printf("%ld  idx=%3d  addr=0x%08X  slat=%-7s  d=%6u  val=%u\n",
                       (long)t, i, addr_for_index(i), lbl, (unsigned)delta, (unsigned)curr[i]);
                printed_any = 1;
            }

            prev[i] = curr[i];
        }

        if (printed_any) fflush(stdout);
    }

    return 0;
}
