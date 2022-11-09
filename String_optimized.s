	.file	"String.c"
	.text
	.globl	str
	.data
	.align 32
	.type	str, @object
	.size	str, 128
str:
	.string	" !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"
	.zero	32
	.text
	.globl	count_chars
	.type	count_chars, @function
count_chars:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -24(%rbp)
	movl	$0, -12(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L2
.L7:
	movl	$0, -4(%rbp)
	jmp	.L3
.L6:
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %edx
	movl	-4(%rbp), %eax
	cltq
	leaq	str(%rip), %rcx
	movzbl	(%rax,%rcx), %eax
	cmpb	%al, %dl
	jne	.L4
	addl	$1, -12(%rbp)
	jmp	.L5
.L4:
	addl	$1, -4(%rbp)
.L3:
	cmpl	$96, -4(%rbp)
	jle	.L6
.L5:
	addl	$1, -8(%rbp)
.L2:
	cmpl	$8, -8(%rbp)
	jle	.L7
	movl	-12(%rbp), %eax
	popq	%rbp
	ret
	.size	count_chars, .-count_chars
	.section	.rodata
.LC0:
	.string	"%c"
.LC1:
	.string	"%d"
	.text
	.globl	main
	.type	main, @function
main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -28(%rbp)
	jmp	.L10
.L11:
	leaq	-17(%rbp), %rdx
	movl	-28(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addl	$1, -28(%rbp)
.L10:
	cmpl	$8, -28(%rbp)
	jle	.L11
	leaq	-17(%rbp), %rax
	movq	%rax, %rdi
	call	count_chars
	movl	%eax, -24(%rbp)
	movl	-24(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L13
	call	__stack_chk_fail@PLT
.L13:
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
