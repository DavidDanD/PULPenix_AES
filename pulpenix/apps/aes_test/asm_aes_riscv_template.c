
#include <stdio.h>
#include <gpio.h>        // simple SOC gpio interface

int main() {
    asm("andi t0,t0,0");
    
    asm("lui t2,%%data0-0:20%%"); //data = [d0, d1, d2, d3]
    asm("lui t1,%%data0-20:32%%");
    asm("srli t1,t1,12");
    asm("add t2,t2,t1");
    asm("nop");
    asm("aes_reg d0,t2");
    asm("nop");
    asm("lui t2,%%data1-0:20%%");
    asm("lui t1,%%data1-20:32%%");
    asm("srli t1,t1,12");
    asm("add t2,t2,t1");
    asm("nop");
    asm("aes_reg d1,t2");
    asm("nop");
    asm("lui t2,%%data2-0:20%%");
    asm("lui t1,%%data2-20:32%%");
    asm("srli t1,t1,12");
    asm("add t2,t2,t1");
    asm("nop");
    asm("aes_reg d2,t2");
    asm("nop");
    asm("lui t2,%%data3-0:20%%"); 
    asm("lui t1,%%data3-20:32%%");
    asm("srli t1,t1,12");
    asm("add t2,t2,t1");
    asm("nop");
    asm("aes_reg d3,t2");
    asm("nop");
    
    asm("lui t2,%%key0-0:20%%"); //key = [k0, k1, k2, k3]
    asm("lui t1,%%key0-20:32%%");
    asm("srli t1,t1,12");
    asm("add t2,t2,t1");
    asm("nop");
    asm("aes_key k0,t2");
    asm("nop");
    asm("lui t2,%%key1-0:20%%");  //key = [k0, k1, k2, k3]
    asm("lui t1,%%key1-20:32%%");
    asm("srli t1,t1,12");
    asm("add t2,t2,t1"); 
    asm("nop");
    asm("aes_key k1,t2");
    asm("nop");
    asm("lui t2,%%key2-0:20%%");  //key = [k0, k1, k2, k3]
    asm("lui t1,%%key2-20:32%%");
    asm("srli t1,t1,12");
    asm("add t2,t2,t1");
    asm("nop");
    asm("aes_key k2,t2");
    asm("nop");
    asm("lui t2,%%key3-0:20%%"); //key = [k0, k1, k2, k3]
    asm("lui t1,%%key3-20:32%%");
    asm("srli t1,t1,12");
    asm("add t2,t2,t1");
    asm("nop");
    asm("aes_key k3,t2");
    asm("nop");
    
    asm("addi t2,t0,160");
    asm("nop");
    asm("aes_mem t2");
    
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

    asm("lw t6, 0(t2)");
    asm("lw t5, 4(t2)");
    asm("lw t4, 8(t2)");
    asm("lw t3, 12(t2)");
    register int *dataOut0 asm("t3");
    register int *dataOut1 asm("t4");
    register int *dataOut2 asm("t5");
    register int *dataOut3 asm("t6");
    
    bm_printf ("\nCiphered text:");
    bm_printf ("%08X", dataOut0);
    bm_printf ("%08X", dataOut1);
    bm_printf ("%08X", dataOut2);
    bm_printf ("%08X\n", dataOut3);
  
    sim_finish () ;  // flag to trigger simulation termination
  
    return 0;
}
