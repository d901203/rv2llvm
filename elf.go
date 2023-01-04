package main

import (
	"debug/elf"
	"log"
	"os"
)

type ELF struct {
	RawFile   *os.File
	RawBytes  []byte
	ElfFile   *elf.File
	Entry     uint64
	TextStart uint64
	TextSize  uint64
	TextEnd   uint64
	InstLen   uint64
	Insts     []*Inst
}

type Inst struct {
	Address uint64
	Code    uint32
}

func NewELF(path string) *ELF {
	elf := new(ELF)
	elf.LoadELF(path)
	elf.GetTextSection()
	return elf
}

func (e *ELF) LoadELF(path string) {
	var err error
	e.RawFile, err = os.Open(path)
	if err != nil {
		log.Fatal(err)
	}
	e.ElfFile, err = elf.Open(path)
	if err != nil {
		log.Fatal(err)
	}
	e.IsValid()
	e.Entry = e.ElfFile.Entry
	file := e.RawFile
	fileState, _ := file.Stat()
	fileSize := fileState.Size()
	e.RawBytes = make([]byte, fileSize)
	_, err = file.Read(e.RawBytes)
	if err != nil {
		log.Fatal(err)
	}
}

func (e *ELF) IsValid() {
	ident := make([]byte, elf.EI_NIDENT)
	_, err := e.RawFile.ReadAt(ident, 0)
	if err != nil {
		log.Fatal(err)
	}
	if string(ident[:4]) != elf.ELFMAG {
		log.Fatal("Not ELF file")
	}
	if e.ElfFile.Type != elf.ET_EXEC {
		log.Fatal("Not a executable ELF file.")
	}
	if e.ElfFile.Machine != elf.EM_RISCV {
		log.Fatal("Not a RISC-V ELF file.")
	}
}

func (e *ELF) GetTextSection() {
	text := e.ElfFile.Section(".text")
	e.TextStart = text.Addr
	e.TextSize = text.Size
	e.TextEnd = e.TextStart + e.TextSize
	e.InstLen = e.TextSize / 4
	data, err := text.Data()
	if err != nil {
		log.Fatal(err)
	}
	e.Insts = make([]*Inst, e.InstLen)
	for i := 0; i < int(e.InstLen); i++ {
		e.Insts[i] = new(Inst)
		value := uint32(data[i*4])
		for j := 1; j < 4; j++ {
			offset := j * 8
			value |= uint32(data[i*4+j]) << offset
		}
		e.Insts[i].Address = e.TextStart + uint64(i*4)
		e.Insts[i].Code = value
	}
}
