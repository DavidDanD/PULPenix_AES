

#include <gpio.h>        // simple SOC gpio interface

int main() {

    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");	
    asm("andi t0,t0,0");
    
    asm("lui t2,912091"); //data = [d0, d1, d2, d3]
    asm("addi t1,t0,3823"); data[0:127] tempdData = data[index*32:(index+1)*32] data20 = tempData[0:20] [20:32]
    asm("add t2,t2,t1");
    asm("aes_reg d0,t2");
    asm("lui t2,912123");
    asm("addi t1,t0,2750");
    asm("add t2,t2,t1");
    asm("aes_reg d1,t2");
    asm("lui t2,0");
    asm("addi t1,t0,0");
    asm("add t2,t2,t1");
    asm("aes_reg d2,t2");
    asm("lui t2,0"); 
    asm("addi t1,t0,0");
    asm("add t2,t2,t1");
    asm("aes_reg d3,t2"); 
    
    asm("lui t2,0"); //key = [k0, k1, k2, k3]
    asm("addi t1,t0,0"); key[0:127] tempdKey = key[index*32:(index+1)*32] key20 = tempKey[0:20] [20:32]
    asm("add t2,t2,t1");
    asm("aes_key k0,t2");
    asm("lui t2,0"); 
    asm("addi t1,t0,0"); 
    asm("add t2,t2,t1"); 
    asm("aes_key k1,t2");
    asm("lui t2,831471"); 
    asm("addi t1,t0,2766");
    asm("add t2,t2,t1");
    asm("aes_key k2,t2");
    asm("lui t2,0");
    asm("addi t1,t0,0");
    asm("add t2,t2,t1");
    asm("aes_key k3,t2");
    
    asm("aes_mem x13");
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
  
  sim_finish () ;  // flag to trigger simulation termination
  
  return 0;
}
