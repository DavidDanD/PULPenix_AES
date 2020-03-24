

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
    asm("addi t1,t1,1");
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
    asm("nop");
    asm("nop");
    asm("nop");	
    asm("andi t0,t0,0");
    asm("andi t1,t1,0");
    asm("andi t2,t2,0");
    asm("andi t3,t3,0");
    asm("andi t4,t4,0");
    asm("andi t5,t5,0");
    asm("addi t1,t1,3");
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
    asm("nop");
    asm("nop");
    asm("nop");	
    asm("andi t0,t0,0");
    asm("andi t1,t1,0");
    asm("andi t2,t2,0");
    asm("andi t3,t3,0");
    asm("andi t4,t4,0");
    asm("andi t5,t5,0");
    asm("addi t1,t1,7");
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
    asm("nop");
    asm("nop");
    asm("nop");	
    asm("andi t0,t0,0");
    asm("andi t1,t1,0");
    asm("andi t2,t2,0");
    asm("andi t3,t3,0");
    asm("andi t4,t4,0");
    asm("andi t5,t5,0");
    asm("addi t1,t1,15");
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
    asm("nop");
    asm("nop");
    asm("nop");	
    asm("andi t0,t0,0");
    asm("andi t1,t1,0");
    asm("andi t2,t2,0");
    asm("andi t3,t3,0");
    asm("andi t4,t4,0");
    asm("andi t5,t5,0");
    asm("addi t1,t1,31");
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
    asm("nop");
    asm("nop");
    asm("nop");	
    asm("andi t0,t0,0");
    asm("andi t1,t1,0");
    asm("andi t2,t2,0");
    asm("andi t3,t3,0");
    asm("andi t4,t4,0");
    asm("andi t5,t5,0");
    asm("addi t1,t1,63");
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
    asm("nop");
    asm("nop");
    asm("nop");	
    asm("andi t0,t0,0");
    asm("andi t1,t1,0");
    asm("andi t2,t2,0");
    asm("andi t3,t3,0");
    asm("andi t4,t4,0");
    asm("andi t5,t5,0");
    asm("addi t1,t1,127");
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
    asm("nop");
    asm("nop");
    asm("nop");	
    asm("andi t0,t0,0");
    asm("andi t1,t1,0");
    asm("andi t2,t2,0");
    asm("andi t3,t3,0");
    asm("andi t4,t4,0");
    asm("andi t5,t5,0");
    asm("addi t1,t1,255");
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
    asm("nop");
    asm("nop");
    asm("nop");	
    asm("andi t0,t0,0");
    asm("andi t1,t1,0");
    asm("andi t2,t2,0");
    asm("andi t3,t3,0");
    asm("andi t4,t4,0");
    asm("andi t5,t5,0");
    asm("addi t1,t1,511");
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
    asm("nop");
    asm("nop");
    asm("nop");	
    asm("andi t0,t0,0");
    asm("andi t1,t1,0");
    asm("andi t2,t2,0");
    asm("andi t3,t3,0");
    asm("andi t4,t4,0");
    asm("andi t5,t5,0");
    asm("addi t1,t1,1023");
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
    asm("nop");
    asm("nop");
    asm("nop");	
    asm("andi t0,t0,0");
    asm("andi t1,t1,0");
    asm("andi t2,t2,0");
    asm("andi t3,t3,0");
    asm("andi t4,t4,0");
    asm("andi t5,t5,0");
    asm("addi t1,t1,2047");
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
    asm("nop");
    asm("nop");
    asm("nop");	
    asm("andi t0,t0,0");
    asm("andi t1,t1,0");
    asm("andi t2,t2,0");
    asm("andi t3,t3,0");
    asm("andi t4,t4,0");
    asm("andi t5,t5,0");
    asm("addi t1,t1,1");
    asm("sll t1,t1,16");
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
    asm("nop");
    asm("nop");
    asm("nop");	
    asm("andi t0,t0,0");
    asm("andi t1,t1,0");
    asm("andi t2,t2,0");
    asm("andi t3,t3,0");
    asm("andi t4,t4,0");
    asm("andi t5,t5,0");
    asm("addi t1,t1,3");
asm("sll t1,t1,16");
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
    asm("nop");
    asm("nop");
    asm("nop");	
    asm("andi t0,t0,0");
    asm("andi t1,t1,0");
    asm("andi t2,t2,0");
    asm("andi t3,t3,0");
    asm("andi t4,t4,0");
    asm("andi t5,t5,0");
    asm("addi t1,t1,7");
asm("sll t1,t1,16");
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
    asm("nop");
    asm("nop");
    asm("nop");	
    asm("andi t0,t0,0");
    asm("andi t1,t1,0");
    asm("andi t2,t2,0");
    asm("andi t3,t3,0");
    asm("andi t4,t4,0");
    asm("andi t5,t5,0");
    asm("addi t1,t1,15");
asm("sll t1,t1,16");
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
    asm("nop");
    asm("nop");
    asm("nop");	
    asm("andi t0,t0,0");
    asm("andi t1,t1,0");
    asm("andi t2,t2,0");
    asm("andi t3,t3,0");
    asm("andi t4,t4,0");
    asm("andi t5,t5,0");
    asm("addi t1,t1,31");
