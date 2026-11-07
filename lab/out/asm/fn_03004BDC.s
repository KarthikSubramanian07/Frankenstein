fn_03004BDC:
 3004bdc:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 3004be0:	e59f3e14 	ldr	r3, [pc, #3604]	@ 30059fc <fn_03004BDC+0xe20>
 3004be4:	e24dd06c 	sub	sp, sp, #108	@ 0x6c
 3004be8:	e1a0e00f 	mov	lr, pc
 3004bec:	e12fff13 	bx	r3
 3004bf0:	e59fce08 	ldr	ip, [pc, #3592]	@ 3005a00 <fn_03004BDC+0xe24>
 3004bf4:	e59c30fc 	ldr	r3, [ip, #252]	@ 0xfc
 3004bf8:	e3530000 	cmp	r3, #0
 3004bfc:	0a000009 	beq	3004c28 <fn_03004BDC+0x4c>
 3004c00:	e59c221c 	ldr	r2, [ip, #540]	@ 0x21c
 3004c04:	e1530002 	cmp	r3, r2
 3004c08:	0a000006 	beq	3004c28 <fn_03004BDC+0x4c>
 3004c0c:	e3a02301 	mov	r2, #67108864	@ 0x4000000
 3004c10:	e59f0dec 	ldr	r0, [pc, #3564]	@ 3005a04 <fn_03004BDC+0xe28>
 3004c14:	e59f1dec 	ldr	r1, [pc, #3564]	@ 3005a08 <fn_03004BDC+0xe2c>
 3004c18:	e58c321c 	str	r3, [ip, #540]	@ 0x21c
 3004c1c:	e58230d4 	str	r3, [r2, #212]	@ 0xd4
 3004c20:	e58200d8 	str	r0, [r2, #216]	@ 0xd8
 3004c24:	e58210dc 	str	r1, [r2, #220]	@ 0xdc
 3004c28:	e3a03301 	mov	r3, #67108864	@ 0x4000000
 3004c2c:	e3a0e000 	mov	lr, #0
 3004c30:	e3e04000 	mvn	r4, #0
 3004c34:	e59f8dd0 	ldr	r8, [pc, #3536]	@ 3005a0c <fn_03004BDC+0xe30>
 3004c38:	e59f2dd0 	ldr	r2, [pc, #3536]	@ 3005a10 <fn_03004BDC+0xe34>
 3004c3c:	e59f7dd0 	ldr	r7, [pc, #3536]	@ 3005a14 <fn_03004BDC+0xe38>
 3004c40:	e28d9024 	add	r9, sp, #36	@ 0x24
 3004c44:	e58de024 	str	lr, [sp, #36]	@ 0x24
 3004c48:	e58390d4 	str	r9, [r3, #212]	@ 0xd4
 3004c4c:	e58380d8 	str	r8, [r3, #216]	@ 0xd8
 3004c50:	e58370dc 	str	r7, [r3, #220]	@ 0xdc
 3004c54:	e58d2028 	str	r2, [sp, #40]	@ 0x28
 3004c58:	e59f2db8 	ldr	r2, [pc, #3512]	@ 3005a18 <fn_03004BDC+0xe3c>
 3004c5c:	e59f1db8 	ldr	r1, [pc, #3512]	@ 3005a1c <fn_03004BDC+0xe40>
 3004c60:	e5922000 	ldr	r2, [r2]
 3004c64:	e59f5db4 	ldr	r5, [pc, #3508]	@ 3005a20 <fn_03004BDC+0xe44>
 3004c68:	e59f0db4 	ldr	r0, [pc, #3508]	@ 3005a24 <fn_03004BDC+0xe48>
 3004c6c:	e28dc02c 	add	ip, sp, #44	@ 0x2c
 3004c70:	e28d6028 	add	r6, sp, #40	@ 0x28
 3004c74:	e58360d4 	str	r6, [r3, #212]	@ 0xd4
 3004c78:	e58350d8 	str	r5, [r3, #216]	@ 0xd8
 3004c7c:	e58310dc 	str	r1, [r3, #220]	@ 0xdc
 3004c80:	e58d402c 	str	r4, [sp, #44]	@ 0x2c
 3004c84:	e583c0d4 	str	ip, [r3, #212]	@ 0xd4
 3004c88:	e282cd46 	add	ip, r2, #4480	@ 0x1180
 3004c8c:	e58300d8 	str	r0, [r3, #216]	@ 0xd8
 3004c90:	e58310dc 	str	r1, [r3, #220]	@ 0xdc
 3004c94:	e28c302c 	add	r3, ip, #44	@ 0x2c
 3004c98:	e2821c11 	add	r1, r2, #4352	@ 0x1100
 3004c9c:	e5883078 	str	r3, [r8, #120]	@ 0x78
 3004ca0:	e2811020 	add	r1, r1, #32
 3004ca4:	e28cc020 	add	ip, ip, #32
 3004ca8:	e2820a01 	add	r0, r2, #4096	@ 0x1000
 3004cac:	e59031a8 	ldr	r3, [r0, #424]	@ 0x1a8
 3004cb0:	e5b14004 	ldr	r4, [r1, #4]!
 3004cb4:	e5834000 	str	r4, [r3]
 3004cb8:	e581e000 	str	lr, [r1]
 3004cbc:	e5933000 	ldr	r3, [r3]
 3004cc0:	e3530000 	cmp	r3, #0
 3004cc4:	0a000004 	beq	3004cdc <fn_03004BDC+0x100>
 3004cc8:	e1a04003 	mov	r4, r3
 3004ccc:	e5933000 	ldr	r3, [r3]
 3004cd0:	e3530000 	cmp	r3, #0
 3004cd4:	1afffffb 	bne	3004cc8 <fn_03004BDC+0xec>
 3004cd8:	e58041a8 	str	r4, [r0, #424]	@ 0x1a8
 3004cdc:	e15c0001 	cmp	ip, r1
 3004ce0:	1afffff1 	bne	3004cac <fn_03004BDC+0xd0>
 3004ce4:	e59f0d14 	ldr	r0, [pc, #3348]	@ 3005a00 <fn_03004BDC+0xe24>
 3004ce8:	e2821dca 	add	r1, r2, #12928	@ 0x3280
 3004cec:	e59f3d34 	ldr	r3, [pc, #3380]	@ 3005a28 <fn_03004BDC+0xe4c>
 3004cf0:	e281102c 	add	r1, r1, #44	@ 0x2c
 3004cf4:	e2822901 	add	r2, r2, #16384	@ 0x4000
 3004cf8:	e5933000 	ldr	r3, [r3]
 3004cfc:	e58211ac 	str	r1, [r2, #428]	@ 0x1ac
 3004d00:	e590211c 	ldr	r2, [r0, #284]	@ 0x11c
 3004d04:	e0c12293 	smull	r2, r1, r3, r2
 3004d08:	e1a02822 	lsr	r2, r2, #16
 3004d0c:	e1822801 	orr	r2, r2, r1, lsl #16
 3004d10:	e5901118 	ldr	r1, [r0, #280]	@ 0x118
 3004d14:	e5802014 	str	r2, [r0, #20]
 3004d18:	e1a02001 	mov	r2, r1
 3004d1c:	e3a05000 	mov	r5, #0
 3004d20:	e0c13392 	smull	r3, r1, r2, r3
 3004d24:	e1a02000 	mov	r2, r0
 3004d28:	e1a07005 	mov	r7, r5
 3004d2c:	e5900110 	ldr	r0, [r0, #272]	@ 0x110
 3004d30:	e1a03823 	lsr	r3, r3, #16
 3004d34:	e1833801 	orr	r3, r3, r1, lsl #16
 3004d38:	e2400001 	sub	r0, r0, #1
 3004d3c:	e5823018 	str	r3, [r2, #24]
 3004d40:	e5825120 	str	r5, [r2, #288]	@ 0x120
 3004d44:	ebfffed6 	bl	30048a4 <fn_030048A4>
 3004d48:	e59f3cc8 	ldr	r3, [pc, #3272]	@ 3005a18 <fn_03004BDC+0xe3c>
 3004d4c:	e59facd8 	ldr	sl, [pc, #3288]	@ 3005a2c <fn_03004BDC+0xe50>
 3004d50:	e5938000 	ldr	r8, [r3]
 3004d54:	e2873d11 	add	r3, r7, #1088	@ 0x440
 3004d58:	e2833008 	add	r3, r3, #8
 3004d5c:	e0883103 	add	r3, r8, r3, lsl #2
 3004d60:	e5934004 	ldr	r4, [r3, #4]
 3004d64:	e3540000 	cmp	r4, #0
 3004d68:	0a000072 	beq	3004f38 <fn_03004BDC+0x35c>
 3004d6c:	e1a06008 	mov	r6, r8
 3004d70:	e58d7008 	str	r7, [sp, #8]
 3004d74:	ea000002 	b	3004d84 <fn_03004BDC+0x1a8>
 3004d78:	e5944000 	ldr	r4, [r4]
 3004d7c:	e3540000 	cmp	r4, #0
 3004d80:	0a00006a 	beq	3004f30 <fn_03004BDC+0x354>
 3004d84:	e5d43010 	ldrb	r3, [r4, #16]
 3004d88:	e3530000 	cmp	r3, #0
 3004d8c:	0afffff9 	beq	3004d78 <fn_03004BDC+0x19c>
 3004d90:	e1d450f8 	ldrsh	r5, [r4, #8]
 3004d94:	e1d470fa 	ldrsh	r7, [r4, #10]
 3004d98:	e1550007 	cmp	r5, r7
 3004d9c:	cafffff5 	bgt	3004d78 <fn_03004BDC+0x19c>
 3004da0:	e2861901 	add	r1, r6, #16384	@ 0x4000
 3004da4:	e1d430f4 	ldrsh	r3, [r4, #4]
 3004da8:	e59101b0 	ldr	r0, [r1, #432]	@ 0x1b0
 3004dac:	e59f2c4c 	ldr	r2, [pc, #3148]	@ 3005a00 <fn_03004BDC+0xe24>
 3004db0:	e1530000 	cmp	r3, r0
 3004db4:	e59290fc 	ldr	r9, [r2, #252]	@ 0xfc
 3004db8:	0a00009a 	beq	3005028 <fn_03004BDC+0x44c>
 3004dbc:	e59f2c3c 	ldr	r2, [pc, #3132]	@ 3005a00 <fn_03004BDC+0xe24>
 3004dc0:	e5921220 	ldr	r1, [r2, #544]	@ 0x220
 3004dc4:	e1a03083 	lsl	r3, r3, #1
 3004dc8:	e19180f3 	ldrsh	r8, [r1, r3]
 3004dcc:	e2863a01 	add	r3, r6, #4096	@ 0x1000
 3004dd0:	e5933100 	ldr	r3, [r3, #256]	@ 0x100
 3004dd4:	e59f2c54 	ldr	r2, [pc, #3156]	@ 3005a30 <fn_03004BDC+0xe54>
 3004dd8:	e0888003 	add	r8, r8, r3
 3004ddc:	e5923000 	ldr	r3, [r2]
 3004de0:	e1580003 	cmp	r8, r3
 3004de4:	0a0000dc 	beq	300515c <fn_03004BDC+0x580>
 3004de8:	e5923004 	ldr	r3, [r2, #4]
 3004dec:	e1580003 	cmp	r8, r3
 3004df0:	0a0000dd 	beq	300516c <fn_03004BDC+0x590>
 3004df4:	e1a00008 	mov	r0, r8
 3004df8:	e59f3c34 	ldr	r3, [pc, #3124]	@ 3005a34 <fn_03004BDC+0xe58>
 3004dfc:	e1a0e00f 	mov	lr, pc
 3004e00:	e12fff13 	bx	r3
 3004e04:	e3590000 	cmp	r9, #0
 3004e08:	e58d0040 	str	r0, [sp, #64]	@ 0x40
 3004e0c:	0a0000c1 	beq	3005118 <fn_03004BDC+0x53c>
 3004e10:	e59f3bec 	ldr	r3, [pc, #3052]	@ 3005a04 <fn_03004BDC+0xe28>
 3004e14:	e58d3044 	str	r3, [sp, #68]	@ 0x44
 3004e18:	e3a03000 	mov	r3, #0
 3004e1c:	e59f2bdc 	ldr	r2, [pc, #3036]	@ 3005a00 <fn_03004BDC+0xe24>
 3004e20:	e59210f4 	ldr	r1, [r2, #244]	@ 0xf4
 3004e24:	e582301c 	str	r3, [r2, #28]
 3004e28:	e594300c 	ldr	r3, [r4, #12]
 3004e2c:	e0533001 	subs	r3, r3, r1
 3004e30:	e3a010ff 	mov	r1, #255	@ 0xff
 3004e34:	42633000 	rsbmi	r3, r3, #0
 3004e38:	e5823004 	str	r3, [r2, #4]
 3004e3c:	e2873001 	add	r3, r7, #1
 3004e40:	e1530005 	cmp	r3, r5
 3004e44:	e0843087 	add	r3, r4, r7, lsl #1
 3004e48:	e1a00005 	mov	r0, r5
 3004e4c:	e3a09000 	mov	r9, #0
 3004e50:	e1c311b6 	strh	r1, [r3, #22]
 3004e54:	ba00001f 	blt	3004ed8 <fn_03004BDC+0x2fc>
 3004e58:	e2845012 	add	r5, r4, #18
 3004e5c:	e58d400c 	str	r4, [sp, #12]
 3004e60:	e1a0b009 	mov	fp, r9
 3004e64:	e1a02000 	mov	r2, r0
 3004e68:	e1a04000 	mov	r4, r0
 3004e6c:	e0856080 	add	r6, r5, r0, lsl #1
 3004e70:	ea000000 	b	3004e78 <fn_03004BDC+0x29c>
 3004e74:	e2844001 	add	r4, r4, #1
 3004e78:	e1f650b2 	ldrh	r5, [r6, #2]!
 3004e7c:	e1550001 	cmp	r5, r1
 3004e80:	e044c002 	sub	ip, r4, r2
 3004e84:	e20530ff 	and	r3, r5, #255	@ 0xff
 3004e88:	0a00000d 	beq	3004ec4 <fn_03004BDC+0x2e8>
 3004e8c:	e1a02425 	lsr	r2, r5, #8
 3004e90:	e0299c9b 	mla	r9, fp, ip, r9
 3004e94:	e28dc038 	add	ip, sp, #56	@ 0x38
 3004e98:	e35300ff 	cmp	r3, #255	@ 0xff
 3004e9c:	e282b001 	add	fp, r2, #1
 3004ea0:	e88d1004 	stm	sp, {r2, ip}
 3004ea4:	e1a00004 	mov	r0, r4
 3004ea8:	e1a02421 	lsr	r2, r1, #8
 3004eac:	e20110ff 	and	r1, r1, #255	@ 0xff
 3004eb0:	03a0b000 	moveq	fp, #0
 3004eb4:	104bb003 	subne	fp, fp, r3
 3004eb8:	ebfff149 	bl	30013e4 <fn_030013E4>
 3004ebc:	e1a02004 	mov	r2, r4
 3004ec0:	e1a01005 	mov	r1, r5
 3004ec4:	e1570004 	cmp	r7, r4
 3004ec8:	aaffffe9 	bge	3004e74 <fn_03004BDC+0x298>
 3004ecc:	e59f3b44 	ldr	r3, [pc, #2884]	@ 3005a18 <fn_03004BDC+0xe3c>
 3004ed0:	e59d400c 	ldr	r4, [sp, #12]
 3004ed4:	e5936000 	ldr	r6, [r3]
 3004ed8:	e59f3b20 	ldr	r3, [pc, #2848]	@ 3005a00 <fn_03004BDC+0xe24>
 3004edc:	e5931224 	ldr	r1, [r3, #548]	@ 0x224
 3004ee0:	e3510000 	cmp	r1, #0
 3004ee4:	0a00009e 	beq	3005164 <fn_03004BDC+0x588>
 3004ee8:	e3a03000 	mov	r3, #0
 3004eec:	ea000002 	b	3004efc <fn_03004BDC+0x320>
 3004ef0:	e2833001 	add	r3, r3, #1
 3004ef4:	e1530001 	cmp	r3, r1
 3004ef8:	0a00007d 	beq	30050f4 <fn_03004BDC+0x518>
 3004efc:	e79a2183 	ldr	r2, [sl, r3, lsl #3]
 3004f00:	e1580002 	cmp	r8, r2
 3004f04:	1afffff9 	bne	3004ef0 <fn_03004BDC+0x314>
 3004f08:	e59f2af0 	ldr	r2, [pc, #2800]	@ 3005a00 <fn_03004BDC+0xe24>
 3004f0c:	e0823183 	add	r3, r2, r3, lsl #3
 3004f10:	e593222c 	ldr	r2, [r3, #556]	@ 0x22c
 3004f14:	e0822009 	add	r2, r2, r9
 3004f18:	e583222c 	str	r2, [r3, #556]	@ 0x22c
 3004f1c:	e5944000 	ldr	r4, [r4]
 3004f20:	e59f3af0 	ldr	r3, [pc, #2800]	@ 3005a18 <fn_03004BDC+0xe3c>
 3004f24:	e3540000 	cmp	r4, #0
 3004f28:	e5936000 	ldr	r6, [r3]
 3004f2c:	1affff94 	bne	3004d84 <fn_03004BDC+0x1a8>
 3004f30:	e1a08006 	mov	r8, r6
 3004f34:	e59d7008 	ldr	r7, [sp, #8]
 3004f38:	e2877001 	add	r7, r7, #1
 3004f3c:	e3570020 	cmp	r7, #32
 3004f40:	1affff83 	bne	3004d54 <fn_03004BDC+0x178>
 3004f44:	e3e02000 	mvn	r2, #0
 3004f48:	e3e03000 	mvn	r3, #0
 3004f4c:	e58d2030 	str	r2, [sp, #48]	@ 0x30
 3004f50:	e58d3034 	str	r3, [sp, #52]	@ 0x34
 3004f54:	e3a03c06 	mov	r3, #1536	@ 0x600
 3004f58:	e3a02c06 	mov	r2, #1536	@ 0x600
 3004f5c:	e58d2038 	str	r2, [sp, #56]	@ 0x38
 3004f60:	e58d303c 	str	r3, [sp, #60]	@ 0x3c
 3004f64:	e59f3a94 	ldr	r3, [pc, #2708]	@ 3005a00 <fn_03004BDC+0xe24>
 3004f68:	e593c224 	ldr	ip, [r3, #548]	@ 0x224
 3004f6c:	e35c0000 	cmp	ip, #0
 3004f70:	0a000277 	beq	3005954 <fn_03004BDC+0xd78>
 3004f74:	e59f5ab4 	ldr	r5, [pc, #2740]	@ 3005a30 <fn_03004BDC+0xe54>
 3004f78:	e2833f8a 	add	r3, r3, #552	@ 0x228
 3004f7c:	e3a00c06 	mov	r0, #1536	@ 0x600
 3004f80:	e595e000 	ldr	lr, [r5]
 3004f84:	e5954004 	ldr	r4, [r5, #4]
 3004f88:	e083c18c 	add	ip, r3, ip, lsl #3
 3004f8c:	ea000000 	b	3004f94 <fn_03004BDC+0x3b8>
 3004f90:	e59d0038 	ldr	r0, [sp, #56]	@ 0x38
 3004f94:	e8930006 	ldm	r3, {r1, r2}
 3004f98:	e151000e 	cmp	r1, lr
 3004f9c:	02822c06 	addeq	r2, r2, #1536	@ 0x600
 3004fa0:	e1510004 	cmp	r1, r4
 3004fa4:	02822c06 	addeq	r2, r2, #1536	@ 0x600
 3004fa8:	e1520000 	cmp	r2, r0
 3004fac:	8a000244 	bhi	30058c4 <fn_03004BDC+0xce8>
 3004fb0:	e59d003c 	ldr	r0, [sp, #60]	@ 0x3c
 3004fb4:	e1500002 	cmp	r0, r2
 3004fb8:	3a00023c 	bcc	30058b0 <fn_03004BDC+0xcd4>
 3004fbc:	e2833008 	add	r3, r3, #8
 3004fc0:	e153000c 	cmp	r3, ip
 3004fc4:	1afffff1 	bne	3004f90 <fn_03004BDC+0x3b4>
 3004fc8:	e3a01000 	mov	r1, #0
 3004fcc:	e59d3030 	ldr	r3, [sp, #48]	@ 0x30
 3004fd0:	e59f0a28 	ldr	r0, [pc, #2600]	@ 3005a00 <fn_03004BDC+0xe24>
 3004fd4:	e3730001 	cmn	r3, #1
 3004fd8:	e59d2034 	ldr	r2, [sp, #52]	@ 0x34
 3004fdc:	e5801224 	str	r1, [r0, #548]	@ 0x224
 3004fe0:	e5cd1020 	strb	r1, [sp, #32]
 3004fe4:	0a000062 	beq	3005174 <fn_03004BDC+0x598>
 3004fe8:	e15e0003 	cmp	lr, r3
 3004fec:	03a03001 	moveq	r3, #1
 3004ff0:	05cd3020 	strbeq	r3, [sp, #32]
 3004ff4:	0a00005e 	beq	3005174 <fn_03004BDC+0x598>
 3004ff8:	e3720001 	cmn	r2, #1
 3004ffc:	0a000235 	beq	30058d8 <fn_03004BDC+0xcfc>
 3005000:	e5950000 	ldr	r0, [r5]
 3005004:	e1500002 	cmp	r0, r2
 3005008:	0a000249 	beq	3005934 <fn_03004BDC+0xd58>
 300500c:	e5950004 	ldr	r0, [r5, #4]
 3005010:	e1500003 	cmp	r0, r3
 3005014:	15cd1021 	strbne	r1, [sp, #33]	@ 0x21
 3005018:	1a00005d 	bne	3005194 <fn_03004BDC+0x5b8>
 300501c:	e3a03001 	mov	r3, #1
 3005020:	e5cd3021 	strb	r3, [sp, #33]	@ 0x21
 3005024:	ea000059 	b	3005190 <fn_03004BDC+0x5b4>
 3005028:	e3a03719 	mov	r3, #6553600	@ 0x640000
 300502c:	e59f2a04 	ldr	r2, [pc, #2564]	@ 3005a38 <fn_03004BDC+0xe5c>
 3005030:	e3590000 	cmp	r9, #0
 3005034:	e58d3048 	str	r3, [sp, #72]	@ 0x48
 3005038:	e59f39c4 	ldr	r3, [pc, #2500]	@ 3005a04 <fn_03004BDC+0xe28>
 300503c:	01a03002 	moveq	r3, r2
 3005040:	e58d3050 	str	r3, [sp, #80]	@ 0x50
 3005044:	e59f39f0 	ldr	r3, [pc, #2544]	@ 3005a3c <fn_03004BDC+0xe60>
 3005048:	e58d3044 	str	r3, [sp, #68]	@ 0x44
 300504c:	e59f39ac 	ldr	r3, [pc, #2476]	@ 3005a00 <fn_03004BDC+0xe24>
 3005050:	e59101b4 	ldr	r0, [r1, #436]	@ 0x1b4
 3005054:	e59330c0 	ldr	r3, [r3, #192]	@ 0xc0
 3005058:	e7939100 	ldr	r9, [r3, r0, lsl #2]
 300505c:	e3590000 	cmp	r9, #0
 3005060:	0a000036 	beq	3005140 <fn_03004BDC+0x564>
 3005064:	e1550007 	cmp	r5, r7
 3005068:	e58d5038 	str	r5, [sp, #56]	@ 0x38
 300506c:	d59f89cc 	ldrle	r8, [pc, #2508]	@ 3005a40 <fn_03004BDC+0xe64>
 3005070:	d0846085 	addle	r6, r4, r5, lsl #1
 3005074:	da000005 	ble	3005090 <fn_03004BDC+0x4b4>
 3005078:	eaffffa7 	b	3004f1c <fn_03004BDC+0x340>
 300507c:	e2855001 	add	r5, r5, #1
 3005080:	e1550007 	cmp	r5, r7
 3005084:	e58d5038 	str	r5, [sp, #56]	@ 0x38
 3005088:	e2866002 	add	r6, r6, #2
 300508c:	caffffa2 	bgt	3004f1c <fn_03004BDC+0x340>
 3005090:	e5d63014 	ldrb	r3, [r6, #20]
 3005094:	e35300ff 	cmp	r3, #255	@ 0xff
 3005098:	e58d303c 	str	r3, [sp, #60]	@ 0x3c
 300509c:	0afffff6 	beq	300507c <fn_03004BDC+0x4a0>
 30050a0:	e5d62015 	ldrb	r2, [r6, #21]
 30050a4:	e1530002 	cmp	r3, r2
 30050a8:	e58d2040 	str	r2, [sp, #64]	@ 0x40
 30050ac:	cafffff2 	bgt	300507c <fn_03004BDC+0x4a0>
 30050b0:	e59f0948 	ldr	r0, [pc, #2376]	@ 3005a00 <fn_03004BDC+0xe24>
 30050b4:	e28530f8 	add	r3, r5, #248	@ 0xf8
 30050b8:	e7982103 	ldr	r2, [r8, r3, lsl #2]
 30050bc:	e5901008 	ldr	r1, [r0, #8]
 30050c0:	e1d930b4 	ldrh	r3, [r9, #4]
 30050c4:	e0822001 	add	r2, r2, r1
 30050c8:	e0033b22 	and	r3, r3, r2, lsr #22
 30050cc:	e599100c 	ldr	r1, [r9, #12]
 30050d0:	e1a03083 	lsl	r3, r3, #1
 30050d4:	e19120b3 	ldrh	r2, [r1, r3]
 30050d8:	e59030c4 	ldr	r3, [r0, #196]	@ 0xc4
 30050dc:	e28d0038 	add	r0, sp, #56	@ 0x38
 30050e0:	e0833382 	add	r3, r3, r2, lsl #7
 30050e4:	e58d304c 	str	r3, [sp, #76]	@ 0x4c
 30050e8:	ebfff1b8 	bl	30017d0 <fn_030017D0>
 30050ec:	e1d470fa 	ldrsh	r7, [r4, #10]
 30050f0:	eaffffe1 	b	300507c <fn_03004BDC+0x4a0>
 30050f4:	e3510010 	cmp	r1, #16
 30050f8:	12813001 	addne	r3, r1, #1
 30050fc:	0affff1d 	beq	3004d78 <fn_03004BDC+0x19c>
 3005100:	e59f28f8 	ldr	r2, [pc, #2296]	@ 3005a00 <fn_03004BDC+0xe24>
 3005104:	e0821181 	add	r1, r2, r1, lsl #3
 3005108:	e5823224 	str	r3, [r2, #548]	@ 0x224
 300510c:	e5818228 	str	r8, [r1, #552]	@ 0x228
 3005110:	e581922c 	str	r9, [r1, #556]	@ 0x22c
 3005114:	eaffff17 	b	3004d78 <fn_03004BDC+0x19c>
 3005118:	e59f38e0 	ldr	r3, [pc, #2272]	@ 3005a00 <fn_03004BDC+0xe24>
 300511c:	e1d410f6 	ldrsh	r1, [r4, #6]
 3005120:	e5933100 	ldr	r3, [r3, #256]	@ 0x100
 3005124:	e0833241 	add	r3, r3, r1, asr #4
 3005128:	e1c33fc3 	bic	r3, r3, r3, asr #31
 300512c:	e353000f 	cmp	r3, #15
 3005130:	a3a0300f 	movge	r3, #15
 3005134:	e59f2908 	ldr	r2, [pc, #2312]	@ 3005a44 <fn_03004BDC+0xe68>
 3005138:	e0823383 	add	r3, r2, r3, lsl #7
 300513c:	eaffff36 	b	3004e1c <fn_03004BDC+0x240>
 3005140:	e59f3900 	ldr	r3, [pc, #2304]	@ 3005a48 <fn_03004BDC+0xe6c>
 3005144:	e1a0e00f 	mov	lr, pc
 3005148:	e12fff13 	bx	r3
 300514c:	e1d450f8 	ldrsh	r5, [r4, #8]
 3005150:	e1a09000 	mov	r9, r0
 3005154:	e1d470fa 	ldrsh	r7, [r4, #10]
 3005158:	eaffffc1 	b	3005064 <fn_03004BDC+0x488>
 300515c:	e59f08e8 	ldr	r0, [pc, #2280]	@ 3005a4c <fn_03004BDC+0xe70>
 3005160:	eaffff27 	b	3004e04 <fn_03004BDC+0x228>
 3005164:	e3a03001 	mov	r3, #1
 3005168:	eaffffe4 	b	3005100 <fn_03004BDC+0x524>
 300516c:	e59f08dc 	ldr	r0, [pc, #2268]	@ 3005a50 <fn_03004BDC+0xe74>
 3005170:	eaffff23 	b	3004e04 <fn_03004BDC+0x228>
 3005174:	e3720001 	cmn	r2, #1
 3005178:	0a0001f9 	beq	3005964 <fn_03004BDC+0xd88>
 300517c:	e5953000 	ldr	r3, [r5]
 3005180:	e1530002 	cmp	r3, r2
 3005184:	0a000213 	beq	30059d8 <fn_03004BDC+0xdfc>
 3005188:	e3a03000 	mov	r3, #0
 300518c:	e5cd3021 	strb	r3, [sp, #33]	@ 0x21
 3005190:	e3e03000 	mvn	r3, #0
 3005194:	e5951004 	ldr	r1, [r5, #4]
 3005198:	e1510002 	cmp	r1, r2
 300519c:	03a02001 	moveq	r2, #1
 30051a0:	05cd2021 	strbeq	r2, [sp, #33]	@ 0x21
 30051a4:	03e02000 	mvneq	r2, #0
 30051a8:	e58d2034 	str	r2, [sp, #52]	@ 0x34
 30051ac:	e58d3030 	str	r3, [sp, #48]	@ 0x30
 30051b0:	e28d4030 	add	r4, sp, #48	@ 0x30
 30051b4:	e4946004 	ldr	r6, [r4], #4
 30051b8:	e3760001 	cmn	r6, #1
 30051bc:	0a000006 	beq	30051dc <fn_03004BDC+0x600>
 30051c0:	e5dd3020 	ldrb	r3, [sp, #32]
 30051c4:	e3530000 	cmp	r3, #0
 30051c8:	0a0001e9 	beq	3005974 <fn_03004BDC+0xd98>
 30051cc:	e5dd3021 	ldrb	r3, [sp, #33]	@ 0x21
 30051d0:	e3530000 	cmp	r3, #0
 30051d4:	03a05001 	moveq	r5, #1
 30051d8:	0a0001e6 	beq	3005978 <fn_03004BDC+0xd9c>
 30051dc:	e28d3038 	add	r3, sp, #56	@ 0x38
 30051e0:	e1540003 	cmp	r4, r3
 30051e4:	1afffff2 	bne	30051b4 <fn_03004BDC+0x5d8>
 30051e8:	e59f3810 	ldr	r3, [pc, #2064]	@ 3005a00 <fn_03004BDC+0xe24>
 30051ec:	e5931120 	ldr	r1, [r3, #288]	@ 0x120
 30051f0:	e2885d46 	add	r5, r8, #4480	@ 0x1180
 30051f4:	e3510000 	cmp	r1, #0
 30051f8:	e285502c 	add	r5, r5, #44	@ 0x2c
 30051fc:	0a000180 	beq	3005804 <fn_03004BDC+0xc28>
 3005200:	e2513001 	subs	r3, r1, #1
 3005204:	4a00000a 	bmi	3005234 <fn_03004BDC+0x658>
 3005208:	e0812081 	add	r2, r1, r1, lsl #1
 300520c:	e0882202 	add	r2, r8, r2, lsl #4
 3005210:	e2822c43 	add	r2, r2, #17152	@ 0x4300
 3005214:	e59fc824 	ldr	ip, [pc, #2084]	@ 3005a40 <fn_03004BDC+0xe64>
 3005218:	e28220a0 	add	r2, r2, #160	@ 0xa0
 300521c:	e08c0103 	add	r0, ip, r3, lsl #2
 3005220:	e2433001 	sub	r3, r3, #1
 3005224:	e3730001 	cmn	r3, #1
 3005228:	e58026b4 	str	r2, [r0, #1716]	@ 0x6b4
 300522c:	e2422030 	sub	r2, r2, #48	@ 0x30
 3005230:	1afffff9 	bne	300521c <fn_03004BDC+0x640>
 3005234:	e59f3818 	ldr	r3, [pc, #2072]	@ 3005a54 <fn_03004BDC+0xe78>
 3005238:	e59f0818 	ldr	r0, [pc, #2072]	@ 3005a58 <fn_03004BDC+0xe7c>
 300523c:	e3a02004 	mov	r2, #4
 3005240:	e59f4814 	ldr	r4, [pc, #2068]	@ 3005a5c <fn_03004BDC+0xe80>
 3005244:	e1a0e00f 	mov	lr, pc
 3005248:	e12fff14 	bx	r4
 300524c:	e59f37ac 	ldr	r3, [pc, #1964]	@ 3005a00 <fn_03004BDC+0xe24>
 3005250:	e5930120 	ldr	r0, [r3, #288]	@ 0x120
 3005254:	e3500000 	cmp	r0, #0
 3005258:	e59331ac 	ldr	r3, [r3, #428]	@ 0x1ac
 300525c:	0a000102 	beq	300566c <fn_03004BDC+0xa90>
 3005260:	e59f27b0 	ldr	r2, [pc, #1968]	@ 3005a18 <fn_03004BDC+0xe3c>
 3005264:	e5922000 	ldr	r2, [r2]
 3005268:	e282ad46 	add	sl, r2, #4480	@ 0x1180
 300526c:	e28a102c 	add	r1, sl, #44	@ 0x2c
 3005270:	e1510003 	cmp	r1, r3
 3005274:	e3a04000 	mov	r4, #0
 3005278:	2a00002f 	bcs	300533c <fn_03004BDC+0x760>
 300527c:	e59fc7dc 	ldr	ip, [pc, #2012]	@ 3005a60 <fn_03004BDC+0xe84>
 3005280:	e59f87b0 	ldr	r8, [pc, #1968]	@ 3005a38 <fn_03004BDC+0xe5c>
 3005284:	e59fb7b4 	ldr	fp, [pc, #1972]	@ 3005a40 <fn_03004BDC+0xe64>
 3005288:	e58d5008 	str	r5, [sp, #8]
 300528c:	e58d000c 	str	r0, [sp, #12]
 3005290:	e04c9002 	sub	r9, ip, r2
 3005294:	e5912014 	ldr	r2, [r1, #20]
 3005298:	e088c104 	add	ip, r8, r4, lsl #2
 300529c:	e3520000 	cmp	r2, #0
 30052a0:	e5916028 	ldr	r6, [r1, #40]	@ 0x28
 30052a4:	e28cca02 	add	ip, ip, #8192	@ 0x2000
 30052a8:	1a000001 	bne	30052b4 <fn_03004BDC+0x6d8>
 30052ac:	e3560000 	cmp	r6, #0
 30052b0:	0a00001c 	beq	3005328 <fn_03004BDC+0x74c>
 30052b4:	e1d120f4 	ldrsh	r2, [r1, #4]
 30052b8:	e1d100f6 	ldrsh	r0, [r1, #6]
 30052bc:	e26220ff 	rsb	r2, r2, #255	@ 0xff
 30052c0:	e1822800 	orr	r2, r2, r0, lsl #16
 30052c4:	e58c2000 	str	r2, [ip]
 30052c8:	e591200c 	ldr	r2, [r1, #12]
 30052cc:	e5915008 	ldr	r5, [r1, #8]
 30052d0:	e1550002 	cmp	r5, r2
 30052d4:	d1a07002 	movle	r7, r2
 30052d8:	c1a07005 	movgt	r7, r5
 30052dc:	c1a05002 	movgt	r5, r2
 30052e0:	e2566000 	subs	r6, r6, #0
 30052e4:	13a06001 	movne	r6, #1
 30052e8:	e0812009 	add	r2, r1, r9
 30052ec:	e1a02142 	asr	r2, r2, #2
 30052f0:	e0620282 	rsb	r0, r2, r2, lsl #5
 30052f4:	e0820280 	add	r0, r2, r0, lsl #5
 30052f8:	e0800180 	add	r0, r0, r0, lsl #3
 30052fc:	e0600780 	rsb	r0, r0, r0, lsl #15
 3005300:	e284ee41 	add	lr, r4, #1040	@ 0x410
 3005304:	e0822100 	add	r2, r2, r0, lsl #2
 3005308:	e28ee008 	add	lr, lr, #8
 300530c:	e2622000 	rsb	r2, r2, #0
 3005310:	e08be08e 	add	lr, fp, lr, lsl #1
 3005314:	e1822786 	orr	r2, r2, r6, lsl #15
 3005318:	e58c5300 	str	r5, [ip, #768]	@ 0x300
 300531c:	e58c7600 	str	r7, [ip, #1536]	@ 0x600
 3005320:	e1ce20b4 	strh	r2, [lr, #4]
 3005324:	e2844001 	add	r4, r4, #1
 3005328:	e281102c 	add	r1, r1, #44	@ 0x2c
 300532c:	e1510003 	cmp	r1, r3
 3005330:	3affffd7 	bcc	3005294 <fn_03004BDC+0x6b8>
 3005334:	e59d5008 	ldr	r5, [sp, #8]
 3005338:	e59d000c 	ldr	r0, [sp, #12]
 300533c:	e2502001 	subs	r2, r0, #1
 3005340:	e58d2018 	str	r2, [sp, #24]
 3005344:	e59f26b4 	ldr	r2, [pc, #1716]	@ 3005a00 <fn_03004BDC+0xe24>
 3005348:	e58242a8 	str	r4, [r2, #680]	@ 0x2a8
 300534c:	4a0000c6 	bmi	300566c <fn_03004BDC+0xa90>
 3005350:	e1a0700a 	mov	r7, sl
 3005354:	e59fb6e4 	ldr	fp, [pc, #1764]	@ 3005a40 <fn_03004BDC+0xe64>
 3005358:	e58d501c 	str	r5, [sp, #28]
 300535c:	e59d3018 	ldr	r3, [sp, #24]
 3005360:	e08b3103 	add	r3, fp, r3, lsl #2
 3005364:	e593a6b4 	ldr	sl, [r3, #1716]	@ 0x6b4
 3005368:	e1da50f0 	ldrsh	r5, [sl]
 300536c:	e1da60f2 	ldrsh	r6, [sl, #2]
 3005370:	e1550006 	cmp	r5, r6
 3005374:	e59a9014 	ldr	r9, [sl, #20]
 3005378:	ca000011 	bgt	30053c4 <fn_03004BDC+0x7e8>
 300537c:	e1a08085 	lsl	r8, r5, #1
 3005380:	e2862001 	add	r2, r6, #1
 3005384:	e2888407 	add	r8, r8, #117440512	@ 0x7000000
 3005388:	e0422005 	sub	r2, r2, r5
 300538c:	e59f36d0 	ldr	r3, [pc, #1744]	@ 3005a64 <fn_03004BDC+0xe88>
 3005390:	e1a02082 	lsl	r2, r2, #1
 3005394:	e2880e2d 	add	r0, r8, #720	@ 0x2d0
 3005398:	e3a010ff 	mov	r1, #255	@ 0xff
 300539c:	e1a0e00f 	mov	lr, pc
 30053a0:	e12fff13 	bx	r3
 30053a4:	e3a02080 	mov	r2, #128	@ 0x80
 30053a8:	e286350e 	add	r3, r6, #58720256	@ 0x3800000
 30053ac:	e28330f1 	add	r3, r3, #241	@ 0xf1
 30053b0:	e2888e1e 	add	r8, r8, #480	@ 0x1e0
 30053b4:	e1a03083 	lsl	r3, r3, #1
 30053b8:	e0c820b2 	strh	r2, [r8], #2
 30053bc:	e1530008 	cmp	r3, r8
 30053c0:	1afffffc 	bne	30053b8 <fn_03004BDC+0x7dc>
 30053c4:	e287302c 	add	r3, r7, #44	@ 0x2c
 30053c8:	e58d300c 	str	r3, [sp, #12]
 30053cc:	e59f3694 	ldr	r3, [pc, #1684]	@ 3005a68 <fn_03004BDC+0xe8c>
 30053d0:	e0834104 	add	r4, r3, r4, lsl #2
 30053d4:	e26630ff 	rsb	r3, r6, #255	@ 0xff
 30053d8:	e1833805 	orr	r3, r3, r5, lsl #16
 30053dc:	e58d3008 	str	r3, [sp, #8]
 30053e0:	e1a00004 	mov	r0, r4
 30053e4:	e59d1008 	ldr	r1, [sp, #8]
 30053e8:	ebfff0c7 	bl	300170c <fn_0300170C>
 30053ec:	e2504000 	subs	r4, r0, #0
 30053f0:	0a00006e 	beq	30055b0 <fn_03004BDC+0x9d4>
 30053f4:	e59f3670 	ldr	r3, [pc, #1648]	@ 3005a6c <fn_03004BDC+0xe90>
 30053f8:	e5942000 	ldr	r2, [r4]
 30053fc:	e0843003 	add	r3, r4, r3
 3005400:	e1a03143 	asr	r3, r3, #2
 3005404:	e1a00802 	lsl	r0, r2, #16
 3005408:	e2833e41 	add	r3, r3, #1040	@ 0x410
 300540c:	e2833008 	add	r3, r3, #8
 3005410:	e1a00820 	lsr	r0, r0, #16
 3005414:	e26000ff 	rsb	r0, r0, #255	@ 0xff
 3005418:	e08b3083 	add	r3, fp, r3, lsl #1
 300541c:	e1500005 	cmp	r0, r5
 3005420:	e1a02822 	lsr	r2, r2, #16
 3005424:	e1d310f4 	ldrsh	r1, [r3, #4]
 3005428:	a1a08000 	movge	r8, r0
 300542c:	b1a08005 	movlt	r8, r5
 3005430:	e1520006 	cmp	r2, r6
 3005434:	b1a07002 	movlt	r7, r2
 3005438:	e1a03881 	lsl	r3, r1, #17
 300543c:	e5942600 	ldr	r2, [r4, #1536]	@ 0x600
 3005440:	e1a038a3 	lsr	r3, r3, #17
 3005444:	a1a07006 	movge	r7, r6
 3005448:	e59dc00c 	ldr	ip, [sp, #12]
 300544c:	e1590002 	cmp	r9, r2
 3005450:	e0832103 	add	r2, r3, r3, lsl #2
 3005454:	e0833082 	add	r3, r3, r2, lsl #1
 3005458:	e08c0103 	add	r0, ip, r3, lsl #2
 300545c:	ca00004d 	bgt	3005598 <fn_03004BDC+0x9bc>
 3005460:	e5942300 	ldr	r2, [r4, #768]	@ 0x300
 3005464:	e1590002 	cmp	r9, r2
 3005468:	da00001e 	ble	30054e8 <fn_03004BDC+0x90c>
 300546c:	e79c3103 	ldr	r3, [ip, r3, lsl #2]
 3005470:	e59a2004 	ldr	r2, [sl, #4]
 3005474:	e1d3c0f4 	ldrsh	ip, [r3, #4]
 3005478:	e58d2010 	str	r2, [sp, #16]
 300547c:	e1d320f0 	ldrsh	r2, [r3]
 3005480:	e1d3e0f2 	ldrsh	lr, [r3, #2]
 3005484:	e1d330f6 	ldrsh	r3, [r3, #6]
 3005488:	e05cc002 	subs	ip, ip, r2
 300548c:	e58dc014 	str	ip, [sp, #20]
 3005490:	e043300e 	sub	r3, r3, lr
 3005494:	0a000037 	beq	3005578 <fn_03004BDC+0x99c>
 3005498:	e3530000 	cmp	r3, #0
 300549c:	e59ac008 	ldr	ip, [sl, #8]
 30054a0:	0a000054 	beq	30055f8 <fn_03004BDC+0xa1c>
 30054a4:	e04ce80e 	sub	lr, ip, lr, lsl #16
 30054a8:	e59dc010 	ldr	ip, [sp, #16]
 30054ac:	e04c2802 	sub	r2, ip, r2, lsl #16
 30054b0:	e58d2010 	str	r2, [sp, #16]
 30054b4:	e59d2014 	ldr	r2, [sp, #20]
 30054b8:	e0ccee92 	smull	lr, ip, r2, lr
 30054bc:	e58dc014 	str	ip, [sp, #20]
 30054c0:	e1a0c003 	mov	ip, r3
 30054c4:	e59d2010 	ldr	r2, [sp, #16]
 30054c8:	e0c3229c 	smull	r2, r3, ip, r2
 30054cc:	e59dc014 	ldr	ip, [sp, #20]
 30054d0:	e1a0e82e 	lsr	lr, lr, #16
 30054d4:	e1a02822 	lsr	r2, r2, #16
 30054d8:	e18ee80c 	orr	lr, lr, ip, lsl #16
 30054dc:	e1822803 	orr	r2, r2, r3, lsl #16
 30054e0:	e15e0002 	cmp	lr, r2
 30054e4:	ba00002b 	blt	3005598 <fn_03004BDC+0x9bc>
 30054e8:	e5902014 	ldr	r2, [r0, #20]
 30054ec:	e3120001 	tst	r2, #1
 30054f0:	e59a100c 	ldr	r1, [sl, #12]
 30054f4:	0a000002 	beq	3005504 <fn_03004BDC+0x928>
 30054f8:	e5903018 	ldr	r3, [r0, #24]
 30054fc:	e1530001 	cmp	r3, r1
 3005500:	ca000041 	bgt	300560c <fn_03004BDC+0xa30>
 3005504:	e3120002 	tst	r2, #2
 3005508:	0affffb4 	beq	30053e0 <fn_03004BDC+0x804>
 300550c:	e59a3024 	ldr	r3, [sl, #36]	@ 0x24
 3005510:	e1d330f6 	ldrsh	r3, [r3, #6]
 3005514:	e0811803 	add	r1, r1, r3, lsl #16
 3005518:	e590301c 	ldr	r3, [r0, #28]
 300551c:	e1510003 	cmp	r1, r3
 3005520:	daffffae 	ble	30053e0 <fn_03004BDC+0x804>
 3005524:	e1580007 	cmp	r8, r7
 3005528:	caffffac 	bgt	30053e0 <fn_03004BDC+0x804>
 300552c:	e59f153c 	ldr	r1, [pc, #1340]	@ 3005a70 <fn_03004BDC+0xe94>
 3005530:	e288350e 	add	r3, r8, #58720256	@ 0x3800000
 3005534:	e2833f5a 	add	r3, r3, #360	@ 0x168
 3005538:	e0871001 	add	r1, r7, r1
 300553c:	e1a03083 	lsl	r3, r3, #1
 3005540:	e1a01081 	lsl	r1, r1, #1
 3005544:	e1d320f0 	ldrsh	r2, [r3]
 3005548:	e3720001 	cmn	r2, #1
 300554c:	1a000005 	bne	3005568 <fn_03004BDC+0x98c>
 3005550:	e5902020 	ldr	r2, [r0, #32]
 3005554:	e0822003 	add	r2, r2, r3
 3005558:	e28224f9 	add	r2, r2, #-117440512	@ 0xf9000000
 300555c:	e2422e2d 	sub	r2, r2, #720	@ 0x2d0
 3005560:	e1d220f0 	ldrsh	r2, [r2]
 3005564:	e1c320b0 	strh	r2, [r3]
 3005568:	e2833002 	add	r3, r3, #2
 300556c:	e1510003 	cmp	r1, r3
 3005570:	1afffff3 	bne	3005544 <fn_03004BDC+0x968>
 3005574:	eaffff99 	b	30053e0 <fn_03004BDC+0x804>
 3005578:	e59dc010 	ldr	ip, [sp, #16]
 300557c:	e15c0802 	cmp	ip, r2, lsl #16
 3005580:	ca00001f 	bgt	3005604 <fn_03004BDC+0xa28>
 3005584:	e3530000 	cmp	r3, #0
 3005588:	d3a03000 	movle	r3, #0
 300558c:	c3a03001 	movgt	r3, #1
 3005590:	e3530000 	cmp	r3, #0
 3005594:	1affffd3 	bne	30054e8 <fn_03004BDC+0x90c>
 3005598:	e3510000 	cmp	r1, #0
 300559c:	aaffff8f 	bge	30053e0 <fn_03004BDC+0x804>
 30055a0:	e1a02007 	mov	r2, r7
 30055a4:	e1a01008 	mov	r1, r8
 30055a8:	ebfff138 	bl	3001a90 <fn_03001A90>
 30055ac:	eaffff8b 	b	30053e0 <fn_03004BDC+0x804>
 30055b0:	e59f346c 	ldr	r3, [pc, #1132]	@ 3005a24 <fn_03004BDC+0xe48>
 30055b4:	e59f1444 	ldr	r1, [pc, #1092]	@ 3005a00 <fn_03004BDC+0xe24>
 30055b8:	e59f2460 	ldr	r2, [pc, #1120]	@ 3005a20 <fn_03004BDC+0xe44>
 30055bc:	e1a0000a 	mov	r0, sl
 30055c0:	e58130f0 	str	r3, [r1, #240]	@ 0xf0
 30055c4:	e58120ec 	str	r2, [r1, #236]	@ 0xec
 30055c8:	ebfff2dd 	bl	3002144 <fn_03002144>
 30055cc:	e59d3018 	ldr	r3, [sp, #24]
 30055d0:	e2433001 	sub	r3, r3, #1
 30055d4:	e3730001 	cmn	r3, #1
 30055d8:	e58d3018 	str	r3, [sp, #24]
 30055dc:	0a00001f 	beq	3005660 <fn_03004BDC+0xa84>
 30055e0:	e59f3430 	ldr	r3, [pc, #1072]	@ 3005a18 <fn_03004BDC+0xe3c>
 30055e4:	e593a000 	ldr	sl, [r3]
 30055e8:	e59f3410 	ldr	r3, [pc, #1040]	@ 3005a00 <fn_03004BDC+0xe24>
 30055ec:	e28a7d46 	add	r7, sl, #4480	@ 0x1180
 30055f0:	e59342a8 	ldr	r4, [r3, #680]	@ 0x2a8
 30055f4:	eaffff58 	b	300535c <fn_03004BDC+0x780>
 30055f8:	e15c080e 	cmp	ip, lr, lsl #16
 30055fc:	e59d3014 	ldr	r3, [sp, #20]
 3005600:	caffffdf 	bgt	3005584 <fn_03004BDC+0x9a8>
 3005604:	e1a03fa3 	lsr	r3, r3, #31
 3005608:	eaffffe0 	b	3005590 <fn_03004BDC+0x9b4>
 300560c:	e1580007 	cmp	r8, r7
 3005610:	caffffbb 	bgt	3005504 <fn_03004BDC+0x928>
 3005614:	e288350e 	add	r3, r8, #58720256	@ 0x3800000
 3005618:	e287e50e 	add	lr, r7, #58720256	@ 0x3800000
 300561c:	e28330f0 	add	r3, r3, #240	@ 0xf0
 3005620:	e28ee0f1 	add	lr, lr, #241	@ 0xf1
 3005624:	e1a03083 	lsl	r3, r3, #1
 3005628:	e1a0e08e 	lsl	lr, lr, #1
 300562c:	e1d3c0f0 	ldrsh	ip, [r3]
 3005630:	e35c0080 	cmp	ip, #128	@ 0x80
 3005634:	1a000005 	bne	3005650 <fn_03004BDC+0xa74>
 3005638:	e590c024 	ldr	ip, [r0, #36]	@ 0x24
 300563c:	e08cc003 	add	ip, ip, r3
 3005640:	e28cc4f9 	add	ip, ip, #-117440512	@ 0xf9000000
 3005644:	e24cce1e 	sub	ip, ip, #480	@ 0x1e0
 3005648:	e1dcc0f0 	ldrsh	ip, [ip]
 300564c:	e1c3c0b0 	strh	ip, [r3]
 3005650:	e2833002 	add	r3, r3, #2
 3005654:	e15e0003 	cmp	lr, r3
 3005658:	1afffff3 	bne	300562c <fn_03004BDC+0xa50>
 300565c:	eaffffa8 	b	3005504 <fn_03004BDC+0x928>
 3005660:	e59f3398 	ldr	r3, [pc, #920]	@ 3005a00 <fn_03004BDC+0xe24>
 3005664:	e59d501c 	ldr	r5, [sp, #28]
 3005668:	e59331ac 	ldr	r3, [r3, #428]	@ 0x1ac
 300566c:	e1550003 	cmp	r5, r3
 3005670:	2a00000a 	bcs	30056a0 <fn_03004BDC+0xac4>
 3005674:	e243402c 	sub	r4, r3, #44	@ 0x2c
 3005678:	e5943028 	ldr	r3, [r4, #40]	@ 0x28
 300567c:	e3530000 	cmp	r3, #0
 3005680:	11a00004 	movne	r0, r4
 3005684:	11d420f6 	ldrshne	r2, [r4, #6]
 3005688:	11d410f4 	ldrshne	r1, [r4, #4]
 300568c:	1bfff0ff 	blne	3001a90 <fn_03001A90>
 3005690:	e244402c 	sub	r4, r4, #44	@ 0x2c
 3005694:	e284302c 	add	r3, r4, #44	@ 0x2c
 3005698:	e1550003 	cmp	r5, r3
 300569c:	3afffff5 	bcc	3005678 <fn_03004BDC+0xa9c>
 30056a0:	e59f3370 	ldr	r3, [pc, #880]	@ 3005a18 <fn_03004BDC+0xe3c>
 30056a4:	e5933000 	ldr	r3, [r3]
 30056a8:	e59320e0 	ldr	r2, [r3, #224]	@ 0xe0
 30056ac:	e592202c 	ldr	r2, [r2, #44]	@ 0x2c
 30056b0:	e5d22026 	ldrb	r2, [r2, #38]	@ 0x26
 30056b4:	e58d2008 	str	r2, [sp, #8]
 30056b8:	e3a02407 	mov	r2, #117440512	@ 0x7000000
 30056bc:	e3a09a06 	mov	r9, #24576	@ 0x6000
 30056c0:	e59f1338 	ldr	r1, [pc, #824]	@ 3005a00 <fn_03004BDC+0xe24>
 30056c4:	e58120ec 	str	r2, [r1, #236]	@ 0xec
 30056c8:	e28220f0 	add	r2, r2, #240	@ 0xf0
 30056cc:	e58120f0 	str	r2, [r1, #240]	@ 0xf0
 30056d0:	e59fb35c 	ldr	fp, [pc, #860]	@ 3005a34 <fn_03004BDC+0xe58>
 30056d4:	e2834f71 	add	r4, r3, #452	@ 0x1c4
 30056d8:	e283af79 	add	sl, r3, #484	@ 0x1e4
 30056dc:	e5143010 	ldr	r3, [r4, #-16]
 30056e0:	e3530000 	cmp	r3, #0
 30056e4:	0a00003c 	beq	30057dc <fn_03004BDC+0xc00>
 30056e8:	e59f2328 	ldr	r2, [pc, #808]	@ 3005a18 <fn_03004BDC+0xe3c>
 30056ec:	e5927000 	ldr	r7, [r2]
 30056f0:	e1d360b2 	ldrh	r6, [r3, #2]
 30056f4:	e1d320b0 	ldrh	r2, [r3]
 30056f8:	e2873901 	add	r3, r7, #16384	@ 0x4000
 30056fc:	e59331b8 	ldr	r3, [r3, #440]	@ 0x1b8
 3005700:	e0833182 	add	r3, r3, r2, lsl #3
 3005704:	e5935004 	ldr	r5, [r3, #4]
 3005708:	e1a03886 	lsl	r3, r6, #17
 300570c:	e1a038a3 	lsr	r3, r3, #17
 3005710:	e0833183 	add	r3, r3, r3, lsl #3
 3005714:	e1a02083 	lsl	r2, r3, #1
 3005718:	e19500f2 	ldrsh	r0, [r5, r2]
 300571c:	e0855083 	add	r5, r5, r3, lsl #1
 3005720:	e2873a01 	add	r3, r7, #4096	@ 0x1000
 3005724:	e5933108 	ldr	r3, [r3, #264]	@ 0x108
 3005728:	e0800003 	add	r0, r0, r3
 300572c:	e1a0e00f 	mov	lr, pc
 3005730:	e12fff1b 	bx	fp
 3005734:	e5143008 	ldr	r3, [r4, #-8]
 3005738:	e1d010f4 	ldrsh	r1, [r0, #4]
 300573c:	e243360a 	sub	r3, r3, #10485760	@ 0xa00000
 3005740:	e0433801 	sub	r3, r3, r1, lsl #16
 3005744:	e1d010f0 	ldrsh	r1, [r0]
 3005748:	e083c801 	add	ip, r3, r1, lsl #16
 300574c:	e0ce3399 	smull	r3, lr, r9, r3
 3005750:	e1a03823 	lsr	r3, r3, #16
 3005754:	e183380e 	orr	r3, r3, lr, lsl #16
 3005758:	e0cecc99 	smull	ip, lr, r9, ip
 300575c:	e597211c 	ldr	r2, [r7, #284]	@ 0x11c
 3005760:	e1a0c82c 	lsr	ip, ip, #16
 3005764:	e18cc80e 	orr	ip, ip, lr, lsl #16
 3005768:	e3520080 	cmp	r2, #128	@ 0x80
 300576c:	e1a01801 	lsl	r1, r1, #16
 3005770:	e283370f 	add	r3, r3, #3932160	@ 0x3c0000
 3005774:	e28cc70f 	add	ip, ip, #3932160	@ 0x3c0000
 3005778:	ca00001d 	bgt	30057f4 <fn_03004BDC+0xc18>
 300577c:	e2127008 	ands	r7, r2, #8
 3005780:	1a00001b 	bne	30057f4 <fn_03004BDC+0xc18>
 3005784:	e59f2274 	ldr	r2, [pc, #628]	@ 3005a00 <fn_03004BDC+0xe24>
 3005788:	e5d2210c 	ldrb	r2, [r2, #268]	@ 0x10c
 300578c:	e3520000 	cmp	r2, #0
 3005790:	03a0e902 	moveq	lr, #32768	@ 0x8000
 3005794:	13a0e901 	movne	lr, #16384	@ 0x4000
 3005798:	13a02903 	movne	r2, #49152	@ 0xc000
 300579c:	01a0200e 	moveq	r2, lr
 30057a0:	e0438002 	sub	r8, r3, r2
 30057a4:	e04c200e 	sub	r2, ip, lr
 30057a8:	e2822cff 	add	r2, r2, #65280	@ 0xff00
 30057ac:	e288ccff 	add	ip, r8, #65280	@ 0xff00
 30057b0:	e28cc0ff 	add	ip, ip, #255	@ 0xff
 30057b4:	e28220ff 	add	r2, r2, #255	@ 0xff
 30057b8:	e1a0c84c 	asr	ip, ip, #16
 30057bc:	e1a02842 	asr	r2, r2, #16
 30057c0:	e1cc8fcc 	bic	r8, ip, ip, asr #31
 30057c4:	e2422001 	sub	r2, r2, #1
 30057c8:	e35c0077 	cmp	ip, #119	@ 0x77
 30057cc:	d1580002 	cmple	r8, r2
 30057d0:	c3a0c001 	movgt	ip, #1
 30057d4:	d3a0c000 	movle	ip, #0
 30057d8:	da00000c 	ble	3005810 <fn_03004BDC+0xc34>
 30057dc:	e2844010 	add	r4, r4, #16
 30057e0:	e154000a 	cmp	r4, sl
 30057e4:	1affffbc 	bne	30056dc <fn_03004BDC+0xb00>
 30057e8:	e28dd06c 	add	sp, sp, #108	@ 0x6c
 30057ec:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 30057f0:	e12fff1e 	bx	lr
 30057f4:	e3a0e902 	mov	lr, #32768	@ 0x8000
 30057f8:	e3a07001 	mov	r7, #1
 30057fc:	e1a0200e 	mov	r2, lr
 3005800:	eaffffe6 	b	30057a0 <fn_03004BDC+0xbc4>
 3005804:	e59f31f4 	ldr	r3, [pc, #500]	@ 3005a00 <fn_03004BDC+0xe24>
 3005808:	e59331ac 	ldr	r3, [r3, #428]	@ 0x1ac
 300580c:	eaffff96 	b	300566c <fn_03004BDC+0xa90>
 3005810:	e3520077 	cmp	r2, #119	@ 0x77
 3005814:	a3a02077 	movge	r2, #119	@ 0x77
 3005818:	e08ee808 	add	lr, lr, r8, lsl #16
 300581c:	e58dc060 	str	ip, [sp, #96]	@ 0x60
 3005820:	e1cd23ba 	strh	r2, [sp, #58]	@ 0x3a
 3005824:	e5d5c010 	ldrb	ip, [r5, #16]
 3005828:	e59f2244 	ldr	r2, [pc, #580]	@ 3005a74 <fn_03004BDC+0xe98>
 300582c:	e04e3003 	sub	r3, lr, r3
 3005830:	e31c0001 	tst	ip, #1
 3005834:	e0cc3392 	smull	r3, ip, r2, r3
 3005838:	e1a03823 	lsr	r3, r3, #16
 300583c:	e183380c 	orr	r3, r3, ip, lsl #16
 3005840:	e1d0e0f6 	ldrsh	lr, [r0, #6]
 3005844:	e514c004 	ldr	ip, [r4, #-4]
 3005848:	e04cc80e 	sub	ip, ip, lr, lsl #16
 300584c:	e26cc719 	rsb	ip, ip, #6553600	@ 0x640000
 3005850:	e58dc054 	str	ip, [sp, #84]	@ 0x54
 3005854:	e59fc21c 	ldr	ip, [pc, #540]	@ 3005a78 <fn_03004BDC+0xe9c>
 3005858:	159f221c 	ldrne	r2, [pc, #540]	@ 3005a7c <fn_03004BDC+0xea0>
 300585c:	12411001 	subne	r1, r1, #1
 3005860:	e58dc04c 	str	ip, [sp, #76]	@ 0x4c
 3005864:	e59fc214 	ldr	ip, [pc, #532]	@ 3005a80 <fn_03004BDC+0xea4>
 3005868:	10413003 	subne	r3, r1, r3
 300586c:	e3570000 	cmp	r7, #0
 3005870:	e58d3048 	str	r3, [sp, #72]	@ 0x48
 3005874:	e1cd83b8 	strh	r8, [sp, #56]	@ 0x38
 3005878:	13a03000 	movne	r3, #0
 300587c:	e58dc058 	str	ip, [sp, #88]	@ 0x58
 3005880:	e58d2050 	str	r2, [sp, #80]	@ 0x50
 3005884:	e58d005c 	str	r0, [sp, #92]	@ 0x5c
 3005888:	1a000004 	bne	30058a0 <fn_03004BDC+0xcc4>
 300588c:	e59f316c 	ldr	r3, [pc, #364]	@ 3005a00 <fn_03004BDC+0xe24>
 3005890:	e59330fc 	ldr	r3, [r3, #252]	@ 0xfc
 3005894:	e3530000 	cmp	r3, #0
 3005898:	159f3164 	ldrne	r3, [pc, #356]	@ 3005a04 <fn_03004BDC+0xe28>
 300589c:	0a000014 	beq	30058f4 <fn_03004BDC+0xd18>
 30058a0:	e28d0038 	add	r0, sp, #56	@ 0x38
 30058a4:	e58d3064 	str	r3, [sp, #100]	@ 0x64
 30058a8:	ebfff225 	bl	3002144 <fn_03002144>
 30058ac:	eaffffca 	b	30057dc <fn_03004BDC+0xc00>
 30058b0:	e3a00001 	mov	r0, #1
 30058b4:	e08d0100 	add	r0, sp, r0, lsl #2
 30058b8:	e5801030 	str	r1, [r0, #48]	@ 0x30
 30058bc:	e5802038 	str	r2, [r0, #56]	@ 0x38
 30058c0:	eafffdbd 	b	3004fbc <fn_03004BDC+0x3e0>
 30058c4:	e58d003c 	str	r0, [sp, #60]	@ 0x3c
 30058c8:	e59d0030 	ldr	r0, [sp, #48]	@ 0x30
 30058cc:	e58d0034 	str	r0, [sp, #52]	@ 0x34
 30058d0:	e3a00000 	mov	r0, #0
 30058d4:	eafffff6 	b	30058b4 <fn_03004BDC+0xcd8>
 30058d8:	e5950004 	ldr	r0, [r5, #4]
 30058dc:	e1500003 	cmp	r0, r3
 30058e0:	15cd1021 	strbne	r1, [sp, #33]	@ 0x21
 30058e4:	03a03001 	moveq	r3, #1
 30058e8:	05cd3021 	strbeq	r3, [sp, #33]	@ 0x21
 30058ec:	01a03002 	moveq	r3, r2
 30058f0:	eafffe2c 	b	30051a8 <fn_03004BDC+0x5cc>
 30058f4:	e3160902 	tst	r6, #32768	@ 0x8000
 30058f8:	1a00003d 	bne	30059f4 <fn_03004BDC+0xe18>
 30058fc:	e59f30fc 	ldr	r3, [pc, #252]	@ 3005a00 <fn_03004BDC+0xe24>
 3005900:	e59d2008 	ldr	r2, [sp, #8]
 3005904:	e5933100 	ldr	r3, [r3, #256]	@ 0x100
 3005908:	e0833222 	add	r3, r3, r2, lsr #4
 300590c:	e1c33fc3 	bic	r3, r3, r3, asr #31
 3005910:	e353000f 	cmp	r3, #15
 3005914:	a3a0300f 	movge	r3, #15
 3005918:	e59f1164 	ldr	r1, [pc, #356]	@ 3005a84 <fn_03004BDC+0xea8>
 300591c:	e0833103 	add	r3, r3, r3, lsl #2
 3005920:	e0813283 	add	r3, r1, r3, lsl #5
 3005924:	e59f210c 	ldr	r2, [pc, #268]	@ 3005a38 <fn_03004BDC+0xe5c>
 3005928:	e5d3309f 	ldrb	r3, [r3, #159]	@ 0x9f
 300592c:	e0823403 	add	r3, r2, r3, lsl #8
 3005930:	eaffffda 	b	30058a0 <fn_03004BDC+0xcc4>
 3005934:	e5952004 	ldr	r2, [r5, #4]
 3005938:	e1520003 	cmp	r2, r3
 300593c:	e3a02001 	mov	r2, #1
 3005940:	e5cd2020 	strb	r2, [sp, #32]
 3005944:	0a000028 	beq	30059ec <fn_03004BDC+0xe10>
 3005948:	e3e02000 	mvn	r2, #0
 300594c:	e5cd1021 	strb	r1, [sp, #33]	@ 0x21
 3005950:	eafffe14 	b	30051a8 <fn_03004BDC+0x5cc>
 3005954:	e3e03000 	mvn	r3, #0
 3005958:	e1cdc2b0 	strh	ip, [sp, #32]
 300595c:	e1a02003 	mov	r2, r3
 3005960:	eafffe10 	b	30051a8 <fn_03004BDC+0x5cc>
 3005964:	e3a03000 	mov	r3, #0
 3005968:	e5cd3021 	strb	r3, [sp, #33]	@ 0x21
 300596c:	e1a03002 	mov	r3, r2
 3005970:	eafffe0c 	b	30051a8 <fn_03004BDC+0x5cc>
 3005974:	e1a05003 	mov	r5, r3
 3005978:	e59f3108 	ldr	r3, [pc, #264]	@ 3005a88 <fn_03004BDC+0xeac>
 300597c:	e1a00006 	mov	r0, r6
 3005980:	e1a0e00f 	mov	lr, pc
 3005984:	e12fff13 	bx	r3
 3005988:	e3500a01 	cmp	r0, #4096	@ 0x1000
 300598c:	e59f30a0 	ldr	r3, [pc, #160]	@ 3005a34 <fn_03004BDC+0xe58>
 3005990:	ba00000c 	blt	30059c8 <fn_03004BDC+0xdec>
 3005994:	e1a00006 	mov	r0, r6
 3005998:	e1a0e00f 	mov	lr, pc
 300599c:	e12fff13 	bx	r3
 30059a0:	e3a02301 	mov	r2, #67108864	@ 0x4000000
 30059a4:	e1a03605 	lsl	r3, r5, #12
 30059a8:	e59fc0dc 	ldr	ip, [pc, #220]	@ 3005a8c <fn_03004BDC+0xeb0>
 30059ac:	e59f107c 	ldr	r1, [pc, #124]	@ 3005a30 <fn_03004BDC+0xe54>
 30059b0:	e2833406 	add	r3, r3, #100663296	@ 0x6000000
 30059b4:	e2833a16 	add	r3, r3, #90112	@ 0x16000
 30059b8:	e58200d4 	str	r0, [r2, #212]	@ 0xd4
 30059bc:	e58230d8 	str	r3, [r2, #216]	@ 0xd8
 30059c0:	e582c0dc 	str	ip, [r2, #220]	@ 0xdc
 30059c4:	e7816105 	str	r6, [r1, r5, lsl #2]
 30059c8:	e3a02001 	mov	r2, #1
 30059cc:	e08d3005 	add	r3, sp, r5
 30059d0:	e5c32020 	strb	r2, [r3, #32]
 30059d4:	eafffe00 	b	30051dc <fn_03004BDC+0x600>
 30059d8:	e3a03001 	mov	r3, #1
 30059dc:	e1cd32b0 	strh	r3, [sp, #32]
 30059e0:	e3e03000 	mvn	r3, #0
 30059e4:	e1a02003 	mov	r2, r3
 30059e8:	eafffdee 	b	30051a8 <fn_03004BDC+0x5cc>
 30059ec:	e5cd2021 	strb	r2, [sp, #33]	@ 0x21
 30059f0:	eafffffa 	b	30059e0 <fn_03004BDC+0xe04>
 30059f4:	e59f303c 	ldr	r3, [pc, #60]	@ 3005a38 <fn_03004BDC+0xe5c>
 30059f8:	eaffffa8 	b	30058a0 <fn_03004BDC+0xcc4>
 30059fc:	08019179 	.word	0x08019179	@ fn_08019178
 3005a00:	030064cc 	.word	0x030064cc	@ data_030064CC
 3005a04:	05000200 	.word	0x05000200
 3005a08:	84000040 	.word	0x84000040
 3005a0c:	03006600 	.word	0x03006600	@ data_03006600
 3005a10:	00800080 	.word	0x00800080
 3005a14:	8500001e 	.word	0x8500001e
 3005a18:	030064c4 	.word	0x030064c4	@ data_030064C4
 3005a1c:	8500003c 	.word	0x8500003c
 3005a20:	070001e0 	.word	0x070001e0
 3005a24:	070002d0 	.word	0x070002d0
 3005a28:	0812f750 	.word	0x0812f750	@ data_0812F750
 3005a2c:	030066f4 	.word	0x030066f4	@ data_030066F4
 3005a30:	03006498 	.word	0x03006498	@ data_03006498
 3005a34:	0801d569 	.word	0x0801d569	@ fn_0801D568
 3005a38:	06013600 	.word	0x06013600
 3005a3c:	0001638e 	.word	0x0001638e
 3005a40:	06009600 	.word	0x06009600
 3005a44:	08132004 	.word	0x08132004	@ data_08132004
 3005a48:	08018b95 	.word	0x08018b95	@ fn_08018B94
 3005a4c:	06016000 	.word	0x06016000
 3005a50:	06017000 	.word	0x06017000
 3005a54:	03000f28 	.word	0x03000f28	@ fn_03000F28
 3005a58:	06009cb4 	.word	0x06009cb4
 3005a5c:	08020a1d 	.word	0x08020a1d	@ fn_08020A1C
 3005a60:	ffffee54 	.word	0xffffee54
 3005a64:	08020991 	.word	0x08020991	@ fn_08020990
 3005a68:	06015600 	.word	0x06015600
 3005a6c:	f9feaa00 	.word	0xf9feaa00
 3005a70:	03800169 	.word	0x03800169
 3005a74:	0002aaaa 	.word	0x0002aaaa
 3005a78:	0000cccc 	.word	0x0000cccc
 3005a7c:	fffd5556 	.word	0xfffd5556
 3005a80:	00014001 	.word	0x00014001
 3005a84:	08132804 	.word	0x08132804	@ data_08132804
 3005a88:	0801d535 	.word	0x0801d535	@ fn_0801D534
 3005a8c:	84000400 	.word	0x84000400
