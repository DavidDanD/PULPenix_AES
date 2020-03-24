// Copyright 2017 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the “License”); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an “AS IS” BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.


module clk_rst_gen
(
    input  logic                            clk_i,
    input  logic                            rstn_i,

    input  logic                            clk_sel_i,
    input  logic                            clk_standalone_i,
    input  logic                            testmode_i,
    input  logic                            scan_en_i,
    input  logic                            scan_i,
    output logic                            scan_o,

    output logic                            clk_o,
    output logic                            rstn_o
);


  logic clk_int;

  cluster_clock_mux2
  clk_mux_i
  (
      .clk_sel_i ( clk_sel_i     ),
      .clk0_i    ( clk_i         ),
      .clk1_i    ( 1'b0          ),   // Not in use
      .clk_o     ( clk_int       )
  );


  assign scan_o       = 1'b0;


  //----------------------------------------------------------------------------//
  // Reset synchronizer
  //----------------------------------------------------------------------------//
  rstgen i_rst_gen_soc
  (
      // PAD FRAME SIGNALS
      .clk_i               ( clk_int         ),
      .rst_ni              ( rstn_i          ),

      // TEST MODE
      .test_mode_i         ( testmode_i      ),

      // OUTPUT RESET
      .rst_no              ( rstn_o          ),
      .init_no             (                 )
  );


  assign clk_o = clk_int;

endmodule
