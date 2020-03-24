	.file	"qprintf.c"
	.option nopic
	.section	.text.qprinti.constprop.1,"ax",@progbits
	.align	2
	.type	qprinti.constprop.1, @function
qprinti.constprop.1:
	addi	sp,sp,-80
	sw	s1,68(sp)
	sw	s3,60(sp)
	sw	ra,76(sp)
	sw	s0,72(sp)
	sw	s2,64(sp)
	sw	s4,56(sp)
	sw	s5,52(sp)
	mv	s3,a0
	mv	s1,a3
	beqz	a0,.L74
	mv	s2,a2
	beqz	a2,.L13
	li	a3,10
	beq	a1,a3,.L75
.L13:
	sb	zero,47(sp)
	li	a3,16
	li	s2,0
	beq	a1,a3,.L76
.L15:
	lui	a1,%hi(.LANCHOR0)
	li	a2,429498368
	addi	s3,sp,47
	addi	a1,a1,%lo(.LANCHOR0)
	addi	a2,a2,-1639
.L20:
	mul	a3,a0,a2
	srli	a6,a0,1
	srli	a5,a0,2
	add	a5,a5,a6
	srli	a7,a5,4
	add	a5,a5,a7
	srli	a7,a5,8
	srli	t1,a0,3
	add	a5,a5,a7
	srli	a7,a5,16
	add	a3,a3,a6
	add	a3,a3,t1
	srli	a3,a3,28
	add	a5,a5,a7
	srli	a5,a5,3
	add	a3,a1,a3
	lbu	s0,0(a3)
	slli	a3,a5,2
	add	a3,a3,a5
	addi	a0,a0,6
	slli	a3,a3,1
	addi	s0,s0,48
	sub	a0,a0,a3
	addi	s3,s3,-1
	andi	s0,s0,0xff
	srli	a0,a0,4
	sb	s0,0(s3)
	add	a0,a0,a5
	bnez	a0,.L20
	beqz	s2,.L45
	beqz	s1,.L22
	andi	s2,a4,2
	mv	a2,s2
	beqz	s2,.L23
	li	a0,45
	sw	a4,12(sp)
	call	uart_sendchar
	lw	a4,12(sp)
	lbu	s0,0(s3)
	addi	s1,s1,-1
	mv	s4,s3
	li	s2,1
.L21:
	blez	s1,.L72
	beqz	s0,.L48
	andi	a2,a4,2
.L24:
	mv	a5,s4
	li	s3,0
.L28:
	addi	a5,a5,1
	lbu	a3,0(a5)
	addi	s3,s3,1
	bnez	a3,.L28
	blt	s3,s1,.L29
	li	s5,32
	bnez	a2,.L77
.L31:
	li	s1,0
	li	s3,0
.L36:
	mv	a0,s0
	addi	s4,s4,1
	call	uart_sendchar
	lbu	s0,0(s4)
	addi	s3,s3,1
	bnez	s0,.L36
.L37:
	blez	s1,.L39
	mv	s0,s1
.L40:
	addi	s0,s0,-1
	mv	a0,s5
	call	uart_sendchar
	bnez	s0,.L40
	add	s3,s3,s1
.L39:
	add	s2,s3,s2
.L1:
	lw	ra,76(sp)
	lw	s0,72(sp)
	mv	a0,s2
	lw	s1,68(sp)
	lw	s2,64(sp)
	lw	s3,60(sp)
	lw	s4,56(sp)
	lw	s5,52(sp)
	addi	sp,sp,80
	jr	ra
.L76:
	addi	s4,sp,47
	li	a2,9
	addi	a5,a5,-58
.L41:
	andi	a3,a0,15
	add	s0,a5,a3
	addi	s0,s0,48
	andi	s0,s0,0xff
	addi	s4,s4,-1
	bgt	a3,a2,.L71
	addi	s0,a3,48
