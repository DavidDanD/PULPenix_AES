	.file	"int.c"
	.option nopic
	.section	.text.ISR_I2C,"ax",@progbits
	.align	2
	.weak	ISR_I2C
	.type	ISR_I2C, @function
ISR_I2C:
.L2:
	j	.L2
	.size	ISR_I2C, .-ISR_I2C
	.section	.text.ISR_UART,"ax",@progbits
	.align	2
	.weak	ISR_UART
	.type	ISR_UART, @function
ISR_UART:
.L5:
	j	.L5
	.size	ISR_UART, .-ISR_UART
	.section	.text.ISR_GPIO,"ax",@progbits
	.align	2
	.weak	ISR_GPIO
	.type	ISR_GPIO, @function
ISR_GPIO:
.L7:
	j	.L7
	.size	ISR_GPIO, .-ISR_GPIO
	.section	.text.ISR_SPIM0,"ax",@progbits
	.align	2
	.weak	ISR_SPIM0
	.type	ISR_SPIM0, @function
ISR_SPIM0:
.L9:
	j	.L9
	.size	ISR_SPIM0, .-ISR_SPIM0
	.section	.text.ISR_SPIM1,"ax",@progbits
	.align	2
	.weak	ISR_SPIM1
	.type	ISR_SPIM1, @function
ISR_SPIM1:
.L11:
	j	.L11
	.size	ISR_SPIM1, .-ISR_SPIM1
	.section	.text.ISR_TA_OVF,"ax",@progbits
	.align	2
	.weak	ISR_TA_OVF
	.type	ISR_TA_OVF, @function
ISR_TA_OVF:
.L13:
	j	.L13
	.size	ISR_TA_OVF, .-ISR_TA_OVF
	.section	.text.ISR_TA_CMP,"ax",@progbits
	.align	2
	.weak	ISR_TA_CMP
	.type	ISR_TA_CMP, @function
ISR_TA_CMP:
.L15:
	j	.L15
	.size	ISR_TA_CMP, .-ISR_TA_CMP
	.section	.text.ISR_TB_OVF,"ax",@progbits
	.align	2
	.weak	ISR_TB_OVF
	.type	ISR_TB_OVF, @function
ISR_TB_OVF:
.L17:
	j	.L17
	.size	ISR_TB_OVF, .-ISR_TB_OVF
	.section	.text.ISR_TB_CMP,"ax",@progbits
	.align	2
	.weak	ISR_TB_CMP
	.type	ISR_TB_CMP, @function
ISR_TB_CMP:
.L19:
	j	.L19
	.size	ISR_TB_CMP, .-ISR_TB_CMP
	.ident	"GCC: (GNU MCU Eclipse RISC-V Embedded GCC, 64-bits) 7.2.0"
