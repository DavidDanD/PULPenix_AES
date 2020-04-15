`timescale 1ns/1ns

module aes_regs;
    parameter ADDR_WIDTH    = 2   ;
    parameter DATA_WIDTH    = 32  ;

    logic        clk      ;
    logic        resetN    ;
    logic        test     ;

    logic [ADDR_WIDTH:0]  address  ;
    logic [DATA_WIDTH:0]  data    ;
    logic                 wr_enb   ;

    logic        aes_start;

    logic [DATA_WIDTH-1:0]  rdata_a_o;
    logic [DATA_WIDTH-1:0]  rdata_b_o;
    logic [DATA_WIDTH-1:0]  rdata_c_o;
    logic [DATA_WIDTH-1:0]  rdata_d_o;

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

       .waddr_i(address),
       .wdata_i(data),
       .wen_i(wr_enb),

       .aes_start_i(aes_start)
    );

    initial
      begin
         resetN <= 0; #10;

         resetN <= 1;
         test   <= 0;
         
         address  <= 0;
         data     <= 0;
         wr_enb   <= 0;
      end

    always
      begin
        clk <= 1; #5;
        clk <= 0; #5;
      end
endmodule
