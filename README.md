# rv2llvmSBT

`rv2llvmSBT` is a tool to translate RISC-V ELF to LLVM IR.
```
$ git clone https://github.com/d901203/rv2llvmSBT
```

Build the rv2llvmSBT.
```
$ make
```

Translate RISC-V ELF to LLVM IR.
```
$ cd build
$ ./rv2llvmSBT [filename]
```

Compile LLVM IR to native architecture ELF.
```
$ clang [filename]
```