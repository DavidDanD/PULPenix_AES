

#include <gpio.h>        // simple SOC gpio interface

int main() {

    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");	
    asm("andi t0,t0,0");
    
    asm("lui t2,%%data0-0:20%%"); //data = [d0, d1, d2, d3]
    asm("addi t1,t0,%%data0-20:32%%"); data[0:127] tempdData = data[index*32:(index+1)*32] data20 = tempData[0:20] [20:32]
    asm("add t2,t2,t1");
    asm("aes_reg d0,t2");
    asm("lui t2,%%data1-0:20%%");
    asm("addi t1,t0,%%data1-20:32%%");
    asm("add t2,t2,t1");
    asm("aes_reg d1,t2");
    asm("lui t2,%%data2-0:20%%");
    asm("addi t1,t0,%%data2-20:32%%");
    asm("add t2,t2,t1");
    asm("aes_reg d2,t2");
    asm("lui t2,%%data3-0:20%%"); 
    asm("addi t1,t0,%%data3-20:32%%");
    asm("add t2,t2,t1");
    asm("aes_reg d3,t2"); 
    
    asm("lui t2,%%key0-0:20%%"); //key = [k0, k1, k2, k3]
    asm("addi t1,t0,%%key0-20:32%%"); key[0:127] tempdKey = key[index*32:(index+1)*32] key20 = tempKey[0:20] [20:32]
    asm("add t2,t2,t1");
    asm("aes_key k0,t2");
    asm("lui t2,%%key1-0:20%%"); 
    asm("addi t1,t0,%%key1-20:32%%"); 
    asm("add t2,t2,t1"); 
    asm("aes_key k1,t2");
    asm("lui t2,%%key2-0:20%%"); 
    asm("addi t1,t0,%%key2-20:32%%");
    asm("add t2,t2,t1");
    asm("aes_key k2,t2");
    asm("lui t2,%%key3-0:20%%");
    asm("addi t1,t0,%%key3-20:32%%");
    asm("add t2,t2,t1");
    asm("aes_key k3,t2");
    
    asm("aes_mem d4");
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
