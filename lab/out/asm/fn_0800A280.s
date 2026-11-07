fn_0800A280:
 800a280:	b5f0      	push	{r4, r5, r6, r7, lr}
 800a282:	4b1e      	ldr	r3, [pc, #120]	@ (800a2fc <fn_0800A280+0x7c>)
 800a284:	68c4      	ldr	r4, [r0, #12]
 800a286:	18e4      	adds	r4, r4, r3
 800a288:	2307      	movs	r3, #7
 800a28a:	46c6      	mov	lr, r8
 800a28c:	0005      	movs	r5, r0
 800a28e:	2656      	movs	r6, #86	@ 0x56
 800a290:	4698      	mov	r8, r3
 800a292:	b500      	push	{lr}
 800a294:	4b1a      	ldr	r3, [pc, #104]	@ (800a300 <fn_0800A280+0x80>)
 800a296:	692f      	ldr	r7, [r5, #16]
 800a298:	18ff      	adds	r7, r7, r3
 800a29a:	f7fc fc31 	bl	8006b00 <fn_08006B00>
 800a29e:	0442      	lsls	r2, r0, #17
 800a2a0:	2321      	movs	r3, #33	@ 0x21
 800a2a2:	0039      	movs	r1, r7
 800a2a4:	3280      	adds	r2, #128	@ 0x80
 800a2a6:	0020      	movs	r0, r4
 800a2a8:	f006 fda0 	bl	8010dec <fn_08010DEC>
 800a2ac:	0007      	movs	r7, r0
 800a2ae:	f7fc fc27 	bl	8006b00 <fn_08006B00>
 800a2b2:	0240      	lsls	r0, r0, #9
 800a2b4:	6478      	str	r0, [r7, #68]	@ 0x44
 800a2b6:	4913      	ldr	r1, [pc, #76]	@ (800a304 <fn_0800A280+0x84>)
 800a2b8:	0038      	movs	r0, r7
 800a2ba:	f006 ffa7 	bl	801120c <fn_0801120C>
 800a2be:	f7fc fc1f 	bl	8006b00 <fn_08006B00>
 800a2c2:	4643      	mov	r3, r8
 800a2c4:	4018      	ands	r0, r3
 800a2c6:	5bbb      	ldrh	r3, [r7, r6]
 800a2c8:	1a18      	subs	r0, r3, r0
 800a2ca:	1c03      	adds	r3, r0, #0
 800a2cc:	0400      	lsls	r0, r0, #16
 800a2ce:	1400      	asrs	r0, r0, #16
 800a2d0:	2800      	cmp	r0, #0
 800a2d2:	dc00      	bgt.n	800a2d6 <fn_0800A280+0x56>
 800a2d4:	2301      	movs	r3, #1
 800a2d6:	53bb      	strh	r3, [r7, r6]
 800a2d8:	2380      	movs	r3, #128	@ 0x80
 800a2da:	031b      	lsls	r3, r3, #12
 800a2dc:	4a0a      	ldr	r2, [pc, #40]	@ (800a308 <fn_0800A280+0x88>)
 800a2de:	18e4      	adds	r4, r4, r3
 800a2e0:	68eb      	ldr	r3, [r5, #12]
 800a2e2:	189b      	adds	r3, r3, r2
 800a2e4:	42a3      	cmp	r3, r4
 800a2e6:	dad5      	bge.n	800a294 <fn_0800A280+0x14>
 800a2e8:	2162      	movs	r1, #98	@ 0x62
 800a2ea:	2000      	movs	r0, #0
 800a2ec:	f010 f846 	bl	801a37c <fn_0801A37C>
 800a2f0:	bc80      	pop	{r7}
 800a2f2:	46b8      	mov	r8, r7
 800a2f4:	bcf0      	pop	{r4, r5, r6, r7}
 800a2f6:	bc01      	pop	{r0}
 800a2f8:	4700      	bx	r0
 800a2fa:	46c0      	nop			@ (mov r8, r8)
 800a2fc:	ff3c0000 	.word	0xff3c0000
 800a300:	fec00000 	.word	0xfec00000
 800a304:	0000031f 	.word	0x0000031f
 800a308:	013fffff 	.word	0x013fffff
