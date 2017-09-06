#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <time.h>

void print_matrix(unsigned int n, int* matrix){
	// Print the matrix
	int i, j;
	for(i=0;i<n;i++){
		for(j=0;j<n;j++)
			printf("%d\t",*(matrix+j*n+i));
		printf("\n");
	}
	return;
}

int main(int argc, char *argv[])
{
	if(argc != 2){
		printf("Usage: %s <size of square matrix(int)>\n",argv[0]);
		exit(1);
	}
	//printf("Matrix size: %s\n", argv[1]);
	
	unsigned int size = atoi(argv[1]);
	unsigned int sizeA = size*size;
	unsigned int sizeB = sizeA;
	unsigned int sizeC = sizeB;
	
	//Matrix [A], [B] & [C] are col-major
	int* A = (int *)malloc(sizeA * sizeof(int));
	int* B = (int *)malloc(sizeB * sizeof(int));
	int* C = (int *)malloc(sizeC * sizeof(int));
	
	init_matrices(size, A, B);
	
	//print_matrix(size, A);
	//print_matrix(size, B);
	
	precond_matrices(size, A, B);
	
	clock_t total_c;
	double  total_t;
	
	for(int i = 0; i < 20; i++){
		clock_t start_c = clock();
		time_t start_t 	= time(NULL);
	
		matrix_multiplication(size, A, B, C);
	
		clock_t end_c 	= clock();
		time_t end_t 	= time(NULL);
		
		total_c += end_c - start_c;
		total_t += (double)(end_t - start_t);
	}
	double average_c = (double)total_c / ((double)(20.0 * CLOCKS_PER_SEC));
	double average_t = (double)total_t / ((double)20.0);
	printf("%d %.3f %.3f\n", size, average_c, average_t); // size, CPU time, Wall-clock time
	
	//print_matrix(size, C); 
	
	return 0;
}


