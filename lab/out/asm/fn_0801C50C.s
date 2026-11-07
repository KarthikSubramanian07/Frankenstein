fn_0801C50C:
 801c50c:	b5f0      	push	{r4, r5, r6, r7, lr}
 801c50e:	4657      	mov	r7, sl
 801c510:	46de      	mov	lr, fp
 801c512:	464e      	mov	r6, r9
 801c514:	4645      	mov	r5, r8
 801c516:	b5e0      	push	{r5, r6, r7, lr}
 801c518:	b085      	sub	sp, #20
 801c51a:	468a      	mov	sl, r1
 801c51c:	9001      	str	r0, [sp, #4]
 801c51e:	2a00      	cmp	r2, #0
 801c520:	db6d      	blt.n	801c5fe <fn_0801C50C+0xf2>
 801c522:	4b3b      	ldr	r3, [pc, #236]	@ (801c610 <fn_0801C50C+0x104>)
 801c524:	429a      	cmp	r2, r3
 801c526:	dc59      	bgt.n	801c5dc <fn_0801C50C+0xd0>
 801c528:	4691      	mov	r9, r2
 801c52a:	4b3a      	ldr	r3, [pc, #232]	@ (801c614 <fn_0801C50C+0x108>)
 801c52c:	469b      	mov	fp, r3
 801c52e:	4b3a      	ldr	r3, [pc, #232]	@ (801c618 <fn_0801C50C+0x10c>)
 801c530:	9303      	str	r3, [sp, #12]
 801c532:	4648      	mov	r0, r9
 801c534:	213c      	movs	r1, #60	@ 0x3c
 801c536:	f009 f82f 	bl	8025598 <fn_08025598>
 801c53a:	4648      	mov	r0, r9
 801c53c:	000c      	movs	r4, r1
 801c53e:	213c      	movs	r1, #60	@ 0x3c
 801c540:	f009 f87e 	bl	8025640 <fn_08025640>
 801c544:	465b      	mov	r3, fp
 801c546:	681f      	ldr	r7, [r3, #0]
 801c548:	0003      	movs	r3, r0
 801c54a:	4681      	mov	r9, r0
 801c54c:	1e5a      	subs	r2, r3, #1
 801c54e:	4193      	sbcs	r3, r2
 801c550:	2201      	movs	r2, #1
 801c552:	2c09      	cmp	r4, #9
 801c554:	dc00      	bgt.n	801c558 <fn_0801C50C+0x4c>
 801c556:	2200      	movs	r2, #0
 801c558:	4313      	orrs	r3, r2
 801c55a:	061b      	lsls	r3, r3, #24
 801c55c:	0e1e      	lsrs	r6, r3, #24
 801c55e:	4b2f      	ldr	r3, [pc, #188]	@ (801c61c <fn_0801C50C+0x110>)
 801c560:	58fb      	ldr	r3, [r7, r3]
 801c562:	2200      	movs	r2, #0
 801c564:	5e9b      	ldrsh	r3, [r3, r2]
 801c566:	9602      	str	r6, [sp, #8]
 801c568:	4698      	mov	r8, r3
 801c56a:	9d01      	ldr	r5, [sp, #4]
 801c56c:	e007      	b.n	801c57e <fn_0801C50C+0x72>
 801c56e:	0020      	movs	r0, r4
 801c570:	210a      	movs	r1, #10
 801c572:	f009 f865 	bl	8025640 <fn_08025640>
 801c576:	465b      	mov	r3, fp
 801c578:	0004      	movs	r4, r0
 801c57a:	681f      	ldr	r7, [r3, #0]
 801c57c:	3e01      	subs	r6, #1
 801c57e:	4643      	mov	r3, r8
 801c580:	210a      	movs	r1, #10
 801c582:	0020      	movs	r0, r4
 801c584:	1aed      	subs	r5, r5, r3
 801c586:	f009 f807 	bl	8025598 <fn_08025598>
 801c58a:	4b25      	ldr	r3, [pc, #148]	@ (801c620 <fn_0801C50C+0x114>)
 801c58c:	18c9      	adds	r1, r1, r3
 801c58e:	0089      	lsls	r1, r1, #2
 801c590:	59cb      	ldr	r3, [r1, r7]
 801c592:	2200      	movs	r2, #0
 801c594:	4651      	mov	r1, sl
 801c596:	0028      	movs	r0, r5
 801c598:	f7ff fd74 	bl	801c084 <fn_0801C084>
 801c59c:	2e00      	cmp	r6, #0
 801c59e:	d1e6      	bne.n	801c56e <fn_0801C50C+0x62>
 801c5a0:	9d03      	ldr	r5, [sp, #12]
 801c5a2:	0028      	movs	r0, r5
 801c5a4:	f000 ffc4 	bl	801d530 <fn_0801D530>
 801c5a8:	f7fc fe94 	bl	80192d4 <fn_080192D4>
 801c5ac:	464b      	mov	r3, r9
 801c5ae:	2b00      	cmp	r3, #0
 801c5b0:	d025      	beq.n	801c5fe <fn_0801C50C+0xf2>
 801c5b2:	4643      	mov	r3, r8
 801c5b4:	4641      	mov	r1, r8
 801c5b6:	425a      	negs	r2, r3
 801c5b8:	9b02      	ldr	r3, [sp, #8]
 801c5ba:	425b      	negs	r3, r3
 801c5bc:	401a      	ands	r2, r3
 801c5be:	9b01      	ldr	r3, [sp, #4]
 801c5c0:	1a5b      	subs	r3, r3, r1
 801c5c2:	18d3      	adds	r3, r2, r3
 801c5c4:	1a1c      	subs	r4, r3, r0
 801c5c6:	0028      	movs	r0, r5
 801c5c8:	9401      	str	r4, [sp, #4]
 801c5ca:	f000 ffb1 	bl	801d530 <fn_0801D530>
 801c5ce:	2200      	movs	r2, #0
 801c5d0:	0003      	movs	r3, r0
 801c5d2:	4651      	mov	r1, sl
 801c5d4:	0020      	movs	r0, r4
 801c5d6:	f7ff fe03 	bl	801c1e0 <fn_0801C1E0>
 801c5da:	e7aa      	b.n	801c532 <fn_0801C50C+0x26>
 801c5dc:	4d11      	ldr	r5, [pc, #68]	@ (801c624 <fn_0801C50C+0x118>)
 801c5de:	0028      	movs	r0, r5
 801c5e0:	f000 ffa6 	bl	801d530 <fn_0801D530>
 801c5e4:	f7fc fe76 	bl	80192d4 <fn_080192D4>
 801c5e8:	9b01      	ldr	r3, [sp, #4]
 801c5ea:	1a1c      	subs	r4, r3, r0
 801c5ec:	0028      	movs	r0, r5
 801c5ee:	f000 ff9f 	bl	801d530 <fn_0801D530>
 801c5f2:	2200      	movs	r2, #0
 801c5f4:	0003      	movs	r3, r0
 801c5f6:	4651      	mov	r1, sl
 801c5f8:	0020      	movs	r0, r4
 801c5fa:	f7ff fdf1 	bl	801c1e0 <fn_0801C1E0>
 801c5fe:	b005      	add	sp, #20
 801c600:	bcf0      	pop	{r4, r5, r6, r7}
 801c602:	46bb      	mov	fp, r7
 801c604:	46b2      	mov	sl, r6
 801c606:	46a9      	mov	r9, r5
 801c608:	46a0      	mov	r8, r4
 801c60a:	bcf0      	pop	{r4, r5, r6, r7}
 801c60c:	bc01      	pop	{r0}
 801c60e:	4700      	bx	r0
 801c610:	00057e3f 	.word	0x00057e3f
 801c614:	030064c4 	.word	0x030064c4
 801c618:	081478d8 	.word	0x081478d8
 801c61c:	00005a60 	.word	0x00005a60
 801c620:	00001698 	.word	0x00001698
 801c624:	081478e0 	.word	0x081478e0
