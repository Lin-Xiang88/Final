	.file	"qs.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/ubuntu/course-lab_D/DreamTeam/Final/testbench/counter_la" "../../firmware/qs.c"
	.section	.mprjram,"ax",@progbits
	.align	2
	.globl	partition
	.type	partition, @function
partition:
.LFB0:
	.file 1 "../../firmware/qs.c"
	.loc 1 3 75
	.cfi_startproc
.LVL0:
	.loc 1 4 2
	.loc 1 4 6 is_stmt 0
	lui	a5,%hi(.LANCHOR0)
	addi	a3,a5,%lo(.LANCHOR0)
	slli	a7,a1,2
	add	a2,a3,a7
	lw	t4,0(a2)
.LVL1:
	.loc 1 5 2 is_stmt 1
	slli	a2,a0,2
	.loc 1 3 75 is_stmt 0
	mv	a4,a0
	.loc 1 5 6
	addi	t1,a0,-1
.LVL2:
	.loc 1 6 2 is_stmt 1
	.loc 1 7 2
	add	a3,a3,a2
	addi	a5,a5,%lo(.LANCHOR0)
.LVL3:
.L2:
	.loc 1 7 15 discriminator 1
	.loc 1 9 6 is_stmt 0 discriminator 1
	addi	a0,t1,1
	.loc 1 10 9 discriminator 1
	slli	a2,a0,2
	add	a2,a5,a2
	lw	a6,0(a2)
	.loc 1 7 15 discriminator 1
	blt	a4,a1,.L4
	.loc 1 15 2 is_stmt 1
	.loc 1 15 6 is_stmt 0
	add	a5,a5,a7
	lw	a4,0(a5)
.LVL4:
	.loc 1 15 4
	bge	a4,a6,.L1
	.loc 1 16 3 is_stmt 1
.LVL5:
	.loc 1 17 3
	.loc 1 17 10 is_stmt 0
	sw	a4,0(a2)
.LVL6:
	.loc 1 18 3 is_stmt 1
	.loc 1 18 9 is_stmt 0
	sw	a6,0(a5)
	.loc 1 20 2 is_stmt 1
.LVL7:
.L1:
	.loc 1 21 1 is_stmt 0
	ret
.LVL8:
.L4:
	.loc 1 8 3 is_stmt 1
	.loc 1 8 7 is_stmt 0
	lw	t3,0(a3)
	.loc 1 8 5
	bge	t3,t4,.L3
	.loc 1 9 4 is_stmt 1
.LVL9:
	.loc 1 10 4
	.loc 1 11 4
	.loc 1 11 9 is_stmt 0
	sw	t3,0(a2)
.LVL10:
	.loc 1 12 4 is_stmt 1
	.loc 1 12 9 is_stmt 0
	sw	a6,0(a3)
.LVL11:
	.loc 1 9 6
	mv	t1,a0
.LVL12:
.L3:
	.loc 1 7 20 is_stmt 1 discriminator 2
	addi	a4,a4,1
.LVL13:
	addi	a3,a3,4
	j	.L2
	.cfi_endproc
.LFE0:
	.size	partition, .-partition
	.align	2
	.globl	sort
	.type	sort, @function
sort:
.LFB1:
	.loc 1 23 72
	.cfi_startproc
.LVL14:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	s2,0(sp)
	sw	ra,12(sp)
	sw	s1,4(sp)
	.cfi_offset 8, -8
	.cfi_offset 18, -16
	.cfi_offset 1, -4
	.cfi_offset 9, -12
	mv	s0,a0
	mv	s2,a1
.LVL15:
.L8:
	.loc 1 24 2
	.loc 1 24 4 is_stmt 0
	bge	s0,s2,.L6
.LBB2:
	.loc 1 25 3 is_stmt 1
	.loc 1 25 11 is_stmt 0
	mv	a1,s2
	mv	a0,s0
	call	partition
.LVL16:
	mv	s1,a0
.LVL17:
	.loc 1 26 3 is_stmt 1
	addi	a1,a0,-1
	mv	a0,s0
	call	sort
.LVL18:
	.loc 1 27 3
	addi	s0,s1,1
	j	.L8
