// Copyright (C) 2021 Greg Dionne
// Distributed under MIT License
#include "nativeimplementation.hpp"

#include "assembler.hpp"

std::string NativeImplementation::regInt_immLbl(InstJmpIfEqual &inst) {
  Assembler tasm;
  tasm.ldd(inst.arg1->lword());
  tasm.bne("_rts");
  tasm.ldaa(inst.arg1->sbyte());
  tasm.bne("_rts");
  tasm.ins();
  tasm.ins();
  tasm.jmp(",x");
  tasm.label("_rts");
  tasm.rts();
  return tasm.source();
}

std::string NativeImplementation::regFlt_immLbl(InstJmpIfEqual &inst) {
  Assembler tasm;
  tasm.ldd(inst.arg1->lword());
  tasm.bne("_rts");
  tasm.ldaa(inst.arg1->sbyte());
  tasm.bne("_rts");
  tasm.ldd(inst.arg1->fract());
  tasm.bne("_rts");
  tasm.ins();
  tasm.ins();
  tasm.jmp(",x");
  tasm.label("_rts");
  tasm.rts();
  return tasm.source();
}

std::string NativeImplementation::regInt_immLbl(InstJmpIfNotEqual &inst) {
  Assembler tasm;
  tasm.ldd(inst.arg1->lword());
  tasm.bne("_go");
  tasm.ldaa(inst.arg1->sbyte());
  tasm.bne("_go");
  tasm.rts();
  tasm.label("_go");
  tasm.ins();
  tasm.ins();
  tasm.jmp(",x");
  return tasm.source();
}

std::string NativeImplementation::regFlt_immLbl(InstJmpIfNotEqual &inst) {
  Assembler tasm;
  tasm.ldd(inst.arg1->lword());
  tasm.bne("_go");
  tasm.ldaa(inst.arg1->sbyte());
  tasm.bne("_go");
  tasm.ldd(inst.arg1->fract());
  tasm.bne("_go");
  tasm.rts();
  tasm.label("_go");
  tasm.ins();
  tasm.ins();
  tasm.jmp(",x");
  return tasm.source();
}

std::string NativeImplementation::immLbl(InstGoTo & /*inst*/) {
  Assembler tasm;
  tasm.ins();
  tasm.ins();
  tasm.jmp(",x");
  return tasm.source();
}

std::string NativeImplementation::regInt_immLbl(InstJsrIfEqual &inst) {
  Assembler tasm;
  tasm.ldd(inst.arg1->lword());
  tasm.bne("_rts");
  tasm.ldaa(inst.arg1->sbyte());
  tasm.bne("_rts");
  tasm.ldab("#3");
  tasm.pshb();
  tasm.jmp(",x");
  tasm.label("_rts");
  tasm.rts();
  return tasm.source();
}

std::string NativeImplementation::regFlt_immLbl(InstJsrIfEqual &inst) {
  Assembler tasm;
  tasm.ldd(inst.arg1->lword());
  tasm.bne("_rts");
  tasm.ldaa(inst.arg1->sbyte());
  tasm.bne("_rts");
  tasm.ldd(inst.arg1->fract());
  tasm.bne("_rts");
  tasm.ldab("#3");
  tasm.pshb();
  tasm.jmp(",x");
  tasm.label("_rts");
  tasm.rts();
  return tasm.source();
}

std::string NativeImplementation::regInt_immLbl(InstJsrIfNotEqual &inst) {
  Assembler tasm;
  tasm.ldd(inst.arg1->lword());
  tasm.bne("_go");
  tasm.ldaa(inst.arg1->sbyte());
  tasm.bne("_go");
  tasm.rts();
  tasm.label("_go");
  tasm.ldab("#3");
  tasm.pshb();
  tasm.jmp(",x");
  return tasm.source();
}

std::string NativeImplementation::regFlt_immLbl(InstJsrIfNotEqual &inst) {
  Assembler tasm;
  tasm.ldd(inst.arg1->lword());
  tasm.bne("_go");
  tasm.ldaa(inst.arg1->sbyte());
  tasm.bne("_go");
  tasm.ldd(inst.arg1->fract());
  tasm.bne("_go");
  tasm.rts();
  tasm.label("_go");
  tasm.ldab("#3");
  tasm.pshb();
  tasm.jmp(",x");
  return tasm.source();
}

