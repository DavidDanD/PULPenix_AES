	.file	"iosim.c"
	.option nopic
	.section	.text.write_to_port,"ax",@progbits
	.align	2
	.globl	write_to_port
	.type	write_to_port, @function
write_to_port:
	slli	a1,a1,16
	li	a4,-2147483648
	li	a5,437260288
	slli	a0,a0,26
	add	a1,a1,a4
	sw	zero,8(a5)
	add	a0,a0,a1
	sw	a0,8(a5)
	ret
	.size	write_to_port, .-write_to_port
	.section	.text.read_from_port,"ax",@progbits
	.align	2
	.globl	read_from_port
	.type	read_from_port, @function
read_from_port:
	li	a5,437260288
	li	a4,1073741824
	slli	a0,a0,26
	sw	zero,8(a5)
	add	a0,a0,a4
	sw	a0,8(a5)
	lw	a0,4(a5)
	ret
	.size	read_from_port, .-read_from_port
	.section	.text.sim_finish,"ax",@progbits
	.align	2
	.globl	sim_finish
	.type	sim_finish, @function
sim_finish:
	li	a5,437260288
	sw	zero,8(a5)
	li	a4,-2013265920
	sw	a4,8(a5)
	ret
	.size	sim_finish, .-sim_finish
	.section	.text.bm_putc,"ax",@progbits
	.align	2
	.globl	bm_putc
	.type	bm_putc, @function
bm_putc:
	li	a5,437260288
	slli	a0,a0,16
	li	a4,-2080374784
	sw	zero,8(a5)
	add	a0,a0,a4
	sw	a0,8(a5)
	ret
	.size	bm_putc, .-bm_putc
	.section	.text.bm_access_file,"ax",@progbits
	.align	2
	.globl	bm_access_file
	.type	bm_access_file, @function
bm_access_file:
	li	a5,437260288
	slli	a0,a0,16
	li	a4,-1811939328
	sw	zero,8(a5)
	add	a0,a0,a4
	sw	a0,8(a5)
	ret
	.size	bm_access_file, .-bm_access_file
	.section	.text.bm_fputc,"ax",@progbits
	.align	2
	.globl	bm_fputc
	.type	bm_fputc, @function
bm_fputc:
	li	a5,437260288
	li	a4,-1811939328
	slli	a0,a0,16
	sw	zero,8(a5)
	add	a0,a0,a4
	sw	a0,8(a5)
	slli	a1,a1,16
	li	a4,-2080374784
	sw	zero,8(a5)
	add	a1,a1,a4
	sw	a1,8(a5)
	ret
	.size	bm_fputc, .-bm_fputc
	.section	.text.bm_putd,"ax",@progbits
	.align	2
	.globl	bm_putd
	.type	bm_putd, @function
bm_putd:
	beqz	a0,.L19
	srai	a4,a0,31
	addi	sp,sp,-32
	xor	a5,a4,a0
	addi	a7,sp,12
	sub	a5,a5,a4
	mv	a1,a7
	li	a6,0
	li	t1,10
	j	.L11
.L14:
	mv	a6,a4
.L11:
	div	a2,a5,t1
	addi	a1,a1,1
	addi	a4,a6,1
	slli	a3,a2,2
	add	a3,a3,a2
	slli	a3,a3,1
	sub	a5,a5,a3
	addi	a5,a5,48
	sb	a5,-1(a1)
	mv	a5,a2
	bnez	a2,.L14
	bltz	a0,.L20
.L12:
	add	a5,a7,a4
	li	a3,437260288
	li	a2,-2080374784
.L13:
	lbu	a4,-1(a5)
	sw	zero,8(a3)
	addi	a5,a5,-1
	slli	a4,a4,16
	add	a4,a4,a2
	sw	a4,8(a3)
	bne	a7,a5,.L13
	addi	sp,sp,32
	jr	ra
.L19:
	li	a5,437260288
	sw	zero,8(a5)
	li	a4,-2077229056
	sw	a4,8(a5)
	ret
