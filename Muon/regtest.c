#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <sys/mman.h>
#include <fcntl.h>

/* Example code:
 * Build with gcc reg_test.c -o reg_test
 * Call with one or two arguments:
 * reg_test [reg num] reads the register
 * reg_test [reg_num] [reg_data] writes the register
 * Refer to AXI register map for assignments.
 */

int main (int argc, char *argv[]) {
	
    int mem_fd = 0;                 // /dev/mem memory file descriptor
    int *reg_ptr;                   // pointer to AXI register
    int AXI_reg_base = 0x80020000;  // from Vivado
    int reg_size = 0x100;        // size of  registers
    int reg_offset = 0x100;

    printf("Opening /dev/mem.\n");
	mem_fd = open("/dev/mem", O_RDWR);
    if (mem_fd == -1)
        printf ("Error! mem_fd: 0x%x\n", mem_fd);
    
    printf("Memory mapping AXI register from /dev/mem to user space.\n");
    printf("reg_size=%d, AXI_reg_base=%x, mem_fd=%d\n",reg_size,AXI_reg_base,mem_fd);
    reg_ptr = (int *)mmap(NULL, reg_size, PROT_READ|PROT_WRITE, MAP_SHARED, mem_fd, AXI_reg_base);
    printf("Mapping Done.\n");
	//if (*reg_ptr == -1) {
	//	printf ("Error! reg_ptr: 0x%x\n", *reg_ptr);
	//	return 0;
	//}
	
	//printf("Reading AXI register %d.\n", reg_offset);
	//for(int i = 0; i<100;i++){
		printf ("AXI register %x contents: 0x%x\n", AXI_reg_base, *(reg_ptr));
	//}
    printf("Unmapping memory.\n");
    munmap(reg_ptr, reg_size);
    printf("Exit.\n");
    return 0;
}