std::string NativeImplementation::immLbl(InstGoSub &inst) {
  Assembler tasm;
  if (inst.generateLines) {
    tasm.ldd("DP_LNUM");
    tasm.pshb();
    tasm.psha();
    tasm.ldab("#5");
  } else {
    tasm.ldab("#3");
  }
  tasm.pshb();
  tasm.jmp(",x");
  return tasm.source();
}

std::string NativeImplementation::regStr_immStr(InstLd &inst) {
  Assembler tasm;
  tasm.pulx();
  tasm.ldab(",x");
  tasm.stab(inst.arg1->sbyte());
  tasm.inx();
  tasm.stx(inst.arg1->lword());
  tasm.abx();
  tasm.jmp(",x");
  return tasm.source();
}

std::string NativeImplementation::extStr_immStr(InstLd &inst) {
  Assembler tasm;
  inst.dependencies.insert("mdstrdel");
  tasm.pshx();        // let go of whatever x points to
  tasm.jsr("strdel"); // let go of whatever x points to
  tasm.pulx();
  tasm.stx("tmp1"); // holds dest
  tasm.pulx();
  tasm.stx("tmp2"); // holds sbyte
  tasm.ldab(",x");
  tasm.ldx("tmp1");
  tasm.stab(",x");
  tasm.ldd("tmp2");
  tasm.addd("#1");
  tasm.std("1,x");
  tasm.ldx("tmp2");
  tasm.inx();
  tasm.abx();
  tasm.jmp(",x");
  return tasm.source();
}

std::string NativeImplementation::indStr_immStr(InstLd &inst) {
  Assembler tasm;
  inst.dependencies.insert("mdstrdel");
  tasm.ldx("letptr");
  tasm.pshx();        // let go of whatever x points to
  tasm.jsr("strdel"); // let go of whatever x points to
  tasm.pulx();
  tasm.stx("tmp1"); // holds dest
  tasm.pulx();
  tasm.stx("tmp2"); // holds sbyte
  tasm.ldab(",x");
  tasm.ldx("tmp1");
  tasm.stab(",x");
  tasm.ldd("tmp2");
  tasm.addd("#1");
  tasm.std("1,x");
  tasm.ldx("tmp2");
  tasm.inx();
  tasm.abx();
  tasm.jmp(",x");
  return tasm.source();
}

std::string NativeImplementation::regStr_immStr(InstStrInit &inst) {
  inst.dependencies.insert("mdstrtmp");

  Assembler tasm;
  tasm.tsx();
  tasm.ldx(",x");
  tasm.ldab(",x");
  tasm.stab(inst.arg1->sbyte());
  tasm.inx();
  tasm.jsr("strtmp");
  tasm.std(inst.arg1->lword());
  tasm.pulx();
  tasm.ldab(",x");
  tasm.abx();
  tasm.jmp("1,x");
  return tasm.source();
}

std::string NativeImplementation::regStr_regStr_immStr(InstStrCat &inst) {
  inst.dependencies.insert("mdstrtmp");

  Assembler tasm;
  tasm.tsx();
  tasm.ldx(",x");
  tasm.ldab(",x");
  tasm.addb(inst.arg2->sbyte());
  tasm.stab(inst.arg1->sbyte());
  tasm.ldab(",x");
  tasm.inx();
  tasm.jsr("strtmp");
  tasm.pulx();
  tasm.ldab(",x");
  tasm.abx();
  tasm.jmp("1,x");
  return tasm.source();
}

std::string NativeImplementation::regInt_regStr_immStr(InstLdEq &inst) {
  inst.dependencies.insert("mdstreqs");
  inst.dependencies.insert("mdgeteq");

  Assembler tasm;
  tasm.ldab(inst.arg2->sbyte());
  tasm.stab("tmp1+1");
  tasm.ldd(inst.arg2->lword());
  tasm.std("tmp2");
  tasm.jsr("streqs");
  tasm.jsr("geteq");
  tasm.std(inst.arg1->lword());
  tasm.stab(inst.arg1->sbyte());
  tasm.rts();
  return tasm.source();
}

