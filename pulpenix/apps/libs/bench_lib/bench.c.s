	.file	"bench.c"
	.option nopic
	.section	.text.bench_timer_start,"ax",@progbits
	.align	2
	.globl	bench_timer_start
	.type	bench_timer_start, @function
bench_timer_start:
	addi	sp,sp,-16
	li	a1,1
	li	a0,0
	sw	ra,12(sp)
	call	set_gpio_pin_value
	lw	ra,12(sp)
	addi	sp,sp,16
	tail	start_timer
	.size	bench_timer_start, .-bench_timer_start
	.section	.text.bench_timer_stop,"ax",@progbits
	.align	2
	.globl	bench_timer_stop
	.type	bench_timer_stop, @function
bench_timer_stop:
	addi	sp,sp,-16
	sw	ra,12(sp)
	call	stop_timer
	lw	ra,12(sp)
	li	a1,0
	li	a0,0
	addi	sp,sp,16
	tail	set_gpio_pin_value
	.size	bench_timer_stop, .-bench_timer_stop
	.section	.text.bench_timer_reset,"ax",@progbits
	.align	2
	.globl	bench_timer_reset
	.type	bench_timer_reset, @function
bench_timer_reset:
	tail	reset_timer
	.size	bench_timer_reset, .-bench_timer_reset
	.section	.text.print_result,"ax",@progbits
	.align	2
	.globl	print_result
	.type	print_result, @function
print_result:
	addi	sp,sp,-16
	sw	s0,8(sp)
	mv	s0,a1
	lw	a1,0(a0)
	lui	a0,%hi(.LC0)
	addi	a0,a0,%lo(.LC0)
	sw	ra,12(sp)
	call	printf
	lw	a5,4(s0)
	bnez	a5,.L8
	lui	a0,%hi(.LC1)
	addi	a0,a0,%lo(.LC1)
	call	printf
	lw	a1,4(s0)
	lui	a0,%hi(.LC3)
	addi	a0,a0,%lo(.LC3)
	call	printf
	lw	a1,0(s0)
	beqz	a1,.L12
.L10:
	lw	s0,8(sp)
	lw	ra,12(sp)
	lui	a0,%hi(.LC4)
	addi	a0,a0,%lo(.LC4)
	addi	sp,sp,16
	tail	printf
.L8:
	lui	a0,%hi(.LC2)
	addi	a0,a0,%lo(.LC2)
	call	printf
	lw	a1,4(s0)
	lui	a0,%hi(.LC3)
	addi	a0,a0,%lo(.LC3)
	call	printf
	lw	a1,0(s0)
	bnez	a1,.L10
.L12:
	lw	s0,8(sp)
	lw	ra,12(sp)
	li	a0,10
	addi	sp,sp,16
	tail	putchar
	.size	print_result, .-print_result
	.section	.text.print_summary,"ax",@progbits
	.align	2
	.globl	print_summary
	.type	print_summary, @function
print_summary:
	addi	sp,sp,-16
	sw	s0,8(sp)
	mv	s0,a0
	lui	a0,%hi(.LC5)
	addi	a0,a0,%lo(.LC5)
	sw	ra,12(sp)
	call	printf
	beqz	s0,.L17
	lw	s0,8(sp)
	lw	ra,12(sp)
	lui	a0,%hi(.LC7)
	addi	a0,a0,%lo(.LC7)
	addi	sp,sp,16
	tail	puts
.L17:
	lw	s0,8(sp)
	lw	ra,12(sp)
	lui	a0,%hi(.LC6)
	addi	a0,a0,%lo(.LC6)
	addi	sp,sp,16
	tail	puts
	.size	print_summary, .-print_summary
	.section	.text.run_benchmark,"ax",@progbits
	.align	2
	.globl	run_benchmark
	.type	run_benchmark, @function
run_benchmark:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	mv	s0,a1
	mv	s1,a0
	li	a1,0
	li	a0,0
	sw	ra,12(sp)
	call	set_gpio_pin_value
	li	a1,1
	li	a0,0
	call	set_gpio_pin_direction
	li	a1,1
	li	a0,0
	call	set_pin_function
	sw	zero,4(s0)
	call	reset_timer
	lw	a5,4(s1)
	lui	a2,%hi(bench_timer_stop)
	lui	a1,%hi(bench_timer_start)
	mv	a0,s0
	addi	a2,a2,%lo(bench_timer_stop)
	addi	a1,a1,%lo(bench_timer_start)
	jalr	a5
	call	get_time
	sw	a0,0(s0)
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
	.size	run_benchmark, .-run_benchmark
	.section	.text.run_suite,"ax",@progbits
	.align	2
	.globl	run_suite
	.type	run_suite, @function
