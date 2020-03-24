

#include <gpio.h>        // simple SOC gpio interface

int main() {
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    int a = 5;
    int b = 2;
    int c = a + b;
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    sim_finish () ;  // flag to trigger simulation termination
  
  return 0;
}