std::string NativeImplementation::regInt_regStr_immStr(InstLdNe &inst) {
  inst.dependencies.insert("mdstreqs");
  inst.dependencies.insert("mdgetne");

  Assembler tasm;
  tasm.ldab(inst.arg2->sbyte());
  tasm.stab("tmp1+1");
  tasm.ldd(inst.arg2->lword());
  tasm.std("tmp2");
  tasm.jsr("streqs");
  tasm.jsr("getne");
  tasm.std(inst.arg1->lword());
  tasm.stab(inst.arg1->sbyte());
  tasm.rts();
  return tasm.source();
}

std::string NativeImplementation::regInt_regStr_immStr(InstLdLo &inst) {
  inst.dependencies.insert("mdstrlos");

  Assembler tasm;
  tasm.ldab(inst.arg2->sbyte());
  tasm.stab("0+argv");
  tasm.ldd(inst.arg2->lword());
  tasm.std("1+argv");
  tasm.jsr("strlos");
  tasm.blo("_1");
  tasm.ldd("#0");
  tasm.std(inst.arg1->lword());
  tasm.stab(inst.arg1->sbyte());
  tasm.rts();
  tasm.label("_1");
  tasm.ldd("#-1");
  tasm.std(inst.arg1->lword());
  tasm.stab(inst.arg1->sbyte());
  tasm.rts();
  return tasm.source();
}

std::string NativeImplementation::regInt_regStr_immStr(InstLdHs &inst) {
  inst.dependencies.insert("mdstrlos");

  Assembler tasm;
  tasm.ldab(inst.arg2->sbyte());
  tasm.stab("0+argv");
  tasm.ldd(inst.arg2->lword());
  tasm.std("1+argv");
  tasm.jsr("strlos");
  tasm.bhs("_1");
  tasm.ldd("#0");
  tasm.std(inst.arg1->lword());
  tasm.stab(inst.arg1->sbyte());
  tasm.rts();
  tasm.label("_1");
  tasm.ldd("#-1");
  tasm.std(inst.arg1->lword());
  tasm.stab(inst.arg1->sbyte());
  tasm.rts();
  return tasm.source();
}

std::string NativeImplementation::ptrInt_posByte(InstTo &inst) {
  Assembler tasm;
  inst.dependencies.insert(inst.generateLines ? "mdtonatgl" : "mdtonat");
  tasm.stab("r1+2");
  tasm.ldd("#0");
  tasm.std("r1");
  tasm.std("r1+3");
  tasm.ldab(inst.generateLines ? "#13" : "#11");
  tasm.jmp("to");
  return tasm.source();
}

std::string NativeImplementation::ptrInt_negByte(InstTo &inst) {
  Assembler tasm;
  inst.dependencies.insert(inst.generateLines ? "mdtonatgl" : "mdtonat");
  tasm.stab("r1+2");
  tasm.ldd("#-1");
  tasm.std("r1");
  tasm.ldd("#0");
  tasm.std("r1+3");
  tasm.ldab(inst.generateLines ? "#13" : "#11");
  tasm.jmp("to");
  return tasm.source();
}

std::string NativeImplementation::ptrInt_posWord(InstTo &inst) {
  Assembler tasm;
  inst.dependencies.insert(inst.generateLines ? "mdtonatgl" : "mdtonat");
  tasm.std("r1+1");
  tasm.ldd("#0");
  tasm.stab("r1");
  tasm.std("r1+3");
  tasm.ldab(inst.generateLines ? "#13" : "#11");
  tasm.jmp("to");
  return tasm.source();
}

std::string NativeImplementation::ptrInt_negWord(InstTo &inst) {
  Assembler tasm;
  inst.dependencies.insert(inst.generateLines ? "mdtonatgl" : "mdtonat");
  tasm.std("r1+1");
  tasm.ldab("#-1");
  tasm.stab("r1");
  tasm.ldd("#0");
  tasm.std("r1+3");
  tasm.ldab(inst.generateLines ? "#13" : "#11");
  tasm.jmp("to");
  return tasm.source();
}

std::string NativeImplementation::ptrInt_regInt(InstTo &inst) {
  Assembler tasm;
  inst.dependencies.insert(inst.generateLines ? "mdtonatgl" : "mdtonat");
  tasm.ldd("#0");
  tasm.std("r1+3");
  tasm.ldab(inst.generateLines ? "#13" : "#11");
  tasm.jmp("to");
  return tasm.source();
}

