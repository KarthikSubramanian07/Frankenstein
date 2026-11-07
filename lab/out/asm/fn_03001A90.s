fn_03001A90:
 3001a90:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 3001a94:	e59f93d4 	ldr	r9, [pc, #980]	@ 3001e70 <fn_03001A90+0x3e0>
 3001a98:	e59930c8 	ldr	r3, [r9, #200]	@ 0xc8
 3001a9c:	e24dd04c 	sub	sp, sp, #76	@ 0x4c
 3001aa0:	e590e000 	ldr	lr, [r0]
 3001aa4:	e58d3040 	str	r3, [sp, #64]	@ 0x40
 3001aa8:	e59f33c4 	ldr	r3, [pc, #964]	@ 3001e74 <fn_03001A90+0x3e4>
 3001aac:	e59fc3c4 	ldr	ip, [pc, #964]	@ 3001e78 <fn_03001A90+0x3e8>
 3001ab0:	e5934000 	ldr	r4, [r3]
 3001ab4:	e1de31b0 	ldrh	r3, [lr, #16]
 3001ab8:	e153000c 	cmp	r3, ip
 3001abc:	15945df0 	ldrne	r5, [r4, #3568]	@ 0xdf0
 3001ac0:	10833103 	addne	r3, r3, r3, lsl #2
 3001ac4:	10855183 	addne	r5, r5, r3, lsl #3
 3001ac8:	e59fc3a8 	ldr	ip, [pc, #936]	@ 3001e78 <fn_03001A90+0x3e8>
 3001acc:	e1de31b2 	ldrh	r3, [lr, #18]
 3001ad0:	03a05000 	moveq	r5, #0
 3001ad4:	e153000c 	cmp	r3, ip
 3001ad8:	15946df0 	ldrne	r6, [r4, #3568]	@ 0xdf0
 3001adc:	10833103 	addne	r3, r3, r3, lsl #2
 3001ae0:	e594ce10 	ldr	ip, [r4, #3600]	@ 0xe10
 3001ae4:	10866183 	addne	r6, r6, r3, lsl #3
 3001ae8:	e1de30bc 	ldrh	r3, [lr, #12]
 3001aec:	03a06000 	moveq	r6, #0
 3001af0:	e153000c 	cmp	r3, ip
 3001af4:	3594ce14 	ldrcc	ip, [r4, #3604]	@ 0xe14
 3001af8:	2594ce0c 	ldrcs	ip, [r4, #3596]	@ 0xe0c
 3001afc:	e0833083 	add	r3, r3, r3, lsl #1
 3001b00:	e589e0cc 	str	lr, [r9, #204]	@ 0xcc
 3001b04:	e08cc103 	add	ip, ip, r3, lsl #2
 3001b08:	e1dee0be 	ldrh	lr, [lr, #14]
 3001b0c:	e5943e00 	ldr	r3, [r4, #3584]	@ 0xe00
 3001b10:	e083328e 	add	r3, r3, lr, lsl #5
 3001b14:	e1d331b8 	ldrh	r3, [r3, #24]
 3001b18:	e1d0e0f4 	ldrsh	lr, [r0, #4]
 3001b1c:	e5904010 	ldr	r4, [r0, #16]
 3001b20:	e3130010 	tst	r3, #16
 3001b24:	e5903008 	ldr	r3, [r0, #8]
 3001b28:	e041e00e 	sub	lr, r1, lr
 3001b2c:	e0233e94 	mla	r3, r4, lr, r3
 3001b30:	e58930e8 	str	r3, [r9, #232]	@ 0xe8
 3001b34:	e1dc30b8 	ldrh	r3, [ip, #8]
 3001b38:	e599e0d8 	ldr	lr, [r9, #216]	@ 0xd8
 3001b3c:	e1a03083 	lsl	r3, r3, #1
 3001b40:	e19e70f3 	ldrsh	r7, [lr, r3]
 3001b44:	e5d53026 	ldrb	r3, [r5, #38]	@ 0x26
 3001b48:	e58930dc 	str	r3, [r9, #220]	@ 0xdc
 3001b4c:	e5903028 	ldr	r3, [r0, #40]	@ 0x28
 3001b50:	e58950d0 	str	r5, [r9, #208]	@ 0xd0
 3001b54:	e58960d4 	str	r6, [r9, #212]	@ 0xd4
 3001b58:	e58940e4 	str	r4, [r9, #228]	@ 0xe4
 3001b5c:	e58930e0 	str	r3, [r9, #224]	@ 0xe0
 3001b60:	e5903024 	ldr	r3, [r0, #36]	@ 0x24
 3001b64:	e58930ec 	str	r3, [r9, #236]	@ 0xec
 3001b68:	e5903020 	ldr	r3, [r0, #32]
 3001b6c:	e58930f0 	str	r3, [r9, #240]	@ 0xf0
 3001b70:	e59930f4 	ldr	r3, [r9, #244]	@ 0xf4
 3001b74:	0a000098 	beq	3001ddc <fn_03001A90+0x34c>
 3001b78:	e59900f8 	ldr	r0, [r9, #248]	@ 0xf8
 3001b7c:	e5964000 	ldr	r4, [r6]
 3001b80:	e595e000 	ldr	lr, [r5]
 3001b84:	e7900107 	ldr	r0, [r0, r7, lsl #2]
 3001b88:	e154000e 	cmp	r4, lr
 3001b8c:	a0800004 	addge	r0, r0, r4
 3001b90:	b080000e 	addlt	r0, r0, lr
 3001b94:	e0403003 	sub	r3, r0, r3
 3001b98:	e1dc00f2 	ldrsh	r0, [ip, #2]
 3001b9c:	e0834800 	add	r4, r3, r0, lsl #16
 3001ba0:	e59930c0 	ldr	r3, [r9, #192]	@ 0xc0
 3001ba4:	e793e107 	ldr	lr, [r3, r7, lsl #2]
 3001ba8:	e35e0000 	cmp	lr, #0
 3001bac:	e58d4038 	str	r4, [sp, #56]	@ 0x38
 3001bb0:	0a0000a6 	beq	3001e50 <fn_03001A90+0x3c0>
 3001bb4:	e59930fc 	ldr	r3, [r9, #252]	@ 0xfc
 3001bb8:	e3530000 	cmp	r3, #0
 3001bbc:	0a00008c 	beq	3001df4 <fn_03001A90+0x364>
 3001bc0:	e59f32b4 	ldr	r3, [pc, #692]	@ 3001e7c <fn_03001A90+0x3ec>
 3001bc4:	e58d3040 	str	r3, [sp, #64]	@ 0x40
 3001bc8:	e3a03000 	mov	r3, #0
 3001bcc:	e58d3024 	str	r3, [sp, #36]	@ 0x24
 3001bd0:	e1510002 	cmp	r1, r2
 3001bd4:	ca00007b 	bgt	3001dc8 <fn_03001A90+0x338>
 3001bd8:	e599c0e0 	ldr	ip, [r9, #224]	@ 0xe0
 3001bdc:	e28930e4 	add	r3, r9, #228	@ 0xe4
 3001be0:	e8930028 	ldm	r3, {r3, r5}
 3001be4:	e08c2082 	add	r2, ip, r2, lsl #1
 3001be8:	e58d3018 	str	r3, [sp, #24]
 3001bec:	e58d2014 	str	r2, [sp, #20]
 3001bf0:	e0c23394 	smull	r3, r2, r4, r3
 3001bf4:	e58d301c 	str	r3, [sp, #28]
 3001bf8:	e0c30495 	smull	r0, r3, r5, r4
 3001bfc:	e58d2020 	str	r2, [sp, #32]
 3001c00:	e1a02003 	mov	r2, r3
 3001c04:	e1a0300e 	mov	r3, lr
 3001c08:	e1a0e002 	mov	lr, r2
 3001c0c:	e24cc002 	sub	ip, ip, #2
 3001c10:	e08cc081 	add	ip, ip, r1, lsl #1
 3001c14:	e1fc40f2 	ldrsh	r4, [ip, #2]!
 3001c18:	e59f2260 	ldr	r2, [pc, #608]	@ 3001e80 <fn_03001A90+0x3f0>
 3001c1c:	e1540002 	cmp	r4, r2
 3001c20:	0a00005d 	beq	3001d9c <fn_03001A90+0x30c>
 3001c24:	e59d6024 	ldr	r6, [sp, #36]	@ 0x24
 3001c28:	e3560000 	cmp	r6, #0
 3001c2c:	0a000006 	beq	3001c4c <fn_03001A90+0x1bc>
 3001c30:	e1a02525 	lsr	r2, r5, #10
 3001c34:	e352009f 	cmp	r2, #159	@ 0x9f
 3001c38:	23a0209f 	movcs	r2, #159	@ 0x9f
 3001c3c:	e7d62002 	ldrb	r2, [r6, r2]
 3001c40:	e59f623c 	ldr	r6, [pc, #572]	@ 3001e84 <fn_03001A90+0x3f4>
 3001c44:	e0862402 	add	r2, r6, r2, lsl #8
 3001c48:	e58d2040 	str	r2, [sp, #64]	@ 0x40
 3001c4c:	e59f6234 	ldr	r6, [pc, #564]	@ 3001e88 <fn_03001A90+0x3f8>
 3001c50:	e0252fc5 	eor	r2, r5, r5, asr #31
 3001c54:	e0422fc5 	sub	r2, r2, r5, asr #31
 3001c58:	e7d66822 	ldrb	r6, [r6, r2, lsr #16]
 3001c5c:	e59f7228 	ldr	r7, [pc, #552]	@ 3001e8c <fn_03001A90+0x3fc>
 3001c60:	e1a02632 	lsr	r2, r2, r6
 3001c64:	e7972102 	ldr	r2, [r7, r2, lsl #2]
 3001c68:	e3550000 	cmp	r5, #0
 3001c6c:	e1a02652 	asr	r2, r2, r6
 3001c70:	b2622000 	rsblt	r2, r2, #0
 3001c74:	e58d2034 	str	r2, [sp, #52]	@ 0x34
 3001c78:	e1d320b4 	ldrh	r2, [r3, #4]
 3001c7c:	e1d360f6 	ldrsh	r6, [r3, #6]
 3001c80:	e0022004 	and	r2, r2, r4
 3001c84:	e593400c 	ldr	r4, [r3, #12]
 3001c88:	e0866002 	add	r6, r6, r2
 3001c8c:	e1a02082 	lsl	r2, r2, #1
 3001c90:	e19470b2 	ldrh	r7, [r4, r2]
 3001c94:	e1a06086 	lsl	r6, r6, #1
 3001c98:	e59920c4 	ldr	r2, [r9, #196]	@ 0xc4
 3001c9c:	e19460b6 	ldrh	r6, [r4, r6]
 3001ca0:	e5994108 	ldr	r4, [r9, #264]	@ 0x108
 3001ca4:	e0822387 	add	r2, r2, r7, lsl #7
 3001ca8:	e58d203c 	str	r2, [sp, #60]	@ 0x3c
 3001cac:	e1a08820 	lsr	r8, r0, #16
 3001cb0:	e7d42086 	ldrb	r2, [r4, r6, lsl #1]
 3001cb4:	e188880e 	orr	r8, r8, lr, lsl #16
 3001cb8:	e2688501 	rsb	r8, r8, #4194304	@ 0x400000
 3001cbc:	e35200ff 	cmp	r2, #255	@ 0xff
 3001cc0:	e5898104 	str	r8, [r9, #260]	@ 0x104
 3001cc4:	e0844086 	add	r4, r4, r6, lsl #1
 3001cc8:	0a000031 	beq	3001d94 <fn_03001A90+0x304>
 3001ccc:	e28970ec 	add	r7, r9, #236	@ 0xec
 3001cd0:	e8970880 	ldm	r7, {r7, fp}
 3001cd4:	e1a06081 	lsl	r6, r1, #1
 3001cd8:	e197a0f6 	ldrsh	sl, [r7, r6]
 3001cdc:	e19b60f6 	ldrsh	r6, [fp, r6]
 3001ce0:	e286b001 	add	fp, r6, #1
 3001ce4:	e88d100a 	stm	sp, {r1, r3, ip}
 3001ce8:	e1a0300b 	mov	r3, fp
 3001cec:	e24a7001 	sub	r7, sl, #1
 3001cf0:	e1a0b00a 	mov	fp, sl
 3001cf4:	e1a0c002 	mov	ip, r2
 3001cf8:	e1a0a008 	mov	sl, r8
 3001cfc:	e58d000c 	str	r0, [sp, #12]
 3001d00:	e1a08003 	mov	r8, r3
 3001d04:	e58de010 	str	lr, [sp, #16]
 3001d08:	ea000002 	b	3001d18 <fn_03001A90+0x288>
 3001d0c:	e5f4c002 	ldrb	ip, [r4, #2]!
 3001d10:	e35c00ff 	cmp	ip, #255	@ 0xff
 3001d14:	0a00001b 	beq	3001d88 <fn_03001A90+0x2f8>
 3001d18:	e02cac95 	mla	ip, r5, ip, sl
 3001d1c:	e5d40001 	ldrb	r0, [r4, #1]
 3001d20:	e020c095 	mla	r0, r5, r0, ip
 3001d24:	e28cccff 	add	ip, ip, #65280	@ 0xff00
 3001d28:	e2400001 	sub	r0, r0, #1
 3001d2c:	e28cc0ff 	add	ip, ip, #255	@ 0xff
 3001d30:	e15b0840 	cmp	fp, r0, asr #16
 3001d34:	e1a0c84c 	asr	ip, ip, #16
 3001d38:	e1a0e840 	asr	lr, r0, #16
 3001d3c:	d1a0e007 	movle	lr, r7
 3001d40:	e156000c 	cmp	r6, ip
 3001d44:	a1a0c008 	movge	ip, r8
 3001d48:	e35e007f 	cmp	lr, #127	@ 0x7f
 3001d4c:	c3a00000 	movgt	r0, #0
 3001d50:	d3a00001 	movle	r0, #1
 3001d54:	e15e000c 	cmp	lr, ip
 3001d58:	b3a00000 	movlt	r0, #0
 3001d5c:	e3500000 	cmp	r0, #0
 3001d60:	0affffe9 	beq	3001d0c <fn_03001A90+0x27c>
 3001d64:	e59d3000 	ldr	r3, [sp]
 3001d68:	e28d0028 	add	r0, sp, #40	@ 0x28
 3001d6c:	e58dc02c 	str	ip, [sp, #44]	@ 0x2c
 3001d70:	e58d3028 	str	r3, [sp, #40]	@ 0x28
 3001d74:	e58de030 	str	lr, [sp, #48]	@ 0x30
 3001d78:	ebfffe94 	bl	30017d0 <fn_030017D0>
 3001d7c:	e5f4c002 	ldrb	ip, [r4, #2]!
 3001d80:	e35c00ff 	cmp	ip, #255	@ 0xff
 3001d84:	1affffe3 	bne	3001d18 <fn_03001A90+0x288>
 3001d88:	e28d000c 	add	r0, sp, #12
 3001d8c:	e89d100a 	ldm	sp, {r1, r3, ip}
 3001d90:	e8904001 	ldm	r0, {r0, lr}
 3001d94:	e3e02902 	mvn	r2, #32768	@ 0x8000
 3001d98:	e1cc20b0 	strh	r2, [ip]
 3001d9c:	e59d201c 	ldr	r2, [sp, #28]
 3001da0:	e0920000 	adds	r0, r2, r0
 3001da4:	e59d2018 	ldr	r2, [sp, #24]
 3001da8:	e0855002 	add	r5, r5, r2
 3001dac:	e59d2020 	ldr	r2, [sp, #32]
 3001db0:	e0a2e00e 	adc	lr, r2, lr
 3001db4:	e59d2014 	ldr	r2, [sp, #20]
 3001db8:	e152000c 	cmp	r2, ip
 3001dbc:	e58950e8 	str	r5, [r9, #232]	@ 0xe8
 3001dc0:	e2811001 	add	r1, r1, #1
 3001dc4:	1affff92 	bne	3001c14 <fn_03001A90+0x184>
 3001dc8:	e3a03000 	mov	r3, #0
 3001dcc:	e58930cc 	str	r3, [r9, #204]	@ 0xcc
 3001dd0:	e28dd04c 	add	sp, sp, #76	@ 0x4c
 3001dd4:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 3001dd8:	e12fff1e 	bx	lr
 3001ddc:	e596e004 	ldr	lr, [r6, #4]
 3001de0:	e5950004 	ldr	r0, [r5, #4]
 3001de4:	e15e0000 	cmp	lr, r0
 3001de8:	d063300e 	rsble	r3, r3, lr
 3001dec:	c0633000 	rsbgt	r3, r3, r0
 3001df0:	eaffff68 	b	3001b98 <fn_03001A90+0x108>
 3001df4:	e59930cc 	ldr	r3, [r9, #204]	@ 0xcc
 3001df8:	e1d300f2 	ldrsh	r0, [r3, #2]
 3001dfc:	e1d350f6 	ldrsh	r5, [r3, #6]
 3001e00:	e1550000 	cmp	r5, r0
 3001e04:	03e00000 	mvneq	r0, #0
 3001e08:	e599c0dc 	ldr	ip, [r9, #220]	@ 0xdc
 3001e0c:	0a000004 	beq	3001e24 <fn_03001A90+0x394>
 3001e10:	e1d300f0 	ldrsh	r0, [r3]
 3001e14:	e1d330f4 	ldrsh	r3, [r3, #4]
 3001e18:	e0403003 	sub	r3, r0, r3
 3001e1c:	e2730000 	rsbs	r0, r3, #0
 3001e20:	e0a00003 	adc	r0, r0, r3
 3001e24:	e5993100 	ldr	r3, [r9, #256]	@ 0x100
 3001e28:	e083324c 	add	r3, r3, ip, asr #4
 3001e2c:	e0833000 	add	r3, r3, r0
 3001e30:	e1c33fc3 	bic	r3, r3, r3, asr #31
 3001e34:	e353000f 	cmp	r3, #15
 3001e38:	a3a0300f 	movge	r3, #15
 3001e3c:	e59f004c 	ldr	r0, [pc, #76]	@ 3001e90 <fn_03001A90+0x400>
 3001e40:	e0833103 	add	r3, r3, r3, lsl #2
 3001e44:	e0803283 	add	r3, r0, r3, lsl #5
 3001e48:	e58d3024 	str	r3, [sp, #36]	@ 0x24
 3001e4c:	eaffff5f 	b	3001bd0 <fn_03001A90+0x140>
 3001e50:	e1a00007 	mov	r0, r7
 3001e54:	e59f3038 	ldr	r3, [pc, #56]	@ 3001e94 <fn_03001A90+0x404>
 3001e58:	e88d0006 	stm	sp, {r1, r2}
 3001e5c:	e1a0e00f 	mov	lr, pc
 3001e60:	e12fff13 	bx	r3
 3001e64:	e89d0006 	ldm	sp, {r1, r2}
 3001e68:	e1a0e000 	mov	lr, r0
 3001e6c:	eaffff50 	b	3001bb4 <fn_03001A90+0x124>
 3001e70:	030064cc 	.word	0x030064cc	@ data_030064CC
 3001e74:	030064c4 	.word	0x030064c4	@ data_030064C4
 3001e78:	0000ffff 	.word	0x0000ffff
 3001e7c:	05000200 	.word	0x05000200
 3001e80:	00007fff 	.word	0x00007fff
 3001e84:	06013600 	.word	0x06013600
 3001e88:	0802648c 	.word	0x0802648c	@ data_0802648C
 3001e8c:	0802e48c 	.word	0x0802e48c	@ data_0802E48C
 3001e90:	08132804 	.word	0x08132804	@ data_08132804
 3001e94:	08018b95 	.word	0x08018b95	@ fn_08018B94
