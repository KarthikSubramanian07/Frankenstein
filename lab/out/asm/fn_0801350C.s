fn_0801350C:
 801350c:	b5f0      	push	{r4, r5, r6, r7, lr}
 801350e:	46c6      	mov	lr, r8
 8013510:	b500      	push	{lr}
 8013512:	0005      	movs	r5, r0
 8013514:	b082      	sub	sp, #8
 8013516:	f7f3 faf3 	bl	8006b00 <fn_08006B00>
 801351a:	682b      	ldr	r3, [r5, #0]
 801351c:	4680      	mov	r8, r0
 801351e:	6a1e      	ldr	r6, [r3, #32]
 8013520:	f7f3 faee 	bl	8006b00 <fn_08006B00>
 8013524:	0004      	movs	r4, r0
 8013526:	f7f3 faeb 	bl	8006b00 <fn_08006B00>
 801352a:	1a24      	subs	r4, r4, r0
 801352c:	04a4      	lsls	r4, r4, #18
 801352e:	19a4      	adds	r4, r4, r6
 8013530:	0021      	movs	r1, r4
 8013532:	4a22      	ldr	r2, [pc, #136]	@ (80135bc <fn_0801350C+0xb0>)
 8013534:	6828      	ldr	r0, [r5, #0]
 8013536:	f7fc fabf 	bl	800fab8 <fn_0800FAB8>
 801353a:	210a      	movs	r1, #10
 801353c:	0007      	movs	r7, r0
 801353e:	4640      	mov	r0, r8
 8013540:	f012 f82a 	bl	8025598 <fn_08025598>
 8013544:	682e      	ldr	r6, [r5, #0]
 8013546:	3101      	adds	r1, #1
 8013548:	0049      	lsls	r1, r1, #1
 801354a:	0030      	movs	r0, r6
 801354c:	003b      	movs	r3, r7
 801354e:	9100      	str	r1, [sp, #0]
 8013550:	4a1a      	ldr	r2, [pc, #104]	@ (80135bc <fn_0801350C+0xb0>)
 8013552:	0021      	movs	r1, r4
 8013554:	f7fc fb0a 	bl	800fb6c <fn_0800FB6C>
 8013558:	4e19      	ldr	r6, [pc, #100]	@ (80135c0 <fn_0801350C+0xb4>)
 801355a:	4c1a      	ldr	r4, [pc, #104]	@ (80135c4 <fn_0801350C+0xb8>)
 801355c:	6833      	ldr	r3, [r6, #0]
 801355e:	591b      	ldr	r3, [r3, r4]
 8013560:	6828      	ldr	r0, [r5, #0]
 8013562:	2b00      	cmp	r3, #0
 8013564:	d026      	beq.n	80135b4 <fn_0801350C+0xa8>
 8013566:	210d      	movs	r1, #13
 8013568:	f006 ff08 	bl	801a37c <fn_0801A37C>
 801356c:	6833      	ldr	r3, [r6, #0]
 801356e:	6828      	ldr	r0, [r5, #0]
 8013570:	591a      	ldr	r2, [r3, r4]
 8013572:	300c      	adds	r0, #12
 8013574:	320c      	adds	r2, #12
 8013576:	ca0c      	ldmia	r2, {r2, r3}
 8013578:	c803      	ldmia	r0, {r0, r1}
 801357a:	f012 f849 	bl	8025610 <fn_08025610>
 801357e:	2480      	movs	r4, #128	@ 0x80
 8013580:	682a      	ldr	r2, [r5, #0]
 8013582:	6a13      	ldr	r3, [r2, #32]
 8013584:	0624      	lsls	r4, r4, #24
 8013586:	1ac1      	subs	r1, r0, r3
 8013588:	42a1      	cmp	r1, r4
 801358a:	d810      	bhi.n	80135ae <fn_0801350C+0xa2>
 801358c:	4c0e      	ldr	r4, [pc, #56]	@ (80135c8 <fn_0801350C+0xbc>)
 801358e:	191b      	adds	r3, r3, r4
 8013590:	42a1      	cmp	r1, r4
 8013592:	d901      	bls.n	8013598 <fn_0801350C+0x8c>
 8013594:	4b0d      	ldr	r3, [pc, #52]	@ (80135cc <fn_0801350C+0xc0>)
 8013596:	18c3      	adds	r3, r0, r3
 8013598:	2180      	movs	r1, #128	@ 0x80
 801359a:	6213      	str	r3, [r2, #32]
 801359c:	6cd3      	ldr	r3, [r2, #76]	@ 0x4c
 801359e:	430b      	orrs	r3, r1
 80135a0:	64d3      	str	r3, [r2, #76]	@ 0x4c
 80135a2:	b002      	add	sp, #8
 80135a4:	bc80      	pop	{r7}
 80135a6:	46b8      	mov	r8, r7
 80135a8:	bcf0      	pop	{r4, r5, r6, r7}
 80135aa:	bc01      	pop	{r0}
 80135ac:	4700      	bx	r0
 80135ae:	4908      	ldr	r1, [pc, #32]	@ (80135d0 <fn_0801350C+0xc4>)
 80135b0:	185b      	adds	r3, r3, r1
 80135b2:	e7f1      	b.n	8013598 <fn_0801350C+0x8c>
 80135b4:	210c      	movs	r1, #12
 80135b6:	f006 fee1 	bl	801a37c <fn_0801A37C>
 80135ba:	e7f2      	b.n	80135a2 <fn_0801350C+0x96>
 80135bc:	00400001 	.word	0x00400001
 80135c0:	030064c4 	.word	0x030064c4
 80135c4:	000008f4 	.word	0x000008f4
 80135c8:	03333333 	.word	0x03333333
 80135cc:	fcf3cf3d 	.word	0xfcf3cf3d
 80135d0:	fccccccd 	.word	0xfccccccd
