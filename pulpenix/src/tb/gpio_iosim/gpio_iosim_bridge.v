

// TMP NOTE - ATTEMPT not using gpio<7:0> as they are used in tb for other interface
  
module gpio_iosim_bridg(
                             input clk,
                             input rst_n,
                             
                             // GPIO signals interface
                             
                             output [31:0] gpio_in,
                             input  [31:0] gpio_out,
                                                        
                             // iosim Interface
                             
                             output [31:0]  addr,
                             output         write,
                             output         read,
                             output [31:0]  wdata,
							 input  [31:0]  rdata
                            );

//------------------------------------------------------------------------


/*
Pseudo Protocol

Only gpio[31:16] are used (to avoid conflict with other tb mechanism)

gpio_out[31] is used as an edge trigger to generate the write pulse
gpio_out[30] is used as an edge trigger to generate the read pulse
gpio_out[29:24] is used as the indirect address space (64 addresses supported)
gpio_in/out[23:16] is used as the character date

*/

wire wr_sig = gpio_out[31] ;
wire rd_sig = gpio_out[30] ;

reg wr_sig_s ;
reg rd_sig_s;

reg wr_pulse ;
reg rd_pulse ;



always @(posedge clk or rst_n) begin
 if (!rst_n) begin
        wr_sig_s <= 1'b0 ;
        rd_sig_s <= 1'b0 ; 
        wr_pulse <= 1'b0;
        rd_pulse <= 1'b0;        
    end else begin
        wr_sig_s <= wr_sig ;
        rd_sig_s <= rd_sig ; 
        wr_pulse <= wr_sig && !wr_sig_s ;
        rd_pulse <= rd_sig && !rd_sig_s ;        
    end
end
 
assign write = wr_pulse ; 
assign read = rd_pulse ;

assign addr = {24'h000000,gpio_out[29:24]} ;
assign wdata = {24'h000000,gpio_out[23:16]};
//assign gpio_in = {8'h00,rdata[7:0],16'h0000} ;
assign gpio_in = rdata[31:0] ;

endmodule 