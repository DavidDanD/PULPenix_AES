
// Test and template for GPP

module tb_gpp
#(
    parameter APB_ADDR_WIDTH = 12  //APB slaves are 4KB by default
)
(
    input  logic                      HCLK,
    input  logic                      HRESETn,
    input  logic [APB_ADDR_WIDTH-1:0] PADDR,
    input  logic               [31:0] PWDATA,
    input  logic                      PWRITE,
    input  logic                      PSEL,
    input  logic                      PENABLE,
    output logic               [31:0] PRDATA,
    output logic                      PREADY,
    output logic                      PSLVERR

);

 reg [31:0] gpp_regs [31:0];
 reg [31:0] data_out ;
 reg ready ;

 wire [5:0] reg_idx = PADDR[6:2];
 
 wire apb_setup_wr = PSEL &&  PWRITE  ;    
 wire apb_setup_rd = PSEL && !PWRITE  ;    
 
 wire apb_access = PSEL && PENABLE ;
 

// WRITE 
 always @(posedge HCLK, negedge HRESETn)
     if(~HRESETn) 
       for (int i=0;i<32;i++) gpp_regs[i] <= 0 ;
     else 
       if (apb_setup_wr && !ready)         // write only once 
         gpp_regs[reg_idx] <= PWDATA  ;

 // SYNCHRONOUS READ
 always @(posedge HCLK, negedge HRESETn) 
   if (apb_setup_rd && !ready) data_out <= gpp_regs[reg_idx] ;    // read only once
 
 assign PRDATA = data_out ;
   
 
 // READY HANDLING
  always @(posedge HCLK, negedge HRESETn) 
     if(~HRESETn) 
       ready <= 0 ;
     else 
       ready <= PSEL ;
       
  assign PREADY = ready && PENABLE ;

  // ERROR HANDLING
  assign PSLVERR = 1'b0; // not supporting transfer failure
    
 //=====================================================
 
 // TB Messages
 
 reg [11:0] addr_s ;
 reg [31:0] wr_data_s ;
 reg write_s ;

 
 always @(posedge HCLK) begin
 
       addr_s <= PADDR ;
       wr_data_s <= PWDATA ;
       write_s <= PWRITE;
     
       if (PREADY) begin
        if (write_s)
          $display($time," GPP TB: Writing %x to addr[11:0]=%x (gpp_regs[%d])",wr_data_s,addr_s,addr_s[6:2]) ;
        else
           $display($time," GPP TB: Reading %x from addr[11:0]=%x (gpp_regs[%d])",PRDATA,addr_s,addr_s[6:2]) ;
       end 
 end

 

endmodule

