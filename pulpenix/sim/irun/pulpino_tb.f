
// Includes 

+incdir+../../src/tb/
+incdir+../../src/soc/includes/
+incdir+../../src/ips/riscv/include/
+incdir+../../src/ips/adv_dbg_if/rtl/
+incdir+../../src/ips/apb/apb_event_unit/include/
+incdir+../../src/ips/apb/apb_i2c/
+incdir+../../src/ips/axi/axi_node/
+incdir+../../src/tb/mem_dpi/

timescale.v

// TB sources

../../src/tb/i2c_eeprom_model.sv
../../src/tb/if_spi_master.sv
../../src/tb/if_spi_slave.sv

../../src/tb/pkg_spi.sv

../../src/tb/mem_dpi/mem_dpi.c

../../src/tb/uart.sv
../../src/soc/apb_mock_uart.sv  // ??????????? check if needed

../../src/tb/gpio_iosim/gpio_iosim_bridge.v 
../../src/tb/gpio_iosim/iosim.v

../../src/tb/tb_gpp.sv 
../../src/tb/tb.sv 

// AXI mem interface

// ../soc/axi_mem_if_DP-master/axi_mem_if_DP_hybr.sv
// ../soc/axi_mem_if_DP-master/axi_mem_if_DP.sv
// ../soc/axi_mem_if_DP-master/axi_mem_if_SP.sv
// ../soc/axi_mem_if_DP-master/axi_read_only_ctrl.sv
// ../soc/axi_mem_if_DP-master/axi_write_only_ctrl.sv

// AXI slice master

../../src/ips/axi/axi_slice/axi_ar_buffer.sv
../../src/ips/axi/axi_slice/axi_aw_buffer.sv
../../src/ips/axi/axi_slice/axi_b_buffer.sv
../../src/ips/axi/axi_slice/axi_buffer.sv
../../src/ips/axi/axi_slice/axi_r_buffer.sv
../../src/ips/axi/axi_slice/axi_slice.sv
../../src/ips/axi/axi_slice/axi_w_buffer.sv

// axi slice dc

../../src/ips/axi/axi_slice_dc/axi_slice_dc_master.sv
../../src/ips/axi/axi_slice_dc/axi_slice_dc_slave.sv
../../src/ips/axi/axi_slice_dc/dc_data_buffer.v
../../src/ips/axi/axi_slice_dc/dc_full_detector.v
../../src/ips/axi/axi_slice_dc/dc_synchronizer.v
../../src/ips/axi/axi_slice_dc/dc_token_ring_fifo_din.v
../../src/ips/axi/axi_slice_dc/dc_token_ring_fifo_dout.v
../../src/ips/axi/axi_slice_dc/dc_token_ring.v

// axi-spi-slave

../../src/ips/axi/axi_spi_slave/axi_spi_slave.sv
../../src/ips/axi/axi_spi_slave/spi_slave_axi_plug.sv
../../src/ips/axi/axi_spi_slave/spi_slave_cmd_parser.sv
../../src/ips/axi/axi_spi_slave/spi_slave_controller.sv
../../src/ips/axi/axi_spi_slave/spi_slave_dc_fifo.sv
../../src/ips/axi/axi_spi_slave/spi_slave_regs.sv
../../src/ips/axi/axi_spi_slave/spi_slave_rx.sv
../../src/ips/axi/axi_spi_slave/spi_slave_syncro.sv
../../src/ips/axi/axi_spi_slave/spi_slave_tx.sv

// axi-spi-master

../../src/ips/axi/axi_spi_master/axi_spi_master.sv
../../src/ips/axi/axi_spi_master/spi_master_axi_if.sv
../../src/ips/axi/axi_spi_master/spi_master_clkgen.sv
../../src/ips/axi/axi_spi_master/spi_master_controller.sv
../../src/ips/axi/axi_spi_master/spi_master_fifo.sv
../../src/ips/axi/axi_spi_master/spi_master_rx.sv
../../src/ips/axi/axi_spi_master/spi_master_tx.sv

// axi node