asm("sll t1,t1,16");
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
    asm("nop");
    asm("nop");
    asm("nop");	
    asm("andi t0,t0,0");
    asm("andi t1,t1,0");
    asm("andi t2,t2,0");
    asm("andi t3,t3,0");
    asm("andi t4,t4,0");
    asm("andi t5,t5,0");
    asm("addi t1,t1,63");
asm("sll t1,t1,16");
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
    asm("nop");
    asm("nop");
    asm("nop");	
    asm("andi t0,t0,0");
    asm("andi t1,t1,0");
    asm("andi t2,t2,0");
    asm("andi t3,t3,0");
    asm("andi t4,t4,0");
    asm("andi t5,t5,0");
    asm("addi t1,t1,127");
asm("sll t1,t1,16");
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
    asm("nop");
    asm("nop");
    asm("nop");	
    asm("andi t0,t0,0");
    asm("andi t1,t1,0");
    asm("andi t2,t2,0");
    asm("andi t3,t3,0");
    asm("andi t4,t4,0");
    asm("andi t5,t5,0");
    asm("addi t1,t1,255");
asm("sll t1,t1,16");
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
    asm("nop");
    asm("nop");
    asm("nop");	
    asm("andi t0,t0,0");
    asm("andi t1,t1,0");
    asm("andi t2,t2,0");
    asm("andi t3,t3,0");
    asm("andi t4,t4,0");
    asm("andi t5,t5,0");
    asm("addi t1,t1,511");
asm("sll t1,t1,16");
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
    asm("nop");
    asm("nop");
    asm("nop");	
    asm("andi t0,t0,0");
    asm("andi t1,t1,0");
    asm("andi t2,t2,0");
    asm("andi t3,t3,0");
    asm("andi t4,t4,0");
    asm("andi t5,t5,0");
    asm("addi t1,t1,1023");
asm("sll t1,t1,16");
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
    asm("nop");
    asm("nop");
    asm("nop");	
    asm("andi t0,t0,0");
    asm("andi t1,t1,0");
    asm("andi t2,t2,0");
    asm("andi t3,t3,0");
    asm("andi t4,t4,0");
    asm("andi t5,t5,0");
    asm("addi t1,t1,2047");
    asm("sll t1,t1,16");
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

    asm("nop");  //17
    asm("nop");
    asm("nop");
    asm("nop");	
    asm("andi t0,t0,0");
    asm("andi t3,t3,0");
    asm("andi t4,t4,0");
    asm("andi t5,t5,0"); 
    asm("sll t1,t1,1");
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

     asm("nop");  //18
    asm("nop");
    asm("nop");
    asm("nop");	
    asm("andi t0,t0,0");
    asm("andi t3,t3,0");
    asm("andi t4,t4,0");
    asm("andi t5,t5,0");
    asm("sll t1,t1,1");
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
    asm("nop");
    asm("nop");  //19
    asm("nop");	
    asm("andi t0,t0,0");
    asm("andi t3,t3,0");
    asm("andi t4,t4,0");
    asm("andi t5,t5,0");
    asm("sll t1,t1,1");
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

 asm("nop");  //20
    asm("nop");
    asm("nop");
    asm("nop");	
    asm("andi t0,t0,0");
    asm("andi t3,t3,0");
    asm("andi t4,t4,0");
    asm("andi t5,t5,0");
    asm("sll t1,t1,1");
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

    asm("nop");  //21
    asm("nop");
    asm("nop");
    asm("nop");	
    asm("andi t0,t0,0");
    asm("andi t3,t3,0");
    asm("andi t4,t4,0");
    asm("andi t5,t5,0"); 
    asm("sll t1,t1,1");
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

     asm("nop");  //22
    asm("nop");
    asm("nop");
    asm("nop");	
    asm("andi t0,t0,0");
    asm("andi t3,t3,0");
    asm("andi t4,t4,0");
    asm("andi t5,t5,0");
    asm("sll t1,t1,1");
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
    asm("nop");
    asm("nop");  //23
    asm("nop");	
    asm("andi t0,t0,0");
    asm("andi t3,t3,0");
    asm("andi t4,t4,0");
    asm("andi t5,t5,0");
    asm("sll t1,t1,1");
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

 asm("nop");  //24
    asm("nop");
    asm("nop");
    asm("nop");	
    asm("andi t0,t0,0");
    asm("andi t3,t3,0");
    asm("andi t4,t4,0");
    asm("andi t5,t5,0");
    asm("sll t1,t1,1");
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

 asm("nop");  //25
    asm("nop");
    asm("nop");
    asm("nop");	
    asm("andi t0,t0,0");
    asm("andi t3,t3,0");
    asm("andi t4,t4,0");
    asm("andi t5,t5,0");
    asm("sll t1,t1,1");
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

 asm("nop");  //26
    asm("nop");
    asm("nop");
    asm("nop");	
    asm("andi t0,t0,0");
    asm("andi t3,t3,0");
    asm("andi t4,t4,0");
    asm("andi t5,t5,0");
    asm("sll t1,t1,1");
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





  sim_finish () ;  // flag to trigger simulation termination
  
  return 0;
}
