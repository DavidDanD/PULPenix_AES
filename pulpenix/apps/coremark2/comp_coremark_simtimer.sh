
# Compile C source

echo "Compiling coremark"


$RISCV_GCC_BIN/riscv-none-embed-gcc -O3 -march=rv32im -mabi=ilp32 \
-S  -ggdb  -Wextra -Wall  \
-Wno-unused-parameter -Wno-unused-variable -Wno-unused-function \
-fdata-sections -ffunction-sections -fdiagnostics-color=always \
-I$RISCV_PULP_LIBS/sys_lib/inc \
-I$RISCV_PULP_LIBS/string_lib/inc \
-I$RISCV_PULP_LIBS/bench_lib/inc \
-I$RISCV_PULP_LIBS/iosim_lib/inc \
core_list_join.c core_main.c core_matrix.c core_state.c core_util.c core_portme_simtimer.c cvt.c ee_printf_pulpino.c \
-DPERFORMANCE_RUN=1 -DITERATIONS=1 -DHAS_FLOAT=1

# Link 

 $RISCV_GCC_BIN/riscv-none-embed-gcc -march=rv32im -mabi=ilp32 \
-O3 -ggdb -Wextra -Wall \
-Wno-unused-parameter -Wno-unused-variable -Wno-unused-function \
-fdata-sections -ffunction-sections -fdiagnostics-color=always  \
-I$RISCV_PULP_LIBS/sys_lib/inc \
-L$RISCV_PULP_SW_APPS_REF \
-T$RISCV_PULP_SW_APPS_REF/link.riscv.ld -nostartfiles -Wl,--gc-sections \
-D__riscv__ \
core_list_join.s core_main.s core_matrix.s core_state.s core_util.s core_portme_simtimer.s cvt.s ee_printf_pulpino.s \
../libs/bench_lib/bench.c.s \
../libs/string_lib/qprintf.c.s \
../libs/sys_lib/exceptions.c.s \
../libs/sys_lib/gpio.c.s \
../libs/sys_lib/i2c.c.s \
../libs/sys_lib/int.c.s \
../libs/sys_lib/spi.c.s \
../libs/sys_lib/uart.c.s \
../libs/sys_lib/utils.c.s \
$RISCV_PULP_SW_APPS_REF/crt0.riscv.tmp_no_eret.S  \
 -o coremark.elf 


# dump object in text

$RISCV_GCC_BIN/riscv-none-embed-objdump -d coremark.elf > coremark.elf_read
 
# Convert 

$RISCV_GCC_BIN/riscv-none-embed-objcopy --srec-len 1 --output-target=srec coremark.elf coremark.s19

$RISCV_PULP_SW_UTILS//s19toslm.py ./coremark.s19
 
\cp *.slm          $MY_PULP_SIM/irun/slm_files/
\cp spi_stim.txt   $MY_PULP_SIM/irun/slm_files/
 
 
 