# rv2llvm

`rv2llvm` is a tool for translating RISC-V ELF files to LLVM IR. This project implements static binary translation, making it possible to run RISC-V ELF on different architecture systems.

## Demo

![demo.gif](./demo.gif)

## Features

- Translation of RISC-V ELF files to LLVM IR
- Implementation of static binary translation
- Support for Clang to translate LLVM IR to native architecture ELF
- Written in Go and [llir](https://github.com/llir/llvm)

## Requirements

- Go
- Clang-14
- RISC-V ELF files (some test cases are in the tests and build folder)

## Installation

```
git clone https://github.com/d901203/rv2llvm
cd rv2llvm
make
```

## Usage

```
cd build
```

1. Translate RISC-V ELF to LLVM IR: `./rv2llvm [RISC-V ELF FileName]`
2. Translate LLVM IR to native architecture ELF: `clang [LLVM IR FileName]`
