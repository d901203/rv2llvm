	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0"
	.file	"merge.c"
	.globl	merge                           # -- Begin function merge
	.p2align	2
	.type	merge,@function
merge:                                  # @merge
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -112
	.cfi_def_cfa_offset 112
	sd	ra, 104(sp)                     # 8-byte Folded Spill
	sd	s0, 96(sp)                      # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	addi	s0, sp, 112
	.cfi_def_cfa s0, 0
                                        # kill: def $x14 killed $x13
                                        # kill: def $x14 killed $x12
                                        # kill: def $x14 killed $x11
	sd	a0, -24(s0)
	sw	a1, -28(s0)
	sw	a2, -32(s0)
	sw	a3, -36(s0)
	lw	a0, -32(s0)
	lw	a1, -28(s0)
	subw	a0, a0, a1
	addiw	a0, a0, 1
	sw	a0, -52(s0)
	lw	a0, -36(s0)
	lw	a1, -32(s0)
	subw	a0, a0, a1
	sw	a0, -56(s0)
	lwu	a0, -52(s0)
	mv	a1, sp
	sd	a1, -64(s0)
	slli	a1, a0, 2
	addi	a1, a1, 15
	andi	a2, a1, -16
	mv	a1, sp
	sub	a1, a1, a2
	sd	a1, -96(s0)                     # 8-byte Folded Spill
	mv	sp, a1
	sd	a0, -72(s0)
	lwu	a0, -56(s0)
	slli	a1, a0, 2
	addi	a1, a1, 15
	andi	a2, a1, -16
	mv	a1, sp
	sub	a1, a1, a2
	sd	a1, -88(s0)                     # 8-byte Folded Spill
	mv	sp, a1
	sd	a0, -80(s0)
	li	a0, 0
	sw	a0, -40(s0)
	j	.LBB0_1
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -40(s0)
	lw	a1, -52(s0)
	bge	a0, a1, .LBB0_4
	j	.LBB0_2
.LBB0_2:                                #   in Loop: Header=BB0_1 Depth=1
	ld	a1, -96(s0)                     # 8-byte Folded Reload
	ld	a0, -24(s0)
	lw	a3, -28(s0)
	lw	a2, -40(s0)
	addw	a3, a3, a2
	slli	a3, a3, 2
	add	a0, a0, a3
	lw	a0, 0(a0)
	slli	a2, a2, 2
	add	a1, a1, a2
	sw	a0, 0(a1)
	j	.LBB0_3
.LBB0_3:                                #   in Loop: Header=BB0_1 Depth=1
	lw	a0, -40(s0)
	addiw	a0, a0, 1
	sw	a0, -40(s0)
	j	.LBB0_1
.LBB0_4:
	li	a0, 0
	sw	a0, -44(s0)
	j	.LBB0_5
.LBB0_5:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -44(s0)
	lw	a1, -56(s0)
	bge	a0, a1, .LBB0_8
	j	.LBB0_6
.LBB0_6:                                #   in Loop: Header=BB0_5 Depth=1
	ld	a1, -88(s0)                     # 8-byte Folded Reload
	ld	a0, -24(s0)
	lw	a3, -32(s0)
	lw	a2, -44(s0)
	addw	a3, a3, a2
	addiw	a3, a3, 1
	slli	a3, a3, 2
	add	a0, a0, a3
	lw	a0, 0(a0)
	slli	a2, a2, 2
	add	a1, a1, a2
	sw	a0, 0(a1)
	j	.LBB0_7
.LBB0_7:                                #   in Loop: Header=BB0_5 Depth=1
	lw	a0, -44(s0)
	addiw	a0, a0, 1
	sw	a0, -44(s0)
	j	.LBB0_5
.LBB0_8:
	li	a0, 0
	sw	a0, -40(s0)
	sw	a0, -44(s0)
	lw	a0, -28(s0)
	sw	a0, -48(s0)
	j	.LBB0_9
.LBB0_9:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -40(s0)
	lw	a1, -52(s0)
	li	a2, 0
	sd	a2, -104(s0)                    # 8-byte Folded Spill
	bge	a0, a1, .LBB0_11
	j	.LBB0_10
.LBB0_10:                               #   in Loop: Header=BB0_9 Depth=1
	lw	a0, -44(s0)
	lw	a1, -56(s0)
	slt	a0, a0, a1
	sd	a0, -104(s0)                    # 8-byte Folded Spill
	j	.LBB0_11
