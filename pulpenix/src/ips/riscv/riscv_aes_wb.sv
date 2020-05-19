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
    output[127:0] data_out;

    logic halt_en;
    logic write_en;
    logic data;
    logic [1:0] cnt;
    logic [1:0] CS;
    logic [1:0] NS;
    logic [31:0] cur_addr;
    localparam IDLE = 2'b00;
    localparam WAIT_MOD = 2'b01;
    localparam WRITE = 2'b10;
    localparam FINISH = 2'b11;

    always_ff @(posedge clk, negedge rst_n)
        begin
            if (rst_n == 1'b0) begin
              NS <= IDLE;
              cnt <= 0;
            end else begin
              case (CS)
                 IDLE:
                  begin
                    if(start_aes_wb) begin
                      NS <= WRITE;
                      cnt <= 0;
                      halt_en <= 1;
                      cur_addr <= address_in;
                    end
                  end    
             
                 WRITE:
                  begin
                    if(cnt < 'd4) begin
                      NS <= WRITE;
                      data <= data_in[cnt*32+:32];
                      cur_addr <= cur_addr + 32;
                      halt_en <= 1;
                      write_en <= 1;
                      cnt <= cnt + 1;
                    end else begin
                      NS <= WAIT_MOD;
                    end
                   end

                 WAIT_MOD:
                  begin
                    halt_en <= 1;
                  end
                FINISH:
                   begin
                      NS <= IDLE;
                      halt_en <= 0;
                   end
                default:
                  begin
                    NS <= IDLE;
                    halt_en <= 0;
                  end
              endcase
            end // else
     end //always_ff

     assign write_en_out = write_en;
     assign halt_en_out = halt_en;
     assign data_out = data;
    
endmodule