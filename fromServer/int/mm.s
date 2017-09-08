	.file	"mm.c"
	.text
	.p2align 4,,15
	.globl	matrix_multiplication
	.type	matrix_multiplication, @function
matrix_multiplication:
.LFB20:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	testl	%edi, %edi
	movl	%edi, %r15d
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
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rcx, -16(%rsp)
	je	.L1
	movq	%rsi, %r14
	movq	%rdx, %r12
	movl	$0, -24(%rsp)
	movl	$0, -20(%rsp)
	.p2align 4,,10
	.p2align 3
.L3:
	movl	-24(%rsp), %ebp
	xorl	%r9d, %r9d
	leaq	0(,%rbp,4), %rax
	leaq	4(,%rbp,4), %rdx
	movq	%rbp, -104(%rsp)
	leaq	(%r12,%rax), %rdi
	addq	-16(%rsp), %rax
	movq	%rdi, -72(%rsp)
	leaq	(%r12,%rdx), %rdi
	movq	%rdi, -64(%rsp)
	leaq	4(%r12,%rdx), %rdi
	movq	%rax, -96(%rsp)
	movq	%rdi, -56(%rsp)
	leaq	8(%r12,%rdx), %rdi
	movq	%rdi, -48(%rsp)
	leaq	12(%r12,%rdx), %rdi
	movq	%rdi, -40(%rsp)
	leaq	16(%r12,%rdx), %rdi
	movq	%rdi, -80(%rsp)
	leaq	-4(%r12,%rdx), %rdi
	movq	%rdi, -32(%rsp)
	xorl	%edi, %edi
	jmp	.L16
	.p2align 4,,10
	.p2align 3
.L10:
	movq	-72(%rsp), %rbx
	movl	(%r11), %eax
	imull	(%rbx), %eax
	cmpl	$1, %edx
	je	.L19
	movq	-64(%rsp), %rbx
	movl	4(%r14,%rcx), %r8d
	imull	(%rbx), %r8d
	addl	%r8d, %eax
	cmpl	$2, %edx
	je	.L20
	movq	-56(%rsp), %rbx
	movl	8(%r14,%rcx), %r8d
	imull	(%rbx), %r8d
	addl	%r8d, %eax
	cmpl	$3, %edx
	je	.L21
	movq	-48(%rsp), %rbx
	movl	12(%r14,%rcx), %r8d
	imull	(%rbx), %r8d
	addl	%r8d, %eax
	cmpl	$4, %edx
	je	.L22
	movq	-40(%rsp), %rbx
	movl	16(%r14,%rcx), %r8d
	imull	(%rbx), %r8d
	addl	%r8d, %eax
	cmpl	$6, %edx
	jne	.L23
	movq	-80(%rsp), %rbx
	movl	20(%r14,%rcx), %ecx
	imull	(%rbx), %ecx
	addl	%ecx, %eax
	movl	$6, %ecx
.L12:
	cmpl	%edx, %r15d
	je	.L13
.L11:
	movl	%r15d, %ebp
	movl	%edx, %r13d
	subl	%edx, %ebp
	movl	%ebp, %r10d
	shrl	$2, %r10d
	leal	0(,%r10,4), %ebx
	testl	%ebx, %ebx
	je	.L14
	salq	$2, %r13
	pxor	%xmm3, %xmm3
	addq	%r13, %r11
	addq	-32(%rsp), %r13
	xorl	%edx, %edx
	xorl	%r8d, %r8d
.L15:
	movdqu	0(%r13,%rdx), %xmm1
	addl	$1, %r8d
	movdqa	%xmm1, %xmm4
	psrlq	$32, %xmm1
	movdqa	(%r11,%rdx), %xmm2
	pmuludq	(%r11,%rdx), %xmm4
	pshufd	$8, %xmm4, %xmm0
	addq	$16, %rdx
	psrlq	$32, %xmm2
	pmuludq	%xmm2, %xmm1
	pshufd	$8, %xmm1, %xmm1
	cmpl	%r10d, %r8d
	punpckldq	%xmm1, %xmm0
	paddd	%xmm0, %xmm3
	jb	.L15
	movdqa	%xmm3, %xmm5
	addl	%ebx, %ecx
	psrldq	$8, %xmm5
	paddd	%xmm5, %xmm3
	movdqa	%xmm3, %xmm6
	psrldq	$4, %xmm6
	paddd	%xmm6, %xmm3
	movd	%xmm3, -84(%rsp)
	addl	-84(%rsp), %eax
	cmpl	%ebp, %ebx
	je	.L13
.L14:
	movq	-104(%rsp), %rbx
	movl	%ecx, %r8d
	leaq	(%r8,%rsi), %rdx
	addq	%rbx, %r8
	movl	(%r14,%rdx,4), %edx
	imull	(%r12,%r8,4), %edx
	leal	1(%rcx), %r8d
	addl	%edx, %eax
	cmpl	%r8d, %r15d
	jbe	.L13
	leaq	(%r8,%rsi), %rdx
	addq	%rbx, %r8
	addl	$2, %ecx
	movl	(%r14,%rdx,4), %edx
	imull	(%r12,%r8,4), %edx
	addl	%edx, %eax
	cmpl	%ecx, %r15d
	jbe	.L13
	addq	%rcx, %rsi
	addq	-104(%rsp), %rcx
	movl	(%r14,%rsi,4), %edx
	imull	(%r12,%rcx,4), %edx
	addl	%edx, %eax
.L13:
	movq	-96(%rsp), %rbx
	addl	%r15d, %r9d
	movl	%eax, (%rbx,%rdi,4)
	addq	$1, %rdi
	cmpl	%edi, %r15d
	jbe	.L9
.L16:
	movl	%r9d, %esi
	movl	%r15d, %edx
	leaq	0(,%rsi,4), %rcx
	leaq	(%r14,%rcx), %r11
	movq	%r11, %rax
	andl	$15, %eax
	shrq	$2, %rax
	negq	%rax
	andl	$3, %eax
	cmpl	%r15d, %eax
	cmova	%r15d, %eax
	cmpl	$6, %r15d
	jbe	.L10
	testl	%eax, %eax
	jne	.L34
	xorl	%edx, %edx
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L23:
	movl	$5, %ecx
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L22:
	movl	$4, %ecx
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L21:
	movl	$3, %ecx
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L20:
	movl	$2, %ecx
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L19:
	movl	$1, %ecx
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L9:
	addl	$1, -20(%rsp)
	addl	%r15d, -24(%rsp)
	cmpl	%r15d, -20(%rsp)
	jne	.L3
.L1:
	popq	%rbx
	.cfi_remember_state
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
.L34:
	.cfi_restore_state
	movl	%eax, %edx
	jmp	.L10
	.cfi_endproc
.LFE20:
	.size	matrix_multiplication, .-matrix_multiplication
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-11)"
	.section	.note.GNU-stack,"",@progbits
