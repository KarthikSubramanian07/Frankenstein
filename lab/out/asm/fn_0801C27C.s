fn_0801C27C:
 801c27c:	b5f0      	push	{r4, r5, r6, r7, lr}
 801c27e:	b083      	sub	sp, #12
 801c280:	000d      	movs	r5, r1
 801c282:	a908      	add	r1, sp, #32
 801c284:	7809      	ldrb	r1, [r1, #0]
 801c286:	2b00      	cmp	r3, #0
 801c288:	d019      	beq.n	801c2be <fn_0801C27C+0x42>
 801c28a:	4c0f      	ldr	r4, [pc, #60]	@ (801c2c8 <fn_0801C27C+0x4c>)
 801c28c:	6826      	ldr	r6, [r4, #0]
 801c28e:	01ec      	lsls	r4, r5, #7
 801c290:	00ed      	lsls	r5, r5, #3
 801c292:	1b64      	subs	r4, r4, r5
 801c294:	0064      	lsls	r4, r4, #1
 801c296:	1824      	adds	r4, r4, r0
 801c298:	480c      	ldr	r0, [pc, #48]	@ (801c2cc <fn_0801C27C+0x50>)
 801c29a:	5830      	ldr	r0, [r6, r0]
 801c29c:	1900      	adds	r0, r0, r4
 801c29e:	0894      	lsrs	r4, r2, #2
 801c2a0:	2285      	movs	r2, #133	@ 0x85
 801c2a2:	0612      	lsls	r2, r2, #24
 801c2a4:	4322      	orrs	r2, r4
 801c2a6:	4e0a      	ldr	r6, [pc, #40]	@ (801c2d0 <fn_0801C27C+0x54>)
 801c2a8:	4d0a      	ldr	r5, [pc, #40]	@ (801c2d4 <fn_0801C27C+0x58>)
 801c2aa:	4c0b      	ldr	r4, [pc, #44]	@ (801c2d8 <fn_0801C27C+0x5c>)
 801c2ac:	3b01      	subs	r3, #1
 801c2ae:	af01      	add	r7, sp, #4
 801c2b0:	9101      	str	r1, [sp, #4]
 801c2b2:	6037      	str	r7, [r6, #0]
 801c2b4:	6028      	str	r0, [r5, #0]
 801c2b6:	6022      	str	r2, [r4, #0]
 801c2b8:	30f0      	adds	r0, #240	@ 0xf0
 801c2ba:	3b01      	subs	r3, #1
 801c2bc:	d2f8      	bcs.n	801c2b0 <fn_0801C27C+0x34>
 801c2be:	b003      	add	sp, #12
 801c2c0:	bcf0      	pop	{r4, r5, r6, r7}
 801c2c2:	bc01      	pop	{r0}
 801c2c4:	4700      	bx	r0
 801c2c6:	46c0      	nop			@ (mov r8, r8)
 801c2c8:	030064c4 	.word	0x030064c4	@ data_030064C4
 801c2cc:	00005a30 	.word	0x00005a30
 801c2d0:	040000d4 	.word	0x040000d4
 801c2d4:	040000d8 	.word	0x040000d8
 801c2d8:	040000dc 	.word	0x040000dc
