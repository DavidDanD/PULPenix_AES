
# ------------------------------------------------------------------------------------

# if you personalize this file make your own personal copy with different file name and DONT push back to repository

# Modify only this if working a a different space
# setenv MY_PULP_ENV  /users/epakmp/Workarea/pulp/pulpenix
setenv MY_PULP_ENV  /users/epakmp/Workarea/pulp/pulpenix

# Modify this only if GCC toolchain is located elsewhere
# setenv RISCV_PULP_TOOLCHAIN_ROOT <MY_WORK_SPACE_PATH>/pulp/toolchain
setenv RISCV_PULP_TOOLCHAIN_ROOT /users/epakmp/Workarea/pulp/toolchain

# Modify this only if ECLIPSE toolchain is located elsewhere
setenv ECLIPSE_ROOT $RISCV_PULP_TOOLCHAIN_ROOT/eclipse


# ------------------------------------------------------------------------------------

# NEVER MODIFY !

  
setenv RISCV_GCC_BIN $RISCV_PULP_TOOLCHAIN_ROOT/gnu-mcu-eclipse/7.2.0-2-20180111-2230/bin/
  
setenv MY_PULP_APPS            $MY_PULP_ENV/apps  
setenv RISCV_PULP_LIBS         $MY_PULP_APPS/libs
setenv RISCV_PULP_SW_UTILS     $MY_PULP_APPS/sw_utils
setenv RISCV_PULP_SW_APPS_REF  $MY_PULP_APPS/ref
setenv RISCV_PULP_GDB_UTIL     $MY_PULP_APPS/gdb
setenv MY_PULP_IRUN            $MY_PULP_ENV/sim/irun

setenv MY_PULP_SIM  $MY_PULP_ENV/sim

alias pulp_irun                "irun -sv -v93 -I$MY_PULP_ENV/src/tb/mem_dpi/ -access rw +TB=tb +MEMLOAD="PRELOAD" -f pulpino_tb.f -delay_trigger"
alias pulp_irun_probe          "pulp_irun -input probe_all.tcl"
alias pulp_irun_trace          "pulp_irun +define+DO_TRACE=1 -input run.tcl"
alias pulp_irun_gdb            "pulp_irun -defparam tb.TEST=MEM_DPI -input run_gdb.tcl"
alias pulp_irun_gdb_with_probe "pulp_irun -defparam tb.TEST=MEM_DPI -input run_gdb_with_probe.tcl"
alias pulp_terminal_gdb        "$RISCV_GCC_BIN/riscv-none-embed-gdb"
alias pulp_eclipse             "$ECLIPSE_ROOT/eclipse -data $MY_PULP_ENV/apps/eclipse_ws &"

alias pulp_comp_app_noopt      "$RISCV_PULP_SW_UTILS/comp_app_noopt.sh"
alias pulp_get_app             "$RISCV_PULP_SW_UTILS/pulp_get_app.sh"
alias our_pulp_run 	       "~/Workarea/pulp/pulpenix/misc/scripts/pulpenix_compile"
alias our_wave_trace	       "~/Workarea/pulp/pulpenix/misc/scripts/pulpenix_wave_trace_sorter"
alias our_pulp_compile    "~/Workarea/pulp/pulpenix/misc/scripts/pulpenix_compile_only"
   

