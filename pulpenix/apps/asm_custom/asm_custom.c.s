	.file	"asm_custom.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.main,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB0:
	.file 1 "./asm_custom.c"
	.loc 1 5 0
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 7 0
 #APP
# 7 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 8 0
# 8 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 9 0
# 9 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 10 0
# 10 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 11 0
# 11 "./asm_custom.c" 1
	andi t0,t0,0
# 0 "" 2
	.loc 1 12 0
# 12 "./asm_custom.c" 1
	andi t1,t1,0
# 0 "" 2
	.loc 1 13 0
# 13 "./asm_custom.c" 1
	andi t2,t2,0
# 0 "" 2
	.loc 1 14 0
# 14 "./asm_custom.c" 1
	andi t3,t3,0
# 0 "" 2
	.loc 1 15 0
# 15 "./asm_custom.c" 1
	andi t4,t4,0
# 0 "" 2
	.loc 1 16 0
# 16 "./asm_custom.c" 1
	andi t5,t5,0
# 0 "" 2
	.loc 1 17 0
# 17 "./asm_custom.c" 1
	addi t1,t1,34
# 0 "" 2
	.loc 1 18 0
# 18 "./asm_custom.c" 1
	addi t2,t2,256
# 0 "" 2
	.loc 1 19 0
# 19 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 20 0
# 20 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 21 0
# 21 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 22 0
# 22 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 23 0
# 23 "./asm_custom.c" 1
	.word 0x007302bb
# 0 "" 2
	.loc 1 24 0
# 24 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 25 0
# 25 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 26 0
# 26 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 27 0
# 27 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 28 0
# 28 "./asm_custom.c" 1
	addi t3,t2,0
# 0 "" 2
	.loc 1 29 0
# 29 "./asm_custom.c" 1
	addi t4,t1,0
# 0 "" 2
	.loc 1 30 0
# 30 "./asm_custom.c" 1
	addi t5,t0,0
# 0 "" 2
	.loc 1 31 0
# 31 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 32 0
# 32 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 33 0
# 33 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 34 0
# 34 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 35 0
# 35 "./asm_custom.c" 1
	.word 0x007322bb
# 0 "" 2
	.loc 1 36 0
# 36 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 37 0
# 37 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 38 0
# 38 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 39 0
# 39 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 40 0
# 40 "./asm_custom.c" 1
	addi t3,t2,0
# 0 "" 2
	.loc 1 41 0
# 41 "./asm_custom.c" 1
	addi t4,t1,0
# 0 "" 2
	.loc 1 42 0
# 42 "./asm_custom.c" 1
	addi t5,t0,0
# 0 "" 2
	.loc 1 44 0
# 44 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 45 0
# 45 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 46 0
# 46 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 47 0
# 47 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 48 0
# 48 "./asm_custom.c" 1
	addi t3,t2,0
# 0 "" 2
	.loc 1 49 0
# 49 "./asm_custom.c" 1
	addi t4,t1,0
# 0 "" 2
	.loc 1 50 0
# 50 "./asm_custom.c" 1
	addi t5,t0,0
# 0 "" 2
	.loc 1 51 0
# 51 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 52 0
# 52 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 53 0
# 53 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 54 0
# 54 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 55 0
# 55 "./asm_custom.c" 1
	.word 0x007342bb
# 0 "" 2
	.loc 1 56 0
# 56 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 57 0
# 57 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 58 0
# 58 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 59 0
# 59 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 60 0
# 60 "./asm_custom.c" 1
	addi t3,t2,0
# 0 "" 2
	.loc 1 61 0
# 61 "./asm_custom.c" 1
	addi t4,t1,0
# 0 "" 2
	.loc 1 62 0
# 62 "./asm_custom.c" 1
	addi t5,t0,0
# 0 "" 2
	.loc 1 64 0
# 64 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 65 0
# 65 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 66 0
# 66 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 67 0
# 67 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 68 0
# 68 "./asm_custom.c" 1
	andi t0,t0,0
# 0 "" 2
	.loc 1 69 0
# 69 "./asm_custom.c" 1
	andi t1,t1,0
# 0 "" 2
	.loc 1 70 0
# 70 "./asm_custom.c" 1
	andi t2,t2,0
# 0 "" 2
	.loc 1 71 0
# 71 "./asm_custom.c" 1
	andi t3,t3,0
# 0 "" 2
	.loc 1 72 0
# 72 "./asm_custom.c" 1
	andi t4,t4,0
# 0 "" 2
	.loc 1 73 0
# 73 "./asm_custom.c" 1
	andi t5,t5,0
# 0 "" 2
	.loc 1 74 0
# 74 "./asm_custom.c" 1
	addi t1,t1,34
# 0 "" 2
	.loc 1 75 0
# 75 "./asm_custom.c" 1
	addi t2,t2,0
# 0 "" 2
	.loc 1 76 0
# 76 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 77 0
# 77 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 78 0
# 78 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 79 0
# 79 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 80 0
# 80 "./asm_custom.c" 1
	.word 0x007342bb
# 0 "" 2
	.loc 1 81 0
# 81 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 82 0
# 82 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 83 0
# 83 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 84 0
# 84 "./asm_custom.c" 1
	nop
# 0 "" 2
	.loc 1 85 0
# 85 "./asm_custom.c" 1
	addi t3,t2,0
# 0 "" 2
	.loc 1 86 0
# 86 "./asm_custom.c" 1
	addi t4,t1,0
# 0 "" 2
	.loc 1 87 0
# 87 "./asm_custom.c" 1
	addi t5,t0,0
# 0 "" 2
	.loc 1 89 0
 #NO_APP
	call	sim_finish
	.loc 1 91 0
	li	a5,0
	.loc 1 92 0
	mv	a0,a5
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_register 2
	jr	ra
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.text
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x50
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF0
	.byte	0xc
	.4byte	.LASF1
	.4byte	.LASF2
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.byte	0x2
	.4byte	.LASF3
	.byte	0x1
	.byte	0x5
	.4byte	0x4c
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0x4c
	.byte	0x3
	.4byte	.LASF4
	.byte	0x1
	.byte	0x59
	.4byte	0x4c
	.byte	0x4
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x25
	.byte	0xe
	.byte	0x13
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0x1b
	.byte	0xe
	.byte	0x55
	.byte	0x17
	.byte	0x11
	.byte	0x1
	.byte	0x10
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x96,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LFB0
	.4byte	.LFE0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF0:
	.string	"GNU C11 7.2.0 -march=rv32im -mabi=ilp32 -ggdb -fdata-sections -ffunction-sections"
.LASF2:
	.string	"/users/epakmp/Workarea/pulp/pulpenix/apps/asm_custom"
.LASF4:
	.string	"sim_finish"
.LASF3:
	.string	"main"
.LASF1:
	.string	"./asm_custom.c"
	.ident	"GCC: (GNU MCU Eclipse RISC-V Embedded GCC, 64-bits) 7.2.0"
