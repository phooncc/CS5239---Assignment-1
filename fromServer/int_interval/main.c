#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <sys/time.h>
#include <time.h>
#include <math.h>

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

double calculateSD(int size, double* data, double average)
{
	int i;
	double SD;
	for(i=0;i<size;i++)
		SD += pow(data[i] - average,2);
	return sqrt(SD/((double)size));
}

int main(int argc, char *argv[])
{
	double total_c;
	double  total_t;
	int numloop = 1;
	int i;
	double* cpu_time 	= (double *)malloc(numloop * sizeof(double));
	double* wall_clock_time = (double *)malloc(numloop * sizeof(double));
	if(argc != 2){
		printf("Usage: %s <size of square matrix(int)>\n",argv[0]);
		exit(1);
	}
	unsigned int size = atoi(argv[1]);
		
	for(i = 0; i < numloop; i++){
		clock_t start_c = clock();
		struct timespec end_t, start_t;
		clock_gettime(CLOCK_REALTIME, &start_t);
	
		
		//printf("Matrix size: %s\n", argv[1]);
		
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
		matrix_multiplication(size, A, B, C);
		
		free(A);
		free(B);
		free(C);
	
		clock_t end_c 	= clock();
		clock_gettime(CLOCK_REALTIME, &end_t);
		
		cpu_time[i] 		= (end_c - start_c)/(double)CLOCKS_PER_SEC;
		wall_clock_time[i]	= (double)(end_t.tv_sec+end_t.tv_nsec*1e-9) - (double)(start_t.tv_sec+start_t.tv_nsec*1e-9);
	}
	
	for(i = 0; i < numloop; i++){
		total_c += cpu_time[i];
		total_t += wall_clock_time[i];
		//printf("Size:%d\tLoop:%d\tCPU time:%lf\tWall Clock time:%lf\n",size,i,cpu_time[i],wall_clock_time[i]);
	}
	
	double average_c = (double)total_c / ((double)numloop);
	double average_t = (double)total_t / ((double)numloop);
	
	double SD_c = calculateSD(numloop, cpu_time, average_c);
	double SD_t = calculateSD(numloop, wall_clock_time, average_t);
	printf("%d\t%.6f +/- %.6f\t%.6f +/- %.6f\n", size, average_c, SD_c, average_t, SD_t); // size, CPU time, Wall-clock time
	
	//print_matrix(size, C); 
	
	return 0;
}

