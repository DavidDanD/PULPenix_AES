	.file	"spi.c"
	.option nopic
	.section	.text.spi_setup_slave,"ax",@progbits
	.align	2
	.globl	spi_setup_slave
	.type	spi_setup_slave, @function
spi_setup_slave:
	addi	sp,sp,-16
	li	a1,0
	li	a0,4
	sw	ra,12(sp)
	call	set_pin_function
	li	a1,0
	li	a0,5
	call	set_pin_function
	li	a1,0
	li	a0,6
	call	set_pin_function
	li	a1,0
	li	a0,7
	call	set_pin_function
	lw	ra,12(sp)
	li	a1,0
	li	a0,3
	addi	sp,sp,16
	tail	set_pin_function
	.size	spi_setup_slave, .-spi_setup_slave
	.section	.text.spi_setup_master,"ax",@progbits
	.align	2
	.globl	spi_setup_master
	.type	spi_setup_master, @function
spi_setup_master:
	addi	sp,sp,-16
	sw	s0,8(sp)
	li	a1,0
	mv	s0,a0
	li	a0,15
	sw	ra,12(sp)
	call	set_pin_function
	li	a1,0
	li	a0,14
	call	set_pin_function
	li	a1,0
	li	a0,13
	call	set_pin_function
	li	a1,0
	li	a0,12
	call	set_pin_function
	bgtz	s0,.L9
.L4:
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
.L9:
	li	a1,0
	li	a0,16
	call	set_pin_function
	li	a5,1
	beq	s0,a5,.L4
	li	a1,0
	li	a0,11
	call	set_pin_function
	li	a5,2
	beq	s0,a5,.L4
	li	a1,0
	li	a0,0
	call	set_pin_function
	li	a5,3
	beq	s0,a5,.L4
	lw	s0,8(sp)
	lw	ra,12(sp)
	li	a1,0
	li	a0,1
	addi	sp,sp,16
	tail	set_pin_function
	.size	spi_setup_master, .-spi_setup_master
	.section	.text.spi_setup_cmd_addr,"ax",@progbits
	.align	2
	.globl	spi_setup_cmd_addr
	.type	spi_setup_cmd_addr, @function
spi_setup_cmd_addr:
	li	a5,32
	sub	a5,a5,a1
	sll	a0,a0,a5
	li	a5,16384
	li	a4,437264384
	slli	a3,a3,8
	addi	a5,a5,-256
	sw	a0,8(a4)
	and	a3,a3,a5
	andi	a1,a1,63
	sw	a2,12(a4)
	or	a3,a3,a1
	sw	a3,16(a4)
	ret
	.size	spi_setup_cmd_addr, .-spi_setup_cmd_addr
	.section	.text.spi_setup_dummy,"ax",@progbits
	.align	2
	.globl	spi_setup_dummy
	.type	spi_setup_dummy, @function
spi_setup_dummy:
	slli	a0,a0,16
	slli	a1,a1,16
	srli	a0,a0,16
	or	a1,a1,a0
	li	a5,437264384
	sw	a1,20(a5)
	ret
	.size	spi_setup_dummy, .-spi_setup_dummy
	.section	.text.spi_set_datalen,"ax",@progbits
	.align	2
	.globl	spi_set_datalen
	.type	spi_set_datalen, @function
spi_set_datalen:
	li	a4,437264384
	lw	a5,16(a4)
	addi	sp,sp,-16
	slli	a0,a0,16
	sw	a5,12(sp)
	lw	a5,12(sp)
	slli	a5,a5,16
	srli	a5,a5,16
	or	a0,a0,a5
	sw	a0,12(sp)
	lw	a5,12(sp)
	sw	a5,16(a4)
	addi	sp,sp,16
	jr	ra
	.size	spi_set_datalen, .-spi_set_datalen
	.section	.text.spi_start_transaction,"ax",@progbits
	.align	2
	.globl	spi_start_transaction
	.type	spi_start_transaction, @function
spi_start_transaction:
	li	a5,1
	addi	a1,a1,8
	sll	a1,a5,a1
	sll	a0,a5,a0
	li	a5,4096
	addi	a5,a5,-256
	and	a1,a1,a5
	andi	a0,a0,255
	or	a1,a1,a0
	li	a5,437264384
	sw	a1,0(a5)
	ret
	.size	spi_start_transaction, .-spi_start_transaction
	.section	.text.spi_get_status,"ax",@progbits
	.align	2
	.globl	spi_get_status
	.type	spi_get_status, @function
spi_get_status:
	li	a5,437264384
	lw	a5,0(a5)
	addi	sp,sp,-16
	sw	a5,12(sp)
	lw	a0,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	spi_get_status, .-spi_get_status
	.section	.text.spi_write_fifo,"ax",@progbits
	.align	2
	.globl	spi_write_fifo
	.type	spi_write_fifo, @function
spi_write_fifo:
	srai	a5,a1,5
	addi	sp,sp,-16
	andi	a5,a5,2047
	sw	a5,8(sp)
	andi	a1,a1,31
	beqz	a1,.L18
	lw	a5,8(sp)
	addi	a5,a5,1
	sw	a5,8(sp)
.L18:
	sw	zero,12(sp)
	lw	a4,12(sp)
	lw	a5,8(sp)
	bge	a4,a5,.L17
	li	a4,437264384
	li	a3,7
.L20:
	lw	a5,0(a4)
	srli	a5,a5,24
	bgtu	a5,a3,.L20
	lw	a5,12(sp)
	slli	a5,a5,2
	add	a5,a0,a5
	lw	a5,0(a5)
	sw	a5,24(a4)
	lw	a5,12(sp)
	addi	a5,a5,1
	sw	a5,12(sp)
	lw	a2,12(sp)
	lw	a5,8(sp)
	blt	a2,a5,.L20
.L17:
	addi	sp,sp,16
	jr	ra
	.size	spi_write_fifo, .-spi_write_fifo
	.section	.text.spi_read_fifo,"ax",@progbits
	.align	2
	.globl	spi_read_fifo
	.type	spi_read_fifo, @function
spi_read_fifo:
	srai	a5,a1,5
	addi	sp,sp,-16
	andi	a5,a5,2047
	sw	a5,8(sp)
	andi	a1,a1,31
	beqz	a1,.L29
	lw	a5,8(sp)
	addi	a5,a5,1
	sw	a5,8(sp)
.L29:
	sw	zero,12(sp)
	lw	a4,12(sp)
	lw	a5,8(sp)
	bge	a4,a5,.L28
	li	a4,437264384
.L31:
	lw	a5,0(a4)
	srai	a5,a5,16
	andi	a5,a5,255
	beqz	a5,.L31
	lw	a5,12(sp)
	lw	a1,32(a4)
	lw	a3,12(sp)
	slli	a5,a5,2
	add	a5,a0,a5
	addi	a3,a3,1
	sw	a3,12(sp)
	lw	a2,12(sp)
	lw	a3,8(sp)
	sw	a1,0(a5)
	blt	a2,a3,.L31
.L28:
	addi	sp,sp,16
	jr	ra
	.size	spi_read_fifo, .-spi_read_fifo
	.ident	"GCC: (GNU MCU Eclipse RISC-V Embedded GCC, 64-bits) 7.2.0"
