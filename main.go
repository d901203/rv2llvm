package main

func main() {
	path := "./tests/qrcode.riscv"
	elf := NewELF(path)
	builder := NewIrBuilder(elf)
	builder.BuildIr(elf.Insts)
	builder.SetAddrBlk()
	builder.StoreIR()
}
