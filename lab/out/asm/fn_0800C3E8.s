fn_0800C3E8:
 800c3e8:	b5f0      	push	{r4, r5, r6, r7, lr}
 800c3ea:	4645      	mov	r5, r8
 800c3ec:	46de      	mov	lr, fp
 800c3ee:	4657      	mov	r7, sl
 800c3f0:	464e      	mov	r6, r9
 800c3f2:	b5e0      	push	{r5, r6, r7, lr}
 800c3f4:	4bce      	ldr	r3, [pc, #824]	@ (800c730 <fn_0800C3E8+0x348>)
 800c3f6:	681a      	ldr	r2, [r3, #0]
 800c3f8:	4698      	mov	r8, r3
 800c3fa:	4bce      	ldr	r3, [pc, #824]	@ (800c734 <fn_0800C3E8+0x34c>)
 800c3fc:	8bc1      	ldrh	r1, [r0, #30]
 800c3fe:	58d3      	ldr	r3, [r2, r3]
 800c400:	0089      	lsls	r1, r1, #2
 800c402:	185b      	adds	r3, r3, r1
 800c404:	78db      	ldrb	r3, [r3, #3]
 800c406:	0005      	movs	r5, r0
 800c408:	b08f      	sub	sp, #60	@ 0x3c
 800c40a:	0659      	lsls	r1, r3, #25
 800c40c:	d538      	bpl.n	800c480 <fn_0800C3E8+0x98>
 800c40e:	2101      	movs	r1, #1
 800c410:	4249      	negs	r1, r1
 800c412:	f008 fe37 	bl	8015084 <fn_08015084>
 800c416:	4681      	mov	r9, r0
 800c418:	2800      	cmp	r0, #0
 800c41a:	db62      	blt.n	800c4e2 <fn_0800C3E8+0xfa>
 800c41c:	2300      	movs	r3, #0
 800c41e:	2600      	movs	r6, #0
 800c420:	9308      	str	r3, [sp, #32]
 800c422:	9307      	str	r3, [sp, #28]
 800c424:	4bc4      	ldr	r3, [pc, #784]	@ (800c738 <fn_0800C3E8+0x350>)
 800c426:	9305      	str	r3, [sp, #20]
 800c428:	24df      	movs	r4, #223	@ 0xdf
 800c42a:	464f      	mov	r7, r9
 800c42c:	0124      	lsls	r4, r4, #4
 800c42e:	4643      	mov	r3, r8
 800c430:	681a      	ldr	r2, [r3, #0]
 800c432:	5912      	ldr	r2, [r2, r4]
 800c434:	4691      	mov	r9, r2
 800c436:	00bb      	lsls	r3, r7, #2
 800c438:	19db      	adds	r3, r3, r7
 800c43a:	00db      	lsls	r3, r3, #3
 800c43c:	4499      	add	r9, r3
 800c43e:	4649      	mov	r1, r9
 800c440:	2000      	movs	r0, #0
 800c442:	f008 ffbd 	bl	80153c0 <fn_080153C0>
 800c446:	2800      	cmp	r0, #0
 800c448:	d100      	bne.n	800c44c <fn_0800C3E8+0x64>
 800c44a:	e145      	b.n	800c6d8 <fn_0800C3E8+0x2f0>
 800c44c:	0039      	movs	r1, r7
 800c44e:	0028      	movs	r0, r5
 800c450:	f008 fe18 	bl	8015084 <fn_08015084>
 800c454:	1e07      	subs	r7, r0, #0
 800c456:	daea      	bge.n	800c42e <fn_0800C3E8+0x46>
 800c458:	2e00      	cmp	r6, #0
 800c45a:	d043      	beq.n	800c4e4 <fn_0800C3E8+0xfc>
 800c45c:	4643      	mov	r3, r8
 800c45e:	4ab5      	ldr	r2, [pc, #724]	@ (800c734 <fn_0800C3E8+0x34c>)
 800c460:	6819      	ldr	r1, [r3, #0]
 800c462:	8beb      	ldrh	r3, [r5, #30]
 800c464:	5889      	ldr	r1, [r1, r2]
 800c466:	009b      	lsls	r3, r3, #2
 800c468:	18c9      	adds	r1, r1, r3
 800c46a:	2301      	movs	r3, #1
 800c46c:	78c8      	ldrb	r0, [r1, #3]
 800c46e:	09c2      	lsrs	r2, r0, #7
 800c470:	405a      	eors	r2, r3
 800c472:	237f      	movs	r3, #127	@ 0x7f
 800c474:	01d2      	lsls	r2, r2, #7
 800c476:	4003      	ands	r3, r0
 800c478:	4313      	orrs	r3, r2
 800c47a:	70cb      	strb	r3, [r1, #3]
 800c47c:	2601      	movs	r6, #1
 800c47e:	e031      	b.n	800c4e4 <fn_0800C3E8+0xfc>
 800c480:	201a      	movs	r0, #26
 800c482:	5e29      	ldrsh	r1, [r5, r0]
 800c484:	09db      	lsrs	r3, r3, #7
 800c486:	021b      	lsls	r3, r3, #8
 800c488:	404b      	eors	r3, r1
 800c48a:	49ab      	ldr	r1, [pc, #684]	@ (800c738 <fn_0800C3E8+0x350>)
 800c48c:	468c      	mov	ip, r1
 800c48e:	449c      	add	ip, r3
 800c490:	4664      	mov	r4, ip
 800c492:	2103      	movs	r1, #3
 800c494:	09a0      	lsrs	r0, r4, #6
 800c496:	4008      	ands	r0, r1
 800c498:	9007      	str	r0, [sp, #28]
 800c49a:	08e0      	lsrs	r0, r4, #3
 800c49c:	4001      	ands	r1, r0
 800c49e:	9108      	str	r1, [sp, #32]
 800c4a0:	2107      	movs	r1, #7
 800c4a2:	400b      	ands	r3, r1
 800c4a4:	3b06      	subs	r3, #6
 800c4a6:	9405      	str	r4, [sp, #20]
 800c4a8:	2b01      	cmp	r3, #1
 800c4aa:	d900      	bls.n	800c4ae <fn_0800C3E8+0xc6>
 800c4ac:	e119      	b.n	800c6e2 <fn_0800C3E8+0x2fa>
 800c4ae:	8ae9      	ldrh	r1, [r5, #22]
 800c4b0:	4ba2      	ldr	r3, [pc, #648]	@ (800c73c <fn_0800C3E8+0x354>)
 800c4b2:	4299      	cmp	r1, r3
 800c4b4:	d015      	beq.n	800c4e2 <fn_0800C3E8+0xfa>
 800c4b6:	4ba2      	ldr	r3, [pc, #648]	@ (800c740 <fn_0800C3E8+0x358>)
 800c4b8:	58d0      	ldr	r0, [r2, r3]
 800c4ba:	004b      	lsls	r3, r1, #1
 800c4bc:	185b      	adds	r3, r3, r1
 800c4be:	009b      	lsls	r3, r3, #2
 800c4c0:	18c3      	adds	r3, r0, r3
 800c4c2:	895b      	ldrh	r3, [r3, #10]
 800c4c4:	009c      	lsls	r4, r3, #2
 800c4c6:	18e4      	adds	r4, r4, r3
 800c4c8:	23df      	movs	r3, #223	@ 0xdf
 800c4ca:	011b      	lsls	r3, r3, #4
 800c4cc:	58d7      	ldr	r7, [r2, r3]
 800c4ce:	00e4      	lsls	r4, r4, #3
 800c4d0:	193f      	adds	r7, r7, r4
 800c4d2:	2f00      	cmp	r7, #0
 800c4d4:	d005      	beq.n	800c4e2 <fn_0800C3E8+0xfa>
 800c4d6:	0039      	movs	r1, r7
 800c4d8:	2000      	movs	r0, #0
 800c4da:	f008 ff71 	bl	80153c0 <fn_080153C0>
 800c4de:	2800      	cmp	r0, #0
 800c4e0:	d00a      	beq.n	800c4f8 <fn_0800C3E8+0x110>
 800c4e2:	2600      	movs	r6, #0
 800c4e4:	0030      	movs	r0, r6
 800c4e6:	b00f      	add	sp, #60	@ 0x3c
 800c4e8:	bcf0      	pop	{r4, r5, r6, r7}
 800c4ea:	46bb      	mov	fp, r7
 800c4ec:	46b2      	mov	sl, r6
 800c4ee:	46a9      	mov	r9, r5
 800c4f0:	46a0      	mov	r8, r4
 800c4f2:	bcf0      	pop	{r4, r5, r6, r7}
 800c4f4:	bc02      	pop	{r1}
 800c4f6:	4708      	bx	r1
 800c4f8:	10e2      	asrs	r2, r4, #3
 800c4fa:	08a3      	lsrs	r3, r4, #2
 800c4fc:	189b      	adds	r3, r3, r2
 800c4fe:	0119      	lsls	r1, r3, #4
 800c500:	185b      	adds	r3, r3, r1
 800c502:	0219      	lsls	r1, r3, #8
 800c504:	185b      	adds	r3, r3, r1
 800c506:	0419      	lsls	r1, r3, #16
 800c508:	185b      	adds	r3, r3, r1
 800c50a:	009b      	lsls	r3, r3, #2
 800c50c:	4699      	mov	r9, r3
 800c50e:	2301      	movs	r3, #1
 800c510:	930b      	str	r3, [sp, #44]	@ 0x2c
 800c512:	4491      	add	r9, r2
 800c514:	2200      	movs	r2, #0
 800c516:	2103      	movs	r1, #3
 800c518:	202c      	movs	r0, #44	@ 0x2c
 800c51a:	f011 f8af 	bl	801d67c <fn_0801D67C>
 800c51e:	0006      	movs	r6, r0
 800c520:	222c      	movs	r2, #44	@ 0x2c
 800c522:	2100      	movs	r1, #0
 800c524:	f014 fa34 	bl	8020990 <fn_08020990>
 800c528:	0030      	movs	r0, r6
 800c52a:	f00b fff7 	bl	801851c <fn_0801851C>
 800c52e:	2380      	movs	r3, #128	@ 0x80
 800c530:	9a05      	ldr	r2, [sp, #20]
 800c532:	005b      	lsls	r3, r3, #1
 800c534:	4013      	ands	r3, r2
 800c536:	425a      	negs	r2, r3
 800c538:	4153      	adcs	r3, r2
 800c53a:	2201      	movs	r2, #1
 800c53c:	425b      	negs	r3, r3
 800c53e:	431a      	orrs	r2, r3
 800c540:	9b08      	ldr	r3, [sp, #32]
 800c542:	2b02      	cmp	r3, #2
 800c544:	d100      	bne.n	800c548 <fn_0800C3E8+0x160>
 800c546:	e17c      	b.n	800c842 <fn_0800C3E8+0x45a>
 800c548:	2b03      	cmp	r3, #3
 800c54a:	d100      	bne.n	800c54e <fn_0800C3E8+0x166>
 800c54c:	e176      	b.n	800c83c <fn_0800C3E8+0x454>
 800c54e:	3b01      	subs	r3, #1
 800c550:	4259      	negs	r1, r3
 800c552:	414b      	adcs	r3, r1
 800c554:	0399      	lsls	r1, r3, #14
 800c556:	2380      	movs	r3, #128	@ 0x80
 800c558:	01db      	lsls	r3, r3, #7
 800c55a:	18c9      	adds	r1, r1, r3
 800c55c:	4b79      	ldr	r3, [pc, #484]	@ (800c744 <fn_0800C3E8+0x35c>)
 800c55e:	9807      	ldr	r0, [sp, #28]
 800c560:	613e      	str	r6, [r7, #16]
 800c562:	9306      	str	r3, [sp, #24]
 800c564:	60b3      	str	r3, [r6, #8]
 800c566:	1e43      	subs	r3, r0, #1
 800c568:	6172      	str	r2, [r6, #20]
 800c56a:	6137      	str	r7, [r6, #16]
 800c56c:	62b1      	str	r1, [r6, #40]	@ 0x28
 800c56e:	2b02      	cmp	r3, #2
 800c570:	d900      	bls.n	800c574 <fn_0800C3E8+0x18c>
 800c572:	e0c1      	b.n	800c6f8 <fn_0800C3E8+0x310>
 800c574:	04c3      	lsls	r3, r0, #19
 800c576:	9304      	str	r3, [sp, #16]
 800c578:	4353      	muls	r3, r2
 800c57a:	6838      	ldr	r0, [r7, #0]
 800c57c:	181b      	adds	r3, r3, r0
 800c57e:	9302      	str	r3, [sp, #8]
 800c580:	6273      	str	r3, [r6, #36]	@ 0x24
 800c582:	2324      	movs	r3, #36	@ 0x24
 800c584:	5cfb      	ldrb	r3, [r7, r3]
 800c586:	9303      	str	r3, [sp, #12]
 800c588:	2316      	movs	r3, #22
 800c58a:	81b3      	strh	r3, [r6, #12]
 800c58c:	464b      	mov	r3, r9
 800c58e:	9301      	str	r3, [sp, #4]
 800c590:	9b05      	ldr	r3, [sp, #20]
 800c592:	059b      	lsls	r3, r3, #22
 800c594:	d500      	bpl.n	800c598 <fn_0800C3E8+0x1b0>
 800c596:	e0b7      	b.n	800c708 <fn_0800C3E8+0x320>
 800c598:	464b      	mov	r3, r9
 800c59a:	9209      	str	r2, [sp, #36]	@ 0x24
 800c59c:	930c      	str	r3, [sp, #48]	@ 0x30
 800c59e:	910a      	str	r1, [sp, #40]	@ 0x28
 800c5a0:	950d      	str	r5, [sp, #52]	@ 0x34
 800c5a2:	221e      	movs	r2, #30
 800c5a4:	5ebb      	ldrsh	r3, [r7, r2]
 800c5a6:	469c      	mov	ip, r3
 800c5a8:	2b00      	cmp	r3, #0
 800c5aa:	dc00      	bgt.n	800c5ae <fn_0800C3E8+0x1c6>
 800c5ac:	e0a8      	b.n	800c700 <fn_0800C3E8+0x318>
 800c5ae:	4b63      	ldr	r3, [pc, #396]	@ (800c73c <fn_0800C3E8+0x354>)
 800c5b0:	4699      	mov	r9, r3
 800c5b2:	4663      	mov	r3, ip
 800c5b4:	4644      	mov	r4, r8
 800c5b6:	2500      	movs	r5, #0
 800c5b8:	46bb      	mov	fp, r7
 800c5ba:	46b0      	mov	r8, r6
 800c5bc:	9300      	str	r3, [sp, #0]
 800c5be:	e007      	b.n	800c5d0 <fn_0800C3E8+0x1e8>
 800c5c0:	465b      	mov	r3, fp
 800c5c2:	221e      	movs	r2, #30
 800c5c4:	5e9b      	ldrsh	r3, [r3, r2]
 800c5c6:	9300      	str	r3, [sp, #0]
 800c5c8:	9b00      	ldr	r3, [sp, #0]
 800c5ca:	3501      	adds	r5, #1
 800c5cc:	42ab      	cmp	r3, r5
 800c5ce:	dd71      	ble.n	800c6b4 <fn_0800C3E8+0x2cc>
 800c5d0:	465b      	mov	r3, fp
 800c5d2:	699b      	ldr	r3, [r3, #24]
 800c5d4:	006a      	lsls	r2, r5, #1
 800c5d6:	5ad2      	ldrh	r2, [r2, r3]
 800c5d8:	23e0      	movs	r3, #224	@ 0xe0
 800c5da:	6821      	ldr	r1, [r4, #0]
 800c5dc:	011b      	lsls	r3, r3, #4
 800c5de:	58cb      	ldr	r3, [r1, r3]
 800c5e0:	0152      	lsls	r2, r2, #5
 800c5e2:	189b      	adds	r3, r3, r2
 800c5e4:	8ad8      	ldrh	r0, [r3, #22]
 800c5e6:	4548      	cmp	r0, r9
 800c5e8:	d0ee      	beq.n	800c5c8 <fn_0800C3E8+0x1e0>
 800c5ea:	4a55      	ldr	r2, [pc, #340]	@ (800c740 <fn_0800C3E8+0x358>)
 800c5ec:	588e      	ldr	r6, [r1, r2]
 800c5ee:	8a9a      	ldrh	r2, [r3, #20]
 800c5f0:	0053      	lsls	r3, r2, #1
 800c5f2:	189b      	adds	r3, r3, r2
 800c5f4:	009b      	lsls	r3, r3, #2
 800c5f6:	18f3      	adds	r3, r6, r3
 800c5f8:	895b      	ldrh	r3, [r3, #10]
 800c5fa:	009a      	lsls	r2, r3, #2
 800c5fc:	18d2      	adds	r2, r2, r3
 800c5fe:	0053      	lsls	r3, r2, #1
 800c600:	189b      	adds	r3, r3, r2
 800c602:	011f      	lsls	r7, r3, #4
 800c604:	19db      	adds	r3, r3, r7
 800c606:	021f      	lsls	r7, r3, #8
 800c608:	19db      	adds	r3, r3, r7
 800c60a:	041f      	lsls	r7, r3, #16
 800c60c:	19db      	adds	r3, r3, r7
 800c60e:	009b      	lsls	r3, r3, #2
 800c610:	189b      	adds	r3, r3, r2
 800c612:	9a01      	ldr	r2, [sp, #4]
 800c614:	429a      	cmp	r2, r3
 800c616:	d1d7      	bne.n	800c5c8 <fn_0800C3E8+0x1e0>
 800c618:	0043      	lsls	r3, r0, #1
 800c61a:	181b      	adds	r3, r3, r0
 800c61c:	009b      	lsls	r3, r3, #2
 800c61e:	18f3      	adds	r3, r6, r3
 800c620:	895a      	ldrh	r2, [r3, #10]
 800c622:	0093      	lsls	r3, r2, #2
 800c624:	189b      	adds	r3, r3, r2
 800c626:	00db      	lsls	r3, r3, #3
 800c628:	469a      	mov	sl, r3
 800c62a:	23df      	movs	r3, #223	@ 0xdf
 800c62c:	011b      	lsls	r3, r3, #4
 800c62e:	58ce      	ldr	r6, [r1, r3]
 800c630:	2324      	movs	r3, #36	@ 0x24
 800c632:	4456      	add	r6, sl
 800c634:	5cf3      	ldrb	r3, [r6, r3]
 800c636:	9a03      	ldr	r2, [sp, #12]
 800c638:	4293      	cmp	r3, r2
 800c63a:	d1c5      	bne.n	800c5c8 <fn_0800C3E8+0x1e0>
 800c63c:	0031      	movs	r1, r6
 800c63e:	2000      	movs	r0, #0
 800c640:	f008 febe 	bl	80153c0 <fn_080153C0>
 800c644:	2800      	cmp	r0, #0
 800c646:	d1bb      	bne.n	800c5c0 <fn_0800C3E8+0x1d8>
 800c648:	0023      	movs	r3, r4
 800c64a:	4654      	mov	r4, sl
 800c64c:	46b2      	mov	sl, r6
 800c64e:	4646      	mov	r6, r8
 800c650:	10e2      	asrs	r2, r4, #3
 800c652:	08a4      	lsrs	r4, r4, #2
 800c654:	18a4      	adds	r4, r4, r2
 800c656:	4698      	mov	r8, r3
 800c658:	0123      	lsls	r3, r4, #4
 800c65a:	18e4      	adds	r4, r4, r3
 800c65c:	0223      	lsls	r3, r4, #8
 800c65e:	18e4      	adds	r4, r4, r3
 800c660:	0423      	lsls	r3, r4, #16
 800c662:	18e4      	adds	r4, r4, r3
 800c664:	00a4      	lsls	r4, r4, #2
 800c666:	18a3      	adds	r3, r4, r2
 800c668:	9301      	str	r3, [sp, #4]
 800c66a:	9a04      	ldr	r2, [sp, #16]
 800c66c:	6973      	ldr	r3, [r6, #20]
 800c66e:	435a      	muls	r2, r3
 800c670:	0013      	movs	r3, r2
 800c672:	9a02      	ldr	r2, [sp, #8]
 800c674:	4694      	mov	ip, r2
 800c676:	449c      	add	ip, r3
 800c678:	4664      	mov	r4, ip
 800c67a:	2200      	movs	r2, #0
 800c67c:	2103      	movs	r1, #3
 800c67e:	202c      	movs	r0, #44	@ 0x2c
 800c680:	9402      	str	r4, [sp, #8]
 800c682:	f010 fffb 	bl	801d67c <fn_0801D67C>
 800c686:	0006      	movs	r6, r0
 800c688:	222c      	movs	r2, #44	@ 0x2c
 800c68a:	2100      	movs	r1, #0
 800c68c:	f014 f980 	bl	8020990 <fn_08020990>
 800c690:	0030      	movs	r0, r6
 800c692:	f00b ff43 	bl	801851c <fn_0801851C>
 800c696:	4653      	mov	r3, sl
 800c698:	611e      	str	r6, [r3, #16]
 800c69a:	9b06      	ldr	r3, [sp, #24]
 800c69c:	60b3      	str	r3, [r6, #8]
 800c69e:	9b09      	ldr	r3, [sp, #36]	@ 0x24
 800c6a0:	6173      	str	r3, [r6, #20]
 800c6a2:	4653      	mov	r3, sl
 800c6a4:	6133      	str	r3, [r6, #16]
 800c6a6:	9b0a      	ldr	r3, [sp, #40]	@ 0x28
 800c6a8:	62b3      	str	r3, [r6, #40]	@ 0x28
 800c6aa:	2316      	movs	r3, #22
 800c6ac:	4657      	mov	r7, sl
 800c6ae:	6274      	str	r4, [r6, #36]	@ 0x24
 800c6b0:	81b3      	strh	r3, [r6, #12]
 800c6b2:	e776      	b.n	800c5a2 <fn_0800C3E8+0x1ba>
 800c6b4:	9b0c      	ldr	r3, [sp, #48]	@ 0x30
 800c6b6:	46a0      	mov	r8, r4
 800c6b8:	4699      	mov	r9, r3
 800c6ba:	9d0d      	ldr	r5, [sp, #52]	@ 0x34
 800c6bc:	9b0b      	ldr	r3, [sp, #44]	@ 0x2c
 800c6be:	2b00      	cmp	r3, #0
 800c6c0:	d000      	beq.n	800c6c4 <fn_0800C3E8+0x2dc>
 800c6c2:	e6db      	b.n	800c47c <fn_0800C3E8+0x94>
 800c6c4:	4649      	mov	r1, r9
 800c6c6:	0028      	movs	r0, r5
 800c6c8:	f008 fcdc 	bl	8015084 <fn_08015084>
 800c6cc:	2601      	movs	r6, #1
 800c6ce:	4681      	mov	r9, r0
 800c6d0:	2800      	cmp	r0, #0
 800c6d2:	db00      	blt.n	800c6d6 <fn_0800C3E8+0x2ee>
 800c6d4:	e6a8      	b.n	800c428 <fn_0800C3E8+0x40>
 800c6d6:	e6c1      	b.n	800c45c <fn_0800C3E8+0x74>
 800c6d8:	464b      	mov	r3, r9
 800c6da:	900b      	str	r0, [sp, #44]	@ 0x2c
 800c6dc:	46b9      	mov	r9, r7
 800c6de:	001f      	movs	r7, r3
 800c6e0:	e718      	b.n	800c514 <fn_0800C3E8+0x12c>
 800c6e2:	2101      	movs	r1, #1
 800c6e4:	0028      	movs	r0, r5
 800c6e6:	4249      	negs	r1, r1
 800c6e8:	f008 fccc 	bl	8015084 <fn_08015084>
 800c6ec:	2600      	movs	r6, #0
 800c6ee:	4681      	mov	r9, r0
 800c6f0:	2800      	cmp	r0, #0
 800c6f2:	db00      	blt.n	800c6f6 <fn_0800C3E8+0x30e>
 800c6f4:	e698      	b.n	800c428 <fn_0800C3E8+0x40>
 800c6f6:	e6f4      	b.n	800c4e2 <fn_0800C3E8+0xfa>
 800c6f8:	2380      	movs	r3, #128	@ 0x80
 800c6fa:	02db      	lsls	r3, r3, #11
 800c6fc:	9304      	str	r3, [sp, #16]
 800c6fe:	e73b      	b.n	800c578 <fn_0800C3E8+0x190>
 800c700:	9b0c      	ldr	r3, [sp, #48]	@ 0x30
 800c702:	9d0d      	ldr	r5, [sp, #52]	@ 0x34
 800c704:	4699      	mov	r9, r3
 800c706:	e7d9      	b.n	800c6bc <fn_0800C3E8+0x2d4>
 800c708:	464b      	mov	r3, r9
 800c70a:	9201      	str	r2, [sp, #4]
 800c70c:	9300      	str	r3, [sp, #0]
 800c70e:	9309      	str	r3, [sp, #36]	@ 0x24
 800c710:	9103      	str	r1, [sp, #12]
 800c712:	950a      	str	r5, [sp, #40]	@ 0x28
 800c714:	231e      	movs	r3, #30
 800c716:	5efc      	ldrsh	r4, [r7, r3]
 800c718:	2c00      	cmp	r4, #0
 800c71a:	dc00      	bgt.n	800c71e <fn_0800C3E8+0x336>
 800c71c:	e094      	b.n	800c848 <fn_0800C3E8+0x460>
 800c71e:	4b07      	ldr	r3, [pc, #28]	@ (800c73c <fn_0800C3E8+0x354>)
 800c720:	4699      	mov	r9, r3
 800c722:	4643      	mov	r3, r8
 800c724:	2500      	movs	r5, #0
 800c726:	46b0      	mov	r8, r6
 800c728:	46bb      	mov	fp, r7
 800c72a:	46a2      	mov	sl, r4
 800c72c:	001e      	movs	r6, r3
 800c72e:	e012      	b.n	800c756 <fn_0800C3E8+0x36e>
 800c730:	030064c4 	.word	0x030064c4
 800c734:	00000e04 	.word	0x00000e04
 800c738:	ffffd000 	.word	0xffffd000
 800c73c:	0000ffff 	.word	0x0000ffff
 800c740:	00000e0c 	.word	0x00000e0c
 800c744:	0800a579 	.word	0x0800a579
 800c748:	465b      	mov	r3, fp
 800c74a:	221e      	movs	r2, #30
 800c74c:	5e9b      	ldrsh	r3, [r3, r2]
 800c74e:	469a      	mov	sl, r3
 800c750:	3501      	adds	r5, #1
 800c752:	45aa      	cmp	sl, r5
 800c754:	dd6d      	ble.n	800c832 <fn_0800C3E8+0x44a>
 800c756:	465b      	mov	r3, fp
 800c758:	699b      	ldr	r3, [r3, #24]
 800c75a:	006a      	lsls	r2, r5, #1
 800c75c:	5ad2      	ldrh	r2, [r2, r3]
 800c75e:	23e0      	movs	r3, #224	@ 0xe0
 800c760:	6831      	ldr	r1, [r6, #0]
 800c762:	011b      	lsls	r3, r3, #4
 800c764:	58cb      	ldr	r3, [r1, r3]
 800c766:	0152      	lsls	r2, r2, #5
 800c768:	189b      	adds	r3, r3, r2
 800c76a:	8adc      	ldrh	r4, [r3, #22]
 800c76c:	454c      	cmp	r4, r9
 800c76e:	d0ef      	beq.n	800c750 <fn_0800C3E8+0x368>
 800c770:	4a37      	ldr	r2, [pc, #220]	@ (800c850 <fn_0800C3E8+0x468>)
 800c772:	5888      	ldr	r0, [r1, r2]
 800c774:	8a9a      	ldrh	r2, [r3, #20]
 800c776:	0053      	lsls	r3, r2, #1
 800c778:	189b      	adds	r3, r3, r2
 800c77a:	009b      	lsls	r3, r3, #2
 800c77c:	18c3      	adds	r3, r0, r3
 800c77e:	895b      	ldrh	r3, [r3, #10]
 800c780:	009a      	lsls	r2, r3, #2
 800c782:	18d2      	adds	r2, r2, r3
 800c784:	0053      	lsls	r3, r2, #1
 800c786:	189b      	adds	r3, r3, r2
 800c788:	011f      	lsls	r7, r3, #4
 800c78a:	19db      	adds	r3, r3, r7
 800c78c:	021f      	lsls	r7, r3, #8
 800c78e:	19db      	adds	r3, r3, r7
 800c790:	041f      	lsls	r7, r3, #16
 800c792:	19db      	adds	r3, r3, r7
 800c794:	009b      	lsls	r3, r3, #2
 800c796:	189b      	adds	r3, r3, r2
 800c798:	9a00      	ldr	r2, [sp, #0]
 800c79a:	429a      	cmp	r2, r3
 800c79c:	d1d8      	bne.n	800c750 <fn_0800C3E8+0x368>
 800c79e:	0063      	lsls	r3, r4, #1
 800c7a0:	191b      	adds	r3, r3, r4
 800c7a2:	009b      	lsls	r3, r3, #2
 800c7a4:	18c0      	adds	r0, r0, r3
 800c7a6:	8942      	ldrh	r2, [r0, #10]
 800c7a8:	0093      	lsls	r3, r2, #2
 800c7aa:	189b      	adds	r3, r3, r2
 800c7ac:	00db      	lsls	r3, r3, #3
 800c7ae:	469a      	mov	sl, r3
 800c7b0:	23df      	movs	r3, #223	@ 0xdf
 800c7b2:	011b      	lsls	r3, r3, #4
 800c7b4:	58cc      	ldr	r4, [r1, r3]
 800c7b6:	4454      	add	r4, sl
 800c7b8:	0021      	movs	r1, r4
 800c7ba:	2000      	movs	r0, #0
 800c7bc:	f008 fe00 	bl	80153c0 <fn_080153C0>
 800c7c0:	2800      	cmp	r0, #0
 800c7c2:	d1c1      	bne.n	800c748 <fn_0800C3E8+0x360>
 800c7c4:	4653      	mov	r3, sl
 800c7c6:	46a2      	mov	sl, r4
 800c7c8:	001c      	movs	r4, r3
 800c7ca:	0032      	movs	r2, r6
 800c7cc:	4646      	mov	r6, r8
 800c7ce:	10db      	asrs	r3, r3, #3
 800c7d0:	08a4      	lsrs	r4, r4, #2
 800c7d2:	18e4      	adds	r4, r4, r3
 800c7d4:	4690      	mov	r8, r2
 800c7d6:	0122      	lsls	r2, r4, #4
 800c7d8:	18a4      	adds	r4, r4, r2
 800c7da:	0222      	lsls	r2, r4, #8
 800c7dc:	18a4      	adds	r4, r4, r2
 800c7de:	0422      	lsls	r2, r4, #16
 800c7e0:	18a4      	adds	r4, r4, r2
 800c7e2:	00a4      	lsls	r4, r4, #2
 800c7e4:	18e3      	adds	r3, r4, r3
 800c7e6:	9300      	str	r3, [sp, #0]
 800c7e8:	9a04      	ldr	r2, [sp, #16]
 800c7ea:	6973      	ldr	r3, [r6, #20]
 800c7ec:	435a      	muls	r2, r3
 800c7ee:	0013      	movs	r3, r2
 800c7f0:	9a02      	ldr	r2, [sp, #8]
 800c7f2:	4694      	mov	ip, r2
 800c7f4:	449c      	add	ip, r3
 800c7f6:	4664      	mov	r4, ip
 800c7f8:	2200      	movs	r2, #0
 800c7fa:	2103      	movs	r1, #3
 800c7fc:	202c      	movs	r0, #44	@ 0x2c
 800c7fe:	9402      	str	r4, [sp, #8]
 800c800:	f010 ff3c 	bl	801d67c <fn_0801D67C>
 800c804:	0006      	movs	r6, r0
 800c806:	222c      	movs	r2, #44	@ 0x2c
 800c808:	2100      	movs	r1, #0
 800c80a:	f014 f8c1 	bl	8020990 <fn_08020990>
 800c80e:	0030      	movs	r0, r6
 800c810:	f00b fe84 	bl	801851c <fn_0801851C>
 800c814:	4653      	mov	r3, sl
 800c816:	611e      	str	r6, [r3, #16]
 800c818:	9b06      	ldr	r3, [sp, #24]
 800c81a:	60b3      	str	r3, [r6, #8]
 800c81c:	9b01      	ldr	r3, [sp, #4]
 800c81e:	6173      	str	r3, [r6, #20]
 800c820:	4653      	mov	r3, sl
 800c822:	6133      	str	r3, [r6, #16]
 800c824:	9b03      	ldr	r3, [sp, #12]
 800c826:	62b3      	str	r3, [r6, #40]	@ 0x28
 800c828:	2316      	movs	r3, #22
 800c82a:	4657      	mov	r7, sl
 800c82c:	6274      	str	r4, [r6, #36]	@ 0x24
 800c82e:	81b3      	strh	r3, [r6, #12]
 800c830:	e770      	b.n	800c714 <fn_0800C3E8+0x32c>
 800c832:	9b09      	ldr	r3, [sp, #36]	@ 0x24
 800c834:	46b0      	mov	r8, r6
 800c836:	4699      	mov	r9, r3
 800c838:	9d0a      	ldr	r5, [sp, #40]	@ 0x28
 800c83a:	e73f      	b.n	800c6bc <fn_0800C3E8+0x2d4>
 800c83c:	2180      	movs	r1, #128	@ 0x80
 800c83e:	02c9      	lsls	r1, r1, #11
 800c840:	e68c      	b.n	800c55c <fn_0800C3E8+0x174>
 800c842:	2180      	movs	r1, #128	@ 0x80
 800c844:	0289      	lsls	r1, r1, #10
 800c846:	e689      	b.n	800c55c <fn_0800C3E8+0x174>
 800c848:	9b09      	ldr	r3, [sp, #36]	@ 0x24
 800c84a:	9d0a      	ldr	r5, [sp, #40]	@ 0x28
 800c84c:	4699      	mov	r9, r3
 800c84e:	e735      	b.n	800c6bc <fn_0800C3E8+0x2d4>
 800c850:	00000e0c 	.word	0x00000e0c
