	.text
	.file	"selection.c"
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
	.globl	selectionSort                   # -- Begin function selectionSort
	.p2align	4, 0x90
	.type	selectionSort,@function
selectionSort:                          # @selectionSort
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
	movl	$0, -16(%rbp)
.LBB1_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_3 Depth 2
	movl	-16(%rbp), %eax
	movl	-12(%rbp), %ecx
	subl	$1, %ecx
	cmpl	%ecx, %eax
	jge	.LBB1_12
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	movl	-16(%rbp), %eax
	movl	%eax, -24(%rbp)
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
.LBB1_3:                                #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-20(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jge	.LBB1_8
# %bb.4:                                #   in Loop: Header=BB1_3 Depth=2
	movq	-8(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movl	(%rax,%rcx,4), %eax
	movq	-8(%rbp), %rcx
	movslq	-24(%rbp), %rdx
	cmpl	(%rcx,%rdx,4), %eax
	jge	.LBB1_6
# %bb.5:                                #   in Loop: Header=BB1_3 Depth=2
	movl	-20(%rbp), %eax
	movl	%eax, -24(%rbp)
.LBB1_6:                                #   in Loop: Header=BB1_3 Depth=2
	jmp	.LBB1_7
.LBB1_7:                                #   in Loop: Header=BB1_3 Depth=2
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	.LBB1_3
.LBB1_8:                                #   in Loop: Header=BB1_1 Depth=1
	movl	-24(%rbp), %eax
	cmpl	-16(%rbp), %eax
	je	.LBB1_10
# %bb.9:                                #   in Loop: Header=BB1_1 Depth=1
	movq	-8(%rbp), %rdi
	movslq	-24(%rbp), %rax
	shlq	$2, %rax
	addq	%rax, %rdi
	movq	-8(%rbp), %rsi
	movslq	-16(%rbp), %rax
	shlq	$2, %rax
	addq	%rax, %rsi
	callq	swap
.LBB1_10:                               #   in Loop: Header=BB1_1 Depth=1
	jmp	.LBB1_11
.LBB1_11:                               #   in Loop: Header=BB1_1 Depth=1
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -16(%rbp)
	jmp	.LBB1_1
.LBB1_12:
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	selectionSort, .Lfunc_end1-selectionSort
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
.LBB2_1:                                # =>This Inner Loop Header: Depth=1
	movl	-16(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jge	.LBB2_4
# %bb.2:                                #   in Loop: Header=BB2_1 Depth=1
	movq	-8(%rbp), %rax
	movslq	-16(%rbp), %rcx
	movl	(%rax,%rcx,4), %esi
	leaq	.L.str(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
# %bb.3:                                #   in Loop: Header=BB2_1 Depth=1
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -16(%rbp)
	jmp	.LBB2_1
.LBB2_4:
	leaq	.L.str.1(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	printArray, .Lfunc_end2-printArray
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
.LBB3_1:                                # =>This Inner Loop Header: Depth=1
	cmpl	$0, -28(%rbp)
	jl	.LBB3_4
# %bb.2:                                #   in Loop: Header=BB3_1 Depth=1
	movq	-40(%rbp), %rax                 # 8-byte Reload
	movl	-28(%rbp), %edx
	movslq	-28(%rbp), %rcx
	movl	%edx, (%rax,%rcx,4)
# %bb.3:                                #   in Loop: Header=BB3_1 Depth=1
	movl	-28(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, -28(%rbp)
	jmp	.LBB3_1
.LBB3_4:
	movq	-40(%rbp), %rdi                 # 8-byte Reload
	movl	-8(%rbp), %esi
	callq	selectionSort
	leaq	.L.str.2(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	movq	-40(%rbp), %rdi                 # 8-byte Reload
	movl	-8(%rbp), %esi
	callq	printArray
	movl	$0, -4(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rsp
	movl	-4(%rbp), %eax
	movq	%rbp, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
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
	.asciz	"Sorted array: \n"
	.size	.L.str.2, 16

	.ident	"Ubuntu clang version 14.0.0-1ubuntu1"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym swap
	.addrsig_sym selectionSort
	.addrsig_sym printArray
	.addrsig_sym printf
