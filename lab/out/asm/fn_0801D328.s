fn_0801D328:
 801d328:	b570      	push	{r4, r5, r6, lr}
 801d32a:	0005      	movs	r5, r0
 801d32c:	000e      	movs	r6, r1
 801d32e:	f003 fa61 	bl	80207f4 <fn_080207F4>
 801d332:	3801      	subs	r0, #1
 801d334:	182c      	adds	r4, r5, r0
 801d336:	42a5      	cmp	r5, r4
 801d338:	d00c      	beq.n	801d354 <fn_0801D328+0x2c>
 801d33a:	1e62      	subs	r2, r4, #1
 801d33c:	e007      	b.n	801d34e <fn_0801D328+0x26>
 801d33e:	2b5c      	cmp	r3, #92	@ 0x5c
 801d340:	d008      	beq.n	801d354 <fn_0801D328+0x2c>
 801d342:	2b2f      	cmp	r3, #47	@ 0x2f
 801d344:	d006      	beq.n	801d354 <fn_0801D328+0x2c>
 801d346:	3c01      	subs	r4, #1
 801d348:	3a01      	subs	r2, #1
 801d34a:	42a5      	cmp	r5, r4
 801d34c:	d002      	beq.n	801d354 <fn_0801D328+0x2c>
 801d34e:	7813      	ldrb	r3, [r2, #0]
 801d350:	2b3a      	cmp	r3, #58	@ 0x3a
 801d352:	d1f4      	bne.n	801d33e <fn_0801D328+0x16>
 801d354:	2208      	movs	r2, #8
 801d356:	2100      	movs	r1, #0
 801d358:	0030      	movs	r0, r6
 801d35a:	f003 fb19 	bl	8020990 <fn_08020990>
 801d35e:	7822      	ldrb	r2, [r4, #0]
 801d360:	2a00      	cmp	r2, #0
 801d362:	d059      	beq.n	801d418 <fn_0801D328+0xf0>
 801d364:	2a2e      	cmp	r2, #46	@ 0x2e
 801d366:	d057      	beq.n	801d418 <fn_0801D328+0xf0>
 801d368:	2103      	movs	r1, #3
 801d36a:	4b31      	ldr	r3, [pc, #196]	@ (801d430 <fn_0801D328+0x108>)
 801d36c:	5c98      	ldrb	r0, [r3, r2]
 801d36e:	4001      	ands	r1, r0
 801d370:	2902      	cmp	r1, #2
 801d372:	d100      	bne.n	801d376 <fn_0801D328+0x4e>
 801d374:	3a20      	subs	r2, #32
 801d376:	7032      	strb	r2, [r6, #0]
 801d378:	7862      	ldrb	r2, [r4, #1]
 801d37a:	2a00      	cmp	r2, #0
 801d37c:	d04c      	beq.n	801d418 <fn_0801D328+0xf0>
 801d37e:	2a2e      	cmp	r2, #46	@ 0x2e
 801d380:	d04a      	beq.n	801d418 <fn_0801D328+0xf0>
 801d382:	2103      	movs	r1, #3
 801d384:	5c98      	ldrb	r0, [r3, r2]
 801d386:	4001      	ands	r1, r0
 801d388:	2902      	cmp	r1, #2
 801d38a:	d100      	bne.n	801d38e <fn_0801D328+0x66>
 801d38c:	3a20      	subs	r2, #32
 801d38e:	7072      	strb	r2, [r6, #1]
 801d390:	78a2      	ldrb	r2, [r4, #2]
 801d392:	2a00      	cmp	r2, #0
 801d394:	d040      	beq.n	801d418 <fn_0801D328+0xf0>
 801d396:	2a2e      	cmp	r2, #46	@ 0x2e
 801d398:	d03e      	beq.n	801d418 <fn_0801D328+0xf0>
 801d39a:	2103      	movs	r1, #3
 801d39c:	5c98      	ldrb	r0, [r3, r2]
 801d39e:	4001      	ands	r1, r0
 801d3a0:	2902      	cmp	r1, #2
 801d3a2:	d100      	bne.n	801d3a6 <fn_0801D328+0x7e>
 801d3a4:	3a20      	subs	r2, #32
 801d3a6:	70b2      	strb	r2, [r6, #2]
 801d3a8:	78e2      	ldrb	r2, [r4, #3]
 801d3aa:	2a00      	cmp	r2, #0
 801d3ac:	d034      	beq.n	801d418 <fn_0801D328+0xf0>
 801d3ae:	2a2e      	cmp	r2, #46	@ 0x2e
 801d3b0:	d032      	beq.n	801d418 <fn_0801D328+0xf0>
 801d3b2:	2103      	movs	r1, #3
 801d3b4:	5c98      	ldrb	r0, [r3, r2]
 801d3b6:	4001      	ands	r1, r0
 801d3b8:	2902      	cmp	r1, #2
 801d3ba:	d100      	bne.n	801d3be <fn_0801D328+0x96>
 801d3bc:	3a20      	subs	r2, #32
 801d3be:	70f2      	strb	r2, [r6, #3]
 801d3c0:	7922      	ldrb	r2, [r4, #4]
 801d3c2:	2a00      	cmp	r2, #0
 801d3c4:	d028      	beq.n	801d418 <fn_0801D328+0xf0>
 801d3c6:	2a2e      	cmp	r2, #46	@ 0x2e
 801d3c8:	d026      	beq.n	801d418 <fn_0801D328+0xf0>
 801d3ca:	2103      	movs	r1, #3
 801d3cc:	5c98      	ldrb	r0, [r3, r2]
 801d3ce:	4001      	ands	r1, r0
 801d3d0:	2902      	cmp	r1, #2
 801d3d2:	d024      	beq.n	801d41e <fn_0801D328+0xf6>
 801d3d4:	7132      	strb	r2, [r6, #4]
 801d3d6:	7962      	ldrb	r2, [r4, #5]
 801d3d8:	2a00      	cmp	r2, #0
 801d3da:	d01d      	beq.n	801d418 <fn_0801D328+0xf0>
 801d3dc:	2a2e      	cmp	r2, #46	@ 0x2e
 801d3de:	d01b      	beq.n	801d418 <fn_0801D328+0xf0>
 801d3e0:	2103      	movs	r1, #3
 801d3e2:	5c98      	ldrb	r0, [r3, r2]
 801d3e4:	4001      	ands	r1, r0
 801d3e6:	2902      	cmp	r1, #2
 801d3e8:	d01b      	beq.n	801d422 <fn_0801D328+0xfa>
 801d3ea:	7172      	strb	r2, [r6, #5]
 801d3ec:	79a2      	ldrb	r2, [r4, #6]
 801d3ee:	2a00      	cmp	r2, #0
 801d3f0:	d012      	beq.n	801d418 <fn_0801D328+0xf0>
 801d3f2:	2a2e      	cmp	r2, #46	@ 0x2e
 801d3f4:	d010      	beq.n	801d418 <fn_0801D328+0xf0>
 801d3f6:	2103      	movs	r1, #3
 801d3f8:	5c98      	ldrb	r0, [r3, r2]
 801d3fa:	4001      	ands	r1, r0
 801d3fc:	2902      	cmp	r1, #2
 801d3fe:	d012      	beq.n	801d426 <fn_0801D328+0xfe>
 801d400:	71b2      	strb	r2, [r6, #6]
 801d402:	79e2      	ldrb	r2, [r4, #7]
 801d404:	2a00      	cmp	r2, #0
 801d406:	d007      	beq.n	801d418 <fn_0801D328+0xf0>
 801d408:	2a2e      	cmp	r2, #46	@ 0x2e
 801d40a:	d005      	beq.n	801d418 <fn_0801D328+0xf0>
 801d40c:	5c99      	ldrb	r1, [r3, r2]
 801d40e:	2303      	movs	r3, #3
 801d410:	400b      	ands	r3, r1
 801d412:	2b02      	cmp	r3, #2
 801d414:	d009      	beq.n	801d42a <fn_0801D328+0x102>
 801d416:	71f2      	strb	r2, [r6, #7]
 801d418:	bc70      	pop	{r4, r5, r6}
 801d41a:	bc01      	pop	{r0}
 801d41c:	4700      	bx	r0
 801d41e:	3a20      	subs	r2, #32
 801d420:	e7d8      	b.n	801d3d4 <fn_0801D328+0xac>
 801d422:	3a20      	subs	r2, #32
 801d424:	e7e1      	b.n	801d3ea <fn_0801D328+0xc2>
 801d426:	3a20      	subs	r2, #32
 801d428:	e7ea      	b.n	801d400 <fn_0801D328+0xd8>
 801d42a:	3a20      	subs	r2, #32
 801d42c:	e7f3      	b.n	801d416 <fn_0801D328+0xee>
 801d42e:	46c0      	nop			@ (mov r8, r8)
 801d430:	0814b3b9 	.word	0x0814b3b9
