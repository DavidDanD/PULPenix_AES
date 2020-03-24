typedef struct {
  byte we;
  int  addr;
  int  size;
} mem_packet_t;

import "DPI-C"         function void mem_init(input int port);
import "DPI-C"         function int  mem_poll(output mem_packet_t packet, output byte buffer[1024]);
import "DPI-C"         function int  mem_push(input mem_packet_t packet, input byte buffer[1024]);

task mem_dpi;


  input int port;
  byte buffer[1024];
  mem_packet_t packet;
  int i;
  int j;
  int local_addr;
  int local_size;
  logic [31:0] rdata_temp;
  logic [31:0] rdata_temp_arr[];
  begin

    $display("Message from mem_dpi.svh: Entered task mem_dpi , port = %d\n",port) ;
        
    mem_init(port);
 
    if (TEST == "MEM_DPI") begin   

      $display("Message from mem_dpi.svh: START NOW debug_bridge task and resume run\n") ;
      $stop() ; // To allow automatic bridge invocation from simulation script run_gdb.tcl       
      $display("Message from mem_dpi.svh: STARTING DEBUG BRIDGE PROCESS , ECLIPSE/GDB should be up to proceed");    
      //$system("$RISCV_PULP_GDB_UTIL/run_bridge.sh > debug_bridge.log &"); // NO Success with this method, using external run_gdb.tcl
    end
    
    while(1) begin
      
      //for (i = 0; i < 100; i++) @(posedge s_clk); // wait for 100 cycles between polls
      @(posedge s_clk); // CHANGED BY UDI TO CHECK EVERY CYCLE
      //$display($time," TMP_DBG mem_dpi.svh Polling");

      if (mem_poll(packet, buffer) == 0) begin
      
        // DEBUG BY UDI
        // $write("TMP_DBG: mem_poll Got a valid packet , packet.addr=%h,packet.size=%d,packet.we=%d ,buffer=",packet.addr,packet.size,packet.we) ;
        // for (i = 0; i < packet.size; i++) begin
        //    $write("%h",buffer[i]);
        //    if (i!=packet.size) $write(",");
        // end
        // $write("\n");
        // END OF DEBUG BY UDI
             
        // we got a valid packet
        // let's perform the SPI transactions and send back the result
        local_addr = packet.addr;
        local_size = packet.size;
        i = 0;

        if (packet.we) begin
          // write

          // first align addresses to words
          if (local_addr[0]) begin
            spi_write_byte(use_qspi, local_addr, buffer[i]);
            i          += 1;
            local_addr += 1;
            local_size -= 1;
          end

          if (local_addr[1] && local_size >= 2) begin
            spi_write_halfword(use_qspi, local_addr, {buffer[i+1][7:0], buffer[i][7:0]});
            i          += 2;
            local_addr += 2;
            local_size -= 2;
          end

          // now main loop, always aligned
          // TODO: this can be replaced by one single burst
          while(local_size >= 4) begin
            spi_write_word(use_qspi, local_addr, {buffer[i+3][7:0], buffer[i+2][7:0], buffer[i+1][7:0], buffer[i][7:0]});
            i          += 4;
            local_addr += 4;
            local_size -= 4;
          end

          // now take care of the last max 3 bytes
          if (local_size >= 2) begin
            spi_write_halfword(use_qspi, local_addr, {buffer[i+1][7:0], buffer[i][7:0]});
            i          += 2;
            local_addr += 2;
            local_size -= 2;
          end

          if (local_size >= 1) begin
            spi_write_byte(use_qspi, local_addr, buffer[i]);
            i          += 1;
            local_addr += 1;
            local_size -= 1;
          end
        end else begin
          // read

          // first align addresses to words
          if (local_addr[0]) begin
            spi_read_byte(use_qspi, local_addr, rdata_temp[7:0]);
            buffer[i] = rdata_temp[7:0];
            i          += 1;
            local_addr += 1;
            local_size -= 1;
          end

          if (local_addr[1] && local_size >= 2) begin
            spi_read_halfword(use_qspi, local_addr, rdata_temp[15:0]);
            buffer[i]   = rdata_temp[ 7:0];
            buffer[i+1] = rdata_temp[15:8];
            i          += 2;
            local_addr += 2;
            local_size -= 2;
          end

          // now main loop, always aligned
          // Done in one single burst
          rdata_temp_arr = new[local_size/4];
          spi_read_nword(use_qspi, local_addr, local_size/4, rdata_temp_arr);
          for (j = 0; j < local_size/4; j++) begin
            buffer[i]   = rdata_temp_arr[j][ 7:0];
            buffer[i+1] = rdata_temp_arr[j][15:8];
            buffer[i+2] = rdata_temp_arr[j][23:16];
            buffer[i+3] = rdata_temp_arr[j][31:24];
            i += 4;
          end
          local_addr += (local_size/4) * 4;
          local_size -= (local_size/4) * 4;
          rdata_temp_arr.delete();

          // now take care of the last max 3 bytes
          if (local_size >= 2) begin
            spi_read_halfword(use_qspi, local_addr, rdata_temp[15:0]);
            buffer[i]   = rdata_temp[ 7:0];
            buffer[i+1] = rdata_temp[15:8];
            i          += 2;
            local_addr += 2;
            local_size -= 2;
          end

          if (local_size >= 1) begin
            spi_read_byte(use_qspi, local_addr, rdata_temp[7:0]);
            buffer[i] = rdata_temp[7:0];
            i          += 1;
            local_addr += 1;
            local_size -= 1;
          end
        end

        if (mem_push(packet, buffer) != 0)
          $display("mem_push has failed");
      end
    end
  end
endtask
