fn_0800E3C4:
 800e3c4:	b5f0      	push	{r4, r5, r6, r7, lr}
 800e3c6:	46ce      	mov	lr, r9
 800e3c8:	4647      	mov	r7, r8
 800e3ca:	2307      	movs	r3, #7
 800e3cc:	b580      	push	{r7, lr}
 800e3ce:	6cc1      	ldr	r1, [r0, #76]	@ 0x4c
 800e3d0:	0004      	movs	r4, r0
 800e3d2:	4699      	mov	r9, r3
 800e3d4:	b083      	sub	sp, #12
 800e3d6:	420b      	tst	r3, r1
 800e3d8:	d059      	beq.n	800e48e <fn_0800E3C4+0xca>
 800e3da:	4f67      	ldr	r7, [pc, #412]	@ (800e578 <fn_0800E3C4+0x1b4>)
 800e3dc:	683b      	ldr	r3, [r7, #0]
 800e3de:	001a      	movs	r2, r3
 800e3e0:	001e      	movs	r6, r3
 800e3e2:	4b66      	ldr	r3, [pc, #408]	@ (800e57c <fn_0800E3C4+0x1b8>)
 800e3e4:	58d5      	ldr	r5, [r2, r3]
 800e3e6:	235b      	movs	r3, #91	@ 0x5b
 800e3e8:	5cc2      	ldrb	r2, [r0, r3]
 800e3ea:	5ceb      	ldrb	r3, [r5, r3]
 800e3ec:	189b      	adds	r3, r3, r2
 800e3ee:	68c2      	ldr	r2, [r0, #12]
 800e3f0:	2089      	movs	r0, #137	@ 0x89
 800e3f2:	0100      	lsls	r0, r0, #4
 800e3f4:	5830      	ldr	r0, [r6, r0]
 800e3f6:	1a12      	subs	r2, r2, r0
 800e3f8:	17d0      	asrs	r0, r2, #31
 800e3fa:	1812      	adds	r2, r2, r0
 800e3fc:	041b      	lsls	r3, r3, #16
 800e3fe:	4042      	eors	r2, r0
 800e400:	4293      	cmp	r3, r2
 800e402:	dd44      	ble.n	800e48e <fn_0800E3C4+0xca>
 800e404:	4a5e      	ldr	r2, [pc, #376]	@ (800e580 <fn_0800E3C4+0x1bc>)
 800e406:	6920      	ldr	r0, [r4, #16]
 800e408:	58b2      	ldr	r2, [r6, r2]
 800e40a:	1a80      	subs	r0, r0, r2
 800e40c:	17c2      	asrs	r2, r0, #31
 800e40e:	1880      	adds	r0, r0, r2
 800e410:	4050      	eors	r0, r2
 800e412:	17c6      	asrs	r6, r0, #31
 800e414:	0fda      	lsrs	r2, r3, #31
 800e416:	4298      	cmp	r0, r3
 800e418:	4156      	adcs	r6, r2
 800e41a:	1b62      	subs	r2, r4, r5
 800e41c:	4250      	negs	r0, r2
 800e41e:	4142      	adcs	r2, r0
 800e420:	0033      	movs	r3, r6
 800e422:	4313      	orrs	r3, r2
 800e424:	061b      	lsls	r3, r3, #24
 800e426:	0e1a      	lsrs	r2, r3, #24
 800e428:	4690      	mov	r8, r2
 800e42a:	2b00      	cmp	r3, #0
 800e42c:	d131      	bne.n	800e492 <fn_0800E3C4+0xce>
 800e42e:	6ceb      	ldr	r3, [r5, #76]	@ 0x4c
 800e430:	01da      	lsls	r2, r3, #7
 800e432:	d436      	bmi.n	800e4a2 <fn_0800E3C4+0xde>
 800e434:	03da      	lsls	r2, r3, #15
 800e436:	d524      	bpl.n	800e482 <fn_0800E3C4+0xbe>
 800e438:	6960      	ldr	r0, [r4, #20]
 800e43a:	6ba2      	ldr	r2, [r4, #56]	@ 0x38
 800e43c:	696b      	ldr	r3, [r5, #20]
 800e43e:	1882      	adds	r2, r0, r2
 800e440:	4293      	cmp	r3, r2
 800e442:	dc24      	bgt.n	800e48e <fn_0800E3C4+0xca>
 800e444:	6baa      	ldr	r2, [r5, #56]	@ 0x38
 800e446:	189b      	adds	r3, r3, r2
 800e448:	4298      	cmp	r0, r3
 800e44a:	dc20      	bgt.n	800e48e <fn_0800E3C4+0xca>
 800e44c:	6d2b      	ldr	r3, [r5, #80]	@ 0x50
 800e44e:	2b00      	cmp	r3, #0
 800e450:	d00d      	beq.n	800e46e <fn_0800E3C4+0xaa>
 800e452:	225a      	movs	r2, #90	@ 0x5a
 800e454:	5c98      	ldrb	r0, [r3, r2]
 800e456:	5ca2      	ldrb	r2, [r4, r2]
 800e458:	4290      	cmp	r0, r2
 800e45a:	d100      	bne.n	800e45e <fn_0800E3C4+0x9a>
 800e45c:	e07d      	b.n	800e55a <fn_0800E3C4+0x196>
 800e45e:	2811      	cmp	r0, #17
 800e460:	d100      	bne.n	800e464 <fn_0800E3C4+0xa0>
 800e462:	e080      	b.n	800e566 <fn_0800E3C4+0x1a2>
 800e464:	2a11      	cmp	r2, #17
 800e466:	d102      	bne.n	800e46e <fn_0800E3C4+0xaa>
 800e468:	280f      	cmp	r0, #15
 800e46a:	d100      	bne.n	800e46e <fn_0800E3C4+0xaa>
 800e46c:	e07e      	b.n	800e56c <fn_0800E3C4+0x1a8>
 800e46e:	074b      	lsls	r3, r1, #29
 800e470:	d454      	bmi.n	800e51c <fn_0800E3C4+0x158>
 800e472:	078b      	lsls	r3, r1, #30
 800e474:	2201      	movs	r2, #1
 800e476:	0fdb      	lsrs	r3, r3, #31
 800e478:	4053      	eors	r3, r2
 800e47a:	061b      	lsls	r3, r3, #24
 800e47c:	0e1b      	lsrs	r3, r3, #24
 800e47e:	4698      	mov	r8, r3
 800e480:	e007      	b.n	800e492 <fn_0800E3C4+0xce>
 800e482:	07ca      	lsls	r2, r1, #31
 800e484:	d43e      	bmi.n	800e504 <fn_0800E3C4+0x140>
 800e486:	4a3f      	ldr	r2, [pc, #252]	@ (800e584 <fn_0800E3C4+0x1c0>)
 800e488:	4011      	ands	r1, r2
 800e48a:	2902      	cmp	r1, #2
 800e48c:	d038      	beq.n	800e500 <fn_0800E3C4+0x13c>
 800e48e:	2301      	movs	r3, #1
 800e490:	4698      	mov	r8, r3
 800e492:	4640      	mov	r0, r8
 800e494:	b003      	add	sp, #12
 800e496:	bcc0      	pop	{r6, r7}
 800e498:	46b9      	mov	r9, r7
 800e49a:	46b0      	mov	r8, r6
 800e49c:	bcf0      	pop	{r4, r5, r6, r7}
 800e49e:	bc02      	pop	{r1}
 800e4a0:	4708      	bx	r1
 800e4a2:	f7f8 fb2d 	bl	8006b00 <fn_08006B00>
 800e4a6:	235a      	movs	r3, #90	@ 0x5a
 800e4a8:	265c      	movs	r6, #92	@ 0x5c
 800e4aa:	21ea      	movs	r1, #234	@ 0xea
 800e4ac:	5ceb      	ldrb	r3, [r5, r3]
 800e4ae:	435e      	muls	r6, r3
 800e4b0:	683a      	ldr	r2, [r7, #0]
 800e4b2:	00c9      	lsls	r1, r1, #3
 800e4b4:	5852      	ldr	r2, [r2, r1]
 800e4b6:	1992      	adds	r2, r2, r6
 800e4b8:	464e      	mov	r6, r9
 800e4ba:	17c3      	asrs	r3, r0, #31
 800e4bc:	0f5b      	lsrs	r3, r3, #29
 800e4be:	18c0      	adds	r0, r0, r3
 800e4c0:	4006      	ands	r6, r0
 800e4c2:	1af6      	subs	r6, r6, r3
 800e4c4:	6cd3      	ldr	r3, [r2, #76]	@ 0x4c
 800e4c6:	3601      	adds	r6, #1
 800e4c8:	002a      	movs	r2, r5
 800e4ca:	0029      	movs	r1, r5
 800e4cc:	0020      	movs	r0, r4
 800e4ce:	4373      	muls	r3, r6
 800e4d0:	f7ff fa74 	bl	800d9bc <fn_0800D9BC>
 800e4d4:	6ceb      	ldr	r3, [r5, #76]	@ 0x4c
 800e4d6:	4a2c      	ldr	r2, [pc, #176]	@ (800e588 <fn_0800E3C4+0x1c4>)
 800e4d8:	4013      	ands	r3, r2
 800e4da:	64eb      	str	r3, [r5, #76]	@ 0x4c
 800e4dc:	4643      	mov	r3, r8
 800e4de:	21ea      	movs	r1, #234	@ 0xea
 800e4e0:	646b      	str	r3, [r5, #68]	@ 0x44
 800e4e2:	642b      	str	r3, [r5, #64]	@ 0x40
 800e4e4:	63eb      	str	r3, [r5, #60]	@ 0x3c
 800e4e6:	683a      	ldr	r2, [r7, #0]
 800e4e8:	235a      	movs	r3, #90	@ 0x5a
 800e4ea:	00c9      	lsls	r1, r1, #3
 800e4ec:	5852      	ldr	r2, [r2, r1]
 800e4ee:	215c      	movs	r1, #92	@ 0x5c
 800e4f0:	5ceb      	ldrb	r3, [r5, r3]
 800e4f2:	4359      	muls	r1, r3
 800e4f4:	1853      	adds	r3, r2, r1
 800e4f6:	0028      	movs	r0, r5
 800e4f8:	8899      	ldrh	r1, [r3, #4]
 800e4fa:	f002 fe87 	bl	801120c <fn_0801120C>
 800e4fe:	e7c8      	b.n	800e492 <fn_0800E3C4+0xce>
 800e500:	079b      	lsls	r3, r3, #30
 800e502:	e7b7      	b.n	800e474 <fn_0800E3C4+0xb0>
 800e504:	2602      	movs	r6, #2
 800e506:	400e      	ands	r6, r1
 800e508:	051b      	lsls	r3, r3, #20
 800e50a:	d421      	bmi.n	800e550 <fn_0800E3C4+0x18c>
 800e50c:	2280      	movs	r2, #128	@ 0x80
 800e50e:	07b3      	lsls	r3, r6, #30
 800e510:	0612      	lsls	r2, r2, #24
 800e512:	189b      	adds	r3, r3, r2
 800e514:	09db      	lsrs	r3, r3, #7
 800e516:	0e1b      	lsrs	r3, r3, #24
 800e518:	4698      	mov	r8, r3
 800e51a:	e7ba      	b.n	800e492 <fn_0800E3C4+0xce>
 800e51c:	f7f8 faf0 	bl	8006b00 <fn_08006B00>
 800e520:	235a      	movs	r3, #90	@ 0x5a
 800e522:	5cea      	ldrb	r2, [r5, r3]
 800e524:	23ea      	movs	r3, #234	@ 0xea
 800e526:	6839      	ldr	r1, [r7, #0]
 800e528:	00db      	lsls	r3, r3, #3
 800e52a:	58c9      	ldr	r1, [r1, r3]
 800e52c:	235c      	movs	r3, #92	@ 0x5c
 800e52e:	4353      	muls	r3, r2
 800e530:	2207      	movs	r2, #7
 800e532:	18c9      	adds	r1, r1, r3
 800e534:	17c3      	asrs	r3, r0, #31
 800e536:	0f5b      	lsrs	r3, r3, #29
 800e538:	18c0      	adds	r0, r0, r3
 800e53a:	4002      	ands	r2, r0
 800e53c:	1ad2      	subs	r2, r2, r3
 800e53e:	6ccb      	ldr	r3, [r1, #76]	@ 0x4c
 800e540:	3201      	adds	r2, #1
 800e542:	4353      	muls	r3, r2
 800e544:	0029      	movs	r1, r5
 800e546:	0020      	movs	r0, r4
 800e548:	6d2a      	ldr	r2, [r5, #80]	@ 0x50
 800e54a:	f7ff fa37 	bl	800d9bc <fn_0800D9BC>
 800e54e:	e7a0      	b.n	800e492 <fn_0800E3C4+0xce>
 800e550:	0029      	movs	r1, r5
 800e552:	0020      	movs	r0, r4
 800e554:	f7fe fdfa 	bl	800d14c <fn_0800D14C>
 800e558:	e7d8      	b.n	800e50c <fn_0800E3C4+0x148>
 800e55a:	42a3      	cmp	r3, r4
 800e55c:	d097      	beq.n	800e48e <fn_0800E3C4+0xca>
 800e55e:	2a00      	cmp	r2, #0
 800e560:	d100      	bne.n	800e564 <fn_0800E3C4+0x1a0>
 800e562:	e784      	b.n	800e46e <fn_0800E3C4+0xaa>
 800e564:	e795      	b.n	800e492 <fn_0800E3C4+0xce>
 800e566:	2a0f      	cmp	r2, #15
 800e568:	d000      	beq.n	800e56c <fn_0800E3C4+0x1a8>
 800e56a:	e780      	b.n	800e46e <fn_0800E3C4+0xaa>
 800e56c:	1b1b      	subs	r3, r3, r4
 800e56e:	425a      	negs	r2, r3
 800e570:	415a      	adcs	r2, r3
 800e572:	4690      	mov	r8, r2
 800e574:	e78d      	b.n	800e492 <fn_0800E3C4+0xce>
 800e576:	46c0      	nop			@ (mov r8, r8)
 800e578:	030064c4 	.word	0x030064c4	@ data_030064C4
 800e57c:	0000088c 	.word	0x0000088c
 800e580:	00000894 	.word	0x00000894
 800e584:	00001002 	.word	0x00001002
 800e588:	feffffff 	.word	0xfeffffff