.L71:
	sb	s0,0(s4)
	srli	a0,a0,4
	bnez	a0,.L41
	li	s2,0
	andi	a2,a4,2
	bgtz	s1,.L24
.L72:
	li	s5,32
	li	s3,0
	bnez	s0,.L36
	j	.L39
.L74:
	li	a5,48
	sh	a5,16(sp)
	blez	a3,.L42
	addi	s0,sp,16
	li	a2,1
	mv	a5,s0
	sub	a2,a2,s0
.L4:
	add	a1,a5,a2
	addi	a5,a5,1
	lbu	a3,0(a5)
	bnez	a3,.L4
	bgt	s1,a1,.L5
	andi	s1,a4,2
	beqz	s1,.L78
	li	s1,0
	li	s4,48
.L3:
	li	a0,48
	j	.L9
.L44:
	mv	s3,s2
.L9:
	addi	s0,s0,1
	call	uart_sendchar
	lbu	a0,0(s0)
	addi	s2,s3,1
	bnez	a0,.L44
	blez	s1,.L1
	mv	s0,s1
.L12:
	addi	s0,s0,-1
	mv	a0,s4
	call	uart_sendchar
	bnez	s0,.L12
	add	s2,s3,s1
	addi	s2,s2,1
	j	.L1
.L22:
	li	a5,45
	addi	s4,s3,-1
	sb	a5,-1(s3)
.L25:
	li	s0,45
	li	s2,0
	li	s5,32
	li	s3,0
	j	.L36
.L75:
	bltz	a0,.L79
	sb	zero,47(sp)
	li	s2,0
	j	.L15
.L77:
	li	s5,48
	j	.L31
.L42:
	li	s4,32
	addi	s0,sp,16
	j	.L3
.L29:
	sub	s3,s1,s3
.L27:
	li	s5,32
	beqz	a2,.L33
	li	s5,48
.L33:
	andi	a4,a4,1
	mv	s1,s3
	bnez	a4,.L34
	blez	s3,.L52
.L35:
	addi	s1,s1,-1
	mv	a0,s5
	call	uart_sendchar
	bnez	s1,.L35
	bnez	s0,.L36
	j	.L39
.L34:
	li	s3,0
	bnez	s0,.L36
	j	.L37
.L5:
	andi	a5,a4,2
	sub	s2,s1,a1
	li	s4,48
	beqz	a5,.L80
.L7:
	andi	a4,a4,1
	mv	s1,s2
	bnez	a4,.L3
.L8:
	addi	s1,s1,-1
	mv	a0,s4
	call	uart_sendchar
	bnez	s1,.L8
	mv	s3,s2
	j	.L3
.L23:
	li	a5,45
	sb	a5,-1(s3)
	addi	s4,s3,-1
	li	s0,45
	bgtz	s1,.L24
	j	.L25
.L80:
	li	s4,32
	j	.L7
.L78:
	li	s3,0
	li	s4,32
	j	.L3
.L48:
	mv	s3,s1
	andi	a2,a4,2
	j	.L27
.L45:
	mv	s4,s3
	j	.L21
.L79:
	sub	a0,zero,a0
	sb	zero,47(sp)
	j	.L15
.L52:
	li	s3,0
	bnez	s0,.L36
	j	.L39
	.size	qprinti.constprop.1, .-qprinti.constprop.1
	.section	.text.putchar,"ax",@progbits
	.align	2
	.globl	putchar
	.type	putchar, @function
putchar:
	addi	sp,sp,-16
	sw	s0,8(sp)
	mv	s0,a0
	andi	a0,a0,0xff
	sw	ra,12(sp)
	call	uart_sendchar
	mv	a0,s0
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	putchar, .-putchar
	.section	.text.printf,"ax",@progbits
	.align	2
	.globl	printf
	.type	printf, @function
