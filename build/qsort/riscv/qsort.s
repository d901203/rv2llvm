	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0"
	.file	"qsort.c"
	.globl	qsort                           # -- Begin function qsort
	.p2align	2
	.type	qsort,@function
qsort:                                  # @qsort
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -304
	.cfi_def_cfa_offset 304
	sd	ra, 296(sp)                     # 8-byte Folded Spill
	sd	s0, 288(sp)                     # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	addi	s0, sp, 304
	.cfi_def_cfa s0, 0
	sd	a0, -24(s0)
	sd	a1, -32(s0)
	sd	a2, -40(s0)
	sd	a3, -48(s0)
	j	.LBB0_1
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_38 Depth 2
                                        #       Child Loop BB0_39 Depth 3
                                        #       Child Loop BB0_52 Depth 3
	lbu	a0, -24(s0)
	andi	a0, a0, 7
	bnez	a0, .LBB0_3
	j	.LBB0_2
.LBB0_2:                                #   in Loop: Header=BB0_1 Depth=1
	lbu	a0, -40(s0)
	andi	a0, a0, 7
	beqz	a0, .LBB0_4
	j	.LBB0_3
.LBB0_3:                                #   in Loop: Header=BB0_1 Depth=1
	li	a0, 2
	sd	a0, -240(s0)                    # 8-byte Folded Spill
	j	.LBB0_5
.LBB0_4:                                #   in Loop: Header=BB0_1 Depth=1
	ld	a0, -40(s0)
	addi	a0, a0, -8
	snez	a0, a0
	sd	a0, -240(s0)                    # 8-byte Folded Spill
	j	.LBB0_5
.LBB0_5:                                #   in Loop: Header=BB0_1 Depth=1
	ld	a0, -240(s0)                    # 8-byte Folded Reload
	sw	a0, -128(s0)
	lbu	a0, -24(s0)
	andi	a0, a0, 3
	bnez	a0, .LBB0_7
	j	.LBB0_6
.LBB0_6:                                #   in Loop: Header=BB0_1 Depth=1
	lbu	a0, -40(s0)
	andi	a0, a0, 3
	beqz	a0, .LBB0_8
	j	.LBB0_7
.LBB0_7:                                #   in Loop: Header=BB0_1 Depth=1
	li	a0, 2
	sd	a0, -248(s0)                    # 8-byte Folded Spill
	j	.LBB0_9
.LBB0_8:                                #   in Loop: Header=BB0_1 Depth=1
	ld	a0, -40(s0)
	addi	a0, a0, -4
	snez	a0, a0
	sd	a0, -248(s0)                    # 8-byte Folded Spill
	j	.LBB0_9
.LBB0_9:                                #   in Loop: Header=BB0_1 Depth=1
	ld	a0, -248(s0)                    # 8-byte Folded Reload
	sw	a0, -132(s0)
	li	a0, 0
	sw	a0, -136(s0)
	ld	a1, -32(s0)
	li	a0, 6
	bltu	a0, a1, .LBB0_27
	j	.LBB0_10
.LBB0_10:
	ld	a0, -24(s0)
	ld	a1, -40(s0)
	add	a0, a0, a1
	sd	a0, -96(s0)
	j	.LBB0_11
.LBB0_11:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_13 Depth 2
	ld	a0, -96(s0)
	ld	a1, -24(s0)
	ld	a2, -32(s0)
	ld	a3, -40(s0)
	mul	a2, a2, a3
	add	a1, a1, a2
	bgeu	a0, a1, .LBB0_26
	j	.LBB0_12
.LBB0_12:                               #   in Loop: Header=BB0_11 Depth=1
	ld	a0, -96(s0)
	sd	a0, -88(s0)
	j	.LBB0_13
.LBB0_13:                               #   Parent Loop BB0_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	ld	a1, -88(s0)
	ld	a0, -24(s0)
	li	a2, 0
	sd	a2, -256(s0)                    # 8-byte Folded Spill
	bgeu	a0, a1, .LBB0_15
	j	.LBB0_14
.LBB0_14:                               #   in Loop: Header=BB0_13 Depth=2
	ld	a2, -48(s0)
	ld	a1, -88(s0)
	ld	a0, -40(s0)
	sub	a0, a1, a0
	jalr	a2
	mv	a1, a0
	li	a0, 0
	slt	a0, a0, a1
	sd	a0, -256(s0)                    # 8-byte Folded Spill
	j	.LBB0_15
.LBB0_15:                               #   in Loop: Header=BB0_13 Depth=2
	ld	a0, -256(s0)                    # 8-byte Folded Reload
	andi	a0, a0, 1
	beqz	a0, .LBB0_24
	j	.LBB0_16
.LBB0_16:                               #   in Loop: Header=BB0_13 Depth=2
	lw	a0, -128(s0)
	bnez	a0, .LBB0_18
	j	.LBB0_17
.LBB0_17:                               #   in Loop: Header=BB0_13 Depth=2
	ld	a0, -88(s0)
	ld	a0, 0(a0)
	sd	a0, -144(s0)
	ld	a1, -88(s0)
	ld	a0, -40(s0)
	sub	a0, a1, a0
	ld	a0, 0(a0)
	sd	a0, 0(a1)
	ld	a0, -144(s0)
	ld	a1, -88(s0)
	ld	a2, -40(s0)
	sub	a1, a1, a2
	sd	a0, 0(a1)
	j	.LBB0_22
