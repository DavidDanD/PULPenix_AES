
#include <iosim.h>
#include <gpio.h>
#include <bm_printf.h>

//=========================================================
// **** pseudo io (print,scan,file) over gpio ***********
//=========================================================

// CHECK! Looks like this write/read only one char

void write_to_port (unsigned int idx , unsigned int v) {	   
*((volatile unsigned int *) GPIO_REG_PADOUT) = 0 ;
*((volatile unsigned int *) GPIO_REG_PADOUT) =  (1<<31) + ((IOSIM_PORT_BASE+4*idx)<<24) + (v<<16) ;	
}	
	 
//--------------------------------------------------------


 unsigned int read_from_port (unsigned int idx) {	   
   *((volatile unsigned int *) GPIO_REG_PADOUT) = 0 ;
   *((volatile unsigned int *) GPIO_REG_PADOUT) =  (1<<30) + ((IOSIM_PORT_BASE+4*idx)<<24) ;
   unsigned int GPIO_REG_PADIN_val = *(volatile unsigned int *) GPIO_REG_PADIN ;
   //return ((0x00FF0000 & GPIO_REG_PADIN_val)>>16) ; 
   return GPIO_REG_PADIN_val ; 
}		
	
//---------------------------------------------------------

void sim_finish () { 
     write_to_port(2,0) ;
}
//---------------------------------------------------------

void sim_stop () { 
     write_to_port(2,6) ;
}
//---------------------------------------------------------	

void bm_putc (char c) {
	
	write_to_port(1,((unsigned int)c)) ; 
}
//---------------------------------------------------------

void bm_access_file(unsigned int file_idx) {
  write_to_port(5,file_idx) ; // file_idx or 0 for stdio
}
//-----------------------------------------------------------
void bm_fputc (unsigned int file_idx , char c) {
	bm_access_file(file_idx) ;
	write_to_port(1,c) ; 
}
//---------------------------------------------------------

void bm_putd(int v) {  
  if (v==0) bm_putc((int)('0')) ;
  else {
	  
      char s[20] ;
      int si = 0 ;	
      char neg = (v<0) ;
      if (neg) v = -v ;	  
	  
	  while(v!=0) {
		int v_div10 =v/10 ;
     	int v_mod10 =v-(10*v_div10) ;   		
	    s[si++] =(char)('0')+(v_mod10) ; 
	    v = v_div10 ;
      }
	  if (neg) s[si++] =(char)('-');
	  while (si!=0) bm_putc(s[(si--)-1]) ;	 // reverse print 
  }   
}	
//---------------------------------------------------------
void bm_fputd(unsigned int file_idx ,int v) { 
 bm_access_file(file_idx) ;
 bm_putd(v) ;
}	

//---------------------------------------------------------

void bm_puts(char * s) { 
  while(*s) bm_putc(*s++) ; 
}	
//---------------------------------------------------------

void bm_fputs(unsigned int file_idx , char * s) { 
  bm_access_file(file_idx) ;
  bm_puts(s) ;
}

//---------------------------------------------------------------------

void bm_putllh(long long int v) {  
  if (v==0) bm_putc((int)('0')) ;
  else {
	  
      char s[20] ;
      int si = 0 ;	
 	  
	  while(v!=0) {
		int long long v_div16  = v>>4 ; // v/16
		char v_rem16 = (char) (v & 0xf) ; // v%16

	    if (v_rem16<10) s[si++] = (char)('0')+v_rem16 ; 
	    else s[si++] =(char)('A')+(v_rem16-10) ; 
	    v = v_div16 ;
      }
	  while (si!=0) bm_putc(s[(si--)-1]) ;	 // reverse print 
  }   
}	



void bm_puth(unsigned int v) { 
			
      
  if (v==0) bm_putc((unsigned int)('0')) ;
  else { 
  
      int si = 0 ;	
      char s[20] ;   
      
      while(v!=0) {

		unsigned int hc = (char) (v & 0xf) ; // v%16
	    if (hc<10) s[si++] = (char)('0')+hc ; 
	    else s[si++] =(char)('A')+(hc-10) ; 
	    v = v>>4 ; // v/16		
      }
       while (si!=0) bm_putc(s[(si--)-1]) ; // ORIG	 	  
  }
}	
//---------------------------------------------------------
void bm_fputh(unsigned int file_idx ,unsigned int v) { 
 bm_access_file(file_idx) ;
 bm_puth(v) ;
}	
//---------------------------------------------------------


int bm_getc () {	
	return  read_from_port(3) ; 
}
//--------------------------------------------------------
unsigned int bm_fgetc (unsigned int file_idx) {
	bm_access_file(file_idx) ; 
	return  read_from_port(3) ; 
}
//--------------------------------------------------------

