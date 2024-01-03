#include "matmul.h"
#include "dma.h"
// int* __attribute__ ( ( section ( ".mprjram" ) ) ) matmul()
// {
// 	int i=0;
// 	int j;
// 	int k;
// 	int sum;
// 	int kk;
// 	unsigned int count = 0;
// 	for (i=0; i<SIZE; i++){
// 		for (j=0; j<SIZE; j++){
// 			sum = 0;
// 			for(k = 0;k<SIZE;k++)
// 				sum += A[(i*SIZE) + k] * B[(k*SIZE) + j];
// 			result[(i*SIZE) + j] = sum;
// 		}
// 	}

// 	return result;
// }

void __attribute__ ( ( section ( ".mprjram" ) ) ) firPtr()
{
	inst_ptr = (volatile uint32_t *)inst_addr;
	// *inst_ptr =0x00036c78;//A11
	// *inst_ptr =0x00032c38;//B11
	// *inst_ptr =0x00033c48;//B12
	// *inst_ptr =0x00038c98;//A21
	// *inst_ptr =0x00037c88;//A12
	// *inst_ptr =0x00034c58;//B21
	// *inst_ptr =0x00035c68;//B22
	// *inst_ptr =0x00039ca8;//A22
	*inst_ptr =0x00032ca8;//mm
	*inst_ptr =0x00030000;	

	*inst_ptr =0x00070028;//tap
	*inst_ptr =0x000600fc;//data
	// 
	*inst_ptr =0x00060000;
	*inst_ptr =0x000bacd0;//data
}