.LBB0_18:                               #   in Loop: Header=BB0_13 Depth=2
	lw	a0, -132(s0)
	bnez	a0, .LBB0_20
	j	.LBB0_19
.LBB0_19:                               #   in Loop: Header=BB0_13 Depth=2
	ld	a0, -88(s0)
	lw	a0, 0(a0)
	sw	a0, -148(s0)
	ld	a1, -88(s0)
	ld	a0, -40(s0)
	sub	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, 0(a1)
	lw	a0, -148(s0)
	ld	a1, -88(s0)
	ld	a2, -40(s0)
	sub	a1, a1, a2
	sw	a0, 0(a1)
	j	.LBB0_21
.LBB0_20:                               #   in Loop: Header=BB0_13 Depth=2
	ld	a0, -88(s0)
	ld	a2, -40(s0)
	sub	a1, a0, a2
	lw	a3, -128(s0)
	lw	a4, -132(s0)
	sext.w	a2, a2
	call	swapfunc
	j	.LBB0_21
.LBB0_21:                               #   in Loop: Header=BB0_13 Depth=2
	j	.LBB0_22
.LBB0_22:                               #   in Loop: Header=BB0_13 Depth=2
	j	.LBB0_23
.LBB0_23:                               #   in Loop: Header=BB0_13 Depth=2
	ld	a1, -40(s0)
	ld	a0, -88(s0)
	sub	a0, a0, a1
	sd	a0, -88(s0)
	j	.LBB0_13
.LBB0_24:                               #   in Loop: Header=BB0_11 Depth=1
	j	.LBB0_25
.LBB0_25:                               #   in Loop: Header=BB0_11 Depth=1
	ld	a1, -40(s0)
	ld	a0, -96(s0)
	add	a0, a0, a1
	sd	a0, -96(s0)
	j	.LBB0_11
.LBB0_26:
	j	.LBB0_105
.LBB0_27:                               #   in Loop: Header=BB0_1 Depth=1
	ld	a0, -24(s0)
	ld	a1, -32(s0)
	srli	a1, a1, 1
	ld	a2, -40(s0)
	mul	a1, a1, a2
	add	a0, a0, a1
	sd	a0, -96(s0)
	ld	a0, -32(s0)
	li	a1, 8
	bltu	a0, a1, .LBB0_31
	j	.LBB0_28
.LBB0_28:                               #   in Loop: Header=BB0_1 Depth=1
	ld	a0, -24(s0)
	sd	a0, -88(s0)
	ld	a0, -24(s0)
	ld	a1, -32(s0)
	addi	a1, a1, -1
	ld	a2, -40(s0)
	mul	a1, a1, a2
	add	a0, a0, a1
	sd	a0, -104(s0)
	ld	a0, -32(s0)
	li	a1, 41
	bltu	a0, a1, .LBB0_30
	j	.LBB0_29
.LBB0_29:                               #   in Loop: Header=BB0_1 Depth=1
	ld	a0, -32(s0)
	srli	a0, a0, 3
	ld	a1, -40(s0)
	mul	a0, a0, a1
	sd	a0, -112(s0)
	ld	a0, -88(s0)
	ld	a2, -112(s0)
	add	a1, a0, a2
	slli	a2, a2, 1
	add	a2, a0, a2
	ld	a3, -48(s0)
	call	med3
	sd	a0, -88(s0)
	ld	a1, -96(s0)
	ld	a2, -112(s0)
	sub	a0, a1, a2
	add	a2, a1, a2
	ld	a3, -48(s0)
	call	med3
	sd	a0, -96(s0)
	ld	a2, -104(s0)
	ld	a1, -112(s0)
	slli	a0, a1, 1
	sub	a0, a2, a0
	sub	a1, a2, a1
	ld	a3, -48(s0)
	call	med3
	sd	a0, -104(s0)
	j	.LBB0_30
.LBB0_30:                               #   in Loop: Header=BB0_1 Depth=1
	ld	a0, -88(s0)
	ld	a1, -96(s0)
	ld	a2, -104(s0)
	ld	a3, -48(s0)
	call	med3
	sd	a0, -96(s0)
	j	.LBB0_31
.LBB0_31:                               #   in Loop: Header=BB0_1 Depth=1
	lw	a0, -128(s0)
	bnez	a0, .LBB0_33
	j	.LBB0_32
.LBB0_32:                               #   in Loop: Header=BB0_1 Depth=1
	ld	a0, -24(s0)
	ld	a0, 0(a0)
	sd	a0, -160(s0)
	ld	a0, -96(s0)
	ld	a0, 0(a0)
	ld	a1, -24(s0)
	sd	a0, 0(a1)
	ld	a0, -160(s0)
	ld	a1, -96(s0)
	sd	a0, 0(a1)
	j	.LBB0_37
.LBB0_33:                               #   in Loop: Header=BB0_1 Depth=1
	lw	a0, -132(s0)
	bnez	a0, .LBB0_35
	j	.LBB0_34
.LBB0_34:                               #   in Loop: Header=BB0_1 Depth=1
	ld	a0, -24(s0)
	lw	a0, 0(a0)
	sw	a0, -164(s0)
	ld	a0, -96(s0)
	lw	a0, 0(a0)
	ld	a1, -24(s0)
	sw	a0, 0(a1)
	lw	a0, -164(s0)
	ld	a1, -96(s0)
	sw	a0, 0(a1)
	j	.LBB0_36
