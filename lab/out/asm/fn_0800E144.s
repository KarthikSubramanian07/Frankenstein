fn_0800E144:
 800e144:	b5f0      	push	{r4, r5, r6, r7, lr}
 800e146:	4657      	mov	r7, sl
 800e148:	464e      	mov	r6, r9
 800e14a:	4645      	mov	r5, r8
 800e14c:	46de      	mov	lr, fp
 800e14e:	b5e0      	push	{r5, r6, r7, lr}
 800e150:	2601      	movs	r6, #1
 800e152:	4b25      	ldr	r3, [pc, #148]	@ (800e1e8 <fn_0800E144+0xa4>)
 800e154:	b083      	sub	sp, #12
 800e156:	468a      	mov	sl, r1
 800e158:	4698      	mov	r8, r3
 800e15a:	9001      	str	r0, [sp, #4]
 800e15c:	4276      	negs	r6, r6
 800e15e:	e001      	b.n	800e164 <fn_0800E144+0x20>
 800e160:	2326      	movs	r3, #38	@ 0x26
 800e162:	54e7      	strb	r7, [r4, r3]
 800e164:	0031      	movs	r1, r6
 800e166:	9801      	ldr	r0, [sp, #4]
 800e168:	f006 ffe6 	bl	8015138 <fn_08015138>
 800e16c:	1e06      	subs	r6, r0, #0
 800e16e:	db30      	blt.n	800e1d2 <fn_0800E144+0x8e>
 800e170:	4643      	mov	r3, r8
 800e172:	21df      	movs	r1, #223	@ 0xdf
 800e174:	4657      	mov	r7, sl
 800e176:	681a      	ldr	r2, [r3, #0]
 800e178:	0109      	lsls	r1, r1, #4
 800e17a:	00b3      	lsls	r3, r6, #2
 800e17c:	5854      	ldr	r4, [r2, r1]
 800e17e:	199b      	adds	r3, r3, r6
 800e180:	00db      	lsls	r3, r3, #3
 800e182:	18e4      	adds	r4, r4, r3
 800e184:	2f00      	cmp	r7, #0
 800e186:	d1eb      	bne.n	800e160 <fn_0800E144+0x1c>
 800e188:	211e      	movs	r1, #30
 800e18a:	5e63      	ldrsh	r3, [r4, r1]
 800e18c:	2700      	movs	r7, #0
 800e18e:	2b00      	cmp	r3, #0
 800e190:	dde6      	ble.n	800e160 <fn_0800E144+0x1c>
 800e192:	23e0      	movs	r3, #224	@ 0xe0
 800e194:	011b      	lsls	r3, r3, #4
 800e196:	4699      	mov	r9, r3
 800e198:	2326      	movs	r3, #38	@ 0x26
 800e19a:	2500      	movs	r5, #0
 800e19c:	469b      	mov	fp, r3
 800e19e:	e001      	b.n	800e1a4 <fn_0800E144+0x60>
 800e1a0:	4643      	mov	r3, r8
 800e1a2:	681a      	ldr	r2, [r3, #0]
 800e1a4:	69a3      	ldr	r3, [r4, #24]
 800e1a6:	0069      	lsls	r1, r5, #1
 800e1a8:	5acb      	ldrh	r3, [r1, r3]
 800e1aa:	4649      	mov	r1, r9
 800e1ac:	5850      	ldr	r0, [r2, r1]
 800e1ae:	015b      	lsls	r3, r3, #5
 800e1b0:	0021      	movs	r1, r4
 800e1b2:	18c0      	adds	r0, r0, r3
 800e1b4:	f006 fa4e 	bl	8014654 <fn_08014654>
 800e1b8:	2800      	cmp	r0, #0
 800e1ba:	d004      	beq.n	800e1c6 <fn_0800E144+0x82>
 800e1bc:	465b      	mov	r3, fp
 800e1be:	5cc3      	ldrb	r3, [r0, r3]
 800e1c0:	429f      	cmp	r7, r3
 800e1c2:	da00      	bge.n	800e1c6 <fn_0800E144+0x82>
 800e1c4:	001f      	movs	r7, r3
 800e1c6:	221e      	movs	r2, #30
 800e1c8:	5ea3      	ldrsh	r3, [r4, r2]
 800e1ca:	3501      	adds	r5, #1
 800e1cc:	42ab      	cmp	r3, r5
 800e1ce:	dce7      	bgt.n	800e1a0 <fn_0800E144+0x5c>
 800e1d0:	e7c6      	b.n	800e160 <fn_0800E144+0x1c>
 800e1d2:	2001      	movs	r0, #1
 800e1d4:	b003      	add	sp, #12
 800e1d6:	bcf0      	pop	{r4, r5, r6, r7}
 800e1d8:	46bb      	mov	fp, r7
 800e1da:	46b2      	mov	sl, r6
 800e1dc:	46a9      	mov	r9, r5
 800e1de:	46a0      	mov	r8, r4
 800e1e0:	bcf0      	pop	{r4, r5, r6, r7}
 800e1e2:	bc02      	pop	{r1}
 800e1e4:	4708      	bx	r1
 800e1e6:	46c0      	nop			@ (mov r8, r8)
 800e1e8:	030064c4 	.word	0x030064c4
