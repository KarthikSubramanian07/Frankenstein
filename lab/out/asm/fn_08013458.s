fn_08013458:
 8013458:	b5f0      	push	{r4, r5, r6, r7, lr}
 801345a:	46c6      	mov	lr, r8
 801345c:	b500      	push	{lr}
 801345e:	0005      	movs	r5, r0
 8013460:	b082      	sub	sp, #8
 8013462:	f7f3 fb4d 	bl	8006b00 <fn_08006B00>
 8013466:	682b      	ldr	r3, [r5, #0]
 8013468:	4680      	mov	r8, r0
 801346a:	6a1e      	ldr	r6, [r3, #32]
 801346c:	f7f3 fb48 	bl	8006b00 <fn_08006B00>
 8013470:	0004      	movs	r4, r0
 8013472:	f7f3 fb45 	bl	8006b00 <fn_08006B00>
 8013476:	1a24      	subs	r4, r4, r0
 8013478:	04a4      	lsls	r4, r4, #18
 801347a:	19a4      	adds	r4, r4, r6
 801347c:	0021      	movs	r1, r4
 801347e:	4a22      	ldr	r2, [pc, #136]	@ (8013508 <fn_08013458+0xb0>)
 8013480:	6828      	ldr	r0, [r5, #0]
 8013482:	f7fc fb19 	bl	800fab8 <fn_0800FAB8>
 8013486:	210a      	movs	r1, #10
 8013488:	0007      	movs	r7, r0
 801348a:	4640      	mov	r0, r8
 801348c:	f012 f82c 	bl	80254e8 <fn_080254E8>
 8013490:	682e      	ldr	r6, [r5, #0]
 8013492:	3101      	adds	r1, #1
 8013494:	0049      	lsls	r1, r1, #1
 8013496:	0030      	movs	r0, r6
 8013498:	003b      	movs	r3, r7
 801349a:	9100      	str	r1, [sp, #0]
 801349c:	4a1a      	ldr	r2, [pc, #104]	@ (8013508 <fn_08013458+0xb0>)
 801349e:	0021      	movs	r1, r4
 80134a0:	f7fc fb64 	bl	800fb6c <fn_0800FB6C>
 80134a4:	4e19      	ldr	r6, [pc, #100]	@ (801350c <fn_08013458+0xb4>)
 80134a6:	4c1a      	ldr	r4, [pc, #104]	@ (8013510 <fn_08013458+0xb8>)
 80134a8:	6833      	ldr	r3, [r6, #0]
 80134aa:	591b      	ldr	r3, [r3, r4]
 80134ac:	6828      	ldr	r0, [r5, #0]
 80134ae:	2b00      	cmp	r3, #0
 80134b0:	d026      	beq.n	8013500 <fn_08013458+0xa8>
 80134b2:	210d      	movs	r1, #13
 80134b4:	f006 ff08 	bl	801a2c8 <fn_0801A2C8>
 80134b8:	6833      	ldr	r3, [r6, #0]
 80134ba:	6828      	ldr	r0, [r5, #0]
 80134bc:	591a      	ldr	r2, [r3, r4]
 80134be:	300c      	adds	r0, #12
 80134c0:	320c      	adds	r2, #12
 80134c2:	ca0c      	ldmia	r2, {r2, r3}
 80134c4:	c803      	ldmia	r0, {r0, r1}
 80134c6:	f012 f84b 	bl	8025560 <fn_08025560>
 80134ca:	2480      	movs	r4, #128	@ 0x80
 80134cc:	682a      	ldr	r2, [r5, #0]
 80134ce:	6a13      	ldr	r3, [r2, #32]
 80134d0:	0624      	lsls	r4, r4, #24
 80134d2:	1ac1      	subs	r1, r0, r3
 80134d4:	42a1      	cmp	r1, r4
 80134d6:	d810      	bhi.n	80134fa <fn_08013458+0xa2>
 80134d8:	4c0e      	ldr	r4, [pc, #56]	@ (8013514 <fn_08013458+0xbc>)
 80134da:	191b      	adds	r3, r3, r4
 80134dc:	42a1      	cmp	r1, r4
 80134de:	d901      	bls.n	80134e4 <fn_08013458+0x8c>
 80134e0:	4b0d      	ldr	r3, [pc, #52]	@ (8013518 <fn_08013458+0xc0>)
 80134e2:	18c3      	adds	r3, r0, r3
 80134e4:	2180      	movs	r1, #128	@ 0x80
 80134e6:	6213      	str	r3, [r2, #32]
 80134e8:	6cd3      	ldr	r3, [r2, #76]	@ 0x4c
 80134ea:	430b      	orrs	r3, r1
 80134ec:	64d3      	str	r3, [r2, #76]	@ 0x4c
 80134ee:	b002      	add	sp, #8
 80134f0:	bc80      	pop	{r7}
 80134f2:	46b8      	mov	r8, r7
 80134f4:	bcf0      	pop	{r4, r5, r6, r7}
 80134f6:	bc01      	pop	{r0}
 80134f8:	4700      	bx	r0
 80134fa:	4908      	ldr	r1, [pc, #32]	@ (801351c <fn_08013458+0xc4>)
 80134fc:	185b      	adds	r3, r3, r1
 80134fe:	e7f1      	b.n	80134e4 <fn_08013458+0x8c>
 8013500:	210c      	movs	r1, #12
 8013502:	f006 fee1 	bl	801a2c8 <fn_0801A2C8>
 8013506:	e7f2      	b.n	80134ee <fn_08013458+0x96>
 8013508:	00400001 	.word	0x00400001
 801350c:	030064c4 	.word	0x030064c4	@ data_030064C4
 8013510:	000008f4 	.word	0x000008f4
 8013514:	03333333 	.word	0x03333333
 8013518:	fcf3cf3d 	.word	0xfcf3cf3d
 801351c:	fccccccd 	.word	0xfccccccd