.LBB0_35:                               #   in Loop: Header=BB0_1 Depth=1
	ld	a0, -24(s0)
	ld	a1, -96(s0)
	lw	a2, -40(s0)
	lw	a3, -128(s0)
	lw	a4, -132(s0)
	call	swapfunc
	j	.LBB0_36
.LBB0_36:                               #   in Loop: Header=BB0_1 Depth=1
	j	.LBB0_37
.LBB0_37:                               #   in Loop: Header=BB0_1 Depth=1
	ld	a0, -24(s0)
	ld	a1, -40(s0)
	add	a0, a0, a1
	sd	a0, -64(s0)
	sd	a0, -56(s0)
	ld	a0, -24(s0)
	ld	a1, -32(s0)
	addi	a1, a1, -1
	ld	a2, -40(s0)
	mul	a1, a1, a2
	add	a0, a0, a1
	sd	a0, -80(s0)
	sd	a0, -72(s0)
	j	.LBB0_38
.LBB0_38:                               #   Parent Loop BB0_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_39 Depth 3
                                        #       Child Loop BB0_52 Depth 3
	j	.LBB0_39
.LBB0_39:                               #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_38 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	ld	a1, -64(s0)
	ld	a0, -72(s0)
	li	a2, 0
	sd	a2, -264(s0)                    # 8-byte Folded Spill
	bltu	a0, a1, .LBB0_41
	j	.LBB0_40
.LBB0_40:                               #   in Loop: Header=BB0_39 Depth=3
	ld	a2, -48(s0)
	ld	a0, -64(s0)
	ld	a1, -24(s0)
	jalr	a2
	sw	a0, -124(s0)
	slti	a0, a0, 1
	sd	a0, -264(s0)                    # 8-byte Folded Spill
	j	.LBB0_41
.LBB0_41:                               #   in Loop: Header=BB0_39 Depth=3
	ld	a0, -264(s0)                    # 8-byte Folded Reload
	andi	a0, a0, 1
	beqz	a0, .LBB0_51
	j	.LBB0_42
.LBB0_42:                               #   in Loop: Header=BB0_39 Depth=3
	lw	a0, -124(s0)
	bnez	a0, .LBB0_50
	j	.LBB0_43
.LBB0_43:                               #   in Loop: Header=BB0_39 Depth=3
	li	a0, 1
	sw	a0, -136(s0)
	lw	a0, -128(s0)
	bnez	a0, .LBB0_45
	j	.LBB0_44
.LBB0_44:                               #   in Loop: Header=BB0_39 Depth=3
	ld	a0, -56(s0)
	ld	a0, 0(a0)
	sd	a0, -176(s0)
	ld	a0, -64(s0)
	ld	a0, 0(a0)
	ld	a1, -56(s0)
	sd	a0, 0(a1)
	ld	a0, -176(s0)
	ld	a1, -64(s0)
	sd	a0, 0(a1)
	j	.LBB0_49
.LBB0_45:                               #   in Loop: Header=BB0_39 Depth=3
	lw	a0, -132(s0)
	bnez	a0, .LBB0_47
	j	.LBB0_46
.LBB0_46:                               #   in Loop: Header=BB0_39 Depth=3
	ld	a0, -56(s0)
	lw	a0, 0(a0)
	sw	a0, -180(s0)
	ld	a0, -64(s0)
	lw	a0, 0(a0)
	ld	a1, -56(s0)
	sw	a0, 0(a1)
	lw	a0, -180(s0)
	ld	a1, -64(s0)
	sw	a0, 0(a1)
	j	.LBB0_48
.LBB0_47:                               #   in Loop: Header=BB0_39 Depth=3
	ld	a0, -56(s0)
	ld	a1, -64(s0)
	lw	a2, -40(s0)
	lw	a3, -128(s0)
	lw	a4, -132(s0)
	call	swapfunc
	j	.LBB0_48
.LBB0_48:                               #   in Loop: Header=BB0_39 Depth=3
	j	.LBB0_49
.LBB0_49:                               #   in Loop: Header=BB0_39 Depth=3
	ld	a1, -40(s0)
	ld	a0, -56(s0)
	add	a0, a0, a1
	sd	a0, -56(s0)
	j	.LBB0_50
.LBB0_50:                               #   in Loop: Header=BB0_39 Depth=3
	ld	a1, -40(s0)
	ld	a0, -64(s0)
	add	a0, a0, a1
	sd	a0, -64(s0)
	j	.LBB0_39
.LBB0_51:                               #   in Loop: Header=BB0_38 Depth=2
	j	.LBB0_52
.LBB0_52:                               #   Parent Loop BB0_1 Depth=1
                                        #     Parent Loop BB0_38 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	ld	a1, -64(s0)
	ld	a0, -72(s0)
	li	a2, 0
	sd	a2, -272(s0)                    # 8-byte Folded Spill
	bltu	a0, a1, .LBB0_54
	j	.LBB0_53
.LBB0_53:                               #   in Loop: Header=BB0_52 Depth=3
	ld	a2, -48(s0)
	ld	a0, -72(s0)
	ld	a1, -24(s0)
	jalr	a2
	sw	a0, -124(s0)
	slti	a0, a0, 0
	xori	a0, a0, 1
	sd	a0, -272(s0)                    # 8-byte Folded Spill
	j	.LBB0_54
