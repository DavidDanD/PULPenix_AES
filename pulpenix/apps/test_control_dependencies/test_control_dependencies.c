

#include <gpio.h>        // simple SOC gpio interface
//#include <iosim.h>       // Simulated IO (basic terminal and file access)  over gpio interface
int main() {

    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    /* check control dependencies between CC (custom command) and other commands:
       check if custom command flushes after a branch that is taken*/
    asm("ori x7, x0, 13");//x7 = 13
    asm("ori x6, x0, 16");//x6 = 16
    asm("andi x5, x5, 0");//x5 = 0
    asm("bne  x6,  x7, BRANCH");//should execute
    //should not execute!
    asm(".word 0x007322bb");//x5 =  result of  the add command = 16 + 13 - 2  = 27 =  'h1B.
    asm("BRANCH: addi x28, x0, 1");
    asm("addi x28, x0, 2");
    asm("addi x28, x0, 3");
    asm("addi x28, x0, 4");
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
