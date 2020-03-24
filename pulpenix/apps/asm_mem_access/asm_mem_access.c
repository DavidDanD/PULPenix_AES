

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
    asm("andi x5, x5, 0");
    asm("andi x6, x6, 0");
    asm("andi x7, x7, 0");
    asm("addi x5, x0, 1");
    asm("slli x5, x5, 20");//bit 20 needs to be 1
    asm("addi x5, x5, 160");//to write to word number 40
    //asm("slli x5, x5, 2");
    //asm("addi x5, x5, 190");
    asm("addi x6, x0, 14");
    asm("addi x7, x0, 11");
    //asm(".word 0x007342bb");
    asm(".word 0x027342bb");//mem(addr = 40) = result of  the xor
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
