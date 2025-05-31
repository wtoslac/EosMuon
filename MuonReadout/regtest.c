#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <fcntl.h>

int main(){
        int mem_fd;
        int *reg_ptr;
        int AXI_reg_base = 0x80020000;
        int reg_size = 0x1000;
        int reg_offset = 0x100;

        mem_fd = open("/dev/mem", O_RDWR);
        reg_ptr = mmap(NULL,reg_size,PROT_READ|PROT_WRITE, MAP_SHARED, mem_fd, AXI_reg_base);
        printf("AXI register %d contents: 0x%x\n",reg_offset,*(reg_ptr+reg_offset));
        munmap(reg_ptr,reg_size);

        return 0;
}