std::string NativeImplementation::ptrInt_extInt(InstTo &inst) {
  Assembler tasm;
  inst.dependencies.insert(inst.generateLines ? "mdtonatgl" : "mdtonat");
  tasm.ldab(inst.arg2->sbyte());
  tasm.stab("r1");
  tasm.ldd(inst.arg2->lword());
  tasm.std("r1+1");
  tasm.ldd("#0");
  tasm.std("r1+3");
  tasm.ldab(inst.generateLines ? "#13" : "#11");
  tasm.jmp("to");
  return tasm.source();
}

std::string NativeImplementation::ptrFlt_posByte(InstTo &inst) {
  Assembler tasm;
  inst.dependencies.insert(inst.generateLines ? "mdtonatgl" : "mdtonat");
  tasm.stab("r1+2");
  tasm.ldd("#0");
  tasm.std("r1");
  tasm.std("r1+3");
  tasm.ldab(inst.generateLines ? "#17" : "#15");
  tasm.jmp("to");
  return tasm.source();
}

std::string NativeImplementation::ptrFlt_negByte(InstTo &inst) {
  Assembler tasm;
  inst.dependencies.insert(inst.generateLines ? "mdtonatgl" : "mdtonat");
  tasm.stab("r1+2");
  tasm.ldd("#-1");
  tasm.std("r1");
  tasm.ldd("#0");
  tasm.std("r1+3");
  tasm.ldab(inst.generateLines ? "#17" : "#15");
  tasm.jmp("to");
  return tasm.source();
}

std::string NativeImplementation::ptrFlt_posWord(InstTo &inst) {
  Assembler tasm;
  inst.dependencies.insert(inst.generateLines ? "mdtonatgl" : "mdtonat");
  tasm.std("r1+1");
  tasm.ldd("#0");
  tasm.stab("r1");
  tasm.std("r1+3");
  tasm.ldab(inst.generateLines ? "#17" : "#15");
  tasm.jmp("to");
  return tasm.source();
}

std::string NativeImplementation::ptrFlt_negWord(InstTo &inst) {
  Assembler tasm;
  inst.dependencies.insert(inst.generateLines ? "mdtonatgl" : "mdtonat");
  tasm.std("r1+1");
  tasm.ldab("#-1");
  tasm.stab("r1");
  tasm.ldd("#0");
  tasm.std("r1+3");
  tasm.ldab(inst.generateLines ? "#17" : "#15");
  tasm.jmp("to");
  return tasm.source();
}

std::string NativeImplementation::ptrFlt_regInt(InstTo &inst) {
  Assembler tasm;
  inst.dependencies.insert(inst.generateLines ? "mdtonatgl" : "mdtonat");
  tasm.ldd("#0");
  tasm.std("r1+3");
  tasm.ldab(inst.generateLines ? "#17" : "#15");
  tasm.jmp("to");
  return tasm.source();
}

std::string NativeImplementation::ptrFlt_extInt(InstTo &inst) {
  Assembler tasm;
  inst.dependencies.insert(inst.generateLines ? "mdtonatgl" : "mdtonat");
  tasm.ldab(inst.arg2->sbyte());
  tasm.stab("r1");
  tasm.ldd(inst.arg2->lword());
  tasm.std("r1+1");
  tasm.ldd("#0");
  tasm.std("r1+3");
  tasm.ldab(inst.generateLines ? "#17" : "#15");
  tasm.jmp("to");
  return tasm.source();
}
std::string NativeImplementation::ptrFlt_regFlt(InstTo &inst) {
  Assembler tasm;
  inst.dependencies.insert(inst.generateLines ? "mdtonatgl" : "mdtonat");
  tasm.ldab(inst.generateLines ? "#17" : "#15");
  tasm.jmp("to");
  return tasm.source();
}

std::string NativeImplementation::ptrFlt_extFlt(InstTo &inst) {
  Assembler tasm;
  inst.dependencies.insert(inst.generateLines ? "mdtonatgl" : "mdtonat");
  tasm.ldab(inst.arg2->sbyte());
  tasm.stab("r1");
  tasm.ldd(inst.arg2->lword());
  tasm.std("r1+1");
  tasm.ldd(inst.arg2->fract());
  tasm.std("r1+3");
  tasm.ldab(inst.generateLines ? "#17" : "#15");
  tasm.jmp("to");
  return tasm.source();
}

