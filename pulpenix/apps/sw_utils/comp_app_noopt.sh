
# Compile C source

echo "Compiling Application $1"


$RISCV_GCC_BIN/riscv-none-embed-gcc -ggdb -march=rv32im -mabi=ilp32  \
-S    -Wextra -Wall  \
-Wno-unused-parameter -Wno-unused-variable -Wno-unused-function \
-fdata-sections -ffunction-sections -fdiagnostics-color=always \
-I$RISCV_PULP_LIBS/sys_lib/inc \
-I$RISCV_PULP_LIBS/string_lib/inc \
-I$RISCV_PULP_LIBS/bench_lib/inc \
-I$RISCV_PULP_LIBS/iosim_lib/inc \
-I$RISCV_PULP_LIBS/bm_printf_lib \
-I./ ./$1.c -o $1.c.s

# Link


 $RISCV_GCC_BIN/riscv-none-embed-gcc -ggdb -march=rv32im -mabi=ilp32  \
  -Wextra -Wall \
-Wno-unused-parameter -Wno-unused-variable -Wno-unused-function \
-fdata-sections -ffunction-sections -fdiagnostics-color=always  \
-I$RISCV_PULP_LIBS/sys_lib/inc \
-I$RISCV_PULP_LIBS/bm_printf_lib \
-L$RISCV_PULP_SW_APPS_REF \
-T$RISCV_PULP_SW_APPS_REF/link.riscv.ld -nostartfiles -Wl,--gc-sections \
-D__riscv__ \
$1.c.s \
../ref/crt0.riscv.tmp_no_eret.S  \
../libs/bench_lib/bench.c.s \
../libs/string_lib/qprintf.c.s \
../libs/sys_lib/exceptions.c.s \
../libs/sys_lib/gpio.c.s \
../libs/sys_lib/i2c.c.s \
../libs/sys_lib/int.c.s \
../libs/sys_lib/spi.c.s \
../libs/sys_lib/timer.c.s \
../libs/sys_lib/uart.c.s \
../libs/sys_lib/utils.c.s \
$RISCV_PULP_LIBS/bm_printf_lib/bm_printf.c.s \
$RISCV_PULP_LIBS/iosim_lib/iosim.c.s \
-o $1.elf


 
# dump object in text


$RISCV_GCC_BIN/riscv-none-embed-objdump  -g -d $1.elf > $1.elf_read
 
# Convert 

$RISCV_GCC_BIN/riscv-none-embed-objcopy  --srec-len 1 --output-target=srec $1.elf $1.s19

$RISCV_PULP_SW_UTILS/s19toslm.py ./$1.s19
 
# \cp *.slm          $MY_PULP_MODELSIM/slm_files/
# \cp spi_stim.txt   $MY_PULP_MODELSIM/slm_files/
 
# \cp *.slm          $MY_PULP_IRUN/slm_files/
# \cp spi_stim.txt   $MY_PULP_IRUN/slm_files/
 
