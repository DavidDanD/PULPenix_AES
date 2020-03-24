


#include <gpio.h>        // simple SOC gpio interface

int main() {

    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");	
    asm("ori x6,x0,3");
    asm("ori x7,x0,7");
    asm("add x5,x6,x7");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");

  sim_finish () ;  // flag to trigger simulation termination
  
  return 0;
}