std::string NativeImplementation::ptrInt_regInt(InstStep &inst) {
  int varsize = 3;
  int offset = 2 + 1 + 2 + 2 + varsize;
  Assembler tasm;
  tasm.tsx();

  tasm.ldab(inst.arg2->sbyte());
  tasm.stab(std::to_string(offset) + ",x");

  tasm.ldd(inst.arg2->lword());
  tasm.std(std::to_string(offset + 1) + ",x");

  tasm.ldd(",x");
  tasm.std("5,x");

  tasm.rts();
  return tasm.source();
}

std::string NativeImplementation::ptrFlt_regInt(InstStep &inst) {
  int varsize = 5;
  int offset = 2 + 1 + 2 + 2 + varsize;
  Assembler tasm;
  tasm.tsx();

  tasm.ldab(inst.arg2->sbyte());
  tasm.stab(std::to_string(offset) + ",x");

  tasm.ldd(inst.arg2->lword());
  tasm.std(std::to_string(offset + 1) + ",x");

  tasm.ldd(inst.arg2->fract());
  tasm.std(std::to_string(offset + 3) + ",x");

  tasm.ldd(",x");
  tasm.std("5,x");

  tasm.rts();
  return tasm.source();
}

std::string NativeImplementation::ptrFlt_regFlt(InstStep &inst) {
  int varsize = 5;
  int offset = 2 + 1 + 2 + 2 + varsize;
  Assembler tasm;
  tasm.tsx();

  tasm.ldab(inst.arg2->sbyte());
  tasm.stab(std::to_string(offset) + ",x");

  tasm.ldd(inst.arg2->lword());
  tasm.std(std::to_string(offset + 1) + ",x");

  tasm.ldd(inst.arg2->fract());
  tasm.std(std::to_string(offset + 3) + ",x");

  tasm.ldd(",x");
  tasm.std("5,x");

  tasm.rts();
  return tasm.source();
}

std::string NativeImplementation::extInt(InstNextVar &inst) {
  Assembler tasm;
  tasm.stx("letptr");
  tasm.pulx();
  tasm.stx("tmp1");
  tasm.tsx();
  tasm.clrb();
  tasm.label("_nxtvar");
  tasm.abx();
  tasm.ldd("1,x");
  tasm.subd("letptr");
  tasm.beq("_ok");
  tasm.ldab(",x");
  tasm.cmpb(inst.generateLines ? "#5" : "#3");
  tasm.bhi("_nxtvar");
  tasm.label("_ok");
  tasm.txs();
  tasm.ldx("tmp1");
  tasm.jmp(",x");
  return tasm.source();
}

std::string NativeImplementation::extFlt(InstNextVar &inst) {
  Assembler tasm;
  tasm.stx("letptr");
  tasm.pulx();
  tasm.stx("tmp1");
  tasm.tsx();
  tasm.clrb();
  tasm.label("_nxtvar");
  tasm.abx();
  tasm.ldd("1,x");
  tasm.subd("letptr");
  tasm.beq("_ok");
  tasm.ldab(",x");
  tasm.cmpb(inst.generateLines ? "#5" : "#3");
  tasm.bhi("_nxtvar");
  tasm.label("_ok");
  tasm.txs();
  tasm.ldx("tmp1");
  tasm.jmp(",x");
  return tasm.source();
}

