	.file	"precond.c"
	.text
	.p2align 4,,15
	.globl	precond_matrices
	.type	precond_matrices, @function
precond_matrices:
.LFB32:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movl	%edi, %r14d
	imull	%edi, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	salq	$2, %r14
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movl	%edi, %ebx
	movq	%r14, %rdi
	call	malloc
	testl	%ebx, %ebx
	movq	%rax, %r13
	je	.L2
	xorl	%r12d, %r12d
	xorl	%r10d, %r10d
	.p2align 4,,10
	.p2align 3
.L3:
	movl	%r12d, %eax
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	leaq	0(%r13,%rax,4), %r11
	.p2align 4,,10
	.p2align 3
.L5:
	movl	%r8d, %r9d
	addl	%ebx, %r8d
	addq	%r10, %r9
	movl	0(%rbp,%r9,4), %r9d
	movl	%r9d, (%r11,%rcx,4)
	addq	$1, %rcx
	cmpl	%ecx, %ebx
	ja	.L5
	addq	$1, %r10
	addl	%ebx, %r12d
	cmpl	%r10d, %ebx
	ja	.L3
.L2:
	movq	%rbp, %rdi
	movq	%r14, %rdx
	movq	%r13, %rsi
	call	memcpy
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	movq	%r13, %rdi
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	jmp	free
	.cfi_endproc
.LFE32:
	.size	precond_matrices, .-precond_matrices
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-11)"
	.section	.note.GNU-stack,"",@progbits
