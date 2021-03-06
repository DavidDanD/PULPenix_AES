

#include <gpio.h>        // simple SOC gpio interface

int main() {

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
    asm("addi t1,t1,34");
    asm("addi t2,t2,256");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop"); 
    asm(".word 0x007302bb");  //asm("cus t0, t1, t2") based on asm("add t0, t1, t2") 007302b3 add opcode is 33, custom is 3b, so last hex charachters change to b
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("addi t3,t2,0");
    asm("addi t4,t1,0");
    asm("addi t5,t0,0");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm(".word 0x007322bb");  //asm("cus2 t0, t1, t2") we change bits [14:12] {000} -> {010}
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
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
    asm(".word 0x007342bb");  //asm("cus2 t0, t1, t2") we change bits [14:12] {000} -> {010}
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("addi t3,t2,0");
    asm("addi t4,t1,0");
    asm("addi t5,t0,0");

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
    asm("addi t1,t1,34");
    asm("addi t2,t2,0");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm(".word 0x007342bb");  //asm("cus2 t0, t1, t2") we change bits [14:12] {000} -> {010}
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("addi t3,t2,0");
    asm("addi t4,t1,0");
    asm("addi t5,t0,0");

  
  sim_finish () ;  // flag to trigger simulation termination
  
  return 0;
}