std::string NativeImplementation::inherent(InstNext &inst) {
  Assembler tasm;
  tasm.pulx();
  tasm.stx("tmp1");
  tasm.tsx();
  tasm.ldab(",x");
  tasm.cmpb(inst.generateLines ? "#5" : "#3");
  tasm.bhi("_ok");
  tasm.ldab("#NF_ERROR");
  tasm.jmp("error");
  tasm.label("_ok");
  tasm.cmpb(inst.generateLines ? "#13" : "#11");
  tasm.bne("_flt"); //                [0]        [1,2]      [3,4]
                    //                [5,6,7]    [8,9,10]
  tasm.ldd("9,x");  // 1 + 2 + 2 + 3  0,x == rz; 1,x == ip; 3,x ==
                    // ret; 5,x == to; 8,x == step
  tasm.std("r1+1");
  tasm.ldab("8,x");
  tasm.stab("r1");
  tasm.ldx("1,x");
  tasm.ldd("r1+1");
  tasm.addd("1,x");
  tasm.std("r1+1");
  tasm.std("1,x");
  tasm.ldab("r1");
  tasm.adcb(",x");
  tasm.stab("r1");
  tasm.stab(",x");
  tasm.tsx();
  tasm.tst("8,x");
  tasm.bpl("_iopp");
  tasm.ldd("r1+1"); // 1 + 2 + 2
  tasm.subd("6,x"); // 1 + 2 + 2
  tasm.ldab("r1");
  tasm.sbcb("5,x");
  tasm.blt("_idone");
  if (inst.generateLines) {
    tasm.ldd("11,x");
    tasm.std("DP_LNUM");
  }
  tasm.ldx("3,x");
  tasm.jmp(",x");
  tasm.label("_iopp");
  tasm.ldd("6,x");   // 1 + 2 + 2
  tasm.subd("r1+1"); // 1 + 2 + 2
  tasm.ldab("5,x");
  tasm.sbcb("r1");
  tasm.blt("_idone");
  if (inst.generateLines) {
    tasm.ldd("11,x");
    tasm.std("DP_LNUM");
  }
  tasm.ldx("3,x");
  tasm.jmp(",x");
  tasm.label("_idone");
  tasm.ldab(inst.generateLines ? "#13" : "#11");
  tasm.bra("_done");
  tasm.label("_flt"); //                [0]        [1,2]      [3,4]
                      //                [5,6,7,8,9] [10,11,12,13,14]
  tasm.ldd("13,x");   // 1 + 2 + 2 + 5  0,x == rz; 1,x == ip; 3,x ==
                      // ret; 5,x == to; 10,x == step
  tasm.std("r1+3");
  tasm.ldd("11,x"); // 1 + 2 + 2 + 5  0,x == rz; 1,x == ip; 3,x ==
                    // ret; 5,x == to; 10,x == step
  tasm.std("r1+1");
  tasm.ldab("10,x");
  tasm.stab("r1");
  tasm.ldx("1,x");
  tasm.ldd("r1+3");
  tasm.addd("3,x");
  tasm.std("r1+3");
  tasm.std("3,x");
  tasm.ldd("1,x");
  tasm.adcb("r1+2");
  tasm.adca("r1+1");
  tasm.std("r1+1");
  tasm.std("1,x");
  tasm.ldab("r1");
  tasm.adcb(",x");
  tasm.stab("r1");
  tasm.stab(",x");
  tasm.tsx();
  tasm.tst("10,x");
  tasm.bpl("_fopp");
  tasm.ldd("r1+3"); // 1 + 2 + 2
  tasm.subd("8,x"); // 1 + 2 + 2
  tasm.ldd("r1+1"); // 1 + 2 + 2
  tasm.sbcb("7,x"); // 1 + 2 + 2
  tasm.sbca("6,x"); // 1 + 2 + 2
  tasm.ldab("r1");
  tasm.sbcb("5,x");
  tasm.blt("_fdone");
  if (inst.generateLines) {
    tasm.ldd("15,x");
    tasm.std("DP_LNUM");
  }
  tasm.ldx("3,x");
  tasm.jmp(",x");
  tasm.label("_fopp");
  tasm.ldd("8,x");   // 1 + 2 + 2
  tasm.subd("r1+3"); // 1 + 2 + 2
  tasm.ldd("6,x");   // 1 + 2 + 2
  tasm.sbcb("r1+2"); // 1 + 2 + 2
  tasm.sbca("r1+1"); // 1 + 2 + 2
  tasm.ldab("5,x");
  tasm.sbcb("r1");
  tasm.blt("_fdone");
  if (inst.generateLines) {
    tasm.ldd("15,x");
    tasm.std("DP_LNUM");
  }
  tasm.ldx("3,x");
  tasm.jmp(",x");
  tasm.label("_fdone");
  tasm.ldab(inst.generateLines ? "#17" : "#15");
  tasm.label("_done");
  tasm.abx();
  tasm.txs();
  tasm.ldx("tmp1");
  tasm.jmp(",x");
  return tasm.source();
}

