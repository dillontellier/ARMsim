#ifndef FLAGS_HPP
#define FLAGS_HPP

class Flags {
public:
   bool n, // Negative
        z, // Zero 
        c, // Carry
        v; // Overflow
        
        
   // Default constructor for flags object.
   //
   // Params: N/A
   //
   // Return: a newly constructed Flag object with all flags set to false.
   // 
   Flags();
           
   // Checks the microcontroller flags for the validity of a conditional
   // instruction.
   //
   // Params: condition - An integer whose last byte is the condition.
   //
   // Return: Checks if the condition is met vis-a-vis the current flags.
   //
   bool isConditionValid(unsigned int condition);
   
   // DEBUG
   void printFlags();
};

#endif