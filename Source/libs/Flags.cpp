//*****************************************************************************
//
// Author: Dillon Tellier
// Project: ARMsim
// File: Flags.cpp
// Last Revision: Spring 2014
//
//*****************************************************************************
#include "Flags.hpp"
#include "armsim.hpp"

using namespace std;

Flags::Flags() : n(false),
                 z(false),
                 c(false),
                 v(false) {}
        

bool Flags::isConditionValid(unsigned int condition) {
   bool isValid = false;
   
   // Mask any errant values outside of 4 condition bits
   condition &= 0x0000000F;
   
   switch(condition) {
      case 0b0000:
         isValid = (z == true);
         break;
         
      case 0b0001:
         isValid = (z == false);
         break;
         
      case 0b0010:
         isValid = (c == true);
         break;
         
      case 0b0011:
         isValid = (c == false);
         break;
         
      case 0b0100:
         isValid = (n == true);
         break;
         
      case 0b0101:
         isValid = (n == false);
         break;
         
      case 0b0110:
         isValid = (v == true);
         break;
         
      case 0b0111:
         isValid = (v == false);
         break;
         
      case 0b1000:
         isValid = (c == 1 && z == 0);
         break;
         
      case 0b1001:
         isValid = (c == 0 && z == 1);
         break;
         
      case 0b1010:
         isValid = (n == v);
         break;
         
      case 0b1011:
         isValid = (n != v);
         break;
         
      case 0b1100:
         isValid = (z == 0 && n == v);
         break;
         
      case 0b1101:
         isValid = (z == 1 && n != v);
         break;
         
      case 0b1110:
         isValid = true;
         break;
         
      case 0b1111:
         isValid = true;
         break;
         
      default:
         isValid = false;
         break;
   }
   
      
   return isValid;
}

void Flags::printFlags() {
   cout << "N: " << n << endl;
   cout << "Z: " << z << endl;
   cout << "C: " << c << endl;
   cout << "V: " << v << endl;
} 


