


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
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");	
    asm("andi t0,t0,0");
    asm("andi t1,t1,0");
    asm("andi t2,t2,0");
    asm("andi t3,t3,0");
    asm("andi t4,t4,0");
    asm("andi t5,t5,0");
    asm("addi t1,t1,0");
    asm("addi t2,t2,11"); 
    asm("beq zero,t1,4");  
    asm("addi t3,t2,0");
    asm("addi t4,t1,0");
    asm("addi t5,t0,0");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("beq zero,t2,4");  
    asm("addi t3,t2,0");
    asm("addi t4,t1,0");
    asm("addi t5,t0,0");
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