.LBB0_11:                               #   in Loop: Header=BB0_9 Depth=1
	ld	a0, -104(s0)                    # 8-byte Folded Reload
	andi	a0, a0, 1
	beqz	a0, .LBB0_16
	j	.LBB0_12
.LBB0_12:                               #   in Loop: Header=BB0_9 Depth=1
	ld	a0, -88(s0)                     # 8-byte Folded Reload
	ld	a1, -96(s0)                     # 8-byte Folded Reload
	lw	a2, -40(s0)
	slli	a2, a2, 2
	add	a1, a1, a2
	lw	a1, 0(a1)
	lw	a2, -44(s0)
	slli	a2, a2, 2
	add	a0, a0, a2
	lw	a0, 0(a0)
	blt	a0, a1, .LBB0_14
	j	.LBB0_13
.LBB0_13:                               #   in Loop: Header=BB0_9 Depth=1
	ld	a0, -96(s0)                     # 8-byte Folded Reload
	lw	a1, -40(s0)
	slli	a1, a1, 2
	add	a0, a0, a1
	lw	a0, 0(a0)
	ld	a1, -24(s0)
	lw	a2, -48(s0)
	slli	a2, a2, 2
	add	a1, a1, a2
	sw	a0, 0(a1)
	lw	a0, -40(s0)
	addiw	a0, a0, 1
	sw	a0, -40(s0)
	j	.LBB0_15
.LBB0_14:                               #   in Loop: Header=BB0_9 Depth=1
	ld	a0, -88(s0)                     # 8-byte Folded Reload
	lw	a1, -44(s0)
	slli	a1, a1, 2
	add	a0, a0, a1
	lw	a0, 0(a0)
	ld	a1, -24(s0)
	lw	a2, -48(s0)
	slli	a2, a2, 2
	add	a1, a1, a2
	sw	a0, 0(a1)
	lw	a0, -44(s0)
	addiw	a0, a0, 1
	sw	a0, -44(s0)
	j	.LBB0_15
.LBB0_15:                               #   in Loop: Header=BB0_9 Depth=1
	lw	a0, -48(s0)
	addiw	a0, a0, 1
	sw	a0, -48(s0)
	j	.LBB0_9
.LBB0_16:
	j	.LBB0_17
.LBB0_17:                               # =>This Inner Loop Header: Depth=1
	lw	a0, -40(s0)
	lw	a1, -52(s0)
	bge	a0, a1, .LBB0_19
	j	.LBB0_18
.LBB0_18:                               #   in Loop: Header=BB0_17 Depth=1
	ld	a0, -96(s0)                     # 8-byte Folded Reload
	lw	a1, -40(s0)
	slli	a1, a1, 2
	add	a0, a0, a1
	lw	a0, 0(a0)
	ld	a1, -24(s0)
	lw	a2, -48(s0)
	slli	a2, a2, 2
	add	a1, a1, a2
	sw	a0, 0(a1)
	lw	a0, -40(s0)
	addiw	a0, a0, 1
	sw	a0, -40(s0)
	lw	a0, -48(s0)
	addiw	a0, a0, 1
	sw	a0, -48(s0)
	j	.LBB0_17
.LBB0_19:
	j	.LBB0_20
.LBB0_20:                               # =>This Inner Loop Header: Depth=1
	lw	a0, -44(s0)
	lw	a1, -56(s0)
	bge	a0, a1, .LBB0_22
	j	.LBB0_21
.LBB0_21:                               #   in Loop: Header=BB0_20 Depth=1
	ld	a0, -88(s0)                     # 8-byte Folded Reload
	lw	a1, -44(s0)
	slli	a1, a1, 2
	add	a0, a0, a1
	lw	a0, 0(a0)
	ld	a1, -24(s0)
	lw	a2, -48(s0)
	slli	a2, a2, 2
	add	a1, a1, a2
	sw	a0, 0(a1)
	lw	a0, -44(s0)
	addiw	a0, a0, 1
	sw	a0, -44(s0)
	lw	a0, -48(s0)
	addiw	a0, a0, 1
	sw	a0, -48(s0)
	j	.LBB0_20