.L20:
	addi	a5,sp,32
	add	a5,a5,a4
	li	a4,45
	sb	a4,-20(a5)
	addi	a4,a6,2
	j	.L12
	.size	bm_putd, .-bm_putd
	.section	.text.bm_fputd,"ax",@progbits
	.align	2
	.globl	bm_fputd
	.type	bm_fputd, @function
bm_fputd:
	li	a5,437260288
	slli	a0,a0,16
	li	a4,-1811939328
	sw	zero,8(a5)
	add	a0,a0,a4
	sw	a0,8(a5)
	bnez	a1,.L22
	sw	zero,8(a5)
	li	a4,-2077229056
	sw	a4,8(a5)
	ret
.L22:
	srai	a4,a1,31
	addi	sp,sp,-32
	xor	a5,a4,a1
	addi	a7,sp,12
	sub	a5,a5,a4
	mv	a0,a7
	li	a6,0
	li	t1,10
	j	.L24
.L27:
	mv	a6,a4
.L24:
	div	a2,a5,t1
	addi	a0,a0,1
	addi	a4,a6,1
	slli	a3,a2,2
	add	a3,a3,a2
	slli	a3,a3,1
	sub	a5,a5,a3
	addi	a5,a5,48
	sb	a5,-1(a0)
	mv	a5,a2
	bnez	a2,.L27
	bgez	a1,.L25
	addi	a5,sp,32
	add	a5,a5,a4
	li	a4,45
	sb	a4,-20(a5)
	addi	a4,a6,2
.L25:
	add	a5,a7,a4
	li	a3,437260288
	li	a2,-2080374784
.L26:
	lbu	a4,-1(a5)
	sw	zero,8(a3)
	addi	a5,a5,-1
	slli	a4,a4,16
	add	a4,a4,a2
	sw	a4,8(a3)
	bne	a7,a5,.L26
	addi	sp,sp,32
	jr	ra
	.size	bm_fputd, .-bm_fputd
	.section	.text.bm_puts,"ax",@progbits
	.align	2
	.globl	bm_puts
	.type	bm_puts, @function
bm_puts:
	lbu	a5,0(a0)
	beqz	a5,.L32
	li	a4,437260288
	li	a3,-2080374784
.L34:
	slli	a5,a5,16
	sw	zero,8(a4)
	add	a5,a5,a3
	addi	a0,a0,1
	sw	a5,8(a4)
	lbu	a5,0(a0)
	bnez	a5,.L34
.L32:
	ret
	.size	bm_puts, .-bm_puts
	.section	.text.bm_fputs,"ax",@progbits
	.align	2
	.globl	bm_fputs
	.type	bm_fputs, @function
bm_fputs:
	li	a5,437260288
	slli	a0,a0,16
	li	a4,-1811939328
	sw	zero,8(a5)
	add	a0,a0,a4
	sw	a0,8(a5)
	lbu	a5,0(a1)
	beqz	a5,.L39
	li	a4,437260288
	li	a3,-2080374784
.L41:
	slli	a5,a5,16
	sw	zero,8(a4)
	add	a5,a5,a3
	addi	a1,a1,1
	sw	a5,8(a4)
	lbu	a5,0(a1)
	bnez	a5,.L41
.L39:
	ret
	.size	bm_fputs, .-bm_fputs
	.section	.text.bm_putllh,"ax",@progbits
	.align	2
	.globl	bm_putllh
	.type	bm_putllh, @function
bm_putllh:
	or	a5,a0,a1
	beqz	a5,.L62
	addi	sp,sp,-32
	addi	a2,sp,12
	li	a6,1
	mv	a5,a2
	sub	a6,a6,a2
	li	t3,9
	j	.L51
.L64:
	sb	t1,0(a5)
	or	a3,a0,a1
	addi	a5,a5,1
	beqz	a3,.L63
