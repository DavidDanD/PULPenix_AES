	.file	"bm_printf.c"
	.option nopic
	.section	.text.number,"ax",@progbits
	.align	2
	.type	number, @function
number:
	addi	sp,sp,-128
	sw	s0,120(sp)
	sw	s4,104(sp)
	sw	ra,124(sp)
	sw	s1,116(sp)
	sw	s2,112(sp)
	sw	s3,108(sp)
	sw	s5,100(sp)
	sw	s6,96(sp)
	sw	s7,92(sp)
	sw	s8,88(sp)
	sw	s9,84(sp)
	sw	s10,80(sp)
	andi	a6,a5,64
	mv	s0,a0
	mv	s4,a2
	bnez	a6,.L29
	lui	a2,%hi(.LC0)
	addi	a2,a2,%lo(.LC0)
.L2:
	andi	s7,a5,16
	beqz	s7,.L3
	andi	a5,a5,-2
	li	s8,32
.L28:
	andi	a0,a5,2
	li	s10,0
	beqz	a0,.L4
	bltz	a1,.L49
	andi	a0,a5,4
	bnez	a0,.L50
	andi	a0,a5,8
	beqz	a0,.L4
	addi	a3,a3,-1
	li	s10,32
.L4:
	andi	s9,a5,32
	beqz	s9,.L7
.L57:
	li	a0,16
	beq	s4,a0,.L51
	addi	a0,s4,-8
	seqz	a0,a0
	sub	a3,a3,a0
.L7:
	beqz	a1,.L52
.L9:
	addi	a0,sp,12
	li	a7,1
	sub	a7,a7,a0
.L11:
	remu	a6,a1,s4
	add	s2,a7,a0
	addi	a0,a0,1
	divu	a1,a1,s4
	add	a6,a2,a6
	lbu	a6,0(a6)
	sb	a6,-1(a0)
	bnez	a1,.L11
	addi	s6,s2,-1
.L10:
	mv	s3,s2
	bge	s2,a4,.L12
	mv	s3,a4
.L12:
	sub	s1,a3,s3
	andi	a5,a5,17
	addi	s5,s1,-1
	bnez	a5,.L13
	blez	s1,.L53
	mv	a2,s1
	mv	a0,s0
	li	a1,32
	add	s0,s0,s1
	call	memset
	li	s5,-2
	li	s1,-1
.L13:
	beqz	s10,.L15
	sb	s10,0(s0)
	addi	s0,s0,1
.L15:
	beqz	s9,.L16
	li	a5,8
	beq	s4,a5,.L54
	li	a5,16
	beq	s4,a5,.L55
.L16:
	bnez	s7,.L18
	blez	s1,.L56
	not	s4,s5
	srai	s4,s4,31
	and	s4,s5,s4
	addi	s7,s4,1
	addi	s1,s5,-1
	mv	a0,s0
	mv	a2,s7
	mv	a1,s8
	sub	s1,s1,s4
	call	memset
	add	s0,s0,s7
	addi	s5,s1,-1
.L18:
	bge	s2,s3,.L21
	sub	s3,s3,s2
	mv	a0,s0
	mv	a2,s3
	li	a1,48
	call	memset
	add	s0,s0,s3
.L21:
	blez	s2,.L23
	addi	a2,sp,12
	li	a3,1
	add	a5,a2,s6
	mv	a4,s0
	sub	a3,a3,a2
.L24:
	lbu	a2,0(a5)
	addi	a4,a4,1
	addi	a5,a5,-1
	sb	a2,-1(a4)
	add	a2,a3,a5
	bgtz	a2,.L24
	not	a5,s6
	srai	a5,a5,31
	and	a5,s6,a5
	addi	a5,a5,1
	add	s0,s0,a5
.L23:
	blez	s1,.L1
	not	a5,s5
	srai	a5,a5,31
	and	s1,s5,a5
	addi	s1,s1,1
	mv	a0,s0
	mv	a2,s1
	li	a1,32
	call	memset
	add	s0,s0,s1
