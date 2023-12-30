#ifndef _MATMUL_H
#define _MATMUL_H
#include <stdint.h>

volatile uint32_t *fir_ptr;
volatile uint32_t fir_addr = 0x30000306;
volatile uint32_t *mat_ptr;
volatile uint32_t mat_addr = 0x30000678;
#define SIZE 4

// #define a[SIZE*SIZE]  {0, 1, 2, 3,0, 1, 2, 3,0, 1, 2, 3,0, 1, 2, 3};

// #define b[SIZE*SIZE]  {1, 2, 3, 4,5, 6, 7, 8,9, 10, 11, 12,13, 14, 15, 16}; 

// 	int __attribute__ ( ( section ( ".adder" ) ) ) A[SIZE*SIZE] = {	a[0],a[1],a[4],a[5],
// 		a[2],a[3],a[6],a[7],
// 		a[8],a[9],a[12],a[13],
// 		a[10],a[11],a[14],a[15]
// 	};
// 	int __attribute__ ( ( section ( ".adder" ) ) ) B[SIZE*SIZE] = {b[0],b[1],b[4],b[5],
// 		b[2],b[3],b[6],b[7],
// 		b[8],b[9],b[12],b[13],
// 		b[10],b[11],b[14],b[15]
// 	};
// 	int result[SIZE*SIZE];

	int __attribute__ ( ( section ( ".adder" ) ) ) A[SIZE*SIZE] = {0,1,0,1,2,3,2,3,0,1,0,1,2,3,2,3	
	};
	int __attribute__ ( ( section ( ".adder" ) ) ) B[SIZE*SIZE] = {1,2,5,6,3,4,7,8,9,10,13,14,11,12,15,16
	};
	int __attribute__ ( ( section (	".adder" ) ) ) fir_tap[11] = {0,-10,-9,23,56,63,56,23,-9,-10,0};
    
	// int __attribute__ ( ( section (	".adder" ) ) ) fir_data[11] = {

	int result[SIZE*SIZE];

#endif
