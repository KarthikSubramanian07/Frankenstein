fn_0801C38C:
 801c38c:	b5f0      	push	{r4, r5, r6, r7, lr}
 801c38e:	4657      	mov	r7, sl
 801c390:	464e      	mov	r6, r9
 801c392:	4645      	mov	r5, r8
 801c394:	46de      	mov	lr, fp
 801c396:	0003      	movs	r3, r0
 801c398:	b5e0      	push	{r5, r6, r7, lr}
 801c39a:	6884      	ldr	r4, [r0, #8]
 801c39c:	6805      	ldr	r5, [r0, #0]
 801c39e:	1b60      	subs	r0, r4, r5
 801c3a0:	17c2      	asrs	r2, r0, #31
 801c3a2:	1880      	adds	r0, r0, r2
 801c3a4:	4050      	eors	r0, r2
 801c3a6:	68da      	ldr	r2, [r3, #12]
 801c3a8:	685b      	ldr	r3, [r3, #4]
 801c3aa:	1ad6      	subs	r6, r2, r3
 801c3ac:	17f7      	asrs	r7, r6, #31
 801c3ae:	19f6      	adds	r6, r6, r7
 801c3b0:	b085      	sub	sp, #20
 801c3b2:	407e      	eors	r6, r7
 801c3b4:	42ac      	cmp	r4, r5
 801c3b6:	dd4a      	ble.n	801c44e <fn_0801C38C+0xc2>
 801c3b8:	2400      	movs	r4, #0
 801c3ba:	9401      	str	r4, [sp, #4]
 801c3bc:	3401      	adds	r4, #1
 801c3be:	46a0      	mov	r8, r4
 801c3c0:	429a      	cmp	r2, r3
 801c3c2:	dd4a      	ble.n	801c45a <fn_0801C38C+0xce>
 801c3c4:	22f0      	movs	r2, #240	@ 0xf0
 801c3c6:	4693      	mov	fp, r2
 801c3c8:	4a4e      	ldr	r2, [pc, #312]	@ (801c504 <fn_0801C38C+0x178>)
 801c3ca:	6814      	ldr	r4, [r2, #0]
 801c3cc:	01da      	lsls	r2, r3, #7
 801c3ce:	00db      	lsls	r3, r3, #3
 801c3d0:	1ad2      	subs	r2, r2, r3
 801c3d2:	4b4d      	ldr	r3, [pc, #308]	@ (801c508 <fn_0801C38C+0x17c>)
 801c3d4:	58e3      	ldr	r3, [r4, r3]
 801c3d6:	24ff      	movs	r4, #255	@ 0xff
 801c3d8:	0052      	lsls	r2, r2, #1
 801c3da:	1952      	adds	r2, r2, r5
 801c3dc:	400c      	ands	r4, r1
 801c3de:	189b      	adds	r3, r3, r2
 801c3e0:	46a4      	mov	ip, r4
 801c3e2:	1b82      	subs	r2, r0, r6
 801c3e4:	4286      	cmp	r6, r0
 801c3e6:	dd3c      	ble.n	801c462 <fn_0801C38C+0xd6>
 801c3e8:	21ff      	movs	r1, #255	@ 0xff
 801c3ea:	468a      	mov	sl, r1
 801c3ec:	0221      	lsls	r1, r4, #8
 801c3ee:	9101      	str	r1, [sp, #4]
 801c3f0:	4271      	negs	r1, r6
 801c3f2:	0035      	movs	r5, r6
 801c3f4:	2701      	movs	r7, #1
 801c3f6:	4689      	mov	r9, r1
 801c3f8:	9602      	str	r6, [sp, #8]
 801c3fa:	0019      	movs	r1, r3
 801c3fc:	43b9      	bics	r1, r7
 801c3fe:	4656      	mov	r6, sl
 801c400:	880c      	ldrh	r4, [r1, #0]
 801c402:	423b      	tst	r3, r7
 801c404:	d014      	beq.n	801c430 <fn_0801C38C+0xa4>
 801c406:	4034      	ands	r4, r6
 801c408:	9e01      	ldr	r6, [sp, #4]
 801c40a:	4334      	orrs	r4, r6
 801c40c:	800c      	strh	r4, [r1, #0]
 801c40e:	2d00      	cmp	r5, #0
 801c410:	d014      	beq.n	801c43c <fn_0801C38C+0xb0>
 801c412:	0051      	lsls	r1, r2, #1
 801c414:	445b      	add	r3, fp
 801c416:	1812      	adds	r2, r2, r0
 801c418:	3d01      	subs	r5, #1
 801c41a:	4589      	cmp	r9, r1
 801c41c:	dced      	bgt.n	801c3fa <fn_0801C38C+0x6e>
 801c41e:	9902      	ldr	r1, [sp, #8]
 801c420:	4443      	add	r3, r8
 801c422:	1a52      	subs	r2, r2, r1
 801c424:	0019      	movs	r1, r3
 801c426:	43b9      	bics	r1, r7
 801c428:	4656      	mov	r6, sl
 801c42a:	880c      	ldrh	r4, [r1, #0]
 801c42c:	423b      	tst	r3, r7
 801c42e:	d1ea      	bne.n	801c406 <fn_0801C38C+0x7a>
 801c430:	43b4      	bics	r4, r6
 801c432:	4666      	mov	r6, ip
 801c434:	4334      	orrs	r4, r6
 801c436:	800c      	strh	r4, [r1, #0]
 801c438:	2d00      	cmp	r5, #0
 801c43a:	d1ea      	bne.n	801c412 <fn_0801C38C+0x86>
 801c43c:	b005      	add	sp, #20
 801c43e:	bcf0      	pop	{r4, r5, r6, r7}
 801c440:	46bb      	mov	fp, r7
 801c442:	46b2      	mov	sl, r6
 801c444:	46a9      	mov	r9, r5
 801c446:	46a0      	mov	r8, r4
 801c448:	bcf0      	pop	{r4, r5, r6, r7}
 801c44a:	bc01      	pop	{r0}
 801c44c:	4700      	bx	r0
 801c44e:	2401      	movs	r4, #1
 801c450:	9401      	str	r4, [sp, #4]
 801c452:	3c02      	subs	r4, #2
 801c454:	46a0      	mov	r8, r4
 801c456:	429a      	cmp	r2, r3
 801c458:	dcb4      	bgt.n	801c3c4 <fn_0801C38C+0x38>
 801c45a:	22f0      	movs	r2, #240	@ 0xf0
 801c45c:	4252      	negs	r2, r2
 801c45e:	4693      	mov	fp, r2
 801c460:	e7b2      	b.n	801c3c8 <fn_0801C38C+0x3c>
 801c462:	2501      	movs	r5, #1
 801c464:	0221      	lsls	r1, r4, #8
 801c466:	46b2      	mov	sl, r6
 801c468:	0004      	movs	r4, r0
 801c46a:	46a9      	mov	r9, r5
 801c46c:	0006      	movs	r6, r0
 801c46e:	9102      	str	r1, [sp, #8]
 801c470:	4461      	add	r1, ip
 801c472:	9103      	str	r1, [sp, #12]
 801c474:	4648      	mov	r0, r9
 801c476:	001d      	movs	r5, r3
 801c478:	4649      	mov	r1, r9
 801c47a:	0057      	lsls	r7, r2, #1
 801c47c:	4018      	ands	r0, r3
 801c47e:	438d      	bics	r5, r1
 801c480:	2c00      	cmp	r4, #0
 801c482:	d020      	beq.n	801c4c6 <fn_0801C38C+0x13a>
 801c484:	2101      	movs	r1, #1
 801c486:	42b7      	cmp	r7, r6
 801c488:	dc00      	bgt.n	801c48c <fn_0801C38C+0x100>
 801c48a:	2100      	movs	r1, #0
 801c48c:	0609      	lsls	r1, r1, #24
 801c48e:	d01a      	beq.n	801c4c6 <fn_0801C38C+0x13a>
 801c490:	9901      	ldr	r1, [sp, #4]
 801c492:	4281      	cmp	r1, r0
 801c494:	d028      	beq.n	801c4e8 <fn_0801C38C+0x15c>
 801c496:	8829      	ldrh	r1, [r5, #0]
 801c498:	2800      	cmp	r0, #0
 801c49a:	d02d      	beq.n	801c4f8 <fn_0801C38C+0x16c>
 801c49c:	20ff      	movs	r0, #255	@ 0xff
 801c49e:	4001      	ands	r1, r0
 801c4a0:	9802      	ldr	r0, [sp, #8]
 801c4a2:	4301      	orrs	r1, r0
 801c4a4:	8029      	strh	r1, [r5, #0]
 801c4a6:	4651      	mov	r1, sl
 801c4a8:	4443      	add	r3, r8
 801c4aa:	1a52      	subs	r2, r2, r1
 801c4ac:	3c01      	subs	r4, #1
 801c4ae:	42be      	cmp	r6, r7
 801c4b0:	dbe0      	blt.n	801c474 <fn_0801C38C+0xe8>
 801c4b2:	445b      	add	r3, fp
 801c4b4:	4648      	mov	r0, r9
 801c4b6:	001d      	movs	r5, r3
 801c4b8:	4649      	mov	r1, r9
 801c4ba:	1992      	adds	r2, r2, r6
 801c4bc:	0057      	lsls	r7, r2, #1
 801c4be:	4018      	ands	r0, r3
 801c4c0:	438d      	bics	r5, r1
 801c4c2:	2c00      	cmp	r4, #0
 801c4c4:	d1de      	bne.n	801c484 <fn_0801C38C+0xf8>
 801c4c6:	8829      	ldrh	r1, [r5, #0]
 801c4c8:	2800      	cmp	r0, #0
 801c4ca:	d007      	beq.n	801c4dc <fn_0801C38C+0x150>
 801c4cc:	20ff      	movs	r0, #255	@ 0xff
 801c4ce:	4001      	ands	r1, r0
 801c4d0:	9802      	ldr	r0, [sp, #8]
 801c4d2:	4301      	orrs	r1, r0
 801c4d4:	8029      	strh	r1, [r5, #0]
 801c4d6:	2c00      	cmp	r4, #0
 801c4d8:	d1e5      	bne.n	801c4a6 <fn_0801C38C+0x11a>
 801c4da:	e7af      	b.n	801c43c <fn_0801C38C+0xb0>
 801c4dc:	20ff      	movs	r0, #255	@ 0xff
 801c4de:	4381      	bics	r1, r0
 801c4e0:	4660      	mov	r0, ip
 801c4e2:	4301      	orrs	r1, r0
 801c4e4:	8029      	strh	r1, [r5, #0]
 801c4e6:	e7f6      	b.n	801c4d6 <fn_0801C38C+0x14a>
 801c4e8:	9903      	ldr	r1, [sp, #12]
 801c4ea:	8029      	strh	r1, [r5, #0]
 801c4ec:	4651      	mov	r1, sl
 801c4ee:	1a52      	subs	r2, r2, r1
 801c4f0:	4443      	add	r3, r8
 801c4f2:	3c01      	subs	r4, #1
 801c4f4:	0057      	lsls	r7, r2, #1
 801c4f6:	e7ee      	b.n	801c4d6 <fn_0801C38C+0x14a>
 801c4f8:	20ff      	movs	r0, #255	@ 0xff
 801c4fa:	4381      	bics	r1, r0
 801c4fc:	4660      	mov	r0, ip
 801c4fe:	4301      	orrs	r1, r0
 801c500:	8029      	strh	r1, [r5, #0]
 801c502:	e7d0      	b.n	801c4a6 <fn_0801C38C+0x11a>
 801c504:	030064c4 	.word	0x030064c4
 801c508:	00005a30 	.word	0x00005a30
