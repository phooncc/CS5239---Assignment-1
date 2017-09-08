#include <stdlib.h>
#include <stdio.h>

void init_matrices(unsigned int n, float* A, float* B)
{

	//Initialise square matrices [A] and [B] of size (n * n) with random integer.
	
	unsigned int size = n * n;
	unsigned int i;
	for(i = 0; i < size; i++){
		*(A+i) = rand()%10;
		*(B+i) = rand()%10;
	}
	return;
}
