	.file	"test_control_dependencies.c"
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
	.file 1 "./test_control_dependencies.c"
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
# 7 "./test_control_dependencies.c" 1
	nop
# 0 "" 2
	.loc 1 8 0
# 8 "./test_control_dependencies.c" 1
	nop
# 0 "" 2
	.loc 1 9 0
# 9 "./test_control_dependencies.c" 1
	nop
# 0 "" 2
	.loc 1 10 0
# 10 "./test_control_dependencies.c" 1
	nop
# 0 "" 2
	.loc 1 11 0
# 11 "./test_control_dependencies.c" 1
	nop
# 0 "" 2
	.loc 1 12 0
# 12 "./test_control_dependencies.c" 1
	nop
# 0 "" 2
	.loc 1 13 0
# 13 "./test_control_dependencies.c" 1
	nop
# 0 "" 2
	.loc 1 14 0
# 14 "./test_control_dependencies.c" 1
	nop
# 0 "" 2
	.loc 1 18 0
# 18 "./test_control_dependencies.c" 1
	ori x7, x0, 13
# 0 "" 2
	.loc 1 19 0
# 19 "./test_control_dependencies.c" 1
	ori x6, x0, 16
# 0 "" 2
	.loc 1 20 0
# 20 "./test_control_dependencies.c" 1
	andi x5, x5, 0
# 0 "" 2
	.loc 1 22 0
# 22 "./test_control_dependencies.c" 1
	bne  x6,  x7, BRANCH
# 0 "" 2
	.loc 1 24 0
# 24 "./test_control_dependencies.c" 1
	.word 0x007322bb
# 0 "" 2
	.loc 1 25 0
# 25 "./test_control_dependencies.c" 1
	BRANCH: addi x28, x0, 1
# 0 "" 2
	.loc 1 26 0
# 26 "./test_control_dependencies.c" 1
	addi x28, x0, 2
# 0 "" 2
	.loc 1 27 0
# 27 "./test_control_dependencies.c" 1
	addi x28, x0, 3
# 0 "" 2
	.loc 1 28 0
# 28 "./test_control_dependencies.c" 1
	addi x28, x0, 4
# 0 "" 2
	.loc 1 29 0
# 29 "./test_control_dependencies.c" 1
	nop
# 0 "" 2
	.loc 1 30 0
# 30 "./test_control_dependencies.c" 1
	nop
# 0 "" 2
	.loc 1 31 0
# 31 "./test_control_dependencies.c" 1
	nop
# 0 "" 2
	.loc 1 32 0
# 32 "./test_control_dependencies.c" 1
	nop
# 0 "" 2
	.loc 1 33 0
# 33 "./test_control_dependencies.c" 1
	nop
# 0 "" 2
	.loc 1 34 0
# 34 "./test_control_dependencies.c" 1
	nop
# 0 "" 2
	.loc 1 35 0
# 35 "./test_control_dependencies.c" 1
	nop
# 0 "" 2
	.loc 1 36 0
# 36 "./test_control_dependencies.c" 1
	nop
# 0 "" 2
	.loc 1 38 0
 #NO_APP
	call	sim_finish
	.loc 1 40 0
	li	a5,0
	.loc 1 41 0
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
	.byte	0x26
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
	.string	"/users/epakmp/Workarea/pulp/pulpenix/apps/test_control_dependencies"
.LASF1:
	.string	"./test_control_dependencies.c"
.LASF4:
	.string	"sim_finish"
.LASF3:
	.string	"main"
	.ident	"GCC: (GNU MCU Eclipse RISC-V Embedded GCC, 64-bits) 7.2.0"
