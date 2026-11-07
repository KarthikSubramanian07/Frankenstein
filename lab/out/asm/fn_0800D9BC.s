fn_0800D9BC:
 800d9bc:	b5f0      	push	{r4, r5, r6, r7, lr}
 800d9be:	464f      	mov	r7, r9
 800d9c0:	46d6      	mov	lr, sl
 800d9c2:	4646      	mov	r6, r8
 800d9c4:	b5c0      	push	{r6, r7, lr}
 800d9c6:	001d      	movs	r5, r3
 800d9c8:	6cc3      	ldr	r3, [r0, #76]	@ 0x4c
 800d9ca:	b082      	sub	sp, #8
 800d9cc:	0004      	movs	r4, r0
 800d9ce:	4691      	mov	r9, r2
 800d9d0:	9100      	str	r1, [sp, #0]
 800d9d2:	075a      	lsls	r2, r3, #29
 800d9d4:	d400      	bmi.n	800d9d8 <fn_0800D9BC+0x1c>
 800d9d6:	e09f      	b.n	800db18 <fn_0800D9BC+0x15c>
 800d9d8:	2254      	movs	r2, #84	@ 0x54
 800d9da:	5e82      	ldrsh	r2, [r0, r2]
 800d9dc:	2a00      	cmp	r2, #0
 800d9de:	dc00      	bgt.n	800d9e2 <fn_0800D9BC+0x26>
 800d9e0:	e09a      	b.n	800db18 <fn_0800D9BC+0x15c>
 800d9e2:	01db      	lsls	r3, r3, #7
 800d9e4:	d503      	bpl.n	800d9ee <fn_0800D9BC+0x32>
 800d9e6:	2300      	movs	r3, #0
 800d9e8:	6443      	str	r3, [r0, #68]	@ 0x44
 800d9ea:	6403      	str	r3, [r0, #64]	@ 0x40
 800d9ec:	63c3      	str	r3, [r0, #60]	@ 0x3c
 800d9ee:	0020      	movs	r0, r4
 800d9f0:	f004 fc20 	bl	8012234 <fn_08012234>
 800d9f4:	1e06      	subs	r6, r0, #0
 800d9f6:	d100      	bne.n	800d9fa <fn_0800D9BC+0x3e>
 800d9f8:	e0ca      	b.n	800db90 <fn_0800D9BC+0x1d4>
 800d9fa:	23d6      	movs	r3, #214	@ 0xd6
 800d9fc:	4fbc      	ldr	r7, [pc, #752]	@ (800dcf0 <fn_0800D9BC+0x334>)
 800d9fe:	683a      	ldr	r2, [r7, #0]
 800da00:	56d3      	ldrsb	r3, [r2, r3]
 800da02:	2b00      	cmp	r3, #0
 800da04:	d100      	bne.n	800da08 <fn_0800D9BC+0x4c>
 800da06:	e0c1      	b.n	800db8c <fn_0800D9BC+0x1d0>
 800da08:	9b00      	ldr	r3, [sp, #0]
 800da0a:	2b00      	cmp	r3, #0
 800da0c:	d100      	bne.n	800da10 <fn_0800D9BC+0x54>
 800da0e:	e08b      	b.n	800db28 <fn_0800D9BC+0x16c>
 800da10:	6ce3      	ldr	r3, [r4, #76]	@ 0x4c
 800da12:	04db      	lsls	r3, r3, #19
 800da14:	d500      	bpl.n	800da18 <fn_0800D9BC+0x5c>
 800da16:	e087      	b.n	800db28 <fn_0800D9BC+0x16c>
 800da18:	464f      	mov	r7, r9
 800da1a:	2f00      	cmp	r7, #0
 800da1c:	d00b      	beq.n	800da36 <fn_0800D9BC+0x7a>
 800da1e:	0038      	movs	r0, r7
 800da20:	f004 fc08 	bl	8012234 <fn_08012234>
 800da24:	2800      	cmp	r0, #0
 800da26:	d006      	beq.n	800da36 <fn_0800D9BC+0x7a>
 800da28:	0038      	movs	r0, r7
 800da2a:	f004 fc03 	bl	8012234 <fn_08012234>
 800da2e:	2353      	movs	r3, #83	@ 0x53
 800da30:	5cc3      	ldrb	r3, [r0, r3]
 800da32:	2b07      	cmp	r3, #7
 800da34:	d03d      	beq.n	800dab2 <fn_0800D9BC+0xf6>
 800da36:	9800      	ldr	r0, [sp, #0]
 800da38:	300c      	adds	r0, #12
 800da3a:	6923      	ldr	r3, [r4, #16]
 800da3c:	68e2      	ldr	r2, [r4, #12]
 800da3e:	c803      	ldmia	r0, {r0, r1}
 800da40:	f017 fd8e 	bl	8025560 <fn_08025560>
 800da44:	00ab      	lsls	r3, r5, #2
 800da46:	195b      	adds	r3, r3, r5
 800da48:	009a      	lsls	r2, r3, #2
 800da4a:	189b      	adds	r3, r3, r2
 800da4c:	4680      	mov	r8, r0
 800da4e:	03d8      	lsls	r0, r3, #15
 800da50:	235a      	movs	r3, #90	@ 0x5a
 800da52:	5ce1      	ldrb	r1, [r4, r3]
 800da54:	23ea      	movs	r3, #234	@ 0xea
 800da56:	4fa6      	ldr	r7, [pc, #664]	@ (800dcf0 <fn_0800D9BC+0x334>)
 800da58:	683a      	ldr	r2, [r7, #0]
 800da5a:	00db      	lsls	r3, r3, #3
 800da5c:	58d3      	ldr	r3, [r2, r3]
 800da5e:	225c      	movs	r2, #92	@ 0x5c
 800da60:	434a      	muls	r2, r1
 800da62:	189b      	adds	r3, r3, r2
 800da64:	6c99      	ldr	r1, [r3, #72]	@ 0x48
 800da66:	f017 fd93 	bl	8025590 <fn_08025590>
 800da6a:	4682      	mov	sl, r0
 800da6c:	2d27      	cmp	r5, #39	@ 0x27
 800da6e:	dc04      	bgt.n	800da7a <fn_0800D9BC+0xbe>
 800da70:	2354      	movs	r3, #84	@ 0x54
 800da72:	5ee3      	ldrsh	r3, [r4, r3]
 800da74:	42ab      	cmp	r3, r5
 800da76:	da00      	bge.n	800da7a <fn_0800D9BC+0xbe>
 800da78:	e117      	b.n	800dcaa <fn_0800D9BC+0x2ee>
 800da7a:	4643      	mov	r3, r8
 800da7c:	0cda      	lsrs	r2, r3, #19
 800da7e:	6be3      	ldr	r3, [r4, #60]	@ 0x3c
 800da80:	9301      	str	r3, [sp, #4]
 800da82:	2380      	movs	r3, #128	@ 0x80
 800da84:	011b      	lsls	r3, r3, #4
 800da86:	189b      	adds	r3, r3, r2
 800da88:	4f9a      	ldr	r7, [pc, #616]	@ (800dcf4 <fn_0800D9BC+0x338>)
 800da8a:	009b      	lsls	r3, r3, #2
 800da8c:	58f9      	ldr	r1, [r7, r3]
 800da8e:	4650      	mov	r0, sl
 800da90:	9200      	str	r2, [sp, #0]
 800da92:	f017 fda3 	bl	80255dc <fn_080255DC>
 800da96:	9b01      	ldr	r3, [sp, #4]
 800da98:	9a00      	ldr	r2, [sp, #0]
 800da9a:	18c0      	adds	r0, r0, r3
 800da9c:	6c23      	ldr	r3, [r4, #64]	@ 0x40
 800da9e:	9301      	str	r3, [sp, #4]
 800daa0:	0093      	lsls	r3, r2, #2
 800daa2:	63e0      	str	r0, [r4, #60]	@ 0x3c
 800daa4:	59d9      	ldr	r1, [r3, r7]
 800daa6:	4650      	mov	r0, sl
 800daa8:	f017 fd98 	bl	80255dc <fn_080255DC>
 800daac:	9b01      	ldr	r3, [sp, #4]
 800daae:	18c0      	adds	r0, r0, r3
 800dab0:	6420      	str	r0, [r4, #64]	@ 0x40
 800dab2:	2e00      	cmp	r6, #0
 800dab4:	d138      	bne.n	800db28 <fn_0800D9BC+0x16c>
 800dab6:	2254      	movs	r2, #84	@ 0x54
 800dab8:	5aa3      	ldrh	r3, [r4, r2]
 800daba:	1b5b      	subs	r3, r3, r5
 800dabc:	041b      	lsls	r3, r3, #16
 800dabe:	141b      	asrs	r3, r3, #16
 800dac0:	52a3      	strh	r3, [r4, r2]
 800dac2:	2b00      	cmp	r3, #0
 800dac4:	dc00      	bgt.n	800dac8 <fn_0800D9BC+0x10c>
 800dac6:	e072      	b.n	800dbae <fn_0800D9BC+0x1f2>
 800dac8:	f7f9 f81a 	bl	8006b00 <fn_08006B00>
 800dacc:	235a      	movs	r3, #90	@ 0x5a
 800dace:	225c      	movs	r2, #92	@ 0x5c
 800dad0:	5ce3      	ldrb	r3, [r4, r3]
 800dad2:	435a      	muls	r2, r3
 800dad4:	23ea      	movs	r3, #234	@ 0xea
 800dad6:	4f86      	ldr	r7, [pc, #536]	@ (800dcf0 <fn_0800D9BC+0x334>)
 800dad8:	6839      	ldr	r1, [r7, #0]
 800dada:	00db      	lsls	r3, r3, #3
 800dadc:	58cb      	ldr	r3, [r1, r3]
 800dade:	189b      	adds	r3, r3, r2
 800dae0:	6a1a      	ldr	r2, [r3, #32]
 800dae2:	4290      	cmp	r0, r2
 800dae4:	da03      	bge.n	800daee <fn_0800D9BC+0x132>
 800dae6:	6ce2      	ldr	r2, [r4, #76]	@ 0x4c
 800dae8:	01d1      	lsls	r1, r2, #7
 800daea:	d400      	bmi.n	800daee <fn_0800D9BC+0x132>
 800daec:	e139      	b.n	800dd62 <fn_0800D9BC+0x3a6>
 800daee:	2200      	movs	r2, #0
 800daf0:	235c      	movs	r3, #92	@ 0x5c
 800daf2:	54e2      	strb	r2, [r4, r3]
 800daf4:	464a      	mov	r2, r9
 800daf6:	2a00      	cmp	r2, #0
 800daf8:	d00e      	beq.n	800db18 <fn_0800D9BC+0x15c>
 800dafa:	454c      	cmp	r4, r9
 800dafc:	d00c      	beq.n	800db18 <fn_0800D9BC+0x15c>
 800dafe:	3b02      	subs	r3, #2
 800db00:	5cd2      	ldrb	r2, [r2, r3]
 800db02:	2a03      	cmp	r2, #3
 800db04:	d008      	beq.n	800db18 <fn_0800D9BC+0x15c>
 800db06:	225d      	movs	r2, #93	@ 0x5d
 800db08:	5ca2      	ldrb	r2, [r4, r2]
 800db0a:	2a00      	cmp	r2, #0
 800db0c:	d100      	bne.n	800db10 <fn_0800D9BC+0x154>
 800db0e:	e0f9      	b.n	800dd04 <fn_0800D9BC+0x348>
 800db10:	5ce3      	ldrb	r3, [r4, r3]
 800db12:	2b03      	cmp	r3, #3
 800db14:	d100      	bne.n	800db18 <fn_0800D9BC+0x15c>
 800db16:	e0f5      	b.n	800dd04 <fn_0800D9BC+0x348>
 800db18:	b002      	add	sp, #8
 800db1a:	bce0      	pop	{r5, r6, r7}
 800db1c:	46ba      	mov	sl, r7
 800db1e:	46b1      	mov	r9, r6
 800db20:	46a8      	mov	r8, r5
 800db22:	bcf0      	pop	{r4, r5, r6, r7}
 800db24:	bc01      	pop	{r0}
 800db26:	4700      	bx	r0
 800db28:	6ae3      	ldr	r3, [r4, #44]	@ 0x2c
 800db2a:	2220      	movs	r2, #32
 800db2c:	5e9b      	ldrsh	r3, [r3, r2]
 800db2e:	2b0b      	cmp	r3, #11
 800db30:	d037      	beq.n	800dba2 <fn_0800D9BC+0x1e6>
 800db32:	23a4      	movs	r3, #164	@ 0xa4
 800db34:	2202      	movs	r2, #2
 800db36:	58f3      	ldr	r3, [r6, r3]
 800db38:	4013      	ands	r3, r2
 800db3a:	4a6f      	ldr	r2, [pc, #444]	@ (800dcf8 <fn_0800D9BC+0x33c>)
 800db3c:	4295      	cmp	r5, r2
 800db3e:	dc02      	bgt.n	800db46 <fn_0800D9BC+0x18a>
 800db40:	2b00      	cmp	r3, #0
 800db42:	d1e9      	bne.n	800db18 <fn_0800D9BC+0x15c>
 800db44:	6b73      	ldr	r3, [r6, #52]	@ 0x34
 800db46:	2b00      	cmp	r3, #0
 800db48:	d1e6      	bne.n	800db18 <fn_0800D9BC+0x15c>
 800db4a:	6b33      	ldr	r3, [r6, #48]	@ 0x30
 800db4c:	2b00      	cmp	r3, #0
 800db4e:	d00c      	beq.n	800db6a <fn_0800D9BC+0x1ae>
 800db50:	2b01      	cmp	r3, #1
 800db52:	d100      	bne.n	800db56 <fn_0800D9BC+0x19a>
 800db54:	e10d      	b.n	800dd72 <fn_0800D9BC+0x3b6>
 800db56:	0fe8      	lsrs	r0, r5, #31
 800db58:	1940      	adds	r0, r0, r5
 800db5a:	1040      	asrs	r0, r0, #1
 800db5c:	6af3      	ldr	r3, [r6, #44]	@ 0x2c
 800db5e:	4283      	cmp	r3, r0
 800db60:	dc00      	bgt.n	800db64 <fn_0800D9BC+0x1a8>
 800db62:	e09d      	b.n	800dca0 <fn_0800D9BC+0x2e4>
 800db64:	1a1b      	subs	r3, r3, r0
 800db66:	62f3      	str	r3, [r6, #44]	@ 0x2c
 800db68:	1a2d      	subs	r5, r5, r0
 800db6a:	6ab3      	ldr	r3, [r6, #40]	@ 0x28
 800db6c:	1b5b      	subs	r3, r3, r5
 800db6e:	43da      	mvns	r2, r3
 800db70:	17d2      	asrs	r2, r2, #31
 800db72:	4013      	ands	r3, r2
 800db74:	62b3      	str	r3, [r6, #40]	@ 0x28
 800db76:	464a      	mov	r2, r9
 800db78:	23c4      	movs	r3, #196	@ 0xc4
 800db7a:	50f2      	str	r2, [r6, r3]
 800db7c:	22bc      	movs	r2, #188	@ 0xbc
 800db7e:	58b3      	ldr	r3, [r6, r2]
 800db80:	18eb      	adds	r3, r5, r3
 800db82:	2b64      	cmp	r3, #100	@ 0x64
 800db84:	dd00      	ble.n	800db88 <fn_0800D9BC+0x1cc>
 800db86:	2364      	movs	r3, #100	@ 0x64
 800db88:	50b3      	str	r3, [r6, r2]
 800db8a:	e794      	b.n	800dab6 <fn_0800D9BC+0xfa>
 800db8c:	106d      	asrs	r5, r5, #1
 800db8e:	e73b      	b.n	800da08 <fn_0800D9BC+0x4c>
 800db90:	9b00      	ldr	r3, [sp, #0]
 800db92:	2b00      	cmp	r3, #0
 800db94:	d100      	bne.n	800db98 <fn_0800D9BC+0x1dc>
 800db96:	e78e      	b.n	800dab6 <fn_0800D9BC+0xfa>
 800db98:	6ce3      	ldr	r3, [r4, #76]	@ 0x4c
 800db9a:	04db      	lsls	r3, r3, #19
 800db9c:	d500      	bpl.n	800dba0 <fn_0800D9BC+0x1e4>
 800db9e:	e78a      	b.n	800dab6 <fn_0800D9BC+0xfa>
 800dba0:	e73a      	b.n	800da18 <fn_0800D9BC+0x5c>
 800dba2:	3349      	adds	r3, #73	@ 0x49
 800dba4:	5ee3      	ldrsh	r3, [r4, r3]
 800dba6:	42ab      	cmp	r3, r5
 800dba8:	dcc3      	bgt.n	800db32 <fn_0800D9BC+0x176>
 800dbaa:	1e5d      	subs	r5, r3, #1
 800dbac:	e7c1      	b.n	800db32 <fn_0800D9BC+0x176>
 800dbae:	235a      	movs	r3, #90	@ 0x5a
 800dbb0:	5ce3      	ldrb	r3, [r4, r3]
 800dbb2:	6ce2      	ldr	r2, [r4, #76]	@ 0x4c
 800dbb4:	2b12      	cmp	r3, #18
 800dbb6:	d100      	bne.n	800dbba <fn_0800D9BC+0x1fe>
 800dbb8:	e0e0      	b.n	800dd7c <fn_0800D9BC+0x3c0>
 800dbba:	4b50      	ldr	r3, [pc, #320]	@ (800dcfc <fn_0800D9BC+0x340>)
 800dbbc:	401a      	ands	r2, r3
 800dbbe:	4b50      	ldr	r3, [pc, #320]	@ (800dd00 <fn_0800D9BC+0x344>)
 800dbc0:	4313      	orrs	r3, r2
 800dbc2:	6ba2      	ldr	r2, [r4, #56]	@ 0x38
 800dbc4:	1092      	asrs	r2, r2, #2
 800dbc6:	63a2      	str	r2, [r4, #56]	@ 0x38
 800dbc8:	464a      	mov	r2, r9
 800dbca:	64e3      	str	r3, [r4, #76]	@ 0x4c
 800dbcc:	2a00      	cmp	r2, #0
 800dbce:	d05d      	beq.n	800dc8c <fn_0800D9BC+0x2d0>
 800dbd0:	0010      	movs	r0, r2
 800dbd2:	f004 fb2f 	bl	8012234 <fn_08012234>
 800dbd6:	6ce3      	ldr	r3, [r4, #76]	@ 0x4c
 800dbd8:	2800      	cmp	r0, #0
 800dbda:	d057      	beq.n	800dc8c <fn_0800D9BC+0x2d0>
 800dbdc:	025b      	lsls	r3, r3, #9
 800dbde:	d500      	bpl.n	800dbe2 <fn_0800D9BC+0x226>
 800dbe0:	e0b6      	b.n	800dd50 <fn_0800D9BC+0x394>
 800dbe2:	4f43      	ldr	r7, [pc, #268]	@ (800dcf0 <fn_0800D9BC+0x334>)
 800dbe4:	0020      	movs	r0, r4
 800dbe6:	f004 fb25 	bl	8012234 <fn_08012234>
 800dbea:	683b      	ldr	r3, [r7, #0]
 800dbec:	2800      	cmp	r0, #0
 800dbee:	d011      	beq.n	800dc14 <fn_0800D9BC+0x258>
 800dbf0:	2102      	movs	r1, #2
 800dbf2:	6ce2      	ldr	r2, [r4, #76]	@ 0x4c
 800dbf4:	438a      	bics	r2, r1
 800dbf6:	64e2      	str	r2, [r4, #76]	@ 0x4c
 800dbf8:	2501      	movs	r5, #1
 800dbfa:	22e4      	movs	r2, #228	@ 0xe4
 800dbfc:	549d      	strb	r5, [r3, r2]
 800dbfe:	33e0      	adds	r3, #224	@ 0xe0
 800dc00:	0018      	movs	r0, r3
 800dc02:	f005 fa11 	bl	8013028 <fn_08013028>
 800dc06:	683b      	ldr	r3, [r7, #0]
 800dc08:	781a      	ldrb	r2, [r3, #0]
 800dc0a:	4215      	tst	r5, r2
 800dc0c:	d002      	beq.n	800dc14 <fn_0800D9BC+0x258>
 800dc0e:	f7f3 f95b 	bl	8000ec8 <fn_08000EC8>
 800dc12:	683b      	ldr	r3, [r7, #0]
 800dc14:	225a      	movs	r2, #90	@ 0x5a
 800dc16:	5ca1      	ldrb	r1, [r4, r2]
 800dc18:	3202      	adds	r2, #2
 800dc1a:	434a      	muls	r2, r1
 800dc1c:	21ea      	movs	r1, #234	@ 0xea
 800dc1e:	00c9      	lsls	r1, r1, #3
 800dc20:	585b      	ldr	r3, [r3, r1]
 800dc22:	189b      	adds	r3, r3, r2
 800dc24:	2254      	movs	r2, #84	@ 0x54
 800dc26:	5ea1      	ldrsh	r1, [r4, r2]
 800dc28:	689a      	ldr	r2, [r3, #8]
 800dc2a:	4252      	negs	r2, r2
 800dc2c:	4291      	cmp	r1, r2
 800dc2e:	da02      	bge.n	800dc36 <fn_0800D9BC+0x27a>
 800dc30:	6b5a      	ldr	r2, [r3, #52]	@ 0x34
 800dc32:	2a00      	cmp	r2, #0
 800dc34:	d155      	bne.n	800dce2 <fn_0800D9BC+0x326>
 800dc36:	0020      	movs	r0, r4
 800dc38:	8e19      	ldrh	r1, [r3, #48]	@ 0x30
 800dc3a:	f003 fae7 	bl	801120c <fn_0801120C>
 800dc3e:	f7f8 ff5f 	bl	8006b00 <fn_08006B00>
 800dc42:	2303      	movs	r3, #3
 800dc44:	2256      	movs	r2, #86	@ 0x56
 800dc46:	4003      	ands	r3, r0
 800dc48:	5aa0      	ldrh	r0, [r4, r2]
 800dc4a:	1ac0      	subs	r0, r0, r3
 800dc4c:	1c03      	adds	r3, r0, #0
 800dc4e:	0400      	lsls	r0, r0, #16
 800dc50:	1400      	asrs	r0, r0, #16
 800dc52:	2800      	cmp	r0, #0
 800dc54:	dc00      	bgt.n	800dc58 <fn_0800D9BC+0x29c>
 800dc56:	2301      	movs	r3, #1
 800dc58:	2256      	movs	r2, #86	@ 0x56
 800dc5a:	52a3      	strh	r3, [r4, r2]
 800dc5c:	235a      	movs	r3, #90	@ 0x5a
 800dc5e:	5ce2      	ldrb	r2, [r4, r3]
 800dc60:	2a0a      	cmp	r2, #10
 800dc62:	d100      	bne.n	800dc66 <fn_0800D9BC+0x2aa>
 800dc64:	e08d      	b.n	800dd82 <fn_0800D9BC+0x3c6>
 800dc66:	d837      	bhi.n	800dcd8 <fn_0800D9BC+0x31c>
 800dc68:	2a01      	cmp	r2, #1
 800dc6a:	d038      	beq.n	800dcde <fn_0800D9BC+0x322>
 800dc6c:	3b0d      	subs	r3, #13
 800dc6e:	2a02      	cmp	r2, #2
 800dc70:	d000      	beq.n	800dc74 <fn_0800D9BC+0x2b8>
 800dc72:	e751      	b.n	800db18 <fn_0800D9BC+0x15c>
 800dc74:	2280      	movs	r2, #128	@ 0x80
 800dc76:	340c      	adds	r4, #12
 800dc78:	0612      	lsls	r2, r2, #24
 800dc7a:	cc03      	ldmia	r4!, {r0, r1}
 800dc7c:	f003 f8b6 	bl	8010dec <fn_08010DEC>
 800dc80:	2380      	movs	r3, #128	@ 0x80
 800dc82:	6cc2      	ldr	r2, [r0, #76]	@ 0x4c
 800dc84:	029b      	lsls	r3, r3, #10
 800dc86:	4313      	orrs	r3, r2
 800dc88:	64c3      	str	r3, [r0, #76]	@ 0x4c
 800dc8a:	e745      	b.n	800db18 <fn_0800D9BC+0x15c>
 800dc8c:	4f18      	ldr	r7, [pc, #96]	@ (800dcf0 <fn_0800D9BC+0x334>)
 800dc8e:	025b      	lsls	r3, r3, #9
 800dc90:	d5a8      	bpl.n	800dbe4 <fn_0800D9BC+0x228>
 800dc92:	22c6      	movs	r2, #198	@ 0xc6
 800dc94:	6839      	ldr	r1, [r7, #0]
 800dc96:	0052      	lsls	r2, r2, #1
 800dc98:	588b      	ldr	r3, [r1, r2]
 800dc9a:	3301      	adds	r3, #1
 800dc9c:	508b      	str	r3, [r1, r2]
 800dc9e:	e7a1      	b.n	800dbe4 <fn_0800D9BC+0x228>
 800dca0:	2200      	movs	r2, #0
 800dca2:	0018      	movs	r0, r3
 800dca4:	6332      	str	r2, [r6, #48]	@ 0x30
 800dca6:	2300      	movs	r3, #0
 800dca8:	e75d      	b.n	800db66 <fn_0800D9BC+0x1aa>
 800dcaa:	9800      	ldr	r0, [sp, #0]
 800dcac:	6963      	ldr	r3, [r4, #20]
 800dcae:	6942      	ldr	r2, [r0, #20]
 800dcb0:	1a9b      	subs	r3, r3, r2
 800dcb2:	2280      	movs	r2, #128	@ 0x80
 800dcb4:	03d2      	lsls	r2, r2, #15
 800dcb6:	4293      	cmp	r3, r2
 800dcb8:	dc00      	bgt.n	800dcbc <fn_0800D9BC+0x300>
 800dcba:	e6de      	b.n	800da7a <fn_0800D9BC+0xbe>
 800dcbc:	f7f8 ff20 	bl	8006b00 <fn_08006B00>
 800dcc0:	07c0      	lsls	r0, r0, #31
 800dcc2:	d400      	bmi.n	800dcc6 <fn_0800D9BC+0x30a>
 800dcc4:	e6d9      	b.n	800da7a <fn_0800D9BC+0xbe>
 800dcc6:	2280      	movs	r2, #128	@ 0x80
 800dcc8:	4643      	mov	r3, r8
 800dcca:	0612      	lsls	r2, r2, #24
 800dccc:	189b      	adds	r3, r3, r2
 800dcce:	4698      	mov	r8, r3
 800dcd0:	4653      	mov	r3, sl
 800dcd2:	009b      	lsls	r3, r3, #2
 800dcd4:	469a      	mov	sl, r3
 800dcd6:	e6d0      	b.n	800da7a <fn_0800D9BC+0xbe>
 800dcd8:	2a17      	cmp	r2, #23
 800dcda:	d000      	beq.n	800dcde <fn_0800D9BC+0x322>
 800dcdc:	e71c      	b.n	800db18 <fn_0800D9BC+0x15c>
 800dcde:	233f      	movs	r3, #63	@ 0x3f
 800dce0:	e7c8      	b.n	800dc74 <fn_0800D9BC+0x2b8>
 800dce2:	0412      	lsls	r2, r2, #16
 800dce4:	0020      	movs	r0, r4
 800dce6:	0c11      	lsrs	r1, r2, #16
 800dce8:	f003 fa90 	bl	801120c <fn_0801120C>
 800dcec:	e7a7      	b.n	800dc3e <fn_0800D9BC+0x282>
 800dcee:	46c0      	nop			@ (mov r8, r8)
 800dcf0:	030064c4 	.word	0x030064c4
 800dcf4:	081397cc 	.word	0x081397cc
 800dcf8:	000003e7 	.word	0x000003e7
 800dcfc:	feffbdfb 	.word	0xfeffbdfb
 800dd00:	00100400 	.word	0x00100400
 800dd04:	0020      	movs	r0, r4
 800dd06:	4649      	mov	r1, r9
 800dd08:	3050      	adds	r0, #80	@ 0x50
 800dd0a:	f00a fc51 	bl	80185b0 <fn_080185B0>
 800dd0e:	235d      	movs	r3, #93	@ 0x5d
 800dd10:	2264      	movs	r2, #100	@ 0x64
 800dd12:	54e2      	strb	r2, [r4, r3]
 800dd14:	3b03      	subs	r3, #3
 800dd16:	5ce2      	ldrb	r2, [r4, r3]
 800dd18:	3302      	adds	r3, #2
 800dd1a:	4353      	muls	r3, r2
 800dd1c:	22ea      	movs	r2, #234	@ 0xea
 800dd1e:	6839      	ldr	r1, [r7, #0]
 800dd20:	00d2      	lsls	r2, r2, #3
 800dd22:	588a      	ldr	r2, [r1, r2]
 800dd24:	18d2      	adds	r2, r2, r3
 800dd26:	6850      	ldr	r0, [r2, #4]
 800dd28:	0083      	lsls	r3, r0, #2
 800dd2a:	181b      	adds	r3, r3, r0
 800dd2c:	4816      	ldr	r0, [pc, #88]	@ (800dd88 <fn_0800D9BC+0x3cc>)
 800dd2e:	5809      	ldr	r1, [r1, r0]
 800dd30:	005b      	lsls	r3, r3, #1
 800dd32:	18cb      	adds	r3, r1, r3
 800dd34:	6ca1      	ldr	r1, [r4, #72]	@ 0x48
 800dd36:	4299      	cmp	r1, r3
 800dd38:	d000      	beq.n	800dd3c <fn_0800D9BC+0x380>
 800dd3a:	e6ed      	b.n	800db18 <fn_0800D9BC+0x15c>
 800dd3c:	68d3      	ldr	r3, [r2, #12]
 800dd3e:	2b00      	cmp	r3, #0
 800dd40:	d100      	bne.n	800dd44 <fn_0800D9BC+0x388>
 800dd42:	e6e9      	b.n	800db18 <fn_0800D9BC+0x15c>
 800dd44:	041b      	lsls	r3, r3, #16
 800dd46:	0020      	movs	r0, r4
 800dd48:	0c19      	lsrs	r1, r3, #16
 800dd4a:	f003 fa5f 	bl	801120c <fn_0801120C>
 800dd4e:	e6e3      	b.n	800db18 <fn_0800D9BC+0x15c>
 800dd50:	4648      	mov	r0, r9
 800dd52:	f004 fa6f 	bl	8012234 <fn_08012234>
 800dd56:	22ac      	movs	r2, #172	@ 0xac
 800dd58:	5883      	ldr	r3, [r0, r2]
 800dd5a:	3301      	adds	r3, #1
 800dd5c:	5083      	str	r3, [r0, r2]
 800dd5e:	4f0b      	ldr	r7, [pc, #44]	@ (800dd8c <fn_0800D9BC+0x3d0>)
 800dd60:	e740      	b.n	800dbe4 <fn_0800D9BC+0x228>
 800dd62:	2140      	movs	r1, #64	@ 0x40
 800dd64:	430a      	orrs	r2, r1
 800dd66:	0020      	movs	r0, r4
 800dd68:	64e2      	str	r2, [r4, #76]	@ 0x4c
 800dd6a:	8b99      	ldrh	r1, [r3, #28]
 800dd6c:	f003 fa4e 	bl	801120c <fn_0801120C>
 800dd70:	e6bd      	b.n	800daee <fn_0800D9BC+0x132>
 800dd72:	2103      	movs	r1, #3
 800dd74:	0028      	movs	r0, r5
 800dd76:	f017 fc0b 	bl	8025590 <fn_08025590>
 800dd7a:	e6ef      	b.n	800db5c <fn_0800D9BC+0x1a0>
 800dd7c:	4b04      	ldr	r3, [pc, #16]	@ (800dd90 <fn_0800D9BC+0x3d4>)
 800dd7e:	401a      	ands	r2, r3
 800dd80:	e71d      	b.n	800dbbe <fn_0800D9BC+0x202>
 800dd82:	2349      	movs	r3, #73	@ 0x49
 800dd84:	e776      	b.n	800dc74 <fn_0800D9BC+0x2b8>
 800dd86:	46c0      	nop			@ (mov r8, r8)
 800dd88:	0000074c 	.word	0x0000074c
 800dd8c:	030064c4 	.word	0x030064c4
 800dd90:	feffbffb 	.word	0xfeffbffb
