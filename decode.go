package main

import (
	"log"
	"strconv"

	"github.com/llir/llvm/ir"
	"github.com/llir/llvm/ir/constant"
	"github.com/llir/llvm/ir/enum"
	"github.com/llir/llvm/ir/types"
)

func (builder *IrBuilder) Decode(addr uint64, inst uint32, blk *ir.Block) bool {
	opcode := inst & OpcodeMask
	funct3 := (inst & Funct3Mask) >> 12
	funct7 := (inst & Funct7Mask) >> 25
	rd := getRd(inst)
	rs1 := getRs1(inst)
	rs2 := getRs2(inst)
	blk.NewCall(builder.UpdatePC(), constant.NewInt(types.I64, int64(addr)))
	switch opcode {
	case SYSCALL:
		result := blk.NewCall(builder.SYSCALL(), builder.IntRegs[10], builder.IntRegs[11], builder.IntRegs[12], builder.IntRegs[17])
		exit := blk.NewICmp(enum.IPredEQ, result, constant.NewInt(types.I1, 0))
		blk.NewCondBr(exit, builder.EndBlk, ir.NewBlock("@"+strconv.FormatUint(addr+4, 16)))
	case LUI:
		imm := constant.NewInt(types.I64, int64(getUtypeImm(inst)))
		blk.NewCall(builder.LUI(), builder.IntRegs[rd], imm)
	case AUIPC:
		imm := constant.NewInt(types.I64, int64(getUtypeImm(inst)))
		blk.NewCall(builder.AUIPC(), builder.IntRegs[rd], builder.PC, imm)
	case JAL:
		imm := constant.NewInt(types.I64, int64(getJtypeImm(inst)))
		blk.NewCall(builder.JAL(), builder.IntRegs[rd], builder.PC, imm)
		blk.NewBr(ir.NewBlock("AddressTable"))
	case JALR:
		imm := constant.NewInt(types.I64, int64(uint64(int64(int32(inst&ItypeImm))>>20)))
		blk.NewCall(builder.JALR(), builder.IntRegs[rd], builder.PC, builder.IntRegs[rs1], imm)
		blk.NewBr(ir.NewBlock("AddressTable"))
	case BType:
		imm := getBtypeImm(inst)
		goTrueAddr, goFalseAddr := addr+imm, addr+4
		goTureBlk := ir.NewBlock("@" + strconv.FormatUint(goTrueAddr, 16))
		goFalseBlk := ir.NewBlock("@" + strconv.FormatUint(goFalseAddr, 16))
		switch funct3 {
		case BEQ:
			result := blk.NewCall(builder.BEQ(), builder.IntRegs[rs1], builder.IntRegs[rs2])
			blk.NewCondBr(result, goTureBlk, goFalseBlk)
		case BNE:
			result := blk.NewCall(builder.BNE(), builder.IntRegs[rs1], builder.IntRegs[rs2])
			blk.NewCondBr(result, goTureBlk, goFalseBlk)
		case BLT:
			result := blk.NewCall(builder.BLT(), builder.IntRegs[rs1], builder.IntRegs[rs2])
			blk.NewCondBr(result, goTureBlk, goFalseBlk)
		case BGE:
			result := blk.NewCall(builder.BGE(), builder.IntRegs[rs1], builder.IntRegs[rs2])
			blk.NewCondBr(result, goTureBlk, goFalseBlk)
		case BLTU:
			result := blk.NewCall(builder.BLTU(), builder.IntRegs[rs1], builder.IntRegs[rs2])
			blk.NewCondBr(result, goTureBlk, goFalseBlk)
		case BGEU:
			result := blk.NewCall(builder.BGEU(), builder.IntRegs[rs1], builder.IntRegs[rs2])
			blk.NewCondBr(result, goTureBlk, goFalseBlk)
		}
	case IType:
		imm := constant.NewInt(types.I64, int64(getItypeImm(inst)))
		shamt := constant.NewInt(types.I64, int64(uint32(getItypeImm(inst)&0x3f)))
		switch funct3 {
		case ADDI:
			blk.NewCall(builder.ADDI(), builder.IntRegs[rd], builder.IntRegs[rs1], imm)
		case SLTI:
			blk.NewCall(builder.SLTI(), builder.IntRegs[rd], builder.IntRegs[rs1], imm)
		case SLTIU:
			blk.NewCall(builder.SLTIU(), builder.IntRegs[rd], builder.IntRegs[rs1], imm)
		case XORI:
			blk.NewCall(builder.XORI(), builder.IntRegs[rd], builder.IntRegs[rs1], imm)
		case ORI:
			blk.NewCall(builder.ORI(), builder.IntRegs[rd], builder.IntRegs[rs1], imm)
		case ANDI:
			blk.NewCall(builder.ANDI(), builder.IntRegs[rd], builder.IntRegs[rs1], imm)
		case SLLI:
			blk.NewCall(builder.SLLI(), builder.IntRegs[rd], builder.IntRegs[rs1], shamt)
		case SRI:
			switch funct7 {
			case SRLI, 1:
				blk.NewCall(builder.SRLI(), builder.IntRegs[rd], builder.IntRegs[rs1], shamt)
			case SRAI:
				blk.NewCall(builder.SRAI(), builder.IntRegs[rd], builder.IntRegs[rs1], shamt)
			}
		}
	case LOAD:
		imm := constant.NewInt(types.I64, int64(getItypeImm(inst)))
		// addr := blk.NewAdd(blk.NewLoad(types.I64, builder.IntRegs[rs1]), imm)
		// ptr := blk.NewGetElementPtr(builder.MemoryType, builder.Memory, constant.NewInt(types.I64, 0), addr)
		// blk.NewStore(blk.NewLoad(types.I64, ptr), builder.IntRegs[rd])
		switch funct3 {
		case LB:
			blk.NewCall(builder.LB(), builder.IntRegs[rd], builder.IntRegs[rs1], imm)
		case LH:
			blk.NewCall(builder.LH(), builder.IntRegs[rd], builder.IntRegs[rs1], imm)
		case LW:
			blk.NewCall(builder.LW(), builder.IntRegs[rd], builder.IntRegs[rs1], imm)
		case LD:
			blk.NewCall(builder.LD(), builder.IntRegs[rd], builder.IntRegs[rs1], imm)
		case LBU:
			blk.NewCall(builder.LBU(), builder.IntRegs[rd], builder.IntRegs[rs1], imm)
		case LHU:
			blk.NewCall(builder.LHU(), builder.IntRegs[rd], builder.IntRegs[rs1], imm)
		case LWU:
			blk.NewCall(builder.LWU(), builder.IntRegs[rd], builder.IntRegs[rs1], imm)
		}
	case SType:
		imm := constant.NewInt(types.I64, int64(getStypeImm(inst)))
		// addr := blk.NewAdd(blk.NewLoad(types.I64, builder.IntRegs[rs1]), imm)
		// ptr := blk.NewGetElementPtr(builder.MemoryType, builder.Memory, constant.NewInt(types.I64, 0), addr)
		// blk.NewStore(blk.NewLoad(types.I64, builder.IntRegs[rs2]), ptr)
		switch funct3 {
		case SB:
			blk.NewCall(builder.SB(), builder.IntRegs[rs1], builder.IntRegs[rs2], imm)
		case SH:
			blk.NewCall(builder.SH(), builder.IntRegs[rs1], builder.IntRegs[rs2], imm)
		case SW:
			blk.NewCall(builder.SW(), builder.IntRegs[rs1], builder.IntRegs[rs2], imm)
		case SD:
			blk.NewCall(builder.SD(), builder.IntRegs[rs1], builder.IntRegs[rs2], imm)
		}
	case RType:
		switch funct3 {
		case ADDSUB:
			switch funct7 {
			case ADD:
				blk.NewCall(builder.ADD(), builder.IntRegs[rd], builder.IntRegs[rs1], builder.IntRegs[rs2])
			case MUL:
				blk.NewCall(builder.MUL(), builder.IntRegs[rd], builder.IntRegs[rs1], builder.IntRegs[rs2])
			case SUB:
				blk.NewCall(builder.SUB(), builder.IntRegs[rd], builder.IntRegs[rs1], builder.IntRegs[rs2])
			}
		case SLLMULH:
			switch funct7 {
			case SLL:
				blk.NewCall(builder.SLL(), builder.IntRegs[rd], builder.IntRegs[rs1], builder.IntRegs[rs2])
			case MULH:
				blk.NewCall(builder.MULH(), builder.IntRegs[rd], builder.IntRegs[rs1], builder.IntRegs[rs2])
			}
		case SLTMULHSU:
			switch funct7 {
			case SLT:
				blk.NewCall(builder.SLT(), builder.IntRegs[rd], builder.IntRegs[rs1], builder.IntRegs[rs2])
			case MULHSU:
				blk.NewCall(builder.MULHSU(), builder.IntRegs[rd], builder.IntRegs[rs1], builder.IntRegs[rs2])
			}
		case SLTUMULHU:
			switch funct7 {
			case SLTU:
				blk.NewCall(builder.SLTU(), builder.IntRegs[rd], builder.IntRegs[rs1], builder.IntRegs[rs2])
			case MULHU:
				blk.NewCall(builder.MULHU(), builder.IntRegs[rd], builder.IntRegs[rs1], builder.IntRegs[rs2])
			}
		case XORDIV:
			switch funct7 {
			case XOR:
				blk.NewCall(builder.XOR(), builder.IntRegs[rd], builder.IntRegs[rs1], builder.IntRegs[rs2])
			case DIV:
				blk.NewCall(builder.DIV(), builder.IntRegs[rd], builder.IntRegs[rs1], builder.IntRegs[rs2])
			}
		case SR:
			switch funct7 {
			case SRL:
				blk.NewCall(builder.SRL(), builder.IntRegs[rd], builder.IntRegs[rs1], builder.IntRegs[rs2])
			case SRA:
				blk.NewCall(builder.SRA(), builder.IntRegs[rd], builder.IntRegs[rs1], builder.IntRegs[rs2])
			case DIVU:
				blk.NewCall(builder.DIVU(), builder.IntRegs[rd], builder.IntRegs[rs1], builder.IntRegs[rs2])
			}
		case ORREM:
			switch funct7 {
			case OR:
				blk.NewCall(builder.OR(), builder.IntRegs[rd], builder.IntRegs[rs1], builder.IntRegs[rs2])
			case REM:
				blk.NewCall(builder.REM(), builder.IntRegs[rd], builder.IntRegs[rs1], builder.IntRegs[rs2])
			}
		case ANDREMU:
			switch funct7 {
			case AND:
				blk.NewCall(builder.AND(), builder.IntRegs[rd], builder.IntRegs[rs1], builder.IntRegs[rs2])
			case REMU:
				blk.NewCall(builder.REMU(), builder.IntRegs[rd], builder.IntRegs[rs1], builder.IntRegs[rs2])
			}
		}
	case IType64:
		imm := constant.NewInt(types.I32, int64(getItype64Imm(inst)))
		shamt := constant.NewInt(types.I32, int64(uint32(getItype64Imm(inst)&0x1f)))
		switch funct3 {
		case ADDIW:
			blk.NewCall(builder.ADDIW(), builder.IntRegs[rd], builder.IntRegs[rs1], imm)
		case SLLIW:
			blk.NewCall(builder.SLLIW(), builder.IntRegs[rd], builder.IntRegs[rs1], shamt)
		case SRIW:
			switch funct7 {
			case SRLIW:
				blk.NewCall(builder.SRLIW(), builder.IntRegs[rd], builder.IntRegs[rs1], shamt)
			case SRAIW:
				blk.NewCall(builder.SRAIW(), builder.IntRegs[rd], builder.IntRegs[rs1], shamt)
			}
		}
	case RType64:
		switch funct3 {
		case ADDSUBW:
			switch funct7 {
			case ADDW:
				blk.NewCall(builder.ADDW(), builder.IntRegs[rd], builder.IntRegs[rs1], builder.IntRegs[rs2])
			case MULW:
				blk.NewCall(builder.MULW(), builder.IntRegs[rd], builder.IntRegs[rs1], builder.IntRegs[rs2])
			case SUBW:
				blk.NewCall(builder.SUBW(), builder.IntRegs[rd], builder.IntRegs[rs1], builder.IntRegs[rs2])
			}
		case SLLW:
			blk.NewCall(builder.SLLW(), builder.IntRegs[rd], builder.IntRegs[rs1], builder.IntRegs[rs2])
		case DIVW:
			blk.NewCall(builder.DIVW(), builder.IntRegs[rd], builder.IntRegs[rs1], builder.IntRegs[rs2])
		case REMW:
			blk.NewCall(builder.REMW(), builder.IntRegs[rd], builder.IntRegs[rs1], builder.IntRegs[rs2])
		case REMUW:
			blk.NewCall(builder.REMUW(), builder.IntRegs[rd], builder.IntRegs[rs1], builder.IntRegs[rs2])
		case SRW:
			switch funct7 {
			case SRLW:
				blk.NewCall(builder.SRLW(), builder.IntRegs[rd], builder.IntRegs[rs1], builder.IntRegs[rs2])
			case DIVUW:
				blk.NewCall(builder.DIVUW(), builder.IntRegs[rd], builder.IntRegs[rs1], builder.IntRegs[rs2])
			case SRAW:
				blk.NewCall(builder.SRAW(), builder.IntRegs[rd], builder.IntRegs[rs1], builder.IntRegs[rs2])
			}
		}
	case 0x0:
		return false
	default:
		log.Fatalf("Unknown opcode: %x", opcode)
	}
	return true
}

