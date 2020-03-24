#set tcl_SOD $::env(SOD)   
#database -open -event waves -into $tcl_SOD/waves.shm -default
database -open -event waves -into waves.shm -default
probe -create tb -depth all -tasks -functions -uvm -packed 16k -unpacked 64k -all -dynamic -memories -database waves
run
