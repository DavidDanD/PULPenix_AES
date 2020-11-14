`timescale 1ns / 1ps

module riscv_aes_cipher(clk,start_aes_in,datain,key,addrin,start_aes_out,dataout,addrout);

    input          clk;
    input          start_aes_in;
    input  [127:0] datain;
    input  [127:0] key;
	input  [31:0]  addrin;
    output         start_aes_out;
    output [127:0] dataout;
	output [31:0]  addrout;
    
    wire [127:0] r0_out;
    wire [127:0] r1_out,r2_out,r3_out,r4_out,r5_out,r6_out,r7_out,r8_out,r9_out;
    wire         start1_out,start2_out,start3_out,start4_out,start5_out,start6_out,start7_out,start8_out,start9_out;
    wire [127:0] key_in;
    wire [127:0] keyout1,keyout2,keyout3,keyout4,keyout5,keyout6,keyout7,keyout8,keyout9;
	 
    assign r0_out = start_aes_in ? datain^key : 128'b0;
	assign key_in = start_aes_in ? key : 128'b0;
	assign addrout = addrin;
	
	rounds r1(.clk(clk),.startin(start_aes_in),.rc(4'b0000),.data(r0_out),.keyin(key_in),.next_round(start1_out),.keyout(keyout1),.rndout(r1_out));
	rounds r2(.clk(clk),.startin(start1_out),.rc(4'b0001),.data(r1_out),.keyin(keyout1),.next_round(start2_out),.keyout(keyout2),.rndout(r2_out));
	rounds r3(.clk(clk),.startin(start2_out),.rc(4'b0010),.data(r2_out),.keyin(keyout2),.next_round(start3_out),.keyout(keyout3),.rndout(r3_out));
	rounds r4(.clk(clk),.startin(start3_out),.rc(4'b0011),.data(r3_out),.keyin(keyout3),.next_round(start4_out),.keyout(keyout4),.rndout(r4_out));
	rounds r5(.clk(clk),.startin(start4_out),.rc(4'b0100),.data(r4_out),.keyin(keyout4),.next_round(start5_out),.keyout(keyout5),.rndout(r5_out));
	rounds r6(.clk(clk),.startin(start5_out),.rc(4'b0101),.data(r5_out),.keyin(keyout5),.next_round(start6_out),.keyout(keyout6),.rndout(r6_out));
	rounds r7(.clk(clk),.startin(start6_out),.rc(4'b0110),.data(r6_out),.keyin(keyout6),.next_round(start7_out),.keyout(keyout7),.rndout(r7_out));
	rounds r8(.clk(clk),.startin(start7_out),.rc(4'b0111),.data(r7_out),.keyin(keyout7),.next_round(start8_out),.keyout(keyout8),.rndout(r8_out));
	rounds r9(.clk(clk),.startin(start8_out),.rc(4'b1000),.data(r8_out),.keyin(keyout8),.next_round(start9_out),.keyout(keyout9),.rndout(r9_out));
	rounndlast r10(.clk(clk),.startin(start9_out),.rc(4'b1001),.rin(r9_out),.keylastin(keyout9),.finished(start_aes_out),.fout(dataout));
    
endmodule
