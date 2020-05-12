`timescale 1ns/1ns

module aes_engine_tb;
    parameter ADDR_WIDTH    = 2   ;
    parameter DATA_WIDTH    = 32  ;

    logic        clk      ;
    logic        resetN    ;
    logic        test     ;

    logic [ADDR_WIDTH-1:0]  address  ;
    logic [DATA_WIDTH-1:0]  data    ;
    logic                 wr_enb   ;

    logic        instruction_sel;
    logic        aes_start_i;
    logic        aes_start_o;
	logic        aes_start_wb;

    logic [DATA_WIDTH-1:0]  rdata_a_o;
    logic [DATA_WIDTH-1:0]  rdata_b_o;
    logic [DATA_WIDTH-1:0]  rdata_c_o;
    logic [DATA_WIDTH-1:0]  rdata_d_o;
	
    logic [DATA_WIDTH-1:0]  rkey_a_o;
    logic [DATA_WIDTH-1:0]  rkey_b_o;
    logic [DATA_WIDTH-1:0]  rkey_c_o;
    logic [DATA_WIDTH-1:0]  rkey_d_o;
	
	logic [DATA_WIDTH*4-1:0]   ciphered_data;

    riscv_aes_register_file
       #(
         .ADDR_WIDTH(ADDR_WIDTH),
         .DATA_WIDTH(DATA_WIDTH)
        )
    simul
    (
       .clk(clk),
       .rst_n(resetN),

       .test_en_i(test),

       .rdata_a_o(rdata_a_o),
       .rdata_b_o(rdata_b_o),
       .rdata_c_o(rdata_c_o),
       .rdata_d_o(rdata_d_o),
	   
       .rkey_a_o(rkey_a_o),
       .rkey_b_o(rkey_b_o),
       .rkey_c_o(rkey_c_o),
       .rkey_d_o(rkey_d_o),

       .waddr_i(address),
       .wdata_i(data),
       .wen_i(wr_enb),
	   
	   .instruction_sel_i(instruction_sel),
       .aes_start_i(aes_start_i),
	   
       .aes_start_o(aes_start_o)
    );
	
	riscv_aes_cipher
	aes_simul
	(
	    .clk(clk),
		.start_aes_in(aes_start_o),
		.datain({rdata_a_o,rdata_b_o,rdata_c_o,rdata_d_o}),
		.key({rkey_a_o,rkey_b_o,rkey_c_o,rkey_d_o}),
		.start_aes_out(aes_start_wb),
		.dataout(ciphered_data)
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
		 
		 // Writing cafecafe to key register 2
         address          <= 2'h2;
         data             <= 32'hcafeface;
         wr_enb           <= 1'b1;
         instruction_sel  <= 2'h3;
		 aes_start_i      <= 1'b1;
      end

    always
      begin
        clk <= 0; #5;
        clk <= 1; #5;
      end
endmodule