.LBB0_54:                               #   in Loop: Header=BB0_52 Depth=3
	ld	a0, -272(s0)                    # 8-byte Folded Reload
	andi	a0, a0, 1
	beqz	a0, .LBB0_64
	j	.LBB0_55
.LBB0_55:                               #   in Loop: Header=BB0_52 Depth=3
	lw	a0, -124(s0)
	bnez	a0, .LBB0_63
	j	.LBB0_56
.LBB0_56:                               #   in Loop: Header=BB0_52 Depth=3
	li	a0, 1
	sw	a0, -136(s0)
	lw	a0, -128(s0)
	bnez	a0, .LBB0_58
	j	.LBB0_57
.LBB0_57:                               #   in Loop: Header=BB0_52 Depth=3
	ld	a0, -72(s0)
	ld	a0, 0(a0)
	sd	a0, -192(s0)
	ld	a0, -80(s0)
	ld	a0, 0(a0)
	ld	a1, -72(s0)
	sd	a0, 0(a1)
	ld	a0, -192(s0)
	ld	a1, -80(s0)
	sd	a0, 0(a1)
	j	.LBB0_62
.LBB0_58:                               #   in Loop: Header=BB0_52 Depth=3
	lw	a0, -132(s0)
	bnez	a0, .LBB0_60
	j	.LBB0_59
.LBB0_59:                               #   in Loop: Header=BB0_52 Depth=3
	ld	a0, -72(s0)
	lw	a0, 0(a0)
	sw	a0, -196(s0)
	ld	a0, -80(s0)
	lw	a0, 0(a0)
	ld	a1, -72(s0)
	sw	a0, 0(a1)
	lw	a0, -196(s0)
	ld	a1, -80(s0)
	sw	a0, 0(a1)
	j	.LBB0_61
.LBB0_60:                               #   in Loop: Header=BB0_52 Depth=3
	ld	a0, -72(s0)
	ld	a1, -80(s0)
	lw	a2, -40(s0)
	lw	a3, -128(s0)
	lw	a4, -132(s0)
	call	swapfunc
	j	.LBB0_61
.LBB0_61:                               #   in Loop: Header=BB0_52 Depth=3
	j	.LBB0_62
.LBB0_62:                               #   in Loop: Header=BB0_52 Depth=3
	ld	a1, -40(s0)
	ld	a0, -80(s0)
	sub	a0, a0, a1
	sd	a0, -80(s0)
	j	.LBB0_63
.LBB0_63:                               #   in Loop: Header=BB0_52 Depth=3
	ld	a1, -40(s0)
	ld	a0, -72(s0)
	sub	a0, a0, a1
	sd	a0, -72(s0)
	j	.LBB0_52
.LBB0_64:                               #   in Loop: Header=BB0_38 Depth=2
	ld	a1, -64(s0)
	ld	a0, -72(s0)
	bgeu	a0, a1, .LBB0_66
	j	.LBB0_65
.LBB0_65:                               #   in Loop: Header=BB0_1 Depth=1
	j	.LBB0_73
.LBB0_66:                               #   in Loop: Header=BB0_38 Depth=2
	lw	a0, -128(s0)
	bnez	a0, .LBB0_68
	j	.LBB0_67
.LBB0_67:                               #   in Loop: Header=BB0_38 Depth=2
	ld	a0, -64(s0)
	ld	a0, 0(a0)
	sd	a0, -208(s0)
	ld	a0, -72(s0)
	ld	a0, 0(a0)
	ld	a1, -64(s0)
	sd	a0, 0(a1)
	ld	a0, -208(s0)
	ld	a1, -72(s0)
	sd	a0, 0(a1)
	j	.LBB0_72
.LBB0_68:                               #   in Loop: Header=BB0_38 Depth=2
	lw	a0, -132(s0)
	bnez	a0, .LBB0_70
	j	.LBB0_69
.LBB0_69:                               #   in Loop: Header=BB0_38 Depth=2
	ld	a0, -64(s0)
	lw	a0, 0(a0)
	sw	a0, -212(s0)
	ld	a0, -72(s0)
	lw	a0, 0(a0)
	ld	a1, -64(s0)
	sw	a0, 0(a1)
	lw	a0, -212(s0)
	ld	a1, -72(s0)
	sw	a0, 0(a1)
	j	.LBB0_71
.LBB0_70:                               #   in Loop: Header=BB0_38 Depth=2
	ld	a0, -64(s0)
	ld	a1, -72(s0)
	lw	a2, -40(s0)
	lw	a3, -128(s0)
	lw	a4, -132(s0)
	call	swapfunc
	j	.LBB0_71
.LBB0_71:                               #   in Loop: Header=BB0_38 Depth=2
	j	.LBB0_72
.LBB0_72:                               #   in Loop: Header=BB0_38 Depth=2
	li	a0, 1
	sw	a0, -136(s0)
	ld	a1, -40(s0)
	ld	a0, -64(s0)
	add	a0, a0, a1
	sd	a0, -64(s0)
	ld	a1, -40(s0)
	ld	a0, -72(s0)
	sub	a0, a0, a1
	sd	a0, -72(s0)
	j	.LBB0_38
.LBB0_73:                               #   in Loop: Header=BB0_1 Depth=1
	lw	a0, -136(s0)
	bnez	a0, .LBB0_91
	j	.LBB0_74