std::string NativeImplementation::regInt_immLbls(InstOnGoTo &inst) {
  Assembler tasm;
  tasm.pulx();
  tasm.ldd(inst.arg1->sbyte());
  tasm.bne("_fail");
  tasm.ldab(inst.arg1->lbyte());
  tasm.decb();
  tasm.cmpb("0,x");
  tasm.bhs("_fail");
  tasm.abx();
  tasm.abx();
  tasm.ldx("1,x");
  tasm.jmp(",x");
  tasm.label("_fail");
  tasm.ldab(",x");
  tasm.abx();
  tasm.abx();
  tasm.jmp("1,x");
  return tasm.source();
}

std::string NativeImplementation::regInt_immLbls(InstOnGoSub &inst) {
  Assembler tasm;
  tasm.pulx();
  tasm.ldd(inst.arg1->sbyte());
  tasm.bne("_fail");
  tasm.ldab(inst.arg1->lbyte());
  tasm.decb();
  tasm.cmpb("0,x");
  tasm.bhs("_fail");
  tasm.stx("tmp1");
  tasm.stab("tmp2");
  tasm.ldab(",x");
  tasm.abx();
  tasm.abx();
  tasm.inx();
  tasm.pshx();
  tasm.ldaa("#3");
  tasm.psha();
  tasm.ldx("tmp1");
  tasm.ldab("tmp2");
  tasm.abx();
  tasm.abx();
  tasm.ldx("1,x");
  tasm.jmp(",x");
  tasm.label("_fail");
  tasm.ldab(",x");
  tasm.abx();
  tasm.abx();
  tasm.jmp("1,x");
  return tasm.source();
}
std::string NativeImplementation::inherent(InstReturn &inst) {
  Assembler tasm;
  tasm.pulx();
  tasm.tsx();
  tasm.clrb();
  tasm.label("_nxt");
  tasm.abx();
  tasm.ldab(",x");
  tasm.bne("_ok");
  tasm.ldab("#RG_ERROR");
  tasm.jmp("error");
  tasm.label("_ok");
  tasm.cmpb(inst.generateLines ? "#5" : "#3");
  tasm.bne("_nxt");

  if (inst.generateLines) {
    tasm.ldd("1,x");
    tasm.std("DP_LNUM");
    tasm.ldab("#3");
    tasm.abx();
  } else {
    tasm.inx();
  }

  tasm.txs();
  tasm.rts();
  return tasm.source();
}

std::string NativeImplementation::immStr(InstPr &inst) {
  inst.dependencies.insert("mdstrrel");
  inst.dependencies.insert("mdprint");

  Assembler tasm;
  tasm.pulx();
  tasm.ldab(",x");
  tasm.beq("_null");
  tasm.inx();
  tasm.jsr("print");
  tasm.jmp(",x");
  tasm.label("_null");
  tasm.jmp("1,x");
  return tasm.source();
}

std::string NativeImplementation::inherent(InstInputBuf & /*inst*/) {
  Assembler tasm;
  tasm.tsx();
  tasm.ldd(",x");
  tasm.subd("#3");
  tasm.std("redoptr");
  tasm.jmp("inputqs"); // '? '
  return tasm.source();
}

std::string NativeImplementation::extFlt(InstReadBuf &inst) {
  inst.dependencies.insert("mdstrval");
  inst.dependencies.insert("mdinput");

  Assembler tasm;
  tasm.stx("letptr");
  tasm.jsr("rdinit"); // if \0 ?? else skip spaces
  tasm.ldab("#128");  // bufsiz?
  tasm.jsr("inptval");
  tasm.stx("inptptr");
  tasm.ldaa(",x");
  tasm.ldx("letptr");
  tasm.ldab("tmp1+1");
  tasm.stab(inst.arg1->sbyte());
  tasm.ldd("tmp2");
  tasm.std(inst.arg1->lword());
  tasm.ldd("tmp3");
  tasm.std(inst.arg1->fract());
  tasm.jsr("rdredo"); // if Z set, return, else X is ?redo pointer
  tasm.beq("_rts");
  tasm.pulx();
  tasm.jmp(",x");
  tasm.label("_rts");
  tasm.rts();
  return tasm.source();
}

