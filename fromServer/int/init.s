	.file	"init.c"
	.text
	.p2align 4,,15
	.globl	init_matrices
	.type	init_matrices, @function
init_matrices:
.LFB20:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	xorl	%r14d, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rsi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	%rdx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movl	%edi, %ebp
	imull	%edi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movl	$1717986919, %ebx
	testl	%ebp, %ebp
	je	.L1
	.p2align 4,,10
	.p2align 3
.L5:
	call	rand
	movl	%eax, %esi
	imull	%ebx
	movl	%esi, %eax
	sarl	$31, %eax
	sarl	$2, %edx
	subl	%eax, %edx
	leal	(%rdx,%rdx,4), %eax
	addl	%eax, %eax
	subl	%eax, %esi
	movl	%esi, 0(%r13,%r14,4)
	call	rand
	movl	%eax, %esi
	imull	%ebx
	movl	%esi, %eax
	sarl	$31, %eax
	sarl	$2, %edx
	subl	%eax, %edx
	leal	(%rdx,%rdx,4), %eax
	addl	%eax, %eax
	subl	%eax, %esi
	movl	%esi, (%r12,%r14,4)
	addq	$1, %r14
	cmpl	%r14d, %ebp
	ja	.L5
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
.LFE20:
	.size	init_matrices, .-init_matrices
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-11)"
	.section	.note.GNU-stack,"",@progbits
