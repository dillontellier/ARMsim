#ifndef INSTRUCTION_HPP
#define INSTRUCTION_CPP

#include "armsim.hpp"

typedef unsigned int instruction_t;


enum OpCode {
   
   // “To do nothing at all is the most difficult thing in the world,
   //  the most difficult and the most intellectual” - Oscar Wilde
   NOP,
   
   // Data-processing and miscellaneous on page A5-196
   MOV_IM, MOVT_IM,
   
   // Data-processing (register) on page A5-197
   AND_REG, EOR_REG, SUB_REG, RSB_REG, ADD_REG, ADC_REG, SBC_REG, RSC_REG, TST_REG,
   TEQ_REG, CMP_REG, CMN_REG, ORR_REG, MOV_REG,
   LSL_IM, LSR_IM, ASR_IM,
   RRX, ROR_IM, BIC_REG, MVN_REG,
   
   // Data-processing (register-shifter register) on page A5-198
   AND_RSREG, EOR_RSREG, SUB_RSREG, RSB_RSREG, ADD_RSREG, ADC_RSREG, SBC_RSREG,
   RSC_RSREG, TST_RSREG, TEQ_RSREG, CMP_RSREG, CMN_RSREG, ORR_RSREG,
   LSL_REG, LSR_REG, ASR_REG, ROR_REG,
   BIC_RSREG, MVN_RSREG,
   
   // Data-processing (immediate) on page A5-199
   AND_IM, EOR_IM, SUB_IM, ADR, RSB_IM, ADD_IM, ADC_IM, SBC_IM, RSC_IM, TST_IM, TEQ_IM,
   CMP_IM, CMN_IM, ORR_IM, BIC_IM, MVN_IM,
   
   // Saturating addition and subtraction on page A5-202
   QADD, QSUB, QDADD, QDSUB,
   
   // Extra load/store instructions (Privileged) on page A5-203
   STRH_REG, LDRH_REG, STRH_IM, LDRH_IM, LDRH_LIT, LDRD_REG, LDRSB_REG, LDRD_IM,
   LDRD_LIT, LDRSB_IM, LDRSB_LIT, STRD_REG, LDRSH_REG, STRD_IM, LDRSH_IM, LDRSH_LIT,
   
   // Extra load/store instructions (Unprivileged) on page A5-204
   STRHT, LDRHT, LDRSBT, LDRSHT,
   
   // Miscellaneous instructions on page A5-207
   BX, CLZ, BLX_REG,
   
   // Load/store word and unsigned byte on page A5-208
   STR_IM, STR_REG, STRT,
   LDR_IM, LDR_LIT, LDR_REG, LDRT,
   STRB_IM, STRB_REG, STRBT, 
   LDRB_IM, LDRB_LIT, LDRB_REG, LDRBT,
   
   // Branch, branch with link, and block data transfer on page A5-214
   STMDA, LDMDA, STM, LDM, POP, STMDB, PUSH, LDMDB, STMIB, LDMIB,
   STM_USR, LDM_USR, B, BLX_IM,
   
   // DEBUG
   TEST0, TEST1, TEST2, TEST3, INVALID, UNSUPPORTED, END
   
};

static string opCodeNames[] = {
   "NOP", "MOV (immediate)", "MOVT (immediate)", "AND (register)", "EOR (register)", "SUB (register)",
   "RSB (register)", "ADD (register)", "ADC (register)", "SBC (register)", "RSC (register)", "TST (register)",
   "TEQ (register)", "CMP (register)", "CMN (register)", "ORR (register)", "MOV (register)", "LSL (immediate)",
   "LSR (immediate)", "ASR (immediate)", "RRX", "ROR (immediate)", "BIC (register)", "MVN (register)",
   "AND (register-shifted register)", "EOR (register-shifted register)", "SUB (register-shifted register)",
   "RSB (register-shifted register)", "ADD (register-shifted register)", "ADC (register-shifted register)",
   "SBC (register-shifted register)", "RSC (register-shifted register)", "TST (register-shifted register)",
   "TEQ (register-shifted register)", "CMP (register-shifted register)", "CMN (register-shifted register)",
   "ORR (register-shifted register)", "LSL (register)", "LSR (register)", "ASR (register)", "ROR (register)",
   "BIC (register-shifted register)", "MVN (register-shifted register)", "AND (immediate)", "EOR (immediate)",
   "SUB (immediate)", "ADR", "RSB (immediate)", "ADD (immediate)", "ADC (immediate)", "SBC (immediate)",
   "RSC (immediate)", "TST (immediate)", "TEQ (immediate)", "CMP (immediate)", "CMN (immediate)",
   "ORR (immediate)", "BIC (immediate)", "MVN (immediate)", "QADD", "QSUB", "QDADD", "QDSUB", "STRH (register)",
   "LDRH (register)", "STRH (immediate)", "LDRH (immediate)", "LDRH (literal)", "LDRD (register)",
   "LDRSB (register)", "LDRD (immediate)", "LDRD (literal)", "LDRSB (immediate)", "LDRSB (literal)",
   "STRD (register)", "LDRSH (register)", "STRD (immediate)", "LDRSH (immediate)", "LDRSH (literal)", "STRHT", 
   "LDRHT", "LDRSBT", "LDRSHT", "BX", "CLZ", "BLX (register)", "STR (immediate)", "STR (register)", "STRT",
   "LDR (immediate)", "LDR (literal)", "LDR (register)", "LDRT", "STRB (immediate)", "STRB (register)", "STRBT",
   "LDRB (immediate)", "LDRB (literal)", "LDRB (register)", "LDRBT", "STMDA", "LDMDA", "STM", "LDM", "POP",
   "STMDB", "PUSH", "LDMDB", "STMIB", "LDMIB", "STM (user defined registers)", "LDM (user defined registers)",
   "B", "BLX (immediate)", 
   "TEST0", "TEST1", "TEST2", "TEST3", "INVALID", "Unsupported operation", "END: YOU SHOULD NOT BE HERE!!!"
   };

class Instruction{
   public:
      instruction_t instruction;
      OpCode opcode;
      string name;
      
      
      // Unique Constructor
      //
      // Accepts a 32 bit ARMv7 instruction, decodes the instruction, and generates
      // a string representation.
      // 
      Instruction(instruction_t newInstruction);
      
      

   private:
   
      // ****************** LASCIATE OGNI SPERANZA, VOI CH'ENTRATE. *********************
      
      // Primary Decoding 
      OpCode decodeInstruction();             // A5-194
      
      // Secondary Decoding
      OpCode decodeDataInstruction();         // A5-196
      OpCode decodeLoadStoreInstruction();    // A5-208
      OpCode decodeBranchLinkInstruction();   // A5-214

      // Tertiary Decoding
      OpCode decodeDataRegInstruction();      // A5-197
      OpCode decodeDataRegShiftInstruction(); // A5-198
      OpCode decodeDataImmedInstruction();    // A5-199
      OpCode decodeEXLSPInstruction();        // A5-203
      OpCode decodeEXLSUInstruction();        // A5-204
      OpCode decodeMiscInstruction();         // A5-207
      OpCode decodeHalfMultInstruction();  
      OpCode decodeMultInstruction();
      
      
      //*********************************************************************************
      
      
};

#endif