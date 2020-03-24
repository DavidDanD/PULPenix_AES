
# Compile C source

echo "Compiling lib $1"

$RISCV_GCC_BIN/$RISCV_XX-gcc -O3 -march=rv32im -mabi=ilp32 \
-S  -Wextra -Wall  \
-Wno-unused-parameter -Wno-unused-variable -Wno-unused-function \
-fdata-sections -ffunction-sections -fdiagnostics-color=always \
-I$RISCV_PULP_LIBS/sys_lib/inc \
-I$RISCV_PULP_LIBS/string_lib/inc \
-I$RISCV_PULP_LIBS/bench_lib/inc \
-I$RISCV_PULP_LIBS/iosim_lib/inc \
-I$RISCV_PULP_LIBS/bm_printf_lib \
src/$1.c -o $1.c.s