run_suite:
	lw	a5,0(a0)
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	sw	s1,52(sp)
	sw	s2,48(sp)
	sw	s3,44(sp)
	sw	s4,40(sp)
	sw	s5,36(sp)
	sw	s6,32(sp)
	sw	s7,28(sp)
	sw	s8,24(sp)
	sw	s9,20(sp)
	beqz	a5,.L21
	addi	a5,a0,8
	li	a4,0
.L22:
	addi	a5,a5,8
	lw	a3,-8(a5)
	addi	a4,a4,1
	bnez	a3,.L22
	slli	a4,a4,3
	mv	s0,a0
	add	s1,a0,a4
	li	s2,0
	lui	s8,%hi(bench_timer_stop)
	lui	s7,%hi(bench_timer_start)
	lui	s6,%hi(.LC0)
	lui	s5,%hi(.LC3)
	lui	s9,%hi(.LC2)
	lui	s4,%hi(.LC1)
	lui	s3,%hi(.LC4)
.L23:
	li	a1,0
	li	a0,0
	call	set_gpio_pin_value
	li	a1,1
	li	a0,0
	call	set_gpio_pin_direction
	li	a1,1
	li	a0,0
	call	set_pin_function
	sw	zero,12(sp)
	call	reset_timer
	lw	a5,4(s0)
	addi	a2,s8,%lo(bench_timer_stop)
	addi	a1,s7,%lo(bench_timer_start)
	addi	a0,sp,8
	jalr	a5
	call	get_time
	lw	a1,0(s0)
	sw	a0,8(sp)
	addi	a0,s6,%lo(.LC0)
	call	printf
	lw	a5,12(sp)
	addi	a0,s4,%lo(.LC1)
	beqz	a5,.L34
	addi	a0,s9,%lo(.LC2)
.L34:
	call	printf
	lw	a1,12(sp)
	addi	a0,s5,%lo(.LC3)
	call	printf
	lw	a5,8(sp)
	addi	a0,s3,%lo(.LC4)
	mv	a1,a5
	beqz	a5,.L35
	call	printf
	lw	a5,12(sp)
	addi	s0,s0,8
	add	s2,s2,a5
	bne	s0,s1,.L23
	lui	a0,%hi(.LC5)
	addi	a0,a0,%lo(.LC5)
	call	printf
	beqz	s2,.L29
.L30:
	lui	a0,%hi(.LC7)
	addi	a0,a0,%lo(.LC7)
	call	puts
.L20:
	lw	ra,60(sp)
	lw	s0,56(sp)
	mv	a0,s2
	lw	s1,52(sp)
	lw	s2,48(sp)
	lw	s3,44(sp)
	lw	s4,40(sp)
	lw	s5,36(sp)
	lw	s6,32(sp)
	lw	s7,28(sp)
	lw	s8,24(sp)
	lw	s9,20(sp)
	addi	sp,sp,64
	jr	ra
.L35:
	li	a0,10
	call	putchar
	lw	a5,12(sp)
	addi	s0,s0,8
	add	s2,s2,a5
	bne	s1,s0,.L23
	lui	a0,%hi(.LC5)
	addi	a0,a0,%lo(.LC5)
	call	printf
	bnez	s2,.L30
.L29:
	lui	a0,%hi(.LC6)
	addi	a0,a0,%lo(.LC6)
	call	puts
	li	s2,0
	j	.L20
.L21:
	lui	a0,%hi(.LC5)
	addi	a0,a0,%lo(.LC5)
	call	printf
	lui	a0,%hi(.LC6)
	addi	a0,a0,%lo(.LC6)
	call	puts
	li	s2,0
	j	.L20
	.size	run_suite, .-run_suite
	.section	.text.check_uint32,"ax",@progbits
	.align	2
	.globl	check_uint32
	.type	check_uint32, @function
check_uint32:
	mv	a4,a0
	beq	a2,a3,.L36
	lw	a5,4(a0)
	lui	a0,%hi(.LC8)
	addi	a0,a0,%lo(.LC8)
	addi	a5,a5,1
	sw	a5,4(a4)
	tail	printf
.L36:
	ret
	.size	check_uint32, .-check_uint32
	.section	.text.perf_print_all,"ax",@progbits
	.align	2
	.globl	perf_print_all
	.type	perf_print_all, @function
