# rv2llvmSBT

`rv2llvmSBT` is a tool for translating RISC-V ELF files to LLVM IR. This project implements static binary translation, making it possible to run RISC-V ELF on different architecture systems.

## Features

- Translation of RISC-V ELF files to LLVM IR
- Implementation of static binary translation
- Support for Clang to translate LLVM IR to native architecture ELF
- Written in Go and [llir](https://github.com/llir/llvm)

## Requirements

- Go
- Clang
- RISC-V ELF files

## Installation

```
git clone https://github.com/d901203/rv2llvmSBT
cd rv2llvmSBT
make
```

## Usage

```
cd build
```

1. Translate RISC-V ELF to LLVM IR: `./rv2llvmSBT [RISC-V ELF FileName]`
2. Translate LLVM IR to native architecture ELF: `clang [LLVM IR FileName]`
