	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0"
	.file	"insertion.c"
	.globl	insertionSort                   # -- Begin function insertionSort
	.p2align	2
	.type	insertionSort,@function
insertionSort:                          # @insertionSort
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
	li	a0, 1
	sw	a0, -32(s0)
	j	.LBB0_1
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	lw	a0, -32(s0)
	lw	a1, -28(s0)
	bge	a0, a1, .LBB0_9
	j	.LBB0_2
.LBB0_2:                                #   in Loop: Header=BB0_1 Depth=1
	ld	a0, -24(s0)
	lw	a1, -32(s0)
	slli	a1, a1, 2
	add	a0, a0, a1
	lw	a0, 0(a0)
	sw	a0, -36(s0)
	lw	a0, -32(s0)
	addiw	a0, a0, -1
	sw	a0, -40(s0)
	j	.LBB0_3
.LBB0_3:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a0, -40(s0)
	li	a1, 0
	sd	a1, -48(s0)                     # 8-byte Folded Spill
	bltz	a0, .LBB0_5
	j	.LBB0_4
.LBB0_4:                                #   in Loop: Header=BB0_3 Depth=2
	ld	a0, -24(s0)
	lw	a1, -40(s0)
	slli	a1, a1, 2
	add	a0, a0, a1
	lw	a1, 0(a0)
	lw	a0, -36(s0)
	slt	a0, a0, a1
	sd	a0, -48(s0)                     # 8-byte Folded Spill
	j	.LBB0_5
.LBB0_5:                                #   in Loop: Header=BB0_3 Depth=2
	ld	a0, -48(s0)                     # 8-byte Folded Reload
	andi	a0, a0, 1
	beqz	a0, .LBB0_7
	j	.LBB0_6
.LBB0_6:                                #   in Loop: Header=BB0_3 Depth=2
	ld	a1, -24(s0)
	lw	a2, -40(s0)
	slli	a0, a2, 2
	add	a0, a1, a0
	lw	a0, 0(a0)
	addiw	a2, a2, 1
	slli	a2, a2, 2
	add	a1, a1, a2
	sw	a0, 0(a1)
	lw	a0, -40(s0)
	addiw	a0, a0, -1
	sw	a0, -40(s0)
	j	.LBB0_3
.LBB0_7:                                #   in Loop: Header=BB0_1 Depth=1
	lw	a0, -36(s0)
	ld	a1, -24(s0)
	lw	a2, -40(s0)
	addiw	a2, a2, 1
	slli	a2, a2, 2
	add	a1, a1, a2
	sw	a0, 0(a1)
	j	.LBB0_8
.LBB0_8:                                #   in Loop: Header=BB0_1 Depth=1
	lw	a0, -32(s0)
	addiw	a0, a0, 1
	sw	a0, -32(s0)
	j	.LBB0_1
.LBB0_9:
	ld	ra, 40(sp)                      # 8-byte Folded Reload
	ld	s0, 32(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 48
	ret
.Lfunc_end0:
	.size	insertionSort, .Lfunc_end0-insertionSort
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
	j	.LBB1_1
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -32(s0)
	lw	a1, -28(s0)
	bge	a0, a1, .LBB1_4
	j	.LBB1_2
.LBB1_2:                                #   in Loop: Header=BB1_1 Depth=1
	ld	a0, -24(s0)
	lw	a1, -32(s0)
	slli	a1, a1, 2
	add	a0, a0, a1
	lw	a1, 0(a0)
	lui	a0, %hi(.L.str)
	addi	a0, a0, %lo(.L.str)
	call	printf
	j	.LBB1_3
.LBB1_3:                                #   in Loop: Header=BB1_1 Depth=1
	lw	a0, -32(s0)
	addiw	a0, a0, 1
	sw	a0, -32(s0)
	j	.LBB1_1
.LBB1_4:
	lui	a0, %hi(.L.str.1)
	addi	a0, a0, %lo(.L.str.1)
	call	printf
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 32
	ret
.Lfunc_end1:
	.size	printArray, .Lfunc_end1-printArray
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
	j	.LBB2_1
.LBB2_1:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -44(s0)
	bltz	a0, .LBB2_4
	j	.LBB2_2
.LBB2_2:                                #   in Loop: Header=BB2_1 Depth=1
	ld	a1, -56(s0)                     # 8-byte Folded Reload
	lw	a0, -44(s0)
	slli	a2, a0, 2
	add	a1, a1, a2
	sw	a0, 0(a1)
	j	.LBB2_3
.LBB2_3:                                #   in Loop: Header=BB2_1 Depth=1
	lw	a0, -44(s0)
	addiw	a0, a0, -1
	sw	a0, -44(s0)
	j	.LBB2_1
.LBB2_4:
	ld	a0, -56(s0)                     # 8-byte Folded Reload
	lw	a1, -24(s0)
	call	insertionSort
	ld	a0, -56(s0)                     # 8-byte Folded Reload
	lw	a1, -24(s0)
	call	printArray
	li	a0, 0
	sw	a0, -20(s0)
	ld	a0, -32(s0)
	mv	sp, a0
	lw	a0, -20(s0)
	addi	sp, s0, -64
	ld	ra, 56(sp)                      # 8-byte Folded Reload
	ld	s0, 48(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 64
	ret
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

	.ident	"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 2db031528e3e0e2d6ab6087af9bae9e0ccbdfc06)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym insertionSort
	.addrsig_sym printArray
	.addrsig_sym printf
