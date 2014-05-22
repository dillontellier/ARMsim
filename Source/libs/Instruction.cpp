#include "Instruction.hpp"
#include "Flags.hpp"

using namespace std;

extern Flags flags;

#define LAST MOV_IM

Instruction::Instruction(instruction_t newInstruction) {
   instruction = newInstruction;
   opcode = decodeInstruction();
   name = (opcode <= LAST) ? opCodeNames[opcode] : "INVALID";
}


OpCode Instruction::decodeInstruction() {
   unsigned int condition = Extract(4, 28, instruction);
   
   unsigned int op = Extract(1, 4, instruction),
                    op1 = Extract(3, 25, instruction);
                      
   OpCode opcode = INVALID;
    
   
   // Unconditional Operations (Not Supported)
   if (condition == 0b1111) 
      opcode = UNSUPPORTED;
   
   // Condition not met
   else if (!flags.isConditionValid(condition)) 
      opcode = NOP;
   
   // Condition met
   else {
      // Data-processing and miscellaneous instructions on page A5-196.
      if (testPattern(op1, "00x")) 
         opcode = decodeDataInstruction();
      
      // Load/store word and unsigned byte on page A5-208
      else if (testPattern(op1, "010")) 
         opcode = decodeLoadStoreInstruction();
      
      // Load/store word and unsigned byte on page A5-208
      else if (testPattern(op1, "011") && op == 0) 
         opcode = decodeLoadStoreInstruction();
      
      // Media instructions on page A5-209
      else if (testPattern(op1, "011") && op == 1) 
         opcode = UNSUPPORTED;
      
      // Branch, branch with link, and block data transfer on page A5-214
      else if (testPattern(op1, "10x")) 
         opcode = decodeBranchLinkInstruction();

      // Coprocessor instructions and Supervisor Call on page A5-215 (Not Supported)
      else if (testPattern(op1, "11x")) 
         opcode = UNSUPPORTED;
   }
   
   return opcode;
}

OpCode Instruction::decodeDataInstruction() {
   unsigned int op = Extract(1, 25, instruction),
                op1 = Extract(5, 20, instruction),
                op2 = Extract(4, 4, instruction);
   
   OpCode opcode = INVALID;
   
   // Sanity check
   assert(Extract(2, 26, instruction) == 0b00);
   
   if (op == 0) {
      
      
      if (!testPattern(op1, "10xx0")) {
         
         // Data-processing (register)on page A5-197
         if (testPattern(op2, "xxx0"))
            opcode = decodeDataRegInstruction();
         
         // Data-processing (register-shifted register) on page A5-198         
         else if (testPattern(op2, "0xx1"))
            opcode = decodeDataRegShiftInstruction();
      }
      
      else if (testPattern(op1, "10xx0")) {
      
         // Miscellaneous instructions on page A5-207
         if (testPattern(op2, "000x"))
            opcode = decodeMiscInstruction();
         
         // Halfword multiply and multiply accumulate on page A5-203
         else if (testPattern(op2, "1xx0"))
            opcode = decodeHalfMultInstruction();
            
      }
      
      else if (testPattern(op1, "0xxxx")) {
        
        // Multiply and multiply accumulate on page A5-202
         if (testPattern(op2, "1001"))
            opcode = decodeMultInstruction();
            
      }
      
      else if (testPattern(op1, "1xxxx")) {
        
        //Synchronization primitives on page A5-205
         if (testPattern(op2, "1001"))
            opcode = UNSUPPORTED;
            
      }
      
      else if (!testPattern(op1, "0xx1x")) {
         
         // Extra load/store instructions on page A5-203
         if (testPattern(op2, "1011") || testPattern(op2, "11x1"))
            opcode = decodeEXLSPInstruction();
            
      }
      
      else if (testPattern(op1, "0xx1x")) {
         
         // Extra load/store instructions on page A5-203
         if (testPattern(op2, "1011"))
            opcode = decodeEXLSUInstruction();
         
         // Extra load/store instructions, unprivileged on page A5-204
         else if (testPattern(op2, "11x1"))
            opcode = decodeEXLSPInstruction();
            
      }
      
   }
   
   else if (op == 1) {
      
      // Data-processing (immediate) on page A5-199
      if (!testPattern(op1, "10xx0"))
         opcode = decodeDataImmedInstruction();
         
      // 16-bit immediate load, MOV (immediate)on page A8-484. Variant: v6T2
      else if (testPattern(op1, "10000"))
         opcode = MOV_IM;
         
      // High halfword 16-bit immediate load, MOVT on page A8-491. Variant: v6T2
      else if (testPattern(op1, "10100"))
         opcode = MOVT_IM;
      
      // MSR (immediate), and hints on page A5-206      
      else if (testPattern(op1, "10x10"))
         opcode = UNSUPPORTED;
      
   }
   
   return opcode;
}

