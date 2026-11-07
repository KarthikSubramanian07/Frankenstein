fn_0801AFF0:
 801aff0:	b5f0      	push	{r4, r5, r6, r7, lr}
 801aff2:	464e      	mov	r6, r9
 801aff4:	46de      	mov	lr, fp
 801aff6:	4657      	mov	r7, sl
 801aff8:	4645      	mov	r5, r8
 801affa:	b5e0      	push	{r5, r6, r7, lr}
 801affc:	4691      	mov	r9, r2
 801affe:	b083      	sub	sp, #12
 801b000:	8042      	strh	r2, [r0, #2]
 801b002:	2201      	movs	r2, #1
 801b004:	4252      	negs	r2, r2
 801b006:	6042      	str	r2, [r0, #4]
 801b008:	9a0d      	ldr	r2, [sp, #52]	@ 0x34
 801b00a:	6082      	str	r2, [r0, #8]
 801b00c:	2200      	movs	r2, #0
 801b00e:	8282      	strh	r2, [r0, #20]
 801b010:	7602      	strb	r2, [r0, #24]
 801b012:	9a0c      	ldr	r2, [sp, #48]	@ 0x30
 801b014:	468c      	mov	ip, r1
 801b016:	8001      	strh	r1, [r0, #0]
 801b018:	60c3      	str	r3, [r0, #12]
 801b01a:	2a00      	cmp	r2, #0
 801b01c:	dd4d      	ble.n	801b0ba <fn_0801AFF0+0xca>
 801b01e:	001c      	movs	r4, r3
 801b020:	0093      	lsls	r3, r2, #2
 801b022:	4698      	mov	r8, r3
 801b024:	2600      	movs	r6, #0
 801b026:	44a0      	add	r8, r4
 801b028:	6823      	ldr	r3, [r4, #0]
 801b02a:	2104      	movs	r1, #4
 801b02c:	5e5a      	ldrsh	r2, [r3, r1]
 801b02e:	4661      	mov	r1, ip
 801b030:	1a8a      	subs	r2, r1, r2
 801b032:	4692      	mov	sl, r2
 801b034:	0011      	movs	r1, r2
 801b036:	2501      	movs	r5, #1
 801b038:	2206      	movs	r2, #6
 801b03a:	5e9f      	ldrsh	r7, [r3, r2]
 801b03c:	464a      	mov	r2, r9
 801b03e:	43a9      	bics	r1, r5
 801b040:	1bd7      	subs	r7, r2, r7
 801b042:	2500      	movs	r5, #0
 801b044:	5f5a      	ldrsh	r2, [r3, r5]
 801b046:	2501      	movs	r5, #1
 801b048:	4452      	add	r2, sl
 801b04a:	3201      	adds	r2, #1
 801b04c:	43aa      	bics	r2, r5
 801b04e:	2502      	movs	r5, #2
 801b050:	5f5b      	ldrsh	r3, [r3, r5]
 801b052:	19db      	adds	r3, r3, r7
 801b054:	9301      	str	r3, [sp, #4]
 801b056:	2e00      	cmp	r6, #0
 801b058:	d016      	beq.n	801b088 <fn_0801AFF0+0x98>
 801b05a:	2310      	movs	r3, #16
 801b05c:	5ec5      	ldrsh	r5, [r0, r3]
 801b05e:	46aa      	mov	sl, r5
 801b060:	42a9      	cmp	r1, r5
 801b062:	dd00      	ble.n	801b066 <fn_0801AFF0+0x76>
 801b064:	0029      	movs	r1, r5
 801b066:	2312      	movs	r3, #18
 801b068:	5ec5      	ldrsh	r5, [r0, r3]
 801b06a:	46ab      	mov	fp, r5
 801b06c:	42af      	cmp	r7, r5
 801b06e:	dd00      	ble.n	801b072 <fn_0801AFF0+0x82>
 801b070:	002f      	movs	r7, r5
 801b072:	4456      	add	r6, sl
 801b074:	42b2      	cmp	r2, r6
 801b076:	da00      	bge.n	801b07a <fn_0801AFF0+0x8a>
 801b078:	0032      	movs	r2, r6
 801b07a:	2316      	movs	r3, #22
 801b07c:	5ec6      	ldrsh	r6, [r0, r3]
 801b07e:	9b01      	ldr	r3, [sp, #4]
 801b080:	445e      	add	r6, fp
 801b082:	42b3      	cmp	r3, r6
 801b084:	da00      	bge.n	801b088 <fn_0801AFF0+0x98>
 801b086:	9601      	str	r6, [sp, #4]
 801b088:	43ce      	mvns	r6, r1
 801b08a:	17f6      	asrs	r6, r6, #31
 801b08c:	400e      	ands	r6, r1
 801b08e:	8206      	strh	r6, [r0, #16]
 801b090:	0039      	movs	r1, r7
 801b092:	2f80      	cmp	r7, #128	@ 0x80
 801b094:	da00      	bge.n	801b098 <fn_0801AFF0+0xa8>
 801b096:	2180      	movs	r1, #128	@ 0x80
 801b098:	8241      	strh	r1, [r0, #18]
 801b09a:	2af0      	cmp	r2, #240	@ 0xf0
 801b09c:	dd00      	ble.n	801b0a0 <fn_0801AFF0+0xb0>
 801b09e:	22f0      	movs	r2, #240	@ 0xf0
 801b0a0:	1b92      	subs	r2, r2, r6
 801b0a2:	0416      	lsls	r6, r2, #16
 801b0a4:	9b01      	ldr	r3, [sp, #4]
 801b0a6:	1436      	asrs	r6, r6, #16
 801b0a8:	8286      	strh	r6, [r0, #20]
 801b0aa:	2ba0      	cmp	r3, #160	@ 0xa0
 801b0ac:	dd00      	ble.n	801b0b0 <fn_0801AFF0+0xc0>
 801b0ae:	23a0      	movs	r3, #160	@ 0xa0
 801b0b0:	1a5b      	subs	r3, r3, r1
 801b0b2:	3404      	adds	r4, #4
 801b0b4:	82c3      	strh	r3, [r0, #22]
 801b0b6:	45a0      	cmp	r8, r4
 801b0b8:	d1b6      	bne.n	801b028 <fn_0801AFF0+0x38>
 801b0ba:	b003      	add	sp, #12
 801b0bc:	bcf0      	pop	{r4, r5, r6, r7}
 801b0be:	46bb      	mov	fp, r7
 801b0c0:	46b2      	mov	sl, r6
 801b0c2:	46a9      	mov	r9, r5
 801b0c4:	46a0      	mov	r8, r4
 801b0c6:	bcf0      	pop	{r4, r5, r6, r7}
 801b0c8:	bc01      	pop	{r0}
 801b0ca:	4700      	bx	r0
