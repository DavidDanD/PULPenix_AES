`timescale 1ns / 1ps

module mixcolumn(start,a,finish,mcl);
input start;
input [127:0] a;
output finish;
output [127:0] mcl;

logic b1_finish,b2_finish,b3_finish,b4_finish;
logic [8:0] lmcl[15:0];

assign lmcl[0] = mixcolumn32 (start,a[127:120],a[119:112],a[111:104],a[103:96]);
assign lmcl[1] = mixcolumn32 (start,a[119:112],a[111:104],a[103:96],a[127:120]);
assign lmcl[2] = mixcolumn32 (start,a[111:104],a[103:96],a[127:120],a[119:112]);
assign lmcl[3] = mixcolumn32 (start,a[103:96],a[127:120],a[119:112],a[111:104]);
			   
assign lmcl[4] = mixcolumn32 (start,a[95:88],a[87:80],a[79:72],a[71:64]);
assign lmcl[5] = mixcolumn32 (start,a[87:80],a[79:72],a[71:64],a[95:88]);
assign lmcl[6] = mixcolumn32 (start,a[79:72],a[71:64],a[95:88],a[87:80]);
assign lmcl[7] = mixcolumn32 (start,a[71:64],a[95:88],a[87:80],a[79:72]);
			   
assign lmcl[8] = mixcolumn32 (start,a[63:56],a[55:48],a[47:40],a[39:32]);
assign lmcl[9] = mixcolumn32 (start,a[55:48],a[47:40],a[39:32],a[63:56]);
assign lmcl[10]= mixcolumn32 (start,a[47:40],a[39:32],a[63:56],a[55:48]);
assign lmcl[11]= mixcolumn32 (start,a[39:32],a[63:56],a[55:48],a[47:40]);
			   
assign lmcl[12]= mixcolumn32 (start,a[31:24],a[23:16],a[15:8],a[7:0]);
assign lmcl[13]= mixcolumn32 (start,a[23:16],a[15:8],a[7:0],a[31:24]);
assign lmcl[14]= mixcolumn32 (start,a[15:8],a[7:0],a[31:24],a[23:16]);
assign lmcl[15]= mixcolumn32 (start,a[7:0],a[31:24],a[23:16],a[15:8]);


assign mcl[127:120]= lmcl[0] [7:0];
assign mcl[119:112]= lmcl[1] [7:0];
assign mcl[111:104]= lmcl[2] [7:0];
assign mcl[103:96] = lmcl[3] [7:0];
                    
assign mcl[95:88]  = lmcl[4] [7:0];
assign mcl[87:80]  = lmcl[5] [7:0];
assign mcl[79:72]  = lmcl[6] [7:0];
assign mcl[71:64]  = lmcl[7] [7:0];
                    
assign mcl[63:56]  = lmcl[8] [7:0];
assign mcl[55:48]  = lmcl[9] [7:0];
assign mcl[47:40]  = lmcl[10][7:0];
assign mcl[39:32]  = lmcl[11][7:0];
                    
assign mcl[31:24]  = lmcl[12][7:0];
assign mcl[23:16]  = lmcl[13][7:0];
assign mcl[15:8]   = lmcl[14][7:0];
assign mcl[7:0]    = lmcl[15][7:0];

assign b1_finish = lmcl[0] [8] && lmcl[1] [8] && lmcl[2] [8] && lmcl[3] [8];
assign b2_finish = lmcl[4] [8] && lmcl[5] [8] && lmcl[6] [8] && lmcl[7] [8];
assign b3_finish = lmcl[8] [8] && lmcl[9] [8] && lmcl[10][8] && lmcl[11][8];
assign b4_finish = lmcl[12][8] && lmcl[13][8] && lmcl[14][8] && lmcl[15][8];
assign finish = b1_finish && b2_finish && b3_finish && b4_finish;

function [8:0] mixcolumn32;
input start;
input [7:0] i1,i2,i3,i4;
begin
mixcolumn32[7]=i1[6] ^ i2[6] ^ i2[7] ^ i3[7] ^ i4[7];
mixcolumn32[6]=i1[5] ^ i2[5] ^ i2[6] ^ i3[6] ^ i4[6];
mixcolumn32[5]=i1[4] ^ i2[4] ^ i2[5] ^ i3[5] ^ i4[5];
mixcolumn32[4]=i1[3] ^ i1[7] ^ i2[3] ^ i2[4] ^ i2[7] ^ i3[4] ^ i4[4];
mixcolumn32[3]=i1[2] ^ i1[7] ^ i2[2] ^ i2[3] ^ i2[7] ^ i3[3] ^ i4[3];
mixcolumn32[2]=i1[1] ^ i2[1] ^ i2[2] ^ i3[2] ^ i4[2];
mixcolumn32[1]=i1[0] ^ i1[7] ^ i2[0] ^ i2[1] ^ i2[7] ^ i3[1] ^ i4[1];
mixcolumn32[0]=i1[7] ^ i2[7] ^ i2[0] ^ i3[0] ^ i4[0];
mixcolumn32[8]=start;
end
endfunction
endmodule
