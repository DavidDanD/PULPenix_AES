	.file	"asm_add.c"
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
	.file 1 "./asm_add.c"
	.loc 1 6 0
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 8 0
 #APP
# 8 "./asm_add.c" 1
	nop
# 0 "" 2
	.loc 1 9 0
# 9 "./asm_add.c" 1
	nop
# 0 "" 2
	.loc 1 10 0
# 10 "./asm_add.c" 1
	nop
# 0 "" 2
	.loc 1 11 0
# 11 "./asm_add.c" 1
	nop
# 0 "" 2
	.loc 1 12 0
# 12 "./asm_add.c" 1
	ori x6,x0,3
# 0 "" 2
	.loc 1 13 0
# 13 "./asm_add.c" 1
	ori x7,x0,7
# 0 "" 2
	.loc 1 14 0
# 14 "./asm_add.c" 1
	add x5,x6,x7
# 0 "" 2
	.loc 1 15 0
# 15 "./asm_add.c" 1
	nop
# 0 "" 2
	.loc 1 16 0
# 16 "./asm_add.c" 1
	nop
# 0 "" 2
	.loc 1 17 0
# 17 "./asm_add.c" 1
	nop
# 0 "" 2
	.loc 1 18 0
# 18 "./asm_add.c" 1
	nop
# 0 "" 2
	.loc 1 20 0
 #NO_APP
	call	sim_finish
	.loc 1 22 0
	li	a5,0
	.loc 1 23 0
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
	.byte	0x6
	.4byte	0x4c
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0x4c
	.byte	0x3
	.4byte	.LASF4
	.byte	0x1
	.byte	0x14
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
	.string	"/users/epdado/Workarea/pulp/pulpenix/apps/asm_add"
.LASF1:
	.string	"./asm_add.c"
.LASF4:
	.string	"sim_finish"
.LASF3:
	.string	"main"
	.ident	"GCC: (GNU MCU Eclipse RISC-V Embedded GCC, 64-bits) 7.2.0"