std::string NativeImplementation::indFlt(InstReadBuf &inst) {
  inst.dependencies.insert("mdstrval");
  inst.dependencies.insert("mdinput");

  Assembler tasm;
  tasm.jsr("rdinit"); // if \0 ?? else skip spaces
  tasm.ldab("#128");  // bufsiz?
  tasm.jsr("inptval");
  tasm.stx("inptptr");
  tasm.ldaa(",x");
  tasm.ldx("letptr");
  tasm.ldab("tmp1+1");
  tasm.stab(inst.arg1->sbyte());
  tasm.ldd("tmp2");
  tasm.std(inst.arg1->lword());
  tasm.ldd("tmp3");
  tasm.std(inst.arg1->fract());
  tasm.jsr("rdredo"); // if Z set, return, else X is ?redo pointer
  tasm.beq("_rts");
  tasm.pulx();
  tasm.jmp(",x");
  tasm.label("_rts");
  tasm.rts();
  return tasm.source();
}

std::string NativeImplementation::extStr(InstReadBuf &inst) {
  inst.dependencies.insert("mdinput");
  inst.dependencies.insert("mdstrprm");

  Assembler tasm;
  tasm.stx("letptr");
  tasm.jsr("rdinit");
  tasm.ldaa("#','");
  tasm.staa("tmp1");
  tasm.ldaa(",x");
  tasm.beq("_null");
  tasm.cmpa("#'\"'");
  tasm.bne("_unquoted");
  tasm.staa("tmp1");
  tasm.inx();
  tasm.label("_unquoted");
  tasm.stx("tmp3");
  tasm.clrb();
  tasm.label("_nxtchr");
  tasm.incb();
  tasm.inx();
  tasm.ldaa(",x");
  tasm.beq("_done");
  tasm.cmpa("tmp1");
  tasm.bne("_nxtchr");
  tasm.label("_done");
  tasm.stx("inptptr");

  tasm.stab("0+argv");
  tasm.ldd("tmp3");
  tasm.std("1+argv");
  tasm.ldx("letptr");
  tasm.jsr("strprm");

  tasm.label("_rdredo");
  tasm.jsr("rdredo"); // if Z set, return, else X is ?redo ptr
  tasm.beq("_rts");
  tasm.pulx();
  tasm.jmp(",x");
  tasm.label("_rts");
  tasm.rts();

  tasm.label("_null");
  tasm.ldx("letptr");
  tasm.jsr("strdel");
  tasm.ldd("#$0100");
  tasm.ldx("letptr");
  tasm.stab(inst.arg1->sbyte());
  tasm.std(inst.arg1->lword());
  tasm.bra("_rdredo");
  return tasm.source();
}

std::string NativeImplementation::indStr(InstReadBuf &inst) {
  inst.dependencies.insert("mdinput");
  inst.dependencies.insert("mdstrprm");

  Assembler tasm;
  tasm.jsr("rdinit");
  tasm.ldaa("#','");
  tasm.staa("tmp1");
  tasm.ldaa(",x");
  tasm.beq("_null");
  tasm.cmpa("#'\"'");
  tasm.bne("_unquoted");
  tasm.staa("tmp1");
  tasm.inx();
  tasm.label("_unquoted");
  tasm.stx("tmp3");
  tasm.clrb();
  tasm.label("_nxtchr");
  tasm.incb();
  tasm.inx();
  tasm.ldaa(",x");
  tasm.beq("_done");
  tasm.cmpa("tmp1");
  tasm.bne("_nxtchr");
  tasm.label("_done");
  tasm.stx("inptptr");

  tasm.stab("0+argv");
  tasm.ldd("tmp3");
  tasm.std("1+argv");
  tasm.ldx("letptr");
  tasm.jsr("strprm");

  tasm.label("_rdredo");
  tasm.jsr("rdredo"); // if Z set, return, else X is ?redo ptr
  tasm.beq("_rts");
  tasm.pulx();
  tasm.jmp(",x");
  tasm.label("_rts");
  tasm.rts();

  tasm.label("_null");
  tasm.ldx("letptr");
  tasm.jsr("strdel");
  tasm.ldd("#$0100");
  tasm.ldx("letptr");
  tasm.stab(inst.arg1->sbyte());
  tasm.std(inst.arg1->lword());
  tasm.bra("_rdredo");
  return tasm.source();
}
