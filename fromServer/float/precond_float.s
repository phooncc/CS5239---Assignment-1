	.file	"precond_float.c"
	.text
	.globl	precond_matrices
	.type	precond_matrices, @function
precond_matrices:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movl	-20(%rbp), %eax
	imull	-20(%rbp), %eax
	movl	%eax, %eax
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -16(%rbp)
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
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	imull	-20(%rbp), %eax
	movl	%eax, %ecx
	movl	-8(%rbp), %eax
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rcx
	movq	-16(%rbp), %rax
	addq	%rcx, %rax
	movss	(%rdx), %xmm0
	movss	%xmm0, (%rax)
	addl	$1, -8(%rbp)
.L3:
	movl	-8(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jb	.L4
	addl	$1, -4(%rbp)
.L2:
	movl	-4(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jb	.L5
	movl	-20(%rbp), %eax
	imull	-20(%rbp), %eax
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	movq	-16(%rbp), %rcx
	movq	-32(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcpy
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	precond_matrices, .-precond_matrices
	.ident	"GCC: (SUSE Linux) 7.1.1 20170629 [gcc-7-branch revision 249772]"
	.section	.note.GNU-stack,"",@progbits
