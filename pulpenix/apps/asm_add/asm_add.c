


#include <gpio.h>        // simple SOC gpio interface
#include <bm_printf.h>   // bare-metal printf

int main() {

    bm_printf("\n\n\n **** ADD FINISH **** \n\n\n");
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
    bm_printf("\n\n\n **** ADD FINISH **** \n\n\n");

  sim_finish () ;  // flag to trigger simulation termination
  
  return 0;
}