.L1:
	mv	a0,s0
	lw	ra,124(sp)
	lw	s0,120(sp)
	lw	s1,116(sp)
	lw	s2,112(sp)
	lw	s3,108(sp)
	lw	s4,104(sp)
	lw	s5,100(sp)
	lw	s6,96(sp)
	lw	s7,92(sp)
	lw	s8,88(sp)
	lw	s9,84(sp)
	lw	s10,80(sp)
	addi	sp,sp,128
	jr	ra
.L3:
	andi	a0,a5,1
	beqz	a0,.L33
	li	s8,48
	j	.L28
.L29:
	lui	a2,%hi(.LC1)
	addi	a2,a2,%lo(.LC1)
	j	.L2
.L52:
	li	a2,48
	sb	a2,12(sp)
	li	s6,0
	li	s2,1
	j	.L10
.L50:
	andi	s9,a5,32
	addi	a3,a3,-1
	li	s10,43
	beqz	s9,.L7
	j	.L57
.L55:
	li	a5,48
	sb	a5,0(s0)
	li	a5,120
	sb	a5,1(s0)
	addi	s0,s0,2
	j	.L16
.L33:
	li	s8,32
	j	.L28
.L49:
	andi	s9,a5,32
	sub	a1,zero,a1
	addi	a3,a3,-1
	li	s10,45
	beqz	s9,.L7
	j	.L57
.L54:
	li	a5,48
	sb	a5,0(s0)
	addi	s0,s0,1
	j	.L16
.L51:
	addi	a3,a3,-2
	bnez	a1,.L9
	j	.L52
.L56:
	mv	s1,s5
	addi	s5,s5,-1
	j	.L18
.L53:
	addi	a5,s1,-2
	mv	s1,s5
	mv	s5,a5
	j	.L13
	.size	number, .-number
	.section	.text.uart_send_char,"ax",@progbits
	.align	2
	.globl	uart_send_char
	.type	uart_send_char, @function
uart_send_char:
	tail	bm_putc
	.size	uart_send_char, .-uart_send_char
	.section	.text.bm_print,"ax",@progbits
	.align	2
	.globl	bm_print
	.type	bm_print, @function
bm_print:
	addi	sp,sp,-1168
	sw	s8,1096(sp)
	sw	ra,1132(sp)
	sw	s0,1128(sp)
	sw	s1,1124(sp)
	sw	s2,1120(sp)
	sw	s3,1116(sp)
	sw	s4,1112(sp)
	sw	s5,1108(sp)
	sw	s6,1104(sp)
	sw	s7,1100(sp)
	sw	s9,1092(sp)
	sw	s10,1088(sp)
	sw	s11,1084(sp)
	sw	a1,1140(sp)
	sw	a2,1144(sp)
	sw	a3,1148(sp)
	sw	a4,1152(sp)
	sw	a5,1156(sp)
	sw	a6,1160(sp)
	sw	a7,1164(sp)
	lbu	a5,0(a0)
	addi	s8,sp,1140
	sw	s8,20(sp)
	beqz	a5,.L154
	addi	s2,sp,48
	lui	s7,%hi(.L65)
	lui	s4,%hi(.L149)
	lui	s3,%hi(.LC0)
	mv	s0,a0
	mv	s6,s2
	addi	s7,s7,%lo(.L65)
	addi	s4,s4,%lo(.L149)
	addi	s3,s3,%lo(.LC0)
	lui	s5,%hi(.LC2)
	j	.L146
.L213:
	sb	a5,0(s6)
	lbu	a5,1(s0)
	addi	s6,s6,1
.L62:
	addi	s0,s0,1
	beqz	a5,.L60
.L146:
	li	a4,37
	bne	a5,a4,.L213
	lbu	a2,1(s0)
	li	a3,16
	li	a5,0
	addi	a4,a2,-32
	andi	a4,a4,0xff
	addi	s1,s0,1
	bgtu	a4,a3,.L63
.L214:
	slli	a4,a4,2
	add	a4,a4,s7
	lw	a4,0(a4)
	jr	a4
	.section	.rodata.bm_print,"a",@progbits
	.align	2
	.align	2
.L65:
	.word	.L64
	.word	.L63
	.word	.L63
	.word	.L66
	.word	.L63
	.word	.L63
	.word	.L63
	.word	.L63
	.word	.L63
	.word	.L63
	.word	.L63
	.word	.L67
	.word	.L63
	.word	.L68
	.word	.L63
	.word	.L63
	.word	.L69
	.section	.text.bm_print
