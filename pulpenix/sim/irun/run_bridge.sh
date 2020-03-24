echo "Message from run_bridge.sh: starting debug_bridge process" > debug_bridge.log
$RISCV_PULP_GDB_UTIL/debug_bridge-master/debug_bridge >> debug_bridge.log  2>debug_bridge_err.log 

