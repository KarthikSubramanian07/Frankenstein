fn_0800CFCC:
 800cfcc:	b5f0      	push	{r4, r5, r6, r7, lr}
 800cfce:	46ce      	mov	lr, r9
 800cfd0:	4647      	mov	r7, r8
 800cfd2:	4b41      	ldr	r3, [pc, #260]	@ (800d0d8 <fn_0800CFCC+0x10c>)
 800cfd4:	681d      	ldr	r5, [r3, #0]
 800cfd6:	4b41      	ldr	r3, [pc, #260]	@ (800d0dc <fn_0800CFCC+0x110>)
 800cfd8:	58ec      	ldr	r4, [r5, r3]
 800cfda:	004b      	lsls	r3, r1, #1
 800cfdc:	185b      	adds	r3, r3, r1
 800cfde:	00db      	lsls	r3, r3, #3
 800cfe0:	591c      	ldr	r4, [r3, r4]
 800cfe2:	b580      	push	{r7, lr}
 800cfe4:	2c05      	cmp	r4, #5
 800cfe6:	d033      	beq.n	800d050 <fn_0800CFCC+0x84>
 800cfe8:	0623      	lsls	r3, r4, #24
 800cfea:	0e1b      	lsrs	r3, r3, #24
 800cfec:	469c      	mov	ip, r3
 800cfee:	2b05      	cmp	r3, #5
 800cff0:	d02e      	beq.n	800d050 <fn_0800CFCC+0x84>
 800cff2:	23ff      	movs	r3, #255	@ 0xff
 800cff4:	278c      	movs	r7, #140	@ 0x8c
 800cff6:	4023      	ands	r3, r4
 800cff8:	009c      	lsls	r4, r3, #2
 800cffa:	1904      	adds	r4, r0, r4
 800cffc:	6fe6      	ldr	r6, [r4, #124]	@ 0x7c
 800cffe:	59e7      	ldr	r7, [r4, r7]
 800d000:	46b1      	mov	r9, r6
 800d002:	42be      	cmp	r6, r7
 800d004:	d024      	beq.n	800d050 <fn_0800CFCC+0x84>
 800d006:	26eb      	movs	r6, #235	@ 0xeb
 800d008:	00f6      	lsls	r6, r6, #3
 800d00a:	59ae      	ldr	r6, [r5, r6]
 800d00c:	46b0      	mov	r8, r6
 800d00e:	009b      	lsls	r3, r3, #2
 800d010:	4498      	add	r8, r3
 800d012:	4646      	mov	r6, r8
 800d014:	2302      	movs	r3, #2
 800d016:	1a9b      	subs	r3, r3, r2
 800d018:	6c72      	ldr	r2, [r6, #68]	@ 0x44
 800d01a:	435a      	muls	r2, r3
 800d01c:	23d6      	movs	r3, #214	@ 0xd6
 800d01e:	5ceb      	ldrb	r3, [r5, r3]
 800d020:	2504      	movs	r5, #4
 800d022:	43ab      	bics	r3, r5
 800d024:	d100      	bne.n	800d028 <fn_0800CFCC+0x5c>
 800d026:	0052      	lsls	r2, r2, #1
 800d028:	444a      	add	r2, r9
 800d02a:	42ba      	cmp	r2, r7
 800d02c:	dd00      	ble.n	800d030 <fn_0800CFCC+0x64>
 800d02e:	003a      	movs	r2, r7
 800d030:	464b      	mov	r3, r9
 800d032:	67e2      	str	r2, [r4, #124]	@ 0x7c
 800d034:	2b00      	cmp	r3, #0
 800d036:	d109      	bne.n	800d04c <fn_0800CFCC+0x80>
 800d038:	4663      	mov	r3, ip
 800d03a:	2b02      	cmp	r3, #2
 800d03c:	d027      	beq.n	800d08e <fn_0800CFCC+0xc2>
 800d03e:	d818      	bhi.n	800d072 <fn_0800CFCC+0xa6>
 800d040:	2b00      	cmp	r3, #0
 800d042:	d030      	beq.n	800d0a6 <fn_0800CFCC+0xda>
 800d044:	2353      	movs	r3, #83	@ 0x53
 800d046:	5cc3      	ldrb	r3, [r0, r3]
 800d048:	2b01      	cmp	r3, #1
 800d04a:	d938      	bls.n	800d0be <fn_0800CFCC+0xf2>
 800d04c:	2201      	movs	r2, #1
 800d04e:	e000      	b.n	800d052 <fn_0800CFCC+0x86>
 800d050:	2200      	movs	r2, #0
 800d052:	008b      	lsls	r3, r1, #2
 800d054:	18c3      	adds	r3, r0, r3
 800d056:	6d9c      	ldr	r4, [r3, #88]	@ 0x58
 800d058:	2c00      	cmp	r4, #0
 800d05a:	d103      	bne.n	800d064 <fn_0800CFCC+0x98>
 800d05c:	2201      	movs	r2, #1
 800d05e:	659a      	str	r2, [r3, #88]	@ 0x58
 800d060:	2354      	movs	r3, #84	@ 0x54
 800d062:	54c1      	strb	r1, [r0, r3]
 800d064:	0010      	movs	r0, r2
 800d066:	bcc0      	pop	{r6, r7}
 800d068:	46b9      	mov	r9, r7
 800d06a:	46b0      	mov	r8, r6
 800d06c:	bcf0      	pop	{r4, r5, r6, r7}
 800d06e:	bc02      	pop	{r1}
 800d070:	4708      	bx	r1
 800d072:	2b03      	cmp	r3, #3
 800d074:	d1ea      	bne.n	800d04c <fn_0800CFCC+0x80>
 800d076:	2353      	movs	r3, #83	@ 0x53
 800d078:	5cc3      	ldrb	r3, [r0, r3]
 800d07a:	2b00      	cmp	r3, #0
 800d07c:	d1e6      	bne.n	800d04c <fn_0800CFCC+0x80>
 800d07e:	6e83      	ldr	r3, [r0, #104]	@ 0x68
 800d080:	2b00      	cmp	r3, #0
 800d082:	d0e3      	beq.n	800d04c <fn_0800CFCC+0x80>
 800d084:	2204      	movs	r2, #4
 800d086:	2354      	movs	r3, #84	@ 0x54
 800d088:	54c2      	strb	r2, [r0, r3]
 800d08a:	2201      	movs	r2, #1
 800d08c:	e7e1      	b.n	800d052 <fn_0800CFCC+0x86>
 800d08e:	2353      	movs	r3, #83	@ 0x53
 800d090:	5cc3      	ldrb	r3, [r0, r3]
 800d092:	2b01      	cmp	r3, #1
 800d094:	d8da      	bhi.n	800d04c <fn_0800CFCC+0x80>
 800d096:	6ec3      	ldr	r3, [r0, #108]	@ 0x6c
 800d098:	2b00      	cmp	r3, #0
 800d09a:	d0d7      	beq.n	800d04c <fn_0800CFCC+0x80>
 800d09c:	2205      	movs	r2, #5
 800d09e:	2354      	movs	r3, #84	@ 0x54
 800d0a0:	54c2      	strb	r2, [r0, r3]
 800d0a2:	2201      	movs	r2, #1
 800d0a4:	e7d5      	b.n	800d052 <fn_0800CFCC+0x86>
 800d0a6:	2353      	movs	r3, #83	@ 0x53
 800d0a8:	5cc3      	ldrb	r3, [r0, r3]
 800d0aa:	2b00      	cmp	r3, #0
 800d0ac:	d1ce      	bne.n	800d04c <fn_0800CFCC+0x80>
 800d0ae:	6e43      	ldr	r3, [r0, #100]	@ 0x64
 800d0b0:	2b00      	cmp	r3, #0
 800d0b2:	d00c      	beq.n	800d0ce <fn_0800CFCC+0x102>
 800d0b4:	2203      	movs	r2, #3
 800d0b6:	2354      	movs	r3, #84	@ 0x54
 800d0b8:	54c2      	strb	r2, [r0, r3]
 800d0ba:	2201      	movs	r2, #1
 800d0bc:	e7c9      	b.n	800d052 <fn_0800CFCC+0x86>
 800d0be:	6e03      	ldr	r3, [r0, #96]	@ 0x60
 800d0c0:	2b00      	cmp	r3, #0
 800d0c2:	d0c3      	beq.n	800d04c <fn_0800CFCC+0x80>
 800d0c4:	2202      	movs	r2, #2
 800d0c6:	2354      	movs	r3, #84	@ 0x54
 800d0c8:	54c2      	strb	r2, [r0, r3]
 800d0ca:	2201      	movs	r2, #1
 800d0cc:	e7c1      	b.n	800d052 <fn_0800CFCC+0x86>
 800d0ce:	2201      	movs	r2, #1
 800d0d0:	2354      	movs	r3, #84	@ 0x54
 800d0d2:	54c2      	strb	r2, [r0, r3]
 800d0d4:	2201      	movs	r2, #1
 800d0d6:	e7bc      	b.n	800d052 <fn_0800CFCC+0x86>
 800d0d8:	030064c4 	.word	0x030064c4	@ data_030064C4
 800d0dc:	00000754 	.word	0x00000754
