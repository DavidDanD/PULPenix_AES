database -open -event waves -into waves.shm -default
probe -create tb -depth all -tasks -functions -uvm -packed 16k -unpacked 64k -all -dynamic -memories -database waves
run
exec  $env(RISCV_PULP_GDB_UTIL)/debug_bridge-master/debug_bridge > debug_bridge.log 2>debug_bridge_err.log &
run
