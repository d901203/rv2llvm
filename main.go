package main

import (
	"log"
	"os"

	"github.com/urfave/cli/v2"
)

func main() {
	var file string
	app := &cli.App{
		Name:      "rv2llvmSBT",
		Usage:     "a tool to translate RISC-V ELF to LLVM IR.",
		UsageText: "rv2llvmSBT [RISC-V ELF FileName]",
		Action: func(c *cli.Context) error {
			if c.NArg() == 0 {
				log.Fatal("No input file, use -h to see help.")
			}
			file = c.Args().Get(0)
			return nil
		},
	}
	if err := app.Run(os.Args); err != nil {
		log.Fatal(err)
	}
	if file != "" {
		elf := NewELF(file)
		builder := NewIrBuilder(elf)
		builder.BuildIr(elf.Insts)
		builder.SetAddrBlk()
		builder.StoreIR()
	}
}
