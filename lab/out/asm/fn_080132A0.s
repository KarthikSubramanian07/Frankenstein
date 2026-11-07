fn_080132A0:
 80132a0:	b570      	push	{r4, r5, r6, lr}
 80132a2:	7b43      	ldrb	r3, [r0, #13]
 80132a4:	0004      	movs	r4, r0
 80132a6:	07db      	lsls	r3, r3, #31
 80132a8:	d503      	bpl.n	80132b2 <fn_080132A0+0x12>
 80132aa:	2354      	movs	r3, #84	@ 0x54
 80132ac:	5cc3      	ldrb	r3, [r0, r3]
 80132ae:	2b0a      	cmp	r3, #10
 80132b0:	d005      	beq.n	80132be <fn_080132A0+0x1e>
 80132b2:	23a8      	movs	r3, #168	@ 0xa8
 80132b4:	2200      	movs	r2, #0
 80132b6:	50e2      	str	r2, [r4, r3]
 80132b8:	bc70      	pop	{r4, r5, r6}
 80132ba:	bc01      	pop	{r0}
 80132bc:	4700      	bx	r0
 80132be:	6a83      	ldr	r3, [r0, #40]	@ 0x28
 80132c0:	2b00      	cmp	r3, #0
 80132c2:	d0f6      	beq.n	80132b2 <fn_080132A0+0x12>
 80132c4:	22a8      	movs	r2, #168	@ 0xa8
 80132c6:	5883      	ldr	r3, [r0, r2]
 80132c8:	3301      	adds	r3, #1
 80132ca:	5083      	str	r3, [r0, r2]
 80132cc:	4b1b      	ldr	r3, [pc, #108]	@ (801333c <fn_080132A0+0x9c>)
 80132ce:	6818      	ldr	r0, [r3, #0]
 80132d0:	001d      	movs	r5, r3
 80132d2:	2353      	movs	r3, #83	@ 0x53
 80132d4:	4a1a      	ldr	r2, [pc, #104]	@ (8013340 <fn_080132A0+0xa0>)
 80132d6:	5ce3      	ldrb	r3, [r4, r3]
 80132d8:	5881      	ldr	r1, [r0, r2]
 80132da:	005a      	lsls	r2, r3, #1
 80132dc:	18d2      	adds	r2, r2, r3
 80132de:	00d2      	lsls	r2, r2, #3
 80132e0:	5851      	ldr	r1, [r2, r1]
 80132e2:	060a      	lsls	r2, r1, #24
 80132e4:	0e12      	lsrs	r2, r2, #24
 80132e6:	2b06      	cmp	r3, #6
 80132e8:	d022      	beq.n	8013330 <fn_080132A0+0x90>
 80132ea:	3b08      	subs	r3, #8
 80132ec:	4258      	negs	r0, r3
 80132ee:	4143      	adcs	r3, r0
 80132f0:	3301      	adds	r3, #1
 80132f2:	2a05      	cmp	r2, #5
 80132f4:	d006      	beq.n	8013304 <fn_080132A0+0x64>
 80132f6:	22ff      	movs	r2, #255	@ 0xff
 80132f8:	400a      	ands	r2, r1
 80132fa:	0092      	lsls	r2, r2, #2
 80132fc:	18a2      	adds	r2, r4, r2
 80132fe:	6fd2      	ldr	r2, [r2, #124]	@ 0x7c
 8013300:	429a      	cmp	r2, r3
 8013302:	dbd9      	blt.n	80132b8 <fn_080132A0+0x18>
 8013304:	219a      	movs	r1, #154	@ 0x9a
 8013306:	6820      	ldr	r0, [r4, #0]
 8013308:	f7fd ff80 	bl	801120c <fn_0801120C>
 801330c:	2353      	movs	r3, #83	@ 0x53
 801330e:	682a      	ldr	r2, [r5, #0]
 8013310:	5ce1      	ldrb	r1, [r4, r3]
 8013312:	4b0b      	ldr	r3, [pc, #44]	@ (8013340 <fn_080132A0+0xa0>)
 8013314:	58d2      	ldr	r2, [r2, r3]
 8013316:	004b      	lsls	r3, r1, #1
 8013318:	185b      	adds	r3, r3, r1
 801331a:	00db      	lsls	r3, r3, #3
 801331c:	18d3      	adds	r3, r2, r3
 801331e:	0020      	movs	r0, r4
 8013320:	8a19      	ldrh	r1, [r3, #16]
 8013322:	f7ff fa7d 	bl	8012820 <fn_08012820>
 8013326:	6820      	ldr	r0, [r4, #0]
 8013328:	0001      	movs	r1, r0
 801332a:	f7f5 f9a9 	bl	8008680 <fn_08008680>
 801332e:	e7c3      	b.n	80132b8 <fn_080132A0+0x18>
 8013330:	23eb      	movs	r3, #235	@ 0xeb
 8013332:	00db      	lsls	r3, r3, #3
 8013334:	58c3      	ldr	r3, [r0, r3]
 8013336:	6b1b      	ldr	r3, [r3, #48]	@ 0x30
 8013338:	e7db      	b.n	80132f2 <fn_080132A0+0x52>
 801333a:	46c0      	nop			@ (mov r8, r8)
 801333c:	030064c4 	.word	0x030064c4
 8013340:	00000754 	.word	0x00000754