.L51:
	andi	a3,a0,15
	slli	a4,a1,28
	srli	a0,a0,4
	or	a0,a4,a0
	addi	t1,a3,48
	addi	a7,a3,55
	srai	a1,a1,4
	add	a4,a6,a5
	bleu	a3,t3,.L64
	sb	a7,0(a5)
	or	a3,a0,a1
	addi	a5,a5,1
	bnez	a3,.L51
.L63:
	beqz	a4,.L46
	add	a4,a2,a4
	li	a3,437260288
	li	a1,-2080374784
.L53:
	lbu	a5,-1(a4)
	sw	zero,8(a3)
	addi	a4,a4,-1
	slli	a5,a5,16
	add	a5,a5,a1
	sw	a5,8(a3)
	bne	a2,a4,.L53
.L46:
	addi	sp,sp,32
	jr	ra
.L62:
	li	a5,437260288
	sw	zero,8(a5)
	li	a4,-2077229056
	sw	a4,8(a5)
	ret
	.size	bm_putllh, .-bm_putllh
	.section	.text.bm_puth,"ax",@progbits
	.align	2
	.globl	bm_puth
	.type	bm_puth, @function
bm_puth:
	beqz	a0,.L66
	addi	sp,sp,-32
	addi	a1,sp,12
	li	a6,1
	mv	a3,a1
	sub	a6,a6,a1
	li	t1,9
	j	.L69
.L83:
	sb	a7,0(a3)
	srli	a0,a0,4
	addi	a3,a3,1
	beqz	a0,.L82
.L69:
	andi	a2,a0,15
	andi	a5,a2,0xff
	addi	a7,a5,48
	add	a4,a6,a3
	addi	a5,a5,55
	bleu	a2,t1,.L83
	sb	a5,0(a3)
	srli	a0,a0,4
	addi	a3,a3,1
	bnez	a0,.L69
.L82:
	beqz	a4,.L65
	add	a4,a1,a4
	li	a3,437260288
	li	a2,-2080374784
.L71:
	lbu	a5,-1(a4)
	sw	zero,8(a3)
	addi	a4,a4,-1
	slli	a5,a5,16
	add	a5,a5,a2
	sw	a5,8(a3)
	bne	a1,a4,.L71
.L65:
	addi	sp,sp,32
	jr	ra
.L66:
	li	a5,437260288
	sw	zero,8(a5)
	li	a4,-2077229056
	sw	a4,8(a5)
	ret
	.size	bm_puth, .-bm_puth
	.section	.text.bm_fputh,"ax",@progbits
	.align	2
	.globl	bm_fputh
	.type	bm_fputh, @function
bm_fputh:
	li	a5,437260288
	slli	a0,a0,16
	li	a4,-1811939328
	sw	zero,8(a5)
	add	a0,a0,a4
	sw	a0,8(a5)
	bnez	a1,.L101
	sw	zero,8(a5)
	li	a4,-2077229056
	sw	a4,8(a5)
	ret
.L101:
	addi	sp,sp,-32
	addi	a0,sp,12
	li	a6,1
	mv	a3,a0
	sub	a6,a6,a0
	li	t1,9
	j	.L88
.L103:
	sb	a7,0(a3)
	srli	a1,a1,4
	addi	a3,a3,1
	beqz	a1,.L102
.L88:
	andi	a2,a1,15
	andi	a5,a2,0xff
	addi	a7,a5,48
	add	a4,a6,a3
	addi	a5,a5,55
	bleu	a2,t1,.L103
	sb	a5,0(a3)
	srli	a1,a1,4
	addi	a3,a3,1
	bnez	a1,.L88
.L102:
	beqz	a4,.L84
	add	a4,a0,a4
	li	a3,437260288
	li	a2,-2080374784
.L90:
	lbu	a5,-1(a4)
	sw	zero,8(a3)
	addi	a4,a4,-1
	slli	a5,a5,16
	add	a5,a5,a2
	sw	a5,8(a3)
	bne	a0,a4,.L90
