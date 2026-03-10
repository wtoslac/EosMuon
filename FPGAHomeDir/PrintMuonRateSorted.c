#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/mman.h>
#include <errno.h>
#include <time.h>

#define REG_ADDRESS  0x80020100
#define REG_ADDRESS1 0x80030100
#define PAGE_SIZE 4096
#define PAGE_MASK (~(PAGE_SIZE - 1))

#define NREG 132
#define NREG0 64

// Memory-order label map (built from your current verilog + spreadsheet-derived map):
// Each entry is "paddle*10 + slat" (e.g. 11.1 -> 111). 0 means unused/unmapped.
static const int slats_code_mem[132] = {
    10, 0,
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


// Display order arrays (spreadsheet row order) by section.
// Same code format: paddle*10 + slat.

static const int top_codes[] = {
    1031, 1032, 3001, 3002, 801, 802, 3031, 3032, 881, 882, 301, 302, 341, 342,
    741, 742, 471, 472, 1151, 1152, 461, 462, 1671, 1672, 901, 902, 3021, 3022,
    621, 622, 441, 442, 611, 612, 10, 0, 0
};

static const int barrel_codes[] = {
    261, 262, 661, 662, 101, 102, 581, 582, 3061, 3062, 91, 92, 571, 572,
    791, 792, 1161, 1162, 131, 132, 761, 762, 171, 172, 1251, 1252, 
    1041, 1042, 371, 372, 701, 702, 281, 282, 541, 542, 251, 252, 3011, 3012,
    3041, 3042, 221, 222, 41, 42, 121, 122, 991, 992, 561, 562, 1221, 1222,
    551, 552, 831, 832, 971, 972, 841, 842, 3051, 3052, 21, 22, 451, 452,
    771, 772
};

static const int bottom_codes[] = {
    111, 112, 381, 382, 961, 962, 3071, 3072, 521, 522, 1021, 1022, 1242, 1241,
    482, 481, 752, 751, 1092, 1091, 1232, 1231
};

static int find_index_for_code(int code) {
    for (int i = 0; i < (int)(sizeof(slats_code_mem)/sizeof(slats_code_mem[0])); i++) {
        if (slats_code_mem[i] == code) return i;
    }
    return -1;
}

static void print_section(const char *title, const int *codes, int n_codes,
                          const int *diffs, double dt_s, int cols) {
    printf("\n%s\n", title);
    for (int i = 0; i < 60; i++) putchar('-');
    putchar('\n');

    for (int i = 0; i < n_codes; i++) {
        int code = codes[i];
        if (code == 0) continue; // skip any placeholder zeros
        int idx = find_index_for_code(code);
        int paddle = code / 10;
        int slat = code % 10;

        if (idx < 0) {
            printf("Slat[%3d.%d]: Rate = %8s\t\t", paddle, slat, "N/A");
        } else {
            double rate = (dt_s > 0.0) ? ((double)diffs[idx] / dt_s) : 0.0;
            printf("Slat[%3d.%d]: Rate = %8.1f\t\t", paddle, slat, rate);
        }

        if ((i + 1) % cols == 0) printf("\n");
    }
    if (n_codes % cols != 0) printf("\n");
}

static double now_monotonic_s(void) {
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return (double)ts.tv_sec + 1e-9 * (double)ts.tv_nsec;
}

int main(void) {
    int fd;
    void *map_base0, *map_base1;
    volatile unsigned int *reg0, *reg1;

    fd = open("/dev/mem", O_RDONLY | O_SYNC);
    if (fd < 0) {
        perror("Error opening /dev/mem");
        return EXIT_FAILURE;
    }

    map_base0 = mmap(NULL, PAGE_SIZE, PROT_READ, MAP_SHARED, fd, REG_ADDRESS & PAGE_MASK);
    if (map_base0 == MAP_FAILED) {
        perror("Error mapping REG_ADDRESS");
        close(fd);
        return EXIT_FAILURE;
    }

    map_base1 = mmap(NULL, PAGE_SIZE, PROT_READ, MAP_SHARED, fd, REG_ADDRESS1 & PAGE_MASK);
    if (map_base1 == MAP_FAILED) {
        perror("Error mapping REG_ADDRESS1");
        munmap(map_base0, PAGE_SIZE);
        close(fd);
        return EXIT_FAILURE;
    }

    reg0 = (volatile unsigned int *)((char *)map_base0 + (REG_ADDRESS & ~PAGE_MASK));
    reg1 = (volatile unsigned int *)((char *)map_base1 + (REG_ADDRESS1 & ~PAGE_MASK));

    int prev[NREG] = {0};
    int curr[NREG] = {0};
    int diffs[NREG] = {0};

    // Prime to avoid first-print garbage: read, sleep(1), read again as baseline.
    for (int i = 0; i < NREG; i++) {
        if (i < NREG0) prev[i] = (int)reg0[i];
        else prev[i] = (int)reg1[i - NREG0];
    }
    sleep(1);
    for (int i = 0; i < NREG; i++) {
        if (i < NREG0) prev[i] = (int)reg0[i];
        else prev[i] = (int)reg1[i - NREG0];
    }

    double t_prev = now_monotonic_s();

    printf("\033[2J\033[H"); // clear screen once

    while (1) {
        double t_now = now_monotonic_s();
        double dt_s = t_now - t_prev;
        if (dt_s <= 0.0) dt_s = 1.0;

        for (int i = 0; i < NREG; i++) {
            if (i < NREG0) curr[i] = (int)reg0[i];
            else curr[i] = (int)reg1[i - NREG0];
        }

        for (int i = 0; i < NREG; i++) {
            diffs[i] = curr[i] - prev[i];
            prev[i] = curr[i];
        }

        printf("\033[H\033[J");
        printf("Muon rates (spreadsheet order). Time %ld. Update dt = %.3f s (%.3f Hz)\n",
               time(NULL), dt_s, (dt_s > 0.0) ? (1.0 / dt_s) : 0.0);

        print_section("TOP", top_codes, (int)(sizeof(top_codes)/sizeof(top_codes[0])),
                      diffs, dt_s, 4);

        print_section("BARREL", barrel_codes, (int)(sizeof(barrel_codes)/sizeof(barrel_codes[0])),
                      diffs, dt_s, 4);

        print_section("BOTTOM", bottom_codes, (int)(sizeof(bottom_codes)/sizeof(bottom_codes[0])),
                      diffs, dt_s, 4);

        fflush(stdout);

        t_prev = t_now;
        sleep(5);
    }

    // Unreachable
    munmap(map_base0, PAGE_SIZE);
    munmap(map_base1, PAGE_SIZE);
    close(fd);
    return EXIT_SUCCESS;
}
