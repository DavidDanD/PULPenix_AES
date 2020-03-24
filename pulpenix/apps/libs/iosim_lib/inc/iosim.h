

#define IOSIM_PORT_BASE 0x00

//=========================================================
// **** pseudo io (print,scan,file); over gpio ***********
//=========================================================

void write_to_port (unsigned int idx , unsigned int v); 
unsigned int read_from_port (unsigned int idx) ;
void sim_finish (); 
void sim_stop (); 
void bm_putc (char c); 
void bm_access_file(unsigned int file_idx); 
void bm_fputc (unsigned int file_idx , char c); 
void bm_fputd(unsigned int file_idx ,int v); 
void bm_puts(char * s); 
void bm_fputs(unsigned int file_idx , char * s); 
void bm_fputlld(unsigned int file_idx ,long long int v); 
void bm_puth(unsigned int v); 
void bm_fputh(unsigned int file_idx ,unsigned int v); 
int bm_getc (); 
unsigned int bm_fgetc (unsigned int file_idx); 
char bm_isspace(char c);
char bm_fgets (unsigned int file_idx , char * str_buf); 
char bm_fget_line (unsigned int file_idx , char * str_buf); 
unsigned int decimal_str_to_uint (char * s); 
unsigned int hex_str_to_uint (char * s); 
unsigned int  bm_fopen_r(char * file_name); 
unsigned int  bm_fopen_w(char * file_name); 
unsigned int  bm_time_stamp(char * time_stam_str); 
void *bm_malloc(int size);

