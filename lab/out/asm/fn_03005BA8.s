fn_03005BA8:
 3005ba8:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 3005bac:	e59fb7fc 	ldr	fp, [pc, #2044]	@ 30063b0 <fn_03005BA8+0x808>
 3005bb0:	e2108902 	ands	r8, r0, #32768	@ 0x8000
 3005bb4:	e59b3000 	ldr	r3, [fp]
 3005bb8:	e24dd0b4 	sub	sp, sp, #180	@ 0xb4
 3005bbc:	0a00000b 	beq	3005bf0 <fn_03005BA8+0x48>
 3005bc0:	e3700001 	cmn	r0, #1
 3005bc4:	1a0001f4 	bne	300639c <fn_03005BA8+0x7f4>
 3005bc8:	e5932df8 	ldr	r2, [r3, #3576]	@ 0xdf8
 3005bcc:	e1d250b0 	ldrh	r5, [r2]
 3005bd0:	e3550000 	cmp	r5, #0
 3005bd4:	13a08000 	movne	r8, #0
 3005bd8:	e2455001 	sub	r5, r5, #1
 3005bdc:	1a000035 	bne	3005cb8 <fn_03005BA8+0x110>
 3005be0:	e3a00001 	mov	r0, #1
 3005be4:	e28dd0b4 	add	sp, sp, #180	@ 0xb4
 3005be8:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 3005bec:	e12fff1e 	bx	lr
 3005bf0:	e59f27bc 	ldr	r2, [pc, #1980]	@ 30063b4 <fn_03005BA8+0x80c>
 3005bf4:	e5922114 	ldr	r2, [r2, #276]	@ 0x114
 3005bf8:	e0600180 	rsb	r0, r0, r0, lsl #3
 3005bfc:	e0825100 	add	r5, r2, r0, lsl #2
 3005c00:	e1a0c100 	lsl	ip, r0, #2
 3005c04:	e1d510f4 	ldrsh	r1, [r5, #4]
 3005c08:	e19220fc 	ldrsh	r2, [r2, ip]
 3005c0c:	e1d560f6 	ldrsh	r6, [r5, #6]
 3005c10:	e1b04801 	lsls	r4, r1, #16
 3005c14:	e5930e5c 	ldr	r0, [r3, #3676]	@ 0xe5c
 3005c18:	e1a02802 	lsl	r2, r2, #16
 3005c1c:	e1a0c806 	lsl	ip, r6, #16
 3005c20:	1a00017b 	bne	3006214 <fn_03005BA8+0x66c>
 3005c24:	e1520000 	cmp	r2, r0
 3005c28:	e5931e54 	ldr	r1, [r3, #3668]	@ 0xe54
 3005c2c:	0a000004 	beq	3005c44 <fn_03005BA8+0x9c>
 3005c30:	b1a04fac 	lsrlt	r4, ip, #31
 3005c34:	ba000002 	blt	3005c44 <fn_03005BA8+0x9c>
 3005c38:	e35c0000 	cmp	ip, #0
 3005c3c:	d3a04000 	movle	r4, #0
 3005c40:	c3a04001 	movgt	r4, #1
 3005c44:	e1520001 	cmp	r2, r1
 3005c48:	0a000006 	beq	3005c68 <fn_03005BA8+0xc0>
 3005c4c:	b1a02fac 	lsrlt	r2, ip, #31
 3005c50:	ba000002 	blt	3005c60 <fn_03005BA8+0xb8>
 3005c54:	e35c0000 	cmp	ip, #0
 3005c58:	d3a02000 	movle	r2, #0
 3005c5c:	c3a02001 	movgt	r2, #1
 3005c60:	e1520004 	cmp	r2, r4
 3005c64:	0a000182 	beq	3006274 <fn_03005BA8+0x6cc>
 3005c68:	e0852084 	add	r2, r5, r4, lsl #1
 3005c6c:	e3580040 	cmp	r8, #64	@ 0x40
 3005c70:	e1d201b8 	ldrh	r0, [r2, #24]
 3005c74:	0a0001ad 	beq	3006330 <fn_03005BA8+0x788>
 3005c78:	e2242001 	eor	r2, r4, #1
 3005c7c:	e0852082 	add	r2, r5, r2, lsl #1
 3005c80:	e1d211b8 	ldrh	r1, [r2, #24]
 3005c84:	e08d2088 	add	r2, sp, r8, lsl #1
 3005c88:	e1c213b0 	strh	r1, [r2, #48]	@ 0x30
 3005c8c:	e2888001 	add	r8, r8, #1
 3005c90:	e3100902 	tst	r0, #32768	@ 0x8000
 3005c94:	0affffd5 	beq	3005bf0 <fn_03005BA8+0x48>
 3005c98:	e5932df8 	ldr	r2, [r3, #3576]	@ 0xdf8
 3005c9c:	e3c00902 	bic	r0, r0, #32768	@ 0x8000
 3005ca0:	e1a01100 	lsl	r1, r0, #2
 3005ca4:	e19250b1 	ldrh	r5, [r2, r1]
 3005ca8:	e3550000 	cmp	r5, #0
 3005cac:	e0822100 	add	r2, r2, r0, lsl #2
 3005cb0:	e2455001 	sub	r5, r5, #1
 3005cb4:	0a000129 	beq	3006160 <fn_03005BA8+0x5b8>
 3005cb8:	e3a0a000 	mov	sl, #0
 3005cbc:	e1d220b2 	ldrh	r2, [r2, #2]
 3005cc0:	e5934de8 	ldr	r4, [r3, #3560]	@ 0xde8
 3005cc4:	e0822102 	add	r2, r2, r2, lsl #2
 3005cc8:	e1a0900a 	mov	r9, sl
 3005ccc:	e58da004 	str	sl, [sp, #4]
 3005cd0:	e58da00c 	str	sl, [sp, #12]
 3005cd4:	e58d801c 	str	r8, [sp, #28]
 3005cd8:	e0844102 	add	r4, r4, r2, lsl #2
 3005cdc:	ea000073 	b	3005eb0 <fn_03005BA8+0x308>
 3005ce0:	e5937e5c 	ldr	r7, [r3, #3676]	@ 0xe5c
 3005ce4:	e1500007 	cmp	r0, r7
 3005ce8:	0a000146 	beq	3006208 <fn_03005BA8+0x660>
 3005cec:	e593ee68 	ldr	lr, [r3, #3688]	@ 0xe68
 3005cf0:	ca000121 	bgt	300617c <fn_03005BA8+0x5d4>
 3005cf4:	e1510007 	cmp	r1, r7
 3005cf8:	0a000122 	beq	3006188 <fn_03005BA8+0x5e0>
 3005cfc:	e35e0000 	cmp	lr, #0
 3005d00:	d3a08000 	movle	r8, #0
 3005d04:	c3a08001 	movgt	r8, #1
 3005d08:	e1510007 	cmp	r1, r7
 3005d0c:	ca0000be 	bgt	300600c <fn_03005BA8+0x464>
 3005d10:	e35e0000 	cmp	lr, #0
 3005d14:	d3a0e000 	movle	lr, #0
 3005d18:	c3a0e001 	movgt	lr, #1
 3005d1c:	e15e0008 	cmp	lr, r8
 3005d20:	0a00005e 	beq	3005ea0 <fn_03005BA8+0x2f8>
 3005d24:	e0511000 	subs	r1, r1, r0
 3005d28:	e042200c 	sub	r2, r2, ip
 3005d2c:	e58d1028 	str	r1, [sp, #40]	@ 0x28
 3005d30:	e58d0020 	str	r0, [sp, #32]
 3005d34:	e58dc024 	str	ip, [sp, #36]	@ 0x24
 3005d38:	e58d202c 	str	r2, [sp, #44]	@ 0x2c
 3005d3c:	e5937e5c 	ldr	r7, [r3, #3676]	@ 0xe5c
 3005d40:	1a0000d4 	bne	3006098 <fn_03005BA8+0x4f0>
 3005d44:	e1500007 	cmp	r0, r7
 3005d48:	e5931e54 	ldr	r1, [r3, #3668]	@ 0xe54
 3005d4c:	0a000154 	beq	30062a4 <fn_03005BA8+0x6fc>
 3005d50:	ba000117 	blt	30061b4 <fn_03005BA8+0x60c>
 3005d54:	e1500001 	cmp	r0, r1
 3005d58:	0a00000a 	beq	3005d88 <fn_03005BA8+0x1e0>
 3005d5c:	e3520000 	cmp	r2, #0
 3005d60:	d3a0e000 	movle	lr, #0
 3005d64:	c3a0e001 	movgt	lr, #1
 3005d68:	e1500001 	cmp	r0, r1
 3005d6c:	b1a02fa2 	lsrlt	r2, r2, #31
 3005d70:	ba000002 	blt	3005d80 <fn_03005BA8+0x1d8>
 3005d74:	e3520000 	cmp	r2, #0
 3005d78:	d3a02000 	movle	r2, #0
 3005d7c:	c3a02001 	movgt	r2, #1
 3005d80:	e152000e 	cmp	r2, lr
 3005d84:	0a000045 	beq	3005ea0 <fn_03005BA8+0x2f8>
 3005d88:	e59d2008 	ldr	r2, [sp, #8]
 3005d8c:	e3520000 	cmp	r2, #0
 3005d90:	0a00010d 	beq	30061cc <fn_03005BA8+0x624>
 3005d94:	e59d000c 	ldr	r0, [sp, #12]
 3005d98:	e59d1004 	ldr	r1, [sp, #4]
 3005d9c:	e1500001 	cmp	r0, r1
 3005da0:	da000109 	ble	30061cc <fn_03005BA8+0x624>
 3005da4:	e5932e88 	ldr	r2, [r3, #3720]	@ 0xe88
 3005da8:	e1500002 	cmp	r0, r2
 3005dac:	ba000106 	blt	30061cc <fn_03005BA8+0x624>
 3005db0:	e5932e84 	ldr	r2, [r3, #3716]	@ 0xe84
 3005db4:	e1510002 	cmp	r1, r2
 3005db8:	ca000103 	bgt	30061cc <fn_03005BA8+0x624>
 3005dbc:	e2830ee5 	add	r0, r3, #3664	@ 0xe50
 3005dc0:	e28d1020 	add	r1, sp, #32
 3005dc4:	e59f35ec 	ldr	r3, [pc, #1516]	@ 30063b8 <fn_03005BA8+0x810>
 3005dc8:	e280000c 	add	r0, r0, #12
 3005dcc:	e1a0e00f 	mov	lr, pc
 3005dd0:	e12fff13 	bx	r3
 3005dd4:	e5992000 	ldr	r2, [r9]
 3005dd8:	e59a3000 	ldr	r3, [sl]
 3005ddc:	e1520003 	cmp	r2, r3
 3005de0:	e1a06000 	mov	r6, r0
 3005de4:	0a000012 	beq	3005e34 <fn_03005BA8+0x28c>
 3005de8:	e59b8000 	ldr	r8, [fp]
 3005dec:	e59d1004 	ldr	r1, [sp, #4]
 3005df0:	e5987e50 	ldr	r7, [r8, #3664]	@ 0xe50
 3005df4:	e0202fc0 	eor	r2, r0, r0, asr #31
 3005df8:	e0417007 	sub	r7, r1, r7
 3005dfc:	e0422fc0 	sub	r2, r2, r0, asr #31
 3005e00:	e0270fc7 	eor	r0, r7, r7, asr #31
 3005e04:	e0400fc7 	sub	r0, r0, r7, asr #31
 3005e08:	e59f35ac 	ldr	r3, [pc, #1452]	@ 30063bc <fn_03005BA8+0x814>
 3005e0c:	e1a01800 	lsl	r1, r0, #16
 3005e10:	e1a00840 	asr	r0, r0, #16
 3005e14:	e1a0e00f 	mov	lr, pc
 3005e18:	e12fff13 	bx	r3
 3005e1c:	e0277006 	eor	r7, r7, r6
 3005e20:	e5983e70 	ldr	r3, [r8, #3696]	@ 0xe70
 3005e24:	e3570000 	cmp	r7, #0
 3005e28:	b2600000 	rsblt	r0, r0, #0
 3005e2c:	e1530000 	cmp	r3, r0
 3005e30:	b5880e70 	strlt	r0, [r8, #3696]	@ 0xe70
 3005e34:	e5992004 	ldr	r2, [r9, #4]
 3005e38:	e59a3004 	ldr	r3, [sl, #4]
 3005e3c:	e1520003 	cmp	r2, r3
 3005e40:	0a000011 	beq	3005e8c <fn_03005BA8+0x2e4>
 3005e44:	e59b7000 	ldr	r7, [fp]
 3005e48:	e59d300c 	ldr	r3, [sp, #12]
 3005e4c:	e5970e50 	ldr	r0, [r7, #3664]	@ 0xe50
 3005e50:	e0262fc6 	eor	r2, r6, r6, asr #31
 3005e54:	e0530000 	subs	r0, r3, r0
 3005e58:	e0422fc6 	sub	r2, r2, r6, asr #31
 3005e5c:	e0266000 	eor	r6, r6, r0
 3005e60:	42600000 	rsbmi	r0, r0, #0
 3005e64:	e59f3550 	ldr	r3, [pc, #1360]	@ 30063bc <fn_03005BA8+0x814>
 3005e68:	e1a01800 	lsl	r1, r0, #16
 3005e6c:	e1a00840 	asr	r0, r0, #16
 3005e70:	e1a0e00f 	mov	lr, pc
 3005e74:	e12fff13 	bx	r3
 3005e78:	e5973e6c 	ldr	r3, [r7, #3692]	@ 0xe6c
 3005e7c:	e3560000 	cmp	r6, #0
 3005e80:	b2600000 	rsblt	r0, r0, #0
 3005e84:	e1530000 	cmp	r3, r0
 3005e88:	c5870e6c 	strgt	r0, [r7, #3692]	@ 0xe6c
 3005e8c:	e59b3000 	ldr	r3, [fp]
 3005e90:	e5932e6c 	ldr	r2, [r3, #3692]	@ 0xe6c
 3005e94:	e5933e70 	ldr	r3, [r3, #3696]	@ 0xe70
 3005e98:	e1520003 	cmp	r2, r3
 3005e9c:	da0000ca 	ble	30061cc <fn_03005BA8+0x624>
 3005ea0:	e2555001 	subs	r5, r5, #1
 3005ea4:	3a0000ac 	bcc	300615c <fn_03005BA8+0x5b4>
 3005ea8:	e59b3000 	ldr	r3, [fp]
 3005eac:	e2844014 	add	r4, r4, #20
 3005eb0:	e1d420be 	ldrh	r2, [r4, #14]
 3005eb4:	e593ee04 	ldr	lr, [r3, #3588]	@ 0xe04
 3005eb8:	e2831c11 	add	r1, r3, #4352	@ 0x1100
 3005ebc:	e1a00102 	lsl	r0, r2, #2
 3005ec0:	e1d1c2b2 	ldrh	ip, [r1, #34]	@ 0x22
 3005ec4:	e19e10b0 	ldrh	r1, [lr, r0]
 3005ec8:	e151000c 	cmp	r1, ip
 3005ecc:	0afffff3 	beq	3005ea0 <fn_03005BA8+0x2f8>
 3005ed0:	e5931e00 	ldr	r1, [r3, #3584]	@ 0xe00
 3005ed4:	e18ec0b0 	strh	ip, [lr, r0]
 3005ed8:	e0816282 	add	r6, r1, r2, lsl #5
 3005edc:	e1d6c1b0 	ldrh	ip, [r6, #16]
 3005ee0:	e5930e80 	ldr	r0, [r3, #3712]	@ 0xe80
 3005ee4:	e150080c 	cmp	r0, ip, lsl #16
 3005ee8:	e1a02282 	lsl	r2, r2, #5
 3005eec:	baffffeb 	blt	3005ea0 <fn_03005BA8+0x2f8>
 3005ef0:	e1d6c1b2 	ldrh	ip, [r6, #18]
 3005ef4:	e5930e7c 	ldr	r0, [r3, #3708]	@ 0xe7c
 3005ef8:	e150080c 	cmp	r0, ip, lsl #16
 3005efc:	caffffe7 	bgt	3005ea0 <fn_03005BA8+0x2f8>
 3005f00:	e1d6c0be 	ldrh	ip, [r6, #14]
 3005f04:	e5930e74 	ldr	r0, [r3, #3700]	@ 0xe74
 3005f08:	e150080c 	cmp	r0, ip, lsl #16
 3005f0c:	baffffe3 	blt	3005ea0 <fn_03005BA8+0x2f8>
 3005f10:	e1d6c0bc 	ldrh	ip, [r6, #12]
 3005f14:	e5930e78 	ldr	r0, [r3, #3704]	@ 0xe78
 3005f18:	e150080c 	cmp	r0, ip, lsl #16
 3005f1c:	caffffdf 	bgt	3005ea0 <fn_03005BA8+0x2f8>
 3005f20:	e1d601b8 	ldrh	r0, [r6, #24]
 3005f24:	e2100004 	ands	r0, r0, #4
 3005f28:	e58d0008 	str	r0, [sp, #8]
 3005f2c:	0a00001f 	beq	3005fb0 <fn_03005BA8+0x408>
 3005f30:	e1d401b0 	ldrh	r0, [r4, #16]
 3005f34:	e59fc484 	ldr	ip, [pc, #1156]	@ 30063c0 <fn_03005BA8+0x818>
 3005f38:	e150000c 	cmp	r0, ip
 3005f3c:	1593cdf0 	ldrne	ip, [r3, #3568]	@ 0xdf0
 3005f40:	10800100 	addne	r0, r0, r0, lsl #2
 3005f44:	108c9180 	addne	r9, ip, r0, lsl #3
 3005f48:	e1d4e1b2 	ldrh	lr, [r4, #18]
 3005f4c:	e59f046c 	ldr	r0, [pc, #1132]	@ 30063c0 <fn_03005BA8+0x818>
 3005f50:	03a09000 	moveq	r9, #0
 3005f54:	e15e0000 	cmp	lr, r0
 3005f58:	0a000111 	beq	30063a4 <fn_03005BA8+0x7fc>
 3005f5c:	e5937df0 	ldr	r7, [r3, #3568]	@ 0xdf0
 3005f60:	e08ee10e 	add	lr, lr, lr, lsl #2
 3005f64:	e797018e 	ldr	r0, [r7, lr, lsl #3]
 3005f68:	e599c000 	ldr	ip, [r9]
 3005f6c:	e087a18e 	add	sl, r7, lr, lsl #3
 3005f70:	e15c0000 	cmp	ip, r0
 3005f74:	e5997004 	ldr	r7, [r9, #4]
 3005f78:	e59ae004 	ldr	lr, [sl, #4]
 3005f7c:	0a000089 	beq	30061a8 <fn_03005BA8+0x600>
 3005f80:	e157000e 	cmp	r7, lr
 3005f84:	b1a0e007 	movlt	lr, r7
 3005f88:	e15c0000 	cmp	ip, r0
 3005f8c:	b1a0c000 	movlt	ip, r0
 3005f90:	e5930e84 	ldr	r0, [r3, #3716]	@ 0xe84
 3005f94:	e15e0000 	cmp	lr, r0
 3005f98:	e58de00c 	str	lr, [sp, #12]
 3005f9c:	e58dc004 	str	ip, [sp, #4]
 3005fa0:	ba000002 	blt	3005fb0 <fn_03005BA8+0x408>
 3005fa4:	e5930e88 	ldr	r0, [r3, #3720]	@ 0xe88
 3005fa8:	e15c0000 	cmp	ip, r0
 3005fac:	daffffbb 	ble	3005ea0 <fn_03005BA8+0x2f8>
 3005fb0:	e593ee64 	ldr	lr, [r3, #3684]	@ 0xe64
 3005fb4:	e19100b2 	ldrh	r0, [r1, r2]
 3005fb8:	e1d6c0b2 	ldrh	ip, [r6, #2]
 3005fbc:	e1d610b4 	ldrh	r1, [r6, #4]
 3005fc0:	e1d620b6 	ldrh	r2, [r6, #6]
 3005fc4:	e35e0000 	cmp	lr, #0
 3005fc8:	e1a00800 	lsl	r0, r0, #16
 3005fcc:	e1a0c80c 	lsl	ip, ip, #16
 3005fd0:	e1a01801 	lsl	r1, r1, #16
 3005fd4:	e1a02802 	lsl	r2, r2, #16
 3005fd8:	0affff40 	beq	3005ce0 <fn_03005BA8+0x138>
 3005fdc:	e5938e68 	ldr	r8, [r3, #3688]	@ 0xe68
 3005fe0:	e3580000 	cmp	r8, #0
 3005fe4:	1a00000a 	bne	3006014 <fn_03005BA8+0x46c>
 3005fe8:	e5936e60 	ldr	r6, [r3, #3680]	@ 0xe60
 3005fec:	e15c0006 	cmp	ip, r6
 3005ff0:	0a0000b4 	beq	30062c8 <fn_03005BA8+0x720>
 3005ff4:	ca0000a4 	bgt	300628c <fn_03005BA8+0x6e4>
 3005ff8:	e1520006 	cmp	r2, r6
 3005ffc:	11a08fae 	lsrne	r8, lr, #31
 3006000:	0a000035 	beq	30060dc <fn_03005BA8+0x534>
 3006004:	e1520006 	cmp	r2, r6
 3006008:	caffff40 	bgt	3005d10 <fn_03005BA8+0x168>
 300600c:	e1a0efae 	lsr	lr, lr, #31
 3006010:	eaffff41 	b	3005d1c <fn_03005BA8+0x174>
 3006014:	e1a06848 	asr	r6, r8, #16
 3006018:	e58d6010 	str	r6, [sp, #16]
 300601c:	e5936e60 	ldr	r6, [r3, #3680]	@ 0xe60
 3006020:	e04c8006 	sub	r8, ip, r6
 3006024:	e1a08848 	asr	r8, r8, #16
 3006028:	e1a0e84e 	asr	lr, lr, #16
 300602c:	e58d6018 	str	r6, [sp, #24]
 3006030:	e006089e 	mul	r6, lr, r8
 3006034:	e5937e5c 	ldr	r7, [r3, #3676]	@ 0xe5c
 3006038:	e58d6014 	str	r6, [sp, #20]
 300603c:	e0408007 	sub	r8, r0, r7
 3006040:	e59d6010 	ldr	r6, [sp, #16]
 3006044:	e1a08848 	asr	r8, r8, #16
 3006048:	e0060698 	mul	r6, r8, r6
 300604c:	e1a08006 	mov	r8, r6
 3006050:	e59d6014 	ldr	r6, [sp, #20]
 3006054:	e1560008 	cmp	r6, r8
 3006058:	ba00005f 	blt	30061dc <fn_03005BA8+0x634>
 300605c:	03a08002 	moveq	r8, #2
 3006060:	13a08001 	movne	r8, #1
 3006064:	e59d6018 	ldr	r6, [sp, #24]
 3006068:	e0426006 	sub	r6, r2, r6
 300606c:	e1a06846 	asr	r6, r6, #16
 3006070:	e006069e 	mul	r6, lr, r6
 3006074:	e0417007 	sub	r7, r1, r7
 3006078:	e59de010 	ldr	lr, [sp, #16]
 300607c:	e1a07847 	asr	r7, r7, #16
 3006080:	e00e0e97 	mul	lr, r7, lr
 3006084:	e15e0006 	cmp	lr, r6
 3006088:	caffff25 	bgt	3005d24 <fn_03005BA8+0x17c>
 300608c:	13a0e001 	movne	lr, #1
 3006090:	03a0e002 	moveq	lr, #2
 3006094:	eaffff20 	b	3005d1c <fn_03005BA8+0x174>
 3006098:	e5936e60 	ldr	r6, [r3, #3680]	@ 0xe60
 300609c:	e3520000 	cmp	r2, #0
 30060a0:	1a000015 	bne	30060fc <fn_03005BA8+0x554>
 30060a4:	e15c0006 	cmp	ip, r6
 30060a8:	e5932e58 	ldr	r2, [r3, #3672]	@ 0xe58
 30060ac:	0a0000a7 	beq	3006350 <fn_03005BA8+0x7a8>
 30060b0:	ba00007e 	blt	30062b0 <fn_03005BA8+0x708>
 30060b4:	e15c0002 	cmp	ip, r2
 30060b8:	11a0efa1 	lsrne	lr, r1, #31
 30060bc:	0affff31 	beq	3005d88 <fn_03005BA8+0x1e0>
 30060c0:	e15c0002 	cmp	ip, r2
 30060c4:	a1a02fa1 	lsrge	r2, r1, #31
 30060c8:	aaffff2c 	bge	3005d80 <fn_03005BA8+0x1d8>
 30060cc:	e3510000 	cmp	r1, #0
 30060d0:	d3a02000 	movle	r2, #0
 30060d4:	c3a02001 	movgt	r2, #1
 30060d8:	eaffff28 	b	3005d80 <fn_03005BA8+0x1d8>
 30060dc:	e0511000 	subs	r1, r1, r0
 30060e0:	e042200c 	sub	r2, r2, ip
 30060e4:	e58d0020 	str	r0, [sp, #32]
 30060e8:	e58d1028 	str	r1, [sp, #40]	@ 0x28
 30060ec:	e58dc024 	str	ip, [sp, #36]	@ 0x24
 30060f0:	e58d202c 	str	r2, [sp, #44]	@ 0x2c
 30060f4:	e5937e5c 	ldr	r7, [r3, #3676]	@ 0xe5c
 30060f8:	0affff11 	beq	3005d44 <fn_03005BA8+0x19c>
 30060fc:	e046600c 	sub	r6, r6, ip
 3006100:	e0477000 	sub	r7, r7, r0
 3006104:	e1a01841 	asr	r1, r1, #16
 3006108:	e1a02842 	asr	r2, r2, #16
 300610c:	e1a06846 	asr	r6, r6, #16
 3006110:	e1a07847 	asr	r7, r7, #16
 3006114:	e0060691 	mul	r6, r1, r6
 3006118:	e0070792 	mul	r7, r2, r7
 300611c:	e593ee58 	ldr	lr, [r3, #3672]	@ 0xe58
 3006120:	e04ee00c 	sub	lr, lr, ip
 3006124:	e593ce54 	ldr	ip, [r3, #3668]	@ 0xe54
 3006128:	e04c0000 	sub	r0, ip, r0
 300612c:	e1a0e84e 	asr	lr, lr, #16
 3006130:	e1a00840 	asr	r0, r0, #16
 3006134:	e1560007 	cmp	r6, r7
 3006138:	e001019e 	mul	r1, lr, r1
 300613c:	e0020290 	mul	r2, r0, r2
 3006140:	ba00004e 	blt	3006280 <fn_03005BA8+0x6d8>
 3006144:	0a00008a 	beq	3006374 <fn_03005BA8+0x7cc>
 3006148:	e1510002 	cmp	r1, r2
 300614c:	baffff0d 	blt	3005d88 <fn_03005BA8+0x1e0>
 3006150:	0affff0c 	beq	3005d88 <fn_03005BA8+0x1e0>
 3006154:	e2555001 	subs	r5, r5, #1
 3006158:	2affff52 	bcs	3005ea8 <fn_03005BA8+0x300>
 300615c:	e59d801c 	ldr	r8, [sp, #28]
 3006160:	e3580000 	cmp	r8, #0
 3006164:	0afffe9d 	beq	3005be0 <fn_03005BA8+0x38>
 3006168:	e2488001 	sub	r8, r8, #1
 300616c:	e08d3088 	add	r3, sp, r8, lsl #1
 3006170:	e1d303b0 	ldrh	r0, [r3, #48]	@ 0x30
 3006174:	e59b3000 	ldr	r3, [fp]
 3006178:	eafffec4 	b	3005c90 <fn_03005BA8+0xe8>
 300617c:	e1510007 	cmp	r1, r7
 3006180:	11a08fae 	lsrne	r8, lr, #31
 3006184:	1afffedf 	bne	3005d08 <fn_03005BA8+0x160>
 3006188:	e0411000 	sub	r1, r1, r0
 300618c:	e042200c 	sub	r2, r2, ip
 3006190:	e58d1028 	str	r1, [sp, #40]	@ 0x28
 3006194:	e58d0020 	str	r0, [sp, #32]
 3006198:	e58dc024 	str	ip, [sp, #36]	@ 0x24
 300619c:	e58d202c 	str	r2, [sp, #44]	@ 0x2c
 30061a0:	e5936e60 	ldr	r6, [r3, #3680]	@ 0xe60
 30061a4:	eaffffbc 	b	300609c <fn_03005BA8+0x4f4>
 30061a8:	e157000e 	cmp	r7, lr
 30061ac:	1affff73 	bne	3005f80 <fn_03005BA8+0x3d8>
 30061b0:	eaffff3a 	b	3005ea0 <fn_03005BA8+0x2f8>
 30061b4:	e1500001 	cmp	r0, r1
 30061b8:	11a0efa2 	lsrne	lr, r2, #31
 30061bc:	1afffee9 	bne	3005d68 <fn_03005BA8+0x1c0>
 30061c0:	e59d2008 	ldr	r2, [sp, #8]
 30061c4:	e3520000 	cmp	r2, #0
 30061c8:	1afffef1 	bne	3005d94 <fn_03005BA8+0x1ec>
 30061cc:	e3a00000 	mov	r0, #0
 30061d0:	e28dd0b4 	add	sp, sp, #180	@ 0xb4
 30061d4:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 30061d8:	e12fff1e 	bx	lr
 30061dc:	e59d6018 	ldr	r6, [sp, #24]
 30061e0:	e0426006 	sub	r6, r2, r6
 30061e4:	e1a06846 	asr	r6, r6, #16
 30061e8:	e006069e 	mul	r6, lr, r6
 30061ec:	e0417007 	sub	r7, r1, r7
 30061f0:	e59de010 	ldr	lr, [sp, #16]
 30061f4:	e1a07847 	asr	r7, r7, #16
 30061f8:	e00e0e97 	mul	lr, r7, lr
 30061fc:	e156000e 	cmp	r6, lr
 3006200:	aafffec7 	bge	3005d24 <fn_03005BA8+0x17c>
 3006204:	eaffff25 	b	3005ea0 <fn_03005BA8+0x2f8>
 3006208:	e1510000 	cmp	r1, r0
 300620c:	1affffdd 	bne	3006188 <fn_03005BA8+0x5e0>
 3006210:	eaffff22 	b	3005ea0 <fn_03005BA8+0x2f8>
 3006214:	e1d5e0f2 	ldrsh	lr, [r5, #2]
 3006218:	e35c0000 	cmp	ip, #0
 300621c:	e5937e60 	ldr	r7, [r3, #3680]	@ 0xe60
 3006220:	e5939e58 	ldr	r9, [r3, #3672]	@ 0xe58
 3006224:	e1a0e80e 	lsl	lr, lr, #16
 3006228:	1a000029 	bne	30062d4 <fn_03005BA8+0x72c>
 300622c:	e15e0007 	cmp	lr, r7
 3006230:	0a000004 	beq	3006248 <fn_03005BA8+0x6a0>
 3006234:	a1a0cfa4 	lsrge	ip, r4, #31
 3006238:	aa000002 	bge	3006248 <fn_03005BA8+0x6a0>
 300623c:	e3540000 	cmp	r4, #0
 3006240:	d3a0c000 	movle	ip, #0
 3006244:	c3a0c001 	movgt	ip, #1
 3006248:	e15e0009 	cmp	lr, r9
 300624c:	0a000050 	beq	3006394 <fn_03005BA8+0x7ec>
 3006250:	a1a02fa4 	lsrge	r2, r4, #31
 3006254:	a1a0400c 	movge	r4, ip
 3006258:	aafffe80 	bge	3005c60 <fn_03005BA8+0xb8>
 300625c:	e3540000 	cmp	r4, #0
 3006260:	d3a02000 	movle	r2, #0
 3006264:	c3a02001 	movgt	r2, #1
 3006268:	e1a0400c 	mov	r4, ip
 300626c:	e1520004 	cmp	r2, r4
 3006270:	1afffe7c 	bne	3005c68 <fn_03005BA8+0xc0>
 3006274:	e0854084 	add	r4, r5, r4, lsl #1
 3006278:	e1d401b8 	ldrh	r0, [r4, #24]
 300627c:	eafffe83 	b	3005c90 <fn_03005BA8+0xe8>
 3006280:	e1510002 	cmp	r1, r2
 3006284:	aafffebf 	bge	3005d88 <fn_03005BA8+0x1e0>
 3006288:	eaffff04 	b	3005ea0 <fn_03005BA8+0x2f8>
 300628c:	e1520006 	cmp	r2, r6
 3006290:	0affff91 	beq	30060dc <fn_03005BA8+0x534>
 3006294:	e35e0000 	cmp	lr, #0
 3006298:	d3a08000 	movle	r8, #0
 300629c:	c3a08001 	movgt	r8, #1
 30062a0:	eaffff57 	b	3006004 <fn_03005BA8+0x45c>
 30062a4:	e1500001 	cmp	r0, r1
 30062a8:	1afffeb6 	bne	3005d88 <fn_03005BA8+0x1e0>
 30062ac:	eafffefb 	b	3005ea0 <fn_03005BA8+0x2f8>
 30062b0:	e15c0002 	cmp	ip, r2
 30062b4:	0afffeb3 	beq	3005d88 <fn_03005BA8+0x1e0>
 30062b8:	e3510000 	cmp	r1, #0
 30062bc:	d3a0e000 	movle	lr, #0
 30062c0:	c3a0e001 	movgt	lr, #1
 30062c4:	eaffff7d 	b	30060c0 <fn_03005BA8+0x518>
 30062c8:	e152000c 	cmp	r2, ip
 30062cc:	1afffe94 	bne	3005d24 <fn_03005BA8+0x17c>
 30062d0:	eafffef2 	b	3005ea0 <fn_03005BA8+0x2f8>
 30062d4:	e047c00e 	sub	ip, r7, lr
 30062d8:	e0400002 	sub	r0, r0, r2
 30062dc:	e1a0c84c 	asr	ip, ip, #16
 30062e0:	e1a00840 	asr	r0, r0, #16
 30062e4:	e00c0c91 	mul	ip, r1, ip
 30062e8:	e0000096 	mul	r0, r6, r0
 30062ec:	e049e00e 	sub	lr, r9, lr
 30062f0:	e1a0e84e 	asr	lr, lr, #16
 30062f4:	e00e0e91 	mul	lr, r1, lr
 30062f8:	e5931e54 	ldr	r1, [r3, #3668]	@ 0xe54
 30062fc:	e0412002 	sub	r2, r1, r2
 3006300:	e1a02842 	asr	r2, r2, #16
 3006304:	e15c0000 	cmp	ip, r0
 3006308:	e0020296 	mul	r2, r6, r2
 300630c:	ba000012 	blt	300635c <fn_03005BA8+0x7b4>
 3006310:	0a000011 	beq	300635c <fn_03005BA8+0x7b4>
 3006314:	e15e0002 	cmp	lr, r2
 3006318:	aa000018 	bge	3006380 <fn_03005BA8+0x7d8>
 300631c:	e3a04001 	mov	r4, #1
 3006320:	e3580040 	cmp	r8, #64	@ 0x40
 3006324:	e0852084 	add	r2, r5, r4, lsl #1
 3006328:	e1d201b8 	ldrh	r0, [r2, #24]
 300632c:	1afffe51 	bne	3005c78 <fn_03005BA8+0xd0>
 3006330:	ebfffe1c 	bl	3005ba8 <fn_03005BA8>
 3006334:	e3500000 	cmp	r0, #0
 3006338:	0affffa4 	beq	30061d0 <fn_03005BA8+0x628>
 300633c:	e2243001 	eor	r3, r4, #1
 3006340:	e0853083 	add	r3, r5, r3, lsl #1
 3006344:	e1d301b8 	ldrh	r0, [r3, #24]
 3006348:	e59b3000 	ldr	r3, [fp]
 300634c:	eafffe4f 	b	3005c90 <fn_03005BA8+0xe8>
 3006350:	e15c0002 	cmp	ip, r2
 3006354:	1afffe8b 	bne	3005d88 <fn_03005BA8+0x1e0>
 3006358:	eafffed0 	b	3005ea0 <fn_03005BA8+0x2f8>
 300635c:	e15e0002 	cmp	lr, r2
 3006360:	e3a04000 	mov	r4, #0
 3006364:	aafffe3f 	bge	3005c68 <fn_03005BA8+0xc0>
 3006368:	e0854084 	add	r4, r5, r4, lsl #1
 300636c:	e1d401b8 	ldrh	r0, [r4, #24]
 3006370:	eafffe46 	b	3005c90 <fn_03005BA8+0xe8>
 3006374:	e1510002 	cmp	r1, r2
 3006378:	bafffe82 	blt	3005d88 <fn_03005BA8+0x1e0>
 300637c:	eafffe80 	b	3005d84 <fn_03005BA8+0x1dc>
 3006380:	13a04001 	movne	r4, #1
 3006384:	0affffe4 	beq	300631c <fn_03005BA8+0x774>
 3006388:	e0854084 	add	r4, r5, r4, lsl #1
 300638c:	e1d401b8 	ldrh	r0, [r4, #24]
 3006390:	eafffe3e 	b	3005c90 <fn_03005BA8+0xe8>
 3006394:	e1a0400c 	mov	r4, ip
 3006398:	eafffe32 	b	3005c68 <fn_03005BA8+0xc0>
 300639c:	e3a08000 	mov	r8, #0
 30063a0:	eafffe3c 	b	3005c98 <fn_03005BA8+0xf0>
 30063a4:	e3a03000 	mov	r3, #0
 30063a8:	e5933000 	ldr	r3, [r3]
 30063ac:	e7f000f0 	udf	#0
 30063b0:	030064c4 	.word	0x030064c4	@ data_030064C4
 30063b4:	030064cc 	.word	0x030064cc	@ data_030064CC
 30063b8:	0800ffbd 	.word	0x0800ffbd	@ fn_0800FFBC
 30063bc:	0300092c 	.word	0x0300092c
 30063c0:	0000ffff 	.word	0x0000ffff
