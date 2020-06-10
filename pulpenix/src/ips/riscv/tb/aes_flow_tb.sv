`timescale 1ns/1ns

module aes_flow_tb;
    parameter ADDR_WIDTH    = 2   ;
    parameter DATA_WIDTH    = 32  ;

    logic        clk      ;
    logic        resetN    ;
    logic        test     ;

    logic [ADDR_WIDTH-1:0]  address  ;
    logic [DATA_WIDTH-1:0]  data    ;
    logic                 wr_enb   ;

    logic [1:0]  instruction_sel;
    logic        aes_start_i;
    logic        aes_start_o;
	logic        aes_start_wb;
	logic [31:0] aes_cipher_addrin;
    logic [31:0] aes_wr_addrin;
	
    logic [DATA_WIDTH-1:0]  rdata_a_o;
    logic [DATA_WIDTH-1:0]  rdata_b_o;
    logic [DATA_WIDTH-1:0]  rdata_c_o;
    logic [DATA_WIDTH-1:0]  rdata_d_o;
	
    logic [DATA_WIDTH-1:0]  rkey_a_o;
    logic [DATA_WIDTH-1:0]  rkey_b_o;
    logic [DATA_WIDTH-1:0]  rkey_c_o;
    logic [DATA_WIDTH-1:0]  rkey_d_o;
	
	logic [DATA_WIDTH*4-1:0]   ciphered_data;
	
    logic         wb_write_en_o;
    logic         wb_halt_en_o;
    logic [31:0]  wb_address_out_o;
    logic [31:0]  wb_data_out_o;

    riscv_aes_register_file
       #(
         .ADDR_WIDTH(ADDR_WIDTH),
         .DATA_WIDTH(DATA_WIDTH)
        )
    simul_regs
    (
       .clk(clk),
       .rst_n(resetN),

       .test_en_i(test),

	   .instruction_sel_i(instruction_sel),
       .aes_start_i(aes_start_i),

       .waddr_i(address),
       .wdata_i(data),
       .wen_i(wr_enb),
	   
       .rdata_a_o(rdata_a_o),
       .rdata_b_o(rdata_b_o),
       .rdata_c_o(rdata_c_o),
       .rdata_d_o(rdata_d_o),
	   
       .rkey_a_o(rkey_a_o),
       .rkey_b_o(rkey_b_o),
       .rkey_c_o(rkey_c_o),
       .rkey_d_o(rkey_d_o),
	   
	   .wb_addr_o(aes_cipher_addrin),
	   
       .aes_start_o(aes_start_o)
    );
	
	riscv_aes_cipher
	simul_aes
	(
	    .clk(clk),
		.start_aes_in(aes_start_o),
		.datain({rdata_a_o,rdata_b_o,rdata_c_o,rdata_d_o}),
		.key({rkey_a_o,rkey_b_o,rkey_c_o,rkey_d_o}),
		.addrin(aes_cipher_addrin),
		.start_aes_out(aes_start_wb),
		.dataout(ciphered_data),
		.addrout(aes_wr_addrin)
	);
	
	riscv_aes_wb
	simul_wb
	(
	    .clk(clk),
        .rst_n(resetN),
		.start_aes_wb(aes_start_wb),
		.address_in(aes_wr_addrin),
		.data_in(ciphered_data),
		.write_en_out(wb_write_en_o),
		.halt_en_out(wb_halt_en_o),
		.address_out(wb_address_out_o),
		.data_out(wb_data_out_o)
	);

    initial
      begin
         resetN <= 0; #10;

         resetN <= 1;
         test   <= 0;
         
         address          <= 2'h0;
         data             <= 32'h0;
         wr_enb           <= 1'b0;
		 instruction_sel  <= 2'h0;
		 aes_start_i      <= 1'b0; #10
		 
		 // Writing deadbeef to data register 0
         address          <= 2'h0;
         data             <= 32'hdeadbeef;
         wr_enb           <= 1'b1;
		 instruction_sel  <= 2'h0;
		 aes_start_i      <= 1'b0; #10
		 
		 // Writing deafbabe to data register 1
         address          <= 2'h1;
         data             <= 32'hdeafbabe;
         wr_enb           <= 1'b1;
		 instruction_sel  <= 2'h0;
		 aes_start_i      <= 1'b0; #10
		 
		 // Writing 01234567 to addr register
         address          <= 2'h1;
         data             <= 32'h01234567;
         wr_enb           <= 1'b1;
		 instruction_sel  <= 2'h3;
		 aes_start_i      <= 1'b0; #10
		 
		 // Writing cafecafe to key register 2
         address          <= 2'h2;
         data             <= 32'hcafeface;
         wr_enb           <= 1'b1;
         instruction_sel  <= 2'h1;
		 aes_start_i      <= 1'b1; #10
		 
		 aes_start_i      <= 1'b0;
      end

    always
      begin
        clk <= 0; #5;
        clk <= 1; #5;
      end
endmodule