.LBB0_74:
	ld	a0, -24(s0)
	ld	a1, -40(s0)
	add	a0, a0, a1
	sd	a0, -96(s0)
	j	.LBB0_75
.LBB0_75:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_77 Depth 2
	ld	a0, -96(s0)
	ld	a1, -24(s0)
	ld	a2, -32(s0)
	ld	a3, -40(s0)
	mul	a2, a2, a3
	add	a1, a1, a2
	bgeu	a0, a1, .LBB0_90
	j	.LBB0_76
.LBB0_76:                               #   in Loop: Header=BB0_75 Depth=1
	ld	a0, -96(s0)
	sd	a0, -88(s0)
	j	.LBB0_77
.LBB0_77:                               #   Parent Loop BB0_75 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	ld	a1, -88(s0)
	ld	a0, -24(s0)
	li	a2, 0
	sd	a2, -280(s0)                    # 8-byte Folded Spill
	bgeu	a0, a1, .LBB0_79
	j	.LBB0_78
.LBB0_78:                               #   in Loop: Header=BB0_77 Depth=2
	ld	a2, -48(s0)
	ld	a1, -88(s0)
	ld	a0, -40(s0)
	sub	a0, a1, a0
	jalr	a2
	mv	a1, a0
	li	a0, 0
	slt	a0, a0, a1
	sd	a0, -280(s0)                    # 8-byte Folded Spill
	j	.LBB0_79
.LBB0_79:                               #   in Loop: Header=BB0_77 Depth=2
	ld	a0, -280(s0)                    # 8-byte Folded Reload
	andi	a0, a0, 1
	beqz	a0, .LBB0_88
	j	.LBB0_80
.LBB0_80:                               #   in Loop: Header=BB0_77 Depth=2
	lw	a0, -128(s0)
	bnez	a0, .LBB0_82
	j	.LBB0_81
.LBB0_81:                               #   in Loop: Header=BB0_77 Depth=2
	ld	a0, -88(s0)
	ld	a0, 0(a0)
	sd	a0, -224(s0)
	ld	a1, -88(s0)
	ld	a0, -40(s0)
	sub	a0, a1, a0
	ld	a0, 0(a0)
	sd	a0, 0(a1)
	ld	a0, -224(s0)
	ld	a1, -88(s0)
	ld	a2, -40(s0)
	sub	a1, a1, a2
	sd	a0, 0(a1)
	j	.LBB0_86
.LBB0_82:                               #   in Loop: Header=BB0_77 Depth=2
	lw	a0, -132(s0)
	bnez	a0, .LBB0_84
	j	.LBB0_83
.LBB0_83:                               #   in Loop: Header=BB0_77 Depth=2
	ld	a0, -88(s0)
	lw	a0, 0(a0)
	sw	a0, -228(s0)
	ld	a1, -88(s0)
	ld	a0, -40(s0)
	sub	a0, a1, a0
	lw	a0, 0(a0)
	sw	a0, 0(a1)
	lw	a0, -228(s0)
	ld	a1, -88(s0)
	ld	a2, -40(s0)
	sub	a1, a1, a2
	sw	a0, 0(a1)
	j	.LBB0_85
.LBB0_84:                               #   in Loop: Header=BB0_77 Depth=2
	ld	a0, -88(s0)
	ld	a2, -40(s0)
	sub	a1, a0, a2
	lw	a3, -128(s0)
	lw	a4, -132(s0)
	sext.w	a2, a2
	call	swapfunc
	j	.LBB0_85
.LBB0_85:                               #   in Loop: Header=BB0_77 Depth=2
	j	.LBB0_86
.LBB0_86:                               #   in Loop: Header=BB0_77 Depth=2
	j	.LBB0_87
.LBB0_87:                               #   in Loop: Header=BB0_77 Depth=2
	ld	a1, -40(s0)
	ld	a0, -88(s0)
	sub	a0, a0, a1
	sd	a0, -88(s0)
	j	.LBB0_77
.LBB0_88:                               #   in Loop: Header=BB0_75 Depth=1
	j	.LBB0_89
.LBB0_89:                               #   in Loop: Header=BB0_75 Depth=1
	ld	a1, -40(s0)
	ld	a0, -96(s0)
	add	a0, a0, a1
	sd	a0, -96(s0)
	j	.LBB0_75
.LBB0_90:
	j	.LBB0_105
.LBB0_91:                               #   in Loop: Header=BB0_1 Depth=1
	ld	a0, -24(s0)
	ld	a1, -32(s0)
	ld	a2, -40(s0)
	mul	a1, a1, a2
	add	a0, a0, a1
	sd	a0, -104(s0)
	ld	a2, -56(s0)
	ld	a0, -24(s0)
	sub	a0, a2, a0
	ld	a1, -64(s0)
	sub	a1, a1, a2
	bge	a0, a1, .LBB0_93
	j	.LBB0_92
.LBB0_92:                               #   in Loop: Header=BB0_1 Depth=1
	ld	a0, -56(s0)
	ld	a1, -24(s0)
	sub	a0, a0, a1
	sd	a0, -288(s0)                    # 8-byte Folded Spill
	j	.LBB0_94
.LBB0_93:                               #   in Loop: Header=BB0_1 Depth=1
	ld	a0, -64(s0)
	ld	a1, -56(s0)
	sub	a0, a0, a1
	sd	a0, -288(s0)                    # 8-byte Folded Spill
	j	.LBB0_94
