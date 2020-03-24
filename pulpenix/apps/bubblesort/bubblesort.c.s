	.file	"bubblesort.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.bsort_strcmp,"ax",@progbits
	.align	2
	.globl	bsort_strcmp
	.type	bsort_strcmp, @function
bsort_strcmp:
.LFB1:
	.file 1 "./bubblesort.c"
	.loc 1 15 0
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	s0,44(sp)
	.cfi_offset 8, -4
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sw	a0,-36(s0)
	sw	a1,-40(s0)
.L4:
	.loc 1 19 0
	lw	a5,-36(s0)
	addi	a4,a5,1
	sw	a4,-36(s0)
	lbu	a5,0(a5)
	sb	a5,-17(s0)
	.loc 1 20 0
	lw	a5,-40(s0)
	addi	a4,a5,1
	sw	a4,-40(s0)
	lbu	a5,0(a5)
	sb	a5,-18(s0)
	.loc 1 21 0
	lbu	a5,-17(s0)
	bnez	a5,.L2
	.loc 1 22 0
	lbu	a4,-17(s0)
	lbu	a5,-18(s0)
	sub	a5,a4,a5
	j	.L3
.L2:
	.loc 1 24 0
	lbu	a4,-17(s0)
	lbu	a5,-18(s0)
	beq	a4,a5,.L4
	.loc 1 25 0
	lbu	a4,-17(s0)
	lbu	a5,-18(s0)
	sub	a5,a4,a5
.L3:
	.loc 1 26 0
	mv	a0,a5
	lw	s0,44(sp)
	.cfi_restore 8
	addi	sp,sp,48
	.cfi_def_cfa_register 2
	jr	ra
	.cfi_endproc
.LFE1:
	.size	bsort_strcmp, .-bsort_strcmp
	.section	.text.bsort_strcpy,"ax",@progbits
	.align	2
	.globl	bsort_strcpy
	.type	bsort_strcpy, @function
bsort_strcpy:
.LFB2:
	.loc 1 32 0
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	s0,44(sp)
	.cfi_offset 8, -4
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	.loc 1 33 0
	lw	a5,-36(s0)
	sw	a5,-20(s0)
	.loc 1 34 0
	j	.L6
.L7:
	.loc 1 36 0
	lw	a4,-40(s0)
	addi	a5,a4,1
	sw	a5,-40(s0)
	lw	a5,-36(s0)
	addi	a3,a5,1
	sw	a3,-36(s0)
	lbu	a4,0(a4)
	sb	a4,0(a5)
.L6:
	.loc 1 34 0
	lw	a5,-40(s0)
	lbu	a5,0(a5)
	bnez	a5,.L7
	.loc 1 38 0
	lw	a5,-36(s0)
	sb	zero,0(a5)
	.loc 1 39 0
	nop
	lw	s0,44(sp)
	.cfi_restore 8
	addi	sp,sp,48
	.cfi_def_cfa_register 2
	jr	ra
	.cfi_endproc
.LFE2:
	.size	bsort_strcpy, .-bsort_strcpy
	.section	.rodata
	.align	2
.LC0:
	.string	"\n\nInput strings to sort:\n\n"
	.align	2
.LC1:
	.string	" "
	.align	2
.LC2:
	.string	"\n"
	.align	2
.LC3:
	.string	"START SORT"
	.align	2
.LC4:
	.string	"END SORT"
	.align	2
.LC5:
	.string	"\n\nSorted:\n\n"
	.section	.text.bsort_strings,"ax",@progbits
	.align	2
	.globl	bsort_strings
	.type	bsort_strings, @function