printf:
	addi	sp,sp,-160
	sw	s9,84(sp)
	sw	s10,80(sp)
	sw	ra,124(sp)
	sw	s0,120(sp)
	sw	s1,116(sp)
	sw	s2,112(sp)
	sw	s3,108(sp)
	sw	s4,104(sp)
	sw	s5,100(sp)
	sw	s6,96(sp)
	sw	s7,92(sp)
	sw	s8,88(sp)
	sw	s11,76(sp)
	sw	a1,132(sp)
	sw	a2,136(sp)
	sw	a3,140(sp)
	sw	a4,144(sp)
	sw	a5,148(sp)
	sw	a6,152(sp)
	sw	a7,156(sp)
	mv	s9,a0
	lbu	a0,0(a0)
	addi	s10,sp,132
	sw	s10,28(sp)
	beqz	a0,.L189
	li	s3,1
	addi	s5,sp,24
	sub	a5,s3,s5
	sw	a5,0(sp)
	addi	a5,sp,32
	sub	a5,s3,a5
	li	s1,0
	li	s2,37
	li	s4,45
	sw	a5,4(sp)
	j	.L187
.L85:
	call	uart_sendchar
	mv	a5,s7
	addi	s1,s1,1
	mv	s7,s9
	mv	s9,a5
.L110:
	lbu	a0,1(s7)
	beqz	a0,.L83
.L187:
	addi	s7,s9,1
	bne	a0,s2,.L85
	lbu	a0,1(s9)
	beqz	a0,.L83
	bne	a0,s2,.L86
	addi	a5,s9,2
	mv	s9,s7
	mv	s7,a5
	j	.L85
.L86:
	li	a4,0
	bne	a0,s4,.L87
	lbu	a0,2(s9)
	addi	s7,s9,2
	li	a4,1
.L87:
	li	a5,48
	bne	a0,a5,.L191
.L89:
	addi	s7,s7,1
	lbu	a0,0(s7)
	ori	a4,a4,2
	beq	a0,a5,.L89
	li	s0,2
.L88:
	addi	a5,a0,-48
	andi	a2,a5,0xff
	li	a3,9
	li	s8,0
	bgtu	a2,a3,.L90
	li	a1,9
.L91:
	addi	s7,s7,1
	slli	a3,s8,2
	lbu	a0,0(s7)
	add	a3,a3,s8
	slli	a3,a3,1
	add	s8,a5,a3
	addi	a5,a0,-48
	andi	a3,a5,0xff
	bleu	a3,a1,.L91
.L90:
	li	a5,115
	addi	s9,s7,1
	beq	a0,a5,.L286
	li	a5,100
	beq	a0,a5,.L287
	li	a5,117
	beq	a0,a5,.L288
	li	a5,120
	beq	a0,a5,.L289
	li	a5,88
	beq	a0,a5,.L290
	li	a5,99
	bne	a0,a5,.L110
	lbu	a5,0(s10)
	sb	zero,25(sp)
	addi	s10,s10,4
	sb	a5,24(sp)
	beqz	s8,.L171
	beqz	a5,.L217
	lw	a2,0(sp)
	mv	a3,s5
.L173:
	add	a0,a3,a2
	addi	a3,a3,1
	lbu	a1,0(a3)
	bnez	a1,.L173
	blt	a0,s8,.L172
	bnez	s0,.L174
	andi	s0,a4,1
	bnez	s0,.L291
	li	s8,0
	li	s11,32
.L175:
	beqz	a5,.L284
.L183:
	mv	s6,s5
.L181:
	mv	a0,a5
	addi	s6,s6,1
	call	uart_sendchar
	lbu	a5,0(s6)
	addi	s8,s8,1
	bnez	a5,.L181
.L182:
	blez	s0,.L284
	mv	s6,s0
.L185:
	addi	s6,s6,-1
	mv	a0,s11
	call	uart_sendchar
	bnez	s6,.L185
	add	a3,s8,s0
	add	s1,s1,a3
.L293:
	lbu	a0,1(s7)
	bnez	a0,.L187