../../src/ips/axi/axi_node/apb_regs_top.sv
../../src/ips/axi/axi_node/axi_address_decoder_AR.sv
../../src/ips/axi/axi_node/axi_address_decoder_AW.sv
../../src/ips/axi/axi_node/axi_address_decoder_BR.sv
../../src/ips/axi/axi_node/axi_address_decoder_BW.sv
../../src/ips/axi/axi_node/axi_address_decoder_DW.sv
../../src/ips/axi/axi_node/axi_AR_allocator.sv
../../src/ips/axi/axi_node/axi_ArbitrationTree.sv
../../src/ips/axi/axi_node/axi_AW_allocator.sv
../../src/ips/axi/axi_node/axi_BR_allocator.sv
../../src/ips/axi/axi_node/axi_BW_allocator.sv
../../src/ips/axi/axi_node/axi_DW_allocator.sv
../../src/ips/axi/axi_node/axi_FanInPrimitive_Req.sv
../../src/ips/axi/axi_node/axi_multiplexer.sv
../../src/ips/axi/axi_node/axi_node.sv
../../src/ips/axi/axi_node/axi_regs_top.sv
../../src/ips/axi/axi_node/axi_request_block.sv
../../src/ips/axi/axi_node/axi_response_block.sv
../../src/ips/axi/axi_node/axi_RR_Flag_Req.sv


// axi_mem_if

../../src/ips/adv_dbg_if/rtl/adbg_axi_defines.v

../../src/soc/axi_mem_if_SP_wrap.sv

../../src/ips/axi/axi_mem_if_DP/axi_mem_if_DP_hybr.sv
../../src/ips/axi/axi_mem_if_DP/axi_mem_if_DP.sv

../../src/ips/axi/axi_mem_if_DP/axi_mem_if_SP.sv
../../src/ips/axi/axi_mem_if_DP/axi_read_only_ctrl.sv
../../src/ips/axi/axi_mem_if_DP/axi_write_only_ctrl.sv

// ../../src/ips/axi/axi_mem_if_DP/axi_mem_if_multi_bank.sv
// ../../src/ips/axi/axi_mem_if_DP/axi_mem_if_MP_Hybrid_multi_bank.sv
// ../../src/ips/axi/axi_mem_if_DP/tb_axi_DP.sv
// ../../src/ips/axi/axi_mem_if_DP/tb_axi_read_only.sv
// ../../src/ips/axi/axi_mem_if_DP/tb_axi_write_only.sv

// axi2apb

../../src/ips/axi/axi2apb/axi2apb32.sv
../../src/ips/axi/axi2apb/AXI_2_APB_32.sv
../../src/ips/axi/axi2apb/axi2apb.sv
../../src/ips/axi/axi2apb/AXI_2_APB.sv

// apb

../../src/ips/apb/apb_node/apb_node.sv
../../src/ips/apb/apb_node/apb_node_wrap.sv

// apb uart

../../src/ips/apb/apb_uart_sv/apb_uart.sv
../../src/ips/apb/apb_uart_sv/uart_interrupt.sv
../../src/ips/apb/apb_uart_sv/uart_rx.sv
../../src/ips/apb/apb_uart_sv/uart_tx.sv
../../src/ips/apb/apb_uart_sv/io_generic_fifo.sv

// ../../src/rtl/components/generic_fifo.sv // ???????????? Needed

// apb gpio

../../src/ips/apb/apb_gpio/apb_gpio.sv

// apb timer

../../src/ips/apb/apb_timer/apb_timer.sv
../../src/ips/apb/apb_timer/timer.sv

// apb i2c

../../src/ips/apb/apb_i2c/apb_i2c.sv
../../src/ips/apb/apb_i2c/i2c_master_bit_ctrl.sv
../../src/ips/apb/apb_i2c/i2c_master_byte_ctrl.sv

// apb event 

../../src/ips/apb/apb_event_unit/apb_event_unit.sv
../../src/ips/apb/apb_event_unit/generic_service_unit.sv
../../src/ips/apb/apb_event_unit/sleep_unit.sv


// apb spi master

../../src/ips/apb/apb_spi_master/apb_spi_master.sv
../../src/ips/apb/apb_spi_master/spi_master_apb_if.sv

// gpp
// TO_BE_LISTED

// apb misc

../../src/ips/apb/apb_pulpino/apb_pulpino.sv
../../src/ips/apb/apb2per/apb2per.sv

// SOC misc. sources