.L69:
	ori	a5,a5,1
	mv	s0,s1
.L219:
	lbu	a2,1(s0)
	addi	s1,s0,1
	addi	a4,a2,-32
	andi	a4,a4,0xff
	bleu	a4,a3,.L214
.L63:
	addi	a4,a2,-48
	andi	a4,a4,0xff
	li	a3,9
	bleu	a4,a3,.L215
	li	a4,42
	li	a3,-1
	beq	a2,a4,.L216
.L73:
	li	a1,46
	li	a4,-1
	beq	a2,a1,.L217
.L75:
	andi	a1,a2,223
	li	a0,76
	beq	a1,a0,.L218
	addi	a1,a2,-65
	andi	a1,a1,0xff
	li	a0,55
	bgtu	a1,a0,.L167
	slli	a1,a1,2
	add	a1,a1,s4
	lw	a1,0(a1)
	jr	a1
	.section	.rodata.bm_print
	.align	2
	.align	2
.L149:
	.word	.L111
	.word	.L167
	.word	.L167
	.word	.L167
	.word	.L167
	.word	.L167
	.word	.L167
	.word	.L167
	.word	.L167
	.word	.L167
	.word	.L167
	.word	.L167
	.word	.L167
	.word	.L167
	.word	.L167
	.word	.L167
	.word	.L167
	.word	.L167
	.word	.L167
	.word	.L167
	.word	.L167
	.word	.L167
	.word	.L167
	.word	.L168
	.word	.L167
	.word	.L167
	.word	.L167
	.word	.L167
	.word	.L167
	.word	.L167
	.word	.L167
	.word	.L167
	.word	.L150
	.word	.L167
	.word	.L169
	.word	.L170
	.word	.L167
	.word	.L167
	.word	.L167
	.word	.L167
	.word	.L170
	.word	.L167
	.word	.L167
	.word	.L167
	.word	.L167
	.word	.L167
	.word	.L171
	.word	.L172
	.word	.L167
	.word	.L167
	.word	.L173
	.word	.L167
	.word	.L174
	.word	.L167
	.word	.L167
	.word	.L151
	.section	.text.bm_print
.L68:
	ori	a5,a5,16
	mv	s0,s1
	j	.L219
.L67:
	ori	a5,a5,4
	mv	s0,s1
	j	.L219
.L66:
	ori	a5,a5,32
	mv	s0,s1
	j	.L219
.L64:
	ori	a5,a5,8
	mv	s0,s1
	j	.L219
.L218:
	lbu	a6,1(s1)
	li	a0,55
	addi	s0,s1,1
	addi	a1,a6,-65
	andi	a1,a1,0xff
	bgtu	a1,a0,.L80
	lui	a0,%hi(.L82)
	slli	a1,a1,2
	addi	a0,a0,%lo(.L82)
	add	a1,a1,a0
	lw	a1,0(a1)
	jr	a1
	.section	.rodata.bm_print
	.align	2
	.align	2
.L82:
	.word	.L81
	.word	.L80
	.word	.L80
	.word	.L80
	.word	.L80
	.word	.L80
	.word	.L80
	.word	.L80
	.word	.L80
	.word	.L80
	.word	.L80
	.word	.L80
	.word	.L80
	.word	.L80
	.word	.L80
	.word	.L80
	.word	.L80
	.word	.L80
	.word	.L80
	.word	.L80
	.word	.L80
	.word	.L80
	.word	.L80
	.word	.L83
	.word	.L80
	.word	.L80
	.word	.L80
	.word	.L80
	.word	.L80
	.word	.L80
	.word	.L80
	.word	.L80
	.word	.L84
	.word	.L80
	.word	.L85
	.word	.L86
	.word	.L80
	.word	.L80
	.word	.L80
	.word	.L80
	.word	.L86
	.word	.L80
	.word	.L80
	.word	.L80
	.word	.L80
	.word	.L80
	.word	.L87
	.word	.L88
	.word	.L80
	.word	.L80
	.word	.L89
	.word	.L80
	.word	.L210
	.word	.L80
	.word	.L80
	.word	.L159
	.section	.text.bm_print
.L167:
	mv	a6,a2
	mv	s0,s1
