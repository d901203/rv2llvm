# rv2llvmSBT

`rv2llvmSBT` is a tool to translate RISC-V ELF to LLVM IR.

Build the rv2llvmSBT.
```
make
```

Translate RISC-V ELF to LLVM IR.
```
cd build
./rv2llvmSBT [filename]
```

Compile LLVM IR to native architecture ELF.
```
clang [filename]
```