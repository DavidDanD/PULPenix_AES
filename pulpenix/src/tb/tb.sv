`include "config.sv"
`include "tb_jtag_pkg.sv"

`define CLK_PERIOD        40.00ns      // 25 MHz # Orig TB
// `define CLK_PERIOD       1.6ns     // 625 MHz # ASIC target <<< Need to debug fail to communicate with debugger over spi

`define EXIT_SUCCESS  0
`define EXIT_FAIL     1
`define EXIT_ERROR   -1

module tb;
  timeunit      1ns;
  timeprecision 1ps;

  // +MEMLOAD= valid values are "SPI", "STANDALONE" "PRELOAD", "" (no load of L2)
  parameter  SPI           = "QUAD";    // valid values are "SINGLE", "QUAD"
  parameter  BAUDRATE      = 781250; // 1562500
  parameter  TEST          = ""; //valid values are "" (NONE), "DEBUG"

  int           exit_status = `EXIT_ERROR; // modelsim exit code, will be overwritten when successful

  string        memload;
  logic         s_clk   = 1'b0;
  logic         s_rst_n = 1'b0;

  logic         fetch_enable = 1'b0;

  logic [1:0]   padmode_spi_master;
  logic         spi_sck   = 1'b0;
  logic         spi_csn   = 1'b1;
  logic [1:0]   spi_mode;
  logic         spi_sdo0;
  logic         spi_sdo1;
  logic         spi_sdo2;
  logic         spi_sdo3;
  logic         spi_sdi0;
  logic         spi_sdi1;
  logic         spi_sdi2;
  logic         spi_sdi3;

  logic         uart_tx;
  logic         uart_rx;
  logic         s_uart_dtr;
  logic         s_uart_rts;

  logic         scl_pad_i;
  logic         scl_pad_o;
  logic         scl_padoen_o;

  logic         sda_pad_i;
  logic         sda_pad_o;
  logic         sda_padoen_o;

  tri1          scl_io;
  tri1          sda_io;

  logic [31:0]  gpio_in = '0;
  logic [31:0]  gpio_dir;
  logic [31:0]  gpio_out;

  logic [31:0]  recv_data;

  jtag_i jtag_if();

  adv_dbg_if_t adv_dbg_if = new(jtag_if);
  
  // APB GPP interface (General Peripheral Port)
  
  // output to GPP Slave
  wire        gpp_hclk     ;
  wire        gpp_hresetn  ;
  wire [11:0] gpp_paddr    ;
  wire [31:0] gpp_pwdata   ;
  wire        gpp_pwrite   ;
  wire        gpp_psel     ;
  wire        gpp_penable  ;
  wire [31:0] gpp_prdata   ;  
  wire        gpp_pready   ; 
  wire        gpp_pslverr  ;

            
