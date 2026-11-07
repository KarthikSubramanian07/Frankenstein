fn_0801143C:
 801143c:	2300      	movs	r3, #0
 801143e:	b570      	push	{r4, r5, r6, lr}
 8011440:	6443      	str	r3, [r0, #68]	@ 0x44
 8011442:	6403      	str	r3, [r0, #64]	@ 0x40
 8011444:	63c3      	str	r3, [r0, #60]	@ 0x3c
 8011446:	335a      	adds	r3, #90	@ 0x5a
 8011448:	5cc1      	ldrb	r1, [r0, r3]
 801144a:	23ea      	movs	r3, #234	@ 0xea
 801144c:	4d18      	ldr	r5, [pc, #96]	@ (80114b0 <fn_0801143C+0x74>)
 801144e:	682a      	ldr	r2, [r5, #0]
 8011450:	00db      	lsls	r3, r3, #3
 8011452:	58d3      	ldr	r3, [r2, r3]
 8011454:	225c      	movs	r2, #92	@ 0x5c
 8011456:	434a      	muls	r2, r1
 8011458:	189b      	adds	r3, r3, r2
 801145a:	8e19      	ldrh	r1, [r3, #48]	@ 0x30
 801145c:	0004      	movs	r4, r0
 801145e:	f7ff fed5 	bl	801120c <fn_0801120C>
 8011462:	f7f5 fb4d 	bl	8006b00 <fn_08006B00>
 8011466:	2303      	movs	r3, #3
 8011468:	2256      	movs	r2, #86	@ 0x56
 801146a:	4003      	ands	r3, r0
 801146c:	5aa0      	ldrh	r0, [r4, r2]
 801146e:	1ac0      	subs	r0, r0, r3
 8011470:	1c03      	adds	r3, r0, #0
 8011472:	0400      	lsls	r0, r0, #16
 8011474:	1400      	asrs	r0, r0, #16
 8011476:	2800      	cmp	r0, #0
 8011478:	dc00      	bgt.n	801147c <fn_0801143C+0x40>
 801147a:	2301      	movs	r3, #1
 801147c:	2256      	movs	r2, #86	@ 0x56
 801147e:	52a3      	strh	r3, [r4, r2]
 8011480:	4a0c      	ldr	r2, [pc, #48]	@ (80114b4 <fn_0801143C+0x78>)
 8011482:	6ce3      	ldr	r3, [r4, #76]	@ 0x4c
 8011484:	4013      	ands	r3, r2
 8011486:	64e3      	str	r3, [r4, #76]	@ 0x4c
 8011488:	235a      	movs	r3, #90	@ 0x5a
 801148a:	5ce1      	ldrb	r1, [r4, r3]
 801148c:	23ea      	movs	r3, #234	@ 0xea
 801148e:	682a      	ldr	r2, [r5, #0]
 8011490:	00db      	lsls	r3, r3, #3
 8011492:	58d3      	ldr	r3, [r2, r3]
 8011494:	225c      	movs	r2, #92	@ 0x5c
 8011496:	434a      	muls	r2, r1
 8011498:	189b      	adds	r3, r3, r2
 801149a:	6b99      	ldr	r1, [r3, #56]	@ 0x38
 801149c:	2900      	cmp	r1, #0
 801149e:	d102      	bne.n	80114a6 <fn_0801143C+0x6a>
 80114a0:	bc70      	pop	{r4, r5, r6}
 80114a2:	bc01      	pop	{r0}
 80114a4:	4700      	bx	r0
 80114a6:	0020      	movs	r0, r4
 80114a8:	f008 ff0e 	bl	801a2c8 <fn_0801A2C8>
 80114ac:	e7f8      	b.n	80114a0 <fn_0801143C+0x64>
 80114ae:	46c0      	nop			@ (mov r8, r8)
 80114b0:	030064c4 	.word	0x030064c4	@ data_030064C4
 80114b4:	fffeffff 	.word	0xfffeffff
