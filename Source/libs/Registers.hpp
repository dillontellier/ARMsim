//*****************************************************************************
//
// Author: Dillon Tellier
// Project: ARMsim
// File: Registers.hpp
// Last Revision: Spring 2014
//
//*****************************************************************************
#ifndef REGISTERS_HPP
#define REGISTERS_HPP

#include "armsim.hpp"

// Special register names see page A2-45

#define RVAL 0 // Return Value

#define ARG1 0 // Arguments
#define ARG2 1
#define ARG3 2
#define ARG4 3

#define TEMP0 0 // Temporary Registers
#define TEMP1 1
#define TEMP2 2
#define TEMP3 3
#define TEMP12 12

#define FP 11 // ARM Frame Pointer
#define SP 13 // Stack Pointer
#define LR 14 // Link Register
#define PC 15 // Program Counter

typedef unsigned int armRegister_t;

#endif