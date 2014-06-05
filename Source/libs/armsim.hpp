#ifndef ARMSIM_HPP
#define ARMSIM_HPP

// Library Inclusions
#include <iostream> 
#include <sstream>
#include <iomanip>
#include <vector>
#include <algorithm>
#include <map>
#include <cmath>
#include <cassert>



// Check System Endianess
#undef LITTLE_ENDIAN
#undef BIG_ENDIAN

#ifdef _WIN32
#define LITTLE_ENDIAN
#endif
#ifdef __i386__
#define LITTLE_ENDIAN
#endif
#ifdef __x86_64__
#define LITTLE_ENDIAN
#endif
#ifdef _BIG_ENDIAN
#define BIG_ENDIAN
#endif

// Macros


// Extracts [width] bits at [offset] from [original].
#define Extract(width, offset, original) ((original >> offset) & (0xFFFFFFFF >> ((8*(sizeof(original)) - width)))) 

// Checks if an [instruction] is decoded to [code].
#define Validate(instruction , code) { \
   raw = instruction;\
   test = Instruction(raw);\
   assert(test.opcode == code);\
}


// Default namespace
using namespace std;

// Basic typedefs
typedef unsigned char byte;



// Checks to see if a given bit-string matches a given bit pattern.
//
// Params: target - The bit string to be checked.
//         pattern - A string with the checking pattern.
//                   '0' and '1' are represented by themselves.
//                   Dont cares are denoted as 'x'.
//                   E.G. "0x11x0"
//
// Return: True if the pattern is matched, else false.
//
bool testPattern(int target, string pattern);

void parseSim();
unsigned int hexToUnsigned(string hexNum);
unsigned int swizzle32(unsigned int data);




#endif




