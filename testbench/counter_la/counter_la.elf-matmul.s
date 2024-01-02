	.file	"matmul.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/ubuntu/course-lab_D/DreamTeam/Final/testbench/counter_la" "../../firmware/matmul.c"
	.section	.mprjram,"ax",@progbits
	.align	2
	.globl	firPtr
	.type	firPtr, @function
firPtr:
.LFB0:
	.file 1 "../../firmware/matmul.c"
	.loc 1 24 1
	.cfi_startproc
	.loc 1 25 2
	.loc 1 25 13 is_stmt 0
	lui	a5,%hi(inst_addr)
	lw	a5,%lo(inst_addr)(a5)
	.loc 1 25 11
	lui	a4,%hi(inst_ptr)
	sw	a5,%lo(inst_ptr)(a4)
	.loc 1 34 2 is_stmt 1
	.loc 1 34 12 is_stmt 0
	li	a4,208896
	addi	a4,a4,-856
	sw	a4,0(a5)
	.loc 1 35 2 is_stmt 1
	.loc 1 35 12 is_stmt 0
	li	a4,196608
	sw	a4,0(a5)
	.loc 1 37 2 is_stmt 1
	.loc 1 37 12 is_stmt 0
	li	a4,458752
	addi	a4,a4,40
	sw	a4,0(a5)
	.loc 1 38 2 is_stmt 1
	.loc 1 38 12 is_stmt 0
	li	a4,393216
	addi	a4,a4,252
	sw	a4,0(a5)
	.loc 1 39 1
	ret
	.cfi_endproc
.LFE0:
	.size	firPtr, .-firPtr
	.globl	inst_addr
	.globl	inst_ptr
	.globl	result
	.globl	fir_data
	.globl	fir_tap
	.globl	AB
	.bss
	.align	2
	.type	result, @object
	.size	result, 64
result:
	.zero	64
	.section	.fir,"aw"
	.align	2
	.type	fir_data, @object
	.size	fir_data, 256
fir_data:
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	9
	.word	10
	.word	11
	.word	12
	.word	13
	.word	14
	.word	15
	.word	16
	.word	17
	.word	18
	.word	19
	.word	20
	.word	21
	.word	22
	.word	23
	.word	24
	.word	25
	.word	26
	.word	27
	.word	28
	.word	29
	.word	30
	.word	31
	.word	32
	.word	33
	.word	34
	.word	35
	.word	36
	.word	37
	.word	38
	.word	39
	.word	40
	.word	41
	.word	42
	.word	43
	.word	44
	.word	45
	.word	46
	.word	47
	.word	48
	.word	49
	.word	50
	.word	51
	.word	52
	.word	53
	.word	54
	.word	55
	.word	56
	.word	57
	.word	58
	.word	59
	.word	60
	.word	61
	.word	62
	.word	63
	.word	64
	.section	.matmul,"aw"
	.align	2
	.type	fir_tap, @object
	.size	fir_tap, 44
fir_tap:
	.word	0
	.word	-10
	.word	-9
	.word	23
	.word	56
	.word	63
	.word	56
	.word	23
	.word	-9
	.word	-10
	.word	0
	.type	AB, @object
	.size	AB, 128
AB:
	.word	0
	.word	1
	.word	0
	.word	1
	.word	1
	.word	2
	.word	5
	.word	6
	.word	3
	.word	4
	.word	7
	.word	8
	.word	0
	.word	1
	.word	0
	.word	1
	.word	2
	.word	3
	.word	2
	.word	3
	.word	9
	.word	10
	.word	13
	.word	14
	.word	11
	.word	12
	.word	15
	.word	16
	.word	2
	.word	3
	.word	2
	.word	3
	.section	.sbss,"aw",@nobits
	.align	2
	.type	inst_ptr, @object
	.size	inst_ptr, 4
inst_ptr:
	.zero	4
	.section	.sdata,"aw"
	.align	2
	.type	inst_addr, @object
	.size	inst_addr, 4
inst_addr:
	.word	805308024
	.text
