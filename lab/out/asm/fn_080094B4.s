fn_080094B4:
 80094b4:	6d02      	ldr	r2, [r0, #80]	@ 0x50
 80094b6:	b570      	push	{r4, r5, r6, lr}
 80094b8:	0004      	movs	r4, r0
 80094ba:	2a00      	cmp	r2, #0
 80094bc:	d025      	beq.n	800950a <fn_080094B4+0x56>
 80094be:	2120      	movs	r1, #32
 80094c0:	6cc3      	ldr	r3, [r0, #76]	@ 0x4c
 80094c2:	320c      	adds	r2, #12
 80094c4:	438b      	bics	r3, r1
 80094c6:	64c3      	str	r3, [r0, #76]	@ 0x4c
 80094c8:	6901      	ldr	r1, [r0, #16]
 80094ca:	ca0c      	ldmia	r2, {r2, r3}
 80094cc:	68c0      	ldr	r0, [r0, #12]
 80094ce:	f01c f847 	bl	8025560 <fn_08025560>
 80094d2:	6d25      	ldr	r5, [r4, #80]	@ 0x50
 80094d4:	6ceb      	ldr	r3, [r5, #76]	@ 0x4c
 80094d6:	6220      	str	r0, [r4, #32]
 80094d8:	035b      	lsls	r3, r3, #13
 80094da:	d419      	bmi.n	8009510 <fn_080094B4+0x5c>
 80094dc:	6923      	ldr	r3, [r4, #16]
 80094de:	6929      	ldr	r1, [r5, #16]
 80094e0:	68e8      	ldr	r0, [r5, #12]
 80094e2:	1ac9      	subs	r1, r1, r3
 80094e4:	68e3      	ldr	r3, [r4, #12]
 80094e6:	1ac0      	subs	r0, r0, r3
 80094e8:	f006 fc88 	bl	800fdfc <fn_0800FDFC>
 80094ec:	4b1d      	ldr	r3, [pc, #116]	@ (8009564 <fn_080094B4+0xb0>)
 80094ee:	681a      	ldr	r2, [r3, #0]
 80094f0:	235a      	movs	r3, #90	@ 0x5a
 80094f2:	5ce9      	ldrb	r1, [r5, r3]
 80094f4:	23ea      	movs	r3, #234	@ 0xea
 80094f6:	00db      	lsls	r3, r3, #3
 80094f8:	58d3      	ldr	r3, [r2, r3]
 80094fa:	225c      	movs	r2, #92	@ 0x5c
 80094fc:	434a      	muls	r2, r1
 80094fe:	189b      	adds	r3, r3, r2
 8009500:	6c1b      	ldr	r3, [r3, #64]	@ 0x40
 8009502:	4a19      	ldr	r2, [pc, #100]	@ (8009568 <fn_080094B4+0xb4>)
 8009504:	189b      	adds	r3, r3, r2
 8009506:	4283      	cmp	r3, r0
 8009508:	da10      	bge.n	800952c <fn_080094B4+0x78>
 800950a:	bc70      	pop	{r4, r5, r6}
 800950c:	bc01      	pop	{r0}
 800950e:	4700      	bx	r0
 8009510:	f7fd faf6 	bl	8006b00 <fn_08006B00>
 8009514:	0005      	movs	r5, r0
 8009516:	f7fd faf3 	bl	8006b00 <fn_08006B00>
 800951a:	6a23      	ldr	r3, [r4, #32]
 800951c:	1a2d      	subs	r5, r5, r0
 800951e:	056d      	lsls	r5, r5, #21
 8009520:	195b      	adds	r3, r3, r5
 8009522:	6d25      	ldr	r5, [r4, #80]	@ 0x50
 8009524:	6223      	str	r3, [r4, #32]
 8009526:	2d00      	cmp	r5, #0
 8009528:	d0ef      	beq.n	800950a <fn_080094B4+0x56>
 800952a:	e7d7      	b.n	80094dc <fn_080094B4+0x28>
 800952c:	0029      	movs	r1, r5
 800952e:	0020      	movs	r0, r4
 8009530:	f00a feac 	bl	801428c <fn_0801428C>
 8009534:	2800      	cmp	r0, #0
 8009536:	d0e8      	beq.n	800950a <fn_080094B4+0x56>
 8009538:	f7fd fae2 	bl	8006b00 <fn_08006B00>
 800953c:	0005      	movs	r5, r0
 800953e:	2135      	movs	r1, #53	@ 0x35
 8009540:	0020      	movs	r0, r4
 8009542:	f010 fec1 	bl	801a2c8 <fn_0801A2C8>
 8009546:	0028      	movs	r0, r5
 8009548:	210a      	movs	r1, #10
 800954a:	f01b ffcd 	bl	80254e8 <fn_080254E8>
 800954e:	3101      	adds	r1, #1
 8009550:	004b      	lsls	r3, r1, #1
 8009552:	185b      	adds	r3, r3, r1
 8009554:	0022      	movs	r2, r4
 8009556:	0021      	movs	r1, r4
 8009558:	6d20      	ldr	r0, [r4, #80]	@ 0x50
 800955a:	005b      	lsls	r3, r3, #1
 800955c:	f004 fa2e 	bl	800d9bc <fn_0800D9BC>
 8009560:	e7d3      	b.n	800950a <fn_080094B4+0x56>
 8009562:	46c0      	nop			@ (mov r8, r8)
 8009564:	030064c4 	.word	0x030064c4
 8009568:	002bffff 	.word	0x002bffff