.L80:
	li	a5,37
	addi	a4,s6,1
	beq	a6,a5,.L142
	sb	a5,0(s6)
	lbu	a6,0(s0)
	bnez	a6,.L220
	mv	s6,a4
.L60:
	sb	zero,0(s6)
	lbu	a0,48(sp)
	beqz	a0,.L166
	li	s0,1
	sub	s0,s0,s2
.L148:
	call	bm_putc
	add	a5,s2,s0
	addi	s2,s2,1
	lbu	a0,0(s2)
	bnez	a0,.L148
.L59:
	lw	ra,1132(sp)
	lw	s0,1128(sp)
	lw	s1,1124(sp)
	lw	s2,1120(sp)
	lw	s3,1116(sp)
	lw	s4,1112(sp)
	lw	s5,1108(sp)
	lw	s6,1104(sp)
	lw	s7,1100(sp)
	lw	s8,1096(sp)
	lw	s9,1092(sp)
	lw	s10,1088(sp)
	lw	s11,1084(sp)
	mv	a0,a5
	addi	sp,sp,1168
	jr	ra
.L217:
	lbu	a2,1(s1)
	li	a1,9
	addi	a0,s1,1
	addi	a4,a2,-48
	andi	a4,a4,0xff
	bleu	a4,a1,.L221
	li	a4,42
	beq	a2,a4,.L222
	mv	s1,a0
	li	a4,0
	j	.L75
.L215:
	li	a3,0
	li	a1,9
.L72:
	slli	a4,a3,2
	add	a3,a4,a3
	addi	s1,s1,1
	slli	a3,a3,1
	add	a3,a3,a2
	lbu	a2,0(s1)
	addi	a3,a3,-48
	addi	a4,a2,-48
	andi	a4,a4,0xff
	bleu	a4,a1,.L72
	j	.L73
.L221:
	li	a4,0
	li	a6,9
.L77:
	slli	a1,a4,2
	add	a4,a1,a4
	addi	a0,a0,1
	slli	a4,a4,1
	add	a4,a4,a2
	lbu	a2,0(a0)
	addi	a4,a4,-48
	addi	a1,a2,-48
	andi	a1,a1,0xff
	bleu	a1,a6,.L77
	mv	s1,a0
	j	.L75
.L81:
	ori	a5,a5,64
.L84:
	li	a1,108
	lw	a4,0(s8)
	addi	s8,s8,4
	bne	a2,a1,.L112
	andi	a2,a5,64
	bnez	a2,.L162
	mv	a2,s3
.L113:
	lbu	a0,0(a4)
	lbu	t3,1(a4)
	lbu	t1,2(a4)
	lbu	a7,3(a4)
	lbu	a6,4(a4)
	lbu	a1,5(a4)
	srli	t0,a0,4
	srli	t2,t3,4
	srli	t6,t1,4
	srli	t5,a7,4
	srli	t4,a6,4
	andi	a0,a0,15
	andi	t3,t3,15
	andi	t1,t1,15
	andi	a7,a7,15
	andi	a6,a6,15
	srli	a4,a1,4
	add	a0,a2,a0
	add	t0,a2,t0
	add	t2,a2,t2
	add	t3,a2,t3
	add	t6,a2,t6
	add	t1,a2,t1
	add	t5,a2,t5
	add	a7,a2,a7
	add	t4,a2,t4
	add	a6,a2,a6
	lbu	s9,0(a0)
	lbu	t0,0(t0)
	lbu	t2,0(t2)
	lbu	t3,0(t3)
	lbu	t6,0(t6)
	lbu	t1,0(t1)
	lbu	t5,0(t5)
	lbu	a7,0(a7)
	lbu	t4,0(t4)
	lbu	a6,0(a6)
	add	a0,a2,a4
	lbu	a0,0(a0)
	li	a4,58
	andi	a1,a1,15
	sb	s9,25(sp)
	sb	a4,26(sp)
	sb	a4,29(sp)
	sb	a4,32(sp)
	sb	a4,35(sp)
	sb	a4,38(sp)
	sb	t0,24(sp)
	sb	t2,27(sp)
	sb	t3,28(sp)
	sb	t6,30(sp)
	sb	t1,31(sp)
	sb	t5,33(sp)
	sb	a7,34(sp)
	sb	t4,36(sp)
	sb	a6,37(sp)
	add	a4,a2,a1
	sb	a0,39(sp)
	lbu	a4,0(a4)
	andi	a5,a5,16
	addi	s9,a3,-1
	sb	a4,40(sp)
	bnez	a5,.L114
	li	a5,17
	ble	a3,a5,.L223
	addi	s9,a3,-17
	mv	a0,s6
	mv	a2,s9
	li	a1,32
	call	memset
	add	s6,s6,s9
	li	a3,16
	li	s9,15