.LBB0_94:                               #   in Loop: Header=BB0_1 Depth=1
	ld	a0, -288(s0)                    # 8-byte Folded Reload
	sd	a0, -120(s0)
	ld	a0, -120(s0)
	beqz	a0, .LBB0_96
	j	.LBB0_95
.LBB0_95:                               #   in Loop: Header=BB0_1 Depth=1
	ld	a0, -24(s0)
	ld	a1, -64(s0)
	ld	a2, -120(s0)
	sub	a1, a1, a2
	lw	a3, -128(s0)
	lw	a4, -132(s0)
	sext.w	a2, a2
	call	swapfunc
	j	.LBB0_96
.LBB0_96:                               #   in Loop: Header=BB0_1 Depth=1
	ld	a2, -80(s0)
	ld	a0, -72(s0)
	sub	a0, a2, a0
	ld	a1, -104(s0)
	sub	a1, a1, a2
	ld	a2, -40(s0)
	sub	a1, a1, a2
	bgeu	a0, a1, .LBB0_98
	j	.LBB0_97
.LBB0_97:                               #   in Loop: Header=BB0_1 Depth=1
	ld	a0, -80(s0)
	ld	a1, -72(s0)
	sub	a0, a0, a1
	sd	a0, -296(s0)                    # 8-byte Folded Spill
	j	.LBB0_99
.LBB0_98:                               #   in Loop: Header=BB0_1 Depth=1
	ld	a0, -104(s0)
	ld	a1, -80(s0)
	sub	a0, a0, a1
	ld	a1, -40(s0)
	sub	a0, a0, a1
	sd	a0, -296(s0)                    # 8-byte Folded Spill
	j	.LBB0_99
.LBB0_99:                               #   in Loop: Header=BB0_1 Depth=1
	ld	a0, -296(s0)                    # 8-byte Folded Reload
	sd	a0, -120(s0)
	ld	a0, -120(s0)
	beqz	a0, .LBB0_101
	j	.LBB0_100
.LBB0_100:                              #   in Loop: Header=BB0_1 Depth=1
	ld	a0, -64(s0)
	ld	a1, -104(s0)
	ld	a2, -120(s0)
	sub	a1, a1, a2
	lw	a3, -128(s0)
	lw	a4, -132(s0)
	sext.w	a2, a2
	call	swapfunc
	j	.LBB0_101
.LBB0_101:                              #   in Loop: Header=BB0_1 Depth=1
	ld	a0, -64(s0)
	ld	a1, -56(s0)
	sub	a1, a0, a1
	sd	a1, -120(s0)
	ld	a0, -40(s0)
	bgeu	a0, a1, .LBB0_103
	j	.LBB0_102
.LBB0_102:                              #   in Loop: Header=BB0_1 Depth=1
	ld	a0, -24(s0)
	ld	a1, -120(s0)
	ld	a2, -40(s0)
	divu	a1, a1, a2
	ld	a3, -48(s0)
	call	qsort
	j	.LBB0_103
.LBB0_103:                              #   in Loop: Header=BB0_1 Depth=1
	ld	a0, -80(s0)
	ld	a1, -72(s0)
	sub	a1, a0, a1
	sd	a1, -120(s0)
	ld	a0, -40(s0)
	bgeu	a0, a1, .LBB0_105
	j	.LBB0_104
.LBB0_104:                              #   in Loop: Header=BB0_1 Depth=1
	ld	a0, -104(s0)
	ld	a1, -120(s0)
	sub	a0, a0, a1
	sd	a0, -24(s0)
	ld	a0, -120(s0)
	ld	a1, -40(s0)
	divu	a0, a0, a1
	sd	a0, -32(s0)
	j	.LBB0_1
.LBB0_105:
	ld	ra, 296(sp)                     # 8-byte Folded Reload
	ld	s0, 288(sp)                     # 8-byte Folded Reload
	addi	sp, sp, 304
	ret
.Lfunc_end0:
	.size	qsort, .Lfunc_end0-qsort
	.cfi_endproc
                                        # -- End function
	.p2align	2                               # -- Begin function swapfunc
	.type	swapfunc,@function
swapfunc:                               # @swapfunc
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -144
	.cfi_def_cfa_offset 144
	sd	ra, 136(sp)                     # 8-byte Folded Spill
	sd	s0, 128(sp)                     # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	addi	s0, sp, 144
	.cfi_def_cfa s0, 0
                                        # kill: def $x15 killed $x14
                                        # kill: def $x15 killed $x13
                                        # kill: def $x15 killed $x12
	sd	a0, -24(s0)
	sd	a1, -32(s0)
	sw	a2, -36(s0)
	sw	a3, -40(s0)
	sw	a4, -44(s0)
	lw	a1, -40(s0)
	li	a0, 1
	blt	a0, a1, .LBB1_5
	j	.LBB1_1
.LBB1_1:
	lw	a0, -36(s0)
	srli	a0, a0, 3
	sd	a0, -56(s0)
	ld	a0, -24(s0)
	sd	a0, -64(s0)
	ld	a0, -32(s0)
	sd	a0, -72(s0)
	j	.LBB1_2
