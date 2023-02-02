package main

import (
	"debug/elf"
	"fmt"
	"log"
	"os"
	"strconv"

	"github.com/llir/llvm/ir"
	"github.com/llir/llvm/ir/constant"
	"github.com/llir/llvm/ir/types"
)

type Block struct {
	Address uint64
	Blk     *ir.Block
}

func (builder *IrBuilder) NewBlock(addr uint64) *Block {
	block := new(Block)
	block.Address = addr
	block.Blk = builder.MainFunc.NewBlock("@" + strconv.FormatUint(addr, 16))
	return block
}

type IrBuilder struct {
	Module     *ir.Module
	PC         *ir.Global
	IntRegs    [32]*ir.Global
	MemoryType *types.ArrayType
	Memory     *ir.Global
	MainFunc   *ir.Func
	InitBlk    *ir.Block
	InitFunc   *ir.Func
	AddrBlk    *ir.Block
	ErrBlk     *ir.Block
	EndBlk     *ir.Block
	IrFuncMap  map[string]*ir.Func
	IrBlks     []*Block
	AddrCases  []*ir.Case
}

type FormatStr struct {
	RawStr string
	Size   uint64
	IrStr  *ir.Global
}

func NewIrBuilder(e *ELF) *IrBuilder {
	builder := new(IrBuilder)
	builder.Module = ir.NewModule()
	builder.PC = builder.Module.NewGlobalDef("PC", constant.NewInt(types.I64, 0))
	for i := 0; i < 32; i++ {
		if i == 2 {
			builder.IntRegs[i] = builder.Module.NewGlobalDef("x"+strconv.Itoa(i), constant.NewInt(types.I64, int64(StakcPointer)))
		} else {
			builder.IntRegs[i] = builder.Module.NewGlobalDef("x"+strconv.Itoa(i), constant.NewInt(types.I64, 0))
		}
	}
	builder.MemoryType = types.NewArray(MemorySize, types.I8)
	builder.Memory = builder.Module.NewGlobalDef("Memory", constant.NewZeroInitializer(builder.MemoryType))
	builder.MainFunc = builder.Module.NewFunc("main", types.I64)
	builder.InitBlk = builder.MainFunc.NewBlock("Init")
	builder.IrFuncMap = make(map[string]*ir.Func)
	builder.IrBlks = make([]*Block, e.InstLen)
	builder.AddrCases = make([]*ir.Case, e.InstLen)
	builder.SetInitFunc(e.ElfFile, e.RawBytes, e.TextStart, e.TextEnd)
	builder.SetInitBlk(e.Entry)
	return builder
}

func (builder *IrBuilder) SetInitFunc(e *elf.File, buf []byte, start uint64, end uint64) {
	builder.InitFunc = builder.Module.NewFunc("Init", types.Void)
	blk := builder.InitFunc.NewBlock("")
	blk.NewRet(nil)
	for _, ph := range e.Progs {
		if ph.Type == elf.PT_LOAD {
			toCopy := min(ph.Filesz, ph.Memsz)
			for i := 0; i < int(toCopy); i++ {
				if ph.Vaddr+uint64(i) >= start && ph.Vaddr+uint64(i) < end {
					continue
				}
				v := int64(uint64(buf[ph.Off+uint64(i)]))
				if v != 0 {
					addr := constant.NewInt(types.I64, int64(ph.Vaddr+uint64(i)))
					val := constant.NewInt(types.I8, v)
					blk.NewCall(builder.InitSB(), addr, val)
				}
			}
		}
	}
}

func min(a, b uint64) uint64 {
	if a < b {
		return a
	}
	return b
}

func (builder *IrBuilder) SetInitBlk(entry uint64) {
	builder.InitBlk.NewCall(builder.InitFunc)
	builder.InitBlk.NewBr(ir.NewBlock("@" + strconv.FormatUint(entry, 16)))
	builder.EndBlk = builder.MainFunc.NewBlock("End")
	builder.EndBlk.NewRet(builder.EndBlk.NewLoad(types.I64, builder.IntRegs[10]))
}

func (builder *IrBuilder) BuildIr(insts []*Inst) {
	for i, inst := range insts {
		block := builder.NewBlock(inst.Address)
		builder.Decode(inst.Address, inst.Code, block.Blk)
		if block.Blk.Term == nil {
			block.Blk.NewBr(ir.NewBlock("@" + strconv.FormatUint(inst.Address+4, 16)))
		}
		builder.IrBlks[i] = block
	}
}

func (builder *IrBuilder) SetAddrBlk() {
	builder.AddrBlk = builder.MainFunc.NewBlock("AddressTable")
	builder.ErrBlk = builder.MainFunc.NewBlock("Error")
	builder.ErrBlk.NewRet(constant.NewInt(types.I64, 119))
	// builder.ErrBlk.NewRet(builder.ErrBlk.NewLoad(types.I64, builder.IntRegs[10]))
	pc := builder.AddrBlk.NewLoad(types.I64, builder.PC)
	for i, blk := range builder.IrBlks {
		c := ir.NewCase(constant.NewInt(types.I64, int64(blk.Address)), blk.Blk)
		builder.AddrCases[i] = c
	}
	builder.AddrBlk.NewSwitch(pc, builder.ErrBlk, builder.AddrCases...)
}

func (builder *IrBuilder) StoreIR() {
	fileName := "a.ll"
	file, _ := os.Create(fileName)
	_, err := builder.Module.WriteTo(file)
	if err != nil {
		log.Fatal(err)
	}
	fmt.Printf("Wrote IR to %s\n", fileName)
}