../../src/ips/axi/core2axi/core2axi.sv

../../src/soc/axi2apb_wrap.sv
../../src/soc/axi_mem_if_SP_wrap.sv
../../src/soc/axi_node_intf_wrap.sv
../../src/soc/axi_slice_wrap.sv
../../src/soc/axi_spi_slave_wrap.sv
../../src/soc/boot_code.sv
../../src/soc/boot_rom_wrap.sv
../../src/soc/clk_rst_gen.sv
../../src/soc/core2axi_wrap.sv
../../src/soc/core_region.sv
../../src/soc/dp_ram_wrap.sv
../../src/soc/instr_ram_wrap.sv
../../src/soc/periph_bus_wrap.sv
../../src/soc/peripherals.sv
../../src/soc/ram_mux.sv
../../src/soc/sp_ram_wrap.sv

../../src/soc/top.sv


// Components

../../src/soc/components/cluster_clock_gating.sv
../../src/soc/components/cluster_clock_inverter.sv
../../src/soc/components/cluster_clock_mux2.sv
../../src/soc/components/dp_ram.sv
../../src/soc/components/generic_fifo.sv
../../src/soc/components/pulp_clock_inverter.sv
../../src/soc/components/pulp_clock_mux2.sv
../../src/soc/components/rstgen.sv
../../src/soc/components/sp_ram.sv

// riscv core

../../src/ips/riscv/include/riscv_defines.sv
../../src/ips/riscv/include/riscv_tracer_defines.sv
../../src/ips/riscv/include/apu_core_package.sv
../../src/ips/riscv/include/apu_macros.sv

../../src/ips/riscv/riscv_alu_div.sv
../../src/ips/riscv/riscv_alu.sv
../../src/ips/riscv/riscv_compressed_decoder.sv
../../src/ips/riscv/riscv_controller.sv
../../src/ips/riscv/riscv_custom.sv        //akmp adding custom component 
../../src/ips/riscv/riscv_cs_registers.sv
../../src/ips/riscv/riscv_debug_unit.sv
../../src/ips/riscv/riscv_decoder.sv
../../src/ips/riscv/riscv_int_controller.sv
../../src/ips/riscv/riscv_ex_stage.sv
../../src/ips/riscv/riscv_hwloop_controller.sv
../../src/ips/riscv/riscv_hwloop_regs.sv
../../src/ips/riscv/riscv_id_stage.sv
../../src/ips/riscv/riscv_if_stage.sv
../../src/ips/riscv/riscv_load_store_unit.sv
../../src/ips/riscv/riscv_mult.sv
../../src/ips/riscv/riscv_prefetch_buffer.sv
../../src/ips/riscv/riscv_prefetch_L0_buffer.sv
../../src/ips/riscv/riscv_register_file.sv 
../../src/ips/riscv/riscv_core.sv
../../src/ips/riscv/riscv_tracer.sv
../../src/ips/riscv/riscv_fetch_fifo.sv

// adv. dbg

../../src/ips/adv_dbg_if/rtl/adbg_or1k_biu.sv
../../src/ips/adv_dbg_if/rtl/adbg_or1k_defines.v
../../src/ips/adv_dbg_if/rtl/adbg_or1k_module.sv
../../src/ips/adv_dbg_if/rtl/adbg_or1k_status_reg.sv

../../src/ips/adv_dbg_if/rtl/adbg_axi_biu.sv
../../src/ips/adv_dbg_if/rtl/adbg_axi_defines.v
../../src/ips/adv_dbg_if/rtl/adbg_axi_module.sv
../../src/ips/adv_dbg_if/rtl/adbg_axionly_top.sv
../../src/ips/adv_dbg_if/rtl/adbg_crc32.v
../../src/ips/adv_dbg_if/rtl/adbg_defines.v
../../src/ips/adv_dbg_if/rtl/adbg_tap_top.v
../../src/ips/adv_dbg_if/rtl/adbg_top.sv
../../src/ips/adv_dbg_if/rtl/adv_dbg_if.sv
../../src/ips/adv_dbg_if/rtl/bytefifo.v
../../src/ips/adv_dbg_if/rtl/syncflop.v
../../src/ips/adv_dbg_if/rtl/syncreg.v
 
