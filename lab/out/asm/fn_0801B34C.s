fn_0801B34C:
 801b34c:	b5f0      	push	{r4, r5, r6, r7, lr}
 801b34e:	4647      	mov	r7, r8
 801b350:	46ce      	mov	lr, r9
 801b352:	b580      	push	{r7, lr}
 801b354:	4dc8      	ldr	r5, [pc, #800]	@ (801b678 <fn_0801B34C+0x32c>)
 801b356:	4fc9      	ldr	r7, [pc, #804]	@ (801b67c <fn_0801B34C+0x330>)
 801b358:	682b      	ldr	r3, [r5, #0]
 801b35a:	683c      	ldr	r4, [r7, #0]
 801b35c:	b083      	sub	sp, #12
 801b35e:	2b09      	cmp	r3, #9
 801b360:	dc55      	bgt.n	801b40e <fn_0801B34C+0xc2>
 801b362:	2284      	movs	r2, #132	@ 0x84
 801b364:	0052      	lsls	r2, r2, #1
 801b366:	58a6      	ldr	r6, [r4, r2]
 801b368:	2e00      	cmp	r6, #0
 801b36a:	d100      	bne.n	801b36e <fn_0801B34C+0x22>
 801b36c:	e0b4      	b.n	801b4d8 <fn_0801B34C+0x18c>
 801b36e:	2b09      	cmp	r3, #9
 801b370:	d04d      	beq.n	801b40e <fn_0801B34C+0xc2>
 801b372:	22d0      	movs	r2, #208	@ 0xd0
 801b374:	0052      	lsls	r2, r2, #1
 801b376:	58a2      	ldr	r2, [r4, r2]
 801b378:	2a00      	cmp	r2, #0
 801b37a:	d000      	beq.n	801b37e <fn_0801B34C+0x32>
 801b37c:	e0b7      	b.n	801b4ee <fn_0801B34C+0x1a2>
 801b37e:	2b08      	cmp	r3, #8
 801b380:	d045      	beq.n	801b40e <fn_0801B34C+0xc2>
 801b382:	22ce      	movs	r2, #206	@ 0xce
 801b384:	0052      	lsls	r2, r2, #1
 801b386:	58a2      	ldr	r2, [r4, r2]
 801b388:	2a00      	cmp	r2, #0
 801b38a:	d000      	beq.n	801b38e <fn_0801B34C+0x42>
 801b38c:	e075      	b.n	801b47a <fn_0801B34C+0x12e>
 801b38e:	2b07      	cmp	r3, #7
 801b390:	d03d      	beq.n	801b40e <fn_0801B34C+0xc2>
 801b392:	2b06      	cmp	r3, #6
 801b394:	d03b      	beq.n	801b40e <fn_0801B34C+0xc2>
 801b396:	22be      	movs	r2, #190	@ 0xbe
 801b398:	0052      	lsls	r2, r2, #1
 801b39a:	58a2      	ldr	r2, [r4, r2]
 801b39c:	2a00      	cmp	r2, #0
 801b39e:	d024      	beq.n	801b3ea <fn_0801B34C+0x9e>
 801b3a0:	4fb7      	ldr	r7, [pc, #732]	@ (801b680 <fn_0801B34C+0x334>)
 801b3a2:	687a      	ldr	r2, [r7, #4]
 801b3a4:	1c51      	adds	r1, r2, #1
 801b3a6:	d100      	bne.n	801b3aa <fn_0801B34C+0x5e>
 801b3a8:	e139      	b.n	801b61e <fn_0801B34C+0x2d2>
 801b3aa:	3a01      	subs	r2, #1
 801b3ac:	607a      	str	r2, [r7, #4]
 801b3ae:	2a00      	cmp	r2, #0
 801b3b0:	d11f      	bne.n	801b3f2 <fn_0801B34C+0xa6>
 801b3b2:	2305      	movs	r3, #5
 801b3b4:	602b      	str	r3, [r5, #0]
 801b3b6:	2e64      	cmp	r6, #100	@ 0x64
 801b3b8:	dd00      	ble.n	801b3bc <fn_0801B34C+0x70>
 801b3ba:	e1a0      	b.n	801b6fe <fn_0801B34C+0x3b2>
 801b3bc:	683b      	ldr	r3, [r7, #0]
 801b3be:	429e      	cmp	r6, r3
 801b3c0:	d100      	bne.n	801b3c4 <fn_0801B34C+0x78>
 801b3c2:	e1e7      	b.n	801b794 <fn_0801B34C+0x448>
 801b3c4:	2364      	movs	r3, #100	@ 0x64
 801b3c6:	1b9b      	subs	r3, r3, r6
 801b3c8:	0098      	lsls	r0, r3, #2
 801b3ca:	2165      	movs	r1, #101	@ 0x65
 801b3cc:	18c0      	adds	r0, r0, r3
 801b3ce:	f00a f937 	bl	8025640 <fn_08025640>
 801b3d2:	00c0      	lsls	r0, r0, #3
 801b3d4:	6068      	str	r0, [r5, #4]
 801b3d6:	603e      	str	r6, [r7, #0]
 801b3d8:	4baa      	ldr	r3, [pc, #680]	@ (801b684 <fn_0801B34C+0x338>)
 801b3da:	3007      	adds	r0, #7
 801b3dc:	50e0      	str	r0, [r4, r3]
 801b3de:	2301      	movs	r3, #1
 801b3e0:	4aa9      	ldr	r2, [pc, #676]	@ (801b688 <fn_0801B34C+0x33c>)
 801b3e2:	607b      	str	r3, [r7, #4]
 801b3e4:	50a3      	str	r3, [r4, r2]
 801b3e6:	3b01      	subs	r3, #1
 801b3e8:	e038      	b.n	801b45c <fn_0801B34C+0x110>
 801b3ea:	2101      	movs	r1, #1
 801b3ec:	4aa4      	ldr	r2, [pc, #656]	@ (801b680 <fn_0801B34C+0x334>)
 801b3ee:	4249      	negs	r1, r1
 801b3f0:	6051      	str	r1, [r2, #4]
 801b3f2:	2b05      	cmp	r3, #5
 801b3f4:	d00b      	beq.n	801b40e <fn_0801B34C+0xc2>
 801b3f6:	23c2      	movs	r3, #194	@ 0xc2
 801b3f8:	005b      	lsls	r3, r3, #1
 801b3fa:	58e3      	ldr	r3, [r4, r3]
 801b3fc:	079b      	lsls	r3, r3, #30
 801b3fe:	d500      	bpl.n	801b402 <fn_0801B34C+0xb6>
 801b400:	e0fd      	b.n	801b5fe <fn_0801B34C+0x2b2>
 801b402:	238a      	movs	r3, #138	@ 0x8a
 801b404:	005b      	lsls	r3, r3, #1
 801b406:	58e3      	ldr	r3, [r4, r3]
 801b408:	2b00      	cmp	r3, #0
 801b40a:	d000      	beq.n	801b40e <fn_0801B34C+0xc2>
 801b40c:	e0f7      	b.n	801b5fe <fn_0801B34C+0x2b2>
 801b40e:	4b9e      	ldr	r3, [pc, #632]	@ (801b688 <fn_0801B34C+0x33c>)
 801b410:	58e3      	ldr	r3, [r4, r3]
 801b412:	2b00      	cmp	r3, #0
 801b414:	d1e7      	bne.n	801b3e6 <fn_0801B34C+0x9a>
 801b416:	2384      	movs	r3, #132	@ 0x84
 801b418:	005b      	lsls	r3, r3, #1
 801b41a:	58e6      	ldr	r6, [r4, r3]
 801b41c:	2e64      	cmp	r6, #100	@ 0x64
 801b41e:	dc26      	bgt.n	801b46e <fn_0801B34C+0x122>
 801b420:	4f97      	ldr	r7, [pc, #604]	@ (801b680 <fn_0801B34C+0x334>)
 801b422:	683b      	ldr	r3, [r7, #0]
 801b424:	429e      	cmp	r6, r3
 801b426:	d100      	bne.n	801b42a <fn_0801B34C+0xde>
 801b428:	e0f3      	b.n	801b612 <fn_0801B34C+0x2c6>
 801b42a:	2364      	movs	r3, #100	@ 0x64
 801b42c:	1b9b      	subs	r3, r3, r6
 801b42e:	0098      	lsls	r0, r3, #2
 801b430:	18c0      	adds	r0, r0, r3
 801b432:	2165      	movs	r1, #101	@ 0x65
 801b434:	f00a f904 	bl	8025640 <fn_08025640>
 801b438:	00c3      	lsls	r3, r0, #3
 801b43a:	4698      	mov	r8, r3
 801b43c:	606b      	str	r3, [r5, #4]
 801b43e:	603e      	str	r6, [r7, #0]
 801b440:	4b92      	ldr	r3, [pc, #584]	@ (801b68c <fn_0801B34C+0x340>)
 801b442:	2103      	movs	r1, #3
 801b444:	58e0      	ldr	r0, [r4, r3]
 801b446:	f00a f8a7 	bl	8025598 <fn_08025598>
 801b44a:	2212      	movs	r2, #18
 801b44c:	4b8d      	ldr	r3, [pc, #564]	@ (801b684 <fn_0801B34C+0x338>)
 801b44e:	4441      	add	r1, r8
 801b450:	50e1      	str	r1, [r4, r3]
 801b452:	4b8d      	ldr	r3, [pc, #564]	@ (801b688 <fn_0801B34C+0x33c>)
 801b454:	50e2      	str	r2, [r4, r3]
 801b456:	2300      	movs	r3, #0
 801b458:	602b      	str	r3, [r5, #0]
 801b45a:	3311      	adds	r3, #17
 801b45c:	4a8a      	ldr	r2, [pc, #552]	@ (801b688 <fn_0801B34C+0x33c>)
 801b45e:	50a3      	str	r3, [r4, r2]
 801b460:	b003      	add	sp, #12
 801b462:	bcc0      	pop	{r6, r7}
 801b464:	46b9      	mov	r9, r7
 801b466:	46b0      	mov	r8, r6
 801b468:	bcf0      	pop	{r4, r5, r6, r7}
 801b46a:	bc01      	pop	{r0}
 801b46c:	4700      	bx	r0
 801b46e:	2664      	movs	r6, #100	@ 0x64
 801b470:	4f83      	ldr	r7, [pc, #524]	@ (801b680 <fn_0801B34C+0x334>)
 801b472:	683b      	ldr	r3, [r7, #0]
 801b474:	429e      	cmp	r6, r3
 801b476:	d1d8      	bne.n	801b42a <fn_0801B34C+0xde>
 801b478:	e0cb      	b.n	801b612 <fn_0801B34C+0x2c6>
 801b47a:	22d2      	movs	r2, #210	@ 0xd2
 801b47c:	0052      	lsls	r2, r2, #1
 801b47e:	58a2      	ldr	r2, [r4, r2]
 801b480:	2a00      	cmp	r2, #0
 801b482:	d100      	bne.n	801b486 <fn_0801B34C+0x13a>
 801b484:	e0ce      	b.n	801b624 <fn_0801B34C+0x2d8>
 801b486:	21e0      	movs	r1, #224	@ 0xe0
 801b488:	5860      	ldr	r0, [r4, r1]
 801b48a:	4282      	cmp	r2, r0
 801b48c:	d100      	bne.n	801b490 <fn_0801B34C+0x144>
 801b48e:	e0c9      	b.n	801b624 <fn_0801B34C+0x2d8>
 801b490:	2307      	movs	r3, #7
 801b492:	602b      	str	r3, [r5, #0]
 801b494:	23b4      	movs	r3, #180	@ 0xb4
 801b496:	01db      	lsls	r3, r3, #7
 801b498:	58e3      	ldr	r3, [r4, r3]
 801b49a:	1b9b      	subs	r3, r3, r6
 801b49c:	2b14      	cmp	r3, #20
 801b49e:	dc00      	bgt.n	801b4a2 <fn_0801B34C+0x156>
 801b4a0:	e137      	b.n	801b712 <fn_0801B34C+0x3c6>
 801b4a2:	2223      	movs	r2, #35	@ 0x23
 801b4a4:	4b78      	ldr	r3, [pc, #480]	@ (801b688 <fn_0801B34C+0x33c>)
 801b4a6:	50e2      	str	r2, [r4, r3]
 801b4a8:	2e64      	cmp	r6, #100	@ 0x64
 801b4aa:	dd00      	ble.n	801b4ae <fn_0801B34C+0x162>
 801b4ac:	e129      	b.n	801b702 <fn_0801B34C+0x3b6>
 801b4ae:	4f74      	ldr	r7, [pc, #464]	@ (801b680 <fn_0801B34C+0x334>)
 801b4b0:	683b      	ldr	r3, [r7, #0]
 801b4b2:	429e      	cmp	r6, r3
 801b4b4:	d100      	bne.n	801b4b8 <fn_0801B34C+0x16c>
 801b4b6:	e16f      	b.n	801b798 <fn_0801B34C+0x44c>
 801b4b8:	2364      	movs	r3, #100	@ 0x64
 801b4ba:	1b9b      	subs	r3, r3, r6
 801b4bc:	0098      	lsls	r0, r3, #2
 801b4be:	2165      	movs	r1, #101	@ 0x65
 801b4c0:	18c0      	adds	r0, r0, r3
 801b4c2:	f00a f8bd 	bl	8025640 <fn_08025640>
 801b4c6:	00c0      	lsls	r0, r0, #3
 801b4c8:	6068      	str	r0, [r5, #4]
 801b4ca:	603e      	str	r6, [r7, #0]
 801b4cc:	4b6d      	ldr	r3, [pc, #436]	@ (801b684 <fn_0801B34C+0x338>)
 801b4ce:	3005      	adds	r0, #5
 801b4d0:	50e0      	str	r0, [r4, r3]
 801b4d2:	2323      	movs	r3, #35	@ 0x23
 801b4d4:	3b01      	subs	r3, #1
 801b4d6:	e7c1      	b.n	801b45c <fn_0801B34C+0x110>
 801b4d8:	2309      	movs	r3, #9
 801b4da:	602b      	str	r3, [r5, #0]
 801b4dc:	4b69      	ldr	r3, [pc, #420]	@ (801b684 <fn_0801B34C+0x338>)
 801b4de:	3adf      	subs	r2, #223	@ 0xdf
 801b4e0:	50e2      	str	r2, [r4, r3]
 801b4e2:	4b69      	ldr	r3, [pc, #420]	@ (801b688 <fn_0801B34C+0x33c>)
 801b4e4:	3a28      	subs	r2, #40	@ 0x28
 801b4e6:	50e2      	str	r2, [r4, r3]
 801b4e8:	2301      	movs	r3, #1
 801b4ea:	3b01      	subs	r3, #1
 801b4ec:	e7b6      	b.n	801b45c <fn_0801B34C+0x110>
 801b4ee:	229c      	movs	r2, #156	@ 0x9c
 801b4f0:	4967      	ldr	r1, [pc, #412]	@ (801b690 <fn_0801B34C+0x344>)
 801b4f2:	0052      	lsls	r2, r2, #1
 801b4f4:	58a2      	ldr	r2, [r4, r2]
 801b4f6:	5c60      	ldrb	r0, [r4, r1]
 801b4f8:	4282      	cmp	r2, r0
 801b4fa:	d100      	bne.n	801b4fe <fn_0801B34C+0x1b2>
 801b4fc:	e08c      	b.n	801b618 <fn_0801B34C+0x2cc>
 801b4fe:	1e50      	subs	r0, r2, #1
 801b500:	4182      	sbcs	r2, r0
 801b502:	5462      	strb	r2, [r4, r1]
 801b504:	2201      	movs	r2, #1
 801b506:	4690      	mov	r8, r2
 801b508:	219e      	movs	r1, #158	@ 0x9e
 801b50a:	4862      	ldr	r0, [pc, #392]	@ (801b694 <fn_0801B34C+0x348>)
 801b50c:	0049      	lsls	r1, r1, #1
 801b50e:	5861      	ldr	r1, [r4, r1]
 801b510:	5c22      	ldrb	r2, [r4, r0]
 801b512:	4291      	cmp	r1, r2
 801b514:	d004      	beq.n	801b520 <fn_0801B34C+0x1d4>
 801b516:	1e4a      	subs	r2, r1, #1
 801b518:	4191      	sbcs	r1, r2
 801b51a:	2201      	movs	r2, #1
 801b51c:	4690      	mov	r8, r2
 801b51e:	5421      	strb	r1, [r4, r0]
 801b520:	21a0      	movs	r1, #160	@ 0xa0
 801b522:	485d      	ldr	r0, [pc, #372]	@ (801b698 <fn_0801B34C+0x34c>)
 801b524:	0049      	lsls	r1, r1, #1
 801b526:	5861      	ldr	r1, [r4, r1]
 801b528:	5c22      	ldrb	r2, [r4, r0]
 801b52a:	4291      	cmp	r1, r2
 801b52c:	d004      	beq.n	801b538 <fn_0801B34C+0x1ec>
 801b52e:	1e4a      	subs	r2, r1, #1
 801b530:	4191      	sbcs	r1, r2
 801b532:	2201      	movs	r2, #1
 801b534:	4690      	mov	r8, r2
 801b536:	5421      	strb	r1, [r4, r0]
 801b538:	21a2      	movs	r1, #162	@ 0xa2
 801b53a:	4858      	ldr	r0, [pc, #352]	@ (801b69c <fn_0801B34C+0x350>)
 801b53c:	0049      	lsls	r1, r1, #1
 801b53e:	5861      	ldr	r1, [r4, r1]
 801b540:	5c22      	ldrb	r2, [r4, r0]
 801b542:	4291      	cmp	r1, r2
 801b544:	d004      	beq.n	801b550 <fn_0801B34C+0x204>
 801b546:	1e4a      	subs	r2, r1, #1
 801b548:	4191      	sbcs	r1, r2
 801b54a:	2201      	movs	r2, #1
 801b54c:	4690      	mov	r8, r2
 801b54e:	5421      	strb	r1, [r4, r0]
 801b550:	21a4      	movs	r1, #164	@ 0xa4
 801b552:	4853      	ldr	r0, [pc, #332]	@ (801b6a0 <fn_0801B34C+0x354>)
 801b554:	0049      	lsls	r1, r1, #1
 801b556:	5861      	ldr	r1, [r4, r1]
 801b558:	5c22      	ldrb	r2, [r4, r0]
 801b55a:	4291      	cmp	r1, r2
 801b55c:	d004      	beq.n	801b568 <fn_0801B34C+0x21c>
 801b55e:	1e4a      	subs	r2, r1, #1
 801b560:	4191      	sbcs	r1, r2
 801b562:	2201      	movs	r2, #1
 801b564:	4690      	mov	r8, r2
 801b566:	5421      	strb	r1, [r4, r0]
 801b568:	21a6      	movs	r1, #166	@ 0xa6
 801b56a:	484e      	ldr	r0, [pc, #312]	@ (801b6a4 <fn_0801B34C+0x358>)
 801b56c:	0049      	lsls	r1, r1, #1
 801b56e:	5861      	ldr	r1, [r4, r1]
 801b570:	5c22      	ldrb	r2, [r4, r0]
 801b572:	4291      	cmp	r1, r2
 801b574:	d004      	beq.n	801b580 <fn_0801B34C+0x234>
 801b576:	1e4a      	subs	r2, r1, #1
 801b578:	4191      	sbcs	r1, r2
 801b57a:	2201      	movs	r2, #1
 801b57c:	4690      	mov	r8, r2
 801b57e:	5421      	strb	r1, [r4, r0]
 801b580:	21a8      	movs	r1, #168	@ 0xa8
 801b582:	4849      	ldr	r0, [pc, #292]	@ (801b6a8 <fn_0801B34C+0x35c>)
 801b584:	0049      	lsls	r1, r1, #1
 801b586:	5861      	ldr	r1, [r4, r1]
 801b588:	5c22      	ldrb	r2, [r4, r0]
 801b58a:	428a      	cmp	r2, r1
 801b58c:	d004      	beq.n	801b598 <fn_0801B34C+0x24c>
 801b58e:	1e4a      	subs	r2, r1, #1
 801b590:	4191      	sbcs	r1, r2
 801b592:	2201      	movs	r2, #1
 801b594:	4690      	mov	r8, r2
 801b596:	5421      	strb	r1, [r4, r0]
 801b598:	21aa      	movs	r1, #170	@ 0xaa
 801b59a:	4844      	ldr	r0, [pc, #272]	@ (801b6ac <fn_0801B34C+0x360>)
 801b59c:	0049      	lsls	r1, r1, #1
 801b59e:	5861      	ldr	r1, [r4, r1]
 801b5a0:	5c22      	ldrb	r2, [r4, r0]
 801b5a2:	428a      	cmp	r2, r1
 801b5a4:	d100      	bne.n	801b5a8 <fn_0801B34C+0x25c>
 801b5a6:	e09d      	b.n	801b6e4 <fn_0801B34C+0x398>
 801b5a8:	1e4b      	subs	r3, r1, #1
 801b5aa:	4199      	sbcs	r1, r3
 801b5ac:	23ac      	movs	r3, #172	@ 0xac
 801b5ae:	005b      	lsls	r3, r3, #1
 801b5b0:	5421      	strb	r1, [r4, r0]
 801b5b2:	58e1      	ldr	r1, [r4, r3]
 801b5b4:	4b3e      	ldr	r3, [pc, #248]	@ (801b6b0 <fn_0801B34C+0x364>)
 801b5b6:	5ce3      	ldrb	r3, [r4, r3]
 801b5b8:	4299      	cmp	r1, r3
 801b5ba:	d003      	beq.n	801b5c4 <fn_0801B34C+0x278>
 801b5bc:	1e4b      	subs	r3, r1, #1
 801b5be:	4199      	sbcs	r1, r3
 801b5c0:	4b3b      	ldr	r3, [pc, #236]	@ (801b6b0 <fn_0801B34C+0x364>)
 801b5c2:	54e1      	strb	r1, [r4, r3]
 801b5c4:	2308      	movs	r3, #8
 801b5c6:	2246      	movs	r2, #70	@ 0x46
 801b5c8:	602b      	str	r3, [r5, #0]
 801b5ca:	4b2f      	ldr	r3, [pc, #188]	@ (801b688 <fn_0801B34C+0x33c>)
 801b5cc:	50e2      	str	r2, [r4, r3]
 801b5ce:	2e64      	cmp	r6, #100	@ 0x64
 801b5d0:	dd00      	ble.n	801b5d4 <fn_0801B34C+0x288>
 801b5d2:	2664      	movs	r6, #100	@ 0x64
 801b5d4:	4f2a      	ldr	r7, [pc, #168]	@ (801b680 <fn_0801B34C+0x334>)
 801b5d6:	683b      	ldr	r3, [r7, #0]
 801b5d8:	429e      	cmp	r6, r3
 801b5da:	d100      	bne.n	801b5de <fn_0801B34C+0x292>
 801b5dc:	e093      	b.n	801b706 <fn_0801B34C+0x3ba>
 801b5de:	2364      	movs	r3, #100	@ 0x64
 801b5e0:	1b9b      	subs	r3, r3, r6
 801b5e2:	0098      	lsls	r0, r3, #2
 801b5e4:	2165      	movs	r1, #101	@ 0x65
 801b5e6:	18c0      	adds	r0, r0, r3
 801b5e8:	f00a f82a 	bl	8025640 <fn_08025640>
 801b5ec:	00c0      	lsls	r0, r0, #3
 801b5ee:	6068      	str	r0, [r5, #4]
 801b5f0:	603e      	str	r6, [r7, #0]
 801b5f2:	4b24      	ldr	r3, [pc, #144]	@ (801b684 <fn_0801B34C+0x338>)
 801b5f4:	3006      	adds	r0, #6
 801b5f6:	50e0      	str	r0, [r4, r3]
 801b5f8:	2346      	movs	r3, #70	@ 0x46
 801b5fa:	3b01      	subs	r3, #1
 801b5fc:	e72e      	b.n	801b45c <fn_0801B34C+0x110>
 801b5fe:	2304      	movs	r3, #4
 801b600:	2228      	movs	r2, #40	@ 0x28
 801b602:	602b      	str	r3, [r5, #0]
 801b604:	4b1f      	ldr	r3, [pc, #124]	@ (801b684 <fn_0801B34C+0x338>)
 801b606:	50e2      	str	r2, [r4, r3]
 801b608:	4b1f      	ldr	r3, [pc, #124]	@ (801b688 <fn_0801B34C+0x33c>)
 801b60a:	3a27      	subs	r2, #39	@ 0x27
 801b60c:	50e2      	str	r2, [r4, r3]
 801b60e:	2300      	movs	r3, #0
 801b610:	e724      	b.n	801b45c <fn_0801B34C+0x110>
 801b612:	686b      	ldr	r3, [r5, #4]
 801b614:	4698      	mov	r8, r3
 801b616:	e713      	b.n	801b440 <fn_0801B34C+0xf4>
 801b618:	2200      	movs	r2, #0
 801b61a:	4690      	mov	r8, r2
 801b61c:	e774      	b.n	801b508 <fn_0801B34C+0x1bc>
 801b61e:	3247      	adds	r2, #71	@ 0x47
 801b620:	607a      	str	r2, [r7, #4]
 801b622:	e6e6      	b.n	801b3f2 <fn_0801B34C+0xa6>
 801b624:	2b07      	cmp	r3, #7
 801b626:	d100      	bne.n	801b62a <fn_0801B34C+0x2de>
 801b628:	e6f1      	b.n	801b40e <fn_0801B34C+0xc2>
 801b62a:	9601      	str	r6, [sp, #4]
 801b62c:	2e64      	cmp	r6, #100	@ 0x64
 801b62e:	dd01      	ble.n	801b634 <fn_0801B34C+0x2e8>
 801b630:	2364      	movs	r3, #100	@ 0x64
 801b632:	9301      	str	r3, [sp, #4]
 801b634:	4f12      	ldr	r7, [pc, #72]	@ (801b680 <fn_0801B34C+0x334>)
 801b636:	683a      	ldr	r2, [r7, #0]
 801b638:	23b4      	movs	r3, #180	@ 0xb4
 801b63a:	01db      	lsls	r3, r3, #7
 801b63c:	58e3      	ldr	r3, [r4, r3]
 801b63e:	1b9b      	subs	r3, r3, r6
 801b640:	2b14      	cmp	r3, #20
 801b642:	dd37      	ble.n	801b6b4 <fn_0801B34C+0x368>
 801b644:	2307      	movs	r3, #7
 801b646:	2123      	movs	r1, #35	@ 0x23
 801b648:	602b      	str	r3, [r5, #0]
 801b64a:	4b0f      	ldr	r3, [pc, #60]	@ (801b688 <fn_0801B34C+0x33c>)
 801b64c:	50e1      	str	r1, [r4, r3]
 801b64e:	9b01      	ldr	r3, [sp, #4]
 801b650:	4293      	cmp	r3, r2
 801b652:	d05c      	beq.n	801b70e <fn_0801B34C+0x3c2>
 801b654:	001e      	movs	r6, r3
 801b656:	2364      	movs	r3, #100	@ 0x64
 801b658:	1b9b      	subs	r3, r3, r6
 801b65a:	0098      	lsls	r0, r3, #2
 801b65c:	2165      	movs	r1, #101	@ 0x65
 801b65e:	18c0      	adds	r0, r0, r3
 801b660:	f009 ffee 	bl	8025640 <fn_08025640>
 801b664:	00c0      	lsls	r0, r0, #3
 801b666:	6068      	str	r0, [r5, #4]
 801b668:	603e      	str	r6, [r7, #0]
 801b66a:	4b06      	ldr	r3, [pc, #24]	@ (801b684 <fn_0801B34C+0x338>)
 801b66c:	3005      	adds	r0, #5
 801b66e:	50e0      	str	r0, [r4, r3]
 801b670:	2323      	movs	r3, #35	@ 0x23
 801b672:	3b01      	subs	r3, #1
 801b674:	e6f2      	b.n	801b45c <fn_0801B34C+0x110>
 801b676:	46c0      	nop			@ (mov r8, r8)
 801b678:	03006778 	.word	0x03006778
 801b67c:	030064c4 	.word	0x030064c4
 801b680:	03006bac 	.word	0x03006bac
 801b684:	00005a14 	.word	0x00005a14
 801b688:	00005a10 	.word	0x00005a10
 801b68c:	00005a24 	.word	0x00005a24
 801b690:	00005a04 	.word	0x00005a04
 801b694:	00005a05 	.word	0x00005a05
 801b698:	00005a06 	.word	0x00005a06
 801b69c:	00005a07 	.word	0x00005a07
 801b6a0:	00005a08 	.word	0x00005a08
 801b6a4:	00005a09 	.word	0x00005a09
 801b6a8:	00005a0a 	.word	0x00005a0a
 801b6ac:	00005a0b 	.word	0x00005a0b
 801b6b0:	00005a0c 	.word	0x00005a0c
 801b6b4:	2306      	movs	r3, #6
 801b6b6:	2123      	movs	r1, #35	@ 0x23
 801b6b8:	602b      	str	r3, [r5, #0]
 801b6ba:	4b41      	ldr	r3, [pc, #260]	@ (801b7c0 <fn_0801B34C+0x474>)
 801b6bc:	50e1      	str	r1, [r4, r3]
 801b6be:	9b01      	ldr	r3, [sp, #4]
 801b6c0:	4293      	cmp	r3, r2
 801b6c2:	d022      	beq.n	801b70a <fn_0801B34C+0x3be>
 801b6c4:	001e      	movs	r6, r3
 801b6c6:	2364      	movs	r3, #100	@ 0x64
 801b6c8:	1b9b      	subs	r3, r3, r6
 801b6ca:	0098      	lsls	r0, r3, #2
 801b6cc:	2165      	movs	r1, #101	@ 0x65
 801b6ce:	18c0      	adds	r0, r0, r3
 801b6d0:	f009 ffb6 	bl	8025640 <fn_08025640>
 801b6d4:	00c0      	lsls	r0, r0, #3
 801b6d6:	6068      	str	r0, [r5, #4]
 801b6d8:	603e      	str	r6, [r7, #0]
 801b6da:	4b3a      	ldr	r3, [pc, #232]	@ (801b7c4 <fn_0801B34C+0x478>)
 801b6dc:	3007      	adds	r0, #7
 801b6de:	50e0      	str	r0, [r4, r3]
 801b6e0:	2323      	movs	r3, #35	@ 0x23
 801b6e2:	e7c6      	b.n	801b672 <fn_0801B34C+0x326>
 801b6e4:	21ac      	movs	r1, #172	@ 0xac
 801b6e6:	4838      	ldr	r0, [pc, #224]	@ (801b7c8 <fn_0801B34C+0x47c>)
 801b6e8:	0049      	lsls	r1, r1, #1
 801b6ea:	5861      	ldr	r1, [r4, r1]
 801b6ec:	5c20      	ldrb	r0, [r4, r0]
 801b6ee:	4288      	cmp	r0, r1
 801b6f0:	d000      	beq.n	801b6f4 <fn_0801B34C+0x3a8>
 801b6f2:	e763      	b.n	801b5bc <fn_0801B34C+0x270>
 801b6f4:	4642      	mov	r2, r8
 801b6f6:	2a00      	cmp	r2, #0
 801b6f8:	d100      	bne.n	801b6fc <fn_0801B34C+0x3b0>
 801b6fa:	e640      	b.n	801b37e <fn_0801B34C+0x32>
 801b6fc:	e762      	b.n	801b5c4 <fn_0801B34C+0x278>
 801b6fe:	2664      	movs	r6, #100	@ 0x64
 801b700:	e65c      	b.n	801b3bc <fn_0801B34C+0x70>
 801b702:	2664      	movs	r6, #100	@ 0x64
 801b704:	e6d3      	b.n	801b4ae <fn_0801B34C+0x162>
 801b706:	6868      	ldr	r0, [r5, #4]
 801b708:	e773      	b.n	801b5f2 <fn_0801B34C+0x2a6>
 801b70a:	6868      	ldr	r0, [r5, #4]
 801b70c:	e7e5      	b.n	801b6da <fn_0801B34C+0x38e>
 801b70e:	6868      	ldr	r0, [r5, #4]
 801b710:	e7ab      	b.n	801b66a <fn_0801B34C+0x31e>
 801b712:	320c      	adds	r2, #12
 801b714:	300c      	adds	r0, #12
 801b716:	ca0c      	ldmia	r2, {r2, r3}
 801b718:	c803      	ldmia	r0, {r0, r1}
 801b71a:	f009 ff79 	bl	8025610 <fn_08025610>
 801b71e:	23e0      	movs	r3, #224	@ 0xe0
 801b720:	683c      	ldr	r4, [r7, #0]
 801b722:	58e3      	ldr	r3, [r4, r3]
 801b724:	6a1b      	ldr	r3, [r3, #32]
 801b726:	4283      	cmp	r3, r0
 801b728:	d238      	bcs.n	801b79c <fn_0801B34C+0x450>
 801b72a:	1ac2      	subs	r2, r0, r3
 801b72c:	2380      	movs	r3, #128	@ 0x80
 801b72e:	061b      	lsls	r3, r3, #24
 801b730:	4293      	cmp	r3, r2
 801b732:	419b      	sbcs	r3, r3
 801b734:	425b      	negs	r3, r3
 801b736:	4690      	mov	r8, r2
 801b738:	4699      	mov	r9, r3
 801b73a:	2223      	movs	r2, #35	@ 0x23
 801b73c:	4b20      	ldr	r3, [pc, #128]	@ (801b7c0 <fn_0801B34C+0x474>)
 801b73e:	50e2      	str	r2, [r4, r3]
 801b740:	2384      	movs	r3, #132	@ 0x84
 801b742:	005b      	lsls	r3, r3, #1
 801b744:	58e6      	ldr	r6, [r4, r3]
 801b746:	9601      	str	r6, [sp, #4]
 801b748:	2e64      	cmp	r6, #100	@ 0x64
 801b74a:	dd01      	ble.n	801b750 <fn_0801B34C+0x404>
 801b74c:	3ba4      	subs	r3, #164	@ 0xa4
 801b74e:	9301      	str	r3, [sp, #4]
 801b750:	4f1e      	ldr	r7, [pc, #120]	@ (801b7cc <fn_0801B34C+0x480>)
 801b752:	9b01      	ldr	r3, [sp, #4]
 801b754:	683a      	ldr	r2, [r7, #0]
 801b756:	4293      	cmp	r3, r2
 801b758:	d02f      	beq.n	801b7ba <fn_0801B34C+0x46e>
 801b75a:	001a      	movs	r2, r3
 801b75c:	2364      	movs	r3, #100	@ 0x64
 801b75e:	1a9b      	subs	r3, r3, r2
 801b760:	0098      	lsls	r0, r3, #2
 801b762:	2165      	movs	r1, #101	@ 0x65
 801b764:	18c0      	adds	r0, r0, r3
 801b766:	f009 ff6b 	bl	8025640 <fn_08025640>
 801b76a:	9a01      	ldr	r2, [sp, #4]
 801b76c:	00c0      	lsls	r0, r0, #3
 801b76e:	6068      	str	r0, [r5, #4]
 801b770:	603a      	str	r2, [r7, #0]
 801b772:	4b17      	ldr	r3, [pc, #92]	@ (801b7d0 <fn_0801B34C+0x484>)
 801b774:	4598      	cmp	r8, r3
 801b776:	d81a      	bhi.n	801b7ae <fn_0801B34C+0x462>
 801b778:	1dc3      	adds	r3, r0, #7
 801b77a:	4912      	ldr	r1, [pc, #72]	@ (801b7c4 <fn_0801B34C+0x478>)
 801b77c:	5063      	str	r3, [r4, r1]
 801b77e:	682b      	ldr	r3, [r5, #0]
 801b780:	2b06      	cmp	r3, #6
 801b782:	dd00      	ble.n	801b786 <fn_0801B34C+0x43a>
 801b784:	e774      	b.n	801b670 <fn_0801B34C+0x324>
 801b786:	21ce      	movs	r1, #206	@ 0xce
 801b788:	0049      	lsls	r1, r1, #1
 801b78a:	5861      	ldr	r1, [r4, r1]
 801b78c:	2900      	cmp	r1, #0
 801b78e:	d000      	beq.n	801b792 <fn_0801B34C+0x446>
 801b790:	e752      	b.n	801b638 <fn_0801B34C+0x2ec>
 801b792:	e5fe      	b.n	801b392 <fn_0801B34C+0x46>
 801b794:	6868      	ldr	r0, [r5, #4]
 801b796:	e61f      	b.n	801b3d8 <fn_0801B34C+0x8c>
 801b798:	6868      	ldr	r0, [r5, #4]
 801b79a:	e697      	b.n	801b4cc <fn_0801B34C+0x180>
 801b79c:	1a18      	subs	r0, r3, r0
 801b79e:	2380      	movs	r3, #128	@ 0x80
 801b7a0:	2200      	movs	r2, #0
 801b7a2:	061b      	lsls	r3, r3, #24
 801b7a4:	4283      	cmp	r3, r0
 801b7a6:	4152      	adcs	r2, r2
 801b7a8:	4680      	mov	r8, r0
 801b7aa:	4691      	mov	r9, r2
 801b7ac:	e7c5      	b.n	801b73a <fn_0801B34C+0x3ee>
 801b7ae:	464b      	mov	r3, r9
 801b7b0:	4259      	negs	r1, r3
 801b7b2:	414b      	adcs	r3, r1
 801b7b4:	181b      	adds	r3, r3, r0
 801b7b6:	3303      	adds	r3, #3
 801b7b8:	e7df      	b.n	801b77a <fn_0801B34C+0x42e>
 801b7ba:	6868      	ldr	r0, [r5, #4]
 801b7bc:	e7d9      	b.n	801b772 <fn_0801B34C+0x426>
 801b7be:	46c0      	nop			@ (mov r8, r8)
 801b7c0:	00005a10 	.word	0x00005a10
 801b7c4:	00005a14 	.word	0x00005a14
 801b7c8:	00005a0c 	.word	0x00005a0c
 801b7cc:	03006bac 	.word	0x03006bac
 801b7d0:	1fffffff 	.word	0x1fffffff
