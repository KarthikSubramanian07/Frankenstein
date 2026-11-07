fn_08010DEC:
 8010dec:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8010dee:	4657      	mov	r7, sl
 8010df0:	46de      	mov	lr, fp
 8010df2:	464e      	mov	r6, r9
 8010df4:	4645      	mov	r5, r8
 8010df6:	b5e0      	push	{r5, r6, r7, lr}
 8010df8:	4f53      	ldr	r7, [pc, #332]	@ (8010f48 <fn_08010DEC+0x15c>)
 8010dfa:	4682      	mov	sl, r0
 8010dfc:	001e      	movs	r6, r3
 8010dfe:	6838      	ldr	r0, [r7, #0]
 8010e00:	4b52      	ldr	r3, [pc, #328]	@ (8010f4c <fn_08010DEC+0x160>)
 8010e02:	0015      	movs	r5, r2
 8010e04:	58c2      	ldr	r2, [r0, r3]
 8010e06:	468b      	mov	fp, r1
 8010e08:	1e53      	subs	r3, r2, #1
 8010e0a:	d417      	bmi.n	8010e3c <fn_08010DEC+0x50>
 8010e0c:	2164      	movs	r1, #100	@ 0x64
 8010e0e:	434a      	muls	r2, r1
 8010e10:	494f      	ldr	r1, [pc, #316]	@ (8010f50 <fn_08010DEC+0x164>)
 8010e12:	5840      	ldr	r0, [r0, r1]
 8010e14:	1880      	adds	r0, r0, r2
 8010e16:	380a      	subs	r0, #10
 8010e18:	e002      	b.n	8010e20 <fn_08010DEC+0x34>
 8010e1a:	3864      	subs	r0, #100	@ 0x64
 8010e1c:	3b01      	subs	r3, #1
 8010e1e:	d30d      	bcc.n	8010e3c <fn_08010DEC+0x50>
 8010e20:	7802      	ldrb	r2, [r0, #0]
 8010e22:	2a89      	cmp	r2, #137	@ 0x89
 8010e24:	d1f9      	bne.n	8010e1a <fn_08010DEC+0x2e>
 8010e26:	385a      	subs	r0, #90	@ 0x5a
 8010e28:	2100      	movs	r1, #0
 8010e2a:	3a25      	subs	r2, #37	@ 0x25
 8010e2c:	0004      	movs	r4, r0
 8010e2e:	f00f fe07 	bl	8020a40 <fn_08020A40>
 8010e32:	2380      	movs	r3, #128	@ 0x80
 8010e34:	055b      	lsls	r3, r3, #21
 8010e36:	469c      	mov	ip, r3
 8010e38:	64e3      	str	r3, [r4, #76]	@ 0x4c
 8010e3a:	e00b      	b.n	8010e54 <fn_08010DEC+0x68>
 8010e3c:	2200      	movs	r2, #0
 8010e3e:	2102      	movs	r1, #2
 8010e40:	2064      	movs	r0, #100	@ 0x64
 8010e42:	f00c fc73 	bl	801d72c <fn_0801D72C>
 8010e46:	2264      	movs	r2, #100	@ 0x64
 8010e48:	2100      	movs	r1, #0
 8010e4a:	0004      	movs	r4, r0
 8010e4c:	f00f fdf8 	bl	8020a40 <fn_08020A40>
 8010e50:	2300      	movs	r3, #0
 8010e52:	469c      	mov	ip, r3
 8010e54:	235c      	movs	r3, #92	@ 0x5c
 8010e56:	4699      	mov	r9, r3
 8010e58:	464a      	mov	r2, r9
 8010e5a:	4372      	muls	r2, r6
 8010e5c:	23ea      	movs	r3, #234	@ 0xea
 8010e5e:	4690      	mov	r8, r2
 8010e60:	225a      	movs	r2, #90	@ 0x5a
 8010e62:	6839      	ldr	r1, [r7, #0]
 8010e64:	00db      	lsls	r3, r3, #3
 8010e66:	58cb      	ldr	r3, [r1, r3]
 8010e68:	54a6      	strb	r6, [r4, r2]
 8010e6a:	4652      	mov	r2, sl
 8010e6c:	60e2      	str	r2, [r4, #12]
 8010e6e:	465a      	mov	r2, fp
 8010e70:	205b      	movs	r0, #91	@ 0x5b
 8010e72:	4443      	add	r3, r8
 8010e74:	6122      	str	r2, [r4, #16]
 8010e76:	6c1a      	ldr	r2, [r3, #64]	@ 0x40
 8010e78:	1412      	asrs	r2, r2, #16
 8010e7a:	5422      	strb	r2, [r4, r0]
 8010e7c:	6c5a      	ldr	r2, [r3, #68]	@ 0x44
 8010e7e:	4835      	ldr	r0, [pc, #212]	@ (8010f54 <fn_08010DEC+0x168>)
 8010e80:	63a2      	str	r2, [r4, #56]	@ 0x38
 8010e82:	6d5a      	ldr	r2, [r3, #84]	@ 0x54
 8010e84:	4002      	ands	r2, r0
 8010e86:	4660      	mov	r0, ip
 8010e88:	4302      	orrs	r2, r0
 8010e8a:	64e2      	str	r2, [r4, #76]	@ 0x4c
 8010e8c:	689a      	ldr	r2, [r3, #8]
 8010e8e:	0010      	movs	r0, r2
 8010e90:	2254      	movs	r2, #84	@ 0x54
 8010e92:	52a0      	strh	r0, [r4, r2]
 8010e94:	3282      	adds	r2, #130	@ 0x82
 8010e96:	568a      	ldrsb	r2, [r1, r2]
 8010e98:	2a04      	cmp	r2, #4
 8010e9a:	d002      	beq.n	8010ea2 <fn_08010DEC+0xb6>
 8010e9c:	4648      	mov	r0, r9
 8010e9e:	695a      	ldr	r2, [r3, #20]
 8010ea0:	5422      	strb	r2, [r4, r0]
 8010ea2:	685a      	ldr	r2, [r3, #4]
 8010ea4:	0093      	lsls	r3, r2, #2
 8010ea6:	189b      	adds	r3, r3, r2
 8010ea8:	4a2b      	ldr	r2, [pc, #172]	@ (8010f58 <fn_08010DEC+0x16c>)
 8010eaa:	588a      	ldr	r2, [r1, r2]
 8010eac:	005b      	lsls	r3, r3, #1
 8010eae:	18d3      	adds	r3, r2, r3
 8010eb0:	64a3      	str	r3, [r4, #72]	@ 0x48
 8010eb2:	889a      	ldrh	r2, [r3, #4]
 8010eb4:	2356      	movs	r3, #86	@ 0x56
 8010eb6:	0020      	movs	r0, r4
 8010eb8:	52e2      	strh	r2, [r4, r3]
 8010eba:	f7ff f927 	bl	801010c <fn_0801010C>
 8010ebe:	2180      	movs	r1, #128	@ 0x80
 8010ec0:	6ae3      	ldr	r3, [r4, #44]	@ 0x2c
 8010ec2:	681a      	ldr	r2, [r3, #0]
 8010ec4:	685b      	ldr	r3, [r3, #4]
 8010ec6:	6322      	str	r2, [r4, #48]	@ 0x30
 8010ec8:	6363      	str	r3, [r4, #52]	@ 0x34
 8010eca:	0609      	lsls	r1, r1, #24
 8010ecc:	428d      	cmp	r5, r1
 8010ece:	d034      	beq.n	8010f3a <fn_08010DEC+0x14e>
 8010ed0:	4a22      	ldr	r2, [pc, #136]	@ (8010f5c <fn_08010DEC+0x170>)
 8010ed2:	4295      	cmp	r5, r2
 8010ed4:	d02e      	beq.n	8010f34 <fn_08010DEC+0x148>
 8010ed6:	6165      	str	r5, [r4, #20]
 8010ed8:	2e2a      	cmp	r6, #42	@ 0x2a
 8010eda:	d91a      	bls.n	8010f12 <fn_08010DEC+0x126>
 8010edc:	23ea      	movs	r3, #234	@ 0xea
 8010ede:	683a      	ldr	r2, [r7, #0]
 8010ee0:	00db      	lsls	r3, r3, #3
 8010ee2:	58d3      	ldr	r3, [r2, r3]
 8010ee4:	4443      	add	r3, r8
 8010ee6:	6bda      	ldr	r2, [r3, #60]	@ 0x3c
 8010ee8:	2a00      	cmp	r2, #0
 8010eea:	d112      	bne.n	8010f12 <fn_08010DEC+0x126>
 8010eec:	6d5b      	ldr	r3, [r3, #84]	@ 0x54
 8010eee:	0019      	movs	r1, r3
 8010ef0:	4a1b      	ldr	r2, [pc, #108]	@ (8010f60 <fn_08010DEC+0x174>)
 8010ef2:	4011      	ands	r1, r2
 8010ef4:	4213      	tst	r3, r2
 8010ef6:	d10c      	bne.n	8010f12 <fn_08010DEC+0x126>
 8010ef8:	22c0      	movs	r2, #192	@ 0xc0
 8010efa:	0092      	lsls	r2, r2, #2
 8010efc:	4013      	ands	r3, r2
 8010efe:	2280      	movs	r2, #128	@ 0x80
 8010f00:	0052      	lsls	r2, r2, #1
 8010f02:	4293      	cmp	r3, r2
 8010f04:	d005      	beq.n	8010f12 <fn_08010DEC+0x126>
 8010f06:	2356      	movs	r3, #86	@ 0x56
 8010f08:	5ee3      	ldrsh	r3, [r4, r3]
 8010f0a:	3301      	adds	r3, #1
 8010f0c:	d017      	beq.n	8010f3e <fn_08010DEC+0x152>
 8010f0e:	4b15      	ldr	r3, [pc, #84]	@ (8010f64 <fn_08010DEC+0x178>)
 8010f10:	e000      	b.n	8010f14 <fn_08010DEC+0x128>
 8010f12:	4b15      	ldr	r3, [pc, #84]	@ (8010f68 <fn_08010DEC+0x17c>)
 8010f14:	60a3      	str	r3, [r4, #8]
 8010f16:	2300      	movs	r3, #0
 8010f18:	0020      	movs	r0, r4
 8010f1a:	6623      	str	r3, [r4, #96]	@ 0x60
 8010f1c:	6523      	str	r3, [r4, #80]	@ 0x50
 8010f1e:	f007 fb57 	bl	80185d0 <fn_080185D0>
 8010f22:	0020      	movs	r0, r4
 8010f24:	bcf0      	pop	{r4, r5, r6, r7}
 8010f26:	46bb      	mov	fp, r7
 8010f28:	46b2      	mov	sl, r6
 8010f2a:	46a9      	mov	r9, r5
 8010f2c:	46a0      	mov	r8, r4
 8010f2e:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8010f30:	bc02      	pop	{r1}
 8010f32:	4708      	bx	r1
 8010f34:	6ba5      	ldr	r5, [r4, #56]	@ 0x38
 8010f36:	1b5d      	subs	r5, r3, r5
 8010f38:	e7cd      	b.n	8010ed6 <fn_08010DEC+0xea>
 8010f3a:	0015      	movs	r5, r2
 8010f3c:	e7cb      	b.n	8010ed6 <fn_08010DEC+0xea>
 8010f3e:	60a1      	str	r1, [r4, #8]
 8010f40:	6621      	str	r1, [r4, #96]	@ 0x60
 8010f42:	6521      	str	r1, [r4, #80]	@ 0x50
 8010f44:	e7ed      	b.n	8010f22 <fn_08010DEC+0x136>
 8010f46:	46c0      	nop			@ (mov r8, r8)
 8010f48:	030064c4 	.word	0x030064c4
 8010f4c:	00000e4c 	.word	0x00000e4c
 8010f50:	00000e48 	.word	0x00000e48
 8010f54:	dfffffff 	.word	0xdfffffff
 8010f58:	0000074c 	.word	0x0000074c
 8010f5c:	7fffffff 	.word	0x7fffffff
 8010f60:	01414004 	.word	0x01414004
 8010f64:	080114b9 	.word	0x080114b9
 8010f68:	03001618 	.word	0x03001618
