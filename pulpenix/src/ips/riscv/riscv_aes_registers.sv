// Copyright 2020 Technion.

////////////////////////////////////////////////////////////////////////////////
// Engineers:      Dolev Vaknin - Dolev-Vaknin@campus.technion.ac.il          //
//		   David Dan	- David.Dan@campus.technion.ac.il	      //
//                                                                            //
// Design Name:    RISC-V AES register file                                   //
// Project Name:   RISC-V AES                                                 //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    Register file with 4x 32 bit wide registers.		      //
//		   This register file is based on flip-flops.  		      //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

module riscv_aes_register_file
#(
    parameter ADDR_WIDTH    = 2,
    parameter DATA_WIDTH    = 32
)
(
    // Clock and Reset
    input  logic         clk,
    input  logic         rst_n,

    input  logic                   test_en_i,

    //Read ports
    output logic [DATA_WIDTH-1:0]  rdata_a_o,
    output logic [DATA_WIDTH-1:0]  rdata_b_o,
    output logic [DATA_WIDTH-1:0]  rdata_c_o,
    output logic [DATA_WIDTH-1:0]  rdata_d_o,
	
    //Key Read ports
    output logic [DATA_WIDTH-1:0]  rkey_a_o,
    output logic [DATA_WIDTH-1:0]  rkey_b_o,
    output logic [DATA_WIDTH-1:0]  rkey_c_o,
    output logic [DATA_WIDTH-1:0]  rkey_d_o,
	
	//
	output logic [DATA_WIDTH-1:0]  aes_mem,

    // Write port
    input logic [ADDR_WIDTH-1:0]   waddr_i,
    input logic [DATA_WIDTH-1:0]   wdata_i,
    input logic                    wen_i,

    // Select port
	input logic                    instruction_sel_i,           
    input logic                    aes_start_i,
	
	output logic                   aes_start_o
);

  // number of integer registers
  localparam    NUM_WORDS     = 2**(ADDR_WIDTH);

  // integer register file
  logic [NUM_WORDS-1:0][DATA_WIDTH-1:0]     mem;
  logic [NUM_WORDS-1:0][DATA_WIDTH-1:0]     key;

  // write enable signals for all registers
  logic [NUM_WORDS-1:0]                 wen_dec;

   //-----------------------------------------------------------------------------
   //-- READ : Read all 4 registers
   //-----------------------------------------------------------------------------
  generate
     begin
        assign rdata_a_o   = mem[0];
        assign rdata_d_o   = mem[3];
        assign rdata_b_o   = mem[1];
        assign rdata_c_o   = mem[2];
		
        assign rkey_a_o    = key[0];
        assign rkey_b_o    = key[1];
        assign rkey_c_o    = key[2];
        assign rkey_d_o    = key[3];
		assign aes_start_o = aes_start_i;
     end
  endgenerate 
  
  //-----------------------------------------------------------------------------
  //-- WRITE : Write Address Decoder
  //-----------------------------------------------------------------------------
  always_comb
  begin : we_decoder
    for (int i = 0; i < NUM_WORDS; i++) begin
      if (waddr_i == i)
        wen_dec[i] = wen_i;
      else
        wen_dec[i] = 1'b0;
    end
  end

  genvar i,l;

   //-----------------------------------------------------------------------------
   //-- WRITE : Write operation
   //-----------------------------------------------------------------------------

  generate

    // loop from 0 to NUM_WORDS
    for (i = 0; i < NUM_WORDS; i++)
    begin

      always_ff @(posedge clk, negedge rst_n)
      begin : register_write_behavioral
        if (rst_n==1'b0) begin
          mem[i] <= 32'b0;
		  key[i] <= 32'b0;
	    end else if (test_en_i==1'b1) begin
	      mem[i] <= 32'hffffffff;
        end else begin
          if(wen_dec[i] == 1'b1 && instruction_sel_i == 2'b0) begin
            mem[i] <= wdata_i;
          end else if(wen_dec[i] == 1'b1 && instruction_sel_i == 2'b1) begin
            key[i] <= wdata_i;
		  end
			
        end
      end

    end

  endgenerate

endmodule
