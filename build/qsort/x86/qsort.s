	.text
	.file	"qsort.c"
	.globl	qsort                           # -- Begin function qsort
	.p2align	4, 0x90
	.type	qsort,@function
qsort:                                  # @qsort
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$240, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_38 Depth 2
                                        #       Child Loop BB0_39 Depth 3
                                        #       Child Loop BB0_52 Depth 3
	movq	-8(%rbp), %rax
	subq	$0, %rax
	andq	$7, %rax
	cmpq	$0, %rax
	jne	.LBB0_3
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-24(%rbp), %rax
	andq	$7, %rax
	cmpq	$0, %rax
	je	.LBB0_4
.LBB0_3:                                #   in Loop: Header=BB0_1 Depth=1
	movl	$2, %eax
	movl	%eax, -216(%rbp)                # 4-byte Spill
	jmp	.LBB0_5
.LBB0_4:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-24(%rbp), %rdx
	movl	$1, %eax
	xorl	%ecx, %ecx
	cmpq	$8, %rdx
	cmovel	%ecx, %eax
	movl	%eax, -216(%rbp)                # 4-byte Spill
.LBB0_5:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-216(%rbp), %eax                # 4-byte Reload
	movl	%eax, -112(%rbp)
	movq	-8(%rbp), %rax
	subq	$0, %rax
	andq	$3, %rax
	cmpq	$0, %rax
	jne	.LBB0_7
# %bb.6:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-24(%rbp), %rax
	andq	$3, %rax
	cmpq	$0, %rax
	je	.LBB0_8
.LBB0_7:                                #   in Loop: Header=BB0_1 Depth=1
	movl	$2, %eax
	movl	%eax, -220(%rbp)                # 4-byte Spill
	jmp	.LBB0_9
.LBB0_8:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-24(%rbp), %rdx
	movl	$1, %eax
	xorl	%ecx, %ecx
	cmpq	$4, %rdx
	cmovel	%ecx, %eax
	movl	%eax, -220(%rbp)                # 4-byte Spill
.LBB0_9:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-220(%rbp), %eax                # 4-byte Reload
	movl	%eax, -116(%rbp)
	movl	$0, -120(%rbp)
	cmpq	$7, -16(%rbp)
	jae	.LBB0_27
# %bb.10:
	movq	-8(%rbp), %rax
	addq	-24(%rbp), %rax
	movq	%rax, -80(%rbp)
.LBB0_11:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_13 Depth 2
	movq	-80(%rbp), %rax
	movq	-8(%rbp), %rcx
	movq	-16(%rbp), %rdx
	imulq	-24(%rbp), %rdx
	addq	%rdx, %rcx
	cmpq	%rcx, %rax
	jae	.LBB0_26
# %bb.12:                               #   in Loop: Header=BB0_11 Depth=1
	movq	-80(%rbp), %rax
	movq	%rax, -72(%rbp)
.LBB0_13:                               #   Parent Loop BB0_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	-72(%rbp), %rcx
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	cmpq	-8(%rbp), %rcx
	movb	%al, -221(%rbp)                 # 1-byte Spill
	jbe	.LBB0_15
# %bb.14:                               #   in Loop: Header=BB0_13 Depth=2
	movq	-32(%rbp), %rax
	movq	-72(%rbp), %rdi
	xorl	%ecx, %ecx
                                        # kill: def $rcx killed $ecx
	subq	-24(%rbp), %rcx
	addq	%rcx, %rdi
	movq	-72(%rbp), %rsi
	callq	*%rax
	cmpl	$0, %eax
	setg	%al
	movb	%al, -221(%rbp)                 # 1-byte Spill
.LBB0_15:                               #   in Loop: Header=BB0_13 Depth=2
	movb	-221(%rbp), %al                 # 1-byte Reload
	testb	$1, %al
	jne	.LBB0_16
	jmp	.LBB0_24
.LBB0_16:                               #   in Loop: Header=BB0_13 Depth=2
	cmpl	$0, -112(%rbp)
	jne	.LBB0_18
# %bb.17:                               #   in Loop: Header=BB0_13 Depth=2
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -128(%rbp)
	movq	-72(%rbp), %rax
	xorl	%ecx, %ecx
                                        # kill: def $rcx killed $ecx
	subq	-24(%rbp), %rcx
	movq	(%rax,%rcx), %rcx
	movq	-72(%rbp), %rax
	movq	%rcx, (%rax)
	movq	-128(%rbp), %rdx
	movq	-72(%rbp), %rax
	xorl	%ecx, %ecx
                                        # kill: def $rcx killed $ecx
	subq	-24(%rbp), %rcx
	movq	%rdx, (%rax,%rcx)
	jmp	.LBB0_22
.LBB0_18:                               #   in Loop: Header=BB0_13 Depth=2
	cmpl	$0, -116(%rbp)
	jne	.LBB0_20