.L114:
	li	a2,17
	addi	a1,sp,24
	mv	a0,s6
	sw	a3,12(sp)
	call	memcpy
	lw	a3,12(sp)
	li	s10,17
	addi	a4,s6,17
	ble	a3,s10,.L116
	li	a1,32
	li	a2,18
	li	a3,17
.L117:
	addi	a4,a4,1
	sub	a5,a2,a4
	add	a5,s6,a5
	sb	a1,-1(a4)
	add	a5,a5,s9
	bgt	a5,a3,.L117
.L116:
	lbu	a5,2(s1)
	mv	s6,a4
	j	.L62
.L111:
	lw	a4,0(s8)
	ori	a5,a5,64
	addi	s8,s8,4
	mv	s0,s1
.L112:
	lbu	a2,0(a4)
	beqz	a2,.L118
	li	a1,99
	ble	a2,a1,.L224
	li	a0,100
	rem	t1,a2,a0
	li	a7,10
	li	a1,4
	li	s1,3
	li	a6,2
	div	a2,a2,a0
	div	a0,t1,a7
	add	a2,s3,a2
	lbu	a2,0(a2)
	sb	a2,24(sp)
	add	a2,s3,a0
	lbu	a0,0(a2)
	rem	a2,t1,a7
	sb	a0,25(sp)
.L122:
	add	a2,s3,a2
	lbu	a0,0(a2)
	addi	a2,sp,1072
	add	a2,a2,a6
	sb	a0,-1048(a2)
	addi	a0,sp,1072
	lbu	a2,1(a4)
	add	a0,a0,s1
	li	a6,46
	sb	a6,-1048(a0)
	beqz	a2,.L123
.L229:
	li	a6,99
	ble	a2,a6,.L225
	li	a6,100
	li	a7,10
	addi	t3,sp,1072
	add	t3,t3,a1
	addi	a1,s1,3
	rem	t1,a2,a6
	div	a2,a2,a6
	div	a6,t1,a7
	add	a2,s3,a2
	lbu	a2,0(a2)
	sb	a2,-1048(t3)
	add	a2,s3,a6
	lbu	a6,0(a2)
	rem	a2,t1,a7
	sb	a6,-1046(a0)
.L127:
	add	a2,s3,a2
	lbu	a0,0(a2)
	addi	a2,sp,1072
	add	a2,a2,a1
	addi	s1,a1,1
	sb	a0,-1048(a2)
	addi	a1,sp,1072
	lbu	a2,2(a4)
	add	a0,a1,s1
	li	a1,46
	sb	a1,-1048(a0)
	addi	a1,s1,1
	beqz	a2,.L128
.L230:
	li	a6,99
	ble	a2,a6,.L226
	li	a6,100
	li	a7,10
	addi	t3,sp,1072
	add	t3,t3,a1
	addi	a1,s1,3
	rem	t1,a2,a6
	div	a2,a2,a6
	div	a6,t1,a7
	add	a2,s3,a2
	lbu	a2,0(a2)
	sb	a2,-1048(t3)
	add	a2,s3,a6
	lbu	a6,0(a2)
	rem	a2,t1,a7
	sb	a6,-1046(a0)
.L132:
	add	a2,s3,a2
	lbu	a0,0(a2)
	addi	a2,sp,1072
	add	a2,a2,a1
	addi	s1,a1,1
	sb	a0,-1048(a2)
	lbu	a4,3(a4)
	addi	a2,sp,1072
	add	a1,a2,s1
	li	a2,46
	sb	a2,-1048(a1)
	addi	a2,s1,1
	beqz	a4,.L133
