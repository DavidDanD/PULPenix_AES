	.file	"utils.c"
	.option nopic
	.section	.text.eoc,"ax",@progbits
	.align	2
	.globl	eoc
	.type	eoc, @function
eoc:
	addi	sp,sp,-16
	sw	ra,12(sp)
	li	a5,437284864
	bnez	a0,.L6
	sw	zero,20(a5)
.L3:
	li	a4,437284864
	lw	a5,4(a4)
	li	a1,1
	li	a0,8
	ori	a5,a5,4
	sw	a5,4(a4)
	call	set_pin_function
	li	a1,1
	li	a0,8
	call	set_gpio_pin_direction
	lw	ra,12(sp)
	li	a1,1
	li	a0,8
	addi	sp,sp,16
	tail	set_gpio_pin_value
.L6:
	li	a4,1
	sw	a4,20(a5)
	j	.L3
	.size	eoc, .-eoc
	.section	.text.exit,"ax",@progbits
	.align	2
	.globl	exit
	.type	exit, @function
exit:
	addi	sp,sp,-16
	sw	ra,12(sp)
	call	eoc
.L8:
	j	.L8
	.size	exit, .-exit
	.section	.text.sleep_busy,"ax",@progbits
	.align	2
	.globl	sleep_busy
	.type	sleep_busy, @function
sleep_busy:
	addi	sp,sp,-16
	sw	a0,12(sp)
	lw	a5,12(sp)
	blez	a5,.L10
	li	a5,0
.L12:
 #APP
# 44 "src/utils.c" 1
	nop
# 0 "" 2
 #NO_APP
	lw	a4,12(sp)
	addi	a5,a5,1
	bgt	a4,a5,.L12
.L10:
	addi	sp,sp,16
	jr	ra
	.size	sleep_busy, .-sleep_busy
	.section	.text.cpu_perf_set,"ax",@progbits
	.align	2
	.globl	cpu_perf_set
	.type	cpu_perf_set, @function
cpu_perf_set:
	lui	a0,%hi(.LC0)
	addi	a0,a0,%lo(.LC0)
	tail	puts
	.size	cpu_perf_set, .-cpu_perf_set
	.section	.text.cpu_perf_get,"ax",@progbits
	.align	2
	.globl	cpu_perf_get
	.type	cpu_perf_get, @function
cpu_perf_get:
	li	a5,15
	bgtu	a0,a5,.L17
	lui	a1,%hi(.L19)
	slli	a0,a0,2
	addi	a1,a1,%lo(.L19)
	add	a0,a0,a1
	lw	a5,0(a0)
	jr	a5
	.section	.rodata.cpu_perf_get,"a",@progbits
	.align	2
	.align	2
.L19:
	.word	.L18
	.word	.L20
	.word	.L21
	.word	.L22
	.word	.L23
	.word	.L24
	.word	.L25
	.word	.L26
	.word	.L27
	.word	.L28
	.word	.L29
	.word	.L30
	.word	.L31
	.word	.L32
	.word	.L33
	.word	.L34
	.section	.text.cpu_perf_get
.L33:
 #APP
# 71 "src/utils.c" 1
	csrr a0, 0x78E
# 0 "" 2
 #NO_APP
	ret
.L34:
 #APP
# 72 "src/utils.c" 1
	csrr a0, 0x78F
# 0 "" 2
 #NO_APP
	ret
.L18:
 #APP
# 57 "src/utils.c" 1
	csrr a0, 0x780
# 0 "" 2
 #NO_APP
	ret
.L20:
 #APP
# 58 "src/utils.c" 1
	csrr a0, 0x781
# 0 "" 2
 #NO_APP
	ret
.L21:
 #APP
# 59 "src/utils.c" 1
	csrr a0, 0x782
# 0 "" 2
 #NO_APP
	ret
.L22:
 #APP
# 60 "src/utils.c" 1
	csrr a0, 0x783
# 0 "" 2
 #NO_APP
	ret
.L23:
 #APP
# 61 "src/utils.c" 1
	csrr a0, 0x784
# 0 "" 2
 #NO_APP
	ret
.L24:
 #APP
# 62 "src/utils.c" 1
	csrr a0, 0x785
# 0 "" 2
 #NO_APP
	ret
.L25:
 #APP
# 63 "src/utils.c" 1
	csrr a0, 0x786
# 0 "" 2
 #NO_APP
	ret
.L26:
 #APP
# 64 "src/utils.c" 1
	csrr a0, 0x787
# 0 "" 2
 #NO_APP
	ret
.L27:
 #APP
# 65 "src/utils.c" 1
	csrr a0, 0x788
# 0 "" 2
 #NO_APP
	ret
.L28:
 #APP
# 66 "src/utils.c" 1
	csrr a0, 0x789
# 0 "" 2
 #NO_APP
	ret
.L29:
 #APP
# 67 "src/utils.c" 1
	csrr a0, 0x78A
# 0 "" 2
 #NO_APP
	ret
.L30:
 #APP
# 68 "src/utils.c" 1
	csrr a0, 0x78B
# 0 "" 2
 #NO_APP
	ret
.L31:
 #APP
# 69 "src/utils.c" 1
	csrr a0, 0x78C
# 0 "" 2
 #NO_APP
	ret
.L32:
 #APP
# 70 "src/utils.c" 1
	csrr a0, 0x78D
# 0 "" 2
 #NO_APP
	ret
.L17:
	mv	a1,a0
	lui	a0,%hi(.LC1)
	addi	sp,sp,-16
	addi	a0,a0,%lo(.LC1)
	sw	ra,12(sp)
	call	printf
	lw	ra,12(sp)
	li	a0,0
	addi	sp,sp,16
	jr	ra
	.size	cpu_perf_get, .-cpu_perf_get
	.section	.rodata.cpu_perf_get.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"CSR %d not yet supported\n"
	.section	.rodata.cpu_perf_set.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"cpu_perf_set: not implemented yet"
	.ident	"GCC: (GNU MCU Eclipse RISC-V Embedded GCC, 64-bits) 7.2.0"
