//*****************************************************************************
//
// Author: Dillon Tellier
// Project: ARMsim
// File: armsim.cpp
// Last Revision: Spring 2014
//
//*****************************************************************************
#include "armsim.hpp"
#include "Flags.hpp"
#include "Instruction.hpp"

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


void parseObjDump() {
   string token = "N/A";
   string segment;
   unsigned int pcSet = 0;
   unsigned int data = 0;
   unsigned int address = 0;
   
   stringstream convert;
   
   bool endOfSeg = false;
   bool isAddr = false;
   
   //DEBUG
   Instruction testInstruction = Instruction(0);
   cout << std::uppercase;
  
   cin >> token;
   
   while (!endOfSeg) {
      
      
      if (token.compare("address") == 0) {
         cin >> token;
         pcSet = hexToUnsigned(token);
         
         // Output parse results
         cout << "PC: 0x" << std::hex << setfill('0') << setw(8) << pcSet << endl;
         //
      }
      
      else if(token.compare("Contents") == 0) {
         cin >> token;
         cin >> token;
         cin >> token;
         
         segment = token;
         cout << endl << "Segment: " << segment << endl;
         
         // Instruction Memory
         if (segment.compare(".init:") == 0 ||
             segment.compare(".text:") == 0 ||
             segment.compare(".fini:") == 0) {
             
            isAddr = true;
            
            cin >> token;
            
            while (token.compare("Contents") != 0) {
               
               // Addresses
               if (isAddr) {
                  data = hexToUnsigned(token);
                  address = data;
                  
                  if (address != 0)
                     isAddr = false;
               }
               
               // Data
               else if (token.size() == 8 && token[0] != '.') {
                  data = hexToUnsigned(token);
                  data = swizzle32(data);
                  
                  // Output parse results
                  cout << "ADDR:0x" << std::hex << setfill('0') << setw(8) << address;
                  cout << " INST:0x" << std::hex << setfill('0') << setw(8) << data << " ";
                  testInstruction = Instruction((instruction_t)data);
                  cout << "OPCODE:" << testInstruction.name << endl;
                  //
                  
                  address += 4;
               }
               
               // Objdump stuff
               else {
                  isAddr = true;
               }
               
               cin >> token;
            }
         }
         
         
         // Data Memory
         else if (segment.compare(".rodata:") == 0 ||
                  segment.compare(".eh_frame:") == 0 ||
                  segment.compare(".ctors:") == 0 ||
                  segment.compare(".dtors:") == 0 ||
                  segment.compare(".jcr:") == 0 ||
                  segment.compare(".data:") == 0) {
                  
            isAddr = true;
            
            cin >> token;

            while (token.compare("Contents") != 0) {
               
               // Addresses
               if (isAddr) {
                  data = hexToUnsigned(token);
                  address = data;
                  isAddr = false;
               }
               
               // Data
               else if (token.size() == 8 && token[0] != '.') {
                  data = hexToUnsigned(token);
                  data = swizzle32(data);
                  
                  // Output parse results
                  cout << "ADDR:0x" << std::hex << setfill('0') << setw(8) << address;
                  cout << " DATA:0x" << std::hex << setfill('0') << setw(8) << data << endl;
                  //
                  
                  address += 4;
               }
               
               // Objdump stuff
               else {
                  isAddr = true;
               }
               
               cin >> token;
            }
         }
         
         
         // Comments and Debug Memory (segments not loaded)
         else if (token.compare(".comment:") == 0)
            endOfSeg = true;
            
         else
            endOfSeg = true;
         
      }
   
      else
         cin >> token;
   }
}