.LVL19:
.L6:
.LBE2:
	.loc 1 29 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s1,4(sp)
	.cfi_restore 9
	lw	s2,0(sp)
	.cfi_restore 18
.LVL20:
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	sort, .-sort
	.align	2
	.globl	qsort
	.type	qsort, @function
qsort:
.LFB2:
	.loc 1 31 58 is_stmt 1
	.cfi_startproc
	.loc 1 32 2
	.loc 1 31 58 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	.loc 1 32 2
	li	a0,0
	li	a1,9
	.loc 1 31 58
	sw	ra,12(sp)
	.cfi_offset 1, -4
	.loc 1 32 2
	call	sort
.LVL21:
	.loc 1 33 2 is_stmt 1
	.loc 1 34 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	.loc 1 33 9
	lui	a0,%hi(.LANCHOR0)
	.loc 1 34 1
	addi	a0,a0,%lo(.LANCHOR0)
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE2:
	.size	qsort, .-qsort
	.globl	A
	.section	.matmul,"aw"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	A, @object
	.size	A, 40
A:
	.word	893
	.word	40
	.word	3233
	.word	4267
	.word	2669
	.word	2541
	.word	9073
	.word	6023
	.word	5681
	.word	4622
	.text
.Letext0:
	.file 2 "../../firmware/qs.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x16c
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x5
	.4byte	.LASF8
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL7
	.4byte	0
	.4byte	.Ldebug_line0
	.byte	0x6
	.4byte	0x3d
	.4byte	0x36
	.byte	0x7
	.4byte	0x36
	.byte	0x9
	.byte	0
	.byte	0x8
	.byte	0x4
	.byte	0x7
	.4byte	.LASF2
	.byte	0x9
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0xa
	.string	"A"
	.byte	0x2
	.byte	0x5
	.byte	0x31
	.4byte	0x26
	.byte	0x5
	.byte	0x3
	.4byte	A
	.byte	0xb
	.4byte	.LASF3
	.byte	0x1
	.byte	0x1f
	.byte	0x33
	.4byte	0x83
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.4byte	0x83
	.byte	0x4
	.4byte	.LVL21
	.4byte	0x89
	.byte	0x1
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x30
	.byte	0x1
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x39
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x4
	.4byte	0x3d
	.byte	0xd
	.4byte	.LASF4
	.byte	0x1
	.byte	0x17
	.byte	0x33
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x104
	.byte	0x2
	.string	"low"
	.byte	0x17
	.byte	0x3c
	.4byte	0x3d
	.4byte	.LLST4
	.byte	0x2
	.string	"hi"
	.byte	0x17
	.byte	0x45
	.4byte	0x3d
	.4byte	.LLST5
	.byte	0xe
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.byte	0x3
	.string	"p"
	.byte	0x19
	.byte	0x7
	.4byte	0x3d
	.4byte	.LLST6
	.byte	0xf
	.4byte	.LVL16
	.4byte	0x104
	.4byte	0xec
	.byte	0x1
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x1
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0x4
	.4byte	.LVL18
	.4byte	0x89
	.byte	0x1
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x1
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x79
	.byte	0x7f
	.byte	0
	.byte	0
	.byte	0
	.byte	0x10
	.4byte	.LASF5
	.byte	0x1
	.byte	0x3
	.byte	0x32
	.4byte	0x3d
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0x2
	.string	"low"
	.byte	0x3
	.byte	0x40
	.4byte	0x3d
	.4byte	.LLST0
	.byte	0x11
	.string	"hi"
	.byte	0x1
	.byte	0x3
	.byte	0x48
	.4byte	0x3d
	.byte	0x1
	.byte	0x5b
	.byte	0x12
	.4byte	.LASF6
	.byte	0x1
	.byte	0x4
	.byte	0x6
	.4byte	0x3d
	.byte	0x1
	.byte	0x6d
	.byte	0x3
	.string	"i"
	.byte	0x5
	.byte	0x6
	.4byte	0x3d
	.4byte	.LLST1
	.byte	0x3
	.string	"j"
	.byte	0x5
	.byte	0x10
	.4byte	0x3d
	.4byte	.LLST2
	.byte	0x13
	.4byte	.LASF7
	.byte	0x1
	.byte	0x6
	.byte	0x6
	.4byte	0x3d
	.4byte	.LLST3
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x49
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x7e
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x48
	.byte	0x1
	.byte	0x7d
	.byte	0x1
	.byte	0x7f
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x11
	.byte	0x1
	.byte	0x25
	.byte	0xe
	.byte	0x13
	.byte	0xb
	.byte	0x3
	.byte	0x1f
	.byte	0x1b
	.byte	0x1f
	.byte	0x55
	.byte	0x17
	.byte	0x11
	.byte	0x1
	.byte	0x10
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x8
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
	.byte	0x9
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
	.byte	0xa
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0xb
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
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xd
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
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0x48
	.byte	0x1
	.byte	0x7d
	.byte	0x1
	.byte	0x7f
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x10
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
	.byte	0x39
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
	.byte	0x7a
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loclists,"",@progbits
	.4byte	.Ldebug_loc3-.Ldebug_loc2
