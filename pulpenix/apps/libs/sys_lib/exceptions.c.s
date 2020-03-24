	.file	"exceptions.c"
	.option nopic
	.section	.text.default_exception_handler_c,"ax",@progbits
	.align	2
	.weak	default_exception_handler_c
	.type	default_exception_handler_c, @function
default_exception_handler_c:
.L2:
	j	.L2
	.size	default_exception_handler_c, .-default_exception_handler_c
	.section	.text.illegal_insn_handler_c,"ax",@progbits
	.align	2
	.weak	illegal_insn_handler_c
	.type	illegal_insn_handler_c, @function
illegal_insn_handler_c:
.L5:
	j	.L5
	.size	illegal_insn_handler_c, .-illegal_insn_handler_c
	.ident	"GCC: (GNU MCU Eclipse RISC-V Embedded GCC, 64-bits) 7.2.0"