.L231:
	li	a0,99
	ble	a4,a0,.L227
	li	a0,100
	li	a6,10
	addi	t1,sp,1072
	add	t1,t1,a2
	addi	a2,s1,3
	rem	a7,a4,a0
	div	a4,a4,a0
	div	a0,a7,a6
	add	a4,s3,a4
	lbu	a4,0(a4)
	sb	a4,-1048(t1)
	add	a4,s3,a0
	lbu	a0,0(a4)
	rem	a4,a7,a6
	sb	a0,-1046(a1)
.L137:
	add	a4,s3,a4
	lbu	a1,0(a4)
	addi	a4,sp,1072
	add	a4,a4,a2
	addi	s1,a2,1
	sb	a1,-1048(a4)
.L136:
	andi	a5,a5,16
	addi	s9,a3,-1
	bnez	a5,.L138
	ble	a3,s1,.L228
	sub	s9,a3,s1
	mv	a0,s6
	mv	a2,s9
	li	a1,32
	call	memset
	add	s6,s6,s9
	addi	a3,s1,-1
	addi	s9,s1,-2
.L138:
	mv	a0,s6
	mv	a2,s1
	addi	a1,sp,24
	sw	a3,12(sp)
	call	memcpy
	lw	a3,12(sp)
	add	a4,s6,s1
	mv	s6,a4
	ble	a3,s1,.L212
	li	a2,32
	li	a3,1
.L141:
	addi	s6,s6,1
	sub	a5,a3,s6
	add	a5,a5,s9
	sb	a2,-1(s6)
	add	a5,a4,a5
	blt	s1,a5,.L141
.L212:
	lbu	a5,1(s0)
	j	.L62
.L216:
	lw	a3,0(s8)
	addi	s1,s0,2
	addi	s8,s8,4
	lbu	a2,2(s0)
	bgez	a3,.L73
	sub	a3,zero,a3
	ori	a5,a5,16
	j	.L73
.L118:
	li	a2,48
	sb	a2,24(sp)
	li	s1,1
	addi	a0,sp,1072
	lbu	a2,1(a4)
	add	a0,a0,s1
	li	a6,46
	sb	a6,-1048(a0)
	li	a1,2
	bnez	a2,.L229
.L123:
	addi	a2,sp,1072
	add	a2,a2,a1
	li	a1,48
	sb	a1,-1048(a2)
	addi	s1,s1,2
	addi	a1,sp,1072
	lbu	a2,2(a4)
	add	a0,a1,s1
	li	a1,46
	sb	a1,-1048(a0)
	addi	a1,s1,1
	bnez	a2,.L230
.L128:
	addi	a2,sp,1072
	add	a2,a2,a1
	li	a1,48
	sb	a1,-1048(a2)
	addi	s1,s1,2
	addi	a2,sp,1072
	lbu	a4,3(a4)
	add	a1,a2,s1
	li	a2,46
	sb	a2,-1048(a1)
	addi	a2,s1,1
	bnez	a4,.L231
.L133:
	addi	a4,sp,1072
	add	a4,a4,a2
	li	a2,48
	addi	s1,s1,2
	sb	a2,-1048(a4)
	j	.L136
.L174:
	mv	s0,s1
.L210:
	li	a2,10
.L91:
	addi	a0,s8,4
.L145:
	lw	a1,0(s8)
	mv	s8,a0
	mv	a0,s6
	call	number
	mv	s6,a0
	lbu	a5,1(s0)
	j	.L62
.L171:
	mv	s0,s1
.L87:
	li	a2,8
	j	.L91
.L169:
	mv	s0,s1
.L85:
	andi	a5,a5,16
	addi	s1,a3,-1
	beqz	a5,.L232
.L92:
	lw	a5,0(s8)
	addi	a4,s6,1
	addi	s8,s8,4
	sb	a5,0(s6)
	blez	s1,.L211
	mv	a2,s1
	li	a1,32
	mv	a0,a4
	call	memset
	add	s6,a0,s1
	lbu	a5,1(s0)
	j	.L62
.L168:
	mv	s0,s1
.L83:
	ori	a5,a5,64
	li	a2,16
	j	.L91
.L172:
	mv	s0,s1
.L88:
	li	a2,-1
	bne	a3,a2,.L110
	ori	a5,a5,1
	li	a3,8
