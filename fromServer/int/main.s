	.file	"main.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d\t"
	.text
	.p2align 4,,15
	.globl	print_matrix
	.type	print_matrix, @function
print_matrix:
.LFB25:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	testl	%edi, %edi
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movl	%edi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	je	.L1
	leal	-1(%rdi), %r14d
	movq	%rsi, %r13
	xorl	%r12d, %r12d
	addq	$1, %r14
	.p2align 4,,10
	.p2align 3
.L3:
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L5:
	imull	%ebp, %eax
	addl	$1, %ebx
	movl	$.LC0, %edi
	addq	%r12, %rax
	movl	0(%r13,%rax,4), %esi
	xorl	%eax, %eax
	call	printf
	cmpl	%ebp, %ebx
	movl	%ebx, %eax
	jne	.L5
	movl	$10, %edi
	addq	$1, %r12
	call	putchar
	cmpq	%r14, %r12
	jne	.L3
.L1:
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE25:
	.size	print_matrix, .-print_matrix
	.p2align 4,,15
	.globl	calculateSD
	.type	calculateSD, @function
calculateSD:
.LFB26:
	.cfi_startproc
	testl	%edi, %edi
	jle	.L12
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L13:
	movsd	(%rsi,%rax,8), %xmm1
	addq	$1, %rax
	cmpl	%eax, %edi
	subsd	%xmm0, %xmm1
	mulsd	%xmm1, %xmm1
	addsd	%xmm1, %xmm2
	jg	.L13
.L12:
	cvtsi2sd	%edi, %xmm0
	divsd	%xmm0, %xmm2
	sqrtsd	%xmm2, %xmm0
	ucomisd	%xmm0, %xmm0
	jp	.L19
.L18:
	rep ret
.L19:
	movapd	%xmm2, %xmm0
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	sqrt
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	.L18
	.cfi_endproc
.LFE26:
	.size	calculateSD, .-calculateSD
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"Usage: %s <size of square matrix(int)>\n"
	.align 8
.LC5:
	.string	"%d\t%.6f +/- %.6f\t%.6f +/- %.6f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB27:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movl	%edi, %ebp
	movl	$160, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbx
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	call	malloc
	movl	$160, %edi
	movq	%rax, %r15
	call	malloc
	cmpl	$2, %ebp
	movq	%rax, (%rsp)
	jne	.L27
	movq	8(%rbx), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movl	%eax, %r12d
	movq	%rax, 40(%rsp)
	movl	%eax, %r13d
	imull	%eax, %r12d
	xorl	%r8d, %r8d
	salq	$2, %r12
	.p2align 4,,10
	.p2align 3
.L23:
	movq	%r8, 32(%rsp)
	call	clock
	leaq	64(%rsp), %rsi
	xorl	%edi, %edi
	movq	%rax, 24(%rsp)
	call	clock_gettime
	movq	%r12, %rdi
	call	malloc
	movq	%r12, %rdi
	movq	%rax, %rbp
	call	malloc
	movq	%r12, %rdi
	movq	%rax, %rbx
	call	malloc
	movq	%rbx, %rdx
	movq	%rax, %r14
	movq	%rbp, %rsi
	movl	%r13d, %edi
	xorl	%eax, %eax
	call	init_matrices
	movq	%rbx, %rdx
	movq	%rbp, %rsi
	movl	%r13d, %edi
	xorl	%eax, %eax
	call	precond_matrices
	movq	%rbx, %rdx
	movq	%r14, %rcx
	movq	%rbp, %rsi
	movl	%r13d, %edi
	xorl	%eax, %eax
	call	matrix_multiplication
	movq	%rbp, %rdi
	call	free
	movq	%rbx, %rdi
	call	free
	movq	%r14, %rdi
	call	free
	call	clock
	leaq	48(%rsp), %rsi
	xorl	%edi, %edi
	movq	%rax, %rbx
	call	clock_gettime
	cvtsi2sdq	56(%rsp), %xmm1
	cvtsi2sdq	72(%rsp), %xmm2
	subq	24(%rsp), %rbx
	mulsd	.LC3(%rip), %xmm1
	mulsd	.LC3(%rip), %xmm2
	movq	32(%rsp), %r8
	movq	(%rsp), %rax
	cvtsi2sdq	%rbx, %xmm0
	divsd	.LC2(%rip), %xmm0
	movsd	%xmm0, (%r15,%r8)
	cvtsi2sdq	48(%rsp), %xmm0
	addsd	%xmm1, %xmm0
	cvtsi2sdq	64(%rsp), %xmm1
	addsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax,%r8)
	addq	$8, %r8
	cmpq	$160, %r8
	jne	.L23
	movq	(%rsp), %rcx
	movsd	8(%rsp), %xmm5
	movsd	16(%rsp), %xmm6
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L25:
	addsd	(%r15,%rax), %xmm5
	addsd	(%rcx,%rax), %xmm6
	addq	$8, %rax
	cmpq	$160, %rax
	movsd	%xmm5, 8(%rsp)
	movsd	%xmm6, 16(%rsp)
	jne	.L25
	movsd	.LC4(%rip), %xmm0
	movq	%r15, %rsi
	movapd	%xmm5, %xmm4
	movl	$20, %edi
	movapd	%xmm6, %xmm7
	divsd	%xmm0, %xmm4
	divsd	%xmm0, %xmm7
	movapd	%xmm4, %xmm0
	movsd	%xmm4, 24(%rsp)
	movsd	%xmm7, 8(%rsp)
	call	calculateSD
	movq	(%rsp), %rsi
	movsd	%xmm0, 16(%rsp)
	movl	$20, %edi
	movsd	8(%rsp), %xmm0
	call	calculateSD
	movsd	24(%rsp), %xmm4
	movl	40(%rsp), %esi
	movapd	%xmm0, %xmm3
	movl	$.LC5, %edi
	movsd	8(%rsp), %xmm2
	movl	$4, %eax
	movsd	16(%rsp), %xmm1
	movapd	%xmm4, %xmm0
	call	printf
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L27:
	.cfi_restore_state
	movq	(%rbx), %rsi
	movl	$.LC1, %edi
	xorl	%eax, %eax
	call	printf
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE27:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	0
	.long	1093567616
	.align 8
.LC3:
	.long	3894859413
	.long	1041313291
	.align 8
.LC4:
	.long	0
	.long	1077149696
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-11)"
	.section	.note.GNU-stack,"",@progbits
