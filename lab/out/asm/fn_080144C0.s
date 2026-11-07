fn_080144C0:
 80144c0:	b5f0      	push	{r4, r5, r6, r7, lr}
 80144c2:	4645      	mov	r5, r8
 80144c4:	46de      	mov	lr, fp
 80144c6:	4657      	mov	r7, sl
 80144c8:	464e      	mov	r6, r9
 80144ca:	22e9      	movs	r2, #233	@ 0xe9
 80144cc:	b5e0      	push	{r5, r6, r7, lr}
 80144ce:	4b36      	ldr	r3, [pc, #216]	@ (80145a8 <fn_080144C0+0xe8>)
 80144d0:	469a      	mov	sl, r3
 80144d2:	681b      	ldr	r3, [r3, #0]
 80144d4:	4e35      	ldr	r6, [pc, #212]	@ (80145ac <fn_080144C0+0xec>)
 80144d6:	0112      	lsls	r2, r2, #4
 80144d8:	189a      	adds	r2, r3, r2
 80144da:	b083      	sub	sp, #12
 80144dc:	519a      	str	r2, [r3, r6]
 80144de:	4b34      	ldr	r3, [pc, #208]	@ (80145b0 <fn_080144C0+0xf0>)
 80144e0:	469b      	mov	fp, r3
 80144e2:	1c5c      	adds	r4, r3, #1
 80144e4:	2300      	movs	r3, #0
 80144e6:	4698      	mov	r8, r3
 80144e8:	4b32      	ldr	r3, [pc, #200]	@ (80145b4 <fn_080144C0+0xf4>)
 80144ea:	2500      	movs	r5, #0
 80144ec:	9301      	str	r3, [sp, #4]
 80144ee:	e033      	b.n	8014558 <fn_080144C0+0x98>
 80144f0:	f008 fff8 	bl	801d4e4 <fn_0801D4E4>
 80144f4:	3001      	adds	r0, #1
 80144f6:	d026      	beq.n	8014546 <fn_080144C0+0x86>
 80144f8:	0020      	movs	r0, r4
 80144fa:	f004 fde5 	bl	80190c8 <fn_080190C8>
 80144fe:	4653      	mov	r3, sl
 8014500:	681b      	ldr	r3, [r3, #0]
 8014502:	599b      	ldr	r3, [r3, r6]
 8014504:	8058      	strh	r0, [r3, #2]
 8014506:	4648      	mov	r0, r9
 8014508:	f004 fdde 	bl	80190c8 <fn_080190C8>
 801450c:	4653      	mov	r3, sl
 801450e:	6819      	ldr	r1, [r3, #0]
 8014510:	598a      	ldr	r2, [r1, r6]
 8014512:	0003      	movs	r3, r0
 8014514:	8090      	strh	r0, [r2, #4]
 8014516:	4640      	mov	r0, r8
 8014518:	1e47      	subs	r7, r0, #1
 801451a:	41b8      	sbcs	r0, r7
 801451c:	7010      	strb	r0, [r2, #0]
 801451e:	8850      	ldrh	r0, [r2, #2]
 8014520:	1ac0      	subs	r0, r0, r3
 8014522:	3001      	adds	r0, #1
 8014524:	0400      	lsls	r0, r0, #16
 8014526:	1400      	asrs	r0, r0, #16
 8014528:	80d0      	strh	r0, [r2, #6]
 801452a:	2801      	cmp	r0, #1
 801452c:	dd2a      	ble.n	8014584 <fn_080144C0+0xc4>
 801452e:	006b      	lsls	r3, r5, #1
 8014530:	195b      	adds	r3, r3, r5
 8014532:	00db      	lsls	r3, r3, #3
 8014534:	1b5b      	subs	r3, r3, r5
 8014536:	445b      	add	r3, fp
 8014538:	7cd8      	ldrb	r0, [r3, #19]
 801453a:	7d1b      	ldrb	r3, [r3, #20]
 801453c:	021b      	lsls	r3, r3, #8
 801453e:	4303      	orrs	r3, r0
 8014540:	8113      	strh	r3, [r2, #8]
 8014542:	320a      	adds	r2, #10
 8014544:	518a      	str	r2, [r1, r6]
 8014546:	3417      	adds	r4, #23
 8014548:	1e63      	subs	r3, r4, #1
 801454a:	781b      	ldrb	r3, [r3, #0]
 801454c:	061b      	lsls	r3, r3, #24
 801454e:	161b      	asrs	r3, r3, #24
 8014550:	4698      	mov	r8, r3
 8014552:	3501      	adds	r5, #1
 8014554:	3301      	adds	r3, #1
 8014556:	d01e      	beq.n	8014596 <fn_080144C0+0xd6>
 8014558:	2309      	movs	r3, #9
 801455a:	4699      	mov	r9, r3
 801455c:	4643      	mov	r3, r8
 801455e:	44a1      	add	r9, r4
 8014560:	4648      	mov	r0, r9
 8014562:	2b00      	cmp	r3, #0
 8014564:	d0c4      	beq.n	80144f0 <fn_080144C0+0x30>
 8014566:	f004 fdc9 	bl	80190fc <fn_080190FC>
 801456a:	3001      	adds	r0, #1
 801456c:	d0eb      	beq.n	8014546 <fn_080144C0+0x86>
 801456e:	0020      	movs	r0, r4
 8014570:	f004 fdc4 	bl	80190fc <fn_080190FC>
 8014574:	4653      	mov	r3, sl
 8014576:	681b      	ldr	r3, [r3, #0]
 8014578:	599b      	ldr	r3, [r3, r6]
 801457a:	8058      	strh	r0, [r3, #2]
 801457c:	4648      	mov	r0, r9
 801457e:	f004 fdbd 	bl	80190fc <fn_080190FC>
 8014582:	e7c3      	b.n	801450c <fn_080144C0+0x4c>
 8014584:	0022      	movs	r2, r4
 8014586:	4649      	mov	r1, r9
 8014588:	9801      	ldr	r0, [sp, #4]
 801458a:	f7ec f80d 	bl	80005a8 <fn_080005A8>
 801458e:	4653      	mov	r3, sl
 8014590:	6819      	ldr	r1, [r3, #0]
 8014592:	598a      	ldr	r2, [r1, r6]
 8014594:	e7cb      	b.n	801452e <fn_080144C0+0x6e>
 8014596:	b003      	add	sp, #12
 8014598:	bcf0      	pop	{r4, r5, r6, r7}
 801459a:	46bb      	mov	fp, r7
 801459c:	46b2      	mov	sl, r6
 801459e:	46a9      	mov	r9, r5
 80145a0:	46a0      	mov	r8, r4
 80145a2:	bcf0      	pop	{r4, r5, r6, r7}
 80145a4:	bc01      	pop	{r0}
 80145a6:	4700      	bx	r0
 80145a8:	030064c4 	.word	0x030064c4
 80145ac:	00000e8c 	.word	0x00000e8c
 80145b0:	0812ed60 	.word	0x0812ed60
 80145b4:	0814a198 	.word	0x0814a198
