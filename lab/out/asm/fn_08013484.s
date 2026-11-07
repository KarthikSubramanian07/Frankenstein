fn_08013484:
 8013484:	b5f0      	push	{r4, r5, r6, r7, lr}
 8013486:	b083      	sub	sp, #12
 8013488:	0005      	movs	r5, r0
 801348a:	f7f3 fb39 	bl	8006b00 <fn_08006B00>
 801348e:	210a      	movs	r1, #10
 8013490:	f012 f882 	bl	8025598 <fn_08025598>
 8013494:	6bab      	ldr	r3, [r5, #56]	@ 0x38
 8013496:	3101      	adds	r1, #1
 8013498:	004e      	lsls	r6, r1, #1
 801349a:	2b00      	cmp	r3, #0
 801349c:	d002      	beq.n	80134a4 <fn_08013484+0x20>
 801349e:	00c9      	lsls	r1, r1, #3
 80134a0:	198e      	adds	r6, r1, r6
 80134a2:	0076      	lsls	r6, r6, #1
 80134a4:	682b      	ldr	r3, [r5, #0]
 80134a6:	6a1f      	ldr	r7, [r3, #32]
 80134a8:	f7f3 fb2a 	bl	8006b00 <fn_08006B00>
 80134ac:	0004      	movs	r4, r0
 80134ae:	f7f3 fb27 	bl	8006b00 <fn_08006B00>
 80134b2:	2280      	movs	r2, #128	@ 0x80
 80134b4:	1a24      	subs	r4, r4, r0
 80134b6:	04a4      	lsls	r4, r4, #18
 80134b8:	19e1      	adds	r1, r4, r7
 80134ba:	03d2      	lsls	r2, r2, #15
 80134bc:	6828      	ldr	r0, [r5, #0]
 80134be:	f7fc fafb 	bl	800fab8 <fn_0800FAB8>
 80134c2:	2280      	movs	r2, #128	@ 0x80
 80134c4:	0003      	movs	r3, r0
 80134c6:	19e1      	adds	r1, r4, r7
 80134c8:	6828      	ldr	r0, [r5, #0]
 80134ca:	03d2      	lsls	r2, r2, #15
 80134cc:	9600      	str	r6, [sp, #0]
 80134ce:	f7fc fb4d 	bl	800fb6c <fn_0800FB6C>
 80134d2:	4f0c      	ldr	r7, [pc, #48]	@ (8013504 <fn_08013484+0x80>)
 80134d4:	4e0c      	ldr	r6, [pc, #48]	@ (8013508 <fn_08013484+0x84>)
 80134d6:	683b      	ldr	r3, [r7, #0]
 80134d8:	599b      	ldr	r3, [r3, r6]
 80134da:	2b00      	cmp	r3, #0
 80134dc:	d00d      	beq.n	80134fa <fn_08013484+0x76>
 80134de:	2153      	movs	r1, #83	@ 0x53
 80134e0:	6828      	ldr	r0, [r5, #0]
 80134e2:	f006 ff4b 	bl	801a37c <fn_0801A37C>
 80134e6:	683b      	ldr	r3, [r7, #0]
 80134e8:	599a      	ldr	r2, [r3, r6]
 80134ea:	682c      	ldr	r4, [r5, #0]
 80134ec:	320c      	adds	r2, #12
 80134ee:	ca0c      	ldmia	r2, {r2, r3}
 80134f0:	6921      	ldr	r1, [r4, #16]
 80134f2:	68e0      	ldr	r0, [r4, #12]
 80134f4:	f012 f88c 	bl	8025610 <fn_08025610>
 80134f8:	6220      	str	r0, [r4, #32]
 80134fa:	b003      	add	sp, #12
 80134fc:	bcf0      	pop	{r4, r5, r6, r7}
 80134fe:	bc01      	pop	{r0}
 8013500:	4700      	bx	r0
 8013502:	46c0      	nop			@ (mov r8, r8)
 8013504:	030064c4 	.word	0x030064c4
 8013508:	000008f4 	.word	0x000008f4
