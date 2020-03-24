`define PORTS_BASE  (8'h00)  
`define PORT0 (`PORTS_BASE + 0)         // 32 bit value to display by simulator
`define PORT1 (`PORTS_BASE + 4)         // 32 bit where least significant byte is a charecter to output to stdio
`define PORT2 (`PORTS_BASE + 8)         // command , if value is 0 simulation should be stopped
`define PORT3 (`PORTS_BASE + 12)        // getc input char
`define PORT4 (`PORTS_BASE + 16)        // file_int (returned verilog integer opened file reference)
`define PORT5 (`PORTS_BASE + 20)        // active file index written by SW
`define PORT6 (`PORTS_BASE + 24)        // cycle count

`define TTY_ID 32'h8000_0000            // Verilog defines  this represent standard input 
  
module iosim(
                             input                               clk,
                             input      [31:0]  addr,
                             input                               write,
                             input                               read,
                             input      [31:0]   wdata,
							 output reg [31:0]   rdata
                            );

//------------------------------------------------------------------------
     					 
  reg [31:0]  reg_raddr;    
  always @(posedge clk) reg_raddr <= addr; 
    
  integer file_ptr_idx_top ;
  integer file_ptrs[9:0] ; 
		
  integer   output_file  ; 
  integer   file_int ;
  integer   cycle_count ;
  reg str_capture_on ;
  reg[(80*8)-1:0] cmd_str ;
 
   reg write_actual ;
   reg reg_hread ;
   reg [7:0] getc_char ;
 
   always @(posedge clk) reg_hread <= read ;   
   always @(posedge clk) write_actual <= write ;
   
   always @(posedge clk) cycle_count = cycle_count + 1 ;
     
   always @(posedge clk) 
   begin   
    if (write_actual) 
    begin
	  if (reg_raddr==`PORT0) $display($time," P0=%d",wdata) ; // unsigned integer
	  if (reg_raddr==`PORT5) 
	  begin
	   file_int = wdata ;

      end	  
	  if (reg_raddr==`PORT1) 
	  begin
	    if (!str_capture_on) 
		begin 
		 if (file_int==0) 
		  $write("%c",wdata[7:0]) ;
		 else 
		  $fwrite(file_ptrs[file_int],"%c",wdata) ; 
		end  
	    else 
		begin
		 cmd_str = cmd_str << 8 ;
	     cmd_str[7:0] = wdata[7:0] ;
	    end
	  end
	  if (reg_raddr==`PORT2) // command
	  begin
	     case (wdata) 
	     0 : 
	     begin
	       $display ($time," Simulation finish triggered by SW") ;
		   $finish;
	     end
	     1 :  // fopen read file
	     begin
		  str_capture_on = 0 ;
		  $display("");
		  $write($time," Opening Read file %-20s\n",cmd_str) ;
		  $display("");
	      file_int = file_ptr_idx_top;			  
		  file_ptr_idx_top = file_ptr_idx_top+1;
          if (cmd_str!="TTY") file_ptrs[file_int] = $fopen(cmd_str,"r");
          else begin
            file_ptrs[file_int] =  `TTY_ID ;
            $write("TTY PSEUDO FILE OPENED\n") ;
          end            
		  $write("File reference integer value file_int=%h\n",file_int);
	     end	
	     2 :  // fopen write file
	     begin
		  str_capture_on = 0 ;
		  $display("");
		  $write($time," Opening Write file %s\n",cmd_str) ;
		  $display("");
		  file_int = file_ptr_idx_top;		  
		  file_ptr_idx_top = file_ptr_idx_top+1;
	      file_ptrs[file_int] = $fopen(cmd_str,"w");
		  $write("File reference integer value file_int=%h\n",file_int);
	     end			
	     4 : begin
		      //$display ("Start capturing command argument string") ;	 // debug print
		      str_capture_on = 1 ;
		     end
	     5 :  begin                     // TIMESTAMP
		       str_capture_on = 0 ;
			   $write("%t %s\n",$time,cmd_str) ;
	          end						 
	     default:
	     begin 
	      $display ($time," GPIO IOSIM : finish due to undefined command by SW") ;
		  $finish ;		 
		 end 
       endcase	
	   cmd_str = 0 ;
	 end	 
    end   

  // read port
  
   if (read & ((addr)==(`PORT3))) 
   begin
     //$display("TMP_DBG file_int = %x ", file_int);
     getc_char =  $fgetc(file_ptrs[file_int]) ;
     rdata[7:0]  <= getc_char ;
   end
   
   if (read & ((addr)==(`PORT4))) rdata <= file_int ;
   if (read & ((addr)==(`PORT6))) rdata <= cycle_count ;
      
 end
  
initial
begin
 file_ptr_idx_top = 1 ; // 0 not in use, goes to stdio
 str_capture_on = 0 ;
 cmd_str = 0 ;
 file_int = 0 ;
 cycle_count = 0 ;

end
	
endmodule 