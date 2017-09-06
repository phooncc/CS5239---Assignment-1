#include <stdlib.h>
#include <stdio.h>

void matrix_multiplication(unsigned int n, float* A, float* B, float* C)
{
	unsigned int i, j, k;
	for(i=0;i<n;i++) // Let i be the col index of [B] and also [C]  
		for(j=0;j<n;j++){ // Let j be the "row" index of [A] and also [C]
			float temp = 0;
			for(k=0;k<n;k++)
				temp += *(A+j*n+k) * *(B+i*n+k);
			*(C+i*n+j) = temp;
		}
	return;
}