OpCode Instruction::decodeLoadStoreInstruction() {
   unsigned int a = Extract(1, 25, instruction),
                b = Extract(1, 4, instruction),
                op1 = Extract(5, 20, instruction),
                rn = Extract(4, 16, instruction);
                
   OpCode opcode = INVALID;
   
   // Sanity check
   assert(Extract(2, 26, instruction) == 0b01);
   
   if (a == 0) {
      
      if (testPattern(op1, "xx0x0") && !testPattern(op1, "0x010"))
         opcode = STR_IM;
         
      else if (testPattern(op1, "0x010"))
         opcode = STRT;
         
      else if (testPattern(op1, "xx0x1") && !testPattern(op1, "0x011")) 
         opcode = (rn != 0b1111) ? LDR_IM : LDR_LIT;
      
      else if (testPattern(op1, "0x011"))
         opcode = LDRT;
         
      else if (testPattern(op1, "xx1x0") && !testPattern(op1, "0x110"))
         opcode = STRB_IM;
         
      else if (testPattern(op1, "0x110"))
         opcode = STRBT;
      
      else if (testPattern(op1, "xx1x1") && !testPattern(op1, "0x111")) 
         opcode = (rn != 0b1111) ? LDRB_IM : LDRB_LIT;

      else if (testPattern(op1, "0x111"))
         opcode = LDRBT;
      
   }
   
   else if (a == 1) {
      // Sanity check
      assert(b == 0);
      
      if (testPattern(op1, "xx0x0") && !testPattern(op1, "0x010"))
         opcode = STR_REG;
         
      else if (testPattern(op1, "0x010"))
         opcode = STRT;
      
      else if (testPattern(op1, "xx0x1") && !testPattern(op1, "0x011"))
         opcode = LDR_REG;
         
      else if (testPattern(op1, "0x011"))
         opcode = LDRT;
       
      else if (testPattern(op1, "xx1x0") && !testPattern(op1, "0x110"))
         opcode = STRB_REG;
      
      else if (testPattern(op1, "0x110"))
         opcode = STRBT;
         
      else if (testPattern(op1, "xx1x1") && !testPattern(op1, "0x111")) 
         opcode = LDRB_REG;
         
      else if (testPattern(op1, "0x111"))
         opcode = LDRBT;
         
   }
   
   return opcode;
}