.L83:
	lw	ra,124(sp)
	lw	s0,120(sp)
	mv	a0,s1
	lw	s2,112(sp)
	lw	s1,116(sp)
	lw	s3,108(sp)
	lw	s4,104(sp)
	lw	s5,100(sp)
	lw	s6,96(sp)
	lw	s7,92(sp)
	lw	s8,88(sp)
	lw	s9,84(sp)
	lw	s10,80(sp)
	lw	s11,76(sp)
	addi	sp,sp,160
	jr	ra
.L286:
	lw	s6,0(s10)
	addi	s10,s10,4
	beqz	s6,.L93
	lbu	a0,0(s6)
	beqz	s8,.L94
	beqz	a0,.L193
.L188:
	mv	a3,s6
	sub	a7,s3,s6
.L96:
	add	a0,a3,a7
	addi	a3,a3,1
	lbu	a1,0(a3)
	bnez	a1,.L96
	blt	a0,s8,.L95
	bnez	s0,.L97
	andi	s0,a4,1
	bnez	s0,.L292
	li	s8,0
	li	s11,32
.L98:
	lbu	a0,0(s6)
	bnez	a0,.L104
.L284:
	add	s1,s1,s8
	j	.L110
.L191:
	li	s0,0
	j	.L88
.L94:
	li	s0,0
	li	s11,32
	beqz	a0,.L110
.L104:
	addi	s6,s6,1
	call	uart_sendchar
	lbu	a0,0(s6)
	addi	s8,s8,1
	bnez	a0,.L104
.L105:
	blez	s0,.L284
	mv	s6,s0
.L108:
	addi	s6,s6,-1
	mv	a0,s11
	call	uart_sendchar
	bnez	s6,.L108
	add	a3,s8,s0
	add	s1,s1,a3
	j	.L293
.L287:
	lw	a0,0(s10)
	li	a5,97
	mv	a3,s8
	li	a2,1
	li	a1,10
	call	qprinti.constprop.1
	addi	s10,s10,4
	add	s1,s1,a0
	j	.L110
.L288:
	lw	a0,0(s10)
	li	a5,97
	mv	a3,s8
	li	a2,0
	li	a1,10
	call	qprinti.constprop.1
	addi	s10,s10,4
	add	s1,s1,a0
	j	.L110
.L289:
	lw	a1,0(s10)
	addi	a5,s10,4
	sw	a5,12(sp)
	beqz	a1,.L294
	sb	zero,63(sp)
	addi	s11,sp,63
	li	a7,9
.L128:
	andi	a0,a1,15
	addi	s10,a0,87
	addi	s11,s11,-1
	bgt	a0,a7,.L279
	addi	s10,a0,48
.L279:
	sb	s10,0(s11)
	srli	a1,a1,4
	bnez	a1,.L128
	mv	a1,s11
	li	a0,0
	beqz	s8,.L295
.L132:
	addi	a1,a1,1
	lbu	a7,0(a1)
	addi	a0,a0,1
	bnez	a7,.L132
	blt	a0,s8,.L133
	bnez	s0,.L134
	li	a5,32
	andi	s0,a4,1
	sw	a5,8(sp)
	li	s8,0
	beqz	s0,.L140
.L136:
	mv	s0,s8
	li	s8,0
	j	.L140
.L206:
	mv	s8,a4
.L140:
	mv	a0,s10
	addi	s11,s11,1
	call	uart_sendchar
	lbu	s10,0(s11)
	addi	a4,s8,1
	bnez	s10,.L206
	mv	s6,s0
	blez	s0,.L154
.L141:
	lw	a0,8(sp)
	addi	s6,s6,-1
	call	uart_sendchar
	bnez	s6,.L141
.L282:
	add	a3,s8,s0
	addi	a5,a3,1
	add	s1,s1,a5
	lw	s10,12(sp)
	j	.L110
.L193:
	li	a0,0
.L95:
	sub	s8,s8,a0
	li	s11,32
	beqz	s0,.L101
	li	s11,48
