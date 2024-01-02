#ifndef _MATMUL_H
#define _MATMUL_H
#include <stdint.h>

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

	// int __attribute__ ( ( section ( ".matmul" ) ) ) A[SIZE*SIZE] = {0,1,0,1,2,3,2,3,0,1,0,1,2,3,2,3	
	// };
	// int __attribute__ ( ( section ( ".matmul" ) ) ) B[SIZE*SIZE] = {1,2,5,6,3,4,7,8,9,10,13,14,11,12,15,16
	// };

	// int __attribute__ ( ( section ( ".matmul" ) ) ) AB[2*SIZE*SIZE] = {0,1,0,1,2,3,2,3,0,1,0,1,2,3,2,3, 
	// 																1,2,5,6,3,4,7,8,9,10,13,14,11,12,15,16
	// };

	int __attribute__ ( ( section ( ".matmul" ) ) ) AB[2*SIZE*SIZE] = {0,1,0,1,1,2,5,6,3,4,7,8,0,1,0,1,2,3,2,3, 
																		9,10,13,14,11,12,15,16,2,3,2,3
		};


	int __attribute__ ( ( section (	".matmul" ) ) ) fir_tap[11] = {0,-10,-9,23,56,63,56,23,-9,-10,0};
    
	int __attribute__ ( ( section (	".fir" ) ) ) fir_data[64] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64};


	int result[SIZE*SIZE];

#endif
