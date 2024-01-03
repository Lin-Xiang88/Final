# 0 "../../firmware/matmul.c"
# 1 "/home/ubuntu/course-lab_D/DreamTeam/Final/testbench/counter_la//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "../../firmware/matmul.c"
# 1 "../../firmware/matmul.h" 1


# 1 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint.h" 1 3 4
# 11 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint.h" 3 4
# 1 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint-gcc.h" 1 3 4
# 34 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint-gcc.h" 3 4

# 34 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint-gcc.h" 3 4
typedef signed char int8_t;


typedef short int int16_t;


typedef long int int32_t;


typedef long long int int64_t;


typedef unsigned char uint8_t;


typedef short unsigned int uint16_t;


typedef long unsigned int uint32_t;


typedef long long unsigned int uint64_t;




typedef signed char int_least8_t;
typedef short int int_least16_t;
typedef long int int_least32_t;
typedef long long int int_least64_t;
typedef unsigned char uint_least8_t;
typedef short unsigned int uint_least16_t;
typedef long unsigned int uint_least32_t;
typedef long long unsigned int uint_least64_t;



typedef int int_fast8_t;
typedef int int_fast16_t;
typedef int int_fast32_t;
typedef long long int int_fast64_t;
typedef unsigned int uint_fast8_t;
typedef unsigned int uint_fast16_t;
typedef unsigned int uint_fast32_t;
typedef long long unsigned int uint_fast64_t;




typedef int intptr_t;


typedef unsigned int uintptr_t;




typedef long long int intmax_t;
typedef long long unsigned int uintmax_t;
# 12 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint.h" 2 3 4
# 4 "../../firmware/matmul.h" 2
# 32 "../../firmware/matmul.h"
 
# 32 "../../firmware/matmul.h"
int __attribute__ ( ( section ( ".matmul" ) ) ) AB[2*4*4] = {0,1,0,1,1,2,5,6,3,4,7,8,0,1,0,1,2,3,2,3,
                  9,10,13,14,11,12,15,16,2,3,2,3
  };


 int __attribute__ ( ( section ( ".matmul" ) ) ) fir_tap[11] = {0,-10,-9,23,56,63,56,23,-9,-10,0};

 int __attribute__ ( ( section ( ".fir" ) ) ) fir_data[64] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64};


 int result[4*4];
# 2 "../../firmware/matmul.c" 2
# 1 "../../firmware/dma.h" 1




volatile uint32_t *inst_ptr;
volatile uint32_t inst_addr = 0x30000678;
# 3 "../../firmware/matmul.c" 2
# 23 "../../firmware/matmul.c"
void __attribute__ ( ( section ( ".mprjram" ) ) ) firPtr()
{
 inst_ptr = (volatile uint32_t *)inst_addr;
# 34 "../../firmware/matmul.c"
 *inst_ptr =0x00032ca8;
 *inst_ptr =0x00030000;

 *inst_ptr =0x00070028;
 *inst_ptr =0x000600fc;

 *inst_ptr =0x00060000;
 *inst_ptr =0x000bacd0;
}
