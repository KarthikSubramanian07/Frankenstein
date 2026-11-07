fn_0801B298:
 801b298:	b5f0      	push	{r4, r5, r6, r7, lr}
 801b29a:	4647      	mov	r7, r8
 801b29c:	46ce      	mov	lr, r9
 801b29e:	b580      	push	{r7, lr}
 801b2a0:	4dc0      	ldr	r5, [pc, #768]	@ (801b5a4 <fn_0801B298+0x30c>)
 801b2a2:	4fc1      	ldr	r7, [pc, #772]	@ (801b5a8 <fn_0801B298+0x310>)
 801b2a4:	682b      	ldr	r3, [r5, #0]
 801b2a6:	683c      	ldr	r4, [r7, #0]
 801b2a8:	b083      	sub	sp, #12
 801b2aa:	2b09      	cmp	r3, #9
 801b2ac:	dc48      	bgt.n	801b340 <fn_0801B298+0xa8>
 801b2ae:	2284      	movs	r2, #132	@ 0x84
 801b2b0:	0052      	lsls	r2, r2, #1
 801b2b2:	58a6      	ldr	r6, [r4, r2]
 801b2b4:	2e00      	cmp	r6, #0
 801b2b6:	d100      	bne.n	801b2ba <fn_0801B298+0x22>
 801b2b8:	e073      	b.n	801b3a2 <fn_0801B298+0x10a>
 801b2ba:	2b09      	cmp	r3, #9
 801b2bc:	d040      	beq.n	801b340 <fn_0801B298+0xa8>
 801b2be:	22d0      	movs	r2, #208	@ 0xd0
 801b2c0:	0052      	lsls	r2, r2, #1
 801b2c2:	58a2      	ldr	r2, [r4, r2]
 801b2c4:	2a00      	cmp	r2, #0
 801b2c6:	d000      	beq.n	801b2ca <fn_0801B298+0x32>
 801b2c8:	e076      	b.n	801b3b8 <fn_0801B298+0x120>
 801b2ca:	2b08      	cmp	r3, #8
 801b2cc:	d038      	beq.n	801b340 <fn_0801B298+0xa8>
 801b2ce:	22d2      	movs	r2, #210	@ 0xd2
 801b2d0:	0052      	lsls	r2, r2, #1
 801b2d2:	58a2      	ldr	r2, [r4, r2]
 801b2d4:	2a00      	cmp	r2, #0
 801b2d6:	d100      	bne.n	801b2da <fn_0801B298+0x42>
 801b2d8:	e136      	b.n	801b548 <fn_0801B298+0x2b0>
 801b2da:	21ce      	movs	r1, #206	@ 0xce
 801b2dc:	0049      	lsls	r1, r1, #1
 801b2de:	5861      	ldr	r1, [r4, r1]
 801b2e0:	2900      	cmp	r1, #0
 801b2e2:	d100      	bne.n	801b2e6 <fn_0801B298+0x4e>
 801b2e4:	e17e      	b.n	801b5e4 <fn_0801B298+0x34c>
 801b2e6:	21e0      	movs	r1, #224	@ 0xe0
 801b2e8:	5860      	ldr	r0, [r4, r1]
 801b2ea:	4282      	cmp	r2, r0
 801b2ec:	d100      	bne.n	801b2f0 <fn_0801B298+0x58>
 801b2ee:	e1eb      	b.n	801b6c8 <fn_0801B298+0x430>
 801b2f0:	2307      	movs	r3, #7
 801b2f2:	602b      	str	r3, [r5, #0]
 801b2f4:	23b4      	movs	r3, #180	@ 0xb4
 801b2f6:	01db      	lsls	r3, r3, #7
 801b2f8:	58e3      	ldr	r3, [r4, r3]
 801b2fa:	1b9b      	subs	r3, r3, r6
 801b2fc:	2b14      	cmp	r3, #20
 801b2fe:	dc00      	bgt.n	801b302 <fn_0801B298+0x6a>
 801b300:	e0e9      	b.n	801b4d6 <fn_0801B298+0x23e>
 801b302:	2223      	movs	r2, #35	@ 0x23
 801b304:	4ba9      	ldr	r3, [pc, #676]	@ (801b5ac <fn_0801B298+0x314>)
 801b306:	50e2      	str	r2, [r4, r3]
 801b308:	2e64      	cmp	r6, #100	@ 0x64
 801b30a:	dd00      	ble.n	801b30e <fn_0801B298+0x76>
 801b30c:	e1e2      	b.n	801b6d4 <fn_0801B298+0x43c>
 801b30e:	4fa8      	ldr	r7, [pc, #672]	@ (801b5b0 <fn_0801B298+0x318>)
 801b310:	683b      	ldr	r3, [r7, #0]
 801b312:	429e      	cmp	r6, r3
 801b314:	d100      	bne.n	801b318 <fn_0801B298+0x80>
 801b316:	e1d5      	b.n	801b6c4 <fn_0801B298+0x42c>
 801b318:	2364      	movs	r3, #100	@ 0x64
 801b31a:	e134      	b.n	801b586 <fn_0801B298+0x2ee>
 801b31c:	2101      	movs	r1, #1
 801b31e:	4aa4      	ldr	r2, [pc, #656]	@ (801b5b0 <fn_0801B298+0x318>)
 801b320:	4249      	negs	r1, r1
 801b322:	6051      	str	r1, [r2, #4]
 801b324:	2b05      	cmp	r3, #5
 801b326:	d00b      	beq.n	801b340 <fn_0801B298+0xa8>
 801b328:	238a      	movs	r3, #138	@ 0x8a
 801b32a:	005b      	lsls	r3, r3, #1
 801b32c:	58e3      	ldr	r3, [r4, r3]
 801b32e:	2b00      	cmp	r3, #0
 801b330:	d000      	beq.n	801b334 <fn_0801B298+0x9c>
 801b332:	e186      	b.n	801b642 <fn_0801B298+0x3aa>
 801b334:	3385      	adds	r3, #133	@ 0x85
 801b336:	33ff      	adds	r3, #255	@ 0xff
 801b338:	58e3      	ldr	r3, [r4, r3]
 801b33a:	079b      	lsls	r3, r3, #30
 801b33c:	d500      	bpl.n	801b340 <fn_0801B298+0xa8>
 801b33e:	e180      	b.n	801b642 <fn_0801B298+0x3aa>
 801b340:	4b9a      	ldr	r3, [pc, #616]	@ (801b5ac <fn_0801B298+0x314>)
 801b342:	58e3      	ldr	r3, [r4, r3]
 801b344:	2b00      	cmp	r3, #0
 801b346:	d135      	bne.n	801b3b4 <fn_0801B298+0x11c>
 801b348:	2384      	movs	r3, #132	@ 0x84
 801b34a:	005b      	lsls	r3, r3, #1
 801b34c:	58e6      	ldr	r6, [r4, r3]
 801b34e:	2e64      	cmp	r6, #100	@ 0x64
 801b350:	dd00      	ble.n	801b354 <fn_0801B298+0xbc>
 801b352:	e0b9      	b.n	801b4c8 <fn_0801B298+0x230>
 801b354:	4f96      	ldr	r7, [pc, #600]	@ (801b5b0 <fn_0801B298+0x318>)
 801b356:	683b      	ldr	r3, [r7, #0]
 801b358:	429e      	cmp	r6, r3
 801b35a:	d100      	bne.n	801b35e <fn_0801B298+0xc6>
 801b35c:	e17b      	b.n	801b656 <fn_0801B298+0x3be>
 801b35e:	2364      	movs	r3, #100	@ 0x64
 801b360:	1b9b      	subs	r3, r3, r6
 801b362:	0098      	lsls	r0, r3, #2
 801b364:	18c0      	adds	r0, r0, r3
 801b366:	2165      	movs	r1, #101	@ 0x65
 801b368:	f00a f912 	bl	8025590 <fn_08025590>
 801b36c:	00c3      	lsls	r3, r0, #3
 801b36e:	4698      	mov	r8, r3
 801b370:	606b      	str	r3, [r5, #4]
 801b372:	603e      	str	r6, [r7, #0]
 801b374:	4b8f      	ldr	r3, [pc, #572]	@ (801b5b4 <fn_0801B298+0x31c>)
 801b376:	2103      	movs	r1, #3
 801b378:	58e0      	ldr	r0, [r4, r3]
 801b37a:	f00a f8b5 	bl	80254e8 <fn_080254E8>
 801b37e:	2212      	movs	r2, #18
 801b380:	4b8d      	ldr	r3, [pc, #564]	@ (801b5b8 <fn_0801B298+0x320>)
 801b382:	4441      	add	r1, r8
 801b384:	50e1      	str	r1, [r4, r3]
 801b386:	4b89      	ldr	r3, [pc, #548]	@ (801b5ac <fn_0801B298+0x314>)
 801b388:	50e2      	str	r2, [r4, r3]
 801b38a:	2300      	movs	r3, #0
 801b38c:	602b      	str	r3, [r5, #0]
 801b38e:	3311      	adds	r3, #17
 801b390:	4a86      	ldr	r2, [pc, #536]	@ (801b5ac <fn_0801B298+0x314>)
 801b392:	50a3      	str	r3, [r4, r2]
 801b394:	b003      	add	sp, #12
 801b396:	bcc0      	pop	{r6, r7}
 801b398:	46b9      	mov	r9, r7
 801b39a:	46b0      	mov	r8, r6
 801b39c:	bcf0      	pop	{r4, r5, r6, r7}
 801b39e:	bc01      	pop	{r0}
 801b3a0:	4700      	bx	r0
 801b3a2:	2309      	movs	r3, #9
 801b3a4:	602b      	str	r3, [r5, #0]
 801b3a6:	4b84      	ldr	r3, [pc, #528]	@ (801b5b8 <fn_0801B298+0x320>)
 801b3a8:	3adf      	subs	r2, #223	@ 0xdf
 801b3aa:	50e2      	str	r2, [r4, r3]
 801b3ac:	4b7f      	ldr	r3, [pc, #508]	@ (801b5ac <fn_0801B298+0x314>)
 801b3ae:	3a28      	subs	r2, #40	@ 0x28
 801b3b0:	50e2      	str	r2, [r4, r3]
 801b3b2:	2301      	movs	r3, #1
 801b3b4:	3b01      	subs	r3, #1
 801b3b6:	e7eb      	b.n	801b390 <fn_0801B298+0xf8>
 801b3b8:	22ac      	movs	r2, #172	@ 0xac
 801b3ba:	4980      	ldr	r1, [pc, #512]	@ (801b5bc <fn_0801B298+0x324>)
 801b3bc:	0052      	lsls	r2, r2, #1
 801b3be:	58a2      	ldr	r2, [r4, r2]
 801b3c0:	5c60      	ldrb	r0, [r4, r1]
 801b3c2:	4282      	cmp	r2, r0
 801b3c4:	d100      	bne.n	801b3c8 <fn_0801B298+0x130>
 801b3c6:	e16d      	b.n	801b6a4 <fn_0801B298+0x40c>
 801b3c8:	1e50      	subs	r0, r2, #1
 801b3ca:	4182      	sbcs	r2, r0
 801b3cc:	5462      	strb	r2, [r4, r1]
 801b3ce:	2201      	movs	r2, #1
 801b3d0:	4690      	mov	r8, r2
 801b3d2:	21aa      	movs	r1, #170	@ 0xaa
 801b3d4:	487a      	ldr	r0, [pc, #488]	@ (801b5c0 <fn_0801B298+0x328>)
 801b3d6:	0049      	lsls	r1, r1, #1
 801b3d8:	5861      	ldr	r1, [r4, r1]
 801b3da:	5c22      	ldrb	r2, [r4, r0]
 801b3dc:	4291      	cmp	r1, r2
 801b3de:	d004      	beq.n	801b3ea <fn_0801B298+0x152>
 801b3e0:	1e4a      	subs	r2, r1, #1
 801b3e2:	4191      	sbcs	r1, r2
 801b3e4:	2201      	movs	r2, #1
 801b3e6:	4690      	mov	r8, r2
 801b3e8:	5421      	strb	r1, [r4, r0]
 801b3ea:	21a8      	movs	r1, #168	@ 0xa8
 801b3ec:	4875      	ldr	r0, [pc, #468]	@ (801b5c4 <fn_0801B298+0x32c>)
 801b3ee:	0049      	lsls	r1, r1, #1
 801b3f0:	5861      	ldr	r1, [r4, r1]
 801b3f2:	5c22      	ldrb	r2, [r4, r0]
 801b3f4:	4291      	cmp	r1, r2
 801b3f6:	d004      	beq.n	801b402 <fn_0801B298+0x16a>
 801b3f8:	1e4a      	subs	r2, r1, #1
 801b3fa:	4191      	sbcs	r1, r2
 801b3fc:	2201      	movs	r2, #1
 801b3fe:	4690      	mov	r8, r2
 801b400:	5421      	strb	r1, [r4, r0]
 801b402:	21a6      	movs	r1, #166	@ 0xa6
 801b404:	4870      	ldr	r0, [pc, #448]	@ (801b5c8 <fn_0801B298+0x330>)
 801b406:	0049      	lsls	r1, r1, #1
 801b408:	5861      	ldr	r1, [r4, r1]
 801b40a:	5c22      	ldrb	r2, [r4, r0]
 801b40c:	4291      	cmp	r1, r2
 801b40e:	d004      	beq.n	801b41a <fn_0801B298+0x182>
 801b410:	1e4a      	subs	r2, r1, #1
 801b412:	4191      	sbcs	r1, r2
 801b414:	2201      	movs	r2, #1
 801b416:	4690      	mov	r8, r2
 801b418:	5421      	strb	r1, [r4, r0]
 801b41a:	21a4      	movs	r1, #164	@ 0xa4
 801b41c:	486b      	ldr	r0, [pc, #428]	@ (801b5cc <fn_0801B298+0x334>)
 801b41e:	0049      	lsls	r1, r1, #1
 801b420:	5861      	ldr	r1, [r4, r1]
 801b422:	5c22      	ldrb	r2, [r4, r0]
 801b424:	4291      	cmp	r1, r2
 801b426:	d004      	beq.n	801b432 <fn_0801B298+0x19a>
 801b428:	1e4a      	subs	r2, r1, #1
 801b42a:	4191      	sbcs	r1, r2
 801b42c:	2201      	movs	r2, #1
 801b42e:	4690      	mov	r8, r2
 801b430:	5421      	strb	r1, [r4, r0]
 801b432:	21a2      	movs	r1, #162	@ 0xa2
 801b434:	4866      	ldr	r0, [pc, #408]	@ (801b5d0 <fn_0801B298+0x338>)
 801b436:	0049      	lsls	r1, r1, #1
 801b438:	5861      	ldr	r1, [r4, r1]
 801b43a:	5c22      	ldrb	r2, [r4, r0]
 801b43c:	428a      	cmp	r2, r1
 801b43e:	d004      	beq.n	801b44a <fn_0801B298+0x1b2>
 801b440:	1e4a      	subs	r2, r1, #1
 801b442:	4191      	sbcs	r1, r2
 801b444:	2201      	movs	r2, #1
 801b446:	4690      	mov	r8, r2
 801b448:	5421      	strb	r1, [r4, r0]
 801b44a:	21a0      	movs	r1, #160	@ 0xa0
 801b44c:	4861      	ldr	r0, [pc, #388]	@ (801b5d4 <fn_0801B298+0x33c>)
 801b44e:	0049      	lsls	r1, r1, #1
 801b450:	5861      	ldr	r1, [r4, r1]
 801b452:	5c22      	ldrb	r2, [r4, r0]
 801b454:	4291      	cmp	r1, r2
 801b456:	d004      	beq.n	801b462 <fn_0801B298+0x1ca>
 801b458:	1e4a      	subs	r2, r1, #1
 801b45a:	4191      	sbcs	r1, r2
 801b45c:	2201      	movs	r2, #1
 801b45e:	4690      	mov	r8, r2
 801b460:	5421      	strb	r1, [r4, r0]
 801b462:	219e      	movs	r1, #158	@ 0x9e
 801b464:	485c      	ldr	r0, [pc, #368]	@ (801b5d8 <fn_0801B298+0x340>)
 801b466:	0049      	lsls	r1, r1, #1
 801b468:	5861      	ldr	r1, [r4, r1]
 801b46a:	5c22      	ldrb	r2, [r4, r0]
 801b46c:	4291      	cmp	r1, r2
 801b46e:	d100      	bne.n	801b472 <fn_0801B298+0x1da>
 801b470:	e11b      	b.n	801b6aa <fn_0801B298+0x412>
 801b472:	1e4b      	subs	r3, r1, #1
 801b474:	4199      	sbcs	r1, r3
 801b476:	239c      	movs	r3, #156	@ 0x9c
 801b478:	005b      	lsls	r3, r3, #1
 801b47a:	5421      	strb	r1, [r4, r0]
 801b47c:	58e1      	ldr	r1, [r4, r3]
 801b47e:	4b57      	ldr	r3, [pc, #348]	@ (801b5dc <fn_0801B298+0x344>)
 801b480:	5ce3      	ldrb	r3, [r4, r3]
 801b482:	4299      	cmp	r1, r3
 801b484:	d003      	beq.n	801b48e <fn_0801B298+0x1f6>
 801b486:	1e4b      	subs	r3, r1, #1
 801b488:	4199      	sbcs	r1, r3
 801b48a:	4b54      	ldr	r3, [pc, #336]	@ (801b5dc <fn_0801B298+0x344>)
 801b48c:	54e1      	strb	r1, [r4, r3]
 801b48e:	2308      	movs	r3, #8
 801b490:	602b      	str	r3, [r5, #0]
 801b492:	2e64      	cmp	r6, #100	@ 0x64
 801b494:	dd00      	ble.n	801b498 <fn_0801B298+0x200>
 801b496:	2664      	movs	r6, #100	@ 0x64
 801b498:	4f45      	ldr	r7, [pc, #276]	@ (801b5b0 <fn_0801B298+0x318>)
 801b49a:	683b      	ldr	r3, [r7, #0]
 801b49c:	429e      	cmp	r6, r3
 801b49e:	d100      	bne.n	801b4a2 <fn_0801B298+0x20a>
 801b4a0:	e11a      	b.n	801b6d8 <fn_0801B298+0x440>
 801b4a2:	2364      	movs	r3, #100	@ 0x64
 801b4a4:	1b9b      	subs	r3, r3, r6
 801b4a6:	0098      	lsls	r0, r3, #2
 801b4a8:	2165      	movs	r1, #101	@ 0x65
 801b4aa:	18c0      	adds	r0, r0, r3
 801b4ac:	f00a f870 	bl	8025590 <fn_08025590>
 801b4b0:	00c0      	lsls	r0, r0, #3
 801b4b2:	6068      	str	r0, [r5, #4]
 801b4b4:	603e      	str	r6, [r7, #0]
 801b4b6:	2246      	movs	r2, #70	@ 0x46
 801b4b8:	4b3f      	ldr	r3, [pc, #252]	@ (801b5b8 <fn_0801B298+0x320>)
 801b4ba:	3006      	adds	r0, #6
 801b4bc:	50e0      	str	r0, [r4, r3]
 801b4be:	4b3b      	ldr	r3, [pc, #236]	@ (801b5ac <fn_0801B298+0x314>)
 801b4c0:	50e2      	str	r2, [r4, r3]
 801b4c2:	2346      	movs	r3, #70	@ 0x46
 801b4c4:	3b01      	subs	r3, #1
 801b4c6:	e763      	b.n	801b390 <fn_0801B298+0xf8>
 801b4c8:	2664      	movs	r6, #100	@ 0x64
 801b4ca:	4f39      	ldr	r7, [pc, #228]	@ (801b5b0 <fn_0801B298+0x318>)
 801b4cc:	683b      	ldr	r3, [r7, #0]
 801b4ce:	429e      	cmp	r6, r3
 801b4d0:	d000      	beq.n	801b4d4 <fn_0801B298+0x23c>
 801b4d2:	e744      	b.n	801b35e <fn_0801B298+0xc6>
 801b4d4:	e0bf      	b.n	801b656 <fn_0801B298+0x3be>
 801b4d6:	320c      	adds	r2, #12
 801b4d8:	300c      	adds	r0, #12
 801b4da:	ca0c      	ldmia	r2, {r2, r3}
 801b4dc:	c803      	ldmia	r0, {r0, r1}
 801b4de:	f00a f83f 	bl	8025560 <fn_08025560>
 801b4e2:	23e0      	movs	r3, #224	@ 0xe0
 801b4e4:	683c      	ldr	r4, [r7, #0]
 801b4e6:	58e3      	ldr	r3, [r4, r3]
 801b4e8:	6a1f      	ldr	r7, [r3, #32]
 801b4ea:	4287      	cmp	r7, r0
 801b4ec:	d300      	bcc.n	801b4f0 <fn_0801B298+0x258>
 801b4ee:	e0f9      	b.n	801b6e4 <fn_0801B298+0x44c>
 801b4f0:	2380      	movs	r3, #128	@ 0x80
 801b4f2:	1bc2      	subs	r2, r0, r7
 801b4f4:	061b      	lsls	r3, r3, #24
 801b4f6:	4293      	cmp	r3, r2
 801b4f8:	419b      	sbcs	r3, r3
 801b4fa:	425b      	negs	r3, r3
 801b4fc:	4690      	mov	r8, r2
 801b4fe:	4699      	mov	r9, r3
 801b500:	2223      	movs	r2, #35	@ 0x23
 801b502:	4b2a      	ldr	r3, [pc, #168]	@ (801b5ac <fn_0801B298+0x314>)
 801b504:	50e2      	str	r2, [r4, r3]
 801b506:	2384      	movs	r3, #132	@ 0x84
 801b508:	005b      	lsls	r3, r3, #1
 801b50a:	58e6      	ldr	r6, [r4, r3]
 801b50c:	9601      	str	r6, [sp, #4]
 801b50e:	2e64      	cmp	r6, #100	@ 0x64
 801b510:	dd01      	ble.n	801b516 <fn_0801B298+0x27e>
 801b512:	3ba4      	subs	r3, #164	@ 0xa4
 801b514:	9301      	str	r3, [sp, #4]
 801b516:	4f26      	ldr	r7, [pc, #152]	@ (801b5b0 <fn_0801B298+0x318>)
 801b518:	9a01      	ldr	r2, [sp, #4]
 801b51a:	683b      	ldr	r3, [r7, #0]
 801b51c:	429a      	cmp	r2, r3
 801b51e:	d100      	bne.n	801b522 <fn_0801B298+0x28a>
 801b520:	e0f1      	b.n	801b706 <fn_0801B298+0x46e>
 801b522:	2364      	movs	r3, #100	@ 0x64
 801b524:	1a9b      	subs	r3, r3, r2
 801b526:	0098      	lsls	r0, r3, #2
 801b528:	2165      	movs	r1, #101	@ 0x65
 801b52a:	18c0      	adds	r0, r0, r3
 801b52c:	f00a f830 	bl	8025590 <fn_08025590>
 801b530:	9a01      	ldr	r2, [sp, #4]
 801b532:	00c0      	lsls	r0, r0, #3
 801b534:	6068      	str	r0, [r5, #4]
 801b536:	603a      	str	r2, [r7, #0]
 801b538:	4b29      	ldr	r3, [pc, #164]	@ (801b5e0 <fn_0801B298+0x348>)
 801b53a:	4598      	cmp	r8, r3
 801b53c:	d900      	bls.n	801b540 <fn_0801B298+0x2a8>
 801b53e:	e0da      	b.n	801b6f6 <fn_0801B298+0x45e>
 801b540:	4b1d      	ldr	r3, [pc, #116]	@ (801b5b8 <fn_0801B298+0x320>)
 801b542:	3007      	adds	r0, #7
 801b544:	50e0      	str	r0, [r4, r3]
 801b546:	682b      	ldr	r3, [r5, #0]
 801b548:	2b06      	cmp	r3, #6
 801b54a:	dd00      	ble.n	801b54e <fn_0801B298+0x2b6>
 801b54c:	e6f8      	b.n	801b340 <fn_0801B298+0xa8>
 801b54e:	22ce      	movs	r2, #206	@ 0xce
 801b550:	0052      	lsls	r2, r2, #1
 801b552:	58a2      	ldr	r2, [r4, r2]
 801b554:	2a00      	cmp	r2, #0
 801b556:	d048      	beq.n	801b5ea <fn_0801B298+0x352>
 801b558:	0030      	movs	r0, r6
 801b55a:	2e64      	cmp	r6, #100	@ 0x64
 801b55c:	dd00      	ble.n	801b560 <fn_0801B298+0x2c8>
 801b55e:	e07d      	b.n	801b65c <fn_0801B298+0x3c4>
 801b560:	23b4      	movs	r3, #180	@ 0xb4
 801b562:	01db      	lsls	r3, r3, #7
 801b564:	4f12      	ldr	r7, [pc, #72]	@ (801b5b0 <fn_0801B298+0x318>)
 801b566:	58e3      	ldr	r3, [r4, r3]
 801b568:	683a      	ldr	r2, [r7, #0]
 801b56a:	1b9b      	subs	r3, r3, r6
 801b56c:	2b14      	cmp	r3, #20
 801b56e:	dc00      	bgt.n	801b572 <fn_0801B298+0x2da>
 801b570:	e07e      	b.n	801b670 <fn_0801B298+0x3d8>
 801b572:	2307      	movs	r3, #7
 801b574:	2123      	movs	r1, #35	@ 0x23
 801b576:	602b      	str	r3, [r5, #0]
 801b578:	4b0c      	ldr	r3, [pc, #48]	@ (801b5ac <fn_0801B298+0x314>)
 801b57a:	50e1      	str	r1, [r4, r3]
 801b57c:	4290      	cmp	r0, r2
 801b57e:	d100      	bne.n	801b582 <fn_0801B298+0x2ea>
 801b580:	e0a0      	b.n	801b6c4 <fn_0801B298+0x42c>
 801b582:	2364      	movs	r3, #100	@ 0x64
 801b584:	0006      	movs	r6, r0
 801b586:	1b9b      	subs	r3, r3, r6
 801b588:	0098      	lsls	r0, r3, #2
 801b58a:	2165      	movs	r1, #101	@ 0x65
 801b58c:	18c0      	adds	r0, r0, r3
 801b58e:	f009 ffff 	bl	8025590 <fn_08025590>
 801b592:	00c0      	lsls	r0, r0, #3
 801b594:	6068      	str	r0, [r5, #4]
 801b596:	603e      	str	r6, [r7, #0]
 801b598:	4b07      	ldr	r3, [pc, #28]	@ (801b5b8 <fn_0801B298+0x320>)
 801b59a:	3005      	adds	r0, #5
 801b59c:	50e0      	str	r0, [r4, r3]
 801b59e:	2323      	movs	r3, #35	@ 0x23
 801b5a0:	3b01      	subs	r3, #1
 801b5a2:	e6f5      	b.n	801b390 <fn_0801B298+0xf8>
 801b5a4:	03006778 	.word	0x03006778
 801b5a8:	030064c4 	.word	0x030064c4
 801b5ac:	00005a10 	.word	0x00005a10
 801b5b0:	03006bac 	.word	0x03006bac
 801b5b4:	00005a24 	.word	0x00005a24
 801b5b8:	00005a14 	.word	0x00005a14
 801b5bc:	00005a0c 	.word	0x00005a0c
 801b5c0:	00005a0b 	.word	0x00005a0b
 801b5c4:	00005a0a 	.word	0x00005a0a
 801b5c8:	00005a09 	.word	0x00005a09
 801b5cc:	00005a08 	.word	0x00005a08
 801b5d0:	00005a07 	.word	0x00005a07
 801b5d4:	00005a06 	.word	0x00005a06
 801b5d8:	00005a05 	.word	0x00005a05
 801b5dc:	00005a04 	.word	0x00005a04
 801b5e0:	1fffffff 	.word	0x1fffffff
 801b5e4:	2b07      	cmp	r3, #7
 801b5e6:	d100      	bne.n	801b5ea <fn_0801B298+0x352>
 801b5e8:	e6aa      	b.n	801b340 <fn_0801B298+0xa8>
 801b5ea:	2b06      	cmp	r3, #6
 801b5ec:	d100      	bne.n	801b5f0 <fn_0801B298+0x358>
 801b5ee:	e6a7      	b.n	801b340 <fn_0801B298+0xa8>
 801b5f0:	22be      	movs	r2, #190	@ 0xbe
 801b5f2:	0052      	lsls	r2, r2, #1
 801b5f4:	58a2      	ldr	r2, [r4, r2]
 801b5f6:	2a00      	cmp	r2, #0
 801b5f8:	d100      	bne.n	801b5fc <fn_0801B298+0x364>
 801b5fa:	e68f      	b.n	801b31c <fn_0801B298+0x84>
 801b5fc:	4f45      	ldr	r7, [pc, #276]	@ (801b714 <fn_0801B298+0x47c>)
 801b5fe:	687a      	ldr	r2, [r7, #4]
 801b600:	1c51      	adds	r1, r2, #1
 801b602:	d04c      	beq.n	801b69e <fn_0801B298+0x406>
 801b604:	3a01      	subs	r2, #1
 801b606:	607a      	str	r2, [r7, #4]
 801b608:	2a00      	cmp	r2, #0
 801b60a:	d000      	beq.n	801b60e <fn_0801B298+0x376>
 801b60c:	e68a      	b.n	801b324 <fn_0801B298+0x8c>
 801b60e:	2305      	movs	r3, #5
 801b610:	602b      	str	r3, [r5, #0]
 801b612:	2e64      	cmp	r6, #100	@ 0x64
 801b614:	dc5c      	bgt.n	801b6d0 <fn_0801B298+0x438>
 801b616:	683b      	ldr	r3, [r7, #0]
 801b618:	429e      	cmp	r6, r3
 801b61a:	d061      	beq.n	801b6e0 <fn_0801B298+0x448>
 801b61c:	2364      	movs	r3, #100	@ 0x64
 801b61e:	1b9b      	subs	r3, r3, r6
 801b620:	0098      	lsls	r0, r3, #2
 801b622:	2165      	movs	r1, #101	@ 0x65
 801b624:	18c0      	adds	r0, r0, r3
 801b626:	f009 ffb3 	bl	8025590 <fn_08025590>
 801b62a:	00c0      	lsls	r0, r0, #3
 801b62c:	6068      	str	r0, [r5, #4]
 801b62e:	603e      	str	r6, [r7, #0]
 801b630:	4b39      	ldr	r3, [pc, #228]	@ (801b718 <fn_0801B298+0x480>)
 801b632:	3007      	adds	r0, #7
 801b634:	50e0      	str	r0, [r4, r3]
 801b636:	2301      	movs	r3, #1
 801b638:	4a38      	ldr	r2, [pc, #224]	@ (801b71c <fn_0801B298+0x484>)
 801b63a:	607b      	str	r3, [r7, #4]
 801b63c:	50a3      	str	r3, [r4, r2]
 801b63e:	3b01      	subs	r3, #1
 801b640:	e6a6      	b.n	801b390 <fn_0801B298+0xf8>
 801b642:	2304      	movs	r3, #4
 801b644:	2228      	movs	r2, #40	@ 0x28
 801b646:	602b      	str	r3, [r5, #0]
 801b648:	4b33      	ldr	r3, [pc, #204]	@ (801b718 <fn_0801B298+0x480>)
 801b64a:	50e2      	str	r2, [r4, r3]
 801b64c:	4b33      	ldr	r3, [pc, #204]	@ (801b71c <fn_0801B298+0x484>)
 801b64e:	3a27      	subs	r2, #39	@ 0x27
 801b650:	50e2      	str	r2, [r4, r3]
 801b652:	2300      	movs	r3, #0
 801b654:	e69c      	b.n	801b390 <fn_0801B298+0xf8>
 801b656:	686b      	ldr	r3, [r5, #4]
 801b658:	4698      	mov	r8, r3
 801b65a:	e68b      	b.n	801b374 <fn_0801B298+0xdc>
 801b65c:	23b4      	movs	r3, #180	@ 0xb4
 801b65e:	01db      	lsls	r3, r3, #7
 801b660:	4f2c      	ldr	r7, [pc, #176]	@ (801b714 <fn_0801B298+0x47c>)
 801b662:	58e3      	ldr	r3, [r4, r3]
 801b664:	2064      	movs	r0, #100	@ 0x64
 801b666:	683a      	ldr	r2, [r7, #0]
 801b668:	1b9b      	subs	r3, r3, r6
 801b66a:	2b14      	cmp	r3, #20
 801b66c:	dd00      	ble.n	801b670 <fn_0801B298+0x3d8>
 801b66e:	e780      	b.n	801b572 <fn_0801B298+0x2da>
 801b670:	2306      	movs	r3, #6
 801b672:	2123      	movs	r1, #35	@ 0x23
 801b674:	602b      	str	r3, [r5, #0]
 801b676:	4b29      	ldr	r3, [pc, #164]	@ (801b71c <fn_0801B298+0x484>)
 801b678:	50e1      	str	r1, [r4, r3]
 801b67a:	4290      	cmp	r0, r2
 801b67c:	d02e      	beq.n	801b6dc <fn_0801B298+0x444>
 801b67e:	2364      	movs	r3, #100	@ 0x64
 801b680:	1a1b      	subs	r3, r3, r0
 801b682:	0006      	movs	r6, r0
 801b684:	0098      	lsls	r0, r3, #2
 801b686:	2165      	movs	r1, #101	@ 0x65
 801b688:	18c0      	adds	r0, r0, r3
 801b68a:	f009 ff81 	bl	8025590 <fn_08025590>
 801b68e:	00c0      	lsls	r0, r0, #3
 801b690:	6068      	str	r0, [r5, #4]
 801b692:	603e      	str	r6, [r7, #0]
 801b694:	4b20      	ldr	r3, [pc, #128]	@ (801b718 <fn_0801B298+0x480>)
 801b696:	3007      	adds	r0, #7
 801b698:	50e0      	str	r0, [r4, r3]
 801b69a:	2323      	movs	r3, #35	@ 0x23
 801b69c:	e780      	b.n	801b5a0 <fn_0801B298+0x308>
 801b69e:	3247      	adds	r2, #71	@ 0x47
 801b6a0:	607a      	str	r2, [r7, #4]
 801b6a2:	e63f      	b.n	801b324 <fn_0801B298+0x8c>
 801b6a4:	2200      	movs	r2, #0
 801b6a6:	4690      	mov	r8, r2
 801b6a8:	e693      	b.n	801b3d2 <fn_0801B298+0x13a>
 801b6aa:	219c      	movs	r1, #156	@ 0x9c
 801b6ac:	481c      	ldr	r0, [pc, #112]	@ (801b720 <fn_0801B298+0x488>)
 801b6ae:	0049      	lsls	r1, r1, #1
 801b6b0:	5861      	ldr	r1, [r4, r1]
 801b6b2:	5c20      	ldrb	r0, [r4, r0]
 801b6b4:	4288      	cmp	r0, r1
 801b6b6:	d000      	beq.n	801b6ba <fn_0801B298+0x422>
 801b6b8:	e6e5      	b.n	801b486 <fn_0801B298+0x1ee>
 801b6ba:	4642      	mov	r2, r8
 801b6bc:	2a00      	cmp	r2, #0
 801b6be:	d100      	bne.n	801b6c2 <fn_0801B298+0x42a>
 801b6c0:	e603      	b.n	801b2ca <fn_0801B298+0x32>
 801b6c2:	e6e4      	b.n	801b48e <fn_0801B298+0x1f6>
 801b6c4:	6868      	ldr	r0, [r5, #4]
 801b6c6:	e767      	b.n	801b598 <fn_0801B298+0x300>
 801b6c8:	2b07      	cmp	r3, #7
 801b6ca:	d000      	beq.n	801b6ce <fn_0801B298+0x436>
 801b6cc:	e744      	b.n	801b558 <fn_0801B298+0x2c0>
 801b6ce:	e637      	b.n	801b340 <fn_0801B298+0xa8>
 801b6d0:	2664      	movs	r6, #100	@ 0x64
 801b6d2:	e7a0      	b.n	801b616 <fn_0801B298+0x37e>
 801b6d4:	2664      	movs	r6, #100	@ 0x64
 801b6d6:	e61a      	b.n	801b30e <fn_0801B298+0x76>
 801b6d8:	6868      	ldr	r0, [r5, #4]
 801b6da:	e6ec      	b.n	801b4b6 <fn_0801B298+0x21e>
 801b6dc:	6868      	ldr	r0, [r5, #4]
 801b6de:	e7d9      	b.n	801b694 <fn_0801B298+0x3fc>
 801b6e0:	6868      	ldr	r0, [r5, #4]
 801b6e2:	e7a5      	b.n	801b630 <fn_0801B298+0x398>
 801b6e4:	2380      	movs	r3, #128	@ 0x80
 801b6e6:	2200      	movs	r2, #0
 801b6e8:	1a38      	subs	r0, r7, r0
 801b6ea:	061b      	lsls	r3, r3, #24
 801b6ec:	4283      	cmp	r3, r0
 801b6ee:	4152      	adcs	r2, r2
 801b6f0:	4680      	mov	r8, r0
 801b6f2:	4691      	mov	r9, r2
 801b6f4:	e704      	b.n	801b500 <fn_0801B298+0x268>
 801b6f6:	464b      	mov	r3, r9
 801b6f8:	2b00      	cmp	r3, #0
 801b6fa:	d006      	beq.n	801b70a <fn_0801B298+0x472>
 801b6fc:	4b06      	ldr	r3, [pc, #24]	@ (801b718 <fn_0801B298+0x480>)
 801b6fe:	3003      	adds	r0, #3
 801b700:	50e0      	str	r0, [r4, r3]
 801b702:	682b      	ldr	r3, [r5, #0]
 801b704:	e720      	b.n	801b548 <fn_0801B298+0x2b0>
 801b706:	6868      	ldr	r0, [r5, #4]
 801b708:	e716      	b.n	801b538 <fn_0801B298+0x2a0>
 801b70a:	4b03      	ldr	r3, [pc, #12]	@ (801b718 <fn_0801B298+0x480>)
 801b70c:	3004      	adds	r0, #4
 801b70e:	50e0      	str	r0, [r4, r3]
 801b710:	682b      	ldr	r3, [r5, #0]
 801b712:	e719      	b.n	801b548 <fn_0801B298+0x2b0>
 801b714:	03006bac 	.word	0x03006bac
 801b718:	00005a14 	.word	0x00005a14
 801b71c:	00005a10 	.word	0x00005a10
 801b720:	00005a04 	.word	0x00005a04