.L101:
	andi	s0,a4,1
	bnez	s0,.L102
	mv	s0,s8
	blez	s8,.L197
.L103:
	addi	s0,s0,-1
	mv	a0,s11
	call	uart_sendchar
	bnez	s0,.L103
	j	.L98
.L290:
	lw	a1,0(s10)
	addi	a5,s10,4
	sw	a5,12(sp)
	beqz	a1,.L296
	sb	zero,63(sp)
	addi	s11,sp,63
	li	a7,9
.L157:
	andi	a0,a1,15
	addi	s10,a0,55
	addi	s11,s11,-1
	bgt	a0,a7,.L281
	addi	s10,a0,48
.L281:
	sb	s10,0(s11)
	srli	a1,a1,4
	bnez	a1,.L157
	mv	a1,s11
	li	a0,0
	beqz	s8,.L297
.L161:
	addi	a1,a1,1
	lbu	a7,0(a1)
	addi	a0,a0,1
	bnez	a7,.L161
	bgt	s8,a0,.L162
	bnez	s0,.L163
	li	a5,32
	andi	s0,a4,1
	sw	a5,8(sp)
	li	s8,0
	beqz	s0,.L169
.L165:
	mv	s0,s8
	li	s8,0
	j	.L169
.L215:
	mv	s8,a4
.L169:
	mv	a0,s10
	addi	s11,s11,1
	call	uart_sendchar
	lbu	s10,0(s11)
	addi	a4,s8,1
	bnez	s10,.L215
	mv	s6,s0
	blez	s0,.L154
.L170:
	lw	a0,8(sp)
	addi	s6,s6,-1
	call	uart_sendchar
	bnez	s6,.L170
	j	.L282
.L93:
	lui	a5,%hi(.LC0)
	addi	s6,a5,%lo(.LC0)
	bnez	s8,.L188
	li	s0,0
	li	s11,32
	li	a0,40
	j	.L104
.L189:
	li	s1,0
	j	.L83
.L97:
	andi	s0,a4,1
	bnez	s0,.L298
	li	s8,0
	li	s11,48
	j	.L98
.L102:
	lbu	a0,0(s6)
	mv	s0,s8
	li	s8,0
	bnez	a0,.L104
	j	.L105
.L295:
	li	a5,32
	li	s0,0
	sw	a5,8(sp)
	j	.L140
.L297:
	li	a5,32
	li	s0,0
	sw	a5,8(sp)
	j	.L169
.L217:
	li	a0,0
.L172:
	sub	s8,s8,a0
	li	s11,32
	beqz	s0,.L178
	li	s11,48
.L178:
	andi	s0,a4,1
	bnez	s0,.L179
	mv	s0,s8
	blez	s8,.L221
.L180:
	mv	a0,s11
	sw	a5,8(sp)
	addi	s0,s0,-1
	call	uart_sendchar
	lw	a5,8(sp)
	bnez	s0,.L180
	bnez	a5,.L183
	j	.L284
.L294:
	li	a5,48
	sh	a5,32(sp)
	beqz	s8,.L199
	addi	a5,sp,32
.L116:
	lw	a3,4(sp)
	add	a1,a5,a3
	addi	a5,a5,1
	lbu	a3,0(a5)
	bnez	a3,.L116
	blt	a1,s8,.L117
	beqz	s0,.L299
	li	s11,48
	li	s8,0
	li	s0,0
.L115:
	addi	s6,sp,32
	li	a0,48
	j	.L123
.L201:
	mv	s8,a4
.L123:
	call	uart_sendchar
	addi	s6,s6,1
	lbu	a0,0(s6)
	addi	a4,s8,1
	bnez	a0,.L201
	beqz	s0,.L154
	mv	s6,s0
.L126:
	addi	s6,s6,-1
	mv	a0,s11
	call	uart_sendchar
	bnez	s6,.L126
	j	.L282