OpCode Instruction::decodeBranchLinkInstruction() {
   unsigned int op = Extract(6, 20, instruction),
                r = Extract(1, 15, instruction),
                rn = Extract(4, 16, instruction);
   
   OpCode opcode = INVALID;
   
   // Sanity check
   assert(Extract(2, 26, instruction) == 0b10);
   
   if (testPattern(op, "0000x0"))
      opcode = STMDA;
      
   else if (testPattern(op, "0000x1"))
      opcode = LDMDA;
      
   else if (testPattern(op, "0010x0"))
      opcode = STM;
      
   else if (op == 0b001001)
      opcode = LDM;
      
   else if (op == 0b001011) 
      opcode = (rn != 0b1101) ? LDM : POP;
      
   else if (op == 0b010000)
      opcode = STMDB;
      
   else if (op == 0b010010) 
      opcode = (rn != 0b1101) ? STMDB : PUSH;

   else if (testPattern(op, "0100x1"))
      opcode = LDMDB;
      
   else if (testPattern(op, "0110x0"))
      opcode = STMIB;
      
   else if (testPattern(op, "0110x1"))
      opcode = LDMIB;
      
   else if (testPattern(op, "0xx1x0"))
      opcode = STM_USR;
      
   else if (testPattern(op, "0xx1x1"))
      opcode = (r == 0) ? LDM_USR : UNSUPPORTED;
      
   else if (testPattern(op, "10xxxx"))
      opcode = B;
      
   else if (testPattern(op, "11xxxx"))
      opcode = BLX_IM;
   
   return opcode;
}

OpCode Instruction::decodeDataRegInstruction() {
   unsigned int op = Extract(5, 20, instruction),
                op2 = Extract(2, 5, instruction),
                imm5 = Extract(5, 7, instruction);
   
   OpCode opcode = INVALID;
   
   // Sanity check
   assert(Extract(3, 25, instruction) == 0b000);
   assert(Extract(1, 4, instruction) == 0b0);
   
   if (testPattern(op, "0000x"))
      opcode = AND_REG;
      
   else if (testPattern(op, "0001x"))
      opcode = EOR_REG;
      
   else if (testPattern(op, "0010x"))
      opcode = SUB_REG;
      
   else if (testPattern(op, "0011x"))
      opcode = RSB_REG;
      
   else if (testPattern(op, "0100x"))
      opcode = ADD_REG;
      
   else if (testPattern(op, "0101x"))
      opcode = ADC_REG;
      
   else if (testPattern(op, "0110x"))
      opcode = SBC_REG;
      
   else if (testPattern(op, "0111x"))
      opcode = RSC_REG;
      
   else if (testPattern(op, "10xx0")) {
      cout << "We don't take too kindly to poorly encoded instructions 'round 'ere" << endl;
      assert(false);
   }
   
   else if (op == 0b10001)
      opcode = TST_REG;
      
   else if (op == 0b10011)
      opcode = TEQ_REG;
      
   else if (op == 0b10101)
      opcode = CMP_REG;
      
   else if (op == 0b10111)
      opcode = CMN_REG;
      
   else if (testPattern(op, "1100x"))
      opcode = ORR_REG;
   
   else if (testPattern(op, "1101x")) {
      switch (op2) {
      
      case 0b00:
         opcode = (imm5 == 0b00000) ? MOV_REG : LSL_IM;
         break;
         
      case 0b01:
         opcode = LSR_IM;
         break;
         
      case 0b10:
         opcode = ASR_IM;
         break;
         
      case 0b11:
         opcode = (imm5 == 0b00000) ? RRX : ROR_IM;
         break;
         
      default:
         opcode = INVALID;
         break;
      }
   }
   
   else if (testPattern(op, "1110x")) 
      opcode = BIC_REG;
      
   else if (testPattern(op, "1111x"))
      opcode = MVN_REG;
  
   else 
      opcode = INVALID;
   
   return opcode;
}

