

#include <gpio.h>        // simple SOC gpio interface
#include <iosim.h>       // Simulated IO (basic terminal and file access)  over gpio interface
#include <bm_printf.h>   // bare-metal printf

int main() {

  bm_printf("\n\n\n **** HELLO WORLD **** \n\n\n") ;   // bare-metal output to terminal
  
  sim_finish () ;  // flag to trigger simulation termination
  
  return 0;
}
