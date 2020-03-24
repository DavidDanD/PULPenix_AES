run
puts "MESSAGE  FROM run_gdb.tcl : Starting background bridge process"
exec  ./run_bridge.sh &
puts "MESSAGE FROM run_gdb.tcl : Resuming simulation"
run

