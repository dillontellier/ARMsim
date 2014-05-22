#include "armsim.hpp"
#include "Flags.hpp"


void parseSim() {
   string token;
   unsigned int pcSet = 0xABABABAB;
   unsigned int data;
   stringstream convert;
   
   // Check format
   cin >> token;
   assert(token.compare("PC") == 0);
   
   
   // Program Counter
   cin >> token;
   pcSet = hexToUnsigned(token);
   // SET PROGRAM COUNTER

   
   // Check format
   cin  >> token;
   assert(token.compare("INSTRUCTION") == 0);
   cin >> token;
   assert(token.compare("MEMORY") == 0);
   
   cin >> token;
   
   // Instruction Memory
   while (!cin.eof() && token.compare("DATA") != 0) {
      cin >> token;
      data = hexToUnsigned(token);
      // ADD TO INSTRUCTION MEMORY
   } 
   
   // Data Memory
   if (!cin.eof()) {
      // Check format
      cin >> token;
      assert(token.compare("MEMORY") == 0);
      
      while (!cin.eof()) {
         cin >> token;
         data = hexToUnsigned(token);
         // ADD TO DATA MEMORY
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