tb_gpp i_tb_gpp(
.HCLK        ( gpp_hclk    ) ,
.HRESETn     ( gpp_hresetn ) ,
.PADDR       ( gpp_paddr   ) ,
.PWDATA      ( gpp_pwdata  ) ,
.PWRITE      ( gpp_pwrite  ) ,
.PSEL        ( gpp_psel    ) ,
.PENABLE     ( gpp_penable ) ,
.PRDATA      ( gpp_prdata  ) ,
.PREADY      ( gpp_pready  ) ,
.PSLVERR     ( gpp_pslverr ) 
);
  

  // use 8N1
  uart_bus
  #(
    .BAUD_RATE(BAUDRATE),
    .PARITY_EN(0)
  )
  uart
  (
    .rx         ( uart_rx ),
    .tx         ( uart_tx ),
    .rx_en      ( 1'b1    )
  );

  spi_slave
  spi_master();


  i2c_buf i2c_buf_i
  (
    .scl_io       ( scl_io       ),
    .sda_io       ( sda_io       ),
    .scl_pad_i    ( scl_pad_i    ),
    .scl_pad_o    ( scl_pad_o    ),
    .scl_padoen_o ( scl_padoen_o ),
    .sda_pad_i    ( sda_pad_i    ),
    .sda_pad_o    ( sda_pad_o    ),
    .sda_padoen_o ( sda_padoen_o )
  );

  i2c_eeprom_model
  #(
    .ADDRESS ( 7'b1010_000 )
  )
  i2c_eeprom_model_i
  (
    .scl_io ( scl_io  ),
    .sda_io ( sda_io  ),
    .rst_ni ( s_rst_n )
  );

  pulpino_top top_i
  (
    .clk               ( s_clk        ),
    .rst_n             ( s_rst_n      ),

    .clk_sel_i         ( 1'b0         ),
    .testmode_i        ( 1'b0         ),
    .fetch_enable_i    ( fetch_enable ),

    .spi_clk_i         ( spi_sck      ),
    .spi_cs_i          ( spi_csn      ),
    .spi_mode_o        ( spi_mode     ),
    .spi_sdo0_o        ( spi_sdi0     ),
    .spi_sdo1_o        ( spi_sdi1     ),
    .spi_sdo2_o        ( spi_sdi2     ),
    .spi_sdo3_o        ( spi_sdi3     ),
    .spi_sdi0_i        ( spi_sdo0     ),
    .spi_sdi1_i        ( spi_sdo1     ),
    .spi_sdi2_i        ( spi_sdo2     ),
    .spi_sdi3_i        ( spi_sdo3     ),

    .spi_master_clk_o  ( spi_master.clk     ),
    .spi_master_csn0_o ( spi_master.csn     ),
    .spi_master_csn1_o (                    ),
    .spi_master_csn2_o (                    ),
    .spi_master_csn3_o (                    ),
    .spi_master_mode_o ( spi_master.padmode ),
    .spi_master_sdo0_o ( spi_master.sdo[0]  ),
    .spi_master_sdo1_o ( spi_master.sdo[1]  ),
    .spi_master_sdo2_o ( spi_master.sdo[2]  ),
    .spi_master_sdo3_o ( spi_master.sdo[3]  ),
    .spi_master_sdi0_i ( spi_master.sdi[0]  ),
    .spi_master_sdi1_i ( spi_master.sdi[1]  ),
    .spi_master_sdi2_i ( spi_master.sdi[2]  ),
    .spi_master_sdi3_i ( spi_master.sdi[3]  ),

    .scl_pad_i         ( scl_pad_i    ),
    .scl_pad_o         ( scl_pad_o    ),
    .scl_padoen_o      ( scl_padoen_o ),
    .sda_pad_i         ( sda_pad_i    ),
    .sda_pad_o         ( sda_pad_o    ),
    .sda_padoen_o      ( sda_padoen_o ),


    .uart_tx           ( uart_rx      ),
    .uart_rx           ( uart_tx      ),
    .uart_rts          ( s_uart_rts   ),
    .uart_dtr          ( s_uart_dtr   ),
    .uart_cts          ( 1'b0         ),
    .uart_dsr          ( 1'b0         ),

    .gpio_in           ( gpio_in      ),
    .gpio_out          ( gpio_out     ),
    .gpio_dir          ( gpio_dir     ),
    .gpio_padcfg       (              ),

    .tck_i             ( jtag_if.tck     ),
    .trstn_i           ( jtag_if.trstn   ),
    .tms_i             ( jtag_if.tms     ),
    .tdi_i             ( jtag_if.tdi     ),
    .tdo_o             ( jtag_if.tdo     ),
    

    .clk_standalone_i  (1'b0), // Currently unused input
    .scan_enable_i     (1'b0), // Currently unused input
    .pad_cfg_o         (),     // Currently unused output
    .pad_mux_o         (),     // Currently unused output 

    // GPP Interface (General Purpose Peripherals)
    
    .gpp_hclk        ( gpp_hclk          ),
    .gpp_hresetn     ( gpp_hresetn       ),
    .gpp_paddr       ( gpp_paddr         ),
    .gpp_pwdata      ( gpp_pwdata        ),
    .gpp_pwrite      ( gpp_pwrite        ),
    .gpp_psel        ( gpp_psel          ),
    .gpp_penable     ( gpp_penable       ),            
    .gpp_prdata      ( gpp_prdata        ),
    .gpp_pready      ( gpp_pready        ),
    .gpp_pslverr     ( gpp_pslverr       )

    
  );
  
 //--------------------------------------------------------------------
// Udi added support for gpio_iosim to support pseudo io (print,scan,file) over gpio
 

     wire [31:0]  iosim_gpio_in ;
     wire [31:0]  iosim_addr;
     wire         iosim_write;
     wire         iosim_read;
     wire [31:0]  iosim_wdata;
	 wire [31:0]  iosim_rdata;
 

gpio_iosim_bridg i_gpio_iosim_bridg (
    .clk(s_clk),
    .rst_n(s_rst_n),
    .gpio_in(iosim_gpio_in),
    .gpio_out(gpio_out),
    .addr   (iosim_addr),
    .write  (iosim_write),
    .read   (iosim_read),
    .wdata  (iosim_wdata),
	.rdata  (iosim_rdata)
);
 
iosim i_iosim (
    .clk(s_clk),
    .addr   (iosim_addr),
    .write  (iosim_write),
    .read   (iosim_read),
    .wdata  (iosim_wdata),
	.rdata  (iosim_rdata)
);
 

//always @(*) gpio_in[23:16] = iosim_gpio_in[23:16] ;
always @(*) gpio_in = iosim_gpio_in ; 
 
// END OF : Udi added support for gpio_iosim
//--------------------------------------------------------------------

  initial
  begin
    #(`CLK_PERIOD/2);
    s_clk = 1'b1;
    forever s_clk = #(`CLK_PERIOD/2) ~s_clk;
  end

  logic use_qspi;

  initial
  begin
    int i;

    if(!$value$plusargs("MEMLOAD=%s", memload))
      memload = "PRELOAD";

    $display("Using MEMLOAD method: %s", memload);

    use_qspi = SPI == "QUAD" ? 1'b1 : 1'b0;

    s_rst_n      = 1'b0;
    fetch_enable = 1'b0;

    #500ns;

    s_rst_n = 1'b1;

    #500ns;
    if (use_qspi)
      spi_enable_qpi();


    if (memload != "STANDALONE")
    begin
      /* Configure JTAG and set boot address */
      adv_dbg_if.jtag_reset();
      adv_dbg_if.jtag_softreset();
      adv_dbg_if.init();
      adv_dbg_if.axi4_write32(32'h1A10_7008, 1, 32'h0000_0000);
    end

    if (memload == "PRELOAD")
    begin
      // preload memories
      mem_preload();
    end
    else if (memload == "SPI")
    begin
      spi_load(use_qspi);
      spi_check(use_qspi);
    end

    #200ns;
    fetch_enable = 1'b1;

    if(TEST == "DEBUG") begin
      debug_tests();
    end else if (TEST == "MEM_DPI") begin
      $display("Message from tb.sv: TEST == MEM_DPI , Entered mem_dpi\n") ;
      mem_dpi(4567);
    end else if (TEST == "ARDUINO_UART") begin
      if (~top_i.gpio_out[0])
        wait(top_i.gpio_out[0]);
      uart.send_char(8'h65);
    end else if (TEST == "ARDUINO_GPIO") begin
      // Here  test for GPIO Starts
      #50us;
      gpio_in[4]=1'b1;
      #10us;
      gpio_in[4]=1'b0;
      #10us;
      gpio_in[4]=1'b1;
      gpio_in[7]=1'b1;
    end else if (TEST == "ARDUINO_SHIFT") begin
      if (~top_i.gpio_out[0])
        wait(top_i.gpio_out[0]);

      gpio_in[3]=1'b1;
      #5us;
      gpio_in[3]=1'b1;
      #5us;
      gpio_in[3]=1'b0;
      #5us;
      gpio_in[3]=1'b0;
      #5us;
      gpio_in[3]=1'b1;
      #5us;
      gpio_in[3]=1'b0;
      #5us;
      gpio_in[3]=1'b0;
      #5us;
      gpio_in[3]=1'b1;
      #5us;
    end else if (TEST == "ARDUINO_PULSEIN") begin
      if (~top_i.gpio_out[0])
        wait(top_i.gpio_out[0]);
      #50us;
      gpio_in[4]=1'b1;
      #500us;
      gpio_in[4]=1'b0;
      #1ms;
      gpio_in[4]=1'b1;
      #500us;
      gpio_in[4]=1'b0;
    end else if (TEST == "ARDUINO_INT") begin
      if (~top_i.gpio_out[0])
        wait(top_i.gpio_out[0]);
      #50us;
      gpio_in[1]=1'b1;
      #20us;
      gpio_in[1]=1'b0;
      #20us;
      gpio_in[1]=1'b1;
      #20us;
      gpio_in[2]=1'b1;
      #20us;
    end else if (TEST == "ARDUINO_SPI") begin
      for(i = 0; i < 2; i++) begin
        spi_master.wait_csn(1'b0);
        spi_master.send(0, {>>{8'h38}});
      end
    end



    // end of computation
    if (~top_i.gpio_out[8])
      wait(top_i.gpio_out[8]);

    spi_check_return_codes(exit_status);

    $fflush();
    $stop();
  end
  

  // TODO: this is a hack, do it properly!
  `include "tb_spi_pkg.sv"
  `include "tb_mem_pkg.sv"
  `include "spi_debug_test.svh"
  `include "mem_dpi.svh"
    
  
endmodule
