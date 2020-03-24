

#include <gpio.h>        // simple SOC gpio interface
//#include <iosim.h>       // Simulated IO (basic terminal and file access)  over gpio interface
//this program tests if putting a sw right before the custom command interferes with the exection.
int main() {

    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("ori x5, x0, 1");//x5 = 1
    asm("slli x5, x5, 20");//x5 = 2^20. bit 20 needs to be 1 for it not to be in the axi address space.
    asm("addi x5, x5, 160");// x5 = 2^20 + 160 = 'h1000a0
    asm("ori x28, x0, 93");//x28 = 93
    asm("ori x6, x0, 14");//x6 = 14
    asm("ori x7, x0, 11");//x7 = 11
    asm("sw x28, 4(x5)");//mem[41] = memory[164:168] = 32'd93 (check if sw before cus cmd works)
    asm(".word 0x027342bb");//mem[40] = memory[160:164] =  result of  the xor command =14 + 11 -2  = 23 =  'h17
    asm("sw x28, 8(x5)");//mem[42] = memory[168:172] = 32'd93 (check if sw after cus cmd works)
    asm("ori x6, x0,784 ");//x6 =  0b1100010000, ffs(x6) = 4
    asm("addi x5, x5, 12");//x5 = 2^20 + 172 = 'h1000ac
    asm(".word 0b00000010011100110000001010111011");//memory[172:176] = ffs(x6)
    asm("lw x29, 0(x5)"); //x29 = mem[43] =  memory[172:176] = ffs(x6) = 4 (check if lw right after cus cmd works (forwarding mechanism))
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
