fn_0801C32C:
 801c32c:	b5f0      	push	{r4, r5, r6, r7, lr}
 801c32e:	b083      	sub	sp, #12
 801c330:	000d      	movs	r5, r1
 801c332:	a908      	add	r1, sp, #32
 801c334:	7809      	ldrb	r1, [r1, #0]
 801c336:	2b00      	cmp	r3, #0
 801c338:	d019      	beq.n	801c36e <fn_0801C32C+0x42>
 801c33a:	4c0f      	ldr	r4, [pc, #60]	@ (801c378 <fn_0801C32C+0x4c>)
 801c33c:	6826      	ldr	r6, [r4, #0]
 801c33e:	01ec      	lsls	r4, r5, #7
 801c340:	00ed      	lsls	r5, r5, #3
 801c342:	1b64      	subs	r4, r4, r5
 801c344:	0064      	lsls	r4, r4, #1
 801c346:	1824      	adds	r4, r4, r0
 801c348:	480c      	ldr	r0, [pc, #48]	@ (801c37c <fn_0801C32C+0x50>)
 801c34a:	5830      	ldr	r0, [r6, r0]
 801c34c:	1900      	adds	r0, r0, r4
 801c34e:	0894      	lsrs	r4, r2, #2
 801c350:	2285      	movs	r2, #133	@ 0x85
 801c352:	0612      	lsls	r2, r2, #24
 801c354:	4322      	orrs	r2, r4
 801c356:	4e0a      	ldr	r6, [pc, #40]	@ (801c380 <fn_0801C32C+0x54>)
 801c358:	4d0a      	ldr	r5, [pc, #40]	@ (801c384 <fn_0801C32C+0x58>)
 801c35a:	4c0b      	ldr	r4, [pc, #44]	@ (801c388 <fn_0801C32C+0x5c>)
 801c35c:	3b01      	subs	r3, #1
 801c35e:	af01      	add	r7, sp, #4
 801c360:	9101      	str	r1, [sp, #4]
 801c362:	6037      	str	r7, [r6, #0]
 801c364:	6028      	str	r0, [r5, #0]
 801c366:	6022      	str	r2, [r4, #0]
 801c368:	30f0      	adds	r0, #240	@ 0xf0
 801c36a:	3b01      	subs	r3, #1
 801c36c:	d2f8      	bcs.n	801c360 <fn_0801C32C+0x34>
 801c36e:	b003      	add	sp, #12
 801c370:	bcf0      	pop	{r4, r5, r6, r7}
 801c372:	bc01      	pop	{r0}
 801c374:	4700      	bx	r0
 801c376:	46c0      	nop			@ (mov r8, r8)
 801c378:	030064c4 	.word	0x030064c4
 801c37c:	00005a30 	.word	0x00005a30
 801c380:	040000d4 	.word	0x040000d4
 801c384:	040000d8 	.word	0x040000d8
 801c388:	040000dc 	.word	0x040000dc
