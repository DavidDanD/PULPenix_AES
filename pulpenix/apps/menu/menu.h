

/* Function prototypes */
void parse ( char * buf );
void printm ( unsigned int address );
int  get_hex ( char * buf, int start_position, unsigned int *address, int *length );
int  get_address_data ( char * buf, unsigned int *address, unsigned int *data );
void load_run( int type, unsigned int address );
void print_spaces ( int num );
void print_help ( void );