# %bb.19:                               #   in Loop: Header=BB0_13 Depth=2
	movq	-72(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -132(%rbp)
	movq	-72(%rbp), %rax
	xorl	%ecx, %ecx
                                        # kill: def $rcx killed $ecx
	subq	-24(%rbp), %rcx
	movl	(%rax,%rcx), %ecx
	movq	-72(%rbp), %rax
	movl	%ecx, (%rax)
	movl	-132(%rbp), %edx
	movq	-72(%rbp), %rax
	xorl	%ecx, %ecx
                                        # kill: def $rcx killed $ecx
	subq	-24(%rbp), %rcx
	movl	%edx, (%rax,%rcx)
	jmp	.LBB0_21
.LBB0_20:                               #   in Loop: Header=BB0_13 Depth=2
	movq	-72(%rbp), %rdi
	movq	-72(%rbp), %rsi
	xorl	%eax, %eax
                                        # kill: def $rax killed $eax
	subq	-24(%rbp), %rax
	addq	%rax, %rsi
	movq	-24(%rbp), %rax
	movl	%eax, %edx
	movl	-112(%rbp), %ecx
	movl	-116(%rbp), %r8d
	callq	swapfunc
.LBB0_21:                               #   in Loop: Header=BB0_13 Depth=2
	jmp	.LBB0_22
.LBB0_22:                               #   in Loop: Header=BB0_13 Depth=2
	jmp	.LBB0_23
.LBB0_23:                               #   in Loop: Header=BB0_13 Depth=2
	movq	-24(%rbp), %rdx
	movq	-72(%rbp), %rax
	xorl	%ecx, %ecx
                                        # kill: def $rcx killed $ecx
	subq	%rdx, %rcx
	addq	%rcx, %rax
	movq	%rax, -72(%rbp)
	jmp	.LBB0_13
.LBB0_24:                               #   in Loop: Header=BB0_11 Depth=1
	jmp	.LBB0_25
.LBB0_25:                               #   in Loop: Header=BB0_11 Depth=1
	movq	-24(%rbp), %rax
	addq	-80(%rbp), %rax
	movq	%rax, -80(%rbp)
	jmp	.LBB0_11
.LBB0_26:
	jmp	.LBB0_105
.LBB0_27:                               #   in Loop: Header=BB0_1 Depth=1
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rcx
	shrq	$1, %rcx
	imulq	-24(%rbp), %rcx
	addq	%rcx, %rax
	movq	%rax, -80(%rbp)
	cmpq	$7, -16(%rbp)
	jbe	.LBB0_31
# %bb.28:                               #   in Loop: Header=BB0_1 Depth=1
	movq	-8(%rbp), %rax
	movq	%rax, -72(%rbp)
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rcx
	subq	$1, %rcx
	imulq	-24(%rbp), %rcx
	addq	%rcx, %rax
	movq	%rax, -88(%rbp)
	cmpq	$40, -16(%rbp)
	jbe	.LBB0_30
# %bb.29:                               #   in Loop: Header=BB0_1 Depth=1
	movq	-16(%rbp), %rax
	shrq	$3, %rax
	imulq	-24(%rbp), %rax
	movq	%rax, -96(%rbp)
	movq	-72(%rbp), %rdi
	movq	-72(%rbp), %rsi
	addq	-96(%rbp), %rsi
	movq	-72(%rbp), %rdx
	movq	-96(%rbp), %rax
	shlq	$1, %rax
	addq	%rax, %rdx
	movq	-32(%rbp), %rcx
	callq	med3
	movq	%rax, -72(%rbp)
	movq	-80(%rbp), %rdi
	xorl	%eax, %eax
                                        # kill: def $rax killed $eax
	subq	-96(%rbp), %rax
	addq	%rax, %rdi
	movq	-80(%rbp), %rsi
	movq	-80(%rbp), %rdx
	addq	-96(%rbp), %rdx
	movq	-32(%rbp), %rcx
	callq	med3
	movq	%rax, -80(%rbp)
	movq	-88(%rbp), %rdi
	movq	-96(%rbp), %rcx
	shlq	$1, %rcx
	xorl	%eax, %eax
                                        # kill: def $rax killed $eax
	subq	%rcx, %rax
	addq	%rax, %rdi
	movq	-88(%rbp), %rsi
	xorl	%eax, %eax
                                        # kill: def $rax killed $eax
	subq	-96(%rbp), %rax
	addq	%rax, %rsi
	movq	-88(%rbp), %rdx
	movq	-32(%rbp), %rcx
	callq	med3
	movq	%rax, -88(%rbp)
.LBB0_30:                               #   in Loop: Header=BB0_1 Depth=1
	movq	-72(%rbp), %rdi
	movq	-80(%rbp), %rsi
	movq	-88(%rbp), %rdx
	movq	-32(%rbp), %rcx
	callq	med3
	movq	%rax, -80(%rbp)
.LBB0_31:                               #   in Loop: Header=BB0_1 Depth=1
	cmpl	$0, -112(%rbp)
	jne	.LBB0_33
# %bb.32:                               #   in Loop: Header=BB0_1 Depth=1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -144(%rbp)
	movq	-80(%rbp), %rax
	movq	(%rax), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, (%rax)
	movq	-144(%rbp), %rcx
	movq	-80(%rbp), %rax
	movq	%rcx, (%rax)
	jmp	.LBB0_37
.LBB0_33:                               #   in Loop: Header=BB0_1 Depth=1
	cmpl	$0, -116(%rbp)
	jne	.LBB0_35
# %bb.34:                               #   in Loop: Header=BB0_1 Depth=1
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -148(%rbp)
	movq	-80(%rbp), %rax
	movl	(%rax), %ecx
	movq	-8(%rbp), %rax
	movl	%ecx, (%rax)
	movl	-148(%rbp), %ecx
	movq	-80(%rbp), %rax
	movl	%ecx, (%rax)
	jmp	.LBB0_36
.LBB0_35:                               #   in Loop: Header=BB0_1 Depth=1
	movq	-8(%rbp), %rdi
	movq	-80(%rbp), %rsi
	movq	-24(%rbp), %rax
	movl	%eax, %edx
	movl	-112(%rbp), %ecx
	movl	-116(%rbp), %r8d
	callq	swapfunc
.LBB0_36:                               #   in Loop: Header=BB0_1 Depth=1
	jmp	.LBB0_37
.LBB0_37:                               #   in Loop: Header=BB0_1 Depth=1
	movq	-8(%rbp), %rax
	addq	-24(%rbp), %rax
	movq	%rax, -48(%rbp)
	movq	%rax, -40(%rbp)
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rcx
	subq	$1, %rcx
	imulq	-24(%rbp), %rcx
	addq	%rcx, %rax
	movq	%rax, -64(%rbp)
	movq	%rax, -56(%rbp)
.LBB0_38:                               #   Parent Loop BB0_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_39 Depth 3
                                        #       Child Loop BB0_52 Depth 3
	jmp	.LBB0_39
.LBB0_39:                               #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_38 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	-48(%rbp), %rcx
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	cmpq	-56(%rbp), %rcx
	movb	%al, -222(%rbp)                 # 1-byte Spill
	ja	.LBB0_41
# %bb.40:                               #   in Loop: Header=BB0_39 Depth=3
	movq	-32(%rbp), %rax
	movq	-48(%rbp), %rdi
	movq	-8(%rbp), %rsi
	callq	*%rax
	movl	%eax, -108(%rbp)
	cmpl	$0, %eax
	setle	%al
	movb	%al, -222(%rbp)                 # 1-byte Spill
.LBB0_41:                               #   in Loop: Header=BB0_39 Depth=3
	movb	-222(%rbp), %al                 # 1-byte Reload
	testb	$1, %al
	jne	.LBB0_42
	jmp	.LBB0_51
.LBB0_42:                               #   in Loop: Header=BB0_39 Depth=3
	cmpl	$0, -108(%rbp)
	jne	.LBB0_50
# %bb.43:                               #   in Loop: Header=BB0_39 Depth=3
	movl	$1, -120(%rbp)
	cmpl	$0, -112(%rbp)
	jne	.LBB0_45
# %bb.44:                               #   in Loop: Header=BB0_39 Depth=3
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -160(%rbp)
	movq	-48(%rbp), %rax
	movq	(%rax), %rcx
	movq	-40(%rbp), %rax
	movq	%rcx, (%rax)
	movq	-160(%rbp), %rcx
	movq	-48(%rbp), %rax
	movq	%rcx, (%rax)
	jmp	.LBB0_49
.LBB0_45:                               #   in Loop: Header=BB0_39 Depth=3
	cmpl	$0, -116(%rbp)
	jne	.LBB0_47
# %bb.46:                               #   in Loop: Header=BB0_39 Depth=3
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -164(%rbp)
	movq	-48(%rbp), %rax
	movl	(%rax), %ecx
	movq	-40(%rbp), %rax
	movl	%ecx, (%rax)
	movl	-164(%rbp), %ecx
	movq	-48(%rbp), %rax
	movl	%ecx, (%rax)
	jmp	.LBB0_48
.LBB0_47:                               #   in Loop: Header=BB0_39 Depth=3
	movq	-40(%rbp), %rdi
	movq	-48(%rbp), %rsi
	movq	-24(%rbp), %rax
	movl	%eax, %edx
	movl	-112(%rbp), %ecx
	movl	-116(%rbp), %r8d
	callq	swapfunc
.LBB0_48:                               #   in Loop: Header=BB0_39 Depth=3
	jmp	.LBB0_49
.LBB0_49:                               #   in Loop: Header=BB0_39 Depth=3
	movq	-24(%rbp), %rax
	addq	-40(%rbp), %rax
	movq	%rax, -40(%rbp)
.LBB0_50:                               #   in Loop: Header=BB0_39 Depth=3
	movq	-24(%rbp), %rax
	addq	-48(%rbp), %rax
	movq	%rax, -48(%rbp)
	jmp	.LBB0_39
.LBB0_51:                               #   in Loop: Header=BB0_38 Depth=2
	jmp	.LBB0_52
.LBB0_52:                               #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_38 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movq	-48(%rbp), %rcx
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	cmpq	-56(%rbp), %rcx
	movb	%al, -223(%rbp)                 # 1-byte Spill
	ja	.LBB0_54
# %bb.53:                               #   in Loop: Header=BB0_52 Depth=3
	movq	-32(%rbp), %rax
	movq	-56(%rbp), %rdi
	movq	-8(%rbp), %rsi
	callq	*%rax
	movl	%eax, -108(%rbp)
	cmpl	$0, %eax
	setge	%al
	movb	%al, -223(%rbp)                 # 1-byte Spill
.LBB0_54:                               #   in Loop: Header=BB0_52 Depth=3
	movb	-223(%rbp), %al                 # 1-byte Reload
	testb	$1, %al
	jne	.LBB0_55
	jmp	.LBB0_64
.LBB0_55:                               #   in Loop: Header=BB0_52 Depth=3
	cmpl	$0, -108(%rbp)
	jne	.LBB0_63
# %bb.56:                               #   in Loop: Header=BB0_52 Depth=3
	movl	$1, -120(%rbp)
	cmpl	$0, -112(%rbp)
	jne	.LBB0_58
# %bb.57:                               #   in Loop: Header=BB0_52 Depth=3
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -176(%rbp)
	movq	-64(%rbp), %rax
	movq	(%rax), %rcx
	movq	-56(%rbp), %rax
	movq	%rcx, (%rax)
	movq	-176(%rbp), %rcx
	movq	-64(%rbp), %rax
	movq	%rcx, (%rax)
	jmp	.LBB0_62
.LBB0_58:                               #   in Loop: Header=BB0_52 Depth=3
	cmpl	$0, -116(%rbp)
	jne	.LBB0_60
# %bb.59:                               #   in Loop: Header=BB0_52 Depth=3
	movq	-56(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -180(%rbp)
	movq	-64(%rbp), %rax
	movl	(%rax), %ecx
	movq	-56(%rbp), %rax
	movl	%ecx, (%rax)
	movl	-180(%rbp), %ecx
	movq	-64(%rbp), %rax
	movl	%ecx, (%rax)
	jmp	.LBB0_61
.LBB0_60:                               #   in Loop: Header=BB0_52 Depth=3
	movq	-56(%rbp), %rdi
	movq	-64(%rbp), %rsi
	movq	-24(%rbp), %rax
	movl	%eax, %edx
	movl	-112(%rbp), %ecx
	movl	-116(%rbp), %r8d
	callq	swapfunc
.LBB0_61:                               #   in Loop: Header=BB0_52 Depth=3
	jmp	.LBB0_62
.LBB0_62:                               #   in Loop: Header=BB0_52 Depth=3
	movq	-24(%rbp), %rdx
	movq	-64(%rbp), %rax
	xorl	%ecx, %ecx
                                        # kill: def $rcx killed $ecx
	subq	%rdx, %rcx
	addq	%rcx, %rax
	movq	%rax, -64(%rbp)
.LBB0_63:                               #   in Loop: Header=BB0_52 Depth=3
	movq	-24(%rbp), %rdx
	movq	-56(%rbp), %rax
	xorl	%ecx, %ecx
                                        # kill: def $rcx killed $ecx
	subq	%rdx, %rcx
	addq	%rcx, %rax
	movq	%rax, -56(%rbp)
	jmp	.LBB0_52
.LBB0_64:                               #   in Loop: Header=BB0_38 Depth=2
	movq	-48(%rbp), %rax
	cmpq	-56(%rbp), %rax
	jbe	.LBB0_66
# %bb.65:                               #   in Loop: Header=BB0_1 Depth=1
	jmp	.LBB0_73
.LBB0_66:                               #   in Loop: Header=BB0_38 Depth=2
	cmpl	$0, -112(%rbp)
	jne	.LBB0_68
# %bb.67:                               #   in Loop: Header=BB0_38 Depth=2
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -192(%rbp)
	movq	-56(%rbp), %rax
	movq	(%rax), %rcx
	movq	-48(%rbp), %rax
	movq	%rcx, (%rax)
	movq	-192(%rbp), %rcx
	movq	-56(%rbp), %rax
	movq	%rcx, (%rax)
	jmp	.LBB0_72
.LBB0_68:                               #   in Loop: Header=BB0_38 Depth=2
	cmpl	$0, -116(%rbp)
	jne	.LBB0_70
# %bb.69:                               #   in Loop: Header=BB0_38 Depth=2
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -196(%rbp)
	movq	-56(%rbp), %rax
	movl	(%rax), %ecx
	movq	-48(%rbp), %rax
	movl	%ecx, (%rax)
	movl	-196(%rbp), %ecx
	movq	-56(%rbp), %rax
	movl	%ecx, (%rax)
	jmp	.LBB0_71
.LBB0_70:                               #   in Loop: Header=BB0_38 Depth=2
	movq	-48(%rbp), %rdi
	movq	-56(%rbp), %rsi
	movq	-24(%rbp), %rax
	movl	%eax, %edx
	movl	-112(%rbp), %ecx
	movl	-116(%rbp), %r8d
	callq	swapfunc
.LBB0_71:                               #   in Loop: Header=BB0_38 Depth=2
	jmp	.LBB0_72
.LBB0_72:                               #   in Loop: Header=BB0_38 Depth=2
	movl	$1, -120(%rbp)
	movq	-24(%rbp), %rax
	addq	-48(%rbp), %rax
	movq	%rax, -48(%rbp)
	movq	-24(%rbp), %rdx
	movq	-56(%rbp), %rax
	xorl	%ecx, %ecx
                                        # kill: def $rcx killed $ecx
	subq	%rdx, %rcx
	addq	%rcx, %rax
	movq	%rax, -56(%rbp)
	jmp	.LBB0_38
.LBB0_73:                               #   in Loop: Header=BB0_1 Depth=1
	cmpl	$0, -120(%rbp)
	jne	.LBB0_91
# %bb.74:
	movq	-8(%rbp), %rax
	addq	-24(%rbp), %rax
	movq	%rax, -80(%rbp)
.LBB0_75:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_77 Depth 2
	movq	-80(%rbp), %rax
	movq	-8(%rbp), %rcx
	movq	-16(%rbp), %rdx
	imulq	-24(%rbp), %rdx
	addq	%rdx, %rcx
	cmpq	%rcx, %rax
	jae	.LBB0_90
# %bb.76:                               #   in Loop: Header=BB0_75 Depth=1
	movq	-80(%rbp), %rax
	movq	%rax, -72(%rbp)
.LBB0_77:                               #   Parent Loop BB0_75 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	-72(%rbp), %rcx
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	cmpq	-8(%rbp), %rcx
	movb	%al, -224(%rbp)                 # 1-byte Spill
	jbe	.LBB0_79
# %bb.78:                               #   in Loop: Header=BB0_77 Depth=2
	movq	-32(%rbp), %rax
	movq	-72(%rbp), %rdi
	xorl	%ecx, %ecx
                                        # kill: def $rcx killed $ecx
	subq	-24(%rbp), %rcx
	addq	%rcx, %rdi
	movq	-72(%rbp), %rsi
	callq	*%rax
	cmpl	$0, %eax
	setg	%al
	movb	%al, -224(%rbp)                 # 1-byte Spill
.LBB0_79:                               #   in Loop: Header=BB0_77 Depth=2
	movb	-224(%rbp), %al                 # 1-byte Reload
	testb	$1, %al
	jne	.LBB0_80
	jmp	.LBB0_88
.LBB0_80:                               #   in Loop: Header=BB0_77 Depth=2
	cmpl	$0, -112(%rbp)
	jne	.LBB0_82
# %bb.81:                               #   in Loop: Header=BB0_77 Depth=2
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -208(%rbp)
	movq	-72(%rbp), %rax
	xorl	%ecx, %ecx
                                        # kill: def $rcx killed $ecx
	subq	-24(%rbp), %rcx
	movq	(%rax,%rcx), %rcx
	movq	-72(%rbp), %rax
	movq	%rcx, (%rax)
	movq	-208(%rbp), %rdx
	movq	-72(%rbp), %rax
	xorl	%ecx, %ecx
                                        # kill: def $rcx killed $ecx
	subq	-24(%rbp), %rcx
	movq	%rdx, (%rax,%rcx)
	jmp	.LBB0_86
.LBB0_82:                               #   in Loop: Header=BB0_77 Depth=2
	cmpl	$0, -116(%rbp)
	jne	.LBB0_84
# %bb.83:                               #   in Loop: Header=BB0_77 Depth=2
	movq	-72(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -212(%rbp)
	movq	-72(%rbp), %rax
	xorl	%ecx, %ecx
                                        # kill: def $rcx killed $ecx
	subq	-24(%rbp), %rcx
	movl	(%rax,%rcx), %ecx
	movq	-72(%rbp), %rax
	movl	%ecx, (%rax)
	movl	-212(%rbp), %edx
	movq	-72(%rbp), %rax
	xorl	%ecx, %ecx
                                        # kill: def $rcx killed $ecx
	subq	-24(%rbp), %rcx
	movl	%edx, (%rax,%rcx)
	jmp	.LBB0_85
.LBB0_84:                               #   in Loop: Header=BB0_77 Depth=2
	movq	-72(%rbp), %rdi
	movq	-72(%rbp), %rsi
	xorl	%eax, %eax
                                        # kill: def $rax killed $eax
	subq	-24(%rbp), %rax
	addq	%rax, %rsi
	movq	-24(%rbp), %rax
	movl	%eax, %edx
	movl	-112(%rbp), %ecx
	movl	-116(%rbp), %r8d
	callq	swapfunc
.LBB0_85:                               #   in Loop: Header=BB0_77 Depth=2
	jmp	.LBB0_86
.LBB0_86:                               #   in Loop: Header=BB0_77 Depth=2
	jmp	.LBB0_87
.LBB0_87:                               #   in Loop: Header=BB0_77 Depth=2
	movq	-24(%rbp), %rdx
	movq	-72(%rbp), %rax
	xorl	%ecx, %ecx
                                        # kill: def $rcx killed $ecx
	subq	%rdx, %rcx
	addq	%rcx, %rax
	movq	%rax, -72(%rbp)
	jmp	.LBB0_77
.LBB0_88:                               #   in Loop: Header=BB0_75 Depth=1
	jmp	.LBB0_89
.LBB0_89:                               #   in Loop: Header=BB0_75 Depth=1
	movq	-24(%rbp), %rax
	addq	-80(%rbp), %rax
	movq	%rax, -80(%rbp)
	jmp	.LBB0_75
.LBB0_90:
	jmp	.LBB0_105
.LBB0_91:                               #   in Loop: Header=BB0_1 Depth=1
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rcx
	imulq	-24(%rbp), %rcx
	addq	%rcx, %rax
	movq	%rax, -88(%rbp)
	movq	-40(%rbp), %rax
	movq	-8(%rbp), %rcx
	subq	%rcx, %rax
	movq	-48(%rbp), %rcx
	movq	-40(%rbp), %rdx
	subq	%rdx, %rcx
	cmpq	%rcx, %rax
	jge	.LBB0_93
# %bb.92:                               #   in Loop: Header=BB0_1 Depth=1
	movq	-40(%rbp), %rax
	movq	-8(%rbp), %rcx
	subq	%rcx, %rax
	movq	%rax, -232(%rbp)                # 8-byte Spill
	jmp	.LBB0_94
.LBB0_93:                               #   in Loop: Header=BB0_1 Depth=1
	movq	-48(%rbp), %rax
	movq	-40(%rbp), %rcx
	subq	%rcx, %rax
	movq	%rax, -232(%rbp)                # 8-byte Spill
.LBB0_94:                               #   in Loop: Header=BB0_1 Depth=1
	movq	-232(%rbp), %rax                # 8-byte Reload
	movq	%rax, -104(%rbp)
	cmpq	$0, -104(%rbp)
	jbe	.LBB0_96
# %bb.95:                               #   in Loop: Header=BB0_1 Depth=1
	movq	-8(%rbp), %rdi
	movq	-48(%rbp), %rsi
	xorl	%eax, %eax
                                        # kill: def $rax killed $eax
	subq	-104(%rbp), %rax
	addq	%rax, %rsi
	movq	-104(%rbp), %rax
	movl	%eax, %edx
	movl	-112(%rbp), %ecx
	movl	-116(%rbp), %r8d
	callq	swapfunc
.LBB0_96:                               #   in Loop: Header=BB0_1 Depth=1
	movq	-64(%rbp), %rax
	movq	-56(%rbp), %rcx
	subq	%rcx, %rax
	movq	-88(%rbp), %rcx
	movq	-64(%rbp), %rdx
	subq	%rdx, %rcx
	subq	-24(%rbp), %rcx
	cmpq	%rcx, %rax
	jae	.LBB0_98
# %bb.97:                               #   in Loop: Header=BB0_1 Depth=1
	movq	-64(%rbp), %rax
	movq	-56(%rbp), %rcx
	subq	%rcx, %rax
	movq	%rax, -240(%rbp)                # 8-byte Spill
	jmp	.LBB0_99
.LBB0_98:                               #   in Loop: Header=BB0_1 Depth=1
	movq	-88(%rbp), %rax
	movq	-64(%rbp), %rcx
	subq	%rcx, %rax
	subq	-24(%rbp), %rax
	movq	%rax, -240(%rbp)                # 8-byte Spill
.LBB0_99:                               #   in Loop: Header=BB0_1 Depth=1
	movq	-240(%rbp), %rax                # 8-byte Reload
	movq	%rax, -104(%rbp)
	cmpq	$0, -104(%rbp)
	jbe	.LBB0_101
# %bb.100:                              #   in Loop: Header=BB0_1 Depth=1
	movq	-48(%rbp), %rdi
	movq	-88(%rbp), %rsi
	xorl	%eax, %eax
                                        # kill: def $rax killed $eax
	subq	-104(%rbp), %rax
	addq	%rax, %rsi
	movq	-104(%rbp), %rax
	movl	%eax, %edx
	movl	-112(%rbp), %ecx
	movl	-116(%rbp), %r8d
	callq	swapfunc
.LBB0_101:                              #   in Loop: Header=BB0_1 Depth=1
	movq	-48(%rbp), %rax
	movq	-40(%rbp), %rcx
	subq	%rcx, %rax
	movq	%rax, -104(%rbp)
	cmpq	-24(%rbp), %rax
	jbe	.LBB0_103
# %bb.102:                              #   in Loop: Header=BB0_1 Depth=1
	movq	-8(%rbp), %rdi
	movq	-104(%rbp), %rax
	xorl	%ecx, %ecx
	movl	%ecx, %edx
	divq	-24(%rbp)
	movq	%rax, %rsi
	movq	-24(%rbp), %rdx
	movq	-32(%rbp), %rcx
	callq	qsort
.LBB0_103:                              #   in Loop: Header=BB0_1 Depth=1
	movq	-64(%rbp), %rax
	movq	-56(%rbp), %rcx
	subq	%rcx, %rax
	movq	%rax, -104(%rbp)
	cmpq	-24(%rbp), %rax
	jbe	.LBB0_105
# %bb.104:                              #   in Loop: Header=BB0_1 Depth=1
	movq	-88(%rbp), %rax
	xorl	%ecx, %ecx
                                        # kill: def $rcx killed $ecx
	subq	-104(%rbp), %rcx
	addq	%rcx, %rax
	movq	%rax, -8(%rbp)
	movq	-104(%rbp), %rax
	xorl	%ecx, %ecx
	movl	%ecx, %edx
	divq	-24(%rbp)
	movq	%rax, -16(%rbp)
	jmp	.LBB0_1
.LBB0_105:
	addq	$240, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	qsort, .Lfunc_end0-qsort
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function swapfunc
	.type	swapfunc,@function
swapfunc:                               # @swapfunc
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	movl	%ecx, -24(%rbp)
	movl	%r8d, -28(%rbp)
	cmpl	$1, -24(%rbp)
	jg	.LBB1_5
# %bb.1:
	movslq	-20(%rbp), %rax
	shrq	$3, %rax
	movq	%rax, -40(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -48(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -56(%rbp)
.LBB1_2:                                # =>This Inner Loop Header: Depth=1
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -64(%rbp)
	movq	-56(%rbp), %rax
	movq	(%rax), %rcx
	movq	-48(%rbp), %rax
	movq	%rax, %rdx
	addq	$8, %rdx
	movq	%rdx, -48(%rbp)
	movq	%rcx, (%rax)
	movq	-64(%rbp), %rcx
	movq	-56(%rbp), %rax
	movq	%rax, %rdx
	addq	$8, %rdx
	movq	%rdx, -56(%rbp)
	movq	%rcx, (%rax)
# %bb.3:                                #   in Loop: Header=BB1_2 Depth=1
	movq	-40(%rbp), %rax
	addq	$-1, %rax
	movq	%rax, -40(%rbp)
	cmpq	$0, %rax
	jg	.LBB1_2
# %bb.4:
	jmp	.LBB1_15
.LBB1_5:
	cmpl	$1, -28(%rbp)
	jg	.LBB1_10
# %bb.6:
	movslq	-20(%rbp), %rax
	shrq	$2, %rax
	movq	%rax, -72(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -80(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -88(%rbp)
.LBB1_7:                                # =>This Inner Loop Header: Depth=1
	movq	-80(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -92(%rbp)
	movq	-88(%rbp), %rax
	movl	(%rax), %ecx
	movq	-80(%rbp), %rax
	movq	%rax, %rdx
	addq	$4, %rdx
	movq	%rdx, -80(%rbp)
	movl	%ecx, (%rax)
	movl	-92(%rbp), %ecx
	movq	-88(%rbp), %rax
	movq	%rax, %rdx
	addq	$4, %rdx
	movq	%rdx, -88(%rbp)
	movl	%ecx, (%rax)
# %bb.8:                                #   in Loop: Header=BB1_7 Depth=1
	movq	-72(%rbp), %rax
	addq	$-1, %rax
	movq	%rax, -72(%rbp)
	cmpq	$0, %rax
	jg	.LBB1_7
# %bb.9:
	jmp	.LBB1_14
.LBB1_10:
	movslq	-20(%rbp), %rax
	shrq	$0, %rax
	movq	%rax, -104(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -112(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -120(%rbp)
.LBB1_11:                               # =>This Inner Loop Header: Depth=1
	movq	-112(%rbp), %rax
	movb	(%rax), %al
	movb	%al, -121(%rbp)
	movq	-120(%rbp), %rax
	movb	(%rax), %cl
	movq	-112(%rbp), %rax
	movq	%rax, %rdx
	addq	$1, %rdx
	movq	%rdx, -112(%rbp)
	movb	%cl, (%rax)
	movb	-121(%rbp), %cl
	movq	-120(%rbp), %rax
	movq	%rax, %rdx
	addq	$1, %rdx
	movq	%rdx, -120(%rbp)
	movb	%cl, (%rax)
# %bb.12:                               #   in Loop: Header=BB1_11 Depth=1
	movq	-104(%rbp), %rax
	addq	$-1, %rax
	movq	%rax, -104(%rbp)
	cmpq	$0, %rax
	jg	.LBB1_11
# %bb.13:
	jmp	.LBB1_14
.LBB1_14:
	jmp	.LBB1_15
.LBB1_15:
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	swapfunc, .Lfunc_end1-swapfunc
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function med3
	.type	med3,@function
med3:                                   # @med3
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$80, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rsi
	callq	*%rax
	cmpl	$0, %eax
	jge	.LBB2_8
# %bb.1:
	movq	-32(%rbp), %rax
	movq	-16(%rbp), %rdi
	movq	-24(%rbp), %rsi
	callq	*%rax
	cmpl	$0, %eax
	jge	.LBB2_3
# %bb.2:
	movq	-16(%rbp), %rax
	movq	%rax, -40(%rbp)                 # 8-byte Spill
	jmp	.LBB2_7
.LBB2_3:
	movq	-32(%rbp), %rax
	movq	-8(%rbp), %rdi
	movq	-24(%rbp), %rsi
	callq	*%rax
	cmpl	$0, %eax
	jge	.LBB2_5
# %bb.4:
	movq	-24(%rbp), %rax
	movq	%rax, -48(%rbp)                 # 8-byte Spill
	jmp	.LBB2_6
.LBB2_5:
	movq	-8(%rbp), %rax
	movq	%rax, -48(%rbp)                 # 8-byte Spill
.LBB2_6:
	movq	-48(%rbp), %rax                 # 8-byte Reload
	movq	%rax, -40(%rbp)                 # 8-byte Spill
.LBB2_7:
	movq	-40(%rbp), %rax                 # 8-byte Reload
	movq	%rax, -56(%rbp)                 # 8-byte Spill
	jmp	.LBB2_15
.LBB2_8:
	movq	-32(%rbp), %rax
	movq	-16(%rbp), %rdi
	movq	-24(%rbp), %rsi
	callq	*%rax
	cmpl	$0, %eax
	jle	.LBB2_10
# %bb.9:
	movq	-16(%rbp), %rax
	movq	%rax, -64(%rbp)                 # 8-byte Spill
	jmp	.LBB2_14
.LBB2_10:
	movq	-32(%rbp), %rax
	movq	-8(%rbp), %rdi
	movq	-24(%rbp), %rsi
	callq	*%rax
	cmpl	$0, %eax
	jge	.LBB2_12
# %bb.11:
	movq	-8(%rbp), %rax
	movq	%rax, -72(%rbp)                 # 8-byte Spill
	jmp	.LBB2_13
.LBB2_12:
	movq	-24(%rbp), %rax
	movq	%rax, -72(%rbp)                 # 8-byte Spill
.LBB2_13:
	movq	-72(%rbp), %rax                 # 8-byte Reload
	movq	%rax, -64(%rbp)                 # 8-byte Spill
.LBB2_14:
	movq	-64(%rbp), %rax                 # 8-byte Reload
	movq	%rax, -56(%rbp)                 # 8-byte Spill
.LBB2_15:
	movq	-56(%rbp), %rax                 # 8-byte Reload
	addq	$80, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	med3, .Lfunc_end2-med3
	.cfi_endproc
                                        # -- End function
	.globl	compare                         # -- Begin function compare
	.p2align	4, 0x90
	.type	compare,@function
compare:                                # @compare
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
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movq	-32(%rbp), %rcx
	subl	(%rcx), %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end3:
	.size	compare, .Lfunc_end3-compare
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
.LBB4_1:                                # =>This Inner Loop Header: Depth=1
	movl	-16(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jge	.LBB4_4
# %bb.2:                                #   in Loop: Header=BB4_1 Depth=1
	movq	-8(%rbp), %rax
	movslq	-16(%rbp), %rcx
	movl	(%rax,%rcx,4), %esi
	leaq	.L.str(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
# %bb.3:                                #   in Loop: Header=BB4_1 Depth=1
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -16(%rbp)
	jmp	.LBB4_1
.LBB4_4:
	leaq	.L.str.1(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end4:
	.size	printArray, .Lfunc_end4-printArray
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
	subq	$32, %rsp
	movl	$0, -4(%rbp)
	movl	$40004, %edi                    # imm = 0x9C44
	callq	malloc@PLT
	movq	%rax, -16(%rbp)
	movl	$1, -20(%rbp)
	movl	$10001, -24(%rbp)               # imm = 0x2711
.LBB5_1:                                # =>This Inner Loop Header: Depth=1
	cmpl	$0, -24(%rbp)
	jl	.LBB5_4
# %bb.2:                                #   in Loop: Header=BB5_1 Depth=1
	movl	-24(%rbp), %edx
	movq	-16(%rbp), %rax
	movslq	-24(%rbp), %rcx
	movl	%edx, (%rax,%rcx,4)
# %bb.3:                                #   in Loop: Header=BB5_1 Depth=1
	movl	-24(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, -24(%rbp)
	jmp	.LBB5_1
.LBB5_4:
	movq	-16(%rbp), %rdi
	movl	$10001, %esi                    # imm = 0x2711
	movl	$4, %edx
	leaq	compare(%rip), %rcx
	callq	qsort
	movq	-16(%rbp), %rdi
	movl	$10001, %esi                    # imm = 0x2711
	callq	printArray
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end5:
	.size	main, .Lfunc_end5-main
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
	.addrsig_sym qsort
	.addrsig_sym swapfunc
	.addrsig_sym med3
	.addrsig_sym compare
	.addrsig_sym printArray
	.addrsig_sym printf
	.addrsig_sym malloc
