	.text
	.file	"merge.c"
	.globl	merge                           # -- Begin function merge
	.p2align	4, 0x90
	.type	merge,@function
merge:                                  # @merge
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$96, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movl	%ecx, -20(%rbp)
	movl	-16(%rbp), %eax
	movl	-12(%rbp), %ecx
	subl	%ecx, %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
	movl	-20(%rbp), %eax
	movl	-16(%rbp), %ecx
	subl	%ecx, %eax
	movl	%eax, -40(%rbp)
	movl	-36(%rbp), %eax
                                        # kill: def $rax killed $eax
	movq	%rsp, %rcx
	movq	%rcx, -48(%rbp)
	leaq	15(,%rax,4), %rdx
	andq	$-16, %rdx
	movq	%rsp, %rcx
	subq	%rdx, %rcx
	movq	%rcx, -80(%rbp)                 # 8-byte Spill
	movq	%rcx, %rsp
	movq	%rax, -56(%rbp)
	movl	-40(%rbp), %eax
                                        # kill: def $rax killed $eax
	leaq	15(,%rax,4), %rdx
	andq	$-16, %rdx
	movq	%rsp, %rcx
	subq	%rdx, %rcx
	movq	%rcx, -72(%rbp)                 # 8-byte Spill
	movq	%rcx, %rsp
	movq	%rax, -64(%rbp)
	movl	$0, -24(%rbp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movl	-24(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jge	.LBB0_4
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-80(%rbp), %rax                 # 8-byte Reload
	movq	-8(%rbp), %rcx
	movl	-12(%rbp), %edx
	addl	-24(%rbp), %edx
	movslq	%edx, %rdx
	movl	(%rcx,%rdx,4), %edx
	movslq	-24(%rbp), %rcx
	movl	%edx, (%rax,%rcx,4)
# %bb.3:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	.LBB0_1
.LBB0_4:
	movl	$0, -28(%rbp)
.LBB0_5:                                # =>This Inner Loop Header: Depth=1
	movl	-28(%rbp), %eax
	cmpl	-40(%rbp), %eax
	jge	.LBB0_8
# %bb.6:                                #   in Loop: Header=BB0_5 Depth=1
	movq	-72(%rbp), %rax                 # 8-byte Reload
	movq	-8(%rbp), %rcx
	movl	-16(%rbp), %edx
	addl	$1, %edx
	addl	-28(%rbp), %edx
	movslq	%edx, %rdx
	movl	(%rcx,%rdx,4), %edx
	movslq	-28(%rbp), %rcx
	movl	%edx, (%rax,%rcx,4)
# %bb.7:                                #   in Loop: Header=BB0_5 Depth=1
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	jmp	.LBB0_5
.LBB0_8:
	movl	$0, -24(%rbp)
	movl	$0, -28(%rbp)
	movl	-12(%rbp), %eax
	movl	%eax, -32(%rbp)
.LBB0_9:                                # =>This Inner Loop Header: Depth=1
	movl	-24(%rbp), %ecx
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	cmpl	-36(%rbp), %ecx
	movb	%al, -81(%rbp)                  # 1-byte Spill
	jge	.LBB0_11
# %bb.10:                               #   in Loop: Header=BB0_9 Depth=1
	movl	-28(%rbp), %eax
	cmpl	-40(%rbp), %eax
	setl	%al
	movb	%al, -81(%rbp)                  # 1-byte Spill
.LBB0_11:                               #   in Loop: Header=BB0_9 Depth=1
	movb	-81(%rbp), %al                  # 1-byte Reload
	testb	$1, %al
	jne	.LBB0_12
	jmp	.LBB0_16
.LBB0_12:                               #   in Loop: Header=BB0_9 Depth=1
	movq	-72(%rbp), %rcx                 # 8-byte Reload
	movq	-80(%rbp), %rax                 # 8-byte Reload
	movslq	-24(%rbp), %rdx
	movl	(%rax,%rdx,4), %eax
	movslq	-28(%rbp), %rdx
	cmpl	(%rcx,%rdx,4), %eax
	jg	.LBB0_14
# %bb.13:                               #   in Loop: Header=BB0_9 Depth=1
	movq	-80(%rbp), %rax                 # 8-byte Reload
	movslq	-24(%rbp), %rcx
	movl	(%rax,%rcx,4), %edx
	movq	-8(%rbp), %rax
	movslq	-32(%rbp), %rcx
	movl	%edx, (%rax,%rcx,4)
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	.LBB0_15
.LBB0_14:                               #   in Loop: Header=BB0_9 Depth=1
	movq	-72(%rbp), %rax                 # 8-byte Reload
	movslq	-28(%rbp), %rcx
	movl	(%rax,%rcx,4), %edx
	movq	-8(%rbp), %rax
	movslq	-32(%rbp), %rcx
	movl	%edx, (%rax,%rcx,4)
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
.LBB0_15:                               #   in Loop: Header=BB0_9 Depth=1
	movl	-32(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -32(%rbp)
	jmp	.LBB0_9
.LBB0_16:
	jmp	.LBB0_17
.LBB0_17:                               # =>This Inner Loop Header: Depth=1
	movl	-24(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jge	.LBB0_19
# %bb.18:                               #   in Loop: Header=BB0_17 Depth=1
	movq	-80(%rbp), %rax                 # 8-byte Reload
	movslq	-24(%rbp), %rcx
	movl	(%rax,%rcx,4), %edx
	movq	-8(%rbp), %rax
	movslq	-32(%rbp), %rcx
	movl	%edx, (%rax,%rcx,4)
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	movl	-32(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -32(%rbp)
	jmp	.LBB0_17
.LBB0_19:
	jmp	.LBB0_20
.LBB0_20:                               # =>This Inner Loop Header: Depth=1
	movl	-28(%rbp), %eax
	cmpl	-40(%rbp), %eax
	jge	.LBB0_22
# %bb.21:                               #   in Loop: Header=BB0_20 Depth=1
	movq	-72(%rbp), %rax                 # 8-byte Reload
	movslq	-28(%rbp), %rcx
	movl	(%rax,%rcx,4), %edx
	movq	-8(%rbp), %rax
	movslq	-32(%rbp), %rcx
	movl	%edx, (%rax,%rcx,4)
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	movl	-32(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -32(%rbp)
	jmp	.LBB0_20
.LBB0_22:
	movq	-48(%rbp), %rax
	movq	%rax, %rsp
	movq	%rbp, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	merge, .Lfunc_end0-merge
	.cfi_endproc
                                        # -- End function
	.globl	mergeSort                       # -- Begin function mergeSort
	.p2align	4, 0x90
	.type	mergeSort,@function
mergeSort:                              # @mergeSort
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
	movl	-12(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jge	.LBB1_2
# %bb.1:
	movl	-12(%rbp), %eax
	movl	%eax, -24(%rbp)                 # 4-byte Spill
	movl	-16(%rbp), %eax
	subl	-12(%rbp), %eax
	movl	$2, %ecx
	cltd
	idivl	%ecx
	movl	%eax, %ecx
	movl	-24(%rbp), %eax                 # 4-byte Reload
	addl	%ecx, %eax
	movl	%eax, -20(%rbp)
	movq	-8(%rbp), %rdi
	movl	-12(%rbp), %esi
	movl	-20(%rbp), %edx
	callq	mergeSort
	movq	-8(%rbp), %rdi
	movl	-20(%rbp), %esi
	addl	$1, %esi
	movl	-16(%rbp), %edx
	callq	mergeSort
	movq	-8(%rbp), %rdi
	movl	-12(%rbp), %esi
	movl	-20(%rbp), %edx
	movl	-16(%rbp), %ecx
	callq	merge
.LBB1_2:
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	mergeSort, .Lfunc_end1-mergeSort
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
	movl	-8(%rbp), %edx
	subl	$1, %edx
	xorl	%esi, %esi
	callq	mergeSort
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
	.asciz	"\nSorted array is \n"
	.size	.L.str.2, 19

	.ident	"Ubuntu clang version 14.0.0-1ubuntu1"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym merge
	.addrsig_sym mergeSort
	.addrsig_sym printArray
	.addrsig_sym printf
