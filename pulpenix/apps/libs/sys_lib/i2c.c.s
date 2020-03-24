	.file	"i2c.c"
	.option nopic
	.section	.text.i2c_setup,"ax",@progbits
	.align	2
	.globl	i2c_setup
	.type	i2c_setup, @function
i2c_setup:
	li	a5,437276672
	sw	a0,0(a5)
	sw	a1,4(a5)
	ret
	.size	i2c_setup, .-i2c_setup
	.section	.text.i2c_get_ack,"ax",@progbits
	.align	2
	.globl	i2c_get_ack
	.type	i2c_get_ack, @function
i2c_get_ack:
	addi	sp,sp,-16
	li	a4,437276672
.L4:
	lw	a5,12(a4)
	sw	a5,4(sp)
	lw	a5,4(sp)
	andi	a5,a5,2
	beqz	a5,.L4
	li	a4,437276672
.L5:
	lw	a5,12(a4)
	sw	a5,8(sp)
	lw	a5,8(sp)
	andi	a5,a5,2
	bnez	a5,.L5
	lw	a5,12(a4)
	sw	a5,12(sp)
	lw	a0,12(sp)
	addi	sp,sp,16
	andi	a0,a0,128
	seqz	a0,a0
	jr	ra
	.size	i2c_get_ack, .-i2c_get_ack
	.section	.text.i2c_send_data,"ax",@progbits
	.align	2
	.globl	i2c_send_data
	.type	i2c_send_data, @function
i2c_send_data:
	li	a5,437276672
	sw	a0,16(a5)
	ret
	.size	i2c_send_data, .-i2c_send_data
	.section	.text.i2c_send_command,"ax",@progbits
	.align	2
	.globl	i2c_send_command
	.type	i2c_send_command, @function
i2c_send_command:
	li	a5,437276672
	sw	a0,20(a5)
	ret
	.size	i2c_send_command, .-i2c_send_command
	.section	.text.i2c_get_status,"ax",@progbits
	.align	2
	.globl	i2c_get_status
	.type	i2c_get_status, @function
i2c_get_status:
	li	a5,437276672
	lw	a5,12(a5)
	addi	sp,sp,-16
	sw	a5,12(sp)
	lw	a0,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	i2c_get_status, .-i2c_get_status
	.section	.text.i2c_get_data,"ax",@progbits
	.align	2
	.globl	i2c_get_data
	.type	i2c_get_data, @function
i2c_get_data:
	li	a5,437276672
	lw	a5,8(a5)
	addi	sp,sp,-16
	sw	a5,12(sp)
	lw	a0,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	i2c_get_data, .-i2c_get_data
	.section	.text.i2c_busy,"ax",@progbits
	.align	2
	.globl	i2c_busy
	.type	i2c_busy, @function
i2c_busy:
	li	a5,437276672
	lw	a5,12(a5)
	addi	sp,sp,-16
	sw	a5,12(sp)
	lw	a0,12(sp)
	addi	sp,sp,16
	srli	a0,a0,6
	andi	a0,a0,1
	jr	ra
	.size	i2c_busy, .-i2c_busy
	.ident	"GCC: (GNU) 7.2.0"
