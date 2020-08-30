

#include <gpio.h>        // simple SOC gpio interface

int main() {

    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");	
    asm("andi t0,t0,0");
    
    asm("lui t2,539996"); //data = [d0, d1, d2, d3]
    asm("addi t1,t0,-1810");
    asm("add t2,t2,t1");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("aes_reg d0,t2");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("lui t2,360914");
    asm("addi t1,t0,917");
    asm("add t2,t2,t1");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("aes_reg d1,t2");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("lui t2,463045");
    asm("addi t1,t0,-1339");
    asm("add t2,t2,t1");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("aes_reg d2,t2");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("lui t2,398618"); 
    asm("addi t1,t0,-1413");
    asm("add t2,t2,t1");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("aes_reg d3,t2"); 
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    
    asm("lui t2,487341"); //key = [k0, k1, k2, k3]
    asm("addi t1,t0,1968");
    asm("add t2,t2,t1");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("aes_key k0,t2");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("lui t2,783790"); 
    asm("addi t1,t0,-2023"); 
    asm("add t2,t2,t1"); 
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("aes_key k1,t2");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("lui t2,293526"); 
    asm("addi t1,t0,-1817");
    asm("add t2,t2,t1");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("aes_key k2,t2");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("lui t2,651094");
    asm("addi t1,t0,448");
    asm("add t2,t2,t1");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("aes_key k3,t2");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    
    asm("addi t2,t0,160");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("aes_mem t2");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    
    asm("aes_run");
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
    asm("lw t3, 0(t2)");
    asm("lw t4, 4(t2)");
    asm("lw t5, 8(t2)");
    asm("lw t6, 12(t2)");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("addi t3,t0,57");
    asm("sw t3, 0(t2)");
    asm("andi t4, t4, 0");//clean
    asm("lw t4, 0(t2)");
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
