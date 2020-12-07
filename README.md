# PULPenix AES on RISC-V

This repository contains the PULPenix AES on RISC-V design RTL.

## Directory Structure

    ├── pulpenix               	#
    │   ├── apps                #   Example apps 
    │   ├── misc             	#	Scripts and configuration files
    │   ├── sim					#	Simulation outputs
    │   └── src           		#	Source files
    └── Documentation           #

## Quickstart guide

### Configurations
1.	Go to your Workarea, and run:
		>mkdir pulp
2.	Download the PULPenix AES project from Github, and unzip in the “pulp” directory:
		>unzip PULPenix_AES-master -d .pulp/
		>mv pulp/PULPenix_AES-master ./pulp/
		>rm -r pulp/PULPenix_AES-master
3.	Add GCC for RISCV to “pulp” directory:
	a.	Run:
			>mkdir toolchain
			>cd toolchain
	b.	Download and un-tar GCC for RISCV into the “toolchain” directory. 
	c.	Run from inside “toolchain” directory:
			>mv gnu-mcu-eclipse/riscv-none-gcc/7.2.0-2-20180111-2230 gnu-mcu-eclipse/
			>rm -r gnu-mcu-eclipse/riscv-none-gcc
4.	There are some shortcut scripts and environment settings that necessary in order to work efficiently with PULPenix.
	Updating the PULPenix setup script:
	a.	Open <path_to_pulp>\pulp\pulpenix\misc\genpro_pulpenix_setup.sh
	b.	Replace in lines 8,12 "/users/$USER/Workarea/pulp" with the path to pulp directroy.
	Running PULPenix setup:
		>source <path_to_pulp>/pulp/pulpenix/misc/genpro_pulpenix_setup.sh
	
	Consider adding the above line to your .cshrc (in order it to run on startup).
	Then you will have the PULPenix commands and scripts available, you can see those at:
		<path_to_pulp>/pulp/pulpenix/misc/scripts
		<path_to_pulp>/pulp/pulpenix/apps/sw_utils

### Synthesis
To run the synthesis and create a “fresh” copy of PULPenix, you can use the “shortcut” script (synthesis via dc_shell):
	>our_pulp_synthesis
The technology we used is Tower 0.18 [μm], with 10 [nSec] clock (100 [mHz]) and a 50% duty cycle.
If an error message occurs, you’ll need to do a full manual synthesis.
Synthesis with dc_shell:
	Go to RISCV folder by typing:
		>cd $RISCV_DIR
	Copy the library files using the command:
		>cp -r /users/iit/synopsys/tsl018_20178_syn design_syn
	Type in your terminal the following commands:
		>cd $RISCV_DESIGN_SYN
		>dc_shell
		>start_gui
	In the GUI that opened, go to the upper left corner and click:
		File -> Analyze -> Add
	and add:
		riscv_defines
		riscv_config
		apu_macros
		apu_core_package
	If the last step gives you errors, it’s probably because of the files themselves including each other, so try adding them one by one in that order.
	Click:
		File -> Analyse -> Add
	And add everything under the “riscv” folder, except the files mentioned above, the “riscv_tracer” files, and “riscv_register_file_latch”.
	Click:
		File -> Analyse -> Add
	and add everything under the “aes” folder.
	Click:
		File - > Elaborate
	Choose the library to be WORK and the top-level module to be “riscv_core”
	Specify a clock:
	In the hierarchy pane, click on the hierarchy drop-down menu and filter by “pins/ports”, and click on your clock-signal (clk_i).
	In the upper bar of the GUI, click:
		attributes->specify clock.
	We specified the clock to be – 10 [ns] (frequency of 100 [MHz]), and symmetrical.
	In the upper bar click:
		Design -> Compile Design
	After compilation click:
		File->Save As <name>,  then click: Open 
	To open:
		File -> Read <name>
	In the logical hierarchy pane, right-click on the top-level module and select Schematic View. Then, you’ll be able to watch the synthesized file at the gate level. 


### Compilation and Simulation
Running a simulation:
	1.	Create a folder under pulp/pulpenix/apps with your program (source code, .c files)
	2.	Compile your program:
			cd $MY_PULP_APPS/<progname>
			our_pulp_compile <progname>
		This step converts the AES commands to .word commands (by using AES compiler, converts into the hexadecimal base), creates .s files (assembly files), .elf files (Executable Linkable Format), and .slm files (memory initialization files) out of your source files.
		If the compilation fails, check your code for errors and run again.
	3.	Get your app:
			> cd $MY_PULP_IRUN
			> pulp_get_app <progname>
		this step copies your .slm files to the irun folder.
	4.	Run:
			You have three main options for running your program:
				a.	running with wave form:
						> pulp_irun_probe
					The waves file will be created in $MY_PULP_IRUN/waves.shm folder.
				b.	running with trace:
						> pulp_irun_trace
					The trace file will be named “trace_core_00_0.log” inside $MY_PULP_IRUN folder.
				c.	running with trace and probe:
						> pulp_irun_probe_trace
			There is a shortcut script that runs steps 2,3 and 4.c:
				> our_pulp_run <progname>
			The waves file will be saved as:
				$MY_PULP_APPS/waves/<name>.shm
			The trace file will be saved as:
				$MY_PULP_IRUN/trace_core_00_0.log
				
### AES test
You can run the AES verification test:
	>our_pulp_aes_verification
The test compares AES cyphering on tree methods:
	1.	AES on RISC AES flow.
	2.	AES implemented in C and running on the RISC-V CORE (not using the dedicated AES blocks).
	3.	AES implemeted on python and running on the operating system.
The results of the test will be printed on the screen.
If one of the methods returned with different cyphered text that the others, the test will failed, and print on the screen the three cyphered text from the 3 methods.