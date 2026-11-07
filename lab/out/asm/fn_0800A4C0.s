fn_0800A4C0:
 800a4c0:	b5f0      	push	{r4, r5, r6, r7, lr}
 800a4c2:	4657      	mov	r7, sl
 800a4c4:	46de      	mov	lr, fp
 800a4c6:	464e      	mov	r6, r9
 800a4c8:	4645      	mov	r5, r8
 800a4ca:	4b29      	ldr	r3, [pc, #164]	@ (800a570 <fn_0800A4C0+0xb0>)
 800a4cc:	681a      	ldr	r2, [r3, #0]
 800a4ce:	235a      	movs	r3, #90	@ 0x5a
 800a4d0:	b5e0      	push	{r5, r6, r7, lr}
 800a4d2:	5cc1      	ldrb	r1, [r0, r3]
 800a4d4:	23ea      	movs	r3, #234	@ 0xea
 800a4d6:	00db      	lsls	r3, r3, #3
 800a4d8:	58d3      	ldr	r3, [r2, r3]
 800a4da:	225c      	movs	r2, #92	@ 0x5c
 800a4dc:	434a      	muls	r2, r1
 800a4de:	189b      	adds	r3, r3, r2
 800a4e0:	6cdf      	ldr	r7, [r3, #76]	@ 0x4c
 800a4e2:	2280      	movs	r2, #128	@ 0x80
 800a4e4:	6d01      	ldr	r1, [r0, #80]	@ 0x50
 800a4e6:	b09b      	sub	sp, #108	@ 0x6c
 800a4e8:	0005      	movs	r5, r0
 800a4ea:	f005 fbd1 	bl	800fc90 <fn_0800FC90>
 800a4ee:	427b      	negs	r3, r7
 800a4f0:	469a      	mov	sl, r3
 800a4f2:	001e      	movs	r6, r3
 800a4f4:	429f      	cmp	r7, r3
 800a4f6:	db31      	blt.n	800a55c <fn_0800A4C0+0x9c>
 800a4f8:	4b1e      	ldr	r3, [pc, #120]	@ (800a574 <fn_0800A4C0+0xb4>)
 800a4fa:	4699      	mov	r9, r3
 800a4fc:	0433      	lsls	r3, r6, #16
 800a4fe:	4698      	mov	r8, r3
 800a500:	4654      	mov	r4, sl
 800a502:	2264      	movs	r2, #100	@ 0x64
 800a504:	0029      	movs	r1, r5
 800a506:	a801      	add	r0, sp, #4
 800a508:	f016 f91e 	bl	8020748 <fn_08020748>
 800a50c:	9b04      	ldr	r3, [sp, #16]
 800a50e:	4443      	add	r3, r8
 800a510:	9304      	str	r3, [sp, #16]
 800a512:	9b05      	ldr	r3, [sp, #20]
 800a514:	0422      	lsls	r2, r4, #16
 800a516:	189b      	adds	r3, r3, r2
 800a518:	9305      	str	r3, [sp, #20]
 800a51a:	9b06      	ldr	r3, [sp, #24]
 800a51c:	0021      	movs	r1, r4
 800a51e:	0030      	movs	r0, r6
 800a520:	469b      	mov	fp, r3
 800a522:	f005 fc6b 	bl	800fdfc <fn_0800FDFC>
 800a526:	0480      	lsls	r0, r0, #18
 800a528:	4458      	add	r0, fp
 800a52a:	2209      	movs	r2, #9
 800a52c:	9006      	str	r0, [sp, #24]
 800a52e:	a901      	add	r1, sp, #4
 800a530:	0028      	movs	r0, r5
 800a532:	f007 fd73 	bl	801201c <fn_0801201C>
 800a536:	464a      	mov	r2, r9
 800a538:	6bc3      	ldr	r3, [r0, #60]	@ 0x3c
 800a53a:	105b      	asrs	r3, r3, #1
 800a53c:	63c3      	str	r3, [r0, #60]	@ 0x3c
 800a53e:	6c03      	ldr	r3, [r0, #64]	@ 0x40
 800a540:	105b      	asrs	r3, r3, #1
 800a542:	6403      	str	r3, [r0, #64]	@ 0x40
 800a544:	6c43      	ldr	r3, [r0, #68]	@ 0x44
 800a546:	105b      	asrs	r3, r3, #1
 800a548:	6443      	str	r3, [r0, #68]	@ 0x44
 800a54a:	6cc3      	ldr	r3, [r0, #76]	@ 0x4c
 800a54c:	3408      	adds	r4, #8
 800a54e:	4013      	ands	r3, r2
 800a550:	64c3      	str	r3, [r0, #76]	@ 0x4c
 800a552:	42a7      	cmp	r7, r4
 800a554:	dad5      	bge.n	800a502 <fn_0800A4C0+0x42>
 800a556:	3608      	adds	r6, #8
 800a558:	42b7      	cmp	r7, r6
 800a55a:	dacf      	bge.n	800a4fc <fn_0800A4C0+0x3c>
 800a55c:	b01b      	add	sp, #108	@ 0x6c
 800a55e:	bcf0      	pop	{r4, r5, r6, r7}
 800a560:	46bb      	mov	fp, r7
 800a562:	46b2      	mov	sl, r6
 800a564:	46a9      	mov	r9, r5
 800a566:	46a0      	mov	r8, r4
 800a568:	bcf0      	pop	{r4, r5, r6, r7}
 800a56a:	bc01      	pop	{r0}
 800a56c:	4700      	bx	r0
 800a56e:	46c0      	nop			@ (mov r8, r8)
 800a570:	030064c4 	.word	0x030064c4	@ data_030064C4
 800a574:	fffffdff 	.word	0xfffffdff
