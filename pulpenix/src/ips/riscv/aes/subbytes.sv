`timescale 1ns / 1ps

module subbytes(start,data,finished,sb);

input start;
input [127:0] data;
output finished;
output [127:0] sb;

wire [15:0] finish;

     assign finished = finish==((2**16)-1) ? 1 : 0 ;

     sbox q0(.start(start), .a(data[127:120]),.finish(finish[0]), .c(sb[127:120]) );
     sbox q1(.start(start), .a(data[119:112]),.finish(finish[1]), .c(sb[119:112]) );
     sbox q2(.start(start), .a(data[111:104]),.finish(finish[2]), .c(sb[111:104]) );
     sbox q3(.start(start), .a(data[103:96]), .finish(finish[3]), .c(sb[103:96]) );
     
     sbox q4(.start(start), .a(data[95:88]),  .finish(finish[4]), .c(sb[95:88]) );
     sbox q5(.start(start), .a(data[87:80]),  .finish(finish[5]), .c(sb[87:80]) );
     sbox q6(.start(start), .a(data[79:72]),  .finish(finish[6]), .c(sb[79:72]) );
     sbox q7(.start(start), .a(data[71:64]),  .finish(finish[7]), .c(sb[71:64]) );
     
     sbox q8(.start(start), .a(data[63:56]),  .finish(finish[8]), .c(sb[63:56]) );
     sbox q9(.start(start), .a(data[55:48]),  .finish(finish[9]), .c(sb[55:48]) );
     sbox q10(.start(start),.a(data[47:40]),  .finish(finish[10]),.c(sb[47:40]) );
     sbox q11(.start(start),.a(data[39:32]),  .finish(finish[11]),.c(sb[39:32]) );
     
     sbox q12(.start(start),.a(data[31:24]),  .finish(finish[12]),.c(sb[31:24]) );
     sbox q13(.start(start),.a(data[23:16]),  .finish(finish[13]),.c(sb[23:16]) );
     sbox q14(.start(start),.a(data[15:8]),   .finish(finish[14]),.c(sb[15:8]) );
     sbox q15(.start(start),.a(data[7:0]),    .finish(finish[15]),.c(sb[7:0]) );
	  
endmodule