.L84:
	addi	sp,sp,32
	jr	ra
	.size	bm_fputh, .-bm_fputh
	.section	.text.bm_getc,"ax",@progbits
	.align	2
	.globl	bm_getc
	.type	bm_getc, @function
bm_getc:
	li	a5,437260288
	sw	zero,8(a5)
	li	a4,1275068416
	sw	a4,8(a5)
	lw	a0,4(a5)
	ret
	.size	bm_getc, .-bm_getc
	.section	.text.bm_fgetc,"ax",@progbits
	.align	2
	.globl	bm_fgetc
	.type	bm_fgetc, @function
bm_fgetc:
	li	a5,437260288
	li	a4,-1811939328
	slli	a0,a0,16
	sw	zero,8(a5)
	add	a0,a0,a4
	sw	a0,8(a5)
	sw	zero,8(a5)
	li	a4,1275068416
	sw	a4,8(a5)
	lw	a0,4(a5)
	ret
	.size	bm_fgetc, .-bm_fgetc
	.section	.text.bm_isspace,"ax",@progbits
	.align	2
	.globl	bm_isspace
	.type	bm_isspace, @function
bm_isspace:
	addi	a5,a0,-9
	andi	a5,a5,0xff
	li	a4,4
	bleu	a5,a4,.L108
	addi	a0,a0,-32
	seqz	a0,a0
	ret
.L108:
	li	a0,1
	ret
	.size	bm_isspace, .-bm_isspace
	.section	.text.bm_fgets,"ax",@progbits
	.align	2
	.globl	bm_fgets
	.type	bm_fgets, @function
bm_fgets:
	sb	zero,0(a1)
	li	a5,437260288
	slli	a0,a0,16
	li	a4,-1811939328
	add	a0,a0,a4
	sw	zero,8(a5)
	li	a6,437260288
	sw	a0,8(a5)
	li	a2,0
	li	a0,0
	mv	a7,a1
	addi	a3,a6,8
	li	t3,1275068416
	li	t1,255
	li	t4,4
	li	t5,32
.L110:
	sw	zero,0(a3)
	sw	t3,0(a3)
	lw	a5,4(a6)
	andi	a5,a5,0xff
	addi	a4,a5,-9
	andi	a4,a4,0xff
	beq	a5,t1,.L119
.L114:
	bleu	a4,t4,.L111
	beq	a5,t5,.L111
	sb	a5,0(a7)
	sw	zero,0(a3)
	sw	t3,0(a3)
	lw	a5,4(a6)
	addi	a2,a2,1
	li	a0,1
	andi	a5,a5,0xff
	addi	a4,a5,-9
	add	a7,a1,a2
	andi	a4,a4,0xff
	bne	a5,t1,.L114
.L119:
	sb	zero,0(a7)
	li	a0,0
	ret
.L111:
	beqz	a0,.L110
	sb	zero,0(a7)
	ret
	.size	bm_fgets, .-bm_fgets
	.section	.text.bm_fget_line,"ax",@progbits
	.align	2
	.globl	bm_fget_line
	.type	bm_fget_line, @function
bm_fget_line:
	li	a5,437260288
	sb	zero,0(a1)
	slli	a0,a0,16
	li	a2,-1811939328
	sw	zero,8(a5)
	add	a2,a0,a2
	li	a7,437260288
	sw	a2,8(a5)
	li	a6,0
	li	a0,0
	mv	t5,a1
	addi	a5,a7,8
	li	t3,1275068416
	li	t1,255
	li	t4,10
	li	t6,13
.L121:
	sw	zero,0(a5)
	sw	t3,0(a5)
	lw	a4,4(a7)
	andi	a3,a4,0xff
	beq	a3,t1,.L130
.L126:
	sw	zero,0(a5)
	sw	a2,0(a5)
	beq	a4,t4,.L122
	beq	a4,t6,.L122
	sb	a3,0(t5)
	sw	zero,0(a5)
	sw	t3,0(a5)
	lw	a4,4(a7)
	addi	a6,a6,1
	li	a0,1
	andi	a3,a4,0xff
	add	t5,a1,a6
	bne	a3,t1,.L126