perf_print_all:
	addi	sp,sp,-16
	li	a0,0
	sw	ra,12(sp)
	call	cpu_perf_get
	mv	a1,a0
	lui	a0,%hi(.LC9)
	addi	a0,a0,%lo(.LC9)
	call	printf
	li	a0,1
	call	cpu_perf_get
	mv	a1,a0
	lui	a0,%hi(.LC10)
	addi	a0,a0,%lo(.LC10)
	call	printf
	li	a0,10
	call	cpu_perf_get
	mv	a1,a0
	lui	a0,%hi(.LC11)
	addi	a0,a0,%lo(.LC11)
	call	printf
	li	a0,2
	call	cpu_perf_get
	mv	a1,a0
	lui	a0,%hi(.LC12)
	addi	a0,a0,%lo(.LC12)
	call	printf
	li	a0,3
	call	cpu_perf_get
	mv	a1,a0
	lui	a0,%hi(.LC13)
	addi	a0,a0,%lo(.LC13)
	call	printf
	li	a0,4
	call	cpu_perf_get
	mv	a1,a0
	lui	a0,%hi(.LC14)
	addi	a0,a0,%lo(.LC14)
	call	printf
	li	a0,5
	call	cpu_perf_get
	mv	a1,a0
	lui	a0,%hi(.LC15)
	addi	a0,a0,%lo(.LC15)
	call	printf
	li	a0,6
	call	cpu_perf_get
	mv	a1,a0
	lui	a0,%hi(.LC16)
	addi	a0,a0,%lo(.LC16)
	call	printf
	li	a0,7
	call	cpu_perf_get
	mv	a1,a0
	lui	a0,%hi(.LC17)
	addi	a0,a0,%lo(.LC17)
	call	printf
	li	a0,8
	call	cpu_perf_get
	mv	a1,a0
	lui	a0,%hi(.LC18)
	addi	a0,a0,%lo(.LC18)
	call	printf
	li	a0,9
	call	cpu_perf_get
	mv	a1,a0
	lui	a0,%hi(.LC19)
	addi	a0,a0,%lo(.LC19)
	call	printf
	li	a0,10
	call	cpu_perf_get
	lw	ra,12(sp)
	mv	a1,a0
	lui	a0,%hi(.LC20)
	addi	a0,a0,%lo(.LC20)
	addi	sp,sp,16
	tail	printf
	.size	perf_print_all, .-perf_print_all
	.section	.text.illegal_insn_handler_c,"ax",@progbits
	.align	2
	.weak	illegal_insn_handler_c
	.type	illegal_insn_handler_c, @function
illegal_insn_handler_c:
 #APP
# 140 "src/bench.c" 1
	csrr a1, 0x341
# 0 "" 2
 #NO_APP
	lw	a2,0(a1)
	lui	a0,%hi(.LC21)
	addi	sp,sp,-16
	addi	a0,a0,%lo(.LC21)
	sw	ra,12(sp)
	call	printf
	li	a0,1
	call	exit
	.size	illegal_insn_handler_c, .-illegal_insn_handler_c
	.section	.rodata.check_uint32.str1.4,"aMS",@progbits,1
	.align	2
.LC8:
	.string	"%s: Actual %X, expected %X\n"
	.section	.rodata.illegal_insn_handler_c.str1.4,"aMS",@progbits,1
	.align	2
.LC21:
	.string	"Illegal instruction encountered at address 0x%08X: %X\n"
	.section	.rodata.perf_print_all.str1.4,"aMS",@progbits,1
	.align	2
.LC9:
	.string	"Perf CYCLES:   %d\n"
	.zero	1
.LC10:
	.string	"Perf INSN:     %d\n"
	.zero	1
.LC11:
	.string	"Perf CINSN:    %d\n"
	.zero	1
.LC12:
	.string	"Perf LD_STALL: %d\n"
	.zero	1
.LC13:
	.string	"Perf JR_STALL: %d\n"
	.zero	1
.LC14:
	.string	"Perf IMISS:    %d\n"
	.zero	1
.LC15:
	.string	"Perf #LD:      %d\n"
	.zero	1
.LC16:
	.string	"Perf #ST:      %d\n"
	.zero	1
.LC17:
	.string	"Perf #JUMP:    %d\n"
	.zero	1
.LC18:
	.string	"Perf #BRANCH:  %d\n"
	.zero	1
.LC19:
	.string	"Perf #TAKEN:   %d\n"
	.zero	1
.LC20:
	.string	"Perf #RVC:     %d\n"
	.section	.rodata.print_result.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"== test: %s -> "
.LC1:
	.string	"success, "
	.zero	2
.LC2:
	.string	"fail, "
	.zero	1
.LC3:
	.string	"nr. of errors: %d"
	.zero	2
.LC4:
	.string	", execution time: %d\n"
	.section	.rodata.print_summary.str1.4,"aMS",@progbits,1
	.align	2
.LC5:
	.string	"==== SUMMARY: "
	.zero	1
.LC6:
	.string	"SUCCESS"
.LC7:
	.string	"FAIL"
	.ident	"GCC: (GNU MCU Eclipse RISC-V Embedded GCC, 64-bits) 7.2.0"
