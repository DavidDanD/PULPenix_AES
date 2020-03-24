	.file	"uart.c"
	.option nopic
	.section	.text.uart_set_cfg,"ax",@progbits
	.align	2
	.globl	uart_set_cfg
	.type	uart_set_cfg, @function
uart_set_cfg:
	li	a3,437284864
	lw	a4,4(a3)
	li	a5,437256192
	ori	a4,a4,2
	sw	a4,4(a3)
	li	a4,131
	sw	a4,12(a5)
	srli	a4,a1,8
	sw	a4,4(a5)
	andi	a1,a1,0xff
	sw	a1,0(a5)
	li	a4,167
	sw	a4,8(a5)
	li	a4,3
	sw	a4,12(a5)
	lw	a4,4(a5)
	andi	a4,a4,240
	ori	a4,a4,2
	sw	a4,4(a5)
	ret
	.size	uart_set_cfg, .-uart_set_cfg
	.section	.text.uart_send,"ax",@progbits
	.align	2
	.globl	uart_send
	.type	uart_send, @function
uart_send:
	li	a4,437256192
.L4:
	beqz	a1,.L13
	addi	a3,a0,64
.L5:
	lw	a5,20(a4)
	andi	a5,a5,32
	beqz	a5,.L5
	addi	a0,a0,1
	lbu	a5,-1(a0)
	addi	a1,a1,-1
	sw	a5,0(a4)
	beq	a0,a3,.L4
	bnez	a1,.L5
	ret
.L13:
	ret
	.size	uart_send, .-uart_send
	.section	.text.uart_getchar,"ax",@progbits
	.align	2
	.globl	uart_getchar
	.type	uart_getchar, @function
uart_getchar:
	li	a4,437256192
.L15:
	lw	a5,20(a4)
	andi	a5,a5,1
	beqz	a5,.L15
	lw	a0,0(a4)
	andi	a0,a0,0xff
	ret
	.size	uart_getchar, .-uart_getchar
	.section	.text.uart_sendchar,"ax",@progbits
	.align	2
	.globl	uart_sendchar
	.type	uart_sendchar, @function
uart_sendchar:
	li	a4,437256192
.L19:
	lw	a5,20(a4)
	andi	a5,a5,32
	beqz	a5,.L19
	sw	a0,0(a4)
	ret
	.size	uart_sendchar, .-uart_sendchar
	.section	.text.uart_wait_tx_done,"ax",@progbits
	.align	2
	.globl	uart_wait_tx_done
	.type	uart_wait_tx_done, @function
uart_wait_tx_done:
	li	a4,437256192
.L23:
	lw	a5,20(a4)
	andi	a5,a5,64
	beqz	a5,.L23
	ret
	.size	uart_wait_tx_done, .-uart_wait_tx_done
	.ident	"GCC: (GNU MCU Eclipse RISC-V Embedded GCC, 64-bits) 7.2.0"
