	.text
	.file	"insertion.c"
	.globl	insertionSort                   # -- Begin function insertionSort
	.p2align	4, 0x90
	.type	insertionSort,@function
insertionSort:                          # @insertionSort
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	$1, -16(%rbp)
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	movl	-16(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jge	.LBB0_9
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-8(%rbp), %rax
	movslq	-16(%rbp), %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, -20(%rbp)
	movl	-16(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -24(%rbp)
.LBB0_3:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	cmpl	$0, -24(%rbp)
	movb	%al, -25(%rbp)                  # 1-byte Spill
	jl	.LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=2
	movq	-8(%rbp), %rax
	movslq	-24(%rbp), %rcx
	movl	(%rax,%rcx,4), %eax
	cmpl	-20(%rbp), %eax
	setg	%al
	movb	%al, -25(%rbp)                  # 1-byte Spill
.LBB0_5:                                #   in Loop: Header=BB0_3 Depth=2
	movb	-25(%rbp), %al                  # 1-byte Reload
	testb	$1, %al
	jne	.LBB0_6
	jmp	.LBB0_7
.LBB0_6:                                #   in Loop: Header=BB0_3 Depth=2
	movq	-8(%rbp), %rax
	movslq	-24(%rbp), %rcx
	movl	(%rax,%rcx,4), %edx
	movq	-8(%rbp), %rax
	movl	-24(%rbp), %ecx
	addl	$1, %ecx
	movslq	%ecx, %rcx
	movl	%edx, (%rax,%rcx,4)
	movl	-24(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	.LBB0_3
.LBB0_7:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-20(%rbp), %edx
	movq	-8(%rbp), %rax
	movl	-24(%rbp), %ecx
	addl	$1, %ecx
	movslq	%ecx, %rcx
	movl	%edx, (%rax,%rcx,4)
# %bb.8:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -16(%rbp)
	jmp	.LBB0_1
.LBB0_9:
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	insertionSort, .Lfunc_end0-insertionSort
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
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	movl	-16(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jge	.LBB1_4
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	movq	-8(%rbp), %rax
	movslq	-16(%rbp), %rcx
	movl	(%rax,%rcx,4), %esi
	leaq	.L.str(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
# %bb.3:                                #   in Loop: Header=BB1_1 Depth=1
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -16(%rbp)
	jmp	.LBB1_1
.LBB1_4:
	leaq	.L.str.1(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	printArray, .Lfunc_end1-printArray
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
.LBB2_1:                                # =>This Inner Loop Header: Depth=1
	cmpl	$0, -28(%rbp)
	jl	.LBB2_4
# %bb.2:                                #   in Loop: Header=BB2_1 Depth=1
	movq	-40(%rbp), %rax                 # 8-byte Reload
	movl	-28(%rbp), %edx
	movslq	-28(%rbp), %rcx
	movl	%edx, (%rax,%rcx,4)
# %bb.3:                                #   in Loop: Header=BB2_1 Depth=1
	movl	-28(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, -28(%rbp)
	jmp	.LBB2_1
.LBB2_4:
	movq	-40(%rbp), %rdi                 # 8-byte Reload
	movl	-8(%rbp), %esi
	callq	insertionSort
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
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
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

	.ident	"Ubuntu clang version 14.0.0-1ubuntu1"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym insertionSort
	.addrsig_sym printArray
	.addrsig_sym printf
