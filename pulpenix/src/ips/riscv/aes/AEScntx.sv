// AES controller. Used for controlling the AES core.
module AEScntx (
    // from testbench
    input   clk,
    input   start,
    input   rstn,

    // to AEScore
    output  accept,
    output  [3:0] rndNo,
    output  enbSB,
    output  enbSR,
    output  enbMC,
    output  enbAR,
    output  enbKS,

    // to testbench
    output  done,
    output  [9:0] completed_round
);

reg [3:0] reg_rndNo;
reg reg_done ;
reg cypher;

// Asynchronous reset
always @ (posedge clk or negedge rstn)
begin
    if (~rstn)
    begin
		cypher <= 1'b0;
		reg_rndNo <= 4'b0;
		reg_done <= 1'b0;
    end
    else if (start | cypher)
    begin
		cypher <= ~(rndNo == 10);
        // Update state of implicit FSM (11 states in total)
        reg_rndNo <= (rndNo < 10) ? (rndNo + 1) : 4'b0;
        reg_done <= (rndNo == 10);
    end
	else
	begin
		reg_done <= 1'b0;
	end
end

assign enbSB = (rndNo >= 1) && (rndNo <= 10);
assign enbSR = (rndNo >= 1) && (rndNo <= 10);
assign enbMC = (rndNo >= 1) && (rndNo <= 9);
assign enbAR = 1'b1;   // (rndNo >= 0) && (rndNo <= 10)
assign enbKS = (rndNo >= 1) && (rndNo <= 10);

assign accept = (rndNo == 0);   // Notify core to accept new inputs at round 0
assign completed_round = 10'b1000000000 >> (10 - rndNo);
assign rndNo = reg_rndNo;
assign done = reg_done;

endmodule