.L110:
	lw	a1,0(s8)
	mv	a0,s6
	li	a2,16
	call	number
	addi	s8,s8,4
	mv	s6,a0
	lbu	a5,1(s0)
	j	.L62
.L173:
	mv	s0,s1
.L89:
	lw	s9,0(s8)
	mv	a2,a4
	addi	s8,s8,4
	beqz	s9,.L96
	lbu	a1,0(s9)
	mv	s1,s9
	beqz	a1,.L97
.L152:
	beqz	a4,.L97
	mv	a4,s9
	j	.L100
.L98:
	addi	a2,a2,-1
	beqz	a2,.L209
.L100:
	addi	a4,a4,1
	lbu	a1,0(a4)
	bnez	a1,.L98
.L209:
	andi	a5,a5,16
	sub	s1,a4,s1
	addi	s10,a3,-1
	beqz	a5,.L153
.L101:
	blez	s1,.L160
	addi	a5,s6,4
	addi	a2,s9,4
	sltu	a5,s9,a5
	sltu	a2,s6,a2
	xori	a5,a5,1
	xori	a2,a2,1
	sltiu	a4,s1,10
	or	a5,a5,a2
	xori	a4,a4,1
	and	a5,a4,a5
	beqz	a5,.L104
	or	a5,s9,s6
	andi	a5,a5,3
	bnez	a5,.L104
	srli	a0,s1,2
	mv	a2,s6
	mv	a4,s9
.L105:
	lw	a1,0(a4)
	addi	a2,a2,4
	addi	a5,a5,1
	sw	a1,-4(a2)
	addi	a4,a4,4
	bgtu	a0,a5,.L105
	andi	a5,s1,-4
	add	s9,s9,a5
	add	a2,s6,a5
	beq	a5,s1,.L108
	lbu	a1,0(s9)
	addi	a4,a5,1
	sb	a1,0(a2)
	bge	a4,s1,.L108
	lbu	a4,1(s9)
	addi	a5,a5,2
	sb	a4,1(a2)
	ble	s1,a5,.L108
	lbu	a5,2(s9)
	sb	a5,2(a2)
.L108:
	add	a4,s6,s1
.L103:
	mv	s6,a4
	li	a1,32
	li	a2,1
	bge	s1,a3,.L212
.L109:
	addi	s6,s6,1
	sub	a5,a2,s6
	add	a5,a5,s10
	sb	a1,-1(s6)
	add	a5,a4,a5
	blt	s1,a5,.L109
	lbu	a5,1(s0)
	j	.L62
.L170:
	mv	s0,s1
.L86:
	ori	a5,a5,2
	li	a2,10
	j	.L91
.L159:
	li	a2,16
	j	.L91
.L150:
	lw	a4,0(s8)
	mv	s0,s1
	addi	s8,s8,4
	j	.L112
.L151:
	addi	a0,s8,4
	mv	s0,s1
	li	a2,16
	j	.L145
.L153:
	ble	a3,s1,.L233
	sub	s11,a3,s1
	mv	a0,s6
	mv	a2,s11
	li	a1,32
	sw	a3,12(sp)
	call	memset
	lw	a3,12(sp)
	add	s6,s6,s11
	sub	a3,s10,a3
	add	a3,a3,s1
	addi	s10,a3,-1
	j	.L101
.L222:
	lw	a4,0(s8)
	lbu	a2,2(s1)
	addi	s8,s8,4
	not	a1,a4
	srai	a1,a1,31
	and	a4,a4,a1
	addi	s1,s1,2
	j	.L75
.L166:
	li	a5,0
	j	.L59
.L154:
	addi	s2,sp,48
	mv	s6,s2
	j	.L60
.L220:
	addi	a5,s6,2
	mv	s6,a4
	mv	a4,a5
.L142:
	sb	a6,0(s6)
.L211:
	lbu	a5,1(s0)
	mv	s6,a4
	j	.L62
.L162:
	lui	a2,%hi(.LC1)
	addi	a2,a2,%lo(.LC1)
	j	.L113
.L232:
	blez	s1,.L234
	mv	a2,s1
	mv	a0,s6
	li	a1,32
	add	s6,s6,s1
	call	memset
	li	s1,-1
	j	.L92
