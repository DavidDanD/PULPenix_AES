////////////////////////////////////////////////////////////////////////////////
// Engineer:       Michael Perl, Avi Koriat                                   //
//                                                                            //             
//                                                                            //                                                   
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    Custom execution unit template                             //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

import riscv_defines::*;

module riscv_custom //custom execution unit
 (
  input  logic                     clk,
  input  logic                     rst_n,
  input  logic                     enable_i,
  input  logic [ALU_OP_WIDTH-1:0]  operator_i,
  input  logic [31:0]              operand_a_i,
  input  logic [31:0]              operand_b_i,
  output logic [31:0]              result_o,
  output logic                     ready_o
  );
    logic       valid0;
    logic       valid1;
    logic[3:0]  index0;
    logic[3:0]  index1;
////////////////////////////////
/// AVI gcd implementation ////
    logic [31:0] a;
    logic [31:0] b;
    logic [31:0] gcd_result;
    logic [5:0] mod_counter;
    logic [31:0] remainder;
    /*test_cnt added to prevent infinate loop
      in the simulaion (disk quota exceeded)
      in case of wrong implementation.remove
      upon project completion */
    logic [31:0] test_cnt;
    logic gcd_ready;
    logic [1:0] CS;
    logic [1:0] NS;
    localparam IDLE = 2'b00;
    localparam COMP = 2'b01;
    localparam WAIT_MOD = 2'b10;
    localparam FINISH = 2'b11;
     
     always_ff @(posedge clk, negedge rst_n)
        begin
            if (rst_n == 1'b0) begin
              NS <= IDLE;
              test_cnt <= 0;
            end else begin
              mod_counter <= 'd32;
              remainder <= 'b0;
              case (CS)
                 IDLE:
                  begin
                    if(operator_i == ALU_CLB & enable_i) begin
                      NS <= COMP;
                      a <= operand_a_i > operand_b_i ? operand_a_i : operand_b_i;
                      b <= operand_a_i > operand_b_i ? operand_b_i : operand_a_i; 
                    end
                  end    
             
                 COMP:
                  begin
                    if(b == 'b0| test_cnt >= 'd200) begin
                      gcd_result <= a;
                      NS <= FINISH;
                    end else begin
                      NS <= WAIT_MOD;
                      test_cnt <= test_cnt + 1;
                    end
                   end

                 WAIT_MOD:
                  begin
                    if(mod_counter == 'b0) begin
                      a <= b;
                      b <= remainder;
                      NS <= COMP;
                    end else begin
                      NS <= WAIT_MOD;
                      mod_counter <= mod_counter - 1;
                      remainder <= {remainder[30:0],a[mod_counter-1]}  >= b ?
                      {remainder[30:0],a[mod_counter-1]} - b :
                      {remainder[30:0],a[mod_counter-1]} ;
                    end
                  end
                FINISH:
                   begin
                      NS <= IDLE;
                   end
                default:
                  begin
                    NS <= IDLE;
                  end
              endcase
            end //if rst_n
     end //always_ff
     assign CS = NS;
     assign gcd_ready = (CS == IDLE & operator_i != ALU_CLB ) | (CS == FINISH) ;

////////////// End of GCD /////////////////
///////////////////////////////////////////



    //Signal to result mux
    logic[31:0] ffs_result;
    logic[31:0] alt_result;
    logic[31:0] xor_condition_result;
    logic       xor_condition_ready;
    logic       ffs_ready;
    logic       alt_ready;

    logic[31:0] not_operand_a;
    logic       helper;

//FFS
//Returns number of index in register
///*
    ffs_16 ffs16_i0
    (   .bits           (operand_a_i[15:0]),
    .valid         (valid0),
        .index         (index0)
    );
    
    ffs_16 ffs16_i1
    (   .bits           (operand_a_i[31:16]),
        
        .valid         (valid1),
        .index         (index1)
    );
  
  always_comb
  begin
    if (!(valid1 | valid0)) begin //neither valid 
        ffs_result = 32'b0;
    end else if (valid1)  begin
        ffs_result[4] = 1'b1;
        ffs_result[3:0] = index1;
    end    else begin 
        ffs_result[4] = 1'b0;
        ffs_result[3:0] = index0;
    end    
     ffs_result[31:5] = 27'b0;
     ffs_ready = 1'b1;
  end 
//*/
//FFS alternative
//Returns result of only leading bit high
/*always_comb
   begin 
        not_operand_a = ~operand_a_i;
	helper = 1'b1;        
	for( int i = 30; i>= 0; i--) begin
           helper        =  helper & not_operand_a[i+1];
	   ffs_result[i] = operand_a_i[i] & helper;
	end
        ffs_result[31] = operand_a_i[31]; //case where leading bit is 1
	ffs_ready = 1'b1; 
   end
*/
//ALT
  always_comb
  begin
     alt_result   = operand_a_i + operand_b_i - 'h2;
     alt_ready = 1'b1;
  end    
  
//XOR_condition
  always_comb
  begin
     if(^operand_b_i) begin    
        xor_condition_result   = operand_a_i + operand_b_i - 'h2;
     end else begin
        xor_condition_result = 'h0;
     end    
     xor_condition_ready = 'h1; 
  end 
  ////////////////////////////////////////////////////////
  //   ____                 _ _     __  __              //
  //  |  _ \ ___  ___ _   _| | |_  |  \/  |_   ___  __  //
  //  | |_) / _ \/ __| | | | | __| | |\/| | | | \ \/ /  //
  //  |  _ <  __/\__ \ |_| | | |_  | |  | | |_| |>  <   //
  //  |_| \_\___||___/\__,_|_|\__| |_|  |_|\__,_/_/\_\  //
  //                                                    //
  ////////////////////////////////////////////////////////

  always_comb
  begin
    result_o   = 'b0;
    ready_o = gcd_ready;// the of the ready signals are always 1 
                        // because they don't support multicycle,
                        // so the only way the CEU can be not ready,
                        // is if the gcd is not ready.
    
    unique case (operator_i)
      ALU_ADD: begin  
                   result_o = ffs_result;
               end  
      ALU_SLTS: begin 
                  result_o = alt_result;
                end      
      ALU_XOR: begin 
                  result_o = xor_condition_result;
                end
     ALU_CLB : begin
                  result_o = gcd_result;
               end                 
      default: // default case to suppress unique warning
               begin
                  result_o = alt_result;
               end  
    endcase
  end

endmodule
/////////////////Submoudules for FFS ///////////////////////////
module ffs_4
    (   input  logic                     bit0,
         input  logic                     bit1,
        input  logic                     bit2,
        input  logic                     bit3,
        
        output logic                     valid,
        output logic [1:0]               index
    );

  always_comb
  begin
    index[1] = bit2 | bit3 ;
    index[0] = (bit1 & ~bit2) | bit3 ;
    valid    = bit0 | bit1 | bit2 | bit3;    
  end
  
endmodule

module ffs_16
    (   input  logic[15:0]                bits,
        
        output logic                     valid,
        output logic [3:0]               index
    );
    logic       valid0;
    logic       valid1;
    logic       valid2;
    logic       valid3;
    logic[1:0]  index0;
    logic[1:0]  index1;
    logic[1:0]  index2;
    logic[1:0]  index3;
    
    ffs_4 ffs_i0
    (   .bit0                   (bits[0]),
        .bit1                   (bits[1]),
        .bit2                   (bits[2]),
        .bit3                   (bits[3]),
        
        .valid                  (valid0),
        .index                  (index0)
    );
    
    ffs_4 ffs_i1
    (   .bit0                   (bits[4]),
        .bit1                   (bits[5]),
        .bit2                   (bits[6]),
        .bit3                   (bits[7]),
        
        .valid                  (valid1),
        .index                  (index1)
    );
    
    ffs_4 ffs_i2
    (   .bit0                   (bits[8]),
        .bit1                   (bits[9]),
        .bit2                   (bits[10]),
        .bit3                   (bits[11]),
        
        .valid                  (valid2),
        .index                  (index2)
    );
    
    ffs_4 ffs_i3
    (   .bit0                   (bits[12]),
        .bit1                   (bits[13]),
        .bit2                   (bits[14]),
        .bit3                   (bits[15]),
        
        .valid                  (valid3),
        .index                  (index3)
    );
    
    ffs_4 ffs_iout
    (   .bit0                   (valid0),
        .bit1                   (valid1),
        .bit2                   (valid2),
        .bit3                   (valid3),
        
        .valid                  (valid),
        .index                  (index[3:2])
    );
  always_comb
  begin
    if (valid3) begin
        index[1:0] = index3;
    end else if (valid2) begin
        index[1:0] = index2;
    end else if (valid1) begin
        index[1:0] = index1;
    end else if (valid0) begin
        index[1:0] = index0;
    end           
  end
 
endmodule