.LBB1_2:                                # =>This Inner Loop Header: Depth=1
	ld	a0, -64(s0)
	ld	a0, 0(a0)
	sd	a0, -80(s0)
	ld	a0, -72(s0)
	ld	a0, 0(a0)
	ld	a1, -64(s0)
	addi	a2, a1, 8
	sd	a2, -64(s0)
	sd	a0, 0(a1)
	ld	a0, -80(s0)
	ld	a1, -72(s0)
	addi	a2, a1, 8
	sd	a2, -72(s0)
	sd	a0, 0(a1)
	j	.LBB1_3
.LBB1_3:                                #   in Loop: Header=BB1_2 Depth=1
	ld	a0, -56(s0)
	addi	a1, a0, -1
	sd	a1, -56(s0)
	li	a0, 0
	blt	a0, a1, .LBB1_2
	j	.LBB1_4
.LBB1_4:
	j	.LBB1_15
.LBB1_5:
	lw	a1, -44(s0)
	li	a0, 1
	blt	a0, a1, .LBB1_10
	j	.LBB1_6
.LBB1_6:
	lw	a0, -36(s0)
	srli	a0, a0, 2
	sd	a0, -88(s0)
	ld	a0, -24(s0)
	sd	a0, -96(s0)
	ld	a0, -32(s0)
	sd	a0, -104(s0)
	j	.LBB1_7
.LBB1_7:                                # =>This Inner Loop Header: Depth=1
	ld	a0, -96(s0)
	lw	a0, 0(a0)
	sw	a0, -108(s0)
	ld	a0, -104(s0)
	lw	a0, 0(a0)
	ld	a1, -96(s0)
	addi	a2, a1, 4
	sd	a2, -96(s0)
	sw	a0, 0(a1)
	lw	a0, -108(s0)
	ld	a1, -104(s0)
	addi	a2, a1, 4
	sd	a2, -104(s0)
	sw	a0, 0(a1)
	j	.LBB1_8
.LBB1_8:                                #   in Loop: Header=BB1_7 Depth=1
	ld	a0, -88(s0)
	addi	a1, a0, -1
	sd	a1, -88(s0)
	li	a0, 0
	blt	a0, a1, .LBB1_7
	j	.LBB1_9
.LBB1_9:
	j	.LBB1_14
.LBB1_10:
	lw	a0, -36(s0)
	sd	a0, -120(s0)
	ld	a0, -24(s0)
	sd	a0, -128(s0)
	ld	a0, -32(s0)
	sd	a0, -136(s0)
	j	.LBB1_11
.LBB1_11:                               # =>This Inner Loop Header: Depth=1
	ld	a0, -128(s0)
	lbu	a0, 0(a0)
	sb	a0, -137(s0)
	ld	a0, -136(s0)
	lbu	a0, 0(a0)
	ld	a1, -128(s0)
	addi	a2, a1, 1
	sd	a2, -128(s0)
	sb	a0, 0(a1)
	lbu	a0, -137(s0)
	ld	a1, -136(s0)
	addi	a2, a1, 1
	sd	a2, -136(s0)
	sb	a0, 0(a1)
	j	.LBB1_12
.LBB1_12:                               #   in Loop: Header=BB1_11 Depth=1
	ld	a0, -120(s0)
	addi	a1, a0, -1
	sd	a1, -120(s0)
	li	a0, 0
	blt	a0, a1, .LBB1_11
	j	.LBB1_13
.LBB1_13:
	j	.LBB1_14
.LBB1_14:
	j	.LBB1_15
.LBB1_15:
	ld	ra, 136(sp)                     # 8-byte Folded Reload
	ld	s0, 128(sp)                     # 8-byte Folded Reload
	addi	sp, sp, 144
	ret
.Lfunc_end1:
	.size	swapfunc, .Lfunc_end1-swapfunc
	.cfi_endproc
                                        # -- End function
	.p2align	2                               # -- Begin function med3
	.type	med3,@function
med3:                                   # @med3
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -96
	.cfi_def_cfa_offset 96
	sd	ra, 88(sp)                      # 8-byte Folded Spill
	sd	s0, 80(sp)                      # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	addi	s0, sp, 96
	.cfi_def_cfa s0, 0
	sd	a0, -24(s0)
	sd	a1, -32(s0)
	sd	a2, -40(s0)
	sd	a3, -48(s0)
	ld	a2, -48(s0)
	ld	a0, -24(s0)
	ld	a1, -32(s0)
	jalr	a2
	bgez	a0, .LBB2_8
	j	.LBB2_1
.LBB2_1:
	ld	a2, -48(s0)
	ld	a0, -32(s0)
	ld	a1, -40(s0)
	jalr	a2
	bgez	a0, .LBB2_3
	j	.LBB2_2
.LBB2_2:
	ld	a0, -32(s0)
	sd	a0, -56(s0)                     # 8-byte Folded Spill
	j	.LBB2_7
.LBB2_3:
	ld	a2, -48(s0)
	ld	a0, -24(s0)
	ld	a1, -40(s0)
	jalr	a2
	bgez	a0, .LBB2_5
	j	.LBB2_4
.LBB2_4:
	ld	a0, -40(s0)
	sd	a0, -64(s0)                     # 8-byte Folded Spill
	j	.LBB2_6
.LBB2_5:
	ld	a0, -24(s0)
	sd	a0, -64(s0)                     # 8-byte Folded Spill
	j	.LBB2_6
.LBB2_6:
	ld	a0, -64(s0)                     # 8-byte Folded Reload
	sd	a0, -56(s0)                     # 8-byte Folded Spill
	j	.LBB2_7
