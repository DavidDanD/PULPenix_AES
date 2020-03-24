#include <stdio.h>
#include <stdlib.h>
#include <gpio.h>
#include <iosim.h>
 
//---------------------------------------------------------

#define MAX_NUM_ITEMS 15
#define MAX_STR_CHARS 15

//----------------------------------------------------------


int bsort_strcmp (char *s1, char *s2)
{
  unsigned char c1, c2;
  do
    {
      c1 = (unsigned char) *s1++;
      c2 = (unsigned char) *s2++;
      if (c1 == 0)
        return c1 - c2;
    }
  while (c1 == c2);
  return c1 - c2;
}

//-------------------------------------------------------------


void bsort_strcpy(char *d, const char *s)
{
   char *saved = d;
   while (*s)
   {
       *d++ = *s++;
   }
   *d = 0;
}

//-----------------------------------------------------------

void bsort_strings (int num_items,unsigned int sort_inF ,unsigned int sort_outF) {

   char strbuf[MAX_STR_CHARS] ; // for sort swap	 
   char array[MAX_NUM_ITEMS][MAX_STR_CHARS] ;
   
   bm_fputs(sort_outF,"\n\nInput strings to sort:\n\n") ;  
   
   for (int i=0;i<num_items;i++) {
	   	   
       bm_fgets (sort_inF , array[i]) ; 


	   bm_fputs(sort_outF," ") ; bm_puts(array[i]) ;     
   }
   bm_fputs(sort_outF,"\n") ;    

 // Now Sort

  unsigned int time_start_sort = bm_time_stamp("START SORT") ;

  int n = num_items ;

  for (int c = 0 ; c < n-1 ; c++)
    for (int d = 0 ; d < n-c-1 ; d++) { 		
      if (bsort_strcmp(array[d],array[d+1])>0) {
		// swapping
        bsort_strcpy(strbuf,array[d]);
        bsort_strcpy(array[d],array[d+1]);
        bsort_strcpy(array[d+1],strbuf) ;
      }
  }

  unsigned int time_end_sort = bm_time_stamp("END SORT") ;
	
  bm_fputs(sort_outF,"\n\nSorted:\n\n");
 
  for (int c = 0 ; c < n ; c++) {
	 bm_fputs(sort_outF," ") ; bm_fputs(sort_outF,array[c]) ; 
  }
  bm_fputc(sort_outF,'\n') ;	 
 } 
 
//----------------------------------------------

int main(void) { 

 bm_puts("\nHELLO GenPro - SORT DEMO \n") ; 

 unsigned int sort_inF = bm_fopen_r("sort_in.txt") ;
 unsigned int sort_outF = bm_fopen_w("sort_out.txt") ;

 unsigned int time_start_sort_list_load = bm_time_stamp("START SORT (LIST LOAD)") ;
 
 bm_fputs(sort_outF,"\n\n Now bubble-sorting strings from input file:\n\n"); 
 bsort_strings(12,sort_inF,sort_outF) ;
 
 bm_fputs(0,"\nSW TASK DONE - FINSHING SIMULATION, OK OK OK, BYE\n\n") ;
 sim_finish() ; // finish
 
 return 0; 

}
