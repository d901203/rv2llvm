package main

import (
	"github.com/llir/llvm/ir"
	"github.com/llir/llvm/ir/constant"
	"github.com/llir/llvm/ir/enum"
	"github.com/llir/llvm/ir/types"
	"github.com/llir/llvm/ir/value"
)

func (builder *IrBuilder) LUI() *ir.Func {
	if v, ok := builder.IrFuncMap["LUI"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("LUI", types.Void, ir.NewParam("rd", types.I64Ptr), ir.NewParam("imm", types.I64))
		blk := f.NewBlock("")
		blk.NewStore(f.Params[1], f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["LUI"] = f
		return f
	}
}

func (builder *IrBuilder) AUIPC() *ir.Func {
	if v, ok := builder.IrFuncMap["AUIPC"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("AUIPC", types.Void,
			ir.NewParam("rd", types.I64Ptr),
			ir.NewParam("pc", types.I64Ptr),
			ir.NewParam("imm", types.I64))
		blk := f.NewBlock("")
		pcVal := blk.NewLoad(types.I64, f.Params[1])
		blk.NewStore(blk.NewAdd(pcVal, f.Params[2]), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["AUIPC"] = f
		return f
	}
}

func (builder *IrBuilder) JAL() *ir.Func {
	if v, ok := builder.IrFuncMap["JAL"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("JAL", types.Void,
			ir.NewParam("rd", types.I64Ptr),
			ir.NewParam("pc", types.I64Ptr),
			ir.NewParam("imm", types.I64))
		blk := f.NewBlock("")
		pcVal := blk.NewLoad(types.I64, f.Params[1])
		blk.NewStore(blk.NewAdd(pcVal, constant.NewInt(types.I64, 4)), f.Params[0])
		blk.NewStore(blk.NewAdd(pcVal, f.Params[2]), f.Params[1])
		blk.NewRet(nil)
		builder.IrFuncMap["JAL"] = f
		return f
	}
}

func (builder *IrBuilder) JALR() *ir.Func {
	if v, ok := builder.IrFuncMap["JALR"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("JALR", types.Void,
			ir.NewParam("rd", types.I64Ptr),
			ir.NewParam("pc", types.I64Ptr),
			ir.NewParam("rs1", types.I64Ptr),
			ir.NewParam("imm", types.I64))
		blk := f.NewBlock("")
		pcVal := blk.NewLoad(types.I64, f.Params[1])
		t := blk.NewAdd(pcVal, constant.NewInt(types.I64, 4))
		rs1Val := blk.NewLoad(types.I64, f.Params[2])
		addr := blk.NewAnd(blk.NewAdd(rs1Val, f.Params[3]), constant.NewInt(types.I64, int64(^1)))
		blk.NewStore(addr, f.Params[1])
		blk.NewStore(t, f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["JALR"] = f
		return f
	}
}

func (builder *IrBuilder) LoadChar() *ir.Func {
	if v, ok := builder.IrFuncMap["LoadChar"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("LoadChar", types.I8Ptr,
			ir.NewParam("addr", types.I64),
		)
		blk := f.NewBlock("")
		ptr := blk.NewGetElementPtr(builder.MemoryType, builder.Memory, constant.NewInt(types.I64, 0), f.Params[0])
		blk.NewRet(ptr)
		builder.IrFuncMap["LoadChar"] = f
		return f
	}
}

func (builder *IrBuilder) LB() *ir.Func {
	if v, ok := builder.IrFuncMap["LB"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("LB", types.Void,
			ir.NewParam("rd", types.I64Ptr),
			ir.NewParam("rs1", types.I64Ptr),
			ir.NewParam("imm", types.I64))
		blk := f.NewBlock("")
		base := blk.NewAdd(blk.NewLoad(types.I64, f.Params[1]), f.Params[2])
		ptr := blk.NewGetElementPtr(builder.MemoryType, builder.Memory, constant.NewInt(types.I64, 0), base)
		var value value.Value = blk.NewSExt(blk.NewLoad(types.I8, ptr), types.I64)
		blk.NewStore(value, f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["LB"] = f
		return f
	}
}

func (builder *IrBuilder) LH() *ir.Func {
	if v, ok := builder.IrFuncMap["LH"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("LH", types.Void,
			ir.NewParam("rd", types.I64Ptr),
			ir.NewParam("rs1", types.I64Ptr),
			ir.NewParam("imm", types.I64))
		blk := f.NewBlock("")
		base := blk.NewAdd(blk.NewLoad(types.I64, f.Params[1]), f.Params[2])
		ptr := blk.NewGetElementPtr(builder.MemoryType, builder.Memory, constant.NewInt(types.I64, 0), base)
		var value value.Value = blk.NewZExt(blk.NewLoad(types.I8, ptr), types.I64)
		for i := 1; i < 2; i++ {
			offset := blk.NewAdd(base, constant.NewInt(types.I64, int64(i)))
			ptr := blk.NewGetElementPtr(builder.MemoryType, builder.Memory, constant.NewInt(types.I64, 0), offset)
			v := blk.NewShl(blk.NewZExt(blk.NewLoad(types.I8, ptr), types.I64), constant.NewInt(types.I64, int64(i*8)))
			value = blk.NewOr(value, v)
		}
		blk.NewStore(value, f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["LH"] = f
		return f
	}
}

func (builder *IrBuilder) LW() *ir.Func {
	if v, ok := builder.IrFuncMap["LW"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("LW", types.Void,
			ir.NewParam("rd", types.I64Ptr),
			ir.NewParam("rs1", types.I64Ptr),
			ir.NewParam("imm", types.I64))
		blk := f.NewBlock("")
		base := blk.NewAdd(blk.NewLoad(types.I64, f.Params[1]), f.Params[2])
		ptr := blk.NewGetElementPtr(builder.MemoryType, builder.Memory, constant.NewInt(types.I64, 0), base)
		var value value.Value = blk.NewZExt(blk.NewLoad(types.I8, ptr), types.I64)
		for i := 1; i < 4; i++ {
			offset := blk.NewAdd(base, constant.NewInt(types.I64, int64(i)))
			ptr := blk.NewGetElementPtr(builder.MemoryType, builder.Memory, constant.NewInt(types.I64, 0), offset)
			v := blk.NewShl(blk.NewZExt(blk.NewLoad(types.I8, ptr), types.I64), constant.NewInt(types.I64, int64(i*8)))
			value = blk.NewOr(value, v)
		}
		blk.NewStore(value, f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["LW"] = f
		return f
	}
}

func (builder *IrBuilder) LD() *ir.Func {
	if v, ok := builder.IrFuncMap["LD"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("LD", types.Void,
			ir.NewParam("rd", types.I64Ptr),
			ir.NewParam("rs1", types.I64Ptr),
			ir.NewParam("imm", types.I64))
		blk := f.NewBlock("")
		base := blk.NewAdd(blk.NewLoad(types.I64, f.Params[1]), f.Params[2])
		ptr := blk.NewGetElementPtr(builder.MemoryType, builder.Memory, constant.NewInt(types.I64, 0), base)
		var value value.Value = blk.NewZExt(blk.NewLoad(types.I8, ptr), types.I64)
		for i := 1; i < 8; i++ {
			offset := blk.NewAdd(base, constant.NewInt(types.I64, int64(i)))
			ptr := blk.NewGetElementPtr(builder.MemoryType, builder.Memory, constant.NewInt(types.I64, 0), offset)
			v := blk.NewShl(blk.NewZExt(blk.NewLoad(types.I8, ptr), types.I64), constant.NewInt(types.I64, int64(i*8)))
			value = blk.NewOr(value, v)
		}
		blk.NewStore(value, f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["LD"] = f
		return f
	}
}

func (builder *IrBuilder) LBU() *ir.Func {
	if v, ok := builder.IrFuncMap["LBU"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("LBU", types.Void,
			ir.NewParam("rd", types.I64Ptr),
			ir.NewParam("rs1", types.I64Ptr),
			ir.NewParam("imm", types.I64))
		blk := f.NewBlock("")
		base := blk.NewAdd(blk.NewLoad(types.I64, f.Params[1]), f.Params[2])
		ptr := blk.NewGetElementPtr(builder.MemoryType, builder.Memory, constant.NewInt(types.I64, 0), base)
		var value value.Value = blk.NewZExt(blk.NewLoad(types.I8, ptr), types.I64)
		blk.NewStore(value, f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["LBU"] = f
		return f
	}
}

func (builder *IrBuilder) LHU() *ir.Func {
	if v, ok := builder.IrFuncMap["LHU"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("LHU", types.Void,
			ir.NewParam("rd", types.I64Ptr),
			ir.NewParam("rs1", types.I64Ptr),
			ir.NewParam("imm", types.I64))
		blk := f.NewBlock("")
		base := blk.NewAdd(blk.NewLoad(types.I64, f.Params[1]), f.Params[2])
		ptr := blk.NewGetElementPtr(builder.MemoryType, builder.Memory, constant.NewInt(types.I64, 0), base)
		var value value.Value = blk.NewZExt(blk.NewLoad(types.I8, ptr), types.I64)
		for i := 1; i < 2; i++ {
			offset := blk.NewAdd(base, constant.NewInt(types.I64, int64(i)))
			ptr := blk.NewGetElementPtr(builder.MemoryType, builder.Memory, constant.NewInt(types.I64, 0), offset)
			v := blk.NewShl(blk.NewZExt(blk.NewLoad(types.I8, ptr), types.I64), constant.NewInt(types.I64, int64(i*8)))
			value = blk.NewOr(value, v)
		}
		blk.NewStore(value, f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["LHU"] = f
		return f
	}
}

func (builder *IrBuilder) LWU() *ir.Func {
	if v, ok := builder.IrFuncMap["LWU"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("LWU", types.Void,
			ir.NewParam("rd", types.I64Ptr),
			ir.NewParam("rs1", types.I64Ptr),
			ir.NewParam("imm", types.I64))
		blk := f.NewBlock("")
		base := blk.NewAdd(blk.NewLoad(types.I64, f.Params[1]), f.Params[2])
		ptr := blk.NewGetElementPtr(builder.MemoryType, builder.Memory, constant.NewInt(types.I64, 0), base)
		var value value.Value = blk.NewZExt(blk.NewLoad(types.I8, ptr), types.I64)
		for i := 1; i < 4; i++ {
			offset := blk.NewAdd(base, constant.NewInt(types.I64, int64(i)))
			ptr := blk.NewGetElementPtr(builder.MemoryType, builder.Memory, constant.NewInt(types.I64, 0), offset)
			v := blk.NewShl(blk.NewZExt(blk.NewLoad(types.I8, ptr), types.I64), constant.NewInt(types.I64, int64(i*8)))
			value = blk.NewOr(value, v)
		}
		blk.NewStore(value, f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["LWU"] = f
		return f
	}
}

func (builder *IrBuilder) InitSB() *ir.Func {
	if v, ok := builder.IrFuncMap["InitSB"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("InitSB", types.Void,
			ir.NewParam("addr", types.I64),
			ir.NewParam("val", types.I8))
		blk := f.NewBlock("")
		writeMask := constant.NewInt(types.I8, 0xff)
		ptr := blk.NewGetElementPtr(builder.MemoryType, builder.Memory, constant.NewInt(types.I64, 0), f.Params[0])
		v := blk.NewAnd(f.Params[1], writeMask)
		blk.NewStore(v, ptr)
		blk.NewRet(nil)
		builder.IrFuncMap["InitSB"] = f
		return f
	}
}

func (builder *IrBuilder) SB() *ir.Func {
	if v, ok := builder.IrFuncMap["SB"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("SB", types.Void,
			ir.NewParam("rs1", types.I64Ptr),
			ir.NewParam("rs2", types.I64Ptr),
			ir.NewParam("imm", types.I64))
		blk := f.NewBlock("")
		value := blk.NewLoad(types.I64, f.Params[1])
		base := blk.NewAdd(blk.NewLoad(types.I64, f.Params[0]), f.Params[2])
		writeMask := constant.NewInt(types.I8, 0xff)
		ptr := blk.NewGetElementPtr(builder.MemoryType, builder.Memory, constant.NewInt(types.I64, 0), base)
		v := blk.NewTrunc(blk.NewAnd(value, writeMask), types.I8)
		blk.NewStore(v, ptr)
		blk.NewRet(nil)
		builder.IrFuncMap["SB"] = f
		return f
	}
}

func (builder *IrBuilder) SH() *ir.Func {
	if v, ok := builder.IrFuncMap["SH"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("SH", types.Void,
			ir.NewParam("rs1", types.I64Ptr),
			ir.NewParam("rs2", types.I64Ptr),
			ir.NewParam("imm", types.I64))
		blk := f.NewBlock("")
		value := blk.NewLoad(types.I64, f.Params[1])
		base := blk.NewAdd(blk.NewLoad(types.I64, f.Params[0]), f.Params[2])
		writeMask := constant.NewInt(types.I8, 0xff)
		for i := 0; i < 2; i++ {
			offset := blk.NewAdd(base, constant.NewInt(types.I64, int64(i)))
			ptr := blk.NewGetElementPtr(builder.MemoryType, builder.Memory, constant.NewInt(types.I64, 0), offset)
			v := blk.NewTrunc(blk.NewAnd(blk.NewLShr(value, constant.NewInt(types.I64, int64(i*8))), writeMask), types.I8)
			blk.NewStore(v, ptr)
		}
		blk.NewRet(nil)
		builder.IrFuncMap["SH"] = f
		return f
	}

}

func (builder *IrBuilder) SW() *ir.Func {
	if v, ok := builder.IrFuncMap["SW"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("SW", types.Void,
			ir.NewParam("rs1", types.I64Ptr),
			ir.NewParam("rs2", types.I64Ptr),
			ir.NewParam("imm", types.I64))
		blk := f.NewBlock("")
		value := blk.NewLoad(types.I64, f.Params[1])
		base := blk.NewAdd(blk.NewLoad(types.I64, f.Params[0]), f.Params[2])
		writeMask := constant.NewInt(types.I8, 0xff)
		for i := 0; i < 4; i++ {
			offset := blk.NewAdd(base, constant.NewInt(types.I64, int64(i)))
			ptr := blk.NewGetElementPtr(builder.MemoryType, builder.Memory, constant.NewInt(types.I64, 0), offset)
			v := blk.NewTrunc(blk.NewAnd(blk.NewLShr(value, constant.NewInt(types.I64, int64(i*8))), writeMask), types.I8)
			blk.NewStore(v, ptr)
		}
		blk.NewRet(nil)
		builder.IrFuncMap["SW"] = f
		return f
	}
}

func (builder *IrBuilder) SD() *ir.Func {
	if v, ok := builder.IrFuncMap["SD"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("SD", types.Void,
			ir.NewParam("rs1", types.I64Ptr),
			ir.NewParam("rs2", types.I64Ptr),
			ir.NewParam("imm", types.I64))
		blk := f.NewBlock("")
		value := blk.NewLoad(types.I64, f.Params[1])
		base := blk.NewAdd(blk.NewLoad(types.I64, f.Params[0]), f.Params[2])
		writeMask := constant.NewInt(types.I8, 0xff)
		for i := 0; i < 8; i++ {
			offset := blk.NewAdd(base, constant.NewInt(types.I64, int64(i)))
			ptr := blk.NewGetElementPtr(builder.MemoryType, builder.Memory, constant.NewInt(types.I64, 0), offset)
			v := blk.NewTrunc(blk.NewAnd(blk.NewLShr(value, constant.NewInt(types.I64, int64(i*8))), writeMask), types.I8)
			blk.NewStore(v, ptr)
		}
		blk.NewRet(nil)
		builder.IrFuncMap["SD"] = f
		return f
	}

}

func (builder *IrBuilder) BEQ() *ir.Func {
	if v, ok := builder.IrFuncMap["BEQ"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("BEQ", types.I1,
			ir.NewParam("rs1", types.I64Ptr),
			ir.NewParam("rs2", types.I64Ptr))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[0])
		rs2Val := blk.NewLoad(types.I64, f.Params[1])
		cond := blk.NewICmp(enum.IPredEQ, rs1Val, rs2Val)
		blk.NewRet(cond)
		builder.IrFuncMap["BEQ"] = f
		return f
	}
}

func (builder *IrBuilder) BNE() *ir.Func {
	if v, ok := builder.IrFuncMap["BNE"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("BNE", types.I1,
			ir.NewParam("rs1", types.I64Ptr),
			ir.NewParam("rs2", types.I64Ptr))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[0])
		rs2Val := blk.NewLoad(types.I64, f.Params[1])
		cond := blk.NewICmp(enum.IPredNE, rs1Val, rs2Val)
		blk.NewRet(cond)
		builder.IrFuncMap["BNE"] = f
		return f
	}
}

func (builder *IrBuilder) BLT() *ir.Func {
	if v, ok := builder.IrFuncMap["BLT"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("BLT", types.I1,
			ir.NewParam("rs1", types.I64Ptr),
			ir.NewParam("rs2", types.I64Ptr))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[0])
		rs2Val := blk.NewLoad(types.I64, f.Params[1])
		cond := blk.NewICmp(enum.IPredSLT, rs1Val, rs2Val)
		blk.NewRet(cond)
		builder.IrFuncMap["BLT"] = f
		return f
	}
}

func (builder *IrBuilder) BGE() *ir.Func {
	if v, ok := builder.IrFuncMap["BGE"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("BGE", types.I1,
			ir.NewParam("rs1", types.I64Ptr),
			ir.NewParam("rs2", types.I64Ptr))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[0])
		rs2Val := blk.NewLoad(types.I64, f.Params[1])
		cond := blk.NewICmp(enum.IPredSGE, rs1Val, rs2Val)
		blk.NewRet(cond)
		builder.IrFuncMap["BGE"] = f
		return f
	}
}

func (builder *IrBuilder) BLTU() *ir.Func {
	if v, ok := builder.IrFuncMap["BLTU"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("BLTU", types.I1,
			ir.NewParam("rs1", types.I64Ptr),
			ir.NewParam("rs2", types.I64Ptr))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[0])
		rs2Val := blk.NewLoad(types.I64, f.Params[1])
		cond := blk.NewICmp(enum.IPredULT, rs1Val, rs2Val)
		blk.NewRet(cond)
		builder.IrFuncMap["BLTU"] = f
		return f
	}
}

func (builder *IrBuilder) BGEU() *ir.Func {
	if v, ok := builder.IrFuncMap["BGEU"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("BGEU", types.I1,
			ir.NewParam("rs1", types.I64Ptr),
			ir.NewParam("rs2", types.I64Ptr))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[0])
		rs2Val := blk.NewLoad(types.I64, f.Params[1])
		cond := blk.NewICmp(enum.IPredUGE, rs1Val, rs2Val)
		blk.NewRet(cond)
		builder.IrFuncMap["BGEU"] = f
		return f
	}
}

func (builder *IrBuilder) ADDI() *ir.Func {
	if v, ok := builder.IrFuncMap["ADDI"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("ADDI", types.Void, ir.NewParam("rd", types.I64Ptr), ir.NewParam("rs1", types.I64Ptr), ir.NewParam("imm", types.I64))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[1])
		blk.NewStore(blk.NewAdd(rs1Val, f.Params[2]), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["ADDI"] = f
		return f
	}
}

func (builder *IrBuilder) SLTI() *ir.Func {
	if v, ok := builder.IrFuncMap["SLTI"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("SLTI", types.Void, ir.NewParam("rd", types.I64Ptr), ir.NewParam("rs1", types.I64Ptr), ir.NewParam("imm", types.I64))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[1])
		result := blk.NewICmp(enum.IPredSLT, rs1Val, f.Params[2])
		blk.NewStore(blk.NewZExt(result, types.I64), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["SLTI"] = f
		return f
	}
}

func (builder *IrBuilder) SLTIU() *ir.Func {
	if v, ok := builder.IrFuncMap["SLTIU"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("SLTIU", types.Void, ir.NewParam("rd", types.I64Ptr), ir.NewParam("rs1", types.I64Ptr), ir.NewParam("imm", types.I64))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[1])
		result := blk.NewICmp(enum.IPredULT, rs1Val, f.Params[2])
		blk.NewStore(blk.NewZExt(result, types.I64), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["SLTIU"] = f
		return f
	}
}

func (builder *IrBuilder) XORI() *ir.Func {
	if v, ok := builder.IrFuncMap["XORI"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("XORI", types.Void, ir.NewParam("rd", types.I64Ptr), ir.NewParam("rs1", types.I64Ptr), ir.NewParam("imm", types.I64))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[1])
		blk.NewStore(blk.NewXor(rs1Val, f.Params[2]), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["XORI"] = f
		return f
	}
}

func (builder *IrBuilder) ORI() *ir.Func {
	if v, ok := builder.IrFuncMap["ORI"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("ORI", types.Void, ir.NewParam("rd", types.I64Ptr), ir.NewParam("rs1", types.I64Ptr), ir.NewParam("imm", types.I64))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[1])
		blk.NewStore(blk.NewOr(rs1Val, f.Params[2]), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["ORI"] = f
		return f
	}
}

func (builder *IrBuilder) ANDI() *ir.Func {
	if v, ok := builder.IrFuncMap["ANDI"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("ANDI", types.Void, ir.NewParam("rd", types.I64Ptr), ir.NewParam("rs1", types.I64Ptr), ir.NewParam("imm", types.I64))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[1])
		blk.NewStore(blk.NewAnd(rs1Val, f.Params[2]), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["ANDI"] = f
		return f
	}
}

func (builder *IrBuilder) SLLI() *ir.Func {
	if v, ok := builder.IrFuncMap["SLLI"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("SLLI", types.Void, ir.NewParam("rd", types.I64Ptr), ir.NewParam("rs1", types.I64Ptr), ir.NewParam("shamt", types.I64))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[1])
		blk.NewStore(blk.NewShl(rs1Val, f.Params[2]), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["SLLI"] = f
		return f
	}
}

func (builder *IrBuilder) SRLI() *ir.Func {
	if v, ok := builder.IrFuncMap["SRLI"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("SRLI", types.Void, ir.NewParam("rd", types.I64Ptr), ir.NewParam("rs1", types.I64Ptr), ir.NewParam("shamt", types.I64))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[1])
		blk.NewStore(blk.NewLShr(rs1Val, f.Params[2]), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["SRLI"] = f
		return f
	}
}

func (builder *IrBuilder) SRAI() *ir.Func {
	if v, ok := builder.IrFuncMap["SRAI"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("SRAI", types.Void, ir.NewParam("rd", types.I64Ptr), ir.NewParam("rs1", types.I64Ptr), ir.NewParam("shamt", types.I64))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[1])
		blk.NewStore(blk.NewAShr(rs1Val, f.Params[2]), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["SRAI"] = f
		return f
	}
}

func (builder *IrBuilder) ADD() *ir.Func {
	if v, ok := builder.IrFuncMap["ADD"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("ADD", types.Void, ir.NewParam("rd", types.I64Ptr), ir.NewParam("rs1", types.I64Ptr), ir.NewParam("rs2", types.I64Ptr))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[1])
		rs2Val := blk.NewLoad(types.I64, f.Params[2])
		blk.NewStore(blk.NewAdd(rs1Val, rs2Val), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["ADD"] = f
		return f
	}
}

func (builder *IrBuilder) MUL() *ir.Func {
	if v, ok := builder.IrFuncMap["MUL"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("MUL", types.Void, ir.NewParam("rd", types.I64Ptr), ir.NewParam("rs1", types.I64Ptr), ir.NewParam("rs2", types.I64Ptr))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[1])
		rs2Val := blk.NewLoad(types.I64, f.Params[2])
		blk.NewStore(blk.NewMul(rs1Val, rs2Val), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["MUL"] = f
		return f
	}
}

func (builder *IrBuilder) SUB() *ir.Func {
	if v, ok := builder.IrFuncMap["SUB"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("SUB", types.Void, ir.NewParam("rd", types.I64Ptr), ir.NewParam("rs1", types.I64Ptr), ir.NewParam("rs2", types.I64Ptr))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[1])
		rs2Val := blk.NewLoad(types.I64, f.Params[2])
		blk.NewStore(blk.NewSub(rs1Val, rs2Val), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["SUB"] = f
		return f
	}
}

func (builder *IrBuilder) SLL() *ir.Func {
	if v, ok := builder.IrFuncMap["SLL"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("SLL", types.Void, ir.NewParam("rd", types.I64Ptr), ir.NewParam("rs1", types.I64Ptr), ir.NewParam("rs2", types.I64Ptr))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[1])
		rs2Val := blk.NewLoad(types.I64, f.Params[2])
		blk.NewStore(blk.NewShl(rs1Val, rs2Val), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["SLL"] = f
		return f
	}
}

func (builder *IrBuilder) MULH() *ir.Func {
	if v, ok := builder.IrFuncMap["MULH"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("MULH", types.Void, ir.NewParam("rd", types.I64Ptr), ir.NewParam("rs1", types.I64Ptr), ir.NewParam("rs2", types.I64Ptr))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[1])
		rs2Val := blk.NewLoad(types.I64, f.Params[2])
		rs1Val32 := blk.NewTrunc(rs1Val, types.I32)
		rs2Val32 := blk.NewTrunc(rs2Val, types.I32)
		rs1Val64 := blk.NewSExt(rs1Val32, types.I64)
		rs2Val64 := blk.NewSExt(rs2Val32, types.I64)
		blk.NewStore(blk.NewMul(rs1Val64, rs2Val64), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["MULH"] = f
		return f
	}
}

func (builder *IrBuilder) MULHSU() *ir.Func {
	if v, ok := builder.IrFuncMap["MULHSU"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("MULHSU", types.Void, ir.NewParam("rd", types.I64Ptr), ir.NewParam("rs1", types.I64Ptr), ir.NewParam("rs2", types.I64Ptr))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[1])
		rs2Val := blk.NewLoad(types.I64, f.Params[2])
		rs1Val32 := blk.NewTrunc(rs1Val, types.I32)
		rs2Val32 := blk.NewTrunc(rs2Val, types.I32)
		rs1Val64 := blk.NewSExt(rs1Val32, types.I64)
		rs2Val64 := blk.NewZExt(rs2Val32, types.I64)
		blk.NewStore(blk.NewMul(rs1Val64, rs2Val64), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["MULHSU"] = f
		return f
	}
}

func (builder *IrBuilder) MULHU() *ir.Func {
	if v, ok := builder.IrFuncMap["MULHU"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("MULHU", types.Void, ir.NewParam("rd", types.I64Ptr), ir.NewParam("rs1", types.I64Ptr), ir.NewParam("rs2", types.I64Ptr))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[1])
		rs2Val := blk.NewLoad(types.I64, f.Params[2])
		rs1Val32 := blk.NewTrunc(rs1Val, types.I32)
		rs2Val32 := blk.NewTrunc(rs2Val, types.I32)
		rs1Val64 := blk.NewZExt(rs1Val32, types.I64)
		rs2Val64 := blk.NewZExt(rs2Val32, types.I64)
		blk.NewStore(blk.NewMul(rs1Val64, rs2Val64), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["MULHU"] = f
		return f
	}
}

func (builder *IrBuilder) MULW() *ir.Func {
	if v, ok := builder.IrFuncMap["MULW"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("MULW", types.Void, ir.NewParam("rd", types.I64Ptr), ir.NewParam("rs1", types.I64Ptr), ir.NewParam("rs2", types.I64Ptr))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[1])
		rs2Val := blk.NewLoad(types.I64, f.Params[2])
		rs1Val32 := blk.NewTrunc(rs1Val, types.I32)
		rs2Val32 := blk.NewTrunc(rs2Val, types.I32)
		blk.NewStore(blk.NewSExt(blk.NewMul(rs1Val32, rs2Val32), types.I64), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["MULW"] = f
		return f
	}
}

func (builder *IrBuilder) DIVW() *ir.Func {
	if v, ok := builder.IrFuncMap["DIVW"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("DIVW", types.Void, ir.NewParam("rd", types.I64Ptr), ir.NewParam("rs1", types.I64Ptr), ir.NewParam("rs2", types.I64Ptr))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[1])
		rs2Val := blk.NewLoad(types.I64, f.Params[2])
		rs1Val32 := blk.NewTrunc(rs1Val, types.I32)
		rs2Val32 := blk.NewTrunc(rs2Val, types.I32)
		blk.NewStore(blk.NewSExt(blk.NewSDiv(rs1Val32, rs2Val32), types.I64), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["DIVW"] = f
		return f
	}
}

func (builder *IrBuilder) DIVUW() *ir.Func {
	if v, ok := builder.IrFuncMap["DIVUW"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("DIVUW", types.Void, ir.NewParam("rd", types.I64Ptr), ir.NewParam("rs1", types.I64Ptr), ir.NewParam("rs2", types.I64Ptr))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[1])
		rs2Val := blk.NewLoad(types.I64, f.Params[2])
		rs1Val32 := blk.NewTrunc(rs1Val, types.I32)
		rs2Val32 := blk.NewTrunc(rs2Val, types.I32)
		blk.NewStore(blk.NewSExt(blk.NewUDiv(rs1Val32, rs2Val32), types.I64), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["DIVUW"] = f
		return f
	}
}

func (builder *IrBuilder) REMW() *ir.Func {
	if v, ok := builder.IrFuncMap["REMW"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("REMW", types.Void, ir.NewParam("rd", types.I64Ptr), ir.NewParam("rs1", types.I64Ptr), ir.NewParam("rs2", types.I64Ptr))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[1])
		rs2Val := blk.NewLoad(types.I64, f.Params[2])
		rs1Val32 := blk.NewTrunc(rs1Val, types.I32)
		rs2Val32 := blk.NewTrunc(rs2Val, types.I32)
		blk.NewStore(blk.NewSExt(blk.NewSRem(rs1Val32, rs2Val32), types.I64), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["REMW"] = f
		return f
	}
}

func (builder *IrBuilder) REMUW() *ir.Func {
	if v, ok := builder.IrFuncMap["REMUW"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("REMUW", types.Void, ir.NewParam("rd", types.I64Ptr), ir.NewParam("rs1", types.I64Ptr), ir.NewParam("rs2", types.I64Ptr))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[1])
		rs2Val := blk.NewLoad(types.I64, f.Params[2])
		rs1Val32 := blk.NewTrunc(rs1Val, types.I32)
		rs2Val32 := blk.NewTrunc(rs2Val, types.I32)
		blk.NewStore(blk.NewSExt(blk.NewURem(rs1Val32, rs2Val32), types.I64), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["REMUW"] = f
		return f
	}
}

func (builder *IrBuilder) SLT() *ir.Func {
	if v, ok := builder.IrFuncMap["SLT"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("SLT", types.Void, ir.NewParam("rd", types.I64Ptr), ir.NewParam("rs1", types.I64Ptr), ir.NewParam("rs2", types.I64Ptr))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[1])
		rs2Val := blk.NewLoad(types.I64, f.Params[2])
		result := blk.NewICmp(enum.IPredSLT, rs1Val, rs2Val)
		blk.NewStore(blk.NewZExt(result, types.I64), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["SLT"] = f
		return f
	}
}

func (builder *IrBuilder) SLTU() *ir.Func {
	if v, ok := builder.IrFuncMap["SLTU"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("SLTU", types.Void, ir.NewParam("rd", types.I64Ptr), ir.NewParam("rs1", types.I64Ptr), ir.NewParam("rs2", types.I64Ptr))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[1])
		rs2Val := blk.NewLoad(types.I64, f.Params[2])
		result := blk.NewICmp(enum.IPredULT, rs1Val, rs2Val)
		blk.NewStore(blk.NewZExt(result, types.I64), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["SLTU"] = f
		return f
	}
}

func (builder *IrBuilder) XOR() *ir.Func {
	if v, ok := builder.IrFuncMap["XOR"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("XOR", types.Void, ir.NewParam("rd", types.I64Ptr), ir.NewParam("rs1", types.I64Ptr), ir.NewParam("rs2", types.I64Ptr))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[1])
		rs2Val := blk.NewLoad(types.I64, f.Params[2])
		blk.NewStore(blk.NewXor(rs1Val, rs2Val), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["XOR"] = f
		return f
	}
}

func (builder *IrBuilder) DIV() *ir.Func {
	if v, ok := builder.IrFuncMap["DIV"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("DIV", types.Void, ir.NewParam("rd", types.I64Ptr), ir.NewParam("rs1", types.I64Ptr), ir.NewParam("rs2", types.I64Ptr))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[1])
		rs2Val := blk.NewLoad(types.I64, f.Params[2])
		blk.NewStore(blk.NewSDiv(rs1Val, rs2Val), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["DIV"] = f
		return f
	}
}

func (builder *IrBuilder) SRL() *ir.Func {
	if v, ok := builder.IrFuncMap["SRI"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("SRI", types.Void, ir.NewParam("rd", types.I64Ptr), ir.NewParam("rs1", types.I64Ptr), ir.NewParam("rs2", types.I64Ptr))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[1])
		rs2Val := blk.NewLoad(types.I64, f.Params[2])
		blk.NewStore(blk.NewLShr(rs1Val, rs2Val), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["SRI"] = f
		return f
	}
}

func (builder *IrBuilder) SRA() *ir.Func {
	if v, ok := builder.IrFuncMap["SRA"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("SRA", types.Void, ir.NewParam("rd", types.I64Ptr), ir.NewParam("rs1", types.I64Ptr), ir.NewParam("rs2", types.I64Ptr))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[1])
		rs2Val := blk.NewLoad(types.I64, f.Params[2])
		blk.NewStore(blk.NewAShr(rs1Val, rs2Val), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["SRA"] = f
		return f
	}
}

func (builder *IrBuilder) DIVU() *ir.Func {
	if v, ok := builder.IrFuncMap["DIVU"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("DIVU", types.Void, ir.NewParam("rd", types.I64Ptr), ir.NewParam("rs1", types.I64Ptr), ir.NewParam("rs2", types.I64Ptr))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[1])
		rs2Val := blk.NewLoad(types.I64, f.Params[2])
		blk.NewStore(blk.NewUDiv(rs1Val, rs2Val), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["DIVU"] = f
		return f
	}
}

func (builder *IrBuilder) OR() *ir.Func {
	if v, ok := builder.IrFuncMap["OR"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("OR", types.Void, ir.NewParam("rd", types.I64Ptr), ir.NewParam("rs1", types.I64Ptr), ir.NewParam("rs2", types.I64Ptr))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[1])
		rs2Val := blk.NewLoad(types.I64, f.Params[2])
		blk.NewStore(blk.NewOr(rs1Val, rs2Val), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["OR"] = f
		return f
	}
}

func (builder *IrBuilder) REM() *ir.Func {
	if v, ok := builder.IrFuncMap["REM"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("REM", types.Void, ir.NewParam("rd", types.I64Ptr), ir.NewParam("rs1", types.I64Ptr), ir.NewParam("rs2", types.I64Ptr))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[1])
		rs2Val := blk.NewLoad(types.I64, f.Params[2])
		blk.NewStore(blk.NewSRem(rs1Val, rs2Val), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["REM"] = f
		return f
	}
}

func (builder *IrBuilder) REMU() *ir.Func {
	if v, ok := builder.IrFuncMap["REMU"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("REMU", types.Void, ir.NewParam("rd", types.I64Ptr), ir.NewParam("rs1", types.I64Ptr), ir.NewParam("rs2", types.I64Ptr))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[1])
		rs2Val := blk.NewLoad(types.I64, f.Params[2])
		blk.NewStore(blk.NewURem(rs1Val, rs2Val), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["REMU"] = f
		return f
	}
}

func (builder *IrBuilder) AND() *ir.Func {
	if v, ok := builder.IrFuncMap["AND"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("AND", types.Void, ir.NewParam("rd", types.I64Ptr), ir.NewParam("rs1", types.I64Ptr), ir.NewParam("rs2", types.I64Ptr))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[1])
		rs2Val := blk.NewLoad(types.I64, f.Params[2])
		blk.NewStore(blk.NewAnd(rs1Val, rs2Val), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["AND"] = f
		return f
	}
}

func (builder *IrBuilder) ADDIW() *ir.Func {
	if v, ok := builder.IrFuncMap["ADDIW"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("ADDIW", types.Void, ir.NewParam("rd", types.I64Ptr), ir.NewParam("rs1", types.I64Ptr), ir.NewParam("imm", types.I32))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[1])
		rs1Val32 := blk.NewTrunc(rs1Val, types.I32)
		blk.NewStore(blk.NewSExt(blk.NewAdd(rs1Val32, f.Params[2]), types.I64), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["ADDIW"] = f
		return f
	}
}

func (builder *IrBuilder) SLLIW() *ir.Func {
	if v, ok := builder.IrFuncMap["SLLIW"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("SLLIW", types.Void, ir.NewParam("rd", types.I64Ptr), ir.NewParam("rs1", types.I64Ptr), ir.NewParam("shamt", types.I32))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[1])
		rs1Val32 := blk.NewTrunc(rs1Val, types.I32)
		blk.NewStore(blk.NewSExt(blk.NewShl(rs1Val32, f.Params[2]), types.I64), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["SLLIW"] = f
		return f
	}
}

func (builder *IrBuilder) SRLIW() *ir.Func {
	if v, ok := builder.IrFuncMap["SRLIW"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("SRLIW", types.Void, ir.NewParam("rd", types.I64Ptr), ir.NewParam("rs1", types.I64Ptr), ir.NewParam("shamt", types.I32))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[1])
		rs1Val32 := blk.NewTrunc(rs1Val, types.I32)
		blk.NewStore(blk.NewSExt(blk.NewLShr(rs1Val32, f.Params[2]), types.I64), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["SRLIW"] = f
		return f
	}
}

func (builder *IrBuilder) SRAIW() *ir.Func {
	if v, ok := builder.IrFuncMap["SRAIW"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("SRAIW", types.Void, ir.NewParam("rd", types.I64Ptr), ir.NewParam("rs1", types.I64Ptr), ir.NewParam("shamt", types.I32))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[1])
		rs1Val32 := blk.NewTrunc(rs1Val, types.I32)
		blk.NewStore(blk.NewSExt(blk.NewAShr(rs1Val32, f.Params[2]), types.I64), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["SRAIW"] = f
		return f
	}
}

func (builder *IrBuilder) ADDW() *ir.Func {
	if v, ok := builder.IrFuncMap["ADDW"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("ADDW", types.Void, ir.NewParam("rd", types.I64Ptr), ir.NewParam("rs1", types.I64Ptr), ir.NewParam("rs2", types.I64Ptr))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[1])
		rs2Val := blk.NewLoad(types.I64, f.Params[2])
		rs1Val32 := blk.NewTrunc(rs1Val, types.I32)
		rs2Val32 := blk.NewTrunc(rs2Val, types.I32)
		blk.NewStore(blk.NewSExt(blk.NewAdd(rs1Val32, rs2Val32), types.I64), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["ADDW"] = f
		return f
	}
}

func (builder *IrBuilder) SUBW() *ir.Func {
	if v, ok := builder.IrFuncMap["SUBW"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("SUBW", types.Void, ir.NewParam("rd", types.I64Ptr), ir.NewParam("rs1", types.I64Ptr), ir.NewParam("rs2", types.I64Ptr))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[1])
		rs2Val := blk.NewLoad(types.I64, f.Params[2])
		rs1Val32 := blk.NewTrunc(rs1Val, types.I32)
		rs2Val32 := blk.NewTrunc(rs2Val, types.I32)
		blk.NewStore(blk.NewSExt(blk.NewSub(rs1Val32, rs2Val32), types.I64), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["SUBW"] = f
		return f
	}
}

func (builder *IrBuilder) SLLW() *ir.Func {
	if v, ok := builder.IrFuncMap["SLLW"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("SLLW", types.Void, ir.NewParam("rd", types.I64Ptr), ir.NewParam("rs1", types.I64Ptr), ir.NewParam("rs2", types.I64Ptr))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[1])
		rs1Val32 := blk.NewTrunc(rs1Val, types.I32)
		rs2Val := blk.NewLoad(types.I64, f.Params[2])
		rs2Val32 := blk.NewTrunc(rs2Val, types.I32)
		shamt := blk.NewAnd(rs2Val32, constant.NewInt(types.I32, 0x1f))
		blk.NewStore(blk.NewSExt(blk.NewShl(rs1Val32, shamt), types.I64), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["SLLW"] = f
		return f
	}
}

func (builder *IrBuilder) SRLW() *ir.Func {
	if v, ok := builder.IrFuncMap["SRLW"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("SRLW", types.Void, ir.NewParam("rd", types.I64Ptr), ir.NewParam("rs1", types.I64Ptr), ir.NewParam("rs2", types.I64Ptr))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[1])
		rs1Val32 := blk.NewTrunc(rs1Val, types.I32)
		rs2Val := blk.NewLoad(types.I64, f.Params[2])
		rs2Val32 := blk.NewTrunc(rs2Val, types.I32)
		shamt := blk.NewAnd(rs2Val32, constant.NewInt(types.I32, 0x1f))
		blk.NewStore(blk.NewSExt(blk.NewLShr(rs1Val32, shamt), types.I64), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["SRLW"] = f
		return f
	}
}

func (builder *IrBuilder) SRAW() *ir.Func {
	if v, ok := builder.IrFuncMap["SRAW"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("SRAW", types.Void, ir.NewParam("rd", types.I64Ptr), ir.NewParam("rs1", types.I64Ptr), ir.NewParam("rs2", types.I64Ptr))
		blk := f.NewBlock("")
		rs1Val := blk.NewLoad(types.I64, f.Params[1])
		rs1Val32 := blk.NewTrunc(rs1Val, types.I32)
		rs2Val := blk.NewLoad(types.I64, f.Params[2])
		rs2Val32 := blk.NewTrunc(rs2Val, types.I32)
		shamt := blk.NewAnd(rs2Val32, constant.NewInt(types.I32, 0x1f))
		blk.NewStore(blk.NewSExt(blk.NewAShr(rs1Val32, shamt), types.I64), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["SRAW"] = f
		return f
	}
}

func (builder *IrBuilder) SYSCALL() *ir.Func {
	if v, ok := builder.IrFuncMap["SYSCALL"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("SYSCALL", types.I1,
			ir.NewParam("a0", types.I64Ptr),
			ir.NewParam("a1", types.I64Ptr),
			ir.NewParam("a2", types.I64Ptr),
			ir.NewParam("a7", types.I64Ptr))
		entry := f.NewBlock("")
		close := f.NewBlock("Close")
		write := f.NewBlock("Write")
		fstat := f.NewBlock("Fstat")
		exit := f.NewBlock("Exit")
		brk := f.NewBlock("Brk")
		a7 := entry.NewLoad(types.I64, f.Params[3])
		entry.NewSwitch(a7, exit,
			ir.NewCase(constant.NewInt(types.I64, 57), close),
			ir.NewCase(constant.NewInt(types.I64, 64), write),
			ir.NewCase(constant.NewInt(types.I64, 80), fstat),
			ir.NewCase(constant.NewInt(types.I64, 93), exit),
			ir.NewCase(constant.NewInt(types.I64, 214), brk))
		close.NewCall(builder.CLOSE(), f.Params[0])
		close.NewRet(constant.NewInt(types.I1, 1))
		write.NewCall(builder.WRITE(), f.Params[0], f.Params[1], f.Params[2])
		write.NewRet(constant.NewInt(types.I1, 1))
		fstat.NewCall(builder.FSTAT(), f.Params[0])
		fstat.NewRet(constant.NewInt(types.I1, 1))
		exit.NewRet(constant.NewInt(types.I1, 0))
		brk.NewCall(builder.BRK())
		brk.NewRet(constant.NewInt(types.I1, 1))
		builder.IrFuncMap["SYSCALL"] = f
		return f
	}
}

func (builder *IrBuilder) CLOSE() *ir.Func {
	if v, ok := builder.IrFuncMap["CLOSE"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("CLOSE", types.Void, ir.NewParam("fd", types.I64Ptr))
		blk := f.NewBlock("")
		blk.NewStore(constant.NewInt(types.I64, 0), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["CLOSE"] = f
		return f
	}
}

func (builder *IrBuilder) WRITE() *ir.Func {
	if v, ok := builder.IrFuncMap["WRITE"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("WRITE", types.Void,
			ir.NewParam("fd", types.I64Ptr),
			ir.NewParam("ptr", types.I64Ptr),
			ir.NewParam("len", types.I64Ptr))

		init := f.NewBlock("Init")
		forCond := f.NewBlock("ForCond")
		forBody := f.NewBlock("ForBody")
		forEnd := f.NewBlock("ForEnd")

		base := init.NewLoad(types.I64, f.Params[1])
		len := init.NewLoad(types.I64, f.Params[2])
		i := init.NewAlloca(types.I64)
		init.NewStore(constant.NewInt(types.I64, 0), i)
		// var ss string = "base = %x, i = %d, addr = %x\n"
		// fmtStr := builder.Module.NewGlobalDef("str", NewCString(ss))
		// ptrToStr := init.NewGetElementPtr(
		// 	types.NewArray(30, types.I8),
		// 	fmtStr,
		// 	constant.NewInt(types.I64, 0),
		// 	constant.NewInt(types.I64, 0),
		// )
		init.NewBr(forCond)

		forCond.NewCondBr(forCond.NewICmp(enum.IPredSLT, forCond.NewLoad(types.I64, i), len), forBody, forEnd)

		offset := forBody.NewAdd(base, forBody.NewLoad(types.I64, i))
		ptr := forBody.NewGetElementPtr(builder.MemoryType, builder.Memory, constant.NewInt(types.I64, 0), offset)
		// ptr := forBody.NewCall(builder.LoadChar(), offset)
		val := forBody.NewLoad(types.I8, ptr)
		buf := forBody.NewAlloca(types.I8)
		forBody.NewStore(val, buf)
		// forBody.NewCall(builder.Printf(), ptrToStr, base, forBody.NewLoad(types.I64, i), offset)
		forBody.NewCall(builder.Printf(), buf)
		forBody.NewStore(forBody.NewAdd(forBody.NewLoad(types.I64, i), constant.NewInt(types.I64, 1)), i)
		forBody.NewBr(forCond)

		forEnd.NewStore(len, f.Params[0])
		forEnd.NewRet(nil)
		builder.IrFuncMap["WRITE"] = f
		return f
	}
}

func (builder *IrBuilder) FSTAT() *ir.Func {
	if v, ok := builder.IrFuncMap["FSTAT"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("FSTAT", types.Void, ir.NewParam("fd", types.I64Ptr))
		blk := f.NewBlock("")
		blk.NewStore(constant.NewInt(types.I64, 0), f.Params[0])
		blk.NewRet(nil)
		builder.IrFuncMap["FSTAT"] = f
		return f
	}
}

func (builder *IrBuilder) BRK() *ir.Func {
	if v, ok := builder.IrFuncMap["BRK"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("BRK", types.Void)
		blk := f.NewBlock("")
		blk.NewRet(nil)
		builder.IrFuncMap["BRK"] = f
		return f
	}
}

func (builder *IrBuilder) Printf() *ir.Func {
	var printf *ir.Func
	if v, ok := builder.IrFuncMap["printf"]; !ok {
		printf := builder.Module.NewFunc("printf", types.I32, ir.NewParam("", types.I8Ptr))
		builder.IrFuncMap["printf"] = printf
		return printf
	} else {
		printf = v
	}
	return printf
}

func NewCString(s string) *constant.CharArray {
	return constant.NewCharArrayFromString(s + "\x00")
}

func (builder *IrBuilder) UpdatePC() *ir.Func {
	if v, ok := builder.IrFuncMap["UpdatePC"]; ok {
		return v
	} else {
		f := builder.Module.NewFunc("UpdatePC", types.Void, ir.NewParam("pc", types.I64))
		blk := f.NewBlock("")
		blk.NewStore(constant.NewInt(types.I64, 0), builder.IntRegs[0])
		blk.NewStore(f.Params[0], builder.PC)
		blk.NewRet(nil)
		builder.IrFuncMap["UpdatePC"] = f
		return f
	}
}
