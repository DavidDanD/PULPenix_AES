	.file	"gpio.c"
	.option nopic
	.section	.text.set_pin_function,"ax",@progbits
	.align	2
	.globl	set_pin_function
	.type	set_pin_function, @function
set_pin_function:
	li	a4,437284864
	lw	a5,0(a4)
	addi	sp,sp,-16
	sll	a1,a1,a0
	sw	a5,12(sp)
	lw	a3,12(sp)
	li	a5,1
	sll	a5,a5,a0
	not	a5,a5
	and	a5,a5,a3
	sw	a5,12(sp)
	lw	a5,12(sp)
	or	a1,a1,a5
	sw	a1,12(sp)
	lw	a5,12(sp)
	sw	a5,0(a4)
	addi	sp,sp,16
	jr	ra
	.size	set_pin_function, .-set_pin_function
	.section	.text.get_pin_function,"ax",@progbits
	.align	2
	.globl	get_pin_function
	.type	get_pin_function, @function
get_pin_function:
	li	a5,437284864
	lw	a5,0(a5)
	addi	sp,sp,-16
	sw	a5,12(sp)
	lw	a5,12(sp)
	sra	a0,a5,a0
	andi	a0,a0,1
	sw	a0,12(sp)
	lw	a0,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	get_pin_function, .-get_pin_function
	.section	.text.set_gpio_pin_direction,"ax",@progbits
	.align	2
	.globl	set_gpio_pin_direction
	.type	set_gpio_pin_direction, @function
set_gpio_pin_direction:
	li	a5,437260288
	lw	a4,0(a5)
	addi	sp,sp,-16
	li	a5,1
	sw	a4,12(sp)
	sll	a0,a5,a0
	beqz	a1,.L10
	lw	a5,12(sp)
	or	a0,a5,a0
	sw	a0,12(sp)
	lw	a4,12(sp)
	li	a5,437260288
	sw	a4,0(a5)
	addi	sp,sp,16
	jr	ra
.L10:
	lw	a4,12(sp)
	not	a5,a0
	and	a5,a5,a4
	sw	a5,12(sp)
	lw	a4,12(sp)
	li	a5,437260288
	sw	a4,0(a5)
	addi	sp,sp,16
	jr	ra
	.size	set_gpio_pin_direction, .-set_gpio_pin_direction
	.section	.text.get_gpio_pin_direction,"ax",@progbits
	.align	2
	.globl	get_gpio_pin_direction
	.type	get_gpio_pin_direction, @function
get_gpio_pin_direction:
	li	a5,437260288
	lw	a4,0(a5)
	addi	sp,sp,-16
	slli	a5,a0,1
	sw	a4,12(sp)
	lw	a0,12(sp)
	sra	a0,a0,a5
	andi	a0,a0,1
	sw	a0,12(sp)
	lw	a0,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	get_gpio_pin_direction, .-get_gpio_pin_direction
	.section	.text.set_gpio_pin_value,"ax",@progbits
	.align	2
	.globl	set_gpio_pin_value
	.type	set_gpio_pin_value, @function
set_gpio_pin_value:
	li	a5,437260288
	lw	a4,8(a5)
	addi	sp,sp,-16
	li	a5,1
	sw	a4,12(sp)
	sll	a0,a5,a0
	beqz	a1,.L17
	lw	a5,12(sp)
	or	a0,a5,a0
	sw	a0,12(sp)
	lw	a4,12(sp)
	li	a5,437260288
	sw	a4,8(a5)
	addi	sp,sp,16
	jr	ra
.L17:
	lw	a4,12(sp)
	not	a5,a0
	and	a5,a5,a4
	sw	a5,12(sp)
	lw	a4,12(sp)
	li	a5,437260288
	sw	a4,8(a5)
	addi	sp,sp,16
	jr	ra
	.size	set_gpio_pin_value, .-set_gpio_pin_value
	.section	.text.get_gpio_pin_value,"ax",@progbits
	.align	2
	.globl	get_gpio_pin_value
	.type	get_gpio_pin_value, @function
get_gpio_pin_value:
	li	a5,437260288
	lw	a5,4(a5)
	addi	sp,sp,-16
	sw	a5,12(sp)
	lw	a5,12(sp)
	sra	a0,a5,a0
	andi	a0,a0,1
	sw	a0,12(sp)
	lw	a0,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	get_gpio_pin_value, .-get_gpio_pin_value
	.section	.text.set_gpio_pin_irq_en,"ax",@progbits
	.align	2
	.globl	set_gpio_pin_irq_en
	.type	set_gpio_pin_irq_en, @function
set_gpio_pin_irq_en:
	li	a5,437260288
	lw	a4,12(a5)
	li	a5,1
	sll	a0,a5,a0
	or	a5,a4,a0
	bnez	a1,.L22
	not	a0,a0
	and	a5,a0,a4
.L22:
	li	a4,437260288
	sw	a5,12(a4)
	ret
	.size	set_gpio_pin_irq_en, .-set_gpio_pin_irq_en
	.section	.text.set_gpio_pin_irq_type,"ax",@progbits
	.align	2
	.globl	set_gpio_pin_irq_type
	.type	set_gpio_pin_irq_type, @function
set_gpio_pin_irq_type:
	li	a5,437260288
	lw	a4,16(a5)
	lw	a2,20(a5)
	li	a5,1
	sll	a0,a5,a0
	andi	a3,a1,1
	or	a5,a4,a0
	bnez	a3,.L25
	not	a5,a0
	and	a5,a5,a4
.L25:
	andi	a1,a1,2
	or	a3,a2,a0
	bnez	a1,.L27
	not	a0,a0
	and	a3,a0,a2
.L27:
	li	a4,437260288
	sw	a5,16(a4)
	sw	a3,20(a4)
	ret
	.size	set_gpio_pin_irq_type, .-set_gpio_pin_irq_type
	.section	.text.get_gpio_irq_status,"ax",@progbits
	.align	2
	.globl	get_gpio_irq_status
	.type	get_gpio_irq_status, @function
get_gpio_irq_status:
	li	a5,437260288
	lw	a0,24(a5)
	ret
	.size	get_gpio_irq_status, .-get_gpio_irq_status
	.ident	"GCC: (GNU MCU Eclipse RISC-V Embedded GCC, 64-bits) 7.2.0"
