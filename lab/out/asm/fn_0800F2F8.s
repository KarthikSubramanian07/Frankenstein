fn_0800F2F8:
 800f2f8:	b5f0      	push	{r4, r5, r6, r7, lr}
 800f2fa:	46d6      	mov	lr, sl
 800f2fc:	464f      	mov	r7, r9
 800f2fe:	4646      	mov	r6, r8
 800f300:	4b2b      	ldr	r3, [pc, #172]	@ (800f3b0 <fn_0800F2F8+0xb8>)
 800f302:	68c5      	ldr	r5, [r0, #12]
 800f304:	681b      	ldr	r3, [r3, #0]
 800f306:	4c2b      	ldr	r4, [pc, #172]	@ (800f3b4 <fn_0800F2F8+0xbc>)
 800f308:	b5c0      	push	{r6, r7, lr}
 800f30a:	511d      	str	r5, [r3, r4]
 800f30c:	6904      	ldr	r4, [r0, #16]
 800f30e:	482a      	ldr	r0, [pc, #168]	@ (800f3b8 <fn_0800F2F8+0xc0>)
 800f310:	501c      	str	r4, [r3, r0]
 800f312:	3004      	adds	r0, #4
 800f314:	5019      	str	r1, [r3, r0]
 800f316:	4829      	ldr	r0, [pc, #164]	@ (800f3bc <fn_0800F2F8+0xc4>)
 800f318:	501a      	str	r2, [r3, r0]
 800f31a:	4829      	ldr	r0, [pc, #164]	@ (800f3c0 <fn_0800F2F8+0xc8>)
 800f31c:	581c      	ldr	r4, [r3, r0]
 800f31e:	428d      	cmp	r5, r1
 800f320:	dd00      	ble.n	800f324 <fn_0800F2F8+0x2c>
 800f322:	000d      	movs	r5, r1
 800f324:	60a5      	str	r5, [r4, #8]
 800f326:	4823      	ldr	r0, [pc, #140]	@ (800f3b4 <fn_0800F2F8+0xbc>)
 800f328:	5818      	ldr	r0, [r3, r0]
 800f32a:	4288      	cmp	r0, r1
 800f32c:	da00      	bge.n	800f330 <fn_0800F2F8+0x38>
 800f32e:	0008      	movs	r0, r1
 800f330:	60e0      	str	r0, [r4, #12]
 800f332:	4921      	ldr	r1, [pc, #132]	@ (800f3b8 <fn_0800F2F8+0xc0>)
 800f334:	5859      	ldr	r1, [r3, r1]
 800f336:	4291      	cmp	r1, r2
 800f338:	da00      	bge.n	800f33c <fn_0800F2F8+0x44>
 800f33a:	0011      	movs	r1, r2
 800f33c:	6021      	str	r1, [r4, #0]
 800f33e:	4e1e      	ldr	r6, [pc, #120]	@ (800f3b8 <fn_0800F2F8+0xc0>)
 800f340:	599e      	ldr	r6, [r3, r6]
 800f342:	4296      	cmp	r6, r2
 800f344:	dd00      	ble.n	800f348 <fn_0800F2F8+0x50>
 800f346:	0016      	movs	r6, r2
 800f348:	6066      	str	r6, [r4, #4]
 800f34a:	4a1e      	ldr	r2, [pc, #120]	@ (800f3c4 <fn_0800F2F8+0xcc>)
 800f34c:	589a      	ldr	r2, [r3, r2]
 800f34e:	4c1e      	ldr	r4, [pc, #120]	@ (800f3c8 <fn_0800F2F8+0xd0>)
 800f350:	1aad      	subs	r5, r5, r2
 800f352:	1a80      	subs	r0, r0, r2
 800f354:	4a1d      	ldr	r2, [pc, #116]	@ (800f3cc <fn_0800F2F8+0xd4>)
 800f356:	589f      	ldr	r7, [r3, r2]
 800f358:	5b1a      	ldrh	r2, [r3, r4]
 800f35a:	3201      	adds	r2, #1
 800f35c:	531a      	strh	r2, [r3, r4]
 800f35e:	15ed      	asrs	r5, r5, #23
 800f360:	15c0      	asrs	r0, r0, #23
 800f362:	4285      	cmp	r5, r0
 800f364:	dc22      	bgt.n	800f3ac <fn_0800F2F8+0xb4>
 800f366:	1bf6      	subs	r6, r6, r7
 800f368:	15f3      	asrs	r3, r6, #23
 800f36a:	1bc9      	subs	r1, r1, r7
 800f36c:	4698      	mov	r8, r3
 800f36e:	1c42      	adds	r2, r0, #1
 800f370:	15cb      	asrs	r3, r1, #23
 800f372:	4699      	mov	r9, r3
 800f374:	4692      	mov	sl, r2
 800f376:	4e16      	ldr	r6, [pc, #88]	@ (800f3d0 <fn_0800F2F8+0xd8>)
 800f378:	1c5f      	adds	r7, r3, #1
 800f37a:	4644      	mov	r4, r8
 800f37c:	45c8      	cmp	r8, r9
 800f37e:	dd03      	ble.n	800f388 <fn_0800F2F8+0x90>
 800f380:	e011      	b.n	800f3a6 <fn_0800F2F8+0xae>
 800f382:	3401      	adds	r4, #1
 800f384:	42a7      	cmp	r7, r4
 800f386:	d00e      	beq.n	800f3a6 <fn_0800F2F8+0xae>
 800f388:	0032      	movs	r2, r6
 800f38a:	0021      	movs	r1, r4
 800f38c:	0028      	movs	r0, r5
 800f38e:	f000 ff73 	bl	8010278 <fn_08010278>
 800f392:	2800      	cmp	r0, #0
 800f394:	d1f5      	bne.n	800f382 <fn_0800F2F8+0x8a>
 800f396:	2001      	movs	r0, #1
 800f398:	bce0      	pop	{r5, r6, r7}
 800f39a:	46ba      	mov	sl, r7
 800f39c:	46b1      	mov	r9, r6
 800f39e:	46a8      	mov	r8, r5
 800f3a0:	bcf0      	pop	{r4, r5, r6, r7}
 800f3a2:	bc02      	pop	{r1}
 800f3a4:	4708      	bx	r1
 800f3a6:	3501      	adds	r5, #1
 800f3a8:	4555      	cmp	r5, sl
 800f3aa:	d1e6      	bne.n	800f37a <fn_0800F2F8+0x82>
 800f3ac:	2000      	movs	r0, #0
 800f3ae:	e7f3      	b.n	800f398 <fn_0800F2F8+0xa0>
 800f3b0:	030064c4 	.word	0x030064c4	@ data_030064C4
 800f3b4:	00000898 	.word	0x00000898
 800f3b8:	0000089c 	.word	0x0000089c
 800f3bc:	000008a4 	.word	0x000008a4
 800f3c0:	000008a8 	.word	0x000008a8
 800f3c4:	00000e28 	.word	0x00000e28
 800f3c8:	00001122 	.word	0x00001122
 800f3cc:	00000e2c 	.word	0x00000e2c
 800f3d0:	0800e341 	.word	0x0800e341	@ fn_0800E340