OpCode Instruction::decodeDataRegShiftInstruction() {
   unsigned int op1 = Extract(5, 20, instruction),
                op2 = Extract(2, 5, instruction);
                
   OpCode opcode = INVALID;
   
   // Sanity check
   assert(Extract(3, 25, instruction) == 0b000);
   assert(Extract(1, 7, instruction) == 0);
   assert(Extract(1, 4, instruction) == 1);
   
   if (testPattern(op1, "0000x"))
      opcode = AND_RSREG;
      
   else if (testPattern(op1, "0001x"))
      opcode = EOR_RSREG;
      
   else if (testPattern(op1, "0010x"))
      opcode = SUB_RSREG;
      
   else if (testPattern(op1, "0011x"))
      opcode = RSB_RSREG;
      
   else if (testPattern(op1, "0100x"))
      opcode = ADD_RSREG;
      
   else if (testPattern(op1, "0101x"))
      opcode = ADC_RSREG;
      
   else if (testPattern(op1, "0110x"))
      opcode = SBC_RSREG;
      
   else if (testPattern(op1, "0111x"))
      opcode = RSC_RSREG;
      
   else if (testPattern(op1, "10xx0")) {
      cout << "We don't take too kindly to poorly encoded instructions 'round 'ere" << endl;
      assert(false);
   }
   
   else if (op1 == 0b10001)
      opcode = TST_RSREG;
      
   else if (op1 == 0b10011)
      opcode = TEQ_RSREG;
      
   else if (op1 == 0b10101)
      opcode = CMP_RSREG;
      
   else if (op1 == 0b10111)
      opcode = CMN_RSREG;
      
   else if (testPattern(op1, "1100x"))
      opcode = ORR_RSREG;
   
   else if (testPattern(op1, "1101x")) {
      switch (op2) {
      
      case 0b00:
         opcode = LSL_REG;
         break;
         
      case 0b01:
         opcode = LSR_REG;
         break;
         
      case 0b10:
         opcode = ASR_REG;
         break;
         
      case 0b11:
         opcode = ROR_REG;
         break;
         
      default:
         opcode = INVALID;
         break;
         
      }
   }
   
   else if (testPattern(op1, "1110x")) 
      opcode = BIC_RSREG;
      
   else if (testPattern(op1, "1111x"))
      opcode = MVN_RSREG;
  
   
   return opcode;
}

OpCode Instruction::decodeMiscInstruction() {
   unsigned int op = Extract(2, 21, instruction),
                    op2 = Extract(3, 4, instruction),
                    satOp = Extract(2, 21, instruction);
                   
   OpCode opcode = INVALID;
   
   // Sanity Check
   assert(Extract(5, 23, instruction) == 0b00010);
   assert(Extract(1, 20, instruction) == 0);
   assert(Extract(7, 20, instruction) == 0);
   
   if (op2 == 0b001) {
   
      if (op == 0b01) 
         opcode = BX;
         
      else if (op == 0b11)
         opcode = CLZ;
         
      else
         opcode = INVALID;
         
   }
   
   else if (op2 == 0b011 && op == 0b01)
      opcode = BLX_REG;
      
   else if (op2 == 0b101) {
      
      switch (satOp) {
         
         case 0b00:
            opcode = QADD;
            break;
            
         case 0b01:
            opcode = QSUB;
            break;
            
         case 0b10:
            opcode = QDADD;
            break;
            
         case 0b11:
            opcode = QDSUB;
            break;
      
         default:
            opcode = INVALID;
            break;
      }
   }
    
   else 
      opcode = UNSUPPORTED;
      
   return opcode;
}

OpCode Instruction::decodeEXLSPInstruction() {
   unsigned int op1 = Extract(5, 20, instruction),
                    op2 = Extract(2, 5, instruction),
                    rn = Extract(4, 16, instruction);
                    
   OpCode opcode = INVALID;
   
   // Sanity Check
   assert(Extract(3, 25, instruction) == 0b000);
   assert(Extract(1, 7, instruction) == 1);
   assert(Extract(1, 4, instruction) == 1);
   
   if (op2 == 0b01) {
   
      if (testPattern(op1, "xx0x0"))
         opcode = STRH_REG;
         
      else if (testPattern(op1, "xx0x1"))
         opcode = LDRH_REG;
         
      else if (testPattern(op1, "xx1x0"))
         opcode = STRH_IM;
         
      else if (testPattern(op1, "xx1x1"))
         opcode = (rn != 0b1111) ? LDRH_IM : LDRH_LIT;
         
   }
   
   else if (op2 == 0b10) {
   
      if (testPattern(op1, "xx0x0"))
         opcode = LDRD_REG;
         
      else if (testPattern(op1, "xx0x1"))
         opcode = LDRSB_REG;
         
      else if (testPattern(op1, "xx1x0"))
         opcode = (rn != 0b1111) ? LDRD_IM : LDRD_LIT;
         
      else if (testPattern(op1, "xx1x1"))
         opcode = (rn != 0b1111) ? LDRSB_IM : LDRSB_LIT;
         
   }
   
   else if (op2 == 0b11) {
      
      if (testPattern(op1, "xx0x0"))
         opcode = STRD_REG;
         
      else if (testPattern(op1, "xx0x1"))
         opcode = LDRSH_REG;
         
      else if (testPattern(op1, "xx1x0"))
         opcode = STRD_IM;
         
      else if (testPattern(op1, "xx1x1"))
         opcode = (rn != 0b1111) ? LDRSH_IM : LDRSH_LIT;
       
   }
   
   return opcode;
}