.L130:
	sb	zero,0(t5)
	li	a0,0
	ret
.L122:
	beqz	a0,.L121
	sb	zero,0(t5)
	ret
	.size	bm_fget_line, .-bm_fget_line
	.section	.text.decimal_str_to_uint,"ax",@progbits
	.align	2
	.globl	decimal_str_to_uint
	.type	decimal_str_to_uint, @function
decimal_str_to_uint:
	lbu	a3,0(a0)
	beqz	a3,.L134
	addi	a4,a0,1
	li	a0,0
.L133:
	slli	a5,a0,2
	add	a0,a5,a0
	slli	a0,a0,1
	addi	a4,a4,1
	add	a0,a0,a3
	lbu	a3,-1(a4)
	addi	a0,a0,-48
	bnez	a3,.L133
	ret
.L134:
	li	a0,0
	ret
	.size	decimal_str_to_uint, .-decimal_str_to_uint
	.section	.text.hex_str_to_uint,"ax",@progbits
	.align	2
	.globl	hex_str_to_uint
	.type	hex_str_to_uint, @function
hex_str_to_uint:
	lbu	a4,0(a0)
	beqz	a4,.L143
	addi	a2,a0,1
	li	a6,9
	li	a0,0
	li	a7,5
.L142:
	addi	a5,a4,-48
	addi	a3,a4,-65
	andi	a5,a5,0xff
	andi	a3,a3,0xff
	bleu	a5,a6,.L138
	addi	a1,a4,-97
	addi	a5,a4,-55
	andi	a1,a1,0xff
	addi	a4,a4,-87
	andi	a5,a5,0xff
	bleu	a3,a7,.L138
	bgtu	a1,a7,.L140
	andi	a5,a4,0xff
.L138:
	addi	a2,a2,1
	lbu	a4,-1(a2)
	slli	a0,a0,4
	add	a0,a5,a0
	bnez	a4,.L142
	ret
.L140:
	li	a5,437260288
	sw	zero,8(a5)
	li	a4,-1811939328
	sw	a4,8(a5)
	lui	a4,%hi(.LC0)
	li	a5,10
	addi	a4,a4,%lo(.LC0)
	li	a3,437260288
	li	a1,-2080374784
.L141:
	slli	a5,a5,16
	sw	zero,8(a3)
	add	a5,a5,a1
	addi	a4,a4,1
	sw	a5,8(a3)
	lbu	a5,0(a4)
	bnez	a5,.L141
	sw	zero,8(a3)
	li	a5,-2013265920
	sw	a5,8(a3)
	li	a0,0
	ret
.L143:
	li	a0,0
	ret
	.size	hex_str_to_uint, .-hex_str_to_uint
	.section	.text.bm_fopen_r,"ax",@progbits
	.align	2
	.globl	bm_fopen_r
	.type	bm_fopen_r, @function
bm_fopen_r:
	li	a5,437260288
	sw	zero,8(a5)
	li	a4,-2013003776
	sw	a4,8(a5)
	lbu	a5,0(a0)
	beqz	a5,.L147
	li	a4,437260288
	li	a3,-2080374784
.L148:
	slli	a5,a5,16
	sw	zero,8(a4)
	add	a5,a5,a3
	addi	a0,a0,1
	sw	a5,8(a4)
	lbu	a5,0(a0)
	bnez	a5,.L148
.L147:
	li	a5,437260288
	sw	zero,8(a5)
	li	a4,-2013200384
	sw	a4,8(a5)
	sw	zero,8(a5)
	li	a4,1342177280
	sw	a4,8(a5)
	lw	a0,4(a5)
	ret
	.size	bm_fopen_r, .-bm_fopen_r
	.section	.text.bm_fopen_w,"ax",@progbits
	.align	2
	.globl	bm_fopen_w
	.type	bm_fopen_w, @function