.LBB2_7:
	ld	a0, -56(s0)                     # 8-byte Folded Reload
	sd	a0, -72(s0)                     # 8-byte Folded Spill
	j	.LBB2_15
.LBB2_8:
	ld	a2, -48(s0)
	ld	a0, -32(s0)
	ld	a1, -40(s0)
	jalr	a2
	mv	a1, a0
	li	a0, 0
	bge	a0, a1, .LBB2_10
	j	.LBB2_9
.LBB2_9:
	ld	a0, -32(s0)
	sd	a0, -80(s0)                     # 8-byte Folded Spill
	j	.LBB2_14
.LBB2_10:
	ld	a2, -48(s0)
	ld	a0, -24(s0)
	ld	a1, -40(s0)
	jalr	a2
	bgez	a0, .LBB2_12
	j	.LBB2_11
.LBB2_11:
	ld	a0, -24(s0)
	sd	a0, -88(s0)                     # 8-byte Folded Spill
	j	.LBB2_13
.LBB2_12:
	ld	a0, -40(s0)
	sd	a0, -88(s0)                     # 8-byte Folded Spill
	j	.LBB2_13
.LBB2_13:
	ld	a0, -88(s0)                     # 8-byte Folded Reload
	sd	a0, -80(s0)                     # 8-byte Folded Spill
	j	.LBB2_14
.LBB2_14:
	ld	a0, -80(s0)                     # 8-byte Folded Reload
	sd	a0, -72(s0)                     # 8-byte Folded Spill
	j	.LBB2_15
.LBB2_15:
	ld	a0, -72(s0)                     # 8-byte Folded Reload
	ld	ra, 88(sp)                      # 8-byte Folded Reload
	ld	s0, 80(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 96
	ret
.Lfunc_end2:
	.size	med3, .Lfunc_end2-med3
	.cfi_endproc
                                        # -- End function
	.globl	compare                         # -- Begin function compare
	.p2align	2
	.type	compare,@function
compare:                                # @compare
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
	sd	a0, -40(s0)
	ld	a0, -32(s0)
	sd	a0, -48(s0)
	ld	a0, -40(s0)
	lw	a0, 0(a0)
	ld	a1, -48(s0)
	lw	a1, 0(a1)
	subw	a0, a0, a1
	ld	ra, 40(sp)                      # 8-byte Folded Reload
	ld	s0, 32(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 48
	ret
.Lfunc_end3:
	.size	compare, .Lfunc_end3-compare
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
	j	.LBB4_1
.LBB4_1:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -32(s0)
	lw	a1, -28(s0)
	bge	a0, a1, .LBB4_4
	j	.LBB4_2
.LBB4_2:                                #   in Loop: Header=BB4_1 Depth=1
	ld	a0, -24(s0)
	lw	a1, -32(s0)
	slli	a1, a1, 2
	add	a0, a0, a1
	lw	a1, 0(a0)
	lui	a0, %hi(.L.str)
	addi	a0, a0, %lo(.L.str)
	call	printf
	j	.LBB4_3
.LBB4_3:                                #   in Loop: Header=BB4_1 Depth=1
	lw	a0, -32(s0)
	addiw	a0, a0, 1
	sw	a0, -32(s0)
	j	.LBB4_1
.LBB4_4:
	lui	a0, %hi(.L.str.1)
	addi	a0, a0, %lo(.L.str.1)
	call	printf
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 32
	ret
.Lfunc_end4:
	.size	printArray, .Lfunc_end4-printArray
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   # @main
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
	li	a0, 0
	sw	a0, -20(s0)
	lui	a0, 10
	addiw	a0, a0, -956
	call	malloc
	sd	a0, -32(s0)
	li	a0, 1
	sw	a0, -36(s0)
	lui	a0, 2
	addiw	a0, a0, 1809
	sw	a0, -40(s0)
	j	.LBB5_1
.LBB5_1:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -40(s0)
	bltz	a0, .LBB5_4
	j	.LBB5_2
.LBB5_2:                                #   in Loop: Header=BB5_1 Depth=1
	lw	a0, -40(s0)
	ld	a1, -32(s0)
	slli	a2, a0, 2
	add	a1, a1, a2
	sw	a0, 0(a1)
	j	.LBB5_3
.LBB5_3:                                #   in Loop: Header=BB5_1 Depth=1
	lw	a0, -40(s0)
	addiw	a0, a0, -1
	sw	a0, -40(s0)
	j	.LBB5_1
.LBB5_4:
	ld	a0, -32(s0)
	lui	a1, %hi(compare)
	addi	a3, a1, %lo(compare)
	lui	a1, 2
	addiw	a1, a1, 1809
	sd	a1, -48(s0)                     # 8-byte Folded Spill
	li	a2, 4
	call	qsort
	ld	a1, -48(s0)                     # 8-byte Folded Reload
	ld	a0, -32(s0)
	call	printArray
	li	a0, 0
	ld	ra, 40(sp)                      # 8-byte Folded Reload
	ld	s0, 32(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 48
	ret
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

	.ident	"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 2db031528e3e0e2d6ab6087af9bae9e0ccbdfc06)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym qsort
	.addrsig_sym swapfunc
	.addrsig_sym med3
	.addrsig_sym compare
	.addrsig_sym printArray
	.addrsig_sym printf
	.addrsig_sym malloc
