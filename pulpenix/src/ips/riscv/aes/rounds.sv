`timescale 1ns / 1ps

module rounds(clk,startin,rc,data,keyin,next_round,keyout,rndout);
  input clk;
  input startin;
  input [3:0]rc;
  input [127:0]data;
  input [127:0]keyin;
  output next_round;
  output [127:0]keyout;
  output [127:0]rndout;

  wire [127:0] sb,sr,mcl;
  wire sb_start,sr_start,mc_start,nr_start;

  KeyGeneration t0(startin,rc,keyin,sb_start,keyout);
  subbytes t1(sb_start,data,sr_start,sb);
  shiftrow t2(sr_start,sb,mc_start,sr);
  mixcolumn t3(mc_start,sr,nr_start,mcl);
  assign rndout= keyout^mcl;
  assign start_next = nr_start;

endmodule
