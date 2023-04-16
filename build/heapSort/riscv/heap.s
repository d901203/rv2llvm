	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0"
	.file	"heap.c"
	.globl	swap                            # -- Begin function swap
	.p2align	2
	.type	swap,@function
swap:                                   # @swap
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -48
	.cfi_def_cfa_offset 48
	sd	ra, 40(sp)                      # 8-byte Folded Spill
	sd	s0, 32(sp)                      # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	addi	s0, sp, 48
	.cfi_def_cfa s0, 0
	sd	a0, -24(s0)
	sd	a1, -32(s0)
	ld	a0, -24(s0)
	lw	a0, 0(a0)
	sw	a0, -36(s0)
	ld	a0, -32(s0)
	lw	a0, 0(a0)
	ld	a1, -24(s0)
	sw	a0, 0(a1)
	lw	a0, -36(s0)
	ld	a1, -32(s0)
	sw	a0, 0(a1)
	ld	ra, 40(sp)                      # 8-byte Folded Reload
	ld	s0, 32(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 48
	ret
.Lfunc_end0:
	.size	swap, .Lfunc_end0-swap
	.cfi_endproc
                                        # -- End function
	.globl	heapify                         # -- Begin function heapify
	.p2align	2
	.type	heapify,@function
heapify:                                # @heapify
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -48
	.cfi_def_cfa_offset 48
	sd	ra, 40(sp)                      # 8-byte Folded Spill
	sd	s0, 32(sp)                      # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	addi	s0, sp, 48
	.cfi_def_cfa s0, 0
                                        # kill: def $x13 killed $x12
                                        # kill: def $x13 killed $x11
	sd	a0, -24(s0)
	sw	a1, -28(s0)
	sw	a2, -32(s0)
	lw	a0, -32(s0)
	sw	a0, -36(s0)
	lw	a0, -32(s0)
	slli	a0, a0, 1
	addi	a0, a0, 1
	sw	a0, -40(s0)
	lw	a0, -32(s0)
	slliw	a0, a0, 1
	addiw	a0, a0, 2
	sw	a0, -44(s0)
	lw	a0, -40(s0)
	lw	a1, -28(s0)
	bge	a0, a1, .LBB1_3
	j	.LBB1_1
.LBB1_1:
	ld	a0, -24(s0)
	lw	a1, -40(s0)
	slli	a1, a1, 2
	add	a1, a0, a1
	lw	a1, 0(a1)
	lw	a2, -36(s0)
	slli	a2, a2, 2
	add	a0, a0, a2
	lw	a0, 0(a0)
	bge	a0, a1, .LBB1_3
	j	.LBB1_2
.LBB1_2:
	lw	a0, -40(s0)
	sw	a0, -36(s0)
	j	.LBB1_3
.LBB1_3:
	lw	a0, -44(s0)
	lw	a1, -28(s0)
	bge	a0, a1, .LBB1_6
	j	.LBB1_4
.LBB1_4:
	ld	a0, -24(s0)
	lw	a1, -44(s0)
	slli	a1, a1, 2
	add	a1, a0, a1
	lw	a1, 0(a1)
	lw	a2, -36(s0)
	slli	a2, a2, 2
	add	a0, a0, a2
	lw	a0, 0(a0)
	bge	a0, a1, .LBB1_6
	j	.LBB1_5
.LBB1_5:
	lw	a0, -44(s0)
	sw	a0, -36(s0)
	j	.LBB1_6
.LBB1_6:
	lw	a0, -36(s0)
	lw	a1, -32(s0)
	beq	a0, a1, .LBB1_8
	j	.LBB1_7
.LBB1_7:
	ld	a1, -24(s0)
	lw	a0, -32(s0)
	slli	a0, a0, 2
	add	a0, a1, a0
	lw	a2, -36(s0)
	slli	a2, a2, 2
	add	a1, a1, a2
	call	swap
	ld	a0, -24(s0)
	lw	a1, -28(s0)
	lw	a2, -36(s0)
	call	heapify
	j	.LBB1_8
.LBB1_8:
	ld	ra, 40(sp)                      # 8-byte Folded Reload
	ld	s0, 32(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 48
	ret
.Lfunc_end1:
	.size	heapify, .Lfunc_end1-heapify
	.cfi_endproc
                                        # -- End function
	.globl	heapSort                        # -- Begin function heapSort
	.p2align	2
	.type	heapSort,@function
heapSort:                               # @heapSort
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -48
	.cfi_def_cfa_offset 48
	sd	ra, 40(sp)                      # 8-byte Folded Spill
	sd	s0, 32(sp)                      # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	addi	s0, sp, 48
	.cfi_def_cfa s0, 0
                                        # kill: def $x12 killed $x11
	sd	a0, -24(s0)
	sw	a1, -28(s0)
	lw	a0, -28(s0)
	srliw	a1, a0, 31
	addw	a0, a0, a1
	sraiw	a0, a0, 1
	addiw	a0, a0, -1
	sw	a0, -32(s0)
	j	.LBB2_1
.LBB2_1:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -32(s0)
	bltz	a0, .LBB2_4
	j	.LBB2_2
.LBB2_2:                                #   in Loop: Header=BB2_1 Depth=1
	ld	a0, -24(s0)
	lw	a1, -28(s0)
	lw	a2, -32(s0)
	call	heapify
	j	.LBB2_3
.LBB2_3:                                #   in Loop: Header=BB2_1 Depth=1
	lw	a0, -32(s0)
	addiw	a0, a0, -1
	sw	a0, -32(s0)
	j	.LBB2_1
.LBB2_4:
	lw	a0, -28(s0)
	addiw	a0, a0, -1
	sw	a0, -36(s0)
	j	.LBB2_5
.LBB2_5:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -36(s0)
	bltz	a0, .LBB2_8
	j	.LBB2_6
.LBB2_6:                                #   in Loop: Header=BB2_5 Depth=1
	ld	a0, -24(s0)
	lw	a1, -36(s0)
	slli	a1, a1, 2
	add	a1, a0, a1
	call	swap
	ld	a0, -24(s0)
	lw	a1, -36(s0)
	li	a2, 0
	call	heapify
	j	.LBB2_7
.LBB2_7:                                #   in Loop: Header=BB2_5 Depth=1
	lw	a0, -36(s0)
	addiw	a0, a0, -1
	sw	a0, -36(s0)
	j	.LBB2_5
.LBB2_8:
	ld	ra, 40(sp)                      # 8-byte Folded Reload
	ld	s0, 32(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 48
	ret
.Lfunc_end2:
	.size	heapSort, .Lfunc_end2-heapSort
	.cfi_endproc
                                        # -- End function
	.globl	printArray                      # -- Begin function printArray
	.p2align	2
	.type	printArray,@function
printArray:                             # @printArray
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sd	ra, 24(sp)                      # 8-byte Folded Spill
	sd	s0, 16(sp)                      # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
                                        # kill: def $x12 killed $x11
	sd	a0, -24(s0)
	sw	a1, -28(s0)
	li	a0, 0
	sw	a0, -32(s0)
	j	.LBB3_1
.LBB3_1:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -32(s0)
	lw	a1, -28(s0)
	bge	a0, a1, .LBB3_4
	j	.LBB3_2
.LBB3_2:                                #   in Loop: Header=BB3_1 Depth=1
	ld	a0, -24(s0)
	lw	a1, -32(s0)
	slli	a1, a1, 2
	add	a0, a0, a1
	lw	a1, 0(a0)
	lui	a0, %hi(.L.str)
	addi	a0, a0, %lo(.L.str)
	call	printf
	j	.LBB3_3
.LBB3_3:                                #   in Loop: Header=BB3_1 Depth=1
	lw	a0, -32(s0)
	addiw	a0, a0, 1
	sw	a0, -32(s0)
	j	.LBB3_1
.LBB3_4:
	lui	a0, %hi(.L.str.1)
	addi	a0, a0, %lo(.L.str.1)
	call	printf
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 32
	ret
.Lfunc_end3:
	.size	printArray, .Lfunc_end3-printArray
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -64
	.cfi_def_cfa_offset 64
	sd	ra, 56(sp)                      # 8-byte Folded Spill
	sd	s0, 48(sp)                      # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	addi	s0, sp, 64
	.cfi_def_cfa s0, 0
	li	a0, 0
	sw	a0, -20(s0)
	lui	a0, 2
	addiw	a0, a0, 1809
	sw	a0, -24(s0)
	lwu	a0, -24(s0)
	mv	a1, sp
	sd	a1, -32(s0)
	slli	a1, a0, 2
	addi	a1, a1, 15
	andi	a2, a1, -16
	mv	a1, sp
	sub	a1, a1, a2
	sd	a1, -56(s0)                     # 8-byte Folded Spill
	mv	sp, a1
	sd	a0, -40(s0)
	lw	a0, -24(s0)
	addiw	a0, a0, -1
	sw	a0, -44(s0)
	j	.LBB4_1
.LBB4_1:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -44(s0)
	bltz	a0, .LBB4_4
	j	.LBB4_2
.LBB4_2:                                #   in Loop: Header=BB4_1 Depth=1
	ld	a1, -56(s0)                     # 8-byte Folded Reload
	lw	a0, -44(s0)
	slli	a2, a0, 2
	add	a1, a1, a2
	sw	a0, 0(a1)
	j	.LBB4_3
.LBB4_3:                                #   in Loop: Header=BB4_1 Depth=1
	lw	a0, -44(s0)
	addiw	a0, a0, -1
	sw	a0, -44(s0)
	j	.LBB4_1
.LBB4_4:
	ld	a0, -56(s0)                     # 8-byte Folded Reload
	lw	a1, -24(s0)
	call	heapSort
	lui	a0, %hi(.L.str.2)
	addi	a0, a0, %lo(.L.str.2)
	call	printf
                                        # kill: def $x11 killed $x10
	ld	a0, -56(s0)                     # 8-byte Folded Reload
	lw	a1, -24(s0)
	call	printArray
	ld	a0, -32(s0)
	mv	sp, a0
	lw	a0, -20(s0)
	addi	sp, s0, -64
	ld	ra, 56(sp)                      # 8-byte Folded Reload
	ld	s0, 48(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 64
	ret
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

	.ident	"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 2db031528e3e0e2d6ab6087af9bae9e0ccbdfc06)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym swap
	.addrsig_sym heapify
	.addrsig_sym heapSort
	.addrsig_sym printArray
	.addrsig_sym printf
