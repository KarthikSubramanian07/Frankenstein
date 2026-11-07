fn_0800B3E0:
 800b3e0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800b3e2:	4647      	mov	r7, r8
 800b3e4:	46ce      	mov	lr, r9
 800b3e6:	2300      	movs	r3, #0
 800b3e8:	0004      	movs	r4, r0
 800b3ea:	4698      	mov	r8, r3
 800b3ec:	b580      	push	{r7, lr}
 800b3ee:	2900      	cmp	r1, #0
 800b3f0:	d03f      	beq.n	800b472 <fn_0800B3E0+0x92>
 800b3f2:	2901      	cmp	r1, #1
 800b3f4:	d010      	beq.n	800b418 <fn_0800B3E0+0x38>
 800b3f6:	2101      	movs	r1, #1
 800b3f8:	4249      	negs	r1, r1
 800b3fa:	e001      	b.n	800b400 <fn_0800B3E0+0x20>
 800b3fc:	2301      	movs	r3, #1
 800b3fe:	4698      	mov	r8, r3
 800b400:	0020      	movs	r0, r4
 800b402:	f009 fe99 	bl	8015138 <fn_08015138>
 800b406:	1e01      	subs	r1, r0, #0
 800b408:	daf8      	bge.n	800b3fc <fn_0800B3E0+0x1c>
 800b40a:	4640      	mov	r0, r8
 800b40c:	bcc0      	pop	{r6, r7}
 800b40e:	46b9      	mov	r9, r7
 800b410:	46b0      	mov	r8, r6
 800b412:	bcf8      	pop	{r3, r4, r5, r6, r7}
 800b414:	bc02      	pop	{r1}
 800b416:	4708      	bx	r1
 800b418:	2501      	movs	r5, #1
 800b41a:	3324      	adds	r3, #36	@ 0x24
 800b41c:	4699      	mov	r9, r3
 800b41e:	4f3e      	ldr	r7, [pc, #248]	@ (800b518 <fn_0800B3E0+0x138>)
 800b420:	426d      	negs	r5, r5
 800b422:	e01f      	b.n	800b464 <fn_0800B3E0+0x84>
 800b424:	21df      	movs	r1, #223	@ 0xdf
 800b426:	683a      	ldr	r2, [r7, #0]
 800b428:	0083      	lsls	r3, r0, #2
 800b42a:	0109      	lsls	r1, r1, #4
 800b42c:	5856      	ldr	r6, [r2, r1]
 800b42e:	181b      	adds	r3, r3, r0
 800b430:	00db      	lsls	r3, r3, #3
 800b432:	18f6      	adds	r6, r6, r3
 800b434:	0029      	movs	r1, r5
 800b436:	6830      	ldr	r0, [r6, #0]
 800b438:	f009 fdb2 	bl	8014fa0 <fn_08014FA0>
 800b43c:	2800      	cmp	r0, #0
 800b43e:	d00f      	beq.n	800b460 <fn_0800B3E0+0x80>
 800b440:	464b      	mov	r3, r9
 800b442:	464a      	mov	r2, r9
 800b444:	5cc3      	ldrb	r3, [r0, r3]
 800b446:	54b3      	strb	r3, [r6, r2]
 800b448:	2220      	movs	r2, #32
 800b44a:	5e83      	ldrsh	r3, [r0, r2]
 800b44c:	2227      	movs	r2, #39	@ 0x27
 800b44e:	8433      	strh	r3, [r6, #32]
 800b450:	2304      	movs	r3, #4
 800b452:	5c81      	ldrb	r1, [r0, r2]
 800b454:	2004      	movs	r0, #4
 800b456:	4019      	ands	r1, r3
 800b458:	5cb3      	ldrb	r3, [r6, r2]
 800b45a:	4383      	bics	r3, r0
 800b45c:	430b      	orrs	r3, r1
 800b45e:	54b3      	strb	r3, [r6, r2]
 800b460:	2301      	movs	r3, #1
 800b462:	4698      	mov	r8, r3
 800b464:	0029      	movs	r1, r5
 800b466:	0020      	movs	r0, r4
 800b468:	f009 fe66 	bl	8015138 <fn_08015138>
 800b46c:	1e05      	subs	r5, r0, #0
 800b46e:	dad9      	bge.n	800b424 <fn_0800B3E0+0x44>
 800b470:	e7cb      	b.n	800b40a <fn_0800B3E0+0x2a>
 800b472:	2101      	movs	r1, #1
 800b474:	26df      	movs	r6, #223	@ 0xdf
 800b476:	4f28      	ldr	r7, [pc, #160]	@ (800b518 <fn_0800B3E0+0x138>)
 800b478:	4249      	negs	r1, r1
 800b47a:	0136      	lsls	r6, r6, #4
 800b47c:	e046      	b.n	800b50c <fn_0800B3E0+0x12c>
 800b47e:	8aa0      	ldrh	r0, [r4, #20]
 800b480:	4681      	mov	r9, r0
 800b482:	683d      	ldr	r5, [r7, #0]
 800b484:	4825      	ldr	r0, [pc, #148]	@ (800b51c <fn_0800B3E0+0x13c>)
 800b486:	5828      	ldr	r0, [r5, r0]
 800b488:	4680      	mov	r8, r0
 800b48a:	4648      	mov	r0, r9
 800b48c:	0040      	lsls	r0, r0, #1
 800b48e:	4448      	add	r0, r9
 800b490:	0080      	lsls	r0, r0, #2
 800b492:	4440      	add	r0, r8
 800b494:	8940      	ldrh	r0, [r0, #10]
 800b496:	4680      	mov	r8, r0
 800b498:	008b      	lsls	r3, r1, #2
 800b49a:	0080      	lsls	r0, r0, #2
 800b49c:	59aa      	ldr	r2, [r5, r6]
 800b49e:	4440      	add	r0, r8
 800b4a0:	185b      	adds	r3, r3, r1
 800b4a2:	00c0      	lsls	r0, r0, #3
 800b4a4:	00db      	lsls	r3, r3, #3
 800b4a6:	18d3      	adds	r3, r2, r3
 800b4a8:	1812      	adds	r2, r2, r0
 800b4aa:	3224      	adds	r2, #36	@ 0x24
 800b4ac:	7810      	ldrb	r0, [r2, #0]
 800b4ae:	2224      	movs	r2, #36	@ 0x24
 800b4b0:	5498      	strb	r0, [r3, r2]
 800b4b2:	4a1a      	ldr	r2, [pc, #104]	@ (800b51c <fn_0800B3E0+0x13c>)
 800b4b4:	58aa      	ldr	r2, [r5, r2]
 800b4b6:	4694      	mov	ip, r2
 800b4b8:	8aa2      	ldrh	r2, [r4, #20]
 800b4ba:	4690      	mov	r8, r2
 800b4bc:	0052      	lsls	r2, r2, #1
 800b4be:	4442      	add	r2, r8
 800b4c0:	0092      	lsls	r2, r2, #2
 800b4c2:	4462      	add	r2, ip
 800b4c4:	8952      	ldrh	r2, [r2, #10]
 800b4c6:	4690      	mov	r8, r2
 800b4c8:	0092      	lsls	r2, r2, #2
 800b4ca:	59a8      	ldr	r0, [r5, r6]
 800b4cc:	4442      	add	r2, r8
 800b4ce:	00d2      	lsls	r2, r2, #3
 800b4d0:	1882      	adds	r2, r0, r2
 800b4d2:	2520      	movs	r5, #32
 800b4d4:	5f52      	ldrsh	r2, [r2, r5]
 800b4d6:	841a      	strh	r2, [r3, #32]
 800b4d8:	8aa2      	ldrh	r2, [r4, #20]
 800b4da:	4690      	mov	r8, r2
 800b4dc:	0052      	lsls	r2, r2, #1
 800b4de:	4442      	add	r2, r8
 800b4e0:	0092      	lsls	r2, r2, #2
 800b4e2:	4462      	add	r2, ip
 800b4e4:	8952      	ldrh	r2, [r2, #10]
 800b4e6:	4694      	mov	ip, r2
 800b4e8:	2527      	movs	r5, #39	@ 0x27
 800b4ea:	0092      	lsls	r2, r2, #2
 800b4ec:	4462      	add	r2, ip
 800b4ee:	00d2      	lsls	r2, r2, #3
 800b4f0:	1880      	adds	r0, r0, r2
 800b4f2:	2204      	movs	r2, #4
 800b4f4:	46ac      	mov	ip, r5
 800b4f6:	3027      	adds	r0, #39	@ 0x27
 800b4f8:	7800      	ldrb	r0, [r0, #0]
 800b4fa:	4010      	ands	r0, r2
 800b4fc:	5d5a      	ldrb	r2, [r3, r5]
 800b4fe:	3d23      	subs	r5, #35	@ 0x23
 800b500:	43aa      	bics	r2, r5
 800b502:	4302      	orrs	r2, r0
 800b504:	4660      	mov	r0, ip
 800b506:	541a      	strb	r2, [r3, r0]
 800b508:	2301      	movs	r3, #1
 800b50a:	4698      	mov	r8, r3
 800b50c:	0020      	movs	r0, r4
 800b50e:	f009 fe13 	bl	8015138 <fn_08015138>
 800b512:	1e01      	subs	r1, r0, #0
 800b514:	dab3      	bge.n	800b47e <fn_0800B3E0+0x9e>
 800b516:	e778      	b.n	800b40a <fn_0800B3E0+0x2a>
 800b518:	030064c4 	.word	0x030064c4
 800b51c:	00000e0c 	.word	0x00000e0c
