

#include <gpio.h>        // simple SOC gpio interface

int main() {

    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");	
    asm("andi t0,t0,0");
    
    asm("lui t2,%%data0-0:20%%"); //data = [d0, d1, d2, d3]
    asm("addi t1,t0,%%data0-20:32%%");
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
    asm("lui t2,%%data1-0:20%%");
    asm("addi t1,t0,%%data1-20:32%%");
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
    asm("lui t2,%%data2-0:20%%");
    asm("addi t1,t0,%%data2-20:32%%");
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
    asm("lui t2,%%data3-0:20%%"); 
    asm("addi t1,t0,%%data3-20:32%%");
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
    
    asm("lui t2,%%key0-0:20%%"); //key = [k0, k1, k2, k3]
    asm("addi t1,t0,%%key0-20:32%%");
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
    asm("lui t2,%%key1-0:20%%"); 
    asm("addi t1,t0,%%key1-20:32%%"); 
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
    asm("lui t2,%%key2-0:20%%"); 
    asm("addi t1,t0,%%key2-20:32%%");
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
    asm("lui t2,%%key3-0:20%%");
    asm("addi t1,t0,%%key3-20:32%%");
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
  
  sim_finish () ;  // flag to trigger simulation termination
  
  return 0;
}
