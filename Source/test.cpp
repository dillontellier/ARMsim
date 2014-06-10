// Test
#include "armsim.hpp"
#include "Flags.hpp"
#include "Instruction.hpp"
#include "Registers.hpp"

using namespace std;

   

Flags flags = Flags();

extern 

void printInstruction(instruction_t test) {
   Instruction obj = Instruction(test); 
   
   cout << "Testing OpCode: 0x" << std::hex << test << endl;

   cout << "Result: " << obj.name << endl << endl;
}

int main() {
   //instruction_t raw = 0x0;
   //Instruction test = Instruction(0);
   
   #ifdef DEBUG
   /*
   // Failed conditions
   cout << "Testing Failed Conditions" << endl;
   Validate(0x00000000, NOP);
   
   
   
   // Unsupported operations
   cout << "Testing Unsupported Instructions" << endl;
   Validate(0x16000010, UNSUPPORTED);
   Validate(0x1C000010, UNSUPPORTED);
   Validate(0x1E000010, UNSUPPORTED);
   Validate(0xFFFFFFFF, UNSUPPORTED);

   

   for (int i = NOP; i < END; i++)
      cout << "Testing: " << opCodeNames[i] << endl;
      */
   #endif
   
   //parseSim();
   // DecodeRaw(0xf0402de9, 1);
   // DecodeRaw(0x64409fe5, 1);
   // DecodeRaw(0x0030d4e5, 1);
   // DecodeRaw(0x000053e3, 1);
   // DecodeRaw(0xf080bd18, 1);
   // DecodeRaw(0x58709fe5, 1);
   parseObjDump();
   
   
   
   return 0;
}