.LBB0_22:
	ld	a0, -64(s0)
	mv	sp, a0
	addi	sp, s0, -112
	ld	ra, 104(sp)                     # 8-byte Folded Reload
	ld	s0, 96(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 112
	ret
.Lfunc_end0:
	.size	merge, .Lfunc_end0-merge
	.cfi_endproc
                                        # -- End function
	.globl	mergeSort                       # -- Begin function mergeSort
	.p2align	2
	.type	mergeSort,@function
mergeSort:                              # @mergeSort
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
	lw	a0, -28(s0)
	lw	a1, -32(s0)
	bge	a0, a1, .LBB1_2
	j	.LBB1_1
.LBB1_1:
	lw	a0, -28(s0)
	lw	a1, -32(s0)
	subw	a1, a1, a0
	srliw	a2, a1, 31
	addw	a1, a1, a2
	sraiw	a1, a1, 1
	addw	a0, a0, a1
	sw	a0, -36(s0)
	ld	a0, -24(s0)
	lw	a1, -28(s0)
	lw	a2, -36(s0)
	call	mergeSort
	ld	a0, -24(s0)
	lw	a1, -36(s0)
	addiw	a1, a1, 1
	lw	a2, -32(s0)
	call	mergeSort
	ld	a0, -24(s0)
	lw	a1, -28(s0)
	lw	a2, -36(s0)
	lw	a3, -32(s0)
	call	merge
	j	.LBB1_2
.LBB1_2:
	ld	ra, 40(sp)                      # 8-byte Folded Reload
	ld	s0, 32(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 48
	ret
.Lfunc_end1:
	.size	mergeSort, .Lfunc_end1-mergeSort
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
	j	.LBB2_1
.LBB2_1:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -32(s0)
	lw	a1, -28(s0)
	bge	a0, a1, .LBB2_4
	j	.LBB2_2
.LBB2_2:                                #   in Loop: Header=BB2_1 Depth=1
	ld	a0, -24(s0)
	lw	a1, -32(s0)
	slli	a1, a1, 2
	add	a0, a0, a1
	lw	a1, 0(a0)
	lui	a0, %hi(.L.str)
	addi	a0, a0, %lo(.L.str)
	call	printf
	j	.LBB2_3
.LBB2_3:                                #   in Loop: Header=BB2_1 Depth=1
	lw	a0, -32(s0)
	addiw	a0, a0, 1
	sw	a0, -32(s0)
	j	.LBB2_1
.LBB2_4:
	lui	a0, %hi(.L.str.1)
	addi	a0, a0, %lo(.L.str.1)
	call	printf
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 32
	ret
.Lfunc_end2:
	.size	printArray, .Lfunc_end2-printArray
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
	j	.LBB3_1
.LBB3_1:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -44(s0)
	bltz	a0, .LBB3_4
	j	.LBB3_2
.LBB3_2:                                #   in Loop: Header=BB3_1 Depth=1
	ld	a1, -56(s0)                     # 8-byte Folded Reload
	lw	a0, -44(s0)
	slli	a2, a0, 2
	add	a1, a1, a2
	sw	a0, 0(a1)
	j	.LBB3_3
.LBB3_3:                                #   in Loop: Header=BB3_1 Depth=1
	lw	a0, -44(s0)
	addiw	a0, a0, -1
	sw	a0, -44(s0)
	j	.LBB3_1
.LBB3_4:
	ld	a0, -56(s0)                     # 8-byte Folded Reload
	lw	a1, -24(s0)
	addiw	a2, a1, -1
	li	a1, 0
	sd	a1, -64(s0)                     # 8-byte Folded Spill
	call	mergeSort
	lui	a0, %hi(.L.str.2)
	addi	a0, a0, %lo(.L.str.2)
	call	printf
                                        # kill: def $x11 killed $x10
	ld	a0, -56(s0)                     # 8-byte Folded Reload
	lw	a1, -24(s0)
	call	printArray
	ld	a0, -64(s0)                     # 8-byte Folded Reload
	sw	a0, -20(s0)
	ld	a0, -32(s0)
	mv	sp, a0
	lw	a0, -20(s0)
	addi	sp, s0, -64
	ld	ra, 56(sp)                      # 8-byte Folded Reload
	ld	s0, 48(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 64
	ret
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

	.ident	"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 2db031528e3e0e2d6ab6087af9bae9e0ccbdfc06)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym merge
	.addrsig_sym mergeSort
	.addrsig_sym printArray
	.addrsig_sym printf