bm_fopen_w:
	li	a5,437260288
	sw	zero,8(a5)
	li	a4,-2013003776
	sw	a4,8(a5)
	lbu	a5,0(a0)
	beqz	a5,.L154
	li	a4,437260288
	li	a3,-2080374784
.L155:
	slli	a5,a5,16
	sw	zero,8(a4)
	add	a5,a5,a3
	addi	a0,a0,1
	sw	a5,8(a4)
	lbu	a5,0(a0)
	bnez	a5,.L155
.L154:
	li	a5,437260288
	sw	zero,8(a5)
	li	a4,-2013134848
	sw	a4,8(a5)
	sw	zero,8(a5)
	li	a4,1342177280
	sw	a4,8(a5)
	lw	a0,4(a5)
	ret
	.size	bm_fopen_w, .-bm_fopen_w
	.section	.text.bm_time_stamp,"ax",@progbits
	.align	2
	.globl	bm_time_stamp
	.type	bm_time_stamp, @function
bm_time_stamp:
	li	a5,437260288
	sw	zero,8(a5)
	li	a4,-2013003776
	sw	a4,8(a5)
	lbu	a5,0(a0)
	beqz	a5,.L161
	li	a4,437260288
	li	a3,-2080374784
.L162:
	slli	a5,a5,16
	sw	zero,8(a4)
	add	a5,a5,a3
	addi	a0,a0,1
	sw	a5,8(a4)
	lbu	a5,0(a0)
	bnez	a5,.L162
.L161:
	li	a5,437260288
	sw	zero,8(a5)
	li	a4,-2012938240
	sw	a4,8(a5)
	sw	zero,8(a5)
	li	a4,1476395008
	sw	a4,8(a5)
	lw	a0,4(a5)
	ret
	.size	bm_time_stamp, .-bm_time_stamp
	.section	.text.bm_malloc,"ax",@progbits
	.align	2
	.globl	bm_malloc
	.type	bm_malloc, @function
bm_malloc:
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	lw	a3,0(a5)
	lui	a4,%hi(bm_malloc_pool.1589+4096)
	addi	a4,a4,%lo(bm_malloc_pool.1589+4096)
	add	a0,a3,a0
	sw	a0,0(a5)
	bgtu	a0,a4,.L171
.L167:
	mv	a0,a3
	ret
.L171:
	li	a5,437260288
	sw	zero,8(a5)
	li	a4,-1811939328
	sw	a4,8(a5)
	lui	a4,%hi(.LC1)
	li	a5,10
	addi	a4,a4,%lo(.LC1)
	li	a3,437260288
	li	a1,-2080374784
.L169:
	slli	a5,a5,16
	sw	zero,8(a3)
	add	a5,a5,a1
	addi	a4,a4,1
	sw	a5,8(a3)
	lbu	a5,0(a4)
	bnez	a5,.L169
	sw	zero,8(a3)
	li	a5,-2013265920
	sw	a5,8(a3)
	li	a3,0
	j	.L167
	.size	bm_malloc, .-bm_malloc
	.section	.bss.bm_malloc_pool.1589,"aw",@nobits
	.align	2
	.type	bm_malloc_pool.1589, @object
	.size	bm_malloc_pool.1589, 4096
bm_malloc_pool.1589:
	.zero	4096
	.section	.rodata.bm_malloc.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"\nSW ERROR: bm_malloc out of memory\n\n"
	.section	.rodata.hex_str_to_uint.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"\nERROR reading into hex a non hex char.\n"
	.section	.sdata.bm_malloc_ptr.1590,"aw",@progbits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	bm_malloc_ptr.1590, @object
	.size	bm_malloc_ptr.1590, 4
bm_malloc_ptr.1590:
	.word	bm_malloc_pool.1589
	.ident	"GCC: (GNU MCU Eclipse RISC-V Embedded GCC, 64-bits) 7.2.0"
