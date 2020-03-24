	.file	"timer.c"
	.option nopic
	.section	.text.reset_timer,"ax",@progbits
	.align	2
	.globl	reset_timer
	.type	reset_timer, @function
reset_timer:
	li	a5,437268480
	sw	zero,0(a5)
	ret
	.size	reset_timer, .-reset_timer
	.section	.text.start_timer,"ax",@progbits
	.align	2
	.globl	start_timer
	.type	start_timer, @function
start_timer:
	li	a5,437268480
	li	a4,1
	sw	a4,4(a5)
	ret
	.size	start_timer, .-start_timer
	.section	.text.stop_timer,"ax",@progbits
	.align	2
	.globl	stop_timer
	.type	stop_timer, @function
stop_timer:
	li	a5,437268480
	sw	zero,4(a5)
	ret
	.size	stop_timer, .-stop_timer
	.section	.text.get_time,"ax",@progbits
	.align	2
	.globl	get_time
	.type	get_time, @function
get_time:
	li	a5,437268480
	lw	a0,0(a5)
	ret
	.size	get_time, .-get_time
	.ident	"GCC: (GNU MCU Eclipse RISC-V Embedded GCC, 64-bits) 7.2.0"
