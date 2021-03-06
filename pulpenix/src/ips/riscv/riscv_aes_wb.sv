`timescale 1ns / 1ps

module riscv_aes_wb(clk,rst_n,start_aes_wb,address_in,data_in,write_en_out,halt_en_out,address_out,data_out);

    input clk;
    input rst_n;
    input start_aes_wb;
    input [31:0]  address_in;
    input [127:0] data_in;
    output write_en_out;
    output halt_en_out;
    output [31:0] address_out;
    output [31:0] data_out;

    logic halt_en;
    logic write_en;
    logic [1:0] cnt;
    logic [2:0] wr_cnt;
    logic [1:0] CS;
    logic [1:0] NS;
	logic [127:0] data;
    logic [31:0] data_o;
    logic [31:0] cur_addr;
    localparam IDLE = 2'b00;
    localparam WRITE = 2'b01;
    localparam WAIT = 2'b10;

    always_ff @(posedge clk, negedge rst_n)
        begin
            if (rst_n == 1'b0) begin
              NS <= IDLE;
              cnt <= 0;
			  wr_cnt <= 0;
              cur_addr <= 32'b0;
			  data <= 128'b0;
	          data_o <= 32'b0;
	          write_en <= 0;
	          halt_en <= 0;
            end else begin
              case (CS)
                 IDLE:
                  begin
                    cur_addr <= address_in;
		            write_en <= 0;
                    if(start_aes_wb) begin
					  data <= data_in;
 		 			  data_o <= data_in[cnt*32+:32];
                      NS <= WRITE;
                      cnt <= 0;
			          wr_cnt <= 0;
                      halt_en <= 1;
                    end
                  end    
             
                 WRITE:
                  begin
                    NS <= WAIT;
				    data_o <= data[cnt*32+:32];
				    cur_addr <= address_in + cnt*4;
				    halt_en <= 1;
				    write_en <= 1;
				    cnt <= cnt + 1;
					wr_cnt <= 0;
				  end
				 WAIT:
				  begin
		             write_en <= 0;
					 if (wr_cnt==3'b101) begin
					    NS <= WRITE;
					 end
					 if (wr_cnt==3'b101 && cnt==2'b0) begin
						NS <= IDLE;
						halt_en <= 0;
						write_en <= 0;
					 end
					 wr_cnt <= wr_cnt + 1;
                  end
                  
                  
                default:
                  begin
                    NS <= IDLE;
                    halt_en <= 0;
                  end
              endcase
            end // else
     end //always_ff
     
     assign CS = NS;

     assign write_en_out = write_en;
     assign halt_en_out = halt_en;
     assign data_out = data_o;
     assign address_out = cur_addr;
    
endmodule