.L171:
	li	s0,0
	li	s11,32
	bnez	a5,.L183
	j	.L110
.L296:
	li	a5,48
	sh	a5,32(sp)
	beqz	s8,.L208
	addi	a5,sp,32
.L145:
	lw	a3,4(sp)
	add	a1,a5,a3
	addi	a5,a5,1
	lbu	a3,0(a5)
	bnez	a3,.L145
	bgt	s8,a1,.L146
	beqz	s0,.L300
	li	s11,48
	li	s8,0
	li	s0,0
.L144:
	addi	s6,sp,32
	li	a0,48
	j	.L152
.L210:
	mv	s8,a4
.L152:
	call	uart_sendchar
	addi	s6,s6,1
	lbu	a0,0(s6)
	addi	a4,s8,1
	bnez	a0,.L210
	beqz	s0,.L154
	mv	s6,s0
.L155:
	addi	s6,s6,-1
	mv	a0,s11
	call	uart_sendchar
	bnez	s6,.L155
	j	.L282
.L298:
	lbu	a0,0(s6)
	beqz	a0,.L283
	li	s11,48
	li	s0,0
	li	s8,0
	j	.L104
.L292:
	lbu	a0,0(s6)
	beqz	a0,.L283
	li	s0,0
	li	s8,0
	li	s11,32
	j	.L104
.L133:
	li	a5,32
	sw	a5,8(sp)
	sub	s8,s8,a0
	beqz	s0,.L138
	li	a5,48
	sw	a5,8(sp)
.L138:
	andi	s0,a4,1
	bnez	s0,.L136
	mv	s0,s8
	blez	s8,.L205
.L139:
	lw	a0,8(sp)
	addi	s0,s0,-1
	call	uart_sendchar
	bnez	s0,.L139
	j	.L140
.L162:
	li	a5,32
	sw	a5,8(sp)
	sub	s8,s8,a0
	beqz	s0,.L167
	li	a5,48
	sw	a5,8(sp)
.L167:
	andi	s0,a4,1
	bnez	s0,.L165
	mv	s0,s8
	blez	s8,.L214
.L168:
	lw	a0,8(sp)
	addi	s0,s0,-1
	call	uart_sendchar
	bnez	s0,.L168
	j	.L169
.L174:
	andi	s0,a4,1
	bnez	s0,.L301
	li	s8,0
	li	s11,48
	bnez	a5,.L183
	j	.L284
.L134:
	andi	s0,a4,1
	beqz	s0,.L203
	li	a5,48
	sw	a5,8(sp)
	li	s0,0
	li	s8,0
	j	.L140
.L199:
	li	s0,0
	li	s11,32
	j	.L115
.L163:
	andi	s0,a4,1
	beqz	s0,.L212
	li	a5,48
	sw	a5,8(sp)
	li	s0,0
	li	s8,0
	j	.L169
.L179:
	mv	s0,s8
	li	s8,0
	bnez	a5,.L183
	j	.L182
.L154:
	add	s1,s1,a4
	lw	s10,12(sp)
	j	.L110
.L208:
	li	s0,0
	li	s11,32
	j	.L144
.L117:
	sub	s8,s8,a1
	li	s11,48
	bnez	s0,.L121
	li	s11,32
.L121:
	andi	s0,a4,1
	beqz	s0,.L229
	mv	s0,s8
	li	s8,0
	j	.L115
.L283:
	li	s8,0
	add	s1,s1,s8
	j	.L110
.L146:
	sub	s8,s8,a1
	li	s11,48
	bnez	s0,.L150
	li	s11,32
.L150:
	andi	s0,a4,1
	beqz	s0,.L231
	mv	s0,s8
	li	s8,0
	j	.L144
.L301:
	beqz	a5,.L283
	li	s11,48
	li	s0,0
	li	s8,0
	j	.L183
.L291:
	beqz	a5,.L283
	li	s0,0
	li	s8,0
	li	s11,32
	j	.L183
