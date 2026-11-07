fn_0801B0A4:
 801b0a4:	b5f0      	push	{r4, r5, r6, r7, lr}
 801b0a6:	464e      	mov	r6, r9
 801b0a8:	46de      	mov	lr, fp
 801b0aa:	4657      	mov	r7, sl
 801b0ac:	4645      	mov	r5, r8
 801b0ae:	b5e0      	push	{r5, r6, r7, lr}
 801b0b0:	4691      	mov	r9, r2
 801b0b2:	b083      	sub	sp, #12
 801b0b4:	8042      	strh	r2, [r0, #2]
 801b0b6:	2201      	movs	r2, #1
 801b0b8:	4252      	negs	r2, r2
 801b0ba:	6042      	str	r2, [r0, #4]
 801b0bc:	9a0d      	ldr	r2, [sp, #52]	@ 0x34
 801b0be:	6082      	str	r2, [r0, #8]
 801b0c0:	2200      	movs	r2, #0
 801b0c2:	8282      	strh	r2, [r0, #20]
 801b0c4:	7602      	strb	r2, [r0, #24]
 801b0c6:	9a0c      	ldr	r2, [sp, #48]	@ 0x30
 801b0c8:	468c      	mov	ip, r1
 801b0ca:	8001      	strh	r1, [r0, #0]
 801b0cc:	60c3      	str	r3, [r0, #12]
 801b0ce:	2a00      	cmp	r2, #0
 801b0d0:	dd4d      	ble.n	801b16e <fn_0801B0A4+0xca>
 801b0d2:	001c      	movs	r4, r3
 801b0d4:	0093      	lsls	r3, r2, #2
 801b0d6:	4698      	mov	r8, r3
 801b0d8:	2600      	movs	r6, #0
 801b0da:	44a0      	add	r8, r4
 801b0dc:	6823      	ldr	r3, [r4, #0]
 801b0de:	2104      	movs	r1, #4
 801b0e0:	5e5a      	ldrsh	r2, [r3, r1]
 801b0e2:	4661      	mov	r1, ip
 801b0e4:	1a8a      	subs	r2, r1, r2
 801b0e6:	4692      	mov	sl, r2
 801b0e8:	0011      	movs	r1, r2
 801b0ea:	2501      	movs	r5, #1
 801b0ec:	2206      	movs	r2, #6
 801b0ee:	5e9f      	ldrsh	r7, [r3, r2]
 801b0f0:	464a      	mov	r2, r9
 801b0f2:	43a9      	bics	r1, r5
 801b0f4:	1bd7      	subs	r7, r2, r7
 801b0f6:	2500      	movs	r5, #0
 801b0f8:	5f5a      	ldrsh	r2, [r3, r5]
 801b0fa:	2501      	movs	r5, #1
 801b0fc:	4452      	add	r2, sl
 801b0fe:	3201      	adds	r2, #1
 801b100:	43aa      	bics	r2, r5
 801b102:	2502      	movs	r5, #2
 801b104:	5f5b      	ldrsh	r3, [r3, r5]
 801b106:	19db      	adds	r3, r3, r7
 801b108:	9301      	str	r3, [sp, #4]
 801b10a:	2e00      	cmp	r6, #0
 801b10c:	d016      	beq.n	801b13c <fn_0801B0A4+0x98>
 801b10e:	2310      	movs	r3, #16
 801b110:	5ec5      	ldrsh	r5, [r0, r3]
 801b112:	46aa      	mov	sl, r5
 801b114:	42a9      	cmp	r1, r5
 801b116:	dd00      	ble.n	801b11a <fn_0801B0A4+0x76>
 801b118:	0029      	movs	r1, r5
 801b11a:	2312      	movs	r3, #18
 801b11c:	5ec5      	ldrsh	r5, [r0, r3]
 801b11e:	46ab      	mov	fp, r5
 801b120:	42af      	cmp	r7, r5
 801b122:	dd00      	ble.n	801b126 <fn_0801B0A4+0x82>
 801b124:	002f      	movs	r7, r5
 801b126:	4456      	add	r6, sl
 801b128:	42b2      	cmp	r2, r6
 801b12a:	da00      	bge.n	801b12e <fn_0801B0A4+0x8a>
 801b12c:	0032      	movs	r2, r6
 801b12e:	2316      	movs	r3, #22
 801b130:	5ec6      	ldrsh	r6, [r0, r3]
 801b132:	9b01      	ldr	r3, [sp, #4]
 801b134:	445e      	add	r6, fp
 801b136:	42b3      	cmp	r3, r6
 801b138:	da00      	bge.n	801b13c <fn_0801B0A4+0x98>
 801b13a:	9601      	str	r6, [sp, #4]
 801b13c:	43ce      	mvns	r6, r1
 801b13e:	17f6      	asrs	r6, r6, #31
 801b140:	400e      	ands	r6, r1
 801b142:	8206      	strh	r6, [r0, #16]
 801b144:	0039      	movs	r1, r7
 801b146:	2f80      	cmp	r7, #128	@ 0x80
 801b148:	da00      	bge.n	801b14c <fn_0801B0A4+0xa8>
 801b14a:	2180      	movs	r1, #128	@ 0x80
 801b14c:	8241      	strh	r1, [r0, #18]
 801b14e:	2af0      	cmp	r2, #240	@ 0xf0
 801b150:	dd00      	ble.n	801b154 <fn_0801B0A4+0xb0>
 801b152:	22f0      	movs	r2, #240	@ 0xf0
 801b154:	1b92      	subs	r2, r2, r6
 801b156:	0416      	lsls	r6, r2, #16
 801b158:	9b01      	ldr	r3, [sp, #4]
 801b15a:	1436      	asrs	r6, r6, #16
 801b15c:	8286      	strh	r6, [r0, #20]
 801b15e:	2ba0      	cmp	r3, #160	@ 0xa0
 801b160:	dd00      	ble.n	801b164 <fn_0801B0A4+0xc0>
 801b162:	23a0      	movs	r3, #160	@ 0xa0
 801b164:	1a5b      	subs	r3, r3, r1
 801b166:	3404      	adds	r4, #4
 801b168:	82c3      	strh	r3, [r0, #22]
 801b16a:	45a0      	cmp	r8, r4
 801b16c:	d1b6      	bne.n	801b0dc <fn_0801B0A4+0x38>
 801b16e:	b003      	add	sp, #12
 801b170:	bcf0      	pop	{r4, r5, r6, r7}
 801b172:	46bb      	mov	fp, r7
 801b174:	46b2      	mov	sl, r6
 801b176:	46a9      	mov	r9, r5
 801b178:	46a0      	mov	r8, r4
 801b17a:	bcf0      	pop	{r4, r5, r6, r7}
 801b17c:	bc01      	pop	{r0}
 801b17e:	4700      	bx	r0
