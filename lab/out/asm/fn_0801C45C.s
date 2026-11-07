fn_0801C45C:
 801c45c:	b5f0      	push	{r4, r5, r6, r7, lr}
 801c45e:	4657      	mov	r7, sl
 801c460:	46de      	mov	lr, fp
 801c462:	464e      	mov	r6, r9
 801c464:	4645      	mov	r5, r8
 801c466:	b5e0      	push	{r5, r6, r7, lr}
 801c468:	b085      	sub	sp, #20
 801c46a:	468a      	mov	sl, r1
 801c46c:	9001      	str	r0, [sp, #4]
 801c46e:	2a00      	cmp	r2, #0
 801c470:	db6d      	blt.n	801c54e <fn_0801C45C+0xf2>
 801c472:	4b3b      	ldr	r3, [pc, #236]	@ (801c560 <fn_0801C45C+0x104>)
 801c474:	429a      	cmp	r2, r3
 801c476:	dc59      	bgt.n	801c52c <fn_0801C45C+0xd0>
 801c478:	4691      	mov	r9, r2
 801c47a:	4b3a      	ldr	r3, [pc, #232]	@ (801c564 <fn_0801C45C+0x108>)
 801c47c:	469b      	mov	fp, r3
 801c47e:	4b3a      	ldr	r3, [pc, #232]	@ (801c568 <fn_0801C45C+0x10c>)
 801c480:	9303      	str	r3, [sp, #12]
 801c482:	4648      	mov	r0, r9
 801c484:	213c      	movs	r1, #60	@ 0x3c
 801c486:	f009 f82f 	bl	80254e8 <fn_080254E8>
 801c48a:	4648      	mov	r0, r9
 801c48c:	000c      	movs	r4, r1
 801c48e:	213c      	movs	r1, #60	@ 0x3c
 801c490:	f009 f87e 	bl	8025590 <fn_08025590>
 801c494:	465b      	mov	r3, fp
 801c496:	681f      	ldr	r7, [r3, #0]
 801c498:	0003      	movs	r3, r0
 801c49a:	4681      	mov	r9, r0
 801c49c:	1e5a      	subs	r2, r3, #1
 801c49e:	4193      	sbcs	r3, r2
 801c4a0:	2201      	movs	r2, #1
 801c4a2:	2c09      	cmp	r4, #9
 801c4a4:	dc00      	bgt.n	801c4a8 <fn_0801C45C+0x4c>
 801c4a6:	2200      	movs	r2, #0
 801c4a8:	4313      	orrs	r3, r2
 801c4aa:	061b      	lsls	r3, r3, #24
 801c4ac:	0e1e      	lsrs	r6, r3, #24
 801c4ae:	4b2f      	ldr	r3, [pc, #188]	@ (801c56c <fn_0801C45C+0x110>)
 801c4b0:	58fb      	ldr	r3, [r7, r3]
 801c4b2:	2200      	movs	r2, #0
 801c4b4:	5e9b      	ldrsh	r3, [r3, r2]
 801c4b6:	9602      	str	r6, [sp, #8]
 801c4b8:	4698      	mov	r8, r3
 801c4ba:	9d01      	ldr	r5, [sp, #4]
 801c4bc:	e007      	b.n	801c4ce <fn_0801C45C+0x72>
 801c4be:	0020      	movs	r0, r4
 801c4c0:	210a      	movs	r1, #10
 801c4c2:	f009 f865 	bl	8025590 <fn_08025590>
 801c4c6:	465b      	mov	r3, fp
 801c4c8:	0004      	movs	r4, r0
 801c4ca:	681f      	ldr	r7, [r3, #0]
 801c4cc:	3e01      	subs	r6, #1
 801c4ce:	4643      	mov	r3, r8
 801c4d0:	210a      	movs	r1, #10
 801c4d2:	0020      	movs	r0, r4
 801c4d4:	1aed      	subs	r5, r5, r3
 801c4d6:	f009 f807 	bl	80254e8 <fn_080254E8>
 801c4da:	4b25      	ldr	r3, [pc, #148]	@ (801c570 <fn_0801C45C+0x114>)
 801c4dc:	18c9      	adds	r1, r1, r3
 801c4de:	0089      	lsls	r1, r1, #2
 801c4e0:	59cb      	ldr	r3, [r1, r7]
 801c4e2:	2200      	movs	r2, #0
 801c4e4:	4651      	mov	r1, sl
 801c4e6:	0028      	movs	r0, r5
 801c4e8:	f7ff fd74 	bl	801bfd4 <fn_0801BFD4>
 801c4ec:	2e00      	cmp	r6, #0
 801c4ee:	d1e6      	bne.n	801c4be <fn_0801C45C+0x62>
 801c4f0:	9d03      	ldr	r5, [sp, #12]
 801c4f2:	0028      	movs	r0, r5
 801c4f4:	f000 ffc4 	bl	801d480 <fn_0801D480>
 801c4f8:	f7fc fe92 	bl	8019220 <fn_08019220>
 801c4fc:	464b      	mov	r3, r9
 801c4fe:	2b00      	cmp	r3, #0
 801c500:	d025      	beq.n	801c54e <fn_0801C45C+0xf2>
 801c502:	4643      	mov	r3, r8
 801c504:	4641      	mov	r1, r8
 801c506:	425a      	negs	r2, r3
 801c508:	9b02      	ldr	r3, [sp, #8]
 801c50a:	425b      	negs	r3, r3
 801c50c:	401a      	ands	r2, r3
 801c50e:	9b01      	ldr	r3, [sp, #4]
 801c510:	1a5b      	subs	r3, r3, r1
 801c512:	18d3      	adds	r3, r2, r3
 801c514:	1a1c      	subs	r4, r3, r0
 801c516:	0028      	movs	r0, r5
 801c518:	9401      	str	r4, [sp, #4]
 801c51a:	f000 ffb1 	bl	801d480 <fn_0801D480>
 801c51e:	2200      	movs	r2, #0
 801c520:	0003      	movs	r3, r0
 801c522:	4651      	mov	r1, sl
 801c524:	0020      	movs	r0, r4
 801c526:	f7ff fe03 	bl	801c130 <fn_0801C130>
 801c52a:	e7aa      	b.n	801c482 <fn_0801C45C+0x26>
 801c52c:	4d11      	ldr	r5, [pc, #68]	@ (801c574 <fn_0801C45C+0x118>)
 801c52e:	0028      	movs	r0, r5
 801c530:	f000 ffa6 	bl	801d480 <fn_0801D480>
 801c534:	f7fc fe74 	bl	8019220 <fn_08019220>
 801c538:	9b01      	ldr	r3, [sp, #4]
 801c53a:	1a1c      	subs	r4, r3, r0
 801c53c:	0028      	movs	r0, r5
 801c53e:	f000 ff9f 	bl	801d480 <fn_0801D480>
 801c542:	2200      	movs	r2, #0
 801c544:	0003      	movs	r3, r0
 801c546:	4651      	mov	r1, sl
 801c548:	0020      	movs	r0, r4
 801c54a:	f7ff fdf1 	bl	801c130 <fn_0801C130>
 801c54e:	b005      	add	sp, #20
 801c550:	bcf0      	pop	{r4, r5, r6, r7}
 801c552:	46bb      	mov	fp, r7
 801c554:	46b2      	mov	sl, r6
 801c556:	46a9      	mov	r9, r5
 801c558:	46a0      	mov	r8, r4
 801c55a:	bcf0      	pop	{r4, r5, r6, r7}
 801c55c:	bc01      	pop	{r0}
 801c55e:	4700      	bx	r0
 801c560:	00057e3f 	.word	0x00057e3f
 801c564:	030064c4 	.word	0x030064c4
 801c568:	08147804 	.word	0x08147804
 801c56c:	00005a60 	.word	0x00005a60
 801c570:	00001698 	.word	0x00001698
 801c574:	0814780c 	.word	0x0814780c
