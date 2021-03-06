// Copyright (C) 2021 Greg Dionne
// Distributed under MIT License
#include "bytecodetarget.hpp"
#include "bytecodeimplementation.hpp"
#include "bytecoder.hpp"

void ByteCodeTarget::extendDirectPage(Assembler &tasm) {
  tasm.block("curinst", "2");
  tasm.block("nxtinst", "2");
}

std::string ByteCodeTarget::generateCode(InstQueue &queue) {
  Assembler tasm;

  tasm.org("M_CODE");
  tasm.blank();
  tasm.module("mdmain");
  tasm.ldx("#program");
  tasm.stx("nxtinst");
  tasm.label("mainloop");
  tasm.ldx("nxtinst");
  tasm.stx("curinst");
  tasm.ldab(",x");
  tasm.ldx("#catalog");
  tasm.abx();
  tasm.abx();
  tasm.ldx(",x");
  tasm.jsr("0,x");
  tasm.bra("mainloop");
  tasm.blank();
  tasm.label("program");
  tasm.blank();
  std::string ops = tasm.source();

  ByteCoder coder;
  for (auto &instruction : queue.queue) {
    ops += instruction->operate(&coder);
    ops += '\n';
  }

  return ops;
}

std::unique_ptr<Dispatcher> ByteCodeTarget::makeDispatcher() {
  return std::make_unique<Dispatcher>(
      std::make_unique<ByteCodeImplementation>());
}

std::string ByteCodeTarget::generateLibraryCatalog(Library &library) {
  Assembler tasm;
  tasm.comment("Library Catalog");

  int i = 0;
  for (auto &entry : library.calls) {
    tasm.equ("bytecode_" + entry.first, std::to_string(i++));
  }

  tasm.blank();

  tasm.label("catalog");
  for (auto &entry : library.calls) {
    tasm.word(entry.first);
  }

  tasm.blank();

  return tasm.source();
}

std::string ByteCodeTarget::generateSymbolCatalog(ConstTable &constTable,
                                                  SymbolTable &symbolTable) {
  Assembler tasm;

  tasm.comment("Bytecode equates");
  tasm.blank();

  for (auto &entry : constTable.ints) {
    if (((entry & 0xff0000) != 0) && ((entry & 0xff0000) != 0xff0000)) {
      std::string name = FixedPoint(entry).label();
      tasm.equ("bytecode_" + name, name + "-symstart");
    }
  }

  for (auto &entry : constTable.flts) {
    std::string name = entry.label();
    tasm.equ("bytecode_" + name, name + "-symstart");
  }

  tasm.blank();

  for (const auto &symbol : symbolTable.numVarTable) {
    std::string name = (symbol.isFloat ? "FLTVAR_" : "INTVAR_") + symbol.name;
    tasm.equ("bytecode_" + name, name + "-symstart");
  }

  for (const auto &symbol : symbolTable.strVarTable) {
    std::string name = "STRVAR_" + symbol.name;
    tasm.equ("bytecode_" + name, name + "-symstart");
  }

  for (const auto &symbol : symbolTable.numArrTable) {
    std::string name = (symbol.isFloat ? "FLTARR_" : "INTARR_") + symbol.name;
    tasm.equ("bytecode_" + name, name + "-symstart");
  }

  for (const auto &symbol : symbolTable.strArrTable) {
    std::string name = "STRARR_" + symbol.name;
    tasm.equ("bytecode_" + name, name + "-symstart");
  }

  tasm.blank();
  return tasm.source();
}