bsort_strings:
.LFB3:
	.loc 1 43 0
	.cfi_startproc
	addi	sp,sp,-304
	.cfi_def_cfa_offset 304
	sw	ra,300(sp)
	sw	s0,296(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,304
	.cfi_def_cfa 8, 0
	sw	a0,-292(s0)
	sw	a1,-296(s0)
	sw	a2,-300(s0)
	.loc 1 48 0
	lui	a5,%hi(.LC0)
	addi	a1,a5,%lo(.LC0)
	lw	a0,-300(s0)
	call	bm_fputs
.LBB2:
	.loc 1 50 0
	sw	zero,-20(s0)
	j	.L9
.L10:
	.loc 1 52 0 discriminator 3
	addi	a3,s0,-288
	lw	a4,-20(s0)
	mv	a5,a4
	slli	a5,a5,4
	sub	a5,a5,a4
	add	a5,a3,a5
	mv	a1,a5
	lw	a0,-296(s0)
	call	bm_fgets
	.loc 1 55 0 discriminator 3
	lui	a5,%hi(.LC1)
	addi	a1,a5,%lo(.LC1)
	lw	a0,-300(s0)
	call	bm_fputs
	addi	a3,s0,-288
	lw	a4,-20(s0)
	mv	a5,a4
	slli	a5,a5,4
	sub	a5,a5,a4
	add	a5,a3,a5
	mv	a0,a5
	call	bm_puts
	.loc 1 50 0 discriminator 3
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L9:
	.loc 1 50 0 is_stmt 0 discriminator 1
	lw	a4,-20(s0)
	lw	a5,-292(s0)
	blt	a4,a5,.L10
.LBE2:
	.loc 1 57 0 is_stmt 1
	lui	a5,%hi(.LC2)
	addi	a1,a5,%lo(.LC2)
	lw	a0,-300(s0)
	call	bm_fputs
	.loc 1 61 0
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	bm_time_stamp
	sw	a0,-36(s0)
	.loc 1 63 0
	lw	a5,-292(s0)
	sw	a5,-40(s0)
.LBB3:
	.loc 1 65 0
	sw	zero,-24(s0)
	j	.L11
.L15:
.LBB4:
	.loc 1 66 0
	sw	zero,-28(s0)
	j	.L12
.L14:
	.loc 1 67 0
	addi	a3,s0,-288
	lw	a4,-28(s0)
	mv	a5,a4
	slli	a5,a5,4
	sub	a5,a5,a4
	add	a2,a3,a5
	lw	a5,-28(s0)
	addi	a4,a5,1
	addi	a3,s0,-288
	mv	a5,a4
	slli	a5,a5,4
	sub	a5,a5,a4
	add	a5,a3,a5
	mv	a1,a5
	mv	a0,a2
	call	bsort_strcmp
	mv	a5,a0
	blez	a5,.L13
	.loc 1 69 0
	addi	a3,s0,-288
	lw	a4,-28(s0)
	mv	a5,a4
	slli	a5,a5,4
	sub	a5,a5,a4
	add	a4,a3,a5
	addi	a5,s0,-60
	mv	a1,a4
	mv	a0,a5
	call	bsort_strcpy
	.loc 1 70 0
	addi	a3,s0,-288
	lw	a4,-28(s0)
	mv	a5,a4
	slli	a5,a5,4
	sub	a5,a5,a4
	add	a2,a3,a5
	lw	a5,-28(s0)
	addi	a4,a5,1
	addi	a3,s0,-288
	mv	a5,a4
	slli	a5,a5,4
	sub	a5,a5,a4
	add	a5,a3,a5
	mv	a1,a5
	mv	a0,a2
	call	bsort_strcpy
	.loc 1 71 0
	lw	a5,-28(s0)
	addi	a4,a5,1
	addi	a3,s0,-288
	mv	a5,a4
	slli	a5,a5,4
	sub	a5,a5,a4
	add	a5,a3,a5
	addi	a4,s0,-60
	mv	a1,a4
	mv	a0,a5
	call	bsort_strcpy
.L13:
	.loc 1 66 0 discriminator 2
	lw	a5,-28(s0)
	addi	a5,a5,1
	sw	a5,-28(s0)
.L12:
	.loc 1 66 0 is_stmt 0 discriminator 1
	lw	a4,-40(s0)
	lw	a5,-24(s0)
	sub	a5,a4,a5
	addi	a5,a5,-1
	lw	a4,-28(s0)
	blt	a4,a5,.L14
.LBE4:
	.loc 1 65 0 is_stmt 1 discriminator 2
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L11:
	.loc 1 65 0 is_stmt 0 discriminator 1
	lw	a5,-40(s0)
	addi	a5,a5,-1
	lw	a4,-24(s0)
	blt	a4,a5,.L15
.LBE3:
	.loc 1 75 0 is_stmt 1
	lui	a5,%hi(.LC4)
	addi	a0,a5,%lo(.LC4)
	call	bm_time_stamp
	sw	a0,-44(s0)
	.loc 1 77 0
	lui	a5,%hi(.LC5)
	addi	a1,a5,%lo(.LC5)
	lw	a0,-300(s0)
	call	bm_fputs
.LBB5:
	.loc 1 79 0
	sw	zero,-32(s0)
	j	.L16
.L17:
	.loc 1 80 0 discriminator 3
	lui	a5,%hi(.LC1)
	addi	a1,a5,%lo(.LC1)
	lw	a0,-300(s0)
	call	bm_fputs
	addi	a3,s0,-288
	lw	a4,-32(s0)
	mv	a5,a4
	slli	a5,a5,4
	sub	a5,a5,a4
	add	a5,a3,a5
	mv	a1,a5
	lw	a0,-300(s0)
	call	bm_fputs
	.loc 1 79 0 discriminator 3
	lw	a5,-32(s0)
	addi	a5,a5,1
	sw	a5,-32(s0)
.L16:
	.loc 1 79 0 is_stmt 0 discriminator 1
	lw	a4,-32(s0)
	lw	a5,-40(s0)
	blt	a4,a5,.L17
.LBE5:
	.loc 1 82 0 is_stmt 1
	li	a1,10
	lw	a0,-300(s0)
	call	bm_fputc
	.loc 1 83 0
	nop
	lw	ra,300(sp)
	.cfi_restore 1
	lw	s0,296(sp)
	.cfi_restore 8
	addi	sp,sp,304
	.cfi_def_cfa_register 2
	jr	ra
	.cfi_endproc
.LFE3:
	.size	bsort_strings, .-bsort_strings
	.section	.rodata
	.align	2
.LC6:
	.string	"\nHELLO GenPro - SORT DEMO \n"
	.align	2
.LC7:
	.string	"sort_in.txt"
	.align	2
.LC8:
	.string	"sort_out.txt"
	.align	2
.LC9:
	.string	"START SORT (LIST LOAD)"
	.align	2
.LC10:
	.string	"\n\n Now bubble-sorting strings from input file:\n\n"
	.align	2
.LC11:
	.string	"\nSW TASK DONE - FINSHING SIMULATION, OK OK OK, BYE\n\n"
	.section	.text.main,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB4:
	.loc 1 87 0
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 1 89 0
	lui	a5,%hi(.LC6)
	addi	a0,a5,%lo(.LC6)
	call	bm_puts
	.loc 1 91 0
	lui	a5,%hi(.LC7)
	addi	a0,a5,%lo(.LC7)
	call	bm_fopen_r
	sw	a0,-20(s0)
	.loc 1 92 0
	lui	a5,%hi(.LC8)
	addi	a0,a5,%lo(.LC8)
	call	bm_fopen_w
	sw	a0,-24(s0)
	.loc 1 94 0
	lui	a5,%hi(.LC9)
	addi	a0,a5,%lo(.LC9)
	call	bm_time_stamp
	sw	a0,-28(s0)
	.loc 1 96 0
	lui	a5,%hi(.LC10)
	addi	a1,a5,%lo(.LC10)
	lw	a0,-24(s0)
	call	bm_fputs
	.loc 1 97 0
	lw	a2,-24(s0)
	lw	a1,-20(s0)
	li	a0,12
	call	bsort_strings
	.loc 1 99 0
	lui	a5,%hi(.LC11)
	addi	a1,a5,%lo(.LC11)
	li	a0,0
	call	bm_fputs
	.loc 1 100 0
	call	sim_finish
	.loc 1 102 0
	li	a5,0
	.loc 1 104 0
	mv	a0,a5
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	addi	sp,sp,32
	.cfi_def_cfa_register 2
	jr	ra
	.cfi_endproc
.LFE4:
	.size	main, .-main
	.text
.Letext0:
	.file 2 "/users/epakmp/Workarea/pulp/toolchain/gnu-mcu-eclipse/7.2.0-2-20180111-2230/riscv-none-embed/include/sys/lock.h"
	.file 3 "/users/epakmp/Workarea/pulp/toolchain/gnu-mcu-eclipse/7.2.0-2-20180111-2230/riscv-none-embed/include/sys/_types.h"
	.file 4 "/users/epakmp/Workarea/pulp/toolchain/gnu-mcu-eclipse/7.2.0-2-20180111-2230/lib/gcc/riscv-none-embed/7.2.0/include/stddef.h"
	.file 5 "/users/epakmp/Workarea/pulp/toolchain/gnu-mcu-eclipse/7.2.0-2-20180111-2230/riscv-none-embed/include/sys/reent.h"
	.file 6 "/users/epakmp/Workarea/pulp/toolchain/gnu-mcu-eclipse/7.2.0-2-20180111-2230/riscv-none-embed/include/stdlib.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xa74
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF133
	.byte	0xc
	.4byte	.LASF134
	.4byte	.LASF135
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.byte	0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.byte	0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF5
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF6
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF7
	.byte	0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.byte	0x2
	.byte	0x10
	.byte	0x4
	.4byte	.LASF9
	.byte	0x4
	.4byte	.LASF10
	.byte	0x2
	.byte	0x7
	.4byte	0x5d
	.byte	0x4
	.4byte	.LASF11
	.byte	0x3
	.byte	0x2c
	.4byte	0x41
	.byte	0x4
	.4byte	.LASF12
	.byte	0x3
	.byte	0x72
	.4byte	0x41
	.byte	0x4
	.4byte	.LASF13
	.byte	0x3
	.byte	0x91
	.4byte	0x5d
	.byte	0x5
	.4byte	.LASF14
	.byte	0x4
	.2byte	0x165
	.4byte	0x64
	.byte	0x6
	.byte	0x4
	.byte	0x3
	.byte	0xa6
	.4byte	0xc9
	.byte	0x7
	.4byte	.LASF15
	.byte	0x3
	.byte	0xa8
	.4byte	0x9e
	.byte	0x7
	.4byte	.LASF16
	.byte	0x3
	.byte	0xa9
	.4byte	0xc9
	.byte	0
	.byte	0x8
	.4byte	0x2c
	.4byte	0xd9
	.byte	0x9
	.4byte	0x64
	.byte	0x3
	.byte	0
	.byte	0xa
	.byte	0x8
	.byte	0x3
	.byte	0xa3
	.4byte	0xfa
	.byte	0xb
	.4byte	.LASF17
	.byte	0x3
	.byte	0xa5
	.4byte	0x5d
	.byte	0
	.byte	0xb
	.4byte	.LASF18
	.byte	0x3
	.byte	0xaa
	.4byte	0xaa
	.byte	0x4
	.byte	0
	.byte	0x4
	.4byte	.LASF19
	.byte	0x3
	.byte	0xab
	.4byte	0xd9
	.byte	0x4
	.4byte	.LASF20
	.byte	0x3
	.byte	0xaf
	.4byte	0x72
	.byte	0xc
	.byte	0x4
	.byte	0x4
	.4byte	.LASF21
	.byte	0x5
	.byte	0x16
	.4byte	0x48
	.byte	0xd
	.4byte	.LASF26
	.byte	0x18
	.byte	0x5
	.byte	0x2f
	.4byte	0x170
	.byte	0xb
	.4byte	.LASF22
	.byte	0x5
	.byte	0x31
	.4byte	0x170
	.byte	0
	.byte	0xe
	.string	"_k"
	.byte	0x5
	.byte	0x32
	.4byte	0x5d
	.byte	0x4
	.byte	0xb
	.4byte	.LASF23
	.byte	0x5
	.byte	0x32
	.4byte	0x5d
	.byte	0x8
	.byte	0xb
	.4byte	.LASF24
	.byte	0x5
	.byte	0x32
	.4byte	0x5d
	.byte	0xc
	.byte	0xb
	.4byte	.LASF25
	.byte	0x5
	.byte	0x32
	.4byte	0x5d
	.byte	0x10
	.byte	0xe
	.string	"_x"
	.byte	0x5
	.byte	0x33
	.4byte	0x176
	.byte	0x14
	.byte	0
	.byte	0xf
	.byte	0x4
	.4byte	0x11d
	.byte	0x8
	.4byte	0x112
	.4byte	0x186
	.byte	0x9
	.4byte	0x64
	.byte	0
	.byte	0
	.byte	0xd
	.4byte	.LASF27
	.byte	0x24
	.byte	0x5
	.byte	0x37
	.4byte	0x1ff
	.byte	0xb
	.4byte	.LASF28
	.byte	0x5
	.byte	0x39
	.4byte	0x5d
	.byte	0
	.byte	0xb
	.4byte	.LASF29
	.byte	0x5
	.byte	0x3a
	.4byte	0x5d
	.byte	0x4
	.byte	0xb
	.4byte	.LASF30
	.byte	0x5
	.byte	0x3b
	.4byte	0x5d
	.byte	0x8
	.byte	0xb
	.4byte	.LASF31
	.byte	0x5
	.byte	0x3c
	.4byte	0x5d
	.byte	0xc
	.byte	0xb
	.4byte	.LASF32
	.byte	0x5
	.byte	0x3d
	.4byte	0x5d
	.byte	0x10
	.byte	0xb
	.4byte	.LASF33
	.byte	0x5
	.byte	0x3e
	.4byte	0x5d
	.byte	0x14
	.byte	0xb
	.4byte	.LASF34
	.byte	0x5
	.byte	0x3f
	.4byte	0x5d
	.byte	0x18
	.byte	0xb
	.4byte	.LASF35
	.byte	0x5
	.byte	0x40
	.4byte	0x5d
	.byte	0x1c
	.byte	0xb
	.4byte	.LASF36
	.byte	0x5
	.byte	0x41
	.4byte	0x5d
	.byte	0x20
	.byte	0
	.byte	0x10
	.4byte	.LASF37
	.2byte	0x108
	.byte	0x5
	.byte	0x4a
	.4byte	0x23f
	.byte	0xb
	.4byte	.LASF38
	.byte	0x5
	.byte	0x4b
	.4byte	0x23f
	.byte	0
	.byte	0xb
	.4byte	.LASF39
	.byte	0x5
	.byte	0x4c
	.4byte	0x23f
	.byte	0x80
	.byte	0x11
	.4byte	.LASF40
	.byte	0x5
	.byte	0x4e
	.4byte	0x112
	.2byte	0x100
	.byte	0x11
	.4byte	.LASF41
	.byte	0x5
	.byte	0x51
	.4byte	0x112
	.2byte	0x104
	.byte	0
	.byte	0x8
	.4byte	0x110
	.4byte	0x24f
	.byte	0x9
	.4byte	0x64
	.byte	0x1f
	.byte	0
	.byte	0x10
	.4byte	.LASF42
	.2byte	0x190
	.byte	0x5
	.byte	0x5d
	.4byte	0x28d
	.byte	0xb
	.4byte	.LASF22
	.byte	0x5
	.byte	0x5e
	.4byte	0x28d
	.byte	0
	.byte	0xb
	.4byte	.LASF43
	.byte	0x5
	.byte	0x5f
	.4byte	0x5d
	.byte	0x4
	.byte	0xb
	.4byte	.LASF44
	.byte	0x5
	.byte	0x61
	.4byte	0x293
	.byte	0x8
	.byte	0xb
	.4byte	.LASF37
	.byte	0x5
	.byte	0x62
	.4byte	0x1ff
	.byte	0x88
	.byte	0
	.byte	0xf
	.byte	0x4
	.4byte	0x24f
	.byte	0x8
	.4byte	0x2a3
	.4byte	0x2a3
	.byte	0x9
	.4byte	0x64
	.byte	0x1f
	.byte	0
	.byte	0xf
	.byte	0x4
	.4byte	0x2a9
	.byte	0x12
	.byte	0xd
	.4byte	.LASF45
	.byte	0x8
	.byte	0x5
	.byte	0x75
	.4byte	0x2cf
	.byte	0xb
	.4byte	.LASF46
	.byte	0x5
	.byte	0x76
	.4byte	0x2cf
	.byte	0
	.byte	0xb
	.4byte	.LASF47
	.byte	0x5
	.byte	0x77
	.4byte	0x5d
	.byte	0x4
	.byte	0
	.byte	0xf
	.byte	0x4
	.4byte	0x2c
	.byte	0xd
	.4byte	.LASF48
	.byte	0x68
	.byte	0x5
	.byte	0xb5
	.4byte	0x3ff
	.byte	0xe
	.string	"_p"
	.byte	0x5
	.byte	0xb6
	.4byte	0x2cf
	.byte	0
	.byte	0xe
	.string	"_r"
	.byte	0x5
	.byte	0xb7
	.4byte	0x5d
	.byte	0x4
	.byte	0xe
	.string	"_w"
	.byte	0x5
	.byte	0xb8
	.4byte	0x5d
	.byte	0x8
	.byte	0xb
	.4byte	.LASF49
	.byte	0x5
	.byte	0xb9
	.4byte	0x33
	.byte	0xc
	.byte	0xb
	.4byte	.LASF50
	.byte	0x5
	.byte	0xba
	.4byte	0x33
	.byte	0xe
	.byte	0xe
	.string	"_bf"
	.byte	0x5
	.byte	0xbb
	.4byte	0x2aa
	.byte	0x10
	.byte	0xb
	.4byte	.LASF51
	.byte	0x5
	.byte	0xbc
	.4byte	0x5d
	.byte	0x18
	.byte	0xb
	.4byte	.LASF52
	.byte	0x5
	.byte	0xc3
	.4byte	0x110
	.byte	0x1c
	.byte	0xb
	.4byte	.LASF53
	.byte	0x5
	.byte	0xc5
	.4byte	0x56c
	.byte	0x20
	.byte	0xb
	.4byte	.LASF54
	.byte	0x5
	.byte	0xc7
	.4byte	0x596
	.byte	0x24
	.byte	0xb
	.4byte	.LASF55
	.byte	0x5
	.byte	0xca
	.4byte	0x5ba
	.byte	0x28
	.byte	0xb
	.4byte	.LASF56
	.byte	0x5
	.byte	0xcb
	.4byte	0x5d4
	.byte	0x2c
	.byte	0xe
	.string	"_ub"
	.byte	0x5
	.byte	0xce
	.4byte	0x2aa
	.byte	0x30
	.byte	0xe
	.string	"_up"
	.byte	0x5
	.byte	0xcf
	.4byte	0x2cf
	.byte	0x38
	.byte	0xe
	.string	"_ur"
	.byte	0x5
	.byte	0xd0
	.4byte	0x5d
	.byte	0x3c
	.byte	0xb
	.4byte	.LASF57
	.byte	0x5
	.byte	0xd3
	.4byte	0x5da
	.byte	0x40
	.byte	0xb
	.4byte	.LASF58
	.byte	0x5
	.byte	0xd4
	.4byte	0x5ea
	.byte	0x43
	.byte	0xe
	.string	"_lb"
	.byte	0x5
	.byte	0xd7
	.4byte	0x2aa
	.byte	0x44
	.byte	0xb
	.4byte	.LASF59
	.byte	0x5
	.byte	0xda
	.4byte	0x5d
	.byte	0x4c
	.byte	0xb
	.4byte	.LASF60
	.byte	0x5
	.byte	0xdb
	.4byte	0x7d
	.byte	0x50
	.byte	0xb
	.4byte	.LASF61
	.byte	0x5
	.byte	0xde
	.4byte	0x41d
	.byte	0x54
	.byte	0xb
	.4byte	.LASF62
	.byte	0x5
	.byte	0xe2
	.4byte	0x105
	.byte	0x58
	.byte	0xb
	.4byte	.LASF63
	.byte	0x5
	.byte	0xe4
	.4byte	0xfa
	.byte	0x5c
	.byte	0xb
	.4byte	.LASF64
	.byte	0x5
	.byte	0xe5
	.4byte	0x5d
	.byte	0x64
	.byte	0
	.byte	0x13
	.4byte	0x93
	.4byte	0x41d
	.byte	0x14
	.4byte	0x41d
	.byte	0x14
	.4byte	0x110
	.byte	0x14
	.4byte	0x55a
	.byte	0x14
	.4byte	0x5d
	.byte	0
	.byte	0xf
	.byte	0x4
	.4byte	0x428
	.byte	0x15
	.4byte	0x41d
	.byte	0x16
	.4byte	.LASF65
	.2byte	0x428
	.byte	0x5
	.2byte	0x239
	.4byte	0x55a
	.byte	0x17
	.4byte	.LASF66
	.byte	0x5
	.2byte	0x23b
	.4byte	0x5d
	.byte	0
	.byte	0x17
	.4byte	.LASF67
	.byte	0x5
	.2byte	0x240
	.4byte	0x641
	.byte	0x4
	.byte	0x17
	.4byte	.LASF68
	.byte	0x5
	.2byte	0x240
	.4byte	0x641
	.byte	0x8
	.byte	0x17
	.4byte	.LASF69
	.byte	0x5
	.2byte	0x240
	.4byte	0x641
	.byte	0xc
	.byte	0x17
	.4byte	.LASF70
	.byte	0x5
	.2byte	0x242
	.4byte	0x5d
	.byte	0x10
	.byte	0x17
	.4byte	.LASF71
	.byte	0x5
	.2byte	0x243
	.4byte	0x823
	.byte	0x14
	.byte	0x17
	.4byte	.LASF72
	.byte	0x5
	.2byte	0x246
	.4byte	0x5d
	.byte	0x30
	.byte	0x17
	.4byte	.LASF73
	.byte	0x5
	.2byte	0x247
	.4byte	0x838
	.byte	0x34
	.byte	0x17
	.4byte	.LASF74
	.byte	0x5
	.2byte	0x249
	.4byte	0x5d
	.byte	0x38
	.byte	0x17
	.4byte	.LASF75
	.byte	0x5
	.2byte	0x24b
	.4byte	0x849
	.byte	0x3c
	.byte	0x17
	.4byte	.LASF76
	.byte	0x5
	.2byte	0x24e
	.4byte	0x170
	.byte	0x40
	.byte	0x17
	.4byte	.LASF77
	.byte	0x5
	.2byte	0x24f
	.4byte	0x5d
	.byte	0x44
	.byte	0x17
	.4byte	.LASF78
	.byte	0x5
	.2byte	0x250
	.4byte	0x170
	.byte	0x48
	.byte	0x17
	.4byte	.LASF79
	.byte	0x5
	.2byte	0x251
	.4byte	0x84f
	.byte	0x4c
	.byte	0x17
	.4byte	.LASF80
	.byte	0x5
	.2byte	0x254
	.4byte	0x5d
	.byte	0x50
	.byte	0x17
	.4byte	.LASF81
	.byte	0x5
	.2byte	0x255
	.4byte	0x55a
	.byte	0x54
	.byte	0x17
	.4byte	.LASF82
	.byte	0x5
	.2byte	0x278
	.4byte	0x801
	.byte	0x58
	.byte	0x18
	.4byte	.LASF42
	.byte	0x5
	.2byte	0x27c
	.4byte	0x28d
	.2byte	0x148
	.byte	0x18
	.4byte	.LASF83
	.byte	0x5
	.2byte	0x27d
	.4byte	0x24f
	.2byte	0x14c
	.byte	0x18
	.4byte	.LASF84
	.byte	0x5
	.2byte	0x281
	.4byte	0x860
	.2byte	0x2dc
	.byte	0x18
	.4byte	.LASF85
	.byte	0x5
	.2byte	0x286
	.4byte	0x606
	.2byte	0x2e0
	.byte	0x18
	.4byte	.LASF86
	.byte	0x5
	.2byte	0x287
	.4byte	0x86c
	.2byte	0x2ec
	.byte	0
	.byte	0xf
	.byte	0x4
	.4byte	0x560
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF87
	.byte	0x15
	.4byte	0x560
	.byte	0xf
	.byte	0x4
	.4byte	0x3ff
	.byte	0x13
	.4byte	0x93
	.4byte	0x590
	.byte	0x14
	.4byte	0x41d
	.byte	0x14
	.4byte	0x110
	.byte	0x14
	.4byte	0x590
	.byte	0x14
	.4byte	0x5d
	.byte	0
	.byte	0xf
	.byte	0x4
	.4byte	0x567
	.byte	0xf
	.byte	0x4
	.4byte	0x572
	.byte	0x13
	.4byte	0x88
	.4byte	0x5ba
	.byte	0x14
	.4byte	0x41d
	.byte	0x14
	.4byte	0x110
	.byte	0x14
	.4byte	0x88
	.byte	0x14
	.4byte	0x5d
	.byte	0
	.byte	0xf
	.byte	0x4
	.4byte	0x59c
	.byte	0x13
	.4byte	0x5d
	.4byte	0x5d4
	.byte	0x14
	.4byte	0x41d
	.byte	0x14
	.4byte	0x110
	.byte	0
	.byte	0xf
	.byte	0x4
	.4byte	0x5c0
	.byte	0x8
	.4byte	0x2c
	.4byte	0x5ea
	.byte	0x9
	.4byte	0x64
	.byte	0x2
	.byte	0
	.byte	0x8
	.4byte	0x2c
	.4byte	0x5fa
	.byte	0x9
	.4byte	0x64
	.byte	0
	.byte	0
	.byte	0x5
	.4byte	.LASF88
	.byte	0x5
	.2byte	0x11f
	.4byte	0x2d5
	.byte	0x19
	.4byte	.LASF89
	.byte	0xc
	.byte	0x5
	.2byte	0x123
	.4byte	0x63b
	.byte	0x17
	.4byte	.LASF22
	.byte	0x5
	.2byte	0x125
	.4byte	0x63b
	.byte	0
	.byte	0x17
	.4byte	.LASF90
	.byte	0x5
	.2byte	0x126
	.4byte	0x5d
	.byte	0x4
	.byte	0x17
	.4byte	.LASF91
	.byte	0x5
	.2byte	0x127
	.4byte	0x641
	.byte	0x8
	.byte	0
	.byte	0xf
	.byte	0x4
	.4byte	0x606
	.byte	0xf
	.byte	0x4
	.4byte	0x5fa
	.byte	0x19
	.4byte	.LASF92
	.byte	0xe
	.byte	0x5
	.2byte	0x13f
	.4byte	0x67c
	.byte	0x17
	.4byte	.LASF93
	.byte	0x5
	.2byte	0x140
	.4byte	0x67c
	.byte	0
	.byte	0x17
	.4byte	.LASF94
	.byte	0x5
	.2byte	0x141
	.4byte	0x67c
	.byte	0x6
	.byte	0x17
	.4byte	.LASF95
	.byte	0x5
	.2byte	0x142
	.4byte	0x3a
	.byte	0xc
	.byte	0
	.byte	0x8
	.4byte	0x3a
	.4byte	0x68c
	.byte	0x9
	.4byte	0x64
	.byte	0x2
	.byte	0
	.byte	0x1a
	.byte	0xd0
	.byte	0x5
	.2byte	0x259
	.4byte	0x78d
	.byte	0x17
	.4byte	.LASF96
	.byte	0x5
	.2byte	0x25b
	.4byte	0x64
	.byte	0
	.byte	0x17
	.4byte	.LASF97
	.byte	0x5
	.2byte	0x25c
	.4byte	0x55a
	.byte	0x4
	.byte	0x17
	.4byte	.LASF98
	.byte	0x5
	.2byte	0x25d
	.4byte	0x78d
	.byte	0x8
	.byte	0x17
	.4byte	.LASF99
	.byte	0x5
	.2byte	0x25e
	.4byte	0x186
	.byte	0x24
	.byte	0x17
	.4byte	.LASF100
	.byte	0x5
	.2byte	0x25f
	.4byte	0x5d
	.byte	0x48
	.byte	0x17
	.4byte	.LASF101
	.byte	0x5
	.2byte	0x260
	.4byte	0x56
	.byte	0x50
	.byte	0x17
	.4byte	.LASF102
	.byte	0x5
	.2byte	0x261
	.4byte	0x647
	.byte	0x58
	.byte	0x17
	.4byte	.LASF103
	.byte	0x5
	.2byte	0x262
	.4byte	0xfa
	.byte	0x68
	.byte	0x17
	.4byte	.LASF104
	.byte	0x5
	.2byte	0x263
	.4byte	0xfa
	.byte	0x70
	.byte	0x17
	.4byte	.LASF105
	.byte	0x5
	.2byte	0x264
	.4byte	0xfa
	.byte	0x78
	.byte	0x17
	.4byte	.LASF106
	.byte	0x5
	.2byte	0x265
	.4byte	0x79d
	.byte	0x80
	.byte	0x17
	.4byte	.LASF107
	.byte	0x5
	.2byte	0x266
	.4byte	0x7ad
	.byte	0x88
	.byte	0x17
	.4byte	.LASF108
	.byte	0x5
	.2byte	0x267
	.4byte	0x5d
	.byte	0xa0
	.byte	0x17
	.4byte	.LASF109
	.byte	0x5
	.2byte	0x268
	.4byte	0xfa
	.byte	0xa4
	.byte	0x17
	.4byte	.LASF110
	.byte	0x5
	.2byte	0x269
	.4byte	0xfa
	.byte	0xac
	.byte	0x17
	.4byte	.LASF111
	.byte	0x5
	.2byte	0x26a
	.4byte	0xfa
	.byte	0xb4
	.byte	0x17
	.4byte	.LASF112
	.byte	0x5
	.2byte	0x26b
	.4byte	0xfa
	.byte	0xbc
	.byte	0x17
	.4byte	.LASF113
	.byte	0x5
	.2byte	0x26c
	.4byte	0xfa
	.byte	0xc4
	.byte	0x17
	.4byte	.LASF114
	.byte	0x5
	.2byte	0x26d
	.4byte	0x5d
	.byte	0xcc
	.byte	0
	.byte	0x8
	.4byte	0x560
	.4byte	0x79d
	.byte	0x9
	.4byte	0x64
	.byte	0x19
	.byte	0
	.byte	0x8
	.4byte	0x560
	.4byte	0x7ad
	.byte	0x9
	.4byte	0x64
	.byte	0x7
	.byte	0
	.byte	0x8
	.4byte	0x560
	.4byte	0x7bd
	.byte	0x9
	.4byte	0x64
	.byte	0x17
	.byte	0
	.byte	0x1a
	.byte	0xf0
	.byte	0x5
	.2byte	0x272
	.4byte	0x7e1
	.byte	0x17
	.4byte	.LASF115
	.byte	0x5
	.2byte	0x275
	.4byte	0x7e1
	.byte	0
	.byte	0x17
	.4byte	.LASF116
	.byte	0x5
	.2byte	0x276
	.4byte	0x7f1
	.byte	0x78
	.byte	0
	.byte	0x8
	.4byte	0x2cf
	.4byte	0x7f1
	.byte	0x9
	.4byte	0x64
	.byte	0x1d
	.byte	0
	.byte	0x8
	.4byte	0x64
	.4byte	0x801
	.byte	0x9
	.4byte	0x64
	.byte	0x1d
	.byte	0
	.byte	0x1b
	.byte	0xf0
	.byte	0x5
	.2byte	0x257
	.4byte	0x823
	.byte	0x1c
	.4byte	.LASF65
	.byte	0x5
	.2byte	0x26e
	.4byte	0x68c
	.byte	0x1c
	.4byte	.LASF117
	.byte	0x5
	.2byte	0x277
	.4byte	0x7bd
	.byte	0
	.byte	0x8
	.4byte	0x560
	.4byte	0x833
	.byte	0x9
	.4byte	0x64
	.byte	0x18
	.byte	0
	.byte	0x1d
	.4byte	.LASF136
	.byte	0xf
	.byte	0x4
	.4byte	0x833
	.byte	0x1e
	.4byte	0x849
	.byte	0x14
	.4byte	0x41d
	.byte	0
	.byte	0xf
	.byte	0x4
	.4byte	0x83e
	.byte	0xf
	.byte	0x4
	.4byte	0x170
	.byte	0x1e
	.4byte	0x860
	.byte	0x14
	.4byte	0x5d
	.byte	0
	.byte	0xf
	.byte	0x4
	.4byte	0x866
	.byte	0xf
	.byte	0x4
	.4byte	0x855
	.byte	0x8
	.4byte	0x5fa
	.4byte	0x87c
	.byte	0x9
	.4byte	0x64
	.byte	0x2
	.byte	0
	.byte	0x1f
	.4byte	.LASF118
	.byte	0x5
	.2byte	0x2fe
	.4byte	0x41d
	.byte	0x1f
	.4byte	.LASF119
	.byte	0x5
	.2byte	0x2ff
	.4byte	0x423
	.byte	0x20
	.4byte	.LASF120
	.byte	0x6
	.byte	0x63
	.4byte	0x55a
	.byte	0x21
	.4byte	.LASF137
	.byte	0x1
	.byte	0x57
	.4byte	0x5d
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.byte	0x1
	.byte	0x9c
	.4byte	0x8e3
	.byte	0x22
	.4byte	.LASF121
	.byte	0x1
	.byte	0x5b
	.4byte	0x64
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x22
	.4byte	.LASF122
	.byte	0x1
	.byte	0x5c
	.4byte	0x64
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x22
	.4byte	.LASF123
	.byte	0x1
	.byte	0x5e
	.4byte	0x64
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0
	.byte	0x23
	.4byte	.LASF129
	.byte	0x1
	.byte	0x2b
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.byte	0x1
	.byte	0x9c
	.4byte	0x9cb
	.byte	0x24
	.4byte	.LASF124
	.byte	0x1
	.byte	0x2b
	.4byte	0x5d
	.byte	0x3
	.byte	0x91
	.byte	0xdc,0x7d
	.byte	0x24
	.4byte	.LASF121
	.byte	0x1
	.byte	0x2b
	.4byte	0x64
	.byte	0x3
	.byte	0x91
	.byte	0xd8,0x7d
	.byte	0x24
	.4byte	.LASF122
	.byte	0x1
	.byte	0x2b
	.4byte	0x64
	.byte	0x3
	.byte	0x91
	.byte	0xd4,0x7d
	.byte	0x22
	.4byte	.LASF125
	.byte	0x1
	.byte	0x2d
	.4byte	0x9cb
	.byte	0x2
	.byte	0x91
	.byte	0x44
	.byte	0x22
	.4byte	.LASF126
	.byte	0x1
	.byte	0x2e
	.4byte	0x9db
	.byte	0x3
	.byte	0x91
	.byte	0xe0,0x7d
	.byte	0x22
	.4byte	.LASF127
	.byte	0x1
	.byte	0x3d
	.4byte	0x64
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x25
	.string	"n"
	.byte	0x1
	.byte	0x3f
	.4byte	0x5d
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x22
	.4byte	.LASF128
	.byte	0x1
	.byte	0x4b
	.4byte	0x64
	.byte	0x2
	.byte	0x91
	.byte	0x54
	.byte	0x26
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.4byte	0x984
	.byte	0x25
	.string	"i"
	.byte	0x1
	.byte	0x32
	.4byte	0x5d
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x26
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.4byte	0x9b4
	.byte	0x25
	.string	"c"
	.byte	0x1
	.byte	0x41
	.4byte	0x5d
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x27
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.byte	0x25
	.string	"d"
	.byte	0x1
	.byte	0x42
	.4byte	0x5d
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0
	.byte	0
	.byte	0x27
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.byte	0x25
	.string	"c"
	.byte	0x1
	.byte	0x4f
	.4byte	0x5d
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0
	.byte	0x8
	.4byte	0x560
	.4byte	0x9db
	.byte	0x9
	.4byte	0x64
	.byte	0xe
	.byte	0
	.byte	0x8
	.4byte	0x560
	.4byte	0x9f1
	.byte	0x9
	.4byte	0x64
	.byte	0xe
	.byte	0x9
	.4byte	0x64
	.byte	0xe
	.byte	0
	.byte	0x28
	.4byte	.LASF130
	.byte	0x1
	.byte	0x1f
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.4byte	0xa2d
	.byte	0x29
	.string	"d"
	.byte	0x1
	.byte	0x1f
	.4byte	0x55a
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x29
	.string	"s"
	.byte	0x1
	.byte	0x1f
	.4byte	0x590
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x22
	.4byte	.LASF131
	.byte	0x1
	.byte	0x21
	.4byte	0x55a
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x2a
	.4byte	.LASF132
	.byte	0x1
	.byte	0xe
	.4byte	0x5d
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.byte	0x29
	.string	"s1"
	.byte	0x1
	.byte	0xe
	.4byte	0x55a
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x29
	.string	"s2"
	.byte	0x1
	.byte	0xe
	.4byte	0x55a
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x25
	.string	"c1"
	.byte	0x1
	.byte	0x10
	.4byte	0x2c
	.byte	0x2
	.byte	0x91
	.byte	0x6f
	.byte	0x25
	.string	"c2"
	.byte	0x1
	.byte	0x10
	.4byte	0x2c
	.byte	0x2
	.byte	0x91
	.byte	0x6e
	.byte	0
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
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x3
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
	.byte	0x4
	.byte	0x16
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x16
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x17
	.byte	0x1
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x13
	.byte	0x1
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0x5
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x15
	.byte	0
	.byte	0x27
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x15
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x16
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0x5
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x17
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x18
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0x19
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1a
	.byte	0x13
	.byte	0x1
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1b
	.byte	0x17
	.byte	0x1
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1c
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1d
	.byte	0x13
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x1e
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1f
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x20
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x21
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
	.byte	0x27
	.byte	0x19
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
	.byte	0x22
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x23
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
	.byte	0x27
	.byte	0x19
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
	.byte	0x24
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x25
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x26
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x27
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0x28
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
	.byte	0x27
	.byte	0x19
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x97,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x29
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x2a
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
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x97,0x42
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x34
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LFB1
	.4byte	.LFE1
	.4byte	.LFB2
	.4byte	.LFE2
	.4byte	.LFB3
	.4byte	.LFE3
	.4byte	.LFB4
	.4byte	.LFE4
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF39:
	.string	"_dso_handle"
.LASF122:
	.string	"sort_outF"
.LASF47:
	.string	"_size"
.LASF92:
	.string	"_rand48"
.LASF71:
	.string	"_emergency"
.LASF61:
	.string	"_data"
.LASF112:
	.string	"_wcrtomb_state"
.LASF113:
	.string	"_wcsrtombs_state"
.LASF7:
	.string	"long long unsigned int"
.LASF51:
	.string	"_lbfsize"
.LASF136:
	.string	"__locale_t"
.LASF110:
	.string	"_mbrtowc_state"
.LASF105:
	.string	"_wctomb_state"
.LASF28:
	.string	"__tm_sec"
.LASF6:
	.string	"long long int"
.LASF0:
	.string	"signed char"
.LASF57:
	.string	"_ubuf"
.LASF46:
	.string	"_base"
.LASF30:
	.string	"__tm_hour"
.LASF86:
	.string	"__sf"
.LASF37:
	.string	"_on_exit_args"
.LASF52:
	.string	"_cookie"
.LASF85:
	.string	"__sglue"
.LASF4:
	.string	"long int"
.LASF49:
	.string	"_flags"
.LASF41:
	.string	"_is_cxa"
.LASF67:
	.string	"_stdin"
.LASF59:
	.string	"_blksize"
.LASF125:
	.string	"strbuf"
.LASF81:
	.string	"_cvtbuf"
.LASF60:
	.string	"_offset"
.LASF134:
	.string	"./bubblesort.c"
.LASF111:
	.string	"_mbsrtowcs_state"
.LASF126:
	.string	"array"
.LASF109:
	.string	"_mbrlen_state"
.LASF38:
	.string	"_fnargs"
.LASF44:
	.string	"_fns"
.LASF24:
	.string	"_sign"
.LASF20:
	.string	"_flock_t"
.LASF69:
	.string	"_stderr"
.LASF26:
	.string	"_Bigint"
.LASF100:
	.string	"_gamma_signgam"
.LASF53:
	.string	"_read"
.LASF77:
	.string	"_result_k"
.LASF123:
	.string	"time_start_sort_list_load"
.LASF27:
	.string	"__tm"
.LASF121:
	.string	"sort_inF"
.LASF8:
	.string	"unsigned int"
.LASF16:
	.string	"__wchb"
.LASF68:
	.string	"_stdout"
.LASF80:
	.string	"_cvtlen"
.LASF5:
	.string	"long unsigned int"
.LASF50:
	.string	"_file"
.LASF90:
	.string	"_niobs"
.LASF3:
	.string	"short unsigned int"
.LASF83:
	.string	"_atexit0"
.LASF107:
	.string	"_signal_buf"
.LASF98:
	.string	"_asctime_buf"
.LASF76:
	.string	"_result"
.LASF15:
	.string	"__wch"
.LASF14:
	.string	"wint_t"
.LASF62:
	.string	"_lock"
.LASF64:
	.string	"_flags2"
.LASF54:
	.string	"_write"
.LASF33:
	.string	"__tm_year"
.LASF116:
	.string	"_nmalloc"
.LASF131:
	.string	"saved"
.LASF127:
	.string	"time_start_sort"
.LASF9:
	.string	"long double"
.LASF115:
	.string	"_nextf"
.LASF128:
	.string	"time_end_sort"
.LASF32:
	.string	"__tm_mon"
.LASF42:
	.string	"_atexit"
.LASF120:
	.string	"suboptarg"
.LASF74:
	.string	"__sdidinit"
.LASF11:
	.string	"_off_t"
.LASF133:
	.string	"GNU C11 7.2.0 -march=rv32im -mabi=ilp32 -ggdb -fdata-sections -ffunction-sections"
.LASF79:
	.string	"_freelist"
.LASF10:
	.string	"_LOCK_RECURSIVE_T"
.LASF1:
	.string	"unsigned char"
.LASF82:
	.string	"_new"
.LASF124:
	.string	"num_items"
.LASF114:
	.string	"_h_errno"
.LASF2:
	.string	"short int"
.LASF35:
	.string	"__tm_yday"
.LASF45:
	.string	"__sbuf"
.LASF130:
	.string	"bsort_strcpy"
.LASF91:
	.string	"_iobs"
.LASF88:
	.string	"__FILE"
.LASF19:
	.string	"_mbstate_t"
.LASF48:
	.string	"__sFILE"
.LASF63:
	.string	"_mbstate"
.LASF101:
	.string	"_rand_next"
.LASF103:
	.string	"_mblen_state"
.LASF70:
	.string	"_inc"
.LASF43:
	.string	"_ind"
.LASF73:
	.string	"_locale"
.LASF75:
	.string	"__cleanup"
.LASF72:
	.string	"_unspecified_locale_info"
.LASF23:
	.string	"_maxwds"
.LASF65:
	.string	"_reent"
.LASF93:
	.string	"_seed"
.LASF17:
	.string	"__count"
.LASF129:
	.string	"bsort_strings"
.LASF18:
	.string	"__value"
.LASF55:
	.string	"_seek"
.LASF118:
	.string	"_impure_ptr"
.LASF12:
	.string	"_fpos_t"
.LASF66:
	.string	"_errno"
.LASF87:
	.string	"char"
.LASF29:
	.string	"__tm_min"
.LASF94:
	.string	"_mult"
.LASF22:
	.string	"_next"
.LASF97:
	.string	"_strtok_last"
.LASF40:
	.string	"_fntypes"
.LASF135:
	.string	"/users/epakmp/Workarea/pulp/pulpenix/apps/bubblesort"
.LASF95:
	.string	"_add"
.LASF21:
	.string	"__ULong"
.LASF108:
	.string	"_getdate_err"
.LASF119:
	.string	"_global_impure_ptr"
.LASF96:
	.string	"_unused_rand"
.LASF132:
	.string	"bsort_strcmp"
.LASF25:
	.string	"_wds"
.LASF34:
	.string	"__tm_wday"
.LASF89:
	.string	"_glue"
.LASF13:
	.string	"_ssize_t"
.LASF106:
	.string	"_l64a_buf"
.LASF84:
	.string	"_sig_func"
.LASF58:
	.string	"_nbuf"
.LASF117:
	.string	"_unused"
.LASF36:
	.string	"__tm_isdst"
.LASF99:
	.string	"_localtime_buf"
.LASF56:
	.string	"_close"
.LASF102:
	.string	"_r48"
.LASF104:
	.string	"_mbtowc_state"
.LASF78:
	.string	"_p5s"
.LASF137:
	.string	"main"
.LASF31:
	.string	"__tm_mday"
	.ident	"GCC: (GNU MCU Eclipse RISC-V Embedded GCC, 64-bits) 7.2.0"
