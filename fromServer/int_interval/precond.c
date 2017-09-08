#include <stdlib.h>
#include <stdio.h>
#include <string.h>

void precond_matrices(unsigned int n, int* A, int* B)
{
	//Make [A] as row major
	//Make [B] as col major
	//The idea is to make contiguous memory access for Matrix-Matrix Multiplication
	
	//By default, both Matrices [A] & [B] are treated as col major
	//Now, transpose Matrix [A] to make it from col major to row major
	int* temp = (int *) malloc(n*n*sizeof(int));
	unsigned i, j;
	for(i=0;i<n;i++) // Let i be row index of [temp]
		for(j=0;j<n;j++) // Let j be col index of [temp]
			*(temp+i*n+j) = *(A+j*n+i);
	memcpy((void*) A, (void*) temp, n*n*sizeof(int));
	free(temp);
	return;
}
