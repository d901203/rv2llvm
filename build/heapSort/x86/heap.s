	.text
	.file	"heap.c"
	.globl	swap                            # -- Begin function swap
	.p2align	4, 0x90
	.type	swap,@function
swap:                                   # @swap
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -20(%rbp)
	movq	-16(%rbp), %rax
	movl	(%rax), %ecx
	movq	-8(%rbp), %rax
	movl	%ecx, (%rax)
	movl	-20(%rbp), %ecx
	movq	-16(%rbp), %rax
	movl	%ecx, (%rax)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	swap, .Lfunc_end0-swap
	.cfi_endproc
                                        # -- End function
	.globl	heapify                         # -- Begin function heapify
	.p2align	4, 0x90
	.type	heapify,@function
heapify:                                # @heapify
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movl	-16(%rbp), %eax
	movl	%eax, -20(%rbp)
	movl	-16(%rbp), %eax
	shll	$1, %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	movl	-16(%rbp), %eax
	shll	$1, %eax
	addl	$2, %eax
	movl	%eax, -28(%rbp)
	movl	-24(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jge	.LBB1_3
# %bb.1:
	movq	-8(%rbp), %rax
	movslq	-24(%rbp), %rcx
	movl	(%rax,%rcx,4), %eax
	movq	-8(%rbp), %rcx
	movslq	-20(%rbp), %rdx
	cmpl	(%rcx,%rdx,4), %eax
	jle	.LBB1_3
# %bb.2:
	movl	-24(%rbp), %eax
	movl	%eax, -20(%rbp)
.LBB1_3:
	movl	-28(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jge	.LBB1_6
# %bb.4:
	movq	-8(%rbp), %rax
	movslq	-28(%rbp), %rcx
	movl	(%rax,%rcx,4), %eax
	movq	-8(%rbp), %rcx
	movslq	-20(%rbp), %rdx
	cmpl	(%rcx,%rdx,4), %eax
	jle	.LBB1_6
# %bb.5:
	movl	-28(%rbp), %eax
	movl	%eax, -20(%rbp)
.LBB1_6:
	movl	-20(%rbp), %eax
	cmpl	-16(%rbp), %eax
	je	.LBB1_8
# %bb.7:
	movq	-8(%rbp), %rdi
	movslq	-16(%rbp), %rax
	shlq	$2, %rax
	addq	%rax, %rdi
	movq	-8(%rbp), %rsi
	movslq	-20(%rbp), %rax
	shlq	$2, %rax
	addq	%rax, %rsi
	callq	swap
	movq	-8(%rbp), %rdi
	movl	-12(%rbp), %esi
	movl	-20(%rbp), %edx
	callq	heapify
.LBB1_8:
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	heapify, .Lfunc_end1-heapify
	.cfi_endproc
                                        # -- End function
	.globl	heapSort                        # -- Begin function heapSort
	.p2align	4, 0x90
	.type	heapSort,@function
heapSort:                               # @heapSort
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	-12(%rbp), %eax
	movl	$2, %ecx
	cltd
	idivl	%ecx
	subl	$1, %eax
	movl	%eax, -16(%rbp)
.LBB2_1:                                # =>This Inner Loop Header: Depth=1
	cmpl	$0, -16(%rbp)
	jl	.LBB2_4
# %bb.2:                                #   in Loop: Header=BB2_1 Depth=1
	movq	-8(%rbp), %rdi
	movl	-12(%rbp), %esi
	movl	-16(%rbp), %edx
	callq	heapify
# %bb.3:                                #   in Loop: Header=BB2_1 Depth=1
	movl	-16(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, -16(%rbp)
	jmp	.LBB2_1
.LBB2_4:
	movl	-12(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -20(%rbp)
.LBB2_5:                                # =>This Inner Loop Header: Depth=1
	cmpl	$0, -20(%rbp)
	jl	.LBB2_8
# %bb.6:                                #   in Loop: Header=BB2_5 Depth=1
	movq	-8(%rbp), %rdi
	movq	-8(%rbp), %rsi
	movslq	-20(%rbp), %rax
	shlq	$2, %rax
	addq	%rax, %rsi
	callq	swap
	movq	-8(%rbp), %rdi
	movl	-20(%rbp), %esi
	xorl	%edx, %edx
	callq	heapify
# %bb.7:                                #   in Loop: Header=BB2_5 Depth=1
	movl	-20(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, -20(%rbp)
	jmp	.LBB2_5
.LBB2_8:
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	heapSort, .Lfunc_end2-heapSort
	.cfi_endproc
                                        # -- End function
	.globl	printArray                      # -- Begin function printArray
	.p2align	4, 0x90
	.type	printArray,@function
printArray:                             # @printArray
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	$0, -16(%rbp)
.LBB3_1:                                # =>This Inner Loop Header: Depth=1
	movl	-16(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jge	.LBB3_4
# %bb.2:                                #   in Loop: Header=BB3_1 Depth=1
	movq	-8(%rbp), %rax
	movslq	-16(%rbp), %rcx
	movl	(%rax,%rcx,4), %esi
	leaq	.L.str(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
# %bb.3:                                #   in Loop: Header=BB3_1 Depth=1
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -16(%rbp)
	jmp	.LBB3_1
.LBB3_4:
	leaq	.L.str.1(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end3:
	.size	printArray, .Lfunc_end3-printArray
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movl	$0, -4(%rbp)
	movl	$10001, -8(%rbp)                # imm = 0x2711
	movl	-8(%rbp), %eax
                                        # kill: def $rax killed $eax
	movq	%rsp, %rcx
	movq	%rcx, -16(%rbp)
	leaq	15(,%rax,4), %rdx
	andq	$-16, %rdx
	movq	%rsp, %rcx
	subq	%rdx, %rcx
	movq	%rcx, -40(%rbp)                 # 8-byte Spill
	movq	%rcx, %rsp
	movq	%rax, -24(%rbp)
	movl	-8(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -28(%rbp)
.LBB4_1:                                # =>This Inner Loop Header: Depth=1
	cmpl	$0, -28(%rbp)
	jl	.LBB4_4
# %bb.2:                                #   in Loop: Header=BB4_1 Depth=1
	movq	-40(%rbp), %rax                 # 8-byte Reload
	movl	-28(%rbp), %edx
	movslq	-28(%rbp), %rcx
	movl	%edx, (%rax,%rcx,4)
# %bb.3:                                #   in Loop: Header=BB4_1 Depth=1
	movl	-28(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, -28(%rbp)
	jmp	.LBB4_1
.LBB4_4:
	movq	-40(%rbp), %rdi                 # 8-byte Reload
	movl	-8(%rbp), %esi
	callq	heapSort
	leaq	.L.str.2(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	movq	-40(%rbp), %rdi                 # 8-byte Reload
	movl	-8(%rbp), %esi
	callq	printArray
	movq	-16(%rbp), %rax
	movq	%rax, %rsp
	movl	-4(%rbp), %eax
	movq	%rbp, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end4:
	.size	main, .Lfunc_end4-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d "
	.size	.L.str, 4

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"\n"
	.size	.L.str.1, 2

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"Sorted array is\n"
	.size	.L.str.2, 17

	.ident	"Ubuntu clang version 14.0.0-1ubuntu1"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym swap
	.addrsig_sym heapify
	.addrsig_sym heapSort
	.addrsig_sym printArray
	.addrsig_sym printf
