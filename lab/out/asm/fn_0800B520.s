fn_0800B520:
 800b520:	000a      	movs	r2, r1
 800b522:	1e53      	subs	r3, r2, #1
 800b524:	419a      	sbcs	r2, r3
 800b526:	2301      	movs	r3, #1
 800b528:	425b      	negs	r3, r3
 800b52a:	b5f0      	push	{r4, r5, r6, r7, lr}
 800b52c:	4657      	mov	r7, sl
 800b52e:	4645      	mov	r5, r8
 800b530:	46de      	mov	lr, fp
 800b532:	464e      	mov	r6, r9
 800b534:	001c      	movs	r4, r3
 800b536:	2300      	movs	r3, #0
 800b538:	b5e0      	push	{r5, r6, r7, lr}
 800b53a:	4698      	mov	r8, r3
 800b53c:	0007      	movs	r7, r0
 800b53e:	b08b      	sub	sp, #44	@ 0x2c
 800b540:	9109      	str	r1, [sp, #36]	@ 0x24
 800b542:	9206      	str	r2, [sp, #24]
 800b544:	0021      	movs	r1, r4
 800b546:	0038      	movs	r0, r7
 800b548:	f009 fd9c 	bl	8015084 <fn_08015084>
 800b54c:	1e04      	subs	r4, r0, #0
 800b54e:	da00      	bge.n	800b552 <fn_0800B520+0x32>
 800b550:	e0a6      	b.n	800b6a0 <fn_0800B520+0x180>
 800b552:	22df      	movs	r2, #223	@ 0xdf
 800b554:	4e74      	ldr	r6, [pc, #464]	@ (800b728 <fn_0800B520+0x208>)
 800b556:	6831      	ldr	r1, [r6, #0]
 800b558:	0112      	lsls	r2, r2, #4
 800b55a:	00a3      	lsls	r3, r4, #2
 800b55c:	588d      	ldr	r5, [r1, r2]
 800b55e:	191b      	adds	r3, r3, r4
 800b560:	00db      	lsls	r3, r3, #3
 800b562:	18ed      	adds	r5, r5, r3
 800b564:	0029      	movs	r1, r5
 800b566:	2000      	movs	r0, #0
 800b568:	f009 ff2a 	bl	80153c0 <fn_080153C0>
 800b56c:	4681      	mov	r9, r0
 800b56e:	2800      	cmp	r0, #0
 800b570:	d1e8      	bne.n	800b544 <fn_0800B520+0x24>
 800b572:	2200      	movs	r2, #0
 800b574:	2103      	movs	r1, #3
 800b576:	202c      	movs	r0, #44	@ 0x2c
 800b578:	f012 f880 	bl	801d67c <fn_0801D67C>
 800b57c:	4680      	mov	r8, r0
 800b57e:	222c      	movs	r2, #44	@ 0x2c
 800b580:	2100      	movs	r1, #0
 800b582:	f015 fa05 	bl	8020990 <fn_08020990>
 800b586:	4640      	mov	r0, r8
 800b588:	f00c ffc8 	bl	801851c <fn_0801851C>
 800b58c:	4643      	mov	r3, r8
 800b58e:	4642      	mov	r2, r8
 800b590:	612b      	str	r3, [r5, #16]
 800b592:	4b66      	ldr	r3, [pc, #408]	@ (800b72c <fn_0800B520+0x20c>)
 800b594:	9305      	str	r3, [sp, #20]
 800b596:	6093      	str	r3, [r2, #8]
 800b598:	2301      	movs	r3, #1
 800b59a:	6153      	str	r3, [r2, #20]
 800b59c:	2315      	movs	r3, #21
 800b59e:	7313      	strb	r3, [r2, #12]
 800b5a0:	9b09      	ldr	r3, [sp, #36]	@ 0x24
 800b5a2:	6115      	str	r5, [r2, #16]
 800b5a4:	2b01      	cmp	r3, #1
 800b5a6:	d100      	bne.n	800b5aa <fn_0800B520+0x8a>
 800b5a8:	e0b5      	b.n	800b716 <fn_0800B520+0x1f6>
 800b5aa:	2380      	movs	r3, #128	@ 0x80
 800b5ac:	01db      	lsls	r3, r3, #7
 800b5ae:	9304      	str	r3, [sp, #16]
 800b5b0:	2380      	movs	r3, #128	@ 0x80
 800b5b2:	031b      	lsls	r3, r3, #12
 800b5b4:	9303      	str	r3, [sp, #12]
 800b5b6:	4643      	mov	r3, r8
 800b5b8:	464a      	mov	r2, r9
 800b5ba:	735a      	strb	r2, [r3, #13]
 800b5bc:	9a04      	ldr	r2, [sp, #16]
 800b5be:	629a      	str	r2, [r3, #40]	@ 0x28
 800b5c0:	682b      	ldr	r3, [r5, #0]
 800b5c2:	9a03      	ldr	r2, [sp, #12]
 800b5c4:	189b      	adds	r3, r3, r2
 800b5c6:	4642      	mov	r2, r8
 800b5c8:	9302      	str	r3, [sp, #8]
 800b5ca:	6253      	str	r3, [r2, #36]	@ 0x24
 800b5cc:	2324      	movs	r3, #36	@ 0x24
 800b5ce:	5ceb      	ldrb	r3, [r5, r3]
 800b5d0:	9301      	str	r3, [sp, #4]
 800b5d2:	23e0      	movs	r3, #224	@ 0xe0
 800b5d4:	011b      	lsls	r3, r3, #4
 800b5d6:	4699      	mov	r9, r3
 800b5d8:	46a2      	mov	sl, r4
 800b5da:	46b0      	mov	r8, r6
 800b5dc:	9407      	str	r4, [sp, #28]
 800b5de:	9708      	str	r7, [sp, #32]
 800b5e0:	231e      	movs	r3, #30
 800b5e2:	5ee8      	ldrsh	r0, [r5, r3]
 800b5e4:	2800      	cmp	r0, #0
 800b5e6:	dd50      	ble.n	800b68a <fn_0800B520+0x16a>
 800b5e8:	4647      	mov	r7, r8
 800b5ea:	2400      	movs	r4, #0
 800b5ec:	4684      	mov	ip, r0
 800b5ee:	46d0      	mov	r8, sl
 800b5f0:	e002      	b.n	800b5f8 <fn_0800B520+0xd8>
 800b5f2:	3401      	adds	r4, #1
 800b5f4:	45a4      	cmp	ip, r4
 800b5f6:	dd48      	ble.n	800b68a <fn_0800B520+0x16a>
 800b5f8:	69ab      	ldr	r3, [r5, #24]
 800b5fa:	0062      	lsls	r2, r4, #1
 800b5fc:	5ad3      	ldrh	r3, [r2, r3]
 800b5fe:	464a      	mov	r2, r9
 800b600:	2104      	movs	r1, #4
 800b602:	6838      	ldr	r0, [r7, #0]
 800b604:	5882      	ldr	r2, [r0, r2]
 800b606:	015b      	lsls	r3, r3, #5
 800b608:	18d2      	adds	r2, r2, r3
 800b60a:	8b13      	ldrh	r3, [r2, #24]
 800b60c:	4219      	tst	r1, r3
 800b60e:	d0f0      	beq.n	800b5f2 <fn_0800B520+0xd2>
 800b610:	4b47      	ldr	r3, [pc, #284]	@ (800b730 <fn_0800B520+0x210>)
 800b612:	58c3      	ldr	r3, [r0, r3]
 800b614:	469a      	mov	sl, r3
 800b616:	8a91      	ldrh	r1, [r2, #20]
 800b618:	004b      	lsls	r3, r1, #1
 800b61a:	185b      	adds	r3, r3, r1
 800b61c:	009b      	lsls	r3, r3, #2
 800b61e:	4453      	add	r3, sl
 800b620:	895b      	ldrh	r3, [r3, #10]
 800b622:	0099      	lsls	r1, r3, #2
 800b624:	18c9      	adds	r1, r1, r3
 800b626:	004b      	lsls	r3, r1, #1
 800b628:	185b      	adds	r3, r3, r1
 800b62a:	011e      	lsls	r6, r3, #4
 800b62c:	199b      	adds	r3, r3, r6
 800b62e:	021e      	lsls	r6, r3, #8
 800b630:	199b      	adds	r3, r3, r6
 800b632:	041e      	lsls	r6, r3, #16
 800b634:	199b      	adds	r3, r3, r6
 800b636:	009b      	lsls	r3, r3, #2
 800b638:	185b      	adds	r3, r3, r1
 800b63a:	4598      	cmp	r8, r3
 800b63c:	d1d9      	bne.n	800b5f2 <fn_0800B520+0xd2>
 800b63e:	8ad2      	ldrh	r2, [r2, #22]
 800b640:	4b3c      	ldr	r3, [pc, #240]	@ (800b734 <fn_0800B520+0x214>)
 800b642:	429a      	cmp	r2, r3
 800b644:	d0d5      	beq.n	800b5f2 <fn_0800B520+0xd2>
 800b646:	0053      	lsls	r3, r2, #1
 800b648:	189b      	adds	r3, r3, r2
 800b64a:	009b      	lsls	r3, r3, #2
 800b64c:	4453      	add	r3, sl
 800b64e:	895a      	ldrh	r2, [r3, #10]
 800b650:	0093      	lsls	r3, r2, #2
 800b652:	189b      	adds	r3, r3, r2
 800b654:	00db      	lsls	r3, r3, #3
 800b656:	469a      	mov	sl, r3
 800b658:	23df      	movs	r3, #223	@ 0xdf
 800b65a:	011b      	lsls	r3, r3, #4
 800b65c:	58c3      	ldr	r3, [r0, r3]
 800b65e:	4453      	add	r3, sl
 800b660:	469b      	mov	fp, r3
 800b662:	2b00      	cmp	r3, #0
 800b664:	d0c5      	beq.n	800b5f2 <fn_0800B520+0xd2>
 800b666:	465a      	mov	r2, fp
 800b668:	2324      	movs	r3, #36	@ 0x24
 800b66a:	5cd3      	ldrb	r3, [r2, r3]
 800b66c:	9a01      	ldr	r2, [sp, #4]
 800b66e:	4293      	cmp	r3, r2
 800b670:	d1bf      	bne.n	800b5f2 <fn_0800B520+0xd2>
 800b672:	4659      	mov	r1, fp
 800b674:	2000      	movs	r0, #0
 800b676:	f009 fea3 	bl	80153c0 <fn_080153C0>
 800b67a:	2800      	cmp	r0, #0
 800b67c:	d01a      	beq.n	800b6b4 <fn_0800B520+0x194>
 800b67e:	221e      	movs	r2, #30
 800b680:	5eab      	ldrsh	r3, [r5, r2]
 800b682:	469c      	mov	ip, r3
 800b684:	3401      	adds	r4, #1
 800b686:	45a4      	cmp	ip, r4
 800b688:	dcb6      	bgt.n	800b5f8 <fn_0800B520+0xd8>
 800b68a:	2301      	movs	r3, #1
 800b68c:	9c07      	ldr	r4, [sp, #28]
 800b68e:	9f08      	ldr	r7, [sp, #32]
 800b690:	0021      	movs	r1, r4
 800b692:	0038      	movs	r0, r7
 800b694:	4698      	mov	r8, r3
 800b696:	f009 fcf5 	bl	8015084 <fn_08015084>
 800b69a:	1e04      	subs	r4, r0, #0
 800b69c:	db00      	blt.n	800b6a0 <fn_0800B520+0x180>
 800b69e:	e758      	b.n	800b552 <fn_0800B520+0x32>
 800b6a0:	4640      	mov	r0, r8
 800b6a2:	b00b      	add	sp, #44	@ 0x2c
 800b6a4:	bcf0      	pop	{r4, r5, r6, r7}
 800b6a6:	46bb      	mov	fp, r7
 800b6a8:	46b2      	mov	sl, r6
 800b6aa:	46a9      	mov	r9, r5
 800b6ac:	46a0      	mov	r8, r4
 800b6ae:	bcf0      	pop	{r4, r5, r6, r7}
 800b6b0:	bc02      	pop	{r1}
 800b6b2:	4708      	bx	r1
 800b6b4:	4652      	mov	r2, sl
 800b6b6:	4653      	mov	r3, sl
 800b6b8:	46b8      	mov	r8, r7
 800b6ba:	10db      	asrs	r3, r3, #3
 800b6bc:	0897      	lsrs	r7, r2, #2
 800b6be:	18ff      	adds	r7, r7, r3
 800b6c0:	013a      	lsls	r2, r7, #4
 800b6c2:	18bf      	adds	r7, r7, r2
 800b6c4:	023a      	lsls	r2, r7, #8
 800b6c6:	18bf      	adds	r7, r7, r2
 800b6c8:	043a      	lsls	r2, r7, #16
 800b6ca:	18bf      	adds	r7, r7, r2
 800b6cc:	00bf      	lsls	r7, r7, #2
 800b6ce:	18fb      	adds	r3, r7, r3
 800b6d0:	9d02      	ldr	r5, [sp, #8]
 800b6d2:	469a      	mov	sl, r3
 800b6d4:	9b03      	ldr	r3, [sp, #12]
 800b6d6:	2200      	movs	r2, #0
 800b6d8:	18ed      	adds	r5, r5, r3
 800b6da:	2103      	movs	r1, #3
 800b6dc:	202c      	movs	r0, #44	@ 0x2c
 800b6de:	9502      	str	r5, [sp, #8]
 800b6e0:	f011 ffcc 	bl	801d67c <fn_0801D67C>
 800b6e4:	0004      	movs	r4, r0
 800b6e6:	222c      	movs	r2, #44	@ 0x2c
 800b6e8:	2100      	movs	r1, #0
 800b6ea:	f015 f951 	bl	8020990 <fn_08020990>
 800b6ee:	0020      	movs	r0, r4
 800b6f0:	f00c ff14 	bl	801851c <fn_0801851C>
 800b6f4:	465b      	mov	r3, fp
 800b6f6:	611c      	str	r4, [r3, #16]
 800b6f8:	9b05      	ldr	r3, [sp, #20]
 800b6fa:	60a3      	str	r3, [r4, #8]
 800b6fc:	2301      	movs	r3, #1
 800b6fe:	6163      	str	r3, [r4, #20]
 800b700:	465b      	mov	r3, fp
 800b702:	6123      	str	r3, [r4, #16]
 800b704:	9b04      	ldr	r3, [sp, #16]
 800b706:	62a3      	str	r3, [r4, #40]	@ 0x28
 800b708:	2315      	movs	r3, #21
 800b70a:	7323      	strb	r3, [r4, #12]
 800b70c:	9b06      	ldr	r3, [sp, #24]
 800b70e:	6265      	str	r5, [r4, #36]	@ 0x24
 800b710:	7363      	strb	r3, [r4, #13]
 800b712:	465d      	mov	r5, fp
 800b714:	e764      	b.n	800b5e0 <fn_0800B520+0xc0>
 800b716:	4699      	mov	r9, r3
 800b718:	2380      	movs	r3, #128	@ 0x80
 800b71a:	02db      	lsls	r3, r3, #11
 800b71c:	9304      	str	r3, [sp, #16]
 800b71e:	2380      	movs	r3, #128	@ 0x80
 800b720:	035b      	lsls	r3, r3, #13
 800b722:	9303      	str	r3, [sp, #12]
 800b724:	e747      	b.n	800b5b6 <fn_0800B520+0x96>
 800b726:	46c0      	nop			@ (mov r8, r8)
 800b728:	030064c4 	.word	0x030064c4	@ data_030064C4
 800b72c:	0800a579 	.word	0x0800a579	@ fn_0800A578
 800b730:	00000e0c 	.word	0x00000e0c
 800b734:	0000ffff 	.word	0x0000ffff