// inst[11:7]
func getRd(inst uint32) uint32 {
	return (inst & RdMask) >> 7
}

// inst[19:15]
func getRs1(inst uint32) uint32 {
	return (inst & Rs1Mask) >> 15
}

// inst[24:20]
func getRs2(inst uint32) uint32 {
	return (inst & Rs2Mask) >> 20
}

// imm[11:0] = inst[31:20]
func getItypeImm(inst uint32) uint64 {
	return uint64(int64(int32(inst&ItypeImm)) >> 20)
}

// imm[11:5|4:0] = inst[31:25|11:7]
func getStypeImm(inst uint32) uint64 {
	return uint64(int64(int32(inst&StypeImm_11_5))>>20) | uint64((inst&StypeImm_4_0)>>7)
}

// imm[12|10:5|4:1|11] = inst[31|30:25|11:8|7]
func getBtypeImm(inst uint32) uint64 {
	return uint64(int64(int32(inst&BtypeImm_12))>>19) | // imm[12]
		uint64((inst&BtypeImm_11)<<4) | // imm[11]
		uint64((inst&BtypeImm_10_5)>>20) | // imm[10:5]
		uint64((inst&BtypeImm_4_1)>>7) // imm[4:1]
}

// imm[31:12] = inst[31:12]
func getUtypeImm(inst uint32) uint64 {
	return uint64(int64(int32(inst & UtypeImm)))
}

// imm[20|10:1|11|19:12] = inst[31|30:21|20|19:12]
func getJtypeImm(inst uint32) uint64 {
	return uint64(int64(int32(inst&JtypeImm_20))>>11) | // imm[20]
		uint64((inst & JtypeImm_19_12)) | // imm[19:12]
		uint64((inst&JtypeImm_11)>>9) | // imm[11]
		uint64((inst&JtypeImm_10_1)>>20) // imm[10:1]
}

func getItype64Imm(inst uint32) uint64 {
	return uint64(int64(int32(inst)) >> 20)
}
