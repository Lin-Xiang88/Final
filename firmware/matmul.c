#include "matmul.h"

int* __attribute__ ( ( section ( ".mprjram" ) ) ) matmul()
{
	int i=0;
	int j;
	int k;
	int sum;
	int kk;
	unsigned int count = 0;
	for (i=0; i<SIZE; i++){
		for (j=0; j<SIZE; j++){
			sum = 0;
			for(k = 0;k<SIZE;k++)
				sum += A[(i*SIZE) + k] * B[(k*SIZE) + j];
			result[(i*SIZE) + j] = sum;
		}
	}

	return result;
}

void __attribute__ ( ( section ( ".mprjram" ) ) ) firPtr()
{
	volatile uint32_t *fir_addr = (volatile uint32_t *)0x30000000;
	// volatile uint32_t *fir_addr = (volatile uint32_t *)0x30000000;
	//*fir_addr = 0x00001c3c;
	// *fir_addr = 0x00100054;
	// *fir_addr = 0x003c407c;
	// *fir_addr = 0x143c687c;
	// *fir_addr = 0x043c687c;
	// *fir_addr = 0x1c3c087c;
	*fir_addr =  0x404c000c;//A11 B11
	*fir_addr =  0x202c505c;//B12 A21	
	*fir_addr =  0x606c101c;//A12 B21
	*fir_addr =  0x303c707c;//B22 A22
	*fir_addr =  0x404c000c;

	// volatile uint32_t *mm_addr = (volatile uint32_t *)0x30000678;

	// *mm_addr =  0x80a80000;//A11 B11
	// *fir_addr =  0x202c505c;//B12 A21	
	// *fir_addr =  0x606c101c;//A12 B21
	// *fir_addr =  0x303c707c;//B22 A22
	// *fir_addr =  0x404c000c;



}