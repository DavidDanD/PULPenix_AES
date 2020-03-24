#include <stdio.h>
#include <stdlib.h>
#include <gpio.h>
#include <iosim.h>
#include <bm_printf.h>
#include <menu.h>



int main ( void ) {

  char cmd_str[80] ; 
  
    bm_printf("\n\n\n **** HELLO PULPELLIUM **** \n\n\n") ; 
    unsigned int TTY  = bm_fopen_r("TTY") ;  // Opening stdio pseudo file
    
    /* Print the instructions */
    print_help();

    bm_printf("Ready\n> ");
        
    /* Loop forever on user input */
    while (1) {  
       bm_fget_line (TTY , cmd_str) ; 
       /* Process line */
       bm_printf("\n");      
       parse(cmd_str); 
       bm_printf("> "); 
    }                       
   sim_finish () ;  // flag to trigger simulation termination  
   return 0;  
}



void parse ( char * cmd_str ) 
{
    unsigned int found, address, data, i, bytes, rdata;
    int length ;
    int file_size;
    char byte;
    unsigned int lcount;                            
    char bad_command_msg[] = "Invalid command";
    
    /* Ignore returns with no trext on the line */
    if (!cmd_str[1]) return;
        
    /* Check if its a single character instruction */
    if (cmd_str[1] == 0) {
        switch (cmd_str[0]) {
        
            case 'h': /* Help */
                print_help();
                break;
                
            case 'l': /* Load */  
                load_run(1,0);
                break;

            case 's': /* Status */    
                 bm_printf  ("Not yet Supported\n");
                break;
                
            default:    
                bm_printf  ("%s\n", bad_command_msg);
                break;
            }
        return;    
        }


    /* Check for invalid instruction format for multi-word instructions */
    else if (cmd_str[1] != 0x20) {
        bm_printf ("%s\n", bad_command_msg);
        return;
        }


    switch (cmd_str[0]) {
    
            case 'd': /* Dump block of memory */
                /* Dump memory contents <start address> <number of bytes in hex> */    
                if (get_address_data ( cmd_str, &address, &bytes )) {
                    for (i=address;i<address+bytes;i+=4) {
                        printm (i);
                        }
                    }
                break;

            case 'j': /* Jump to <address> */  
                if (get_hex ( cmd_str, 2, &address, &length )) { 
                    load_run(0, address);
                    }
                break;


            case 'p': /* Print String */
                /* Recover the address from the cmd_string - the address is written in hex */ 
                bm_printf("Not yet Supported")   ;             
              break;

            case 'r': /* Read address */
                /* Recover the address from the cmd_string - the address is written in hex */      
                if (get_hex ( cmd_str, 2, &address, &length )) { 
                    printm (address);
                    }
                break;

            case 'b': /* Load binary file into address */
                /* Recover the address from the cmd_string - the address is written in hex */      
                if (get_hex ( cmd_str, 2, &address, &length )) { 
                    load_run (5, address);
                    }
                break;

            case 'w': /* Write address */
                /* Get the address */
                if (get_address_data ( cmd_str, &address, &data )) {
                    /* Write to memory */
                    *(volatile unsigned int*) address = data;
                    }
                break;
            
            case 'e': /* Erase Flash <address> */  
                bm_printf("Erase Flash not applicable foe Simulation\n") ;
                break;

            case 's': /* Print sample memory <ammount> */ 
                 bm_printf("Print sample memory not applicable foe Simulation\n") ;
                break;

            default:    
                bm_printf  ("%s\n", bad_command_msg);
                break;
        }        
}

/* Load a binary file into memory
   If its an elf file, copy it into the correct memory areas
   and execute it.
*/   

void load_run( int type, unsigned int address )
{
   
    switch (type) {
 
        default:    /* Run the program */    
            bm_printf("Not Yet Supported");
            break;
        }
}


/* Print a memory location */
void printm (volatile unsigned int address ) 
{
    unsigned data ;
    data = * (volatile unsigned int *)address ;
    bm_printf ("mem 0x%08x = 0x%08x\n", address, data);
}



void print_help ( void ) 

{

    bm_printf("Commands\n");
    bm_printf("l");                     
    print_spaces(29);
    bm_printf(": Load elf file\n");

    bm_printf("b <address>");                   
    print_spaces(19);
    bm_printf(": Load binary file to <address>\n");

    bm_printf("d <start address> <num bytes> : Dump mem\n");

    bm_printf("h");                     
    print_spaces(29);
    bm_printf(": Print help message\n");

    bm_printf("j <address>");                     
    print_spaces(19);
    bm_printf(": Execute loaded elf, jumping to <address>\n");

    bm_printf("p <address>");                   
    print_spaces(19);
    bm_printf(": Print ascii mem until first 0\n");
    
    bm_printf("r <address>");                   
    print_spaces(19);
    bm_printf(": Read mem\n");

    bm_printf("s");                              
    print_spaces(29);
    bm_printf(": Core status\n");
    
    bm_printf("w <address> <value>");            
    print_spaces(11);
    bm_printf(": Write mem\n");    

    bm_printf("e <address>");            
    print_spaces(19);
    bm_printf(": Erase flash sector\n");    

    bm_printf("s <num samples>");            
    print_spaces(15);
    bm_printf(": Read samples from ADC\n");    

    bm_printf("\n");    
}


/* Print a number of spaces */
void print_spaces ( int num ) 
{
    while(num--) bm_printf(" ");
}


/* Return a number recovered from a cmd_string of hex digits */

int get_hex ( char * cmd_str, int start_position, 
              unsigned int *address, 
              int *length) 
{
                       
    int cpos = 0, done = 0;

    cpos = start_position; done = 0; *address = 0;

    while (done == 0) {    
        if ( cmd_str[cpos] >= '0' && cmd_str[cpos] <= '9' ) {
           *address = *address<<4;
           *address = *address + cmd_str[cpos] - '0';
           }
        else if ( cmd_str[cpos] >= 'A' && cmd_str[cpos] <= 'F' ) {
            *address = *address<<4;
            *address = *address + cmd_str[cpos] - 'A' + 10;
           }
        else if ( cmd_str[cpos] >= 'a' && cmd_str[cpos] <= 'f' ) {
            *address = *address<<4;
            *address = *address + cmd_str[cpos] - 'a' + 10;
           }
        else  {
            done = 1;
            *length = cpos - start_position;
            }
        if ( cpos >= 8+start_position ) {
            done = 1;
            *length = 8;
            }
        cpos++;
        }
            
    /* Return the length of the hexadecimal cmd_string */
    if (cpos > start_position+1) return 1; else return 0;
}


/* Parse a cmd_string for an address and data in hex */
int get_address_data ( char * cmd_str, unsigned int *address, unsigned int *data ) 
{
    int found, length;

    found = get_hex ( cmd_str, 2, address, &length );
    if (found) {
        /* Get the data */
        found = get_hex ( cmd_str, 3+length, data, &length );
        }
    
    return found;    
}




