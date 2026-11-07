fn_03002CDC:
 3002cdc:	e59f3fc8 	ldr	r3, [pc, #4040]	@ 3003cac <fn_03002CDC+0xfd0>
 3002ce0:	e5933000 	ldr	r3, [r3]
 3002ce4:	e593cdf8 	ldr	ip, [r3, #3576]	@ 0xdf8
 3002ce8:	e08c2100 	add	r2, ip, r0, lsl #2
 3002cec:	e1d220b2 	ldrh	r2, [r2, #2]
 3002cf0:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 3002cf4:	e593ede8 	ldr	lr, [r3, #3560]	@ 0xde8
 3002cf8:	e0822102 	add	r2, r2, r2, lsl #2
 3002cfc:	e08e7102 	add	r7, lr, r2, lsl #2
 3002d00:	e1d721b0 	ldrh	r2, [r7, #16]
 3002d04:	e5933df0 	ldr	r3, [r3, #3568]	@ 0xdf0
 3002d08:	e59fbf74 	ldr	fp, [pc, #3956]	@ 3003c84 <fn_03002CDC+0xfa8>
 3002d0c:	e1a00100 	lsl	r0, r0, #2
 3002d10:	e0822102 	add	r2, r2, r2, lsl #2
 3002d14:	e59b10f4 	ldr	r1, [fp, #244]	@ 0xf4
 3002d18:	e19c80b0 	ldrh	r8, [ip, r0]
 3002d1c:	e7930182 	ldr	r0, [r3, r2, lsl #3]
 3002d20:	e0833182 	add	r3, r3, r2, lsl #3
 3002d24:	e1500001 	cmp	r0, r1
 3002d28:	e24dd0bc 	sub	sp, sp, #188	@ 0xbc
 3002d2c:	a3a00000 	movge	r0, #0
 3002d30:	e58b30d0 	str	r3, [fp, #208]	@ 0xd0
 3002d34:	ba000676 	blt	3004714 <fn_03002CDC+0x1a38>
 3002d38:	e58b0124 	str	r0, [fp, #292]	@ 0x124
 3002d3c:	e5930004 	ldr	r0, [r3, #4]
 3002d40:	e1500001 	cmp	r0, r1
 3002d44:	e5d31025 	ldrb	r1, [r3, #37]	@ 0x25
 3002d48:	ca000379 	bgt	3003b34 <fn_03002CDC+0xe58>
 3002d4c:	e59f2f58 	ldr	r2, [pc, #3928]	@ 3003cac <fn_03002CDC+0xfd0>
 3002d50:	e5922000 	ldr	r2, [r2]
 3002d54:	e2822901 	add	r2, r2, #16384	@ 0x4000
 3002d58:	e59221b0 	ldr	r2, [r2, #432]	@ 0x1b0
 3002d5c:	e1520001 	cmp	r2, r1
 3002d60:	13a00000 	movne	r0, #0
 3002d64:	0a000372 	beq	3003b34 <fn_03002CDC+0xe58>
 3002d68:	e58b0128 	str	r0, [fp, #296]	@ 0x128
 3002d6c:	e5d31026 	ldrb	r1, [r3, #38]	@ 0x26
 3002d70:	e1a00003 	mov	r0, r3
 3002d74:	ebfffeb6 	bl	3002854 <fn_03002854>
 3002d78:	e3580000 	cmp	r8, #0
 3002d7c:	0a00037b 	beq	3003b70 <fn_03002CDC+0xe94>
 3002d80:	e1d710f0 	ldrsh	r1, [r7]
 3002d84:	e1d730f2 	ldrsh	r3, [r7, #2]
 3002d88:	e59b9010 	ldr	r9, [fp, #16]
 3002d8c:	e1d750f4 	ldrsh	r5, [r7, #4]
 3002d90:	e59b400c 	ldr	r4, [fp, #12]
 3002d94:	e1d760f6 	ldrsh	r6, [r7, #6]
 3002d98:	e0490803 	sub	r0, r9, r3, lsl #16
 3002d9c:	e045e001 	sub	lr, r5, r1
 3002da0:	e046a003 	sub	sl, r6, r3
 3002da4:	e1a02801 	lsl	r2, r1, #16
 3002da8:	e0441801 	sub	r1, r4, r1, lsl #16
 3002dac:	e0ccee90 	smull	lr, ip, r0, lr
 3002db0:	e0c0119a 	smull	r1, r0, sl, r1
 3002db4:	e151000e 	cmp	r1, lr
 3002db8:	e0d0000c 	sbcs	r0, r0, ip
 3002dbc:	e1a03803 	lsl	r3, r3, #16
 3002dc0:	ba000365 	blt	3003b5c <fn_03002CDC+0xe80>
 3002dc4:	e1a01009 	mov	r1, r9
 3002dc8:	e1a00004 	mov	r0, r4
 3002dcc:	ebfffe62 	bl	300275c <fn_0300275C>
 3002dd0:	e1a01009 	mov	r1, r9
 3002dd4:	e1a0a000 	mov	sl, r0
 3002dd8:	e1a03806 	lsl	r3, r6, #16
 3002ddc:	e1a00004 	mov	r0, r4
 3002de0:	e1a02805 	lsl	r2, r5, #16
 3002de4:	ebfffe5c 	bl	300275c <fn_0300275C>
 3002de8:	e05ae000 	subs	lr, sl, r0
 3002dec:	4a00035a 	bmi	3003b5c <fn_03002CDC+0xe80>
 3002df0:	e59b2008 	ldr	r2, [fp, #8]
 3002df4:	e04a3002 	sub	r3, sl, r2
 3002df8:	e59fce88 	ldr	ip, [pc, #3720]	@ 3003c88 <fn_03002CDC+0xfac>
 3002dfc:	e2831202 	add	r1, r3, #536870912	@ 0x20000000
 3002e00:	e2811702 	add	r1, r1, #524288	@ 0x80000
 3002e04:	e151000c 	cmp	r1, ip
 3002e08:	e58ba12c 	str	sl, [fp, #300]	@ 0x12c
 3002e0c:	9a000004 	bls	3002e24 <fn_03002CDC+0x148>
 3002e10:	e28334df 	add	r3, r3, #-553648128	@ 0xdf000000
 3002e14:	e283373e 	add	r3, r3, #16252928	@ 0xf80000
 3002e18:	e15e0003 	cmp	lr, r3
 3002e1c:	9a00034e 	bls	3003b5c <fn_03002CDC+0xe80>
 3002e20:	e59f3e64 	ldr	r3, [pc, #3684]	@ 3003c8c <fn_03002CDC+0xfb0>
 3002e24:	e0421000 	sub	r1, r2, r0
 3002e28:	e59f4e58 	ldr	r4, [pc, #3672]	@ 3003c88 <fn_03002CDC+0xfac>
 3002e2c:	e281c202 	add	ip, r1, #536870912	@ 0x20000000
 3002e30:	e28cc702 	add	ip, ip, #524288	@ 0x80000
 3002e34:	e15c0004 	cmp	ip, r4
 3002e38:	8a00040f 	bhi	3003e7c <fn_03002CDC+0x11a0>
 3002e3c:	e2622101 	rsb	r2, r2, #1073741824	@ 0x40000000
 3002e40:	e0822000 	add	r2, r2, r0
 3002e44:	e1a029a2 	lsr	r2, r2, #19
 3002e48:	e59f1e40 	ldr	r1, [pc, #3648]	@ 3003c90 <fn_03002CDC+0xfb4>
 3002e4c:	e2833101 	add	r3, r3, #1073741824	@ 0x40000000
 3002e50:	e1a039a3 	lsr	r3, r3, #19
 3002e54:	e7913103 	ldr	r3, [r1, r3, lsl #2]
 3002e58:	e7912102 	ldr	r2, [r1, r2, lsl #2]
 3002e5c:	e1530002 	cmp	r3, r2
 3002e60:	e58d3004 	str	r3, [sp, #4]
 3002e64:	e58d202c 	str	r2, [sp, #44]	@ 0x2c
 3002e68:	aa00033b 	bge	3003b5c <fn_03002CDC+0xe80>
 3002e6c:	e1d731b2 	ldrh	r3, [r7, #18]
 3002e70:	e59f2e1c 	ldr	r2, [pc, #3612]	@ 3003c94 <fn_03002CDC+0xfb8>
 3002e74:	e1530002 	cmp	r3, r2
 3002e78:	03a0e000 	moveq	lr, #0
 3002e7c:	e59f2e28 	ldr	r2, [pc, #3624]	@ 3003cac <fn_03002CDC+0xfd0>
 3002e80:	e5921000 	ldr	r1, [r2]
 3002e84:	1591edf0 	ldrne	lr, [r1, #3568]	@ 0xdf0
 3002e88:	10833103 	addne	r3, r3, r3, lsl #2
 3002e8c:	e1d7c0be 	ldrh	ip, [r7, #14]
 3002e90:	108ee183 	addne	lr, lr, r3, lsl #3
 3002e94:	e5913e04 	ldr	r3, [r1, #3588]	@ 0xe04
 3002e98:	e083310c 	add	r3, r3, ip, lsl #2
 3002e9c:	e1d320b2 	ldrh	r2, [r3, #2]
 3002ea0:	e59141dc 	ldr	r4, [r1, #476]	@ 0x1dc
 3002ea4:	e5910e00 	ldr	r0, [r1, #3584]	@ 0xe00
 3002ea8:	e1a02a82 	lsl	r2, r2, #21
 3002eac:	e080028c 	add	r0, r0, ip, lsl #5
 3002eb0:	e1a02aa2 	lsr	r2, r2, #21
 3002eb4:	e1a0ca84 	lsl	ip, r4, #21
 3002eb8:	e1520aac 	cmp	r2, ip, lsr #21
 3002ebc:	e58be0d4 	str	lr, [fp, #212]	@ 0xd4
 3002ec0:	e58b70cc 	str	r7, [fp, #204]	@ 0xcc
 3002ec4:	e58b0130 	str	r0, [fp, #304]	@ 0x130
 3002ec8:	0a00031d 	beq	3003b44 <fn_03002CDC+0xe68>
 3002ecc:	e591ce10 	ldr	ip, [r1, #3600]	@ 0xe10
 3002ed0:	e1d720bc 	ldrh	r2, [r7, #12]
 3002ed4:	e152000c 	cmp	r2, ip
 3002ed8:	3591ce14 	ldrcc	ip, [r1, #3604]	@ 0xe14
 3002edc:	2591ce0c 	ldrcs	ip, [r1, #3596]	@ 0xe0c
 3002ee0:	e0822082 	add	r2, r2, r2, lsl #1
 3002ee4:	e08cc102 	add	ip, ip, r2, lsl #2
 3002ee8:	e1d320b2 	ldrh	r2, [r3, #2]
 3002eec:	e1a025a2 	lsr	r2, r2, #11
 3002ef0:	e1822a84 	orr	r2, r2, r4, lsl #21
 3002ef4:	e1a02ae2 	ror	r2, r2, #21
 3002ef8:	e1c320b2 	strh	r2, [r3, #2]
 3002efc:	e1d021b8 	ldrh	r2, [r0, #24]
 3002f00:	e3120004 	tst	r2, #4
 3002f04:	1a000595 	bne	3004560 <fn_03002CDC+0x1884>
 3002f08:	e5d32003 	ldrb	r2, [r3, #3]
 3002f0c:	e3c22008 	bic	r2, r2, #8
 3002f10:	e3822010 	orr	r2, r2, #16
 3002f14:	e5c32003 	strb	r2, [r3, #3]
 3002f18:	e3a03002 	mov	r3, #2
 3002f1c:	e58d306c 	str	r3, [sp, #108]	@ 0x6c
 3002f20:	e58d7090 	str	r7, [sp, #144]	@ 0x90
 3002f24:	e58d8094 	str	r8, [sp, #148]	@ 0x94
 3002f28:	ea000009 	b	3002f54 <fn_03002CDC+0x278>
 3002f2c:	e3a01000 	mov	r1, #0
 3002f30:	ebfff7a1 	bl	3000dbc <fn_03000DBC>
 3002f34:	e3500000 	cmp	r0, #0
 3002f38:	0a00032b 	beq	3003bec <fn_03002CDC+0xf10>
 3002f3c:	e0403004 	sub	r3, r0, r4
 3002f40:	e1a02003 	mov	r2, r3
 3002f44:	e58d3004 	str	r3, [sp, #4]
 3002f48:	e59d302c 	ldr	r3, [sp, #44]	@ 0x2c
 3002f4c:	e1530002 	cmp	r3, r2
 3002f50:	da000325 	ble	3003bec <fn_03002CDC+0xf10>
 3002f54:	e59d2004 	ldr	r2, [sp, #4]
 3002f58:	e08b3002 	add	r3, fp, r2
 3002f5c:	e5d33134 	ldrb	r3, [r3, #308]	@ 0x134
 3002f60:	e59f4d6c 	ldr	r4, [pc, #3436]	@ 3003cd4 <fn_03002CDC+0xff8>
 3002f64:	e3530000 	cmp	r3, #0
 3002f68:	e59d302c 	ldr	r3, [sp, #44]	@ 0x2c
 3002f6c:	e0840002 	add	r0, r4, r2
 3002f70:	e58d0044 	str	r0, [sp, #68]	@ 0x44
 3002f74:	e0432002 	sub	r2, r3, r2
 3002f78:	1affffeb 	bne	3002f2c <fn_03002CDC+0x250>
 3002f7c:	e3a01001 	mov	r1, #1
 3002f80:	ebfff78d 	bl	3000dbc <fn_03000DBC>
 3002f84:	e3500000 	cmp	r0, #0
 3002f88:	0a0003c1 	beq	3003e94 <fn_03002CDC+0x11b8>
 3002f8c:	e59f3d40 	ldr	r3, [pc, #3392]	@ 3003cd4 <fn_03002CDC+0xff8>
 3002f90:	e0403003 	sub	r3, r0, r3
 3002f94:	e58d3034 	str	r3, [sp, #52]	@ 0x34
 3002f98:	e59f3d0c 	ldr	r3, [pc, #3340]	@ 3003cac <fn_03002CDC+0xfd0>
 3002f9c:	e5935000 	ldr	r5, [r3]
 3002fa0:	e59b41ac 	ldr	r4, [fp, #428]	@ 0x1ac
 3002fa4:	e2853dca 	add	r3, r5, #12928	@ 0x3280
 3002fa8:	e283302c 	add	r3, r3, #44	@ 0x2c
 3002fac:	e1540003 	cmp	r4, r3
 3002fb0:	0a000304 	beq	3003bc8 <fn_03002CDC+0xeec>
 3002fb4:	e59b60cc 	ldr	r6, [fp, #204]	@ 0xcc
 3002fb8:	e5957e04 	ldr	r7, [r5, #3588]	@ 0xe04
 3002fbc:	e1d600be 	ldrh	r0, [r6, #14]
 3002fc0:	e0877100 	add	r7, r7, r0, lsl #2
 3002fc4:	e5d72003 	ldrb	r2, [r7, #3]
 3002fc8:	e3822020 	orr	r2, r2, #32
 3002fcc:	e5c72003 	strb	r2, [r7, #3]
 3002fd0:	e59d2034 	ldr	r2, [sp, #52]	@ 0x34
 3002fd4:	e2422001 	sub	r2, r2, #1
 3002fd8:	e5951e10 	ldr	r1, [r5, #3600]	@ 0xe10
 3002fdc:	e58d2008 	str	r2, [sp, #8]
 3002fe0:	e1d620bc 	ldrh	r2, [r6, #12]
 3002fe4:	e1520001 	cmp	r2, r1
 3002fe8:	35951e14 	ldrcc	r1, [r5, #3604]	@ 0xe14
 3002fec:	25951e0c 	ldrcs	r1, [r5, #3596]	@ 0xe0c
 3002ff0:	e0822082 	add	r2, r2, r2, lsl #1
 3002ff4:	e0812102 	add	r2, r1, r2, lsl #2
 3002ff8:	e58d2010 	str	r2, [sp, #16]
 3002ffc:	e1d620ba 	ldrh	r2, [r6, #10]
 3003000:	e59b112c 	ldr	r1, [fp, #300]	@ 0x12c
 3003004:	e1a02802 	lsl	r2, r2, #16
 3003008:	e282c101 	add	ip, r2, #1073741824	@ 0x40000000
 300300c:	e04c1001 	sub	r1, ip, r1
 3003010:	e58bc1b0 	str	ip, [fp, #432]	@ 0x1b0
 3003014:	e595ce00 	ldr	ip, [r5, #3584]	@ 0xe00
 3003018:	e08c0280 	add	r0, ip, r0, lsl #5
 300301c:	e58d0038 	str	r0, [sp, #56]	@ 0x38
 3003020:	e58b0130 	str	r0, [fp, #304]	@ 0x130
 3003024:	e1a00001 	mov	r0, r1
 3003028:	ebfff759 	bl	3000d94 <fn_03000D94>
 300302c:	e3500101 	cmp	r0, #1073741824	@ 0x40000000
 3003030:	c3a01b02 	movgt	r1, #2048	@ 0x800
 3003034:	d1a019a1 	lsrle	r1, r1, #19
 3003038:	d2819b02 	addle	r9, r1, #2048	@ 0x800
 300303c:	d58d1048 	strle	r1, [sp, #72]	@ 0x48
 3003040:	c58d1048 	strgt	r1, [sp, #72]	@ 0x48
 3003044:	e59bc00c 	ldr	ip, [fp, #12]
 3003048:	e1d610f0 	ldrsh	r1, [r6]
 300304c:	c3a09901 	movgt	r9, #16384	@ 0x4000
 3003050:	d1a09109 	lslle	r9, r9, #2
 3003054:	e1a00801 	lsl	r0, r1, #16
 3003058:	e15c0801 	cmp	ip, r1, lsl #16
 300305c:	e1d610f2 	ldrsh	r1, [r6, #2]
 3003060:	e59ba010 	ldr	sl, [fp, #16]
 3003064:	e1a01801 	lsl	r1, r1, #16
 3003068:	0a000393 	beq	3003ebc <fn_03002CDC+0x11e0>
 300306c:	e040000c 	sub	r0, r0, ip
 3003070:	ebfff747 	bl	3000d94 <fn_03000D94>
 3003074:	e1a08000 	mov	r8, r0
 3003078:	e041000a 	sub	r0, r1, sl
 300307c:	ebfff744 	bl	3000d94 <fn_03000D94>
 3003080:	e1580000 	cmp	r8, r0
 3003084:	b1a0c000 	movlt	ip, r0
 3003088:	a1a0c008 	movge	ip, r8
 300308c:	b1a00008 	movlt	r0, r8
 3003090:	e59f8c20 	ldr	r8, [pc, #3104]	@ 3003cb8 <fn_03002CDC+0xfdc>
 3003094:	e59f1c0c 	ldr	r1, [pc, #3084]	@ 3003ca8 <fn_03002CDC+0xfcc>
 3003098:	e7d8e82c 	ldrb	lr, [r8, ip, lsr #16]
 300309c:	e59fac18 	ldr	sl, [pc, #3096]	@ 3003cbc <fn_03002CDC+0xfe0>
 30030a0:	e58d100c 	str	r1, [sp, #12]
 30030a4:	e1a01e3c 	lsr	r1, ip, lr
 30030a8:	e79a1101 	ldr	r1, [sl, r1, lsl #2]
 30030ac:	e1a01e51 	asr	r1, r1, lr
 30030b0:	e1a0e000 	mov	lr, r0
 30030b4:	e0c0119e 	smull	r1, r0, lr, r1
 30030b8:	e1a01821 	lsr	r1, r1, #16
 30030bc:	e1811800 	orr	r1, r1, r0, lsl #16
 30030c0:	e59f0bd0 	ldr	r0, [pc, #3024]	@ 3003c98 <fn_03002CDC+0xfbc>
 30030c4:	e1a012c1 	asr	r1, r1, #5
 30030c8:	e7901101 	ldr	r1, [r0, r1, lsl #2]
 30030cc:	e59f0bd4 	ldr	r0, [pc, #3028]	@ 3003ca8 <fn_03002CDC+0xfcc>
 30030d0:	e2811101 	add	r1, r1, #1073741824	@ 0x40000000
 30030d4:	e1a019a1 	lsr	r1, r1, #19
 30030d8:	e7900101 	ldr	r0, [r0, r1, lsl #2]
 30030dc:	e0201fc0 	eor	r1, r0, r0, asr #31
 30030e0:	e0411fc0 	sub	r1, r1, r0, asr #31
 30030e4:	e3500000 	cmp	r0, #0
 30030e8:	e7d80821 	ldrb	r0, [r8, r1, lsr #16]
 30030ec:	e1a01031 	lsr	r1, r1, r0
 30030f0:	e79a1101 	ldr	r1, [sl, r1, lsl #2]
 30030f4:	e1a01051 	asr	r1, r1, r0
 30030f8:	b2611000 	rsblt	r1, r1, #0
 30030fc:	e1a00001 	mov	r0, r1
 3003100:	e0c1cc90 	smull	ip, r1, r0, ip
 3003104:	e1a0c82c 	lsr	ip, ip, #16
 3003108:	e18c1801 	orr	r1, ip, r1, lsl #16
 300310c:	e58d1018 	str	r1, [sp, #24]
 3003110:	e1a01fc1 	asr	r1, r1, #31
 3003114:	e58d101c 	str	r1, [sp, #28]
 3003118:	e59d000c 	ldr	r0, [sp, #12]
 300311c:	e59dc008 	ldr	ip, [sp, #8]
 3003120:	e7901009 	ldr	r1, [r0, r9]
 3003124:	e1c4c0b6 	strh	ip, [r4, #6]
 3003128:	e59dc01c 	ldr	ip, [sp, #28]
 300312c:	e0000c91 	mul	r0, r1, ip
 3003130:	e59de018 	ldr	lr, [sp, #24]
 3003134:	e1a0cfc1 	asr	ip, r1, #31
 3003138:	e0200e9c 	mla	r0, ip, lr, r0
 300313c:	e08e8e91 	umull	r8, lr, r1, lr
 3003140:	e2855901 	add	r5, r5, #16384	@ 0x4000
 3003144:	e080000e 	add	r0, r0, lr
 3003148:	e1a08828 	lsr	r8, r8, #16
 300314c:	e59d9034 	ldr	r9, [sp, #52]	@ 0x34
 3003150:	e59511ac 	ldr	r1, [r5, #428]	@ 0x1ac
 3003154:	e1888800 	orr	r8, r8, r0, lsl #16
 3003158:	e59d0004 	ldr	r0, [sp, #4]
 300315c:	e0411003 	sub	r1, r1, r3
 3003160:	e0493000 	sub	r3, r9, r0
 3003164:	e1a03103 	lsl	r3, r3, #2
 3003168:	e08330c1 	add	r3, r3, r1, asr #1
 300316c:	e3530d1e 	cmp	r3, #1920	@ 0x780
 3003170:	e1a03800 	lsl	r3, r0, #16
 3003174:	e1a0a843 	asr	sl, r3, #16
 3003178:	e5846000 	str	r6, [r4]
 300317c:	e58b91b8 	str	r9, [fp, #440]	@ 0x1b8
 3003180:	e58b81b4 	str	r8, [fp, #436]	@ 0x1b4
 3003184:	e58da024 	str	sl, [sp, #36]	@ 0x24
 3003188:	e1c4a0b4 	strh	sl, [r4, #4]
 300318c:	ca00028d 	bgt	3003bc8 <fn_03002CDC+0xeec>
 3003190:	e59f3b04 	ldr	r3, [pc, #2820]	@ 3003c9c <fn_03002CDC+0xfc0>
 3003194:	e28010f8 	add	r1, r0, #248	@ 0xf8
 3003198:	e7933101 	ldr	r3, [r3, r1, lsl #2]
 300319c:	e59b1008 	ldr	r1, [fp, #8]
 30031a0:	e59d000c 	ldr	r0, [sp, #12]
 30031a4:	e041c002 	sub	ip, r1, r2
 30031a8:	e2832101 	add	r2, r3, #1073741824	@ 0x40000000
 30031ac:	e1a029c2 	asr	r2, r2, #19
 30031b0:	e7901102 	ldr	r1, [r0, r2, lsl #2]
 30031b4:	e083300c 	add	r3, r3, ip
 30031b8:	e1a039c3 	asr	r3, r3, #19
 30031bc:	e7900103 	ldr	r0, [r0, r3, lsl #2]
 30031c0:	e0c31198 	smull	r1, r3, r8, r1
 30031c4:	e1a01821 	lsr	r1, r1, #16
 30031c8:	e1a00380 	lsl	r0, r0, #7
 30031cc:	e1811803 	orr	r1, r1, r3, lsl #16
 30031d0:	e1510840 	cmp	r1, r0, asr #16
 30031d4:	e58dc04c 	str	ip, [sp, #76]	@ 0x4c
 30031d8:	da0004c3 	ble	30044ec <fn_03002CDC+0x1810>
 30031dc:	ebfff8db 	bl	3001550 <fn_03001550>
 30031e0:	e3500c01 	cmp	r0, #256	@ 0x100
 30031e4:	a1a09000 	movge	r9, r0
 30031e8:	b3a09c01 	movlt	r9, #256	@ 0x100
 30031ec:	e3590501 	cmp	r9, #4194304	@ 0x400000
 30031f0:	a3a09501 	movge	r9, #4194304	@ 0x400000
 30031f4:	e58d9040 	str	r9, [sp, #64]	@ 0x40
 30031f8:	e59d2008 	ldr	r2, [sp, #8]
 30031fc:	e59d3004 	ldr	r3, [sp, #4]
 3003200:	e1520003 	cmp	r2, r3
 3003204:	e58b91bc 	str	r9, [fp, #444]	@ 0x1bc
 3003208:	e5849008 	str	r9, [r4, #8]
 300320c:	da000341 	ble	3003f18 <fn_03002CDC+0x123c>
 3003210:	e59f3a84 	ldr	r3, [pc, #2692]	@ 3003c9c <fn_03002CDC+0xfc0>
 3003214:	e28220f8 	add	r2, r2, #248	@ 0xf8
 3003218:	e7933102 	ldr	r3, [r3, r2, lsl #2]
 300321c:	e59d100c 	ldr	r1, [sp, #12]
 3003220:	e2832101 	add	r2, r3, #1073741824	@ 0x40000000
 3003224:	e1a029c2 	asr	r2, r2, #19
 3003228:	e7912102 	ldr	r2, [r1, r2, lsl #2]
 300322c:	e59d004c 	ldr	r0, [sp, #76]	@ 0x4c
 3003230:	e0833000 	add	r3, r3, r0
 3003234:	e1a00002 	mov	r0, r2
 3003238:	e0c28890 	smull	r8, r2, r0, r8
 300323c:	e1a039c3 	asr	r3, r3, #19
 3003240:	e7910103 	ldr	r0, [r1, r3, lsl #2]
 3003244:	e1a01828 	lsr	r1, r8, #16
 3003248:	e1a00380 	lsl	r0, r0, #7
 300324c:	e1811802 	orr	r1, r1, r2, lsl #16
 3003250:	e1510840 	cmp	r1, r0, asr #16
 3003254:	d3a00501 	movle	r0, #4194304	@ 0x400000
 3003258:	da000004 	ble	3003270 <fn_03002CDC+0x594>
 300325c:	ebfff8bb 	bl	3001550 <fn_03001550>
 3003260:	e3500c01 	cmp	r0, #256	@ 0x100
 3003264:	b3a00c01 	movlt	r0, #256	@ 0x100
 3003268:	e3500501 	cmp	r0, #4194304	@ 0x400000
 300326c:	a3a00501 	movge	r0, #4194304	@ 0x400000
 3003270:	e99d000c 	ldmib	sp, {r2, r3}
 3003274:	e584000c 	str	r0, [r4, #12]
 3003278:	e0431002 	sub	r1, r3, r2
 300327c:	e0400009 	sub	r0, r0, r9
 3003280:	ebfff8a7 	bl	3001524 <fn_03001524>
 3003284:	e58d003c 	str	r0, [sp, #60]	@ 0x3c
 3003288:	e58b00e4 	str	r0, [fp, #228]	@ 0xe4
 300328c:	e5840010 	str	r0, [r4, #16]
 3003290:	e3a03000 	mov	r3, #0
 3003294:	e59b20d0 	ldr	r2, [fp, #208]	@ 0xd0
 3003298:	e59b80f4 	ldr	r8, [fp, #244]	@ 0xf4
 300329c:	e5921004 	ldr	r1, [r2, #4]
 30032a0:	e5929000 	ldr	r9, [r2]
 30032a4:	e58d2028 	str	r2, [sp, #40]	@ 0x28
 30032a8:	e0412008 	sub	r2, r1, r8
 30032ac:	e58d2014 	str	r2, [sp, #20]
 30032b0:	e58b21c0 	str	r2, [fp, #448]	@ 0x1c0
 30032b4:	e59d2010 	ldr	r2, [sp, #16]
 30032b8:	e59b00d4 	ldr	r0, [fp, #212]	@ 0xd4
 30032bc:	e1d220b8 	ldrh	r2, [r2, #8]
 30032c0:	e1500003 	cmp	r0, r3
 30032c4:	e58d2054 	str	r2, [sp, #84]	@ 0x54
 30032c8:	e0492008 	sub	r2, r9, r8
 30032cc:	e58d1030 	str	r1, [sp, #48]	@ 0x30
 30032d0:	e58d0020 	str	r0, [sp, #32]
 30032d4:	e58d2050 	str	r2, [sp, #80]	@ 0x50
 30032d8:	e5cb31c4 	strb	r3, [fp, #452]	@ 0x1c4
 30032dc:	e58b31c8 	str	r3, [fp, #456]	@ 0x1c8
 30032e0:	e58b31cc 	str	r3, [fp, #460]	@ 0x1cc
 30032e4:	e58b31d0 	str	r3, [fp, #464]	@ 0x1d0
 30032e8:	e5843028 	str	r3, [r4, #40]	@ 0x28
 30032ec:	0a000424 	beq	3004384 <fn_03002CDC+0x16a8>
 30032f0:	e5d72003 	ldrb	r2, [r7, #3]
 30032f4:	e1a021a2 	lsr	r2, r2, #3
 30032f8:	e2022003 	and	r2, r2, #3
 30032fc:	e3520001 	cmp	r2, #1
 3003300:	e59d2020 	ldr	r2, [sp, #32]
 3003304:	e5843024 	str	r3, [r4, #36]	@ 0x24
 3003308:	e5843020 	str	r3, [r4, #32]
 300330c:	e5927000 	ldr	r7, [r2]
 3003310:	e5921004 	ldr	r1, [r2, #4]
 3003314:	9a00043f 	bls	3004418 <fn_03002CDC+0x173c>
 3003318:	e3a03003 	mov	r3, #3
 300331c:	e5843014 	str	r3, [r4, #20]
 3003320:	e3e03102 	mvn	r3, #-2147483648	@ 0x80000000
 3003324:	e5843018 	str	r3, [r4, #24]
 3003328:	e3a03407 	mov	r3, #117440512	@ 0x7000000
 300332c:	e5843020 	str	r3, [r4, #32]
 3003330:	e3a03102 	mov	r3, #-2147483648	@ 0x80000000
 3003334:	e584301c 	str	r3, [r4, #28]
 3003338:	e59f3984 	ldr	r3, [pc, #2436]	@ 3003cc4 <fn_03002CDC+0xfe8>
 300333c:	e5843024 	str	r3, [r4, #36]	@ 0x24
 3003340:	e59d3028 	ldr	r3, [sp, #40]	@ 0x28
 3003344:	e5d30025 	ldrb	r0, [r3, #37]	@ 0x25
 3003348:	e59531b0 	ldr	r3, [r5, #432]	@ 0x1b0
 300334c:	e0472008 	sub	r2, r7, r8
 3003350:	e1500003 	cmp	r0, r3
 3003354:	e0413008 	sub	r3, r1, r8
 3003358:	e58b31dc 	str	r3, [fp, #476]	@ 0x1dc
 300335c:	e58d2058 	str	r2, [sp, #88]	@ 0x58
 3003360:	e58b21e0 	str	r2, [fp, #480]	@ 0x1e0
 3003364:	0a00043b 	beq	3004458 <fn_03002CDC+0x177c>
 3003368:	e1590007 	cmp	r9, r7
 300336c:	0a000451 	beq	30044b8 <fn_03002CDC+0x17dc>
 3003370:	e3a02001 	mov	r2, #1
 3003374:	e1590001 	cmp	r9, r1
 3003378:	e5cb21d5 	strb	r2, [fp, #469]	@ 0x1d5
 300337c:	b3a02000 	movlt	r2, #0
 3003380:	a3a02001 	movge	r2, #1
 3003384:	e59dc030 	ldr	ip, [sp, #48]	@ 0x30
 3003388:	e15c0007 	cmp	ip, r7
 300338c:	d3822001 	orrle	r2, r2, #1
 3003390:	e59dc014 	ldr	ip, [sp, #20]
 3003394:	e153000c 	cmp	r3, ip
 3003398:	0a000457 	beq	30044fc <fn_03002CDC+0x1820>
 300339c:	e3520000 	cmp	r2, #0
 30033a0:	e3a02001 	mov	r2, #1
 30033a4:	e5cb21d4 	strb	r2, [fp, #468]	@ 0x1d4
 30033a8:	0a000002 	beq	30033b8 <fn_03002CDC+0x6dc>
 30033ac:	e3a02001 	mov	r2, #1
 30033b0:	e5cb21d5 	strb	r2, [fp, #469]	@ 0x1d5
 30033b4:	e5cb21d4 	strb	r2, [fp, #468]	@ 0x1d4
 30033b8:	e59d2014 	ldr	r2, [sp, #20]
 30033bc:	e1530002 	cmp	r3, r2
 30033c0:	aa000016 	bge	3003420 <fn_03002CDC+0x744>
 30033c4:	e59d3010 	ldr	r3, [sp, #16]
 30033c8:	e59d2038 	ldr	r2, [sp, #56]	@ 0x38
 30033cc:	e1d330b4 	ldrh	r3, [r3, #4]
 30033d0:	e1d221b8 	ldrh	r2, [r2, #24]
 30033d4:	e59b00d8 	ldr	r0, [fp, #216]	@ 0xd8
 30033d8:	e3120008 	tst	r2, #8
 30033dc:	e1a02083 	lsl	r2, r3, #1
 30033e0:	e19020f2 	ldrsh	r2, [r0, r2]
 30033e4:	e59b00f8 	ldr	r0, [fp, #248]	@ 0xf8
 30033e8:	07903103 	ldreq	r3, [r0, r3, lsl #2]
 30033ec:	159d3014 	ldrne	r3, [sp, #20]
 30033f0:	00813003 	addeq	r3, r1, r3
 30033f4:	00433008 	subeq	r3, r3, r8
 30033f8:	e58d305c 	str	r3, [sp, #92]	@ 0x5c
 30033fc:	e59d3010 	ldr	r3, [sp, #16]
 3003400:	e7901102 	ldr	r1, [r0, r2, lsl #2]
 3003404:	e1d300f2 	ldrsh	r0, [r3, #2]
 3003408:	e1a00800 	lsl	r0, r0, #16
 300340c:	e58b21cc 	str	r2, [fp, #460]	@ 0x1cc
 3003410:	ebfff86d 	bl	30015cc <fn_030015CC>
 3003414:	e59d305c 	ldr	r3, [sp, #92]	@ 0x5c
 3003418:	e0800003 	add	r0, r0, r3
 300341c:	e58b01e4 	str	r0, [fp, #484]	@ 0x1e4
 3003420:	e1590007 	cmp	r9, r7
 3003424:	a3a07000 	movge	r7, #0
 3003428:	aa000014 	bge	3003480 <fn_03002CDC+0x7a4>
 300342c:	e59d3038 	ldr	r3, [sp, #56]	@ 0x38
 3003430:	e1d331b8 	ldrh	r3, [r3, #24]
 3003434:	e59d2014 	ldr	r2, [sp, #20]
 3003438:	e3130010 	tst	r3, #16
 300343c:	e59d3058 	ldr	r3, [sp, #88]	@ 0x58
 3003440:	11a03002 	movne	r3, r2
 3003444:	e59d0010 	ldr	r0, [sp, #16]
 3003448:	e58d3058 	str	r3, [sp, #88]	@ 0x58
 300344c:	e1d030b6 	ldrh	r3, [r0, #6]
 3003450:	e59b20d8 	ldr	r2, [fp, #216]	@ 0xd8
 3003454:	e1a03083 	lsl	r3, r3, #1
 3003458:	e19270f3 	ldrsh	r7, [r2, r3]
 300345c:	e1d000f2 	ldrsh	r0, [r0, #2]
 3003460:	e59b30f8 	ldr	r3, [fp, #248]	@ 0xf8
 3003464:	e1a00800 	lsl	r0, r0, #16
 3003468:	e7931107 	ldr	r1, [r3, r7, lsl #2]
 300346c:	e58b71c8 	str	r7, [fp, #456]	@ 0x1c8
 3003470:	ebfff855 	bl	30015cc <fn_030015CC>
 3003474:	e59d3058 	ldr	r3, [sp, #88]	@ 0x58
 3003478:	e0800003 	add	r0, r0, r3
 300347c:	e58b01e8 	str	r0, [fp, #488]	@ 0x1e8
 3003480:	e59d3054 	ldr	r3, [sp, #84]	@ 0x54
 3003484:	e3530000 	cmp	r3, #0
 3003488:	1a000394 	bne	30042e0 <fn_03002CDC+0x1604>
 300348c:	e59b31cc 	ldr	r3, [fp, #460]	@ 0x1cc
 3003490:	e1877003 	orr	r7, r7, r3
 3003494:	e3570000 	cmp	r7, #0
 3003498:	c3a03001 	movgt	r3, #1
 300349c:	d3a03000 	movle	r3, #0
 30034a0:	e5cb31ec 	strb	r3, [fp, #492]	@ 0x1ec
 30034a4:	da000017 	ble	3003508 <fn_03002CDC+0x82c>
 30034a8:	e59d2048 	ldr	r2, [sp, #72]	@ 0x48
 30034ac:	e59d300c 	ldr	r3, [sp, #12]
 30034b0:	e7933102 	ldr	r3, [r3, r2, lsl #2]
 30034b4:	e59d101c 	ldr	r1, [sp, #28]
 30034b8:	e2633000 	rsb	r3, r3, #0
 30034bc:	e0010193 	mul	r1, r3, r1
 30034c0:	e59d204c 	ldr	r2, [sp, #76]	@ 0x4c
 30034c4:	e58b21f4 	str	r2, [fp, #500]	@ 0x1f4
 30034c8:	e59d2010 	ldr	r2, [sp, #16]
 30034cc:	e1d600f8 	ldrsh	r0, [r6, #8]
 30034d0:	e1d220f0 	ldrsh	r2, [r2]
 30034d4:	e59dc018 	ldr	ip, [sp, #24]
 30034d8:	e0822000 	add	r2, r2, r0
 30034dc:	e1a00fc3 	asr	r0, r3, #31
 30034e0:	e0211c90 	mla	r1, r0, ip, r1
 30034e4:	e08c0c93 	umull	r0, ip, r3, ip
 30034e8:	e081100c 	add	r1, r1, ip
 30034ec:	e1a03820 	lsr	r3, r0, #16
 30034f0:	e1833801 	orr	r3, r3, r1, lsl #16
 30034f4:	e0833802 	add	r3, r3, r2, lsl #16
 30034f8:	e58b31f0 	str	r3, [fp, #496]	@ 0x1f0
 30034fc:	e59d3028 	ldr	r3, [sp, #40]	@ 0x28
 3003500:	e5d33026 	ldrb	r3, [r3, #38]	@ 0x26
 3003504:	e58b30dc 	str	r3, [fp, #220]	@ 0xdc
 3003508:	e1580009 	cmp	r8, r9
 300350c:	d3a04000 	movle	r4, #0
 3003510:	e59d3030 	ldr	r3, [sp, #48]	@ 0x30
 3003514:	c5db41d5 	ldrbgt	r4, [fp, #469]	@ 0x1d5
 3003518:	e1530008 	cmp	r3, r8
 300351c:	e5cb41d5 	strb	r4, [fp, #469]	@ 0x1d5
 3003520:	ca000209 	bgt	3003d4c <fn_03002CDC+0x1070>
 3003524:	e59d3028 	ldr	r3, [sp, #40]	@ 0x28
 3003528:	e5d32025 	ldrb	r2, [r3, #37]	@ 0x25
 300352c:	e59531b0 	ldr	r3, [r5, #432]	@ 0x1b0
 3003530:	e1520003 	cmp	r2, r3
 3003534:	0a000204 	beq	3003d4c <fn_03002CDC+0x1070>
 3003538:	e3a01000 	mov	r1, #0
 300353c:	e5cb11d4 	strb	r1, [fp, #468]	@ 0x1d4
 3003540:	e59d3020 	ldr	r3, [sp, #32]
 3003544:	e3530000 	cmp	r3, #0
 3003548:	e59d3014 	ldr	r3, [sp, #20]
 300354c:	e59d503c 	ldr	r5, [sp, #60]	@ 0x3c
 3003550:	e1a0c243 	asr	ip, r3, #4
 3003554:	e59d3050 	ldr	r3, [sp, #80]	@ 0x50
 3003558:	e1a00243 	asr	r0, r3, #4
 300355c:	e0c2359c 	smull	r3, r2, ip, r5
 3003560:	e1a03823 	lsr	r3, r3, #16
 3003564:	e59de040 	ldr	lr, [sp, #64]	@ 0x40
 3003568:	e1833802 	orr	r3, r3, r2, lsl #16
 300356c:	e2633000 	rsb	r3, r3, #0
 3003570:	e58b31f8 	str	r3, [fp, #504]	@ 0x1f8
 3003574:	e0c23e9c 	smull	r3, r2, ip, lr
 3003578:	e1a03823 	lsr	r3, r3, #16
 300357c:	e1833802 	orr	r3, r3, r2, lsl #16
 3003580:	e2633701 	rsb	r3, r3, #262144	@ 0x40000
 3003584:	e58b31fc 	str	r3, [fp, #508]	@ 0x1fc
 3003588:	e0c23590 	smull	r3, r2, r0, r5
 300358c:	e1a03823 	lsr	r3, r3, #16
 3003590:	e1833802 	orr	r3, r3, r2, lsl #16
 3003594:	e2633000 	rsb	r3, r3, #0
 3003598:	e58b3200 	str	r3, [fp, #512]	@ 0x200
 300359c:	e0c23e90 	smull	r3, r2, r0, lr
 30035a0:	e1a03823 	lsr	r3, r3, #16
 30035a4:	e1833802 	orr	r3, r3, r2, lsl #16
 30035a8:	e2633701 	rsb	r3, r3, #262144	@ 0x40000
 30035ac:	e58bc1c0 	str	ip, [fp, #448]	@ 0x1c0
 30035b0:	e58b3204 	str	r3, [fp, #516]	@ 0x204
 30035b4:	0a00001f 	beq	3003638 <fn_03002CDC+0x95c>
 30035b8:	e59b21dc 	ldr	r2, [fp, #476]	@ 0x1dc
 30035bc:	e59b31e0 	ldr	r3, [fp, #480]	@ 0x1e0
 30035c0:	e1a02242 	asr	r2, r2, #4
 30035c4:	e1a03243 	asr	r3, r3, #4
 30035c8:	e15c0002 	cmp	ip, r2
 30035cc:	e58b21dc 	str	r2, [fp, #476]	@ 0x1dc
 30035d0:	e58b31e0 	str	r3, [fp, #480]	@ 0x1e0
 30035d4:	da000009 	ble	3003600 <fn_03002CDC+0x924>
 30035d8:	e0cece92 	smull	ip, lr, r2, lr
 30035dc:	e1a0c82c 	lsr	ip, ip, #16
 30035e0:	e18cc80e 	orr	ip, ip, lr, lsl #16
 30035e4:	e26cc701 	rsb	ip, ip, #262144	@ 0x40000
 30035e8:	e58bc208 	str	ip, [fp, #520]	@ 0x208
 30035ec:	e0cc5592 	smull	r5, ip, r2, r5
 30035f0:	e1a02825 	lsr	r2, r5, #16
 30035f4:	e182280c 	orr	r2, r2, ip, lsl #16
 30035f8:	e2622000 	rsb	r2, r2, #0
 30035fc:	e58b220c 	str	r2, [fp, #524]	@ 0x20c
 3003600:	e1500003 	cmp	r0, r3
 3003604:	aa00000b 	bge	3003638 <fn_03002CDC+0x95c>
 3003608:	e59d2040 	ldr	r2, [sp, #64]	@ 0x40
 300360c:	e59de03c 	ldr	lr, [sp, #60]	@ 0x3c
 3003610:	e0c02293 	smull	r2, r0, r3, r2
 3003614:	e0ccee93 	smull	lr, ip, r3, lr
 3003618:	e1a02822 	lsr	r2, r2, #16
 300361c:	e1a0382e 	lsr	r3, lr, #16
 3003620:	e1822800 	orr	r2, r2, r0, lsl #16
 3003624:	e183380c 	orr	r3, r3, ip, lsl #16
 3003628:	e2622701 	rsb	r2, r2, #262144	@ 0x40000
 300362c:	e2633000 	rsb	r3, r3, #0
 3003630:	e58b2210 	str	r2, [fp, #528]	@ 0x210
 3003634:	e58b3214 	str	r3, [fp, #532]	@ 0x214
 3003638:	e3510000 	cmp	r1, #0
 300363c:	1a000240 	bne	3003f44 <fn_03002CDC+0x1268>
 3003640:	e59b3124 	ldr	r3, [fp, #292]	@ 0x124
 3003644:	e3540000 	cmp	r4, #0
 3003648:	e58d304c 	str	r3, [sp, #76]	@ 0x4c
 300364c:	0a000284 	beq	3004064 <fn_03002CDC+0x1388>
 3003650:	e3530000 	cmp	r3, #0
 3003654:	0a0003ef 	beq	3004618 <fn_03002CDC+0x193c>
 3003658:	e59d2008 	ldr	r2, [sp, #8]
 300365c:	e59d004c 	ldr	r0, [sp, #76]	@ 0x4c
 3003660:	e59d1024 	ldr	r1, [sp, #36]	@ 0x24
 3003664:	ebfffa0b 	bl	3001e98 <fn_03001E98>
 3003668:	e59b31b8 	ldr	r3, [fp, #440]	@ 0x1b8
 300366c:	e58d3010 	str	r3, [sp, #16]
 3003670:	e59b3128 	ldr	r3, [fp, #296]	@ 0x128
 3003674:	e5db61d5 	ldrb	r6, [fp, #469]	@ 0x1d5
 3003678:	e58d004c 	str	r0, [sp, #76]	@ 0x4c
 300367c:	e5db41d4 	ldrb	r4, [fp, #468]	@ 0x1d4
 3003680:	e58d3058 	str	r3, [sp, #88]	@ 0x58
 3003684:	e58b0124 	str	r0, [fp, #292]	@ 0x124
 3003688:	e1a09086 	lsl	r9, r6, #1
 300368c:	e3a03000 	mov	r3, #0
 3003690:	e5db21ec 	ldrb	r2, [fp, #492]	@ 0x1ec
 3003694:	e1520003 	cmp	r2, r3
 3003698:	e59b20c8 	ldr	r2, [fp, #200]	@ 0xc8
 300369c:	e58b3218 	str	r3, [fp, #536]	@ 0x218
 30036a0:	e58d20b0 	str	r2, [sp, #176]	@ 0xb0
 30036a4:	e58d30ac 	str	r3, [sp, #172]	@ 0xac
 30036a8:	0a000004 	beq	30036c0 <fn_03002CDC+0x9e4>
 30036ac:	e59b30fc 	ldr	r3, [fp, #252]	@ 0xfc
 30036b0:	e3530000 	cmp	r3, #0
 30036b4:	0a0003e1 	beq	3004640 <fn_03002CDC+0x1964>
 30036b8:	e59f35e0 	ldr	r3, [pc, #1504]	@ 3003ca0 <fn_03002CDC+0xfc4>
 30036bc:	e58d30b0 	str	r3, [sp, #176]	@ 0xb0
 30036c0:	e3a03000 	mov	r3, #0
 30036c4:	e58d3048 	str	r3, [sp, #72]	@ 0x48
 30036c8:	e59b31f4 	ldr	r3, [fp, #500]	@ 0x1f4
 30036cc:	e58d3038 	str	r3, [sp, #56]	@ 0x38
 30036d0:	e59b31f0 	ldr	r3, [fp, #496]	@ 0x1f0
 30036d4:	e58d303c 	str	r3, [sp, #60]	@ 0x3c
 30036d8:	e59b31b4 	ldr	r3, [fp, #436]	@ 0x1b4
 30036dc:	e58d3040 	str	r3, [sp, #64]	@ 0x40
 30036e0:	e59b31bc 	ldr	r3, [fp, #444]	@ 0x1bc
 30036e4:	e58d300c 	str	r3, [sp, #12]
 30036e8:	e59b30e4 	ldr	r3, [fp, #228]	@ 0xe4
 30036ec:	e58d3018 	str	r3, [sp, #24]
 30036f0:	e59b31f8 	ldr	r3, [fp, #504]	@ 0x1f8
 30036f4:	e58d301c 	str	r3, [sp, #28]
 30036f8:	e59b3204 	ldr	r3, [fp, #516]	@ 0x204
 30036fc:	e58d3008 	str	r3, [sp, #8]
 3003700:	e59b3200 	ldr	r3, [fp, #512]	@ 0x200
 3003704:	e58d3020 	str	r3, [sp, #32]
 3003708:	e59b3208 	ldr	r3, [fp, #520]	@ 0x208
 300370c:	e58d3060 	str	r3, [sp, #96]	@ 0x60
 3003710:	e59b320c 	ldr	r3, [fp, #524]	@ 0x20c
 3003714:	e58d3074 	str	r3, [sp, #116]	@ 0x74
 3003718:	e59b3210 	ldr	r3, [fp, #528]	@ 0x210
 300371c:	e58d3064 	str	r3, [sp, #100]	@ 0x64
 3003720:	e59b3214 	ldr	r3, [fp, #532]	@ 0x214
 3003724:	e59b51d0 	ldr	r5, [fp, #464]	@ 0x1d0
 3003728:	e58d307c 	str	r3, [sp, #124]	@ 0x7c
 300372c:	e59b31e8 	ldr	r3, [fp, #488]	@ 0x1e8
 3003730:	e28b7f72 	add	r7, fp, #456	@ 0x1c8
 3003734:	e3550000 	cmp	r5, #0
 3003738:	e1a00005 	mov	r0, r5
 300373c:	e59b11fc 	ldr	r1, [fp, #508]	@ 0x1fc
 3003740:	e8970180 	ldm	r7, {r7, r8}
 3003744:	e58d3080 	str	r3, [sp, #128]	@ 0x80
 3003748:	0a0001f6 	beq	3003f28 <fn_03002CDC+0x124c>
 300374c:	e59b31d8 	ldr	r3, [fp, #472]	@ 0x1d8
 3003750:	e58d3054 	str	r3, [sp, #84]	@ 0x54
 3003754:	e58d1014 	str	r1, [sp, #20]
 3003758:	ebfff78c 	bl	3001590 <fn_03001590>
 300375c:	e59d1014 	ldr	r1, [sp, #20]
 3003760:	e58d005c 	str	r0, [sp, #92]	@ 0x5c
 3003764:	e3570000 	cmp	r7, #0
 3003768:	058d7084 	streq	r7, [sp, #132]	@ 0x84
 300376c:	1a0002eb 	bne	3004320 <fn_03002CDC+0x1644>
 3003770:	e5db31c4 	ldrb	r3, [fp, #452]	@ 0x1c4
 3003774:	e3530000 	cmp	r3, #0
 3003778:	01a0e003 	moveq	lr, r3
 300377c:	e58d3068 	str	r3, [sp, #104]	@ 0x68
 3003780:	01a0300e 	moveq	r3, lr
 3003784:	0a000003 	beq	3003798 <fn_03002CDC+0xabc>
 3003788:	e59be0e0 	ldr	lr, [fp, #224]	@ 0xe0
 300378c:	e25e3000 	subs	r3, lr, #0
 3003790:	13a03001 	movne	r3, #1
 3003794:	e1a03283 	lsl	r3, r3, #5
 3003798:	e3540000 	cmp	r4, #0
 300379c:	13a02001 	movne	r2, #1
 30037a0:	159d0058 	ldrne	r0, [sp, #88]	@ 0x58
 30037a4:	15c02010 	strbne	r2, [r0, #16]
 30037a8:	e3560000 	cmp	r6, #0
 30037ac:	13a02001 	movne	r2, #1
 30037b0:	159d004c 	ldrne	r0, [sp, #76]	@ 0x4c
 30037b4:	15c02010 	strbne	r2, [r0, #16]
 30037b8:	e59d2024 	ldr	r2, [sp, #36]	@ 0x24
 30037bc:	e59d0010 	ldr	r0, [sp, #16]
 30037c0:	e1520000 	cmp	r2, r0
 30037c4:	aa000143 	bge	3003cd8 <fn_03002CDC+0xffc>
 30037c8:	e2555000 	subs	r5, r5, #0
 30037cc:	13a05001 	movne	r5, #1
 30037d0:	e2588000 	subs	r8, r8, #0
 30037d4:	13a08001 	movne	r8, #1
 30037d8:	e2577000 	subs	r7, r7, #0
 30037dc:	13a07001 	movne	r7, #1
 30037e0:	e1a05105 	lsl	r5, r5, #2
 30037e4:	e1855188 	orr	r5, r5, r8, lsl #3
 30037e8:	e1855207 	orr	r5, r5, r7, lsl #4
 30037ec:	e1855009 	orr	r5, r5, r9
 30037f0:	e1855004 	orr	r5, r5, r4
 30037f4:	e2052001 	and	r2, r5, #1
 30037f8:	e1853003 	orr	r3, r5, r3
 30037fc:	e58d2014 	str	r2, [sp, #20]
 3003800:	e2052002 	and	r2, r5, #2
 3003804:	e58d2024 	str	r2, [sp, #36]	@ 0x24
 3003808:	e2816eff 	add	r6, r1, #4080	@ 0xff0
 300380c:	e2032020 	and	r2, r3, #32
 3003810:	e3130004 	tst	r3, #4
 3003814:	e58d2028 	str	r2, [sp, #40]	@ 0x28
 3003818:	e286600f 	add	r6, r6, #15
 300381c:	1a000217 	bne	3004080 <fn_03002CDC+0x13a4>
 3003820:	e2032008 	and	r2, r3, #8
 3003824:	e58d2050 	str	r2, [sp, #80]	@ 0x50
 3003828:	e2032010 	and	r2, r3, #16
 300382c:	e2033003 	and	r3, r3, #3
 3003830:	e58d2070 	str	r2, [sp, #112]	@ 0x70
 3003834:	e58d308c 	str	r3, [sp, #140]	@ 0x8c
 3003838:	e58de088 	str	lr, [sp, #136]	@ 0x88
 300383c:	ea000067 	b	30039e0 <fn_03002CDC+0xd04>
 3003840:	e59d1050 	ldr	r1, [sp, #80]	@ 0x50
 3003844:	e3510000 	cmp	r1, #0
 3003848:	e2431001 	sub	r1, r3, #1
 300384c:	1a0000f8 	bne	3003c34 <fn_03002CDC+0xf58>
 3003850:	e59d2014 	ldr	r2, [sp, #20]
 3003854:	e3520000 	cmp	r2, #0
 3003858:	e59d2070 	ldr	r2, [sp, #112]	@ 0x70
 300385c:	1a00019e 	bne	3003edc <fn_03002CDC+0x1200>
 3003860:	e3520000 	cmp	r2, #0
 3003864:	0a00009c 	beq	3003adc <fn_03002CDC+0xe00>
 3003868:	e3a00000 	mov	r0, #0
 300386c:	e284c001 	add	ip, r4, #1
 3003870:	e59de064 	ldr	lr, [sp, #100]	@ 0x64
 3003874:	e28e2eff 	add	r2, lr, #4080	@ 0xff0
 3003878:	e282200f 	add	r2, r2, #15
 300387c:	e1a02642 	asr	r2, r2, #12
 3003880:	e152000c 	cmp	r2, ip
 3003884:	b1a0200c 	movlt	r2, ip
 3003888:	e59dc07c 	ldr	ip, [sp, #124]	@ 0x7c
 300388c:	e08ec00c 	add	ip, lr, ip
 3003890:	e58dc064 	str	ip, [sp, #100]	@ 0x64
 3003894:	e59dc030 	ldr	ip, [sp, #48]	@ 0x30
 3003898:	e152000c 	cmp	r2, ip
 300389c:	a1a0200c 	movge	r2, ip
 30038a0:	e1520008 	cmp	r2, r8
 30038a4:	d3800001 	orrle	r0, r0, #1
 30038a8:	e58d2030 	str	r2, [sp, #48]	@ 0x30
 30038ac:	e59dc08c 	ldr	ip, [sp, #140]	@ 0x8c
 30038b0:	e35c0000 	cmp	ip, #0
 30038b4:	1a00015a 	bne	3003e24 <fn_03002CDC+0x1148>
 30038b8:	e1a05802 	lsl	r5, r2, #16
 30038bc:	e1a05845 	asr	r5, r5, #16
 30038c0:	e3500000 	cmp	r0, #0
 30038c4:	0a000084 	beq	3003adc <fn_03002CDC+0xe00>
 30038c8:	e59d2028 	ldr	r2, [sp, #40]	@ 0x28
 30038cc:	e3520000 	cmp	r2, #0
 30038d0:	e59f23d8 	ldr	r2, [pc, #984]	@ 3003cb0 <fn_03002CDC+0xfd4>
 30038d4:	e59d0038 	ldr	r0, [sp, #56]	@ 0x38
 30038d8:	e792210a 	ldr	r2, [r2, sl, lsl #2]
 30038dc:	e0802002 	add	r2, r0, r2
 30038e0:	e59f03cc 	ldr	r0, [pc, #972]	@ 3003cb4 <fn_03002CDC+0xfd8>
 30038e4:	e1a029a2 	lsr	r2, r2, #19
 30038e8:	e7902102 	ldr	r2, [r0, r2, lsl #2]
 30038ec:	e59dc040 	ldr	ip, [sp, #64]	@ 0x40
 30038f0:	e0c0cc92 	smull	ip, r0, r2, ip
 30038f4:	e1a0282c 	lsr	r2, ip, #16
 30038f8:	e1822800 	orr	r2, r2, r0, lsl #16
 30038fc:	e59d003c 	ldr	r0, [sp, #60]	@ 0x3c
 3003900:	e0402002 	sub	r2, r0, r2
 3003904:	e1a02842 	asr	r2, r2, #16
 3003908:	1a00017d 	bne	3003f04 <fn_03002CDC+0x1228>
 300390c:	e59dc00c 	ldr	ip, [sp, #12]
 3003910:	e02c0fcc 	eor	r0, ip, ip, asr #31
 3003914:	e0400fcc 	sub	r0, r0, ip, asr #31
 3003918:	e35c0000 	cmp	ip, #0
 300391c:	e59fc394 	ldr	ip, [pc, #916]	@ 3003cb8 <fn_03002CDC+0xfdc>
 3003920:	e7dcc820 	ldrb	ip, [ip, r0, lsr #16]
 3003924:	e59fe390 	ldr	lr, [pc, #912]	@ 3003cbc <fn_03002CDC+0xfe0>
 3003928:	e1a00c30 	lsr	r0, r0, ip
 300392c:	e79e0100 	ldr	r0, [lr, r0, lsl #2]
 3003930:	e1a00c50 	asr	r0, r0, ip
 3003934:	b2600000 	rsblt	r0, r0, #0
 3003938:	e58d00a4 	str	r0, [sp, #164]	@ 0xa4
 300393c:	e59d0048 	ldr	r0, [sp, #72]	@ 0x48
 3003940:	e3500000 	cmp	r0, #0
 3003944:	e58da098 	str	sl, [sp, #152]	@ 0x98
 3003948:	0a000008 	beq	3003970 <fn_03002CDC+0xc94>
 300394c:	e1a0c000 	mov	ip, r0
 3003950:	e59d000c 	ldr	r0, [sp, #12]
 3003954:	e1a00520 	lsr	r0, r0, #10
 3003958:	e350009f 	cmp	r0, #159	@ 0x9f
 300395c:	23a0009f 	movcs	r0, #159	@ 0x9f
 3003960:	e7dc0000 	ldrb	r0, [ip, r0]
 3003964:	e59fc354 	ldr	ip, [pc, #852]	@ 3003cc0 <fn_03002CDC+0xfe4>
 3003968:	e08c0400 	add	r0, ip, r0, lsl #8
 300396c:	e58d00b0 	str	r0, [sp, #176]	@ 0xb0
 3003970:	e1510003 	cmp	r1, r3
 3003974:	aa00009f 	bge	3003bf8 <fn_03002CDC+0xf1c>
 3003978:	e59d3030 	ldr	r3, [sp, #48]	@ 0x30
 300397c:	e59d0084 	ldr	r0, [sp, #132]	@ 0x84
 3003980:	e58d309c 	str	r3, [sp, #156]	@ 0x9c
 3003984:	e59d3080 	ldr	r3, [sp, #128]	@ 0x80
 3003988:	e590100c 	ldr	r1, [r0, #12]
 300398c:	e58d30a8 	str	r3, [sp, #168]	@ 0xa8
 3003990:	e1d000b4 	ldrh	r0, [r0, #4]
 3003994:	e28d3098 	add	r3, sp, #152	@ 0x98
 3003998:	e58d80a0 	str	r8, [sp, #160]	@ 0xa0
 300399c:	ebfff831 	bl	3001a68 <fn_03001A68>
 30039a0:	e59d3010 	ldr	r3, [sp, #16]
 30039a4:	e28aa001 	add	sl, sl, #1
 30039a8:	e59d2018 	ldr	r2, [sp, #24]
 30039ac:	e15a0003 	cmp	sl, r3
 30039b0:	e59d300c 	ldr	r3, [sp, #12]
 30039b4:	e0833002 	add	r3, r3, r2
 30039b8:	e58d300c 	str	r3, [sp, #12]
 30039bc:	e59d2020 	ldr	r2, [sp, #32]
 30039c0:	e59d3008 	ldr	r3, [sp, #8]
 30039c4:	e0833002 	add	r3, r3, r2
 30039c8:	e58d3008 	str	r3, [sp, #8]
 30039cc:	e59d301c 	ldr	r3, [sp, #28]
 30039d0:	e1c750b0 	strh	r5, [r7]
 30039d4:	e0866003 	add	r6, r6, r3
 30039d8:	e1c940b0 	strh	r4, [r9]
 30039dc:	0a0000bd 	beq	3003cd8 <fn_03002CDC+0xffc>
 30039e0:	e1a0708a 	lsl	r7, sl, #1
 30039e4:	e2877407 	add	r7, r7, #117440512	@ 0x7000000
 30039e8:	e2879e2d 	add	r9, r7, #720	@ 0x2d0
 30039ec:	e1d940f0 	ldrsh	r4, [r9]
 30039f0:	e59d3008 	ldr	r3, [sp, #8]
 30039f4:	e59d1014 	ldr	r1, [sp, #20]
 30039f8:	e2877e1e 	add	r7, r7, #480	@ 0x1e0
 30039fc:	e1540646 	cmp	r4, r6, asr #12
 3003a00:	e1d750f0 	ldrsh	r5, [r7]
 3003a04:	e1a08643 	asr	r8, r3, #12
 3003a08:	e1a03646 	asr	r3, r6, #12
 3003a0c:	a2843001 	addge	r3, r4, #1
 3003a10:	e3510000 	cmp	r1, #0
 3003a14:	e1a02005 	mov	r2, r5
 3003a18:	0a00000b 	beq	3003a4c <fn_03002CDC+0xd70>
 3003a1c:	e1530005 	cmp	r3, r5
 3003a20:	e2841001 	add	r1, r4, #1
 3003a24:	b1a04003 	movlt	r4, r3
 3003a28:	a1a04005 	movge	r4, r5
 3003a2c:	e2444001 	sub	r4, r4, #1
 3003a30:	e1510004 	cmp	r1, r4
 3003a34:	ca000004 	bgt	3003a4c <fn_03002CDC+0xd70>
 3003a38:	e59dc058 	ldr	ip, [sp, #88]	@ 0x58
 3003a3c:	e1811404 	orr	r1, r1, r4, lsl #8
 3003a40:	e1a0000a 	mov	r0, sl
 3003a44:	e08c0080 	add	r0, ip, r0, lsl #1
 3003a48:	e1c011b4 	strh	r1, [r0, #20]
 3003a4c:	e1550008 	cmp	r5, r8
 3003a50:	c2881001 	addgt	r1, r8, #1
 3003a54:	c58d1030 	strgt	r1, [sp, #48]	@ 0x30
 3003a58:	e59d1024 	ldr	r1, [sp, #36]	@ 0x24
 3003a5c:	d58d5030 	strle	r5, [sp, #48]	@ 0x30
 3003a60:	d2458001 	suble	r8, r5, #1
 3003a64:	e3510000 	cmp	r1, #0
 3003a68:	0affff74 	beq	3003840 <fn_03002CDC+0xb64>
 3003a6c:	e1580004 	cmp	r8, r4
 3003a70:	a1a00008 	movge	r0, r8
 3003a74:	b1a00004 	movlt	r0, r4
 3003a78:	e2802001 	add	r2, r0, #1
 3003a7c:	e1520005 	cmp	r2, r5
 3003a80:	aa000005 	bge	3003a9c <fn_03002CDC+0xdc0>
 3003a84:	e59dc04c 	ldr	ip, [sp, #76]	@ 0x4c
 3003a88:	e2455001 	sub	r5, r5, #1
 3003a8c:	e1822405 	orr	r2, r2, r5, lsl #8
 3003a90:	e1a0100a 	mov	r1, sl
 3003a94:	e08c1081 	add	r1, ip, r1, lsl #1
 3003a98:	e1c121b4 	strh	r2, [r1, #20]
 3003a9c:	e59d2050 	ldr	r2, [sp, #80]	@ 0x50
 3003aa0:	e3520000 	cmp	r2, #0
 3003aa4:	e2431001 	sub	r1, r3, #1
 3003aa8:	1a00035f 	bne	300482c <fn_03002CDC+0x1b50>
 3003aac:	e59d2014 	ldr	r2, [sp, #20]
 3003ab0:	e3520000 	cmp	r2, #0
 3003ab4:	e59d2070 	ldr	r2, [sp, #112]	@ 0x70
 3003ab8:	0a00036d 	beq	3004874 <fn_03002CDC+0x1b98>
 3003abc:	e3520000 	cmp	r2, #0
 3003ac0:	1a0000c6 	bne	3003de0 <fn_03002CDC+0x1104>
 3003ac4:	e59d2030 	ldr	r2, [sp, #48]	@ 0x30
 3003ac8:	e1a05802 	lsl	r5, r2, #16
 3003acc:	e1520003 	cmp	r2, r3
 3003ad0:	e1a04001 	mov	r4, r1
 3003ad4:	e1a05845 	asr	r5, r5, #16
 3003ad8:	da000104 	ble	3003ef0 <fn_03002CDC+0x1214>
 3003adc:	e59d3028 	ldr	r3, [sp, #40]	@ 0x28
 3003ae0:	e3530000 	cmp	r3, #0
 3003ae4:	0affffad 	beq	30039a0 <fn_03002CDC+0xcc4>
 3003ae8:	e59f31c0 	ldr	r3, [pc, #448]	@ 3003cb0 <fn_03002CDC+0xfd4>
 3003aec:	e59d2038 	ldr	r2, [sp, #56]	@ 0x38
 3003af0:	e793310a 	ldr	r3, [r3, sl, lsl #2]
 3003af4:	e0823003 	add	r3, r2, r3
 3003af8:	e59f21b4 	ldr	r2, [pc, #436]	@ 3003cb4 <fn_03002CDC+0xfd8>
 3003afc:	e1a039a3 	lsr	r3, r3, #19
 3003b00:	e7923103 	ldr	r3, [r2, r3, lsl #2]
 3003b04:	e59d0040 	ldr	r0, [sp, #64]	@ 0x40
 3003b08:	e0c10093 	smull	r0, r1, r3, r0
 3003b0c:	e1a03820 	lsr	r3, r0, #16
 3003b10:	e1833801 	orr	r3, r3, r1, lsl #16
 3003b14:	e59d103c 	ldr	r1, [sp, #60]	@ 0x3c
 3003b18:	e0413003 	sub	r3, r1, r3
 3003b1c:	e59d1088 	ldr	r1, [sp, #136]	@ 0x88
 3003b20:	e1a0200a 	mov	r2, sl
 3003b24:	e1a03843 	asr	r3, r3, #16
 3003b28:	e1a02082 	lsl	r2, r2, #1
 3003b2c:	e18130b2 	strh	r3, [r1, r2]
 3003b30:	eaffff9a 	b	30039a0 <fn_03002CDC+0xcc4>
 3003b34:	e5d32026 	ldrb	r2, [r3, #38]	@ 0x26
 3003b38:	ebfff92e 	bl	3001ff8 <fn_03001FF8>
 3003b3c:	e59b30d0 	ldr	r3, [fp, #208]	@ 0xd0
 3003b40:	eafffc88 	b	3002d68 <fn_03002CDC+0x8c>
 3003b44:	e5d33003 	ldrb	r3, [r3, #3]
 3003b48:	e1a031a3 	lsr	r3, r3, #3
 3003b4c:	e3130001 	tst	r3, #1
 3003b50:	e2033003 	and	r3, r3, #3
 3003b54:	e58d306c 	str	r3, [sp, #108]	@ 0x6c
 3003b58:	0afffcf0 	beq	3002f20 <fn_03002CDC+0x244>
 3003b5c:	e3a03000 	mov	r3, #0
 3003b60:	e2588001 	subs	r8, r8, #1
 3003b64:	e58b30cc 	str	r3, [fp, #204]	@ 0xcc
 3003b68:	e2877014 	add	r7, r7, #20
 3003b6c:	1afffc83 	bne	3002d80 <fn_03002CDC+0xa4>
 3003b70:	e28dd0bc 	add	sp, sp, #188	@ 0xbc
 3003b74:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 3003b78:	e12fff1e 	bx	lr
 3003b7c:	e5942020 	ldr	r2, [r4, #32]
 3003b80:	e3520000 	cmp	r2, #0
 3003b84:	02036001 	andeq	r6, r3, #1
 3003b88:	0a0002c4 	beq	30046a0 <fn_03002CDC+0x19c4>
 3003b8c:	e5943024 	ldr	r3, [r4, #36]	@ 0x24
 3003b90:	e3530000 	cmp	r3, #0
 3003b94:	0a000078 	beq	3003d7c <fn_03002CDC+0x10a0>
 3003b98:	e3a02102 	mov	r2, #-2147483648	@ 0x80000000
 3003b9c:	e3853002 	orr	r3, r5, #2
 3003ba0:	e5843014 	str	r3, [r4, #20]
 3003ba4:	e584201c 	str	r2, [r4, #28]
 3003ba8:	e3130001 	tst	r3, #1
 3003bac:	1a000003 	bne	3003bc0 <fn_03002CDC+0xee4>
 3003bb0:	e3833001 	orr	r3, r3, #1
 3003bb4:	e5843014 	str	r3, [r4, #20]
 3003bb8:	e3e03102 	mvn	r3, #-2147483648	@ 0x80000000
 3003bbc:	e5843018 	str	r3, [r4, #24]
 3003bc0:	e284402c 	add	r4, r4, #44	@ 0x2c
 3003bc4:	e58b41ac 	str	r4, [fp, #428]	@ 0x1ac
 3003bc8:	e59d306c 	ldr	r3, [sp, #108]	@ 0x6c
 3003bcc:	e3530002 	cmp	r3, #2
 3003bd0:	0a0000a1 	beq	3003e5c <fn_03002CDC+0x1180>
 3003bd4:	e59d3034 	ldr	r3, [sp, #52]	@ 0x34
 3003bd8:	e1a02003 	mov	r2, r3
 3003bdc:	e58d3004 	str	r3, [sp, #4]
 3003be0:	e59d302c 	ldr	r3, [sp, #44]	@ 0x2c
 3003be4:	e1530002 	cmp	r3, r2
 3003be8:	cafffcd9 	bgt	3002f54 <fn_03002CDC+0x278>
 3003bec:	e28d7090 	add	r7, sp, #144	@ 0x90
 3003bf0:	e8970180 	ldm	r7, {r7, r8}
 3003bf4:	eaffffd8 	b	3003b5c <fn_03002CDC+0xe80>
 3003bf8:	e59d005c 	ldr	r0, [sp, #92]	@ 0x5c
 3003bfc:	e58d309c 	str	r3, [sp, #156]	@ 0x9c
 3003c00:	e59d3054 	ldr	r3, [sp, #84]	@ 0x54
 3003c04:	e58d10a0 	str	r1, [sp, #160]	@ 0xa0
 3003c08:	e58d30a8 	str	r3, [sp, #168]	@ 0xa8
 3003c0c:	e590100c 	ldr	r1, [r0, #12]
 3003c10:	e28d3098 	add	r3, sp, #152	@ 0x98
 3003c14:	e1d000b4 	ldrh	r0, [r0, #4]
 3003c18:	e58d2078 	str	r2, [sp, #120]	@ 0x78
 3003c1c:	ebfff791 	bl	3001a68 <fn_03001A68>
 3003c20:	e59d3030 	ldr	r3, [sp, #48]	@ 0x30
 3003c24:	e1530008 	cmp	r3, r8
 3003c28:	e59d2078 	ldr	r2, [sp, #120]	@ 0x78
 3003c2c:	caffff5b 	bgt	30039a0 <fn_03002CDC+0xcc4>
 3003c30:	eaffff50 	b	3003978 <fn_03002CDC+0xc9c>
 3003c34:	e59d0060 	ldr	r0, [sp, #96]	@ 0x60
 3003c38:	e2455001 	sub	r5, r5, #1
 3003c3c:	e1a04640 	asr	r4, r0, #12
 3003c40:	e1540005 	cmp	r4, r5
 3003c44:	a1a04005 	movge	r4, r5
 3003c48:	e1540001 	cmp	r4, r1
 3003c4c:	b1a04001 	movlt	r4, r1
 3003c50:	e59dc074 	ldr	ip, [sp, #116]	@ 0x74
 3003c54:	e59d1070 	ldr	r1, [sp, #112]	@ 0x70
 3003c58:	e080000c 	add	r0, r0, ip
 3003c5c:	e1540003 	cmp	r4, r3
 3003c60:	e58d0060 	str	r0, [sp, #96]	@ 0x60
 3003c64:	b3a00000 	movlt	r0, #0
 3003c68:	a3a00001 	movge	r0, #1
 3003c6c:	e3510000 	cmp	r1, #0
 3003c70:	01a01004 	moveq	r1, r4
 3003c74:	0affff0c 	beq	30038ac <fn_03002CDC+0xbd0>
 3003c78:	e1a01004 	mov	r1, r4
 3003c7c:	e284c001 	add	ip, r4, #1
 3003c80:	eafffefa 	b	3003870 <fn_03002CDC+0xb94>
 3003c84:	030064cc 	.word	0x030064cc	@ data_030064CC
 3003c88:	40100000 	.word	0x40100000
 3003c8c:	20080000 	.word	0x20080000
 3003c90:	081337c8 	.word	0x081337c8	@ data_081337C8
 3003c94:	0000ffff 	.word	0x0000ffff
 3003c98:	081377c8 	.word	0x081377c8	@ data_081377C8
 3003c9c:	06009600 	.word	0x06009600
 3003ca0:	05000200 	.word	0x05000200
 3003ca4:	000003ff 	.word	0x000003ff
 3003ca8:	081397cc 	.word	0x081397cc	@ data_081397CC
 3003cac:	030064c4 	.word	0x030064c4	@ data_030064C4
 3003cb0:	060099e0 	.word	0x060099e0
 3003cb4:	081437cc 	.word	0x081437cc	@ data_081437CC
 3003cb8:	0802648c 	.word	0x0802648c	@ data_0802648C
 3003cbc:	0802e48c 	.word	0x0802e48c	@ data_0802E48C
 3003cc0:	06013600 	.word	0x06013600
 3003cc4:	070000f0 	.word	0x070000f0
 3003cc8:	08132804 	.word	0x08132804	@ data_08132804
 3003ccc:	0801d781 	.word	0x0801d781	@ fn_0801D780
 3003cd0:	030064c4 	.word	0x030064c4	@ data_030064C4
 3003cd4:	03006600 	.word	0x03006600	@ data_03006600
 3003cd8:	e59b41ac 	ldr	r4, [fp, #428]	@ 0x1ac
 3003cdc:	e59b20d4 	ldr	r2, [fp, #212]	@ 0xd4
 3003ce0:	e5943014 	ldr	r3, [r4, #20]
 3003ce4:	e3520000 	cmp	r2, #0
 3003ce8:	e1a05003 	mov	r5, r3
 3003cec:	0a000018 	beq	3003d54 <fn_03002CDC+0x1078>
 3003cf0:	e59b1218 	ldr	r1, [fp, #536]	@ 0x218
 3003cf4:	e3510000 	cmp	r1, #0
 3003cf8:	0a000015 	beq	3003d54 <fn_03002CDC+0x1078>
 3003cfc:	e2136001 	ands	r6, r3, #1
 3003d00:	1a00020c 	bne	3004538 <fn_03002CDC+0x185c>
 3003d04:	e5921000 	ldr	r1, [r2]
 3003d08:	e3130002 	tst	r3, #2
 3003d0c:	e3833001 	orr	r3, r3, #1
 3003d10:	e5843014 	str	r3, [r4, #20]
 3003d14:	e5841018 	str	r1, [r4, #24]
 3003d18:	0a000186 	beq	3004338 <fn_03002CDC+0x165c>
 3003d1c:	e5942020 	ldr	r2, [r4, #32]
 3003d20:	e3520000 	cmp	r2, #0
 3003d24:	0a0002a2 	beq	30047b4 <fn_03002CDC+0x1ad8>
 3003d28:	e5942024 	ldr	r2, [r4, #36]	@ 0x24
 3003d2c:	e3520000 	cmp	r2, #0
 3003d30:	0a0002a3 	beq	30047c4 <fn_03002CDC+0x1ae8>
 3003d34:	e59d2068 	ldr	r2, [sp, #104]	@ 0x68
 3003d38:	e3520000 	cmp	r2, #0
 3003d3c:	1affff99 	bne	3003ba8 <fn_03002CDC+0xecc>
 3003d40:	e284402c 	add	r4, r4, #44	@ 0x2c
 3003d44:	e58b41ac 	str	r4, [fp, #428]	@ 0x1ac
 3003d48:	eaffff9e 	b	3003bc8 <fn_03002CDC+0xeec>
 3003d4c:	e5db11d4 	ldrb	r1, [fp, #468]	@ 0x1d4
 3003d50:	eafffdfa 	b	3003540 <fn_03002CDC+0x864>
 3003d54:	e2138002 	ands	r8, r3, #2
 3003d58:	1a00017b 	bne	300434c <fn_03002CDC+0x1670>
 3003d5c:	e59d2068 	ldr	r2, [sp, #104]	@ 0x68
 3003d60:	e3520000 	cmp	r2, #0
 3003d64:	1affff84 	bne	3003b7c <fn_03002CDC+0xea0>
 3003d68:	e3130001 	tst	r3, #1
 3003d6c:	0affff93 	beq	3003bc0 <fn_03002CDC+0xee4>
 3003d70:	e5943024 	ldr	r3, [r4, #36]	@ 0x24
 3003d74:	e3530000 	cmp	r3, #0
 3003d78:	1affff90 	bne	3003bc0 <fn_03002CDC+0xee4>
 3003d7c:	e59d3004 	ldr	r3, [sp, #4]
 3003d80:	e1a07083 	lsl	r7, r3, #1
 3003d84:	e51f30e0 	ldr	r3, [pc, #-224]	@ 3003cac <fn_03002CDC+0xfd0>
 3003d88:	e5936000 	ldr	r6, [r3]
 3003d8c:	e59b91b8 	ldr	r9, [fp, #440]	@ 0x1b8
 3003d90:	e59d3004 	ldr	r3, [sp, #4]
 3003d94:	e2866901 	add	r6, r6, #16384	@ 0x4000
 3003d98:	e0499003 	sub	r9, r9, r3
 3003d9c:	e59601ac 	ldr	r0, [r6, #428]	@ 0x1ac
 3003da0:	e2871407 	add	r1, r7, #117440512	@ 0x7000000
 3003da4:	e2811e1e 	add	r1, r1, #480	@ 0x1e0
 3003da8:	e1a02089 	lsl	r2, r9, #1
 3003dac:	ebfff3fb 	bl	3000da0 <fn_03000DA0>
 3003db0:	e0400007 	sub	r0, r0, r7
 3003db4:	e5840024 	str	r0, [r4, #36]	@ 0x24
 3003db8:	e59631ac 	ldr	r3, [r6, #428]	@ 0x1ac
 3003dbc:	e0833089 	add	r3, r3, r9, lsl #1
 3003dc0:	e58631ac 	str	r3, [r6, #428]	@ 0x1ac
 3003dc4:	e59d3068 	ldr	r3, [sp, #104]	@ 0x68
 3003dc8:	e3530000 	cmp	r3, #0
 3003dcc:	0affff7b 	beq	3003bc0 <fn_03002CDC+0xee4>
 3003dd0:	e3580000 	cmp	r8, #0
 3003dd4:	0affff6f 	beq	3003b98 <fn_03002CDC+0xebc>
 3003dd8:	e5943014 	ldr	r3, [r4, #20]
 3003ddc:	eaffff71 	b	3003ba8 <fn_03002CDC+0xecc>
 3003de0:	e59d0064 	ldr	r0, [sp, #100]	@ 0x64
 3003de4:	e2802eff 	add	r2, r0, #4080	@ 0xff0
 3003de8:	e282200f 	add	r2, r2, #15
 3003dec:	e1a02642 	asr	r2, r2, #12
 3003df0:	e1520003 	cmp	r2, r3
 3003df4:	b1a02003 	movlt	r2, r3
 3003df8:	e59dc07c 	ldr	ip, [sp, #124]	@ 0x7c
 3003dfc:	e080000c 	add	r0, r0, ip
 3003e00:	e58d0064 	str	r0, [sp, #100]	@ 0x64
 3003e04:	e59d0030 	ldr	r0, [sp, #48]	@ 0x30
 3003e08:	e1500002 	cmp	r0, r2
 3003e0c:	b1a02000 	movlt	r2, r0
 3003e10:	e1520008 	cmp	r2, r8
 3003e14:	e1a04001 	mov	r4, r1
 3003e18:	c3a00000 	movgt	r0, #0
 3003e1c:	d3a00001 	movle	r0, #1
 3003e20:	e58d2030 	str	r2, [sp, #48]	@ 0x30
 3003e24:	e284c001 	add	ip, r4, #1
 3003e28:	e1a05802 	lsl	r5, r2, #16
 3003e2c:	e15c0002 	cmp	ip, r2
 3003e30:	e1a05845 	asr	r5, r5, #16
 3003e34:	a3a02001 	movge	r2, #1
 3003e38:	a51fc16c 	ldrge	ip, [pc, #-364]	@ 3003cd4 <fn_03002CDC+0xff8>
 3003e3c:	a58b2218 	strge	r2, [fp, #536]	@ 0x218
 3003e40:	a7cc200a 	strbge	r2, [ip, sl]
 3003e44:	eafffe9d 	b	30038c0 <fn_03002CDC+0xbe4>
 3003e48:	e59d306c 	ldr	r3, [sp, #108]	@ 0x6c
 3003e4c:	e3530002 	cmp	r3, #2
 3003e50:	1affff65 	bne	3003bec <fn_03002CDC+0xf10>
 3003e54:	e59d302c 	ldr	r3, [sp, #44]	@ 0x2c
 3003e58:	e58d3034 	str	r3, [sp, #52]	@ 0x34
 3003e5c:	e59d4034 	ldr	r4, [sp, #52]	@ 0x34
 3003e60:	e59d2004 	ldr	r2, [sp, #4]
 3003e64:	e59d0044 	ldr	r0, [sp, #68]	@ 0x44
 3003e68:	e0441002 	sub	r1, r4, r2
 3003e6c:	ebfff633 	bl	3001740 <fn_03001740>
 3003e70:	e1a02004 	mov	r2, r4
 3003e74:	e58d4004 	str	r4, [sp, #4]
 3003e78:	eafffc32 	b	3002f48 <fn_03002CDC+0x26c>
 3003e7c:	e28114df 	add	r1, r1, #-553648128	@ 0xdf000000
 3003e80:	e281173e 	add	r1, r1, #16252928	@ 0xf80000
 3003e84:	e15e0001 	cmp	lr, r1
 3003e88:	9affff33 	bls	3003b5c <fn_03002CDC+0xe80>
 3003e8c:	e51f21f0 	ldr	r2, [pc, #-496]	@ 3003ca4 <fn_03002CDC+0xfc8>
 3003e90:	eafffbec 	b	3002e48 <fn_03002CDC+0x16c>
 3003e94:	e51f31f0 	ldr	r3, [pc, #-496]	@ 3003cac <fn_03002CDC+0xfd0>
 3003e98:	e5935000 	ldr	r5, [r3]
 3003e9c:	e59b41ac 	ldr	r4, [fp, #428]	@ 0x1ac
 3003ea0:	e2853dca 	add	r3, r5, #12928	@ 0x3280
 3003ea4:	e283302c 	add	r3, r3, #44	@ 0x2c
 3003ea8:	e1530004 	cmp	r3, r4
 3003eac:	0affffe5 	beq	3003e48 <fn_03002CDC+0x116c>
 3003eb0:	e59d202c 	ldr	r2, [sp, #44]	@ 0x2c
 3003eb4:	e58d2034 	str	r2, [sp, #52]	@ 0x34
 3003eb8:	eafffc3d 	b	3002fb4 <fn_03002CDC+0x2d8>
 3003ebc:	e151000a 	cmp	r1, sl
 3003ec0:	1afffc69 	bne	300306c <fn_03002CDC+0x390>
 3003ec4:	e3a01000 	mov	r1, #0
 3003ec8:	e51f0228 	ldr	r0, [pc, #-552]	@ 3003ca8 <fn_03002CDC+0xfcc>
 3003ecc:	e58d1018 	str	r1, [sp, #24]
 3003ed0:	e58d000c 	str	r0, [sp, #12]
 3003ed4:	e58d101c 	str	r1, [sp, #28]
 3003ed8:	eafffc8e 	b	3003118 <fn_03002CDC+0x43c>
 3003edc:	e3520000 	cmp	r2, #0
 3003ee0:	1affffbe 	bne	3003de0 <fn_03002CDC+0x1104>
 3003ee4:	e1530005 	cmp	r3, r5
 3003ee8:	e1a04001 	mov	r4, r1
 3003eec:	bafffefa 	blt	3003adc <fn_03002CDC+0xe00>
 3003ef0:	e3a03001 	mov	r3, #1
 3003ef4:	e51f2228 	ldr	r2, [pc, #-552]	@ 3003cd4 <fn_03002CDC+0xff8>
 3003ef8:	e58b3218 	str	r3, [fp, #536]	@ 0x218
 3003efc:	e7c2300a 	strb	r3, [r2, sl]
 3003f00:	eafffef5 	b	3003adc <fn_03002CDC+0xe00>
 3003f04:	e59dc088 	ldr	ip, [sp, #136]	@ 0x88
 3003f08:	e1a0000a 	mov	r0, sl
 3003f0c:	e1a00080 	lsl	r0, r0, #1
 3003f10:	e18c20b0 	strh	r2, [ip, r0]
 3003f14:	eafffe7c 	b	300390c <fn_03002CDC+0xc30>
 3003f18:	e59b30e4 	ldr	r3, [fp, #228]	@ 0xe4
 3003f1c:	e584900c 	str	r9, [r4, #12]
 3003f20:	e58d303c 	str	r3, [sp, #60]	@ 0x3c
 3003f24:	eafffcd9 	b	3003290 <fn_03002CDC+0x5b4>
 3003f28:	e59b31e4 	ldr	r3, [fp, #484]	@ 0x1e4
 3003f2c:	e3580000 	cmp	r8, #0
 3003f30:	e58d3054 	str	r3, [sp, #84]	@ 0x54
 3003f34:	058d805c 	streq	r8, [sp, #92]	@ 0x5c
 3003f38:	0afffe09 	beq	3003764 <fn_03002CDC+0xa88>
 3003f3c:	e1a00008 	mov	r0, r8
 3003f40:	eafffe03 	b	3003754 <fn_03002CDC+0xa78>
 3003f44:	e59b0128 	ldr	r0, [fp, #296]	@ 0x128
 3003f48:	e3500000 	cmp	r0, #0
 3003f4c:	0a00003f 	beq	3004050 <fn_03002CDC+0x1374>
 3003f50:	e59d2008 	ldr	r2, [sp, #8]
 3003f54:	e59d1024 	ldr	r1, [sp, #36]	@ 0x24
 3003f58:	ebfff7ce 	bl	3001e98 <fn_03001E98>
 3003f5c:	e5db31d5 	ldrb	r3, [fp, #469]	@ 0x1d5
 3003f60:	e3530000 	cmp	r3, #0
 3003f64:	e59b31b8 	ldr	r3, [fp, #440]	@ 0x1b8
 3003f68:	e58d3010 	str	r3, [sp, #16]
 3003f6c:	e59b3124 	ldr	r3, [fp, #292]	@ 0x124
 3003f70:	e58b0128 	str	r0, [fp, #296]	@ 0x128
 3003f74:	e5db41d4 	ldrb	r4, [fp, #468]	@ 0x1d4
 3003f78:	e58d304c 	str	r3, [sp, #76]	@ 0x4c
 3003f7c:	0a00003a 	beq	300406c <fn_03002CDC+0x1390>
 3003f80:	e3530000 	cmp	r3, #0
 3003f84:	0a0001a6 	beq	3004624 <fn_03002CDC+0x1948>
 3003f88:	e59d2010 	ldr	r2, [sp, #16]
 3003f8c:	e3540000 	cmp	r4, #0
 3003f90:	e2422001 	sub	r2, r2, #1
 3003f94:	e58d2008 	str	r2, [sp, #8]
 3003f98:	0afffdae 	beq	3003658 <fn_03002CDC+0x97c>
 3003f9c:	e1500003 	cmp	r0, r3
 3003fa0:	1afffdac 	bne	3003658 <fn_03002CDC+0x97c>
 3003fa4:	e51f3300 	ldr	r3, [pc, #-768]	@ 3003cac <fn_03002CDC+0xfd0>
 3003fa8:	e593e000 	ldr	lr, [r3]
 3003fac:	e59d304c 	ldr	r3, [sp, #76]	@ 0x4c
 3003fb0:	e1d320f4 	ldrsh	r2, [r3, #4]
 3003fb4:	e5935004 	ldr	r5, [r3, #4]
 3003fb8:	e593100c 	ldr	r1, [r3, #12]
 3003fbc:	e28e0a01 	add	r0, lr, #4096	@ 0x1000
 3003fc0:	e59031a4 	ldr	r3, [r0, #420]	@ 0x1a4
 3003fc4:	e0822082 	add	r2, r2, r2, lsl #1
 3003fc8:	e0822845 	add	r2, r2, r5, asr #16
 3003fcc:	e061c181 	rsb	ip, r1, r1, lsl #3
 3003fd0:	e082200c 	add	r2, r2, ip
 3003fd4:	e3530000 	cmp	r3, #0
 3003fd8:	e202701f 	and	r7, r2, #31
 3003fdc:	0a0001fe 	beq	30047dc <fn_03002CDC+0x1b00>
 3003fe0:	e5932000 	ldr	r2, [r3]
 3003fe4:	e3520000 	cmp	r2, #0
 3003fe8:	e58021a4 	str	r2, [r0, #420]	@ 0x1a4
 3003fec:	0a0001f6 	beq	30047cc <fn_03002CDC+0x1af0>
 3003ff0:	e1a06004 	mov	r6, r4
 3003ff4:	e1a0c003 	mov	ip, r3
 3003ff8:	e59d204c 	ldr	r2, [sp, #76]	@ 0x4c
 3003ffc:	e58d304c 	str	r3, [sp, #76]	@ 0x4c
 3004000:	e58d2058 	str	r2, [sp, #88]	@ 0x58
 3004004:	e08e3107 	add	r3, lr, r7, lsl #2
 3004008:	e2833a01 	add	r3, r3, #4096	@ 0x1000
 300400c:	e5930124 	ldr	r0, [r3, #292]	@ 0x124
 3004010:	e3a02000 	mov	r2, #0
 3004014:	e58c0000 	str	r0, [ip]
 3004018:	e583c124 	str	ip, [r3, #292]	@ 0x124
 300401c:	e58c5004 	str	r5, [ip, #4]
 3004020:	e1a0500c 	mov	r5, ip
 3004024:	e58c100c 	str	r1, [ip, #12]
 3004028:	e59d1008 	ldr	r1, [sp, #8]
 300402c:	e1cc10ba 	strh	r1, [ip, #10]
 3004030:	e59d1024 	ldr	r1, [sp, #36]	@ 0x24
 3004034:	e5cc2010 	strb	r2, [ip, #16]
 3004038:	e1cc10b8 	strh	r1, [ip, #8]
 300403c:	e28c0014 	add	r0, ip, #20
 3004040:	ebfff5c7 	bl	3001764 <fn_03001764>
 3004044:	e1a09086 	lsl	r9, r6, #1
 3004048:	e58b5124 	str	r5, [fp, #292]	@ 0x124
 300404c:	eafffd8e 	b	300368c <fn_03002CDC+0x9b0>
 3004050:	e59b3124 	ldr	r3, [fp, #292]	@ 0x124
 3004054:	e3540000 	cmp	r4, #0
 3004058:	e5cb01d4 	strb	r0, [fp, #468]	@ 0x1d4
 300405c:	e58d304c 	str	r3, [sp, #76]	@ 0x4c
 3004060:	1a000166 	bne	3004600 <fn_03002CDC+0x1924>
 3004064:	e59d3034 	ldr	r3, [sp, #52]	@ 0x34
 3004068:	e58d3010 	str	r3, [sp, #16]
 300406c:	e3a09000 	mov	r9, #0
 3004070:	e59b3128 	ldr	r3, [fp, #296]	@ 0x128
 3004074:	e1a06009 	mov	r6, r9
 3004078:	e58d3058 	str	r3, [sp, #88]	@ 0x58
 300407c:	eafffd82 	b	300368c <fn_03002CDC+0x9b0>
 3004080:	e59d9008 	ldr	r9, [sp, #8]
 3004084:	e58de030 	str	lr, [sp, #48]	@ 0x30
 3004088:	e59d700c 	ldr	r7, [sp, #12]
 300408c:	ea000021 	b	3004118 <fn_03002CDC+0x143c>
 3004090:	e3530000 	cmp	r3, #0
 3004094:	0a000011 	beq	30040e0 <fn_03002CDC+0x1404>
 3004098:	e51f33f0 	ldr	r3, [pc, #-1008]	@ 3003cb0 <fn_03002CDC+0xfd4>
 300409c:	e59d2038 	ldr	r2, [sp, #56]	@ 0x38
 30040a0:	e793310a 	ldr	r3, [r3, sl, lsl #2]
 30040a4:	e0823003 	add	r3, r2, r3
 30040a8:	e51f23fc 	ldr	r2, [pc, #-1020]	@ 3003cb4 <fn_03002CDC+0xfd8>
 30040ac:	e1a039a3 	lsr	r3, r3, #19
 30040b0:	e7923103 	ldr	r3, [r2, r3, lsl #2]
 30040b4:	e59d0040 	ldr	r0, [sp, #64]	@ 0x40
 30040b8:	e0c10093 	smull	r0, r1, r3, r0
 30040bc:	e1a03820 	lsr	r3, r0, #16
 30040c0:	e1833801 	orr	r3, r3, r1, lsl #16
 30040c4:	e59d103c 	ldr	r1, [sp, #60]	@ 0x3c
 30040c8:	e0413003 	sub	r3, r1, r3
 30040cc:	e59d1030 	ldr	r1, [sp, #48]	@ 0x30
 30040d0:	e1a03843 	asr	r3, r3, #16
 30040d4:	e1a0200a 	mov	r2, sl
 30040d8:	e1a02082 	lsl	r2, r2, #1
 30040dc:	e18130b2 	strh	r3, [r1, r2]
 30040e0:	e59d3010 	ldr	r3, [sp, #16]
 30040e4:	e28aa001 	add	sl, sl, #1
 30040e8:	e15a0003 	cmp	sl, r3
 30040ec:	e59d3018 	ldr	r3, [sp, #24]
 30040f0:	e0877003 	add	r7, r7, r3
 30040f4:	e59d3020 	ldr	r3, [sp, #32]
 30040f8:	e0899003 	add	r9, r9, r3
 30040fc:	e59d301c 	ldr	r3, [sp, #28]
 3004100:	e0866003 	add	r6, r6, r3
 3004104:	e3e03000 	mvn	r3, #0
 3004108:	e1c430b0 	strh	r3, [r4]
 300410c:	e3a03080 	mov	r3, #128	@ 0x80
 3004110:	e1c830b0 	strh	r3, [r8]
 3004114:	0afffeef 	beq	3003cd8 <fn_03002CDC+0xffc>
 3004118:	e1a0408a 	lsl	r4, sl, #1
 300411c:	e2844407 	add	r4, r4, #117440512	@ 0x7000000
 3004120:	e2848e2d 	add	r8, r4, #720	@ 0x2d0
 3004124:	e1d830f0 	ldrsh	r3, [r8]
 3004128:	e59d0014 	ldr	r0, [sp, #20]
 300412c:	e1530646 	cmp	r3, r6, asr #12
 3004130:	e2844e1e 	add	r4, r4, #480	@ 0x1e0
 3004134:	e1a01646 	asr	r1, r6, #12
 3004138:	a2831001 	addge	r1, r3, #1
 300413c:	e3500000 	cmp	r0, #0
 3004140:	e1d420f0 	ldrsh	r2, [r4]
 3004144:	e1a05649 	asr	r5, r9, #12
 3004148:	0a00000b 	beq	300417c <fn_03002CDC+0x14a0>
 300414c:	e1520001 	cmp	r2, r1
 3004150:	e2830001 	add	r0, r3, #1
 3004154:	b1a03002 	movlt	r3, r2
 3004158:	a1a03001 	movge	r3, r1
 300415c:	e2433001 	sub	r3, r3, #1
 3004160:	e1530000 	cmp	r3, r0
 3004164:	ba000004 	blt	300417c <fn_03002CDC+0x14a0>
 3004168:	e59de058 	ldr	lr, [sp, #88]	@ 0x58
 300416c:	e1800403 	orr	r0, r0, r3, lsl #8
 3004170:	e1a0c00a 	mov	ip, sl
 3004174:	e08ec08c 	add	ip, lr, ip, lsl #1
 3004178:	e1cc01b4 	strh	r0, [ip, #20]
 300417c:	e1550002 	cmp	r5, r2
 3004180:	b2850001 	addlt	r0, r5, #1
 3004184:	b58d0008 	strlt	r0, [sp, #8]
 3004188:	e59d0024 	ldr	r0, [sp, #36]	@ 0x24
 300418c:	a58d2008 	strge	r2, [sp, #8]
 3004190:	a2425001 	subge	r5, r2, #1
 3004194:	e3500000 	cmp	r0, #0
 3004198:	0a00000a 	beq	30041c8 <fn_03002CDC+0x14ec>
 300419c:	e1550003 	cmp	r5, r3
 30041a0:	a1a03005 	movge	r3, r5
 30041a4:	e2833001 	add	r3, r3, #1
 30041a8:	e1520003 	cmp	r2, r3
 30041ac:	da000005 	ble	30041c8 <fn_03002CDC+0x14ec>
 30041b0:	e59d004c 	ldr	r0, [sp, #76]	@ 0x4c
 30041b4:	e2422001 	sub	r2, r2, #1
 30041b8:	e1833402 	orr	r3, r3, r2, lsl #8
 30041bc:	e1a0200a 	mov	r2, sl
 30041c0:	e0802082 	add	r2, r0, r2, lsl #1
 30041c4:	e1c231b4 	strh	r3, [r2, #20]
 30041c8:	e1510005 	cmp	r1, r5
 30041cc:	e59d3028 	ldr	r3, [sp, #40]	@ 0x28
 30041d0:	caffffae 	bgt	3004090 <fn_03002CDC+0x13b4>
 30041d4:	e3530000 	cmp	r3, #0
 30041d8:	e51f3530 	ldr	r3, [pc, #-1328]	@ 3003cb0 <fn_03002CDC+0xfd4>
 30041dc:	e59d2038 	ldr	r2, [sp, #56]	@ 0x38
 30041e0:	e793310a 	ldr	r3, [r3, sl, lsl #2]
 30041e4:	e0823003 	add	r3, r2, r3
 30041e8:	e51f253c 	ldr	r2, [pc, #-1340]	@ 3003cb4 <fn_03002CDC+0xfd8>
 30041ec:	e1a039a3 	lsr	r3, r3, #19
 30041f0:	e7922103 	ldr	r2, [r2, r3, lsl #2]
 30041f4:	e59d0040 	ldr	r0, [sp, #64]	@ 0x40
 30041f8:	e0c30092 	smull	r0, r3, r2, r0
 30041fc:	e1a02820 	lsr	r2, r0, #16
 3004200:	e1822803 	orr	r2, r2, r3, lsl #16
 3004204:	e59d303c 	ldr	r3, [sp, #60]	@ 0x3c
 3004208:	e0432002 	sub	r2, r3, r2
 300420c:	e1a02842 	asr	r2, r2, #16
 3004210:	1a00002d 	bne	30042cc <fn_03002CDC+0x15f0>
 3004214:	e51f0564 	ldr	r0, [pc, #-1380]	@ 3003cb8 <fn_03002CDC+0xfdc>
 3004218:	e0273fc7 	eor	r3, r7, r7, asr #31
 300421c:	e0433fc7 	sub	r3, r3, r7, asr #31
 3004220:	e7d00823 	ldrb	r0, [r0, r3, lsr #16]
 3004224:	e51fc570 	ldr	ip, [pc, #-1392]	@ 3003cbc <fn_03002CDC+0xfe0>
 3004228:	e1a03033 	lsr	r3, r3, r0
 300422c:	e79c3103 	ldr	r3, [ip, r3, lsl #2]
 3004230:	e1a03053 	asr	r3, r3, r0
 3004234:	e59d0048 	ldr	r0, [sp, #72]	@ 0x48
 3004238:	e3570000 	cmp	r7, #0
 300423c:	b2633000 	rsblt	r3, r3, #0
 3004240:	e3500000 	cmp	r0, #0
 3004244:	e58da098 	str	sl, [sp, #152]	@ 0x98
 3004248:	e58d30a4 	str	r3, [sp, #164]	@ 0xa4
 300424c:	0a000006 	beq	300426c <fn_03002CDC+0x1590>
 3004250:	e1a03527 	lsr	r3, r7, #10
 3004254:	e353009f 	cmp	r3, #159	@ 0x9f
 3004258:	23a0309f 	movcs	r3, #159	@ 0x9f
 300425c:	e7d03003 	ldrb	r3, [r0, r3]
 3004260:	e51f05a8 	ldr	r0, [pc, #-1448]	@ 3003cc0 <fn_03002CDC+0xfe4>
 3004264:	e0803403 	add	r3, r0, r3, lsl #8
 3004268:	e58d30b0 	str	r3, [sp, #176]	@ 0xb0
 300426c:	e59d3054 	ldr	r3, [sp, #84]	@ 0x54
 3004270:	e59d005c 	ldr	r0, [sp, #92]	@ 0x5c
 3004274:	e58d109c 	str	r1, [sp, #156]	@ 0x9c
 3004278:	e58d30a8 	str	r3, [sp, #168]	@ 0xa8
 300427c:	e590100c 	ldr	r1, [r0, #12]
 3004280:	e28d3098 	add	r3, sp, #152	@ 0x98
 3004284:	e1d000b4 	ldrh	r0, [r0, #4]
 3004288:	e58d200c 	str	r2, [sp, #12]
 300428c:	e58d50a0 	str	r5, [sp, #160]	@ 0xa0
 3004290:	ebfff5f4 	bl	3001a68 <fn_03001A68>
 3004294:	e59d3008 	ldr	r3, [sp, #8]
 3004298:	e1550003 	cmp	r5, r3
 300429c:	e59d200c 	ldr	r2, [sp, #12]
 30042a0:	baffff8e 	blt	30040e0 <fn_03002CDC+0x1404>
 30042a4:	e59d0084 	ldr	r0, [sp, #132]	@ 0x84
 30042a8:	e58d309c 	str	r3, [sp, #156]	@ 0x9c
 30042ac:	e59d3080 	ldr	r3, [sp, #128]	@ 0x80
 30042b0:	e590100c 	ldr	r1, [r0, #12]
 30042b4:	e58d30a8 	str	r3, [sp, #168]	@ 0xa8
 30042b8:	e1d000b4 	ldrh	r0, [r0, #4]
 30042bc:	e28d3098 	add	r3, sp, #152	@ 0x98
 30042c0:	e58d50a0 	str	r5, [sp, #160]	@ 0xa0
 30042c4:	ebfff5e7 	bl	3001a68 <fn_03001A68>
 30042c8:	eaffff84 	b	30040e0 <fn_03002CDC+0x1404>
 30042cc:	e59d0030 	ldr	r0, [sp, #48]	@ 0x30
 30042d0:	e1a0300a 	mov	r3, sl
 30042d4:	e1a03083 	lsl	r3, r3, #1
 30042d8:	e18020b3 	strh	r2, [r0, r3]
 30042dc:	eaffffcc 	b	3004214 <fn_03002CDC+0x1538>
 30042e0:	e3a03001 	mov	r3, #1
 30042e4:	e59d1024 	ldr	r1, [sp, #36]	@ 0x24
 30042e8:	e5cb31c4 	strb	r3, [fp, #452]	@ 0x1c4
 30042ec:	e59531ac 	ldr	r3, [r5, #428]	@ 0x1ac
 30042f0:	e59b21cc 	ldr	r2, [fp, #460]	@ 0x1cc
 30042f4:	e0433081 	sub	r3, r3, r1, lsl #1
 30042f8:	e5843028 	str	r3, [r4, #40]	@ 0x28
 30042fc:	e1877002 	orr	r7, r7, r2
 3004300:	e59d2034 	ldr	r2, [sp, #52]	@ 0x34
 3004304:	e58b30e0 	str	r3, [fp, #224]	@ 0xe0
 3004308:	e59531ac 	ldr	r3, [r5, #428]	@ 0x1ac
 300430c:	e0422001 	sub	r2, r2, r1
 3004310:	e0833082 	add	r3, r3, r2, lsl #1
 3004314:	e58531ac 	str	r3, [r5, #428]	@ 0x1ac
 3004318:	e3877001 	orr	r7, r7, #1
 300431c:	eafffc5c 	b	3003494 <fn_03002CDC+0x7b8>
 3004320:	e1a00007 	mov	r0, r7
 3004324:	e58d1014 	str	r1, [sp, #20]
 3004328:	ebfff498 	bl	3001590 <fn_03001590>
 300432c:	e59d1014 	ldr	r1, [sp, #20]
 3004330:	e58d0084 	str	r0, [sp, #132]	@ 0x84
 3004334:	eafffd0d 	b	3003770 <fn_03002CDC+0xa94>
 3004338:	e1a05003 	mov	r5, r3
 300433c:	e5923004 	ldr	r3, [r2, #4]
 3004340:	e3855002 	orr	r5, r5, #2
 3004344:	e584301c 	str	r3, [r4, #28]
 3004348:	e5845014 	str	r5, [r4, #20]
 300434c:	e5943020 	ldr	r3, [r4, #32]
 3004350:	e3530000 	cmp	r3, #0
 3004354:	e2056001 	and	r6, r5, #1
 3004358:	0a0000cf 	beq	300469c <fn_03002CDC+0x19c0>
 300435c:	e3560000 	cmp	r6, #0
 3004360:	1a0000f5 	bne	300473c <fn_03002CDC+0x1a60>
 3004364:	e59d3068 	ldr	r3, [sp, #104]	@ 0x68
 3004368:	e3530000 	cmp	r3, #0
 300436c:	0afffe13 	beq	3003bc0 <fn_03002CDC+0xee4>
 3004370:	e5943024 	ldr	r3, [r4, #36]	@ 0x24
 3004374:	e3530000 	cmp	r3, #0
 3004378:	0a000076 	beq	3004558 <fn_03002CDC+0x187c>
 300437c:	e5943014 	ldr	r3, [r4, #20]
 3004380:	eafffe0a 	b	3003bb0 <fn_03002CDC+0xed4>
 3004384:	e3a02001 	mov	r2, #1
 3004388:	e59d3038 	ldr	r3, [sp, #56]	@ 0x38
 300438c:	e59d0054 	ldr	r0, [sp, #84]	@ 0x54
 3004390:	e1d331b8 	ldrh	r3, [r3, #24]
 3004394:	e59b10d8 	ldr	r1, [fp, #216]	@ 0xd8
 3004398:	e3130010 	tst	r3, #16
 300439c:	e1a03210 	lsl	r3, r0, r2
 30043a0:	e19130f3 	ldrsh	r3, [r1, r3]
 30043a4:	e59b10f8 	ldr	r1, [fp, #248]	@ 0xf8
 30043a8:	e5cb21d4 	strb	r2, [fp, #468]	@ 0x1d4
 30043ac:	e5cb21d5 	strb	r2, [fp, #469]	@ 0x1d5
 30043b0:	e58b31d0 	str	r3, [fp, #464]	@ 0x1d0
 30043b4:	17912100 	ldrne	r2, [r1, r0, lsl #2]
 30043b8:	e1a07003 	mov	r7, r3
 30043bc:	e7911103 	ldr	r1, [r1, r3, lsl #2]
 30043c0:	e59d3010 	ldr	r3, [sp, #16]
 30043c4:	e1d300f2 	ldrsh	r0, [r3, #2]
 30043c8:	10892002 	addne	r2, r9, r2
 30043cc:	059d2014 	ldreq	r2, [sp, #20]
 30043d0:	10422008 	subne	r2, r2, r8
 30043d4:	e1a00800 	lsl	r0, r0, #16
 30043d8:	e58d2038 	str	r2, [sp, #56]	@ 0x38
 30043dc:	ebfff47a 	bl	30015cc <fn_030015CC>
 30043e0:	e59d3038 	ldr	r3, [sp, #56]	@ 0x38
 30043e4:	e0833000 	add	r3, r3, r0
 30043e8:	e58b31d8 	str	r3, [fp, #472]	@ 0x1d8
 30043ec:	e3a03003 	mov	r3, #3
 30043f0:	e5843014 	str	r3, [r4, #20]
 30043f4:	e3a03407 	mov	r3, #117440512	@ 0x7000000
 30043f8:	e5843020 	str	r3, [r4, #32]
 30043fc:	e3e03102 	mvn	r3, #-2147483648	@ 0x80000000
 3004400:	e5843018 	str	r3, [r4, #24]
 3004404:	e3a03102 	mov	r3, #-2147483648	@ 0x80000000
 3004408:	e584301c 	str	r3, [r4, #28]
 300440c:	e51f3750 	ldr	r3, [pc, #-1872]	@ 3003cc4 <fn_03002CDC+0xfe8>
 3004410:	e5843024 	str	r3, [r4, #36]	@ 0x24
 3004414:	eafffc1e 	b	3003494 <fn_03002CDC+0x7b8>
 3004418:	e1590007 	cmp	r9, r7
 300441c:	da00006e 	ble	30045dc <fn_03002CDC+0x1900>
 3004420:	e3a03001 	mov	r3, #1
 3004424:	e5849018 	str	r9, [r4, #24]
 3004428:	e5843014 	str	r3, [r4, #20]
 300442c:	e3a03003 	mov	r3, #3
 3004430:	e59d2030 	ldr	r2, [sp, #48]	@ 0x30
 3004434:	e1520001 	cmp	r2, r1
 3004438:	b5843014 	strlt	r3, [r4, #20]
 300443c:	b584201c 	strlt	r2, [r4, #28]
 3004440:	bafffbbe 	blt	3003340 <fn_03002CDC+0x664>
 3004444:	e1580001 	cmp	r8, r1
 3004448:	c5843014 	strgt	r3, [r4, #20]
 300444c:	c3a03102 	movgt	r3, #-2147483648	@ 0x80000000
 3004450:	c584301c 	strgt	r3, [r4, #28]
 3004454:	eafffbb9 	b	3003340 <fn_03002CDC+0x664>
 3004458:	e59d2020 	ldr	r2, [sp, #32]
 300445c:	e5d2c025 	ldrb	ip, [r2, #37]	@ 0x25
 3004460:	e150000c 	cmp	r0, ip
 3004464:	1afffbbf 	bne	3003368 <fn_03002CDC+0x68c>
 3004468:	e1590007 	cmp	r9, r7
 300446c:	e58b31c0 	str	r3, [fp, #448]	@ 0x1c0
 3004470:	058d3014 	streq	r3, [sp, #20]
 3004474:	0a00000f 	beq	30044b8 <fn_03002CDC+0x17dc>
 3004478:	e3a02001 	mov	r2, #1
 300447c:	e1590001 	cmp	r9, r1
 3004480:	e5cb21d5 	strb	r2, [fp, #469]	@ 0x1d5
 3004484:	b3a02000 	movlt	r2, #0
 3004488:	a3a02001 	movge	r2, #1
 300448c:	e59de030 	ldr	lr, [sp, #48]	@ 0x30
 3004490:	e15e0007 	cmp	lr, r7
 3004494:	d3822001 	orrle	r2, r2, #1
 3004498:	e15c0000 	cmp	ip, r0
 300449c:	13a00001 	movne	r0, #1
 30044a0:	e58d3014 	str	r3, [sp, #20]
 30044a4:	0a000019 	beq	3004510 <fn_03002CDC+0x1834>
 30044a8:	e3520000 	cmp	r2, #0
 30044ac:	e5cb01d4 	strb	r0, [fp, #468]	@ 0x1d4
 30044b0:	1afffbbd 	bne	30033ac <fn_03002CDC+0x6d0>
 30044b4:	eafffbd9 	b	3003420 <fn_03002CDC+0x744>
 30044b8:	e59d2020 	ldr	r2, [sp, #32]
 30044bc:	e5d2c024 	ldrb	ip, [r2, #36]	@ 0x24
 30044c0:	e59d2028 	ldr	r2, [sp, #40]	@ 0x28
 30044c4:	e5d22024 	ldrb	r2, [r2, #36]	@ 0x24
 30044c8:	e15c0002 	cmp	ip, r2
 30044cc:	1afffba7 	bne	3003370 <fn_03002CDC+0x694>
 30044d0:	e59d2020 	ldr	r2, [sp, #32]
 30044d4:	e59dc028 	ldr	ip, [sp, #40]	@ 0x28
 30044d8:	e5d22026 	ldrb	r2, [r2, #38]	@ 0x26
 30044dc:	e5dcc026 	ldrb	ip, [ip, #38]	@ 0x26
 30044e0:	e052200c 	subs	r2, r2, ip
 30044e4:	13a02001 	movne	r2, #1
 30044e8:	eafffba1 	b	3003374 <fn_03002CDC+0x698>
 30044ec:	e3a03501 	mov	r3, #4194304	@ 0x400000
 30044f0:	e1a09003 	mov	r9, r3
 30044f4:	e58d3040 	str	r3, [sp, #64]	@ 0x40
 30044f8:	eafffb3e 	b	30031f8 <fn_03002CDC+0x51c>
 30044fc:	e59dc020 	ldr	ip, [sp, #32]
 3004500:	e5dcc025 	ldrb	ip, [ip, #37]	@ 0x25
 3004504:	e15c0000 	cmp	ip, r0
 3004508:	13a00001 	movne	r0, #1
 300450c:	1affffe5 	bne	30044a8 <fn_03002CDC+0x17cc>
 3004510:	e59d0020 	ldr	r0, [sp, #32]
 3004514:	e59dc028 	ldr	ip, [sp, #40]	@ 0x28
 3004518:	e5d00026 	ldrb	r0, [r0, #38]	@ 0x26
 300451c:	e5dcc026 	ldrb	ip, [ip, #38]	@ 0x26
 3004520:	e050000c 	subs	r0, r0, ip
 3004524:	13a00001 	movne	r0, #1
 3004528:	e3520000 	cmp	r2, #0
 300452c:	e5cb01d4 	strb	r0, [fp, #468]	@ 0x1d4
 3004530:	1afffb9d 	bne	30033ac <fn_03002CDC+0x6d0>
 3004534:	eafffbb9 	b	3003420 <fn_03002CDC+0x744>
 3004538:	e3130002 	tst	r3, #2
 300453c:	0affff7e 	beq	300433c <fn_03002CDC+0x1660>
 3004540:	e5942020 	ldr	r2, [r4, #32]
 3004544:	e3520000 	cmp	r2, #0
 3004548:	0a000053 	beq	300469c <fn_03002CDC+0x19c0>
 300454c:	e5942024 	ldr	r2, [r4, #36]	@ 0x24
 3004550:	e3520000 	cmp	r2, #0
 3004554:	1afffdf6 	bne	3003d34 <fn_03002CDC+0x1058>
 3004558:	e3a08002 	mov	r8, #2
 300455c:	eafffe06 	b	3003d7c <fn_03002CDC+0x10a0>
 3004560:	e59b20d0 	ldr	r2, [fp, #208]	@ 0xd0
 3004564:	e59e0004 	ldr	r0, [lr, #4]
 3004568:	e5924000 	ldr	r4, [r2]
 300456c:	e1500004 	cmp	r0, r4
 3004570:	dafffa64 	ble	3002f08 <fn_03002CDC+0x22c>
 3004574:	e59e5000 	ldr	r5, [lr]
 3004578:	e5926004 	ldr	r6, [r2, #4]
 300457c:	e1550006 	cmp	r5, r6
 3004580:	aafffa60 	bge	3002f08 <fn_03002CDC+0x22c>
 3004584:	e1500005 	cmp	r0, r5
 3004588:	ca000072 	bgt	3004758 <fn_03002CDC+0x1a7c>
 300458c:	e1dc00b4 	ldrh	r0, [ip, #4]
 3004590:	e3500000 	cmp	r0, #0
 3004594:	0a00000a 	beq	30045c4 <fn_03002CDC+0x18e8>
 3004598:	e1dc00b6 	ldrh	r0, [ip, #6]
 300459c:	e3500000 	cmp	r0, #0
 30045a0:	0a000007 	beq	30045c4 <fn_03002CDC+0x18e8>
 30045a4:	e2811901 	add	r1, r1, #16384	@ 0x4000
 30045a8:	e59101b0 	ldr	r0, [r1, #432]	@ 0x1b0
 30045ac:	e5de1025 	ldrb	r1, [lr, #37]	@ 0x25
 30045b0:	e1510000 	cmp	r1, r0
 30045b4:	1afffa53 	bne	3002f08 <fn_03002CDC+0x22c>
 30045b8:	e5d22025 	ldrb	r2, [r2, #37]	@ 0x25
 30045bc:	e1510002 	cmp	r1, r2
 30045c0:	1afffa50 	bne	3002f08 <fn_03002CDC+0x22c>
 30045c4:	e5d32003 	ldrb	r2, [r3, #3]
 30045c8:	e3c22018 	bic	r2, r2, #24
 30045cc:	e5c32003 	strb	r2, [r3, #3]
 30045d0:	e3a03000 	mov	r3, #0
 30045d4:	e58d306c 	str	r3, [sp, #108]	@ 0x6c
 30045d8:	eafffa50 	b	3002f20 <fn_03002CDC+0x244>
 30045dc:	e1580007 	cmp	r8, r7
 30045e0:	a5843014 	strge	r3, [r4, #20]
 30045e4:	a3a03002 	movge	r3, #2
 30045e8:	aaffff90 	bge	3004430 <fn_03002CDC+0x1754>
 30045ec:	e3a03001 	mov	r3, #1
 30045f0:	e5843014 	str	r3, [r4, #20]
 30045f4:	e3e03102 	mvn	r3, #-2147483648	@ 0x80000000
 30045f8:	e5843018 	str	r3, [r4, #24]
 30045fc:	eaffff8a 	b	300442c <fn_03002CDC+0x1750>
 3004600:	e3530000 	cmp	r3, #0
 3004604:	1afffc13 	bne	3003658 <fn_03002CDC+0x97c>
 3004608:	e1a04003 	mov	r4, r3
 300460c:	e59d3034 	ldr	r3, [sp, #52]	@ 0x34
 3004610:	e58d3010 	str	r3, [sp, #16]
 3004614:	ea000002 	b	3004624 <fn_03002CDC+0x1948>
 3004618:	e1a04001 	mov	r4, r1
 300461c:	e59d3034 	ldr	r3, [sp, #52]	@ 0x34
 3004620:	e58d3010 	str	r3, [sp, #16]
 3004624:	e3a09000 	mov	r9, #0
 3004628:	e59b3128 	ldr	r3, [fp, #296]	@ 0x128
 300462c:	e1a06009 	mov	r6, r9
 3004630:	e58d3058 	str	r3, [sp, #88]	@ 0x58
 3004634:	e5cb91d5 	strb	r9, [fp, #469]	@ 0x1d5
 3004638:	e58d904c 	str	r9, [sp, #76]	@ 0x4c
 300463c:	eafffc12 	b	300368c <fn_03002CDC+0x9b0>
 3004640:	e59b30cc 	ldr	r3, [fp, #204]	@ 0xcc
 3004644:	e1d310f6 	ldrsh	r1, [r3, #6]
 3004648:	e1d300f2 	ldrsh	r0, [r3, #2]
 300464c:	e1500001 	cmp	r0, r1
 3004650:	03e01000 	mvneq	r1, #0
 3004654:	e59b20dc 	ldr	r2, [fp, #220]	@ 0xdc
 3004658:	0a000004 	beq	3004670 <fn_03002CDC+0x1994>
 300465c:	e1d310f0 	ldrsh	r1, [r3]
 3004660:	e1d330f4 	ldrsh	r3, [r3, #4]
 3004664:	e0413003 	sub	r3, r1, r3
 3004668:	e2731000 	rsbs	r1, r3, #0
 300466c:	e0a11003 	adc	r1, r1, r3
 3004670:	e59b3100 	ldr	r3, [fp, #256]	@ 0x100
 3004674:	e0833242 	add	r3, r3, r2, asr #4
 3004678:	e0833001 	add	r3, r3, r1
 300467c:	e1c33fc3 	bic	r3, r3, r3, asr #31
 3004680:	e353000f 	cmp	r3, #15
 3004684:	a3a0300f 	movge	r3, #15
 3004688:	e51f29c8 	ldr	r2, [pc, #-2504]	@ 3003cc8 <fn_03002CDC+0xfec>
 300468c:	e0833103 	add	r3, r3, r3, lsl #2
 3004690:	e0823283 	add	r3, r2, r3, lsl #5
 3004694:	e58d3048 	str	r3, [sp, #72]	@ 0x48
 3004698:	eafffc0a 	b	30036c8 <fn_03002CDC+0x9ec>
 300469c:	e3a08002 	mov	r8, #2
 30046a0:	e51f39d8 	ldr	r3, [pc, #-2520]	@ 3003cd0 <fn_03002CDC+0xff4>
 30046a4:	e59d2004 	ldr	r2, [sp, #4]
 30046a8:	e5939000 	ldr	r9, [r3]
 30046ac:	e59b31b8 	ldr	r3, [fp, #440]	@ 0x1b8
 30046b0:	e2899901 	add	r9, r9, #16384	@ 0x4000
 30046b4:	e0433002 	sub	r3, r3, r2
 30046b8:	e1a07082 	lsl	r7, r2, #1
 30046bc:	e1a0a083 	lsl	sl, r3, #1
 30046c0:	e59901ac 	ldr	r0, [r9, #428]	@ 0x1ac
 30046c4:	e2871407 	add	r1, r7, #117440512	@ 0x7000000
 30046c8:	e1a0200a 	mov	r2, sl
 30046cc:	e2811e2d 	add	r1, r1, #720	@ 0x2d0
 30046d0:	ebfff1b2 	bl	3000da0 <fn_03000DA0>
 30046d4:	e0400007 	sub	r0, r0, r7
 30046d8:	e5840020 	str	r0, [r4, #32]
 30046dc:	e59931ac 	ldr	r3, [r9, #428]	@ 0x1ac
 30046e0:	e3560000 	cmp	r6, #0
 30046e4:	e083300a 	add	r3, r3, sl
 30046e8:	e58931ac 	str	r3, [r9, #428]	@ 0x1ac
 30046ec:	1a00000e 	bne	300472c <fn_03002CDC+0x1a50>
 30046f0:	e59d3068 	ldr	r3, [sp, #104]	@ 0x68
 30046f4:	e3530000 	cmp	r3, #0
 30046f8:	0afffd30 	beq	3003bc0 <fn_03002CDC+0xee4>
 30046fc:	e5943024 	ldr	r3, [r4, #36]	@ 0x24
 3004700:	e3530000 	cmp	r3, #0
 3004704:	0afffd9e 	beq	3003d84 <fn_03002CDC+0x10a8>
 3004708:	e3580000 	cmp	r8, #0
 300470c:	1affff1a 	bne	300437c <fn_03002CDC+0x16a0>
 3004710:	eafffd20 	b	3003b98 <fn_03002CDC+0xebc>
 3004714:	e5d31024 	ldrb	r1, [r3, #36]	@ 0x24
 3004718:	e5d32026 	ldrb	r2, [r3, #38]	@ 0x26
 300471c:	ebfff635 	bl	3001ff8 <fn_03001FF8>
 3004720:	e59b30d0 	ldr	r3, [fp, #208]	@ 0xd0
 3004724:	e59b10f4 	ldr	r1, [fp, #244]	@ 0xf4
 3004728:	eafff982 	b	3002d38 <fn_03002CDC+0x5c>
 300472c:	e5943024 	ldr	r3, [r4, #36]	@ 0x24
 3004730:	e3530000 	cmp	r3, #0
 3004734:	1afffda2 	bne	3003dc4 <fn_03002CDC+0x10e8>
 3004738:	eafffd91 	b	3003d84 <fn_03002CDC+0x10a8>
 300473c:	e5943024 	ldr	r3, [r4, #36]	@ 0x24
 3004740:	e3530000 	cmp	r3, #0
 3004744:	0affff83 	beq	3004558 <fn_03002CDC+0x187c>
 3004748:	e59d3068 	ldr	r3, [sp, #104]	@ 0x68
 300474c:	e3530000 	cmp	r3, #0
 3004750:	1afffda0 	bne	3003dd8 <fn_03002CDC+0x10fc>
 3004754:	eafffd19 	b	3003bc0 <fn_03002CDC+0xee4>
 3004758:	e1540005 	cmp	r4, r5
 300475c:	01500006 	cmpeq	r0, r6
 3004760:	1affff97 	bne	30045c4 <fn_03002CDC+0x18e8>
 3004764:	e1dc10b8 	ldrh	r1, [ip, #8]
 3004768:	e3510000 	cmp	r1, #0
 300476c:	1affff94 	bne	30045c4 <fn_03002CDC+0x18e8>
 3004770:	e5de0025 	ldrb	r0, [lr, #37]	@ 0x25
 3004774:	e5d21025 	ldrb	r1, [r2, #37]	@ 0x25
 3004778:	e1500001 	cmp	r0, r1
 300477c:	1affff90 	bne	30045c4 <fn_03002CDC+0x18e8>
 3004780:	e5de0024 	ldrb	r0, [lr, #36]	@ 0x24
 3004784:	e5d21024 	ldrb	r1, [r2, #36]	@ 0x24
 3004788:	e1500001 	cmp	r0, r1
 300478c:	1affff8c 	bne	30045c4 <fn_03002CDC+0x18e8>
 3004790:	e5de1026 	ldrb	r1, [lr, #38]	@ 0x26
 3004794:	e5d22026 	ldrb	r2, [r2, #38]	@ 0x26
 3004798:	e1510002 	cmp	r1, r2
 300479c:	1affff88 	bne	30045c4 <fn_03002CDC+0x18e8>
 30047a0:	e5d32003 	ldrb	r2, [r3, #3]
 30047a4:	e3c22010 	bic	r2, r2, #16
 30047a8:	e3822008 	orr	r2, r2, #8
 30047ac:	e5c32003 	strb	r2, [r3, #3]
 30047b0:	eafffce9 	b	3003b5c <fn_03002CDC+0xe80>
 30047b4:	e1a05003 	mov	r5, r3
 30047b8:	e3a06001 	mov	r6, #1
 30047bc:	e3a08002 	mov	r8, #2
 30047c0:	eaffffb6 	b	30046a0 <fn_03002CDC+0x19c4>
 30047c4:	e1a05003 	mov	r5, r3
 30047c8:	eaffff62 	b	3004558 <fn_03002CDC+0x187c>
 30047cc:	e28e2d46 	add	r2, lr, #4480	@ 0x1180
 30047d0:	e2822024 	add	r2, r2, #36	@ 0x24
 30047d4:	e58021a8 	str	r2, [r0, #424]	@ 0x1a8
 30047d8:	eafffe04 	b	3003ff0 <fn_03002CDC+0x1314>
 30047dc:	e3a01f42 	mov	r1, #264	@ 0x108
 30047e0:	e51f4b1c 	ldr	r4, [pc, #-2844]	@ 3003ccc <fn_03002CDC+0xff0>
 30047e4:	e3a02002 	mov	r2, #2
 30047e8:	e3a00001 	mov	r0, #1
 30047ec:	e1a0e00f 	mov	lr, pc
 30047f0:	e12fff14 	bx	r4
 30047f4:	e59d304c 	ldr	r3, [sp, #76]	@ 0x4c
 30047f8:	e593100c 	ldr	r1, [r3, #12]
 30047fc:	e5935004 	ldr	r5, [r3, #4]
 3004800:	e51f3b38 	ldr	r3, [pc, #-2872]	@ 3003cd0 <fn_03002CDC+0xff4>
 3004804:	e593e000 	ldr	lr, [r3]
 3004808:	e59b31b8 	ldr	r3, [fp, #440]	@ 0x1b8
 300480c:	e58d3010 	str	r3, [sp, #16]
 3004810:	e59b3128 	ldr	r3, [fp, #296]	@ 0x128
 3004814:	e1a0c000 	mov	ip, r0
 3004818:	e58d004c 	str	r0, [sp, #76]	@ 0x4c
 300481c:	e5db61d5 	ldrb	r6, [fp, #469]	@ 0x1d5
 3004820:	e5db41d4 	ldrb	r4, [fp, #468]	@ 0x1d4
 3004824:	e58d3058 	str	r3, [sp, #88]	@ 0x58
 3004828:	eafffdf5 	b	3004004 <fn_03002CDC+0x1328>
 300482c:	e59d2060 	ldr	r2, [sp, #96]	@ 0x60
 3004830:	e1a04642 	asr	r4, r2, #12
 3004834:	e1540000 	cmp	r4, r0
 3004838:	a1a04000 	movge	r4, r0
 300483c:	e1540001 	cmp	r4, r1
 3004840:	b1a04001 	movlt	r4, r1
 3004844:	e59d0074 	ldr	r0, [sp, #116]	@ 0x74
 3004848:	e0822000 	add	r2, r2, r0
 300484c:	e58d2060 	str	r2, [sp, #96]	@ 0x60
 3004850:	e59d2070 	ldr	r2, [sp, #112]	@ 0x70
 3004854:	e1540003 	cmp	r4, r3
 3004858:	b3a00000 	movlt	r0, #0
 300485c:	a3a00001 	movge	r0, #1
 3004860:	e3520000 	cmp	r2, #0
 3004864:	01a01004 	moveq	r1, r4
 3004868:	059d2030 	ldreq	r2, [sp, #48]	@ 0x30
 300486c:	0afffd6c 	beq	3003e24 <fn_03002CDC+0x1148>
 3004870:	eafffd00 	b	3003c78 <fn_03002CDC+0xf9c>
 3004874:	e3520000 	cmp	r2, #0
 3004878:	1afffbfa 	bne	3003868 <fn_03002CDC+0xb8c>
 300487c:	e59d2030 	ldr	r2, [sp, #48]	@ 0x30
 3004880:	e2843001 	add	r3, r4, #1
 3004884:	e1a05802 	lsl	r5, r2, #16
 3004888:	e1530002 	cmp	r3, r2
 300488c:	e1a05845 	asr	r5, r5, #16
 3004890:	a3a03001 	movge	r3, #1
 3004894:	a51f2bc8 	ldrge	r2, [pc, #-3016]	@ 3003cd4 <fn_03002CDC+0xff8>
 3004898:	a58b3218 	strge	r3, [fp, #536]	@ 0x218
 300489c:	a7c2300a 	strbge	r3, [r2, sl]
 30048a0:	eafffc8d 	b	3003adc <fn_03002CDC+0xe00>
