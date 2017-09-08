	.file	"main_float.c"
	.section	.rodata
.LC0:
	.string	"%d\t"
	.text
	.globl	print_matrix
	.type	print_matrix, @function
print_matrix:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L2
.L5:
	movl	$0, -8(%rbp)
	jmp	.L3
.L4:
	movl	-8(%rbp), %eax
	imull	-20(%rbp), %eax
	movl	%eax, %edx
	movl	-4(%rbp), %eax
	cltq
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movl	$.LC0, %edi
	movl	$1, %eax
	call	printf
	addl	$1, -8(%rbp)
.L3:
	movl	-8(%rbp), %eax
	cmpl	%eax, -20(%rbp)
	ja	.L4
	movl	$10, %edi
	call	putchar
	addl	$1, -4(%rbp)
.L2:
	movl	-4(%rbp), %eax
	cmpl	%eax, -20(%rbp)
	ja	.L5
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	print_matrix, .-print_matrix
	.globl	calculateSD
	.type	calculateSD, @function
calculateSD:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movsd	%xmm0, -40(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L8
.L9:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	subsd	-40(%rbp), %xmm0
	movsd	.LC1(%rip), %xmm1
	call	pow
	movapd	%xmm0, %xmm1
	movsd	-16(%rbp), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
	addl	$1, -4(%rbp)
.L8:
	movl	-4(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L9
	cvtsi2sd	-20(%rbp), %xmm0
	movsd	-16(%rbp), %xmm1
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	call	sqrt
	movq	%xmm0, %rax
	movq	%rax, -48(%rbp)
	movsd	-48(%rbp), %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	calculateSD, .-calculateSD
	.section	.rodata
	.align 8
.LC2:
	.string	"Usage: %s <size of square matrix(int)>\n"
	.align 8
.LC5:
	.string	"%d\t%.3f +/- %.3f\t%.3f +/- %.3f\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$208, %rsp
	movl	%edi, -180(%rbp)
	movq	%rsi, -192(%rbp)
	movl	$20, -24(%rbp)
	movl	-24(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -32(%rbp)
	movl	-24(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -40(%rbp)
	cmpl	$2, -180(%rbp)
	je	.L12
	movq	-192(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	movl	$1, %edi
	call	exit
.L12:
	movq	-192(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -44(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L13
.L14:
	call	clock
	movq	%rax, -88(%rbp)
	leaq	-176(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime
	movl	-44(%rbp), %eax
	imull	-44(%rbp), %eax
	movl	%eax, -92(%rbp)
	movl	-92(%rbp), %eax
	movl	%eax, -96(%rbp)
	movl	-96(%rbp), %eax
	movl	%eax, -100(%rbp)
	movl	-92(%rbp), %eax
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -112(%rbp)
	movl	-96(%rbp), %eax
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -120(%rbp)
	movl	-100(%rbp), %eax
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -128(%rbp)
	movq	-120(%rbp), %rdx
	movq	-112(%rbp), %rcx
	movl	-44(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	movl	$0, %eax
	call	init_matrices
	movq	-120(%rbp), %rdx
	movq	-112(%rbp), %rcx
	movl	-44(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	movl	$0, %eax
	call	precond_matrices
	movq	-128(%rbp), %rcx
	movq	-120(%rbp), %rdx
	movq	-112(%rbp), %rsi
	movl	-44(%rbp), %eax
	movl	%eax, %edi
	movl	$0, %eax
	call	matrix_multiplication
	movq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	free
	call	clock
	movq	%rax, -136(%rbp)
	leaq	-160(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime
	movq	-136(%rbp), %rax
	subq	-88(%rbp), %rax
	cvtsi2sdq	%rax, %xmm0
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movsd	.LC3(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	movq	-160(%rbp), %rax
	cvtsi2sdq	%rax, %xmm1
	movq	-152(%rbp), %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC4(%rip), %xmm2
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	-176(%rbp), %rax
	cvtsi2sdq	%rax, %xmm2
	movq	-168(%rbp), %rax
	cvtsi2sdq	%rax, %xmm1
	movsd	.LC4(%rip), %xmm3
	mulsd	%xmm3, %xmm1
	addsd	%xmm2, %xmm1
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	subsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -20(%rbp)
.L13:
	movl	-20(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jl	.L14
	movl	$0, -20(%rbp)
	jmp	.L15
.L16:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movsd	-8(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movsd	-16(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
	addl	$1, -20(%rbp)
.L15:
	movl	-20(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jl	.L16
	cvtsi2sd	-24(%rbp), %xmm0
	movsd	-8(%rbp), %xmm1
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movsd	%xmm0, -56(%rbp)
	cvtsi2sd	-24(%rbp), %xmm0
	movsd	-16(%rbp), %xmm1
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movsd	%xmm0, -64(%rbp)
	movq	-56(%rbp), %rcx
	movq	-32(%rbp), %rdx
	movl	-24(%rbp), %eax
	movq	%rcx, -200(%rbp)
	movsd	-200(%rbp), %xmm0
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	calculateSD
	movq	%xmm0, %rax
	movq	%rax, -72(%rbp)
	movq	-64(%rbp), %rcx
	movq	-40(%rbp), %rdx
	movl	-24(%rbp), %eax
	movq	%rcx, -200(%rbp)
	movsd	-200(%rbp), %xmm0
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	calculateSD
	movq	%xmm0, %rax
	movq	%rax, -80(%rbp)
	movsd	-80(%rbp), %xmm2
	movsd	-64(%rbp), %xmm1
	movsd	-72(%rbp), %xmm0
	movq	-56(%rbp), %rdx
	movl	-44(%rbp), %eax
	movapd	%xmm2, %xmm3
	movapd	%xmm1, %xmm2
	movapd	%xmm0, %xmm1
	movq	%rdx, -200(%rbp)
	movsd	-200(%rbp), %xmm0
	movl	%eax, %esi
	movl	$.LC5, %edi
	movl	$4, %eax
	call	printf
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC1:
	.long	0
	.long	1073741824
	.align 8
.LC3:
	.long	0
	.long	1093567616
	.align 8
.LC4:
	.long	3894859413
	.long	1041313291
	.ident	"GCC: (SUSE Linux) 7.1.1 20170629 [gcc-7-branch revision 249772]"
	.section	.note.GNU-stack,"",@progbits