.Ldebug_loc2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
.Ldebug_loc0:
.LLST4:
	.byte	0x7
	.4byte	.LVL14
	.4byte	.LVL15
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL15
	.4byte	.LFE1
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0
.LLST5:
	.byte	0x7
	.4byte	.LVL14
	.4byte	.LVL15
	.byte	0x1
	.byte	0x5b
	.byte	0x7
	.4byte	.LVL15
	.4byte	.LVL20
	.byte	0x1
	.byte	0x62
	.byte	0x7
	.4byte	.LVL20
	.4byte	.LFE1
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.byte	0
.LLST6:
	.byte	0x7
	.4byte	.LVL17
	.4byte	.LVL19
	.byte	0x1
	.byte	0x59
	.byte	0
.LLST0:
	.byte	0x7
	.4byte	.LVL0
	.4byte	.LVL3
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL3
	.4byte	.LFE0
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0
.LLST1:
	.byte	0x7
	.4byte	.LVL2
	.4byte	.LVL9
	.byte	0x1
	.byte	0x56
	.byte	0x7
	.4byte	.LVL9
	.4byte	.LVL11
	.byte	0x3
	.byte	0x76
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL11
	.4byte	.LVL12
	.byte	0x3
	.byte	0x7a
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL12
	.4byte	.LFE0
	.byte	0x1
	.byte	0x56
	.byte	0
.LLST2:
	.byte	0x7
	.4byte	.LVL2
	.4byte	.LVL3
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL3
	.4byte	.LVL4
	.byte	0x1
	.byte	0x5e
	.byte	0x7
	.4byte	.LVL8
	.4byte	.LFE0
	.byte	0x1
	.byte	0x5e
	.byte	0
.LLST3:
	.byte	0x7
	.4byte	.LVL5
	.4byte	.LVL6
	.byte	0xa
	.byte	0x76
	.byte	0x1
	.byte	0x32
	.byte	0x24
	.byte	0x3
	.4byte	A
	.byte	0x22
	.byte	0x7
	.4byte	.LVL9
	.4byte	.LVL10
	.byte	0xa
	.byte	0x76
	.byte	0x1
	.byte	0x32
	.byte	0x24
	.byte	0x3
	.4byte	A
	.byte	0x22
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",@progbits
	.4byte	0x2c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.4byte	0
	.4byte	0
	.section	.debug_rnglists,"",@progbits
.Ldebug_ranges0:
	.4byte	.Ldebug_ranges3-.Ldebug_ranges2
.Ldebug_ranges2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
.LLRL7:
	.byte	0x6
	.4byte	.LFB0
	.4byte	.LFE0
	.byte	0x6
	.4byte	.LFB1
	.4byte	.LFE1
	.byte	0x6
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF2:
	.string	"unsigned int"
.LASF8:
	.string	"GNU C17 12.1.0 -mabi=ilp32 -mtune=rocket -misa-spec=2.2 -march=rv32i -g -Os -ffreestanding"
.LASF6:
	.string	"pivot"
.LASF3:
	.string	"qsort"
.LASF7:
	.string	"temp"
.LASF5:
	.string	"partition"
.LASF4:
	.string	"sort"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"../../firmware/qs.c"
.LASF1:
	.string	"/home/ubuntu/course-lab_D/DreamTeam/Final/testbench/counter_la"
	.ident	"GCC: (g1ea978e3066) 12.1.0"