.L212:
	li	a5,48
	li	s8,0
	sw	a5,8(sp)
	j	.L169
.L203:
	li	a5,48
	li	s8,0
	sw	a5,8(sp)
	j	.L140
.L299:
	li	s8,0
	li	s11,32
	j	.L115
.L300:
	li	s8,0
	li	s11,32
	j	.L144
.L229:
	mv	s0,s8
.L122:
	addi	s0,s0,-1
	mv	a0,s11
	call	uart_sendchar
	bnez	s0,.L122
	j	.L115
.L231:
	mv	s0,s8
.L151:
	addi	s0,s0,-1
	mv	a0,s11
	call	uart_sendchar
	bnez	s0,.L151
	j	.L144
.L221:
	li	s8,0
	j	.L175
.L197:
	li	s8,0
	j	.L98
.L205:
	li	s8,0
	j	.L140
.L214:
	li	s8,0
	j	.L169
	.size	printf, .-printf
	.section	.text.puts,"ax",@progbits
	.align	2
	.globl	puts
	.type	puts, @function
puts:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	ra,12(sp)
	sw	s1,4(sp)
	mv	s0,a0
	lbu	a0,0(a0)
	beqz	a0,.L305
	addi	s0,s0,1
	li	s1,0
.L304:
	addi	s0,s0,1
	call	uart_sendchar
	lbu	a0,-1(s0)
	addi	s1,s1,1
	bnez	a0,.L304
.L303:
	li	a0,10
	call	uart_sendchar
	lw	ra,12(sp)
	lw	s0,8(sp)
	mv	a0,s1
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L305:
	li	s1,0
	j	.L303
	.size	puts, .-puts
	.section	.text.strcmp,"ax",@progbits
	.align	2
	.globl	strcmp
	.type	strcmp, @function
strcmp:
	lbu	a5,0(a1)
	lbu	a4,0(a0)
	beqz	a5,.L312
	bne	a4,a5,.L309
.L316:
	addi	a1,a1,1
	lbu	a5,0(a1)
	addi	a3,a0,1
	lbu	a4,1(a0)
	beqz	a5,.L309
	mv	a0,a3
	beq	a4,a5,.L316
.L309:
	sub	a0,a4,a5
	ret
.L312:
	li	a5,0
	j	.L309
	.size	strcmp, .-strcmp
	.section	.text.strcpy,"ax",@progbits
	.align	2
	.globl	strcpy
	.type	strcpy, @function
strcpy:
	lbu	a5,0(a1)
	beqz	a5,.L318
	mv	a4,a0
.L319:
	sb	a5,0(a4)
	addi	a1,a1,1
	lbu	a5,0(a1)
	addi	a4,a4,1
	bnez	a5,.L319
.L318:
	ret
	.size	strcpy, .-strcpy
	.section	.text.strlen,"ax",@progbits
	.align	2
	.globl	strlen
	.type	strlen, @function
strlen:
	lbu	a4,0(a0)
	mv	a3,a0
	addi	a5,a0,1
	beqz	a4,.L327
.L326:
	sub	a0,a5,a3
	addi	a5,a5,1
	lbu	a4,-1(a5)
	bnez	a4,.L326
	ret
.L327:
	li	a0,0
	ret
	.size	strlen, .-strlen
	.globl	remu10_table
	.section	.data.remu10_table,"aw",@progbits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	remu10_table, @object
	.size	remu10_table, 16
remu10_table:
	.byte	0
	.byte	1
	.byte	2
	.byte	2
	.byte	3
	.byte	3
	.byte	4
	.byte	5
	.byte	5
	.byte	6
	.byte	7
	.byte	7
	.byte	8
	.byte	8
	.byte	9
	.byte	0
	.section	.rodata.printf.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"(null)"
	.ident	"GCC: (GNU MCU Eclipse RISC-V Embedded GCC, 64-bits) 7.2.0"
