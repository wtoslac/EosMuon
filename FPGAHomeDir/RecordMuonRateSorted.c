#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/mman.h>
#include <errno.h>
#include <time.h>
#include <signal.h>
#include <string.h>
#include <sys/stat.h>

#define REG_ADDRESS  0x80020100
#define REG_ADDRESS1 0x80030100
#define PAGE_SIZE 4096
#define PAGE_MASK (~(PAGE_SIZE - 1))

#define NREG 132
#define NREG0 64

/* Memory-order label map (built from your current verilog + spreadsheet-derived map):
   Each entry is "paddle*10 + slat" (e.g. 11.1 -> 111). 0 means unused/unmapped. */
static const int slats_code_mem[NREG] = {
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

/* Display order arrays (spreadsheet row order) by section. Same code format: paddle*10 + slat. */
static const int top_codes[] = {
    1031, 1032, 3001, 3002, 801, 802, 3031, 3032, 881, 882, 301, 302, 341, 342,
    741, 742, 471, 472, 1151, 1152, 461, 462, 1671, 1672, 901, 902, 3021, 3022,
    621, 622, 441, 442, 611, 612, 0, 0, 0
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

static volatile sig_atomic_t g_stop = 0;

static void handle_sigint(int sig) {
    (void)sig;
    g_stop = 1;
}

static int find_index_for_code(int code) {
    int i;
    for (i = 0; i < NREG; i++) {
        if (slats_code_mem[i] == code) return i;
    }
    return -1;
}

static double now_monotonic_s(void) {
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return (double)ts.tv_sec + 1e-9 * (double)ts.tv_nsec;
}

static int file_is_empty(const char *path) {
    struct stat st;
    if (stat(path, &st) != 0) return 1; /* treat missing as empty */
    return (st.st_size == 0);
}

static void write_section_csv(FILE *fp,
                              const char *section,
                              const int *codes, int n_codes,
                              const int *diffs,
                              double dt_s,
                              const char *timestr,
                              long epoch_s) {
    int i;
    for (i = 0; i < n_codes; i++) {
        int code = codes[i];
        if (code == 0) continue;

        int idx = find_index_for_code(code);
        int paddle = code / 10;
        int slat = code % 10;

        if (idx < 0) {
            /* unmapped in memory map: still record a placeholder row */
            fprintf(fp, "%ld,%s,%.6f,%s,%d,%d,%d,%d,%.6f\n",
                    epoch_s, timestr, dt_s, section, paddle, slat, -1, 0, 0.0);
        } else {
            int diff = diffs[idx];
            double rate = (dt_s > 0.0) ? ((double)diff / dt_s) : 0.0;
            fprintf(fp, "%ld,%s,%.6f,%s,%d,%d,%d,%d,%.6f\n",
                    epoch_s, timestr, dt_s, section, paddle, slat, idx, diff, rate);
        }
    }
}

static void usage(const char *prog) {
    fprintf(stderr,
            "Usage: %s [output_csv] [interval_s]\n"
            "  output_csv  default: muon_rates.csv\n"
            "  interval_s  default: 5\n",
            prog);
}

int main(int argc, char **argv) {
    const char *out_path = "muon_rates.csv";
    int interval_s = 5;

    int fd;
    void *map_base0, *map_base1;
    volatile unsigned int *reg0, *reg1;

    int prev[NREG] = {0};
    int curr[NREG] = {0};
    int diffs[NREG] = {0};

    FILE *fp;
    char timestr[64];

    if (argc >= 2) out_path = argv[1];
    if (argc >= 3) interval_s = atoi(argv[2]);
    if (interval_s <= 0) interval_s = 5;
    if (argc > 3) {
        usage(argv[0]);
        return EXIT_FAILURE;
    }

    signal(SIGINT, handle_sigint);

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

    /* Open output once. Write header if new/empty. */
    fp = fopen(out_path, "a");
    if (!fp) {
        perror("Error opening output CSV");
        munmap(map_base0, PAGE_SIZE);
        munmap(map_base1, PAGE_SIZE);
        close(fd);
        return EXIT_FAILURE;
    }

    if (file_is_empty(out_path)) {
        fprintf(fp, "epoch_s,local_time,dt_s,section,paddle,slat,mem_index,diff,rate_hz\n");
        fflush(fp);
    }

    /* Prime baseline: read, sleep(1), read again. */
    {
        int i;
        for (i = 0; i < NREG; i++) {
            if (i < NREG0) prev[i] = (int)reg0[i];
            else prev[i] = (int)reg1[i - NREG0];
        }
        sleep(1);
        for (i = 0; i < NREG; i++) {
            if (i < NREG0) prev[i] = (int)reg0[i];
            else prev[i] = (int)reg1[i - NREG0];
        }
    }

    {
        double t_prev = now_monotonic_s();

        while (!g_stop) {
            double t_now = now_monotonic_s();
            double dt_s = t_now - t_prev;
            time_t wall = time(NULL);
            struct tm tm_info;

            if (dt_s <= 0.0) dt_s = (double)interval_s;

            /* Read all regs */
            {
                int i;
                for (i = 0; i < NREG; i++) {
                    if (i < NREG0) curr[i] = (int)reg0[i];
                    else curr[i] = (int)reg1[i - NREG0];
                }
                for (i = 0; i < NREG; i++) {
                    diffs[i] = curr[i] - prev[i];
                    prev[i] = curr[i];
                }
            }

            /* Format local timestamp */
            localtime_r(&wall, &tm_info);
            strftime(timestr, sizeof(timestr), "%Y-%m-%d %H:%M:%S", &tm_info);

            /* Write one "sample" worth of rows */
            write_section_csv(fp, "TOP",
                              top_codes, (int)(sizeof(top_codes) / sizeof(top_codes[0])),
                              diffs, dt_s, timestr, (long)wall);

            write_section_csv(fp, "BARREL",
                              barrel_codes, (int)(sizeof(barrel_codes) / sizeof(barrel_codes[0])),
                              diffs, dt_s, timestr, (long)wall);

            write_section_csv(fp, "BOTTOM",
                              bottom_codes, (int)(sizeof(bottom_codes) / sizeof(bottom_codes[0])),
                              diffs, dt_s, timestr, (long)wall);

            fflush(fp);
            printf("Wrote sample at %s (dt=%.2f s)\n", timestr, dt_s);
            fflush(stdout);
            t_prev = t_now;
            sleep((unsigned int)interval_s);
        }
    }

    fclose(fp);
    munmap(map_base0, PAGE_SIZE);
    munmap(map_base1, PAGE_SIZE);
    close(fd);

    fprintf(stderr, "Stopped. Data saved to %s\n", out_path);
    return EXIT_SUCCESS;
}