.Letext0:
	.file 2 "../../firmware/matmul.h"
	.file 3 "../../firmware/dma.h"
	.file 4 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint-gcc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x13d
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x5
	.4byte	.LASF16
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL0
	.4byte	0
	.4byte	.Ldebug_line0
	.byte	0x1
	.byte	0x1
	.byte	0x6
	.4byte	.LASF2
	.byte	0x1
	.byte	0x2
	.byte	0x5
	.4byte	.LASF3
	.byte	0x1
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.byte	0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF5
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.byte	0x1
	.byte	0x2
	.byte	0x7
	.4byte	.LASF7
	.byte	0x6
	.4byte	.LASF17
	.byte	0x4
	.byte	0x34
	.byte	0x1b
	.4byte	0x61
	.byte	0x7
	.4byte	0x50
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.byte	0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.byte	0x8
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.byte	0x3
	.4byte	0x6f
	.4byte	0x8d
	.byte	0x4
	.4byte	0x76
	.byte	0x1f
	.byte	0
	.byte	0x9
	.string	"AB"
	.byte	0x2
	.byte	0x20
	.byte	0x31
	.4byte	0x7d
	.byte	0x5
	.byte	0x3
	.4byte	AB
	.byte	0x3
	.4byte	0x6f
	.4byte	0xae
	.byte	0x4
	.4byte	0x76
	.byte	0xa
	.byte	0
	.byte	0x2
	.4byte	.LASF11
	.byte	0x2
	.byte	0x25
	.byte	0x32
	.4byte	0x9e
	.byte	0x5
	.byte	0x3
	.4byte	fir_tap
	.byte	0x3
	.4byte	0x6f
	.4byte	0xd0
	.byte	0x4
	.4byte	0x76
	.byte	0x3f
	.byte	0
	.byte	0x2
	.4byte	.LASF12
	.byte	0x2
	.byte	0x27
	.byte	0x2f
	.4byte	0xc0
	.byte	0x5
	.byte	0x3
	.4byte	fir_data
	.byte	0x3
	.4byte	0x6f
	.4byte	0xf2
	.byte	0x4
	.4byte	0x76
	.byte	0xf
	.byte	0
	.byte	0x2
	.4byte	.LASF13
	.byte	0x2
	.byte	0x2a
	.byte	0x6
	.4byte	0xe2
	.byte	0x5
	.byte	0x3
	.4byte	result
	.byte	0x2
	.4byte	.LASF14
	.byte	0x3
	.byte	0x5
	.byte	0x14
	.4byte	0x116
	.byte	0x5
	.byte	0x3
	.4byte	inst_ptr
	.byte	0xa
	.byte	0x4
	.4byte	0x5c
	.byte	0x2
	.4byte	.LASF15
	.byte	0x3
	.byte	0x6
	.byte	0x13
	.4byte	0x5c
	.byte	0x5
	.byte	0x3
	.4byte	inst_addr
	.byte	0xb
	.4byte	.LASF18
	.byte	0x1
	.byte	0x17
	.byte	0x33
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
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
	.byte	0x2
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
	.byte	0x3f
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
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
	.byte	0x16
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
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x35
	.byte	0
	.byte	0x49
	.byte	0x13
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
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0x9
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
	.byte	0xa
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x2e
	.byte	0
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
	.section	.debug_rnglists,"",@progbits
.Ldebug_ranges0:
	.4byte	.Ldebug_ranges3-.Ldebug_ranges2
.Ldebug_ranges2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
.LLRL0:
	.byte	0x6
	.4byte	.LFB0
	.4byte	.LFE0
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF18:
	.string	"firPtr"
.LASF14:
	.string	"inst_ptr"
.LASF6:
	.string	"unsigned char"
.LASF8:
	.string	"long unsigned int"
.LASF7:
	.string	"short unsigned int"
.LASF12:
	.string	"fir_data"
.LASF15:
	.string	"inst_addr"
.LASF10:
	.string	"unsigned int"
.LASF16:
	.string	"GNU C17 12.1.0 -mabi=ilp32 -mtune=rocket -misa-spec=2.2 -march=rv32i -g -Os -ffreestanding"
.LASF9:
	.string	"long long unsigned int"
.LASF13:
	.string	"result"
.LASF11:
	.string	"fir_tap"
.LASF5:
	.string	"long long int"
.LASF3:
	.string	"short int"
.LASF17:
	.string	"uint32_t"
.LASF4:
	.string	"long int"
.LASF2:
	.string	"signed char"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/ubuntu/course-lab_D/DreamTeam/Final/testbench/counter_la"
.LASF0:
	.string	"../../firmware/matmul.c"
	.ident	"GCC: (g1ea978e3066) 12.1.0"
