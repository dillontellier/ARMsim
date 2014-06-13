//*****************************************************************************
//
// Author: Dillon Tellier
// Project: ARMsim
// File: armsim.hpp
// Last Revision: Spring 2014
//
//*****************************************************************************
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


// Macros


// Extracts [width] bits at [offset] from [original].
#define Extract(width, offset, original) ((original >> offset) & (0xFFFFFFFF >> ((8*(sizeof(original)) - width)))) 

// Checks if an [instruction] is decoded to [code].
//Note: Must define "Instruction test".
#define Validate(instruction , code) { \
   raw = instruction;\
   test = Instruction(raw);\
   assert(test.opcode == code);\
}

// Decodes and instruction and prints the name.
// Note: Must define "Instruction test".
#define DecodeRaw(raw_t, swiz) { \
   raw = raw_t;\
   raw = (swiz == 1) ? swizzle32(raw) : raw;\
   test = Instruction(raw);\
   cout << test.name << endl;\
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

// Parses an objdump of an elf32 binary file and loads the system memory.
//
// Params: none - Note 1: Must redirect objdump to stdin.
//                Note 2: objdump must be called with -s and -x flags
//
void parseObjDump();

// Converts a string representation of a hexadecimal number
// and returns the integer representation of that number.
//
// Params: hexNum - The string containing the number.
//                  Note: "0x" may be prepended.
//
// Return: An unsigned integer representation of the number.
//
unsigned int hexToUnsigned(string hexNum);

// Swizzles (reverses endianness) of a given 32-bit data field.
//
// Params: data - The 32 bit data type to be swizzled.
//
// Return: A 32 bit unsigned integer endian-reversed data field.
//
unsigned int swizzle32(unsigned int data);




#endif