char bm_isspace(char c)
{
        return (((c>=0x09) && (c<=0x0D)) || (c==0x20));
}

//------------------------------------------------------------


char bm_fgets (unsigned int file_idx , char * str_buf) {
	char str_on = 0 ;
	
		
	unsigned int c ; // unsigned int possibly needed to indicate verilog EOF = -1
	int si = 0 ;
	str_buf[0] = 0 ; // prevent uninitialized debug prints

	bm_access_file(file_idx) ;
		
    while ((char)(c=bm_getc())!=((char)0xFF)) {   
	  if (bm_isspace((char) c))	{  // white char
		  if (str_on) {  
			 str_buf[si] = 0 ;
             return (1) ;
          }
	  }	  
      else { 
       // Non 'white' char.
		  str_on = 1 ;
		  str_buf[si++] = c ;	
 
      }
   }	 
	 // EOF
	str_buf[si] = 0 ; 

    return (0) ;	   
	 
   
}

//--------------------------------------------------------

char bm_fget_line (unsigned int file_idx , char * str_buf) {
	char str_on = 0 ;
	
		
	unsigned int c ; // unsigned int possibly needed to indicate verilog EOF = -1
	int si = 0 ;
	str_buf[0] = 0 ; // prevent uninitialized debug prints

	bm_access_file(file_idx) ;
		
    while ((char)(c=bm_getc())!=((char)0xFF)) {   
      //bm_printf("TMP_DBG uint(c)=%x\n",((unsigned int)(c))) ;
	  bm_access_file(file_idx) ;  // TMP_DBG_NEEDED    
	  if ((c=='\n')||(c=='\r'))	{  // physical enter key LF  or CR 
		  if (str_on) {  
			 str_buf[si] = 0 ;
             return (1) ;
          }
	  }	  
      else { 
       // Non 'white' char.
		  str_on = 1 ;
		  str_buf[si++] = c ;	
 
      }
   }	 
	 // EOF
	str_buf[si] = 0 ; 

    return (0) ;	   
	 
   
}

//--------------------------------------------------------



unsigned int decimal_str_to_uint (char * s) {
    
    int i=0 ;
    char c = 0 ;
    unsigned int v = 0;
    
    while ((c=s[i++])!=0) v = v*10 + (unsigned int) c - '0' ;	 
    return v ;
    
}    
  
 
//--------------------------------------------------------


unsigned int hex_str_to_uint (char * s) {
    
    int i=0 ;
    char c = 0 ;
    unsigned int v = 0;
    
    while ((c=s[i++])!=0) {
		char cval = ((c>='0') && (c<='9')) ? c - '0' : (
		            ((c>='A') && (c<='F')) ? 10 + c - 'A' : (
             		((c>='a') && (c<='f')) ? 10 + c - 'a' : 'X')) ;

        if (cval=='X') {
		   bm_fputs(0,"\nERROR reading into hex a non hex char.\n") ;
           sim_finish() ; 
		   return 0 ;
		}				
					
					
		v = (v<<4) + (unsigned int) cval ;	 
	}
    return v ;
}    
//--------------------------------------------------------

unsigned int  bm_fopen_r(char * file_name) {
  write_to_port(2,4) ; // start string capture
  bm_puts(file_name) ; // deliver file name string
  write_to_port(2,1) ; // fopen read command
  return read_from_port(4) ; 
}

//--------------------------------------------------------

unsigned int  bm_fopen_w(char * file_name) {
  write_to_port(2,4) ; // start string capture
  bm_puts(file_name) ; // deliver file name string
  write_to_port(2,2) ; // fopen write command
  return read_from_port(4) ; 
}

//--------------------------------------------------------

unsigned int  bm_time_stamp(char * time_stam_str) {
  write_to_port(2,4) ; // start string capture
  bm_puts(time_stam_str) ; // deliver time stamp string
  write_to_port(2,5) ; 
  return read_from_port(6) ; 
}


//========================================================


void *bm_malloc(int size)

{
static char bm_malloc_pool [4096] ; // currently limited to 4K bytes.
static char *bm_malloc_ptr = bm_malloc_pool;	
	
  void *ret;
  ret = (void*)bm_malloc_ptr;
  bm_malloc_ptr += size;
  if (bm_malloc_ptr > (bm_malloc_pool + sizeof(bm_malloc_pool))) { 
    // TBD TRAP IMPLEMENT
    bm_fputs(0,"\nSW ERROR: bm_malloc out of memory\n\n") ; 
    sim_finish() ; // finish	
	return 0;		/* If trap returns... */ 
  }
  return ret;
}