.L225:
	li	a0,9
	ble	a2,a0,.L127
	li	a6,10
	div	a0,a2,a6
	addi	a7,sp,1072
	add	a7,a7,a1
	addi	a1,s1,2
	add	a0,s3,a0
	lbu	a0,0(a0)
	rem	a2,a2,a6
	sb	a0,-1048(a7)
	j	.L127
.L224:
	li	a1,9
	ble	a2,a1,.L163
	li	a7,10
	div	a0,a2,a7
	li	a1,3
	li	s1,2
	li	a6,1
	add	a0,s3,a0
	lbu	a0,0(a0)
	rem	a2,a2,a7
	sb	a0,24(sp)
	j	.L122
.L227:
	li	a1,9
	ble	a4,a1,.L137
	li	a0,10
	div	a1,a4,a0
	addi	a6,sp,1072
	add	a6,a6,a2
	addi	a2,s1,2
	add	a1,s3,a1
	lbu	a1,0(a1)
	rem	a4,a4,a0
	sb	a1,-1048(a6)
	j	.L137
.L226:
	li	a0,9
	ble	a2,a0,.L132
	li	a6,10
	div	a0,a2,a6
	addi	a7,sp,1072
	add	a7,a7,a1
	addi	a1,s1,2
	add	a0,s3,a0
	lbu	a0,0(a0)
	rem	a2,a2,a6
	sb	a0,-1048(a7)
	j	.L132
.L96:
	addi	s1,s5,%lo(.LC2)
	addi	s9,s5,%lo(.LC2)
	j	.L152
.L163:
	li	a1,2
	li	s1,1
	li	a6,0
	j	.L122
.L97:
	andi	s1,a5,16
	addi	s10,a3,-1
	beqz	s1,.L153
	mv	a4,s6
	li	s1,0
	j	.L103
.L104:
	add	a2,s9,s1
	mv	a5,s6
.L107:
	addi	s9,s9,1
	lbu	a4,-1(s9)
	addi	a5,a5,1
	sb	a4,-1(a5)
	bne	s9,a2,.L107
	j	.L108
.L228:
	addi	a5,a3,-2
	mv	a3,s9
	mv	s9,a5
	j	.L138
.L234:
	lw	a5,0(s8)
	addi	a4,s6,1
	addi	s8,s8,4
	sb	a5,0(s6)
	j	.L211
.L223:
	addi	a5,a3,-2
	mv	a3,s9
	mv	s9,a5
	j	.L114
.L160:
	mv	a4,s6
	j	.L103
.L233:
	mv	a3,s10
	addi	s10,s10,-1
	j	.L101
	.size	bm_print, .-bm_print
	.section	.text.bm_printf,"ax",@progbits
	.align	2
	.globl	bm_printf
	.type	bm_printf, @function
bm_printf:
	addi	sp,sp,-48
	sw	s0,8(sp)
	mv	s0,a0
	li	a0,0
	sw	ra,12(sp)
	sw	a1,20(sp)
	sw	a2,24(sp)
	sw	a3,28(sp)
	sw	a4,32(sp)
	sw	a5,36(sp)
	sw	a6,40(sp)
	sw	a7,44(sp)
	call	bm_access_file
	mv	a0,s0
	call	bm_print
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,48
	jr	ra
	.size	bm_printf, .-bm_printf
	.section	.text.bm_fprintf,"ax",@progbits
	.align	2
	.globl	bm_fprintf
	.type	bm_fprintf, @function
bm_fprintf:
	addi	sp,sp,-48
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	a2,24(sp)
	mv	s0,a1
	sw	a3,28(sp)
	sw	a4,32(sp)
	sw	a5,36(sp)
	sw	a6,40(sp)
	sw	a7,44(sp)
	call	bm_access_file
	mv	a0,s0
	call	bm_print
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,48
	jr	ra
	.size	bm_fprintf, .-bm_fprintf
	.section	.rodata.bm_print.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"<NULL>"
	.section	.rodata.number.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"0123456789abcdefghijklmnopqrstuvwxyz"
	.zero	3
.LC1:
	.string	"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	.ident	"GCC: (GNU MCU Eclipse RISC-V Embedded GCC, 64-bits) 7.2.0"
