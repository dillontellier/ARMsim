#include "armsim.hpp"
#include "Flags.hpp"
#include "Instruction.hpp"


void parseSim() {
   string token;
   unsigned int pcSet = 0xABABABAB;
   unsigned int data;
   stringstream convert;
   
   //DEBUG
   Instruction testInstruction = Instruction(0);
   
   // Check format
   cin >> token;
   assert(token.compare("PC") == 0);
   
   
   // Program Counter
   cin >> token;
   pcSet = hexToUnsigned(token);
   // SET PROGRAM COUNTER
   cout << "This is where I set the PC" << endl;

   
   // Check format
   cin  >> token;
   assert(token.compare("INSTRUCTION") == 0);
   cin >> token;
   assert(token.compare("MEMORY") == 0);
   
   
   // Instruction Memory
   cout << "This is where I load I-Mem" << endl;
   while (!cin.eof() && token.compare("DATA") != 0) {
      cin >> token;
      data = hexToUnsigned(token);
      // ADD TO INSTRUCTION MEMORY
      //DEBUG
      data = swizzle32(data);
      cout << "Adding 0x" << std::hex << setfill('0') << setw(8) << data << " to I-Mem" << endl;
      testInstruction = Instruction((instruction_t)data);
      cout << "This instruction appears to be: " << testInstruction.name << endl;
   } 
   
   // Data Memory
   cout << "This is where I load D-Mem" << endl;
   if (!cin.eof()) {
      // Check format
      cin >> token;
      assert(token.compare("MEMORY") == 0);
      
      while (!cin.eof()) {
         cin >> token;
         data = hexToUnsigned(token);
         // ADD TO DATA MEMORY
         cout << "Adding 0x" << std::hex << setfill('0') << setw(8) << data << " to D-Mem" << endl;
      }
   }
   
}

unsigned int hexToUnsigned(string hexNum) {
   stringstream convert;
   unsigned int data;
   
   convert << hexNum;
   convert >> std::hex >> data;
   
   return data;
}

unsigned int swizzle32(unsigned int data) {
   unsigned int ret = 0x00000000;
   
   ret |= (data << 24) & (0xFF000000);
   ret |= (data << 8) & (0x00FF0000);
   ret |= (data >> 8) & (0x0000FF00);
   ret |= (data >> 24) & (0x000000FF);
   
   return ret;
}

bool testPattern(int target, string pattern) {
   unsigned int mask = 0,
                test = 0,
                i;
   
   
   for (i = 0; i < pattern.size(); i++) {
      if (pattern[i] == '0') {
         mask |= 0b1;
         mask <<= 1;
         
         test &= ~(0b1);
         test <<= 1;
      }
      
      else if (pattern[i] == '1') {
         mask |= 0b1;
         mask <<= 1;
         
         test |= 0b1;
         test <<= 1;
      }
      
      else if (pattern[i] == 'x') {
         mask &= ~(0b1);
         mask <<= 1;
         
         test &= ~(0b1);
         test <<= 1;
      }
      
      else {
         assert(false);
      }
   }
   
   mask >>= 1;
   test >>= 1;
   
   return ((target & mask) == test);
}