OpCode Instruction::decodeEXLSUInstruction() {
   unsigned int op = Extract(1, 20, instruction),
                    op2 = Extract(2, 5, instruction);
                    
   OpCode opcode = INVALID;
   
   // Sanity Check
   assert(Extract(4, 24, instruction) == 0b0000);
   assert(Extract(1, 21, instruction) == 1);
   assert(Extract(1, 7, instruction) == 1);
   assert(Extract(1, 4, instruction) == 1);
   
   if (op2 == 0b01)
      opcode = (op == 0) ? STRHT : LDRHT;
      
   else if (op2 == 0b10 && op == 1)
      opcode = LDRSBT;
      
   else if (op2 == 0b11 && op == 1)
      opcode = LDRSHT;
   
   return opcode;
}

OpCode Instruction::decodeDataImmedInstruction() {
   unsigned int op = Extract(5, 20, instruction),
                    rn = Extract(4, 16, instruction);
                    
   OpCode opcode = INVALID;
   
   // Sanity check
   assert(Extract(3, 25, instruction) == 0b001);
   
   if (testPattern(op, "0000x"))
      opcode = ADD_IM;
      
   else if (testPattern(op, "0001x"))
      opcode = EOR_IM;
      
   else if (testPattern(op, "0010x")) {
      
      if (rn != 0b1111)
         opcode = SUB_IM;
         
      else
         opcode = ADR;
         
   }
      
   else if (testPattern(op, "0011x"))
      opcode = RSB_IM;
      
   else if (testPattern(op, "0100x")) {
      
      if (rn != 0b1111)
         opcode = ADD_IM;
         
      else 
         opcode = ADR;
         
   }
       
   else if (testPattern(op, "0101x"))
      opcode = ADC_IM;
      
   else if (testPattern(op, "0110x"))
      opcode = SBC_IM;
      
   else if (testPattern(op, "0111x"))
      opcode = RSC_IM;
   
   else if (testPattern(op, "10xx0")) {
      cout << "We don't take too kindly to poorly encoded instructions 'round 'ere" << endl;
      assert(false);
   }
   
   else if (op == 0b10001)
      opcode = TST_IM;
      
   else if (op == 0b10011)
      opcode = TEQ_IM;
      
   else if (op == 0b10101)
      opcode = CMP_IM;
      
   else if (op == 0b10111)
      opcode = CMN_IM;
      
   else if (testPattern(op, "1100x"))
      opcode = ORR_IM;
      
   else if (testPattern(op, "1101x"))
      opcode = MOV_IM;
      
   else if (testPattern(op, "1110x"))
      opcode = BIC_IM;
      
   else if (testPattern(op, "1111x"))
      opcode = MVN_IM;
     
   return opcode;
}

OpCode Instruction::decodeHalfMultInstruction() {
   OpCode opcode = UNSUPPORTED;
   return opcode;
}

OpCode Instruction::decodeMultInstruction() {
   OpCode opcode = UNSUPPORTED;
   return opcode;
}



