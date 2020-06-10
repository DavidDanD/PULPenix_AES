`timescale 1ns / 1ps

module rounndlast(clk,startin,rc,rin,keylastin,finished,fout);
input clk;
input startin;
input [3:0]rc;
input [127:0]rin;
input [127:0]keylastin;
output finished;
output [127:0]fout;

wire [127:0] sb,sr,mcl,keyout;
wire sb_start,sr_start;

keygeneration t0(startin,rc,keylastin,sb_start,keyout);
subbytes t1(sb_start,rin,sr_start,sb);
shiftrow t2(sr_start,sb,finished,sr);
assign fout= keyout^sr;

endmodule
