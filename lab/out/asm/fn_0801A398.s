fn_0801A398:
 801a398:	b5f0      	push	{r4, r5, r6, r7, lr}
 801a39a:	4645      	mov	r5, r8
 801a39c:	4657      	mov	r7, sl
 801a39e:	464e      	mov	r6, r9
 801a3a0:	46de      	mov	lr, fp
 801a3a2:	b5e0      	push	{r5, r6, r7, lr}
 801a3a4:	6803      	ldr	r3, [r0, #0]
 801a3a6:	b091      	sub	sp, #68	@ 0x44
 801a3a8:	4fc3      	ldr	r7, [pc, #780]	@ (801a6b8 <fn_0801A398+0x320>)
 801a3aa:	930e      	str	r3, [sp, #56]	@ 0x38
 801a3ac:	6843      	ldr	r3, [r0, #4]
 801a3ae:	683a      	ldr	r2, [r7, #0]
 801a3b0:	930f      	str	r3, [sp, #60]	@ 0x3c
 801a3b2:	4bc2      	ldr	r3, [pc, #776]	@ (801a6bc <fn_0801A398+0x324>)
 801a3b4:	58d6      	ldr	r6, [r2, r3]
 801a3b6:	2380      	movs	r3, #128	@ 0x80
 801a3b8:	930a      	str	r3, [sp, #40]	@ 0x28
 801a3ba:	4bc1      	ldr	r3, [pc, #772]	@ (801a6c0 <fn_0801A398+0x328>)
 801a3bc:	781b      	ldrb	r3, [r3, #0]
 801a3be:	ad0b      	add	r5, sp, #44	@ 0x2c
 801a3c0:	000c      	movs	r4, r1
 801a3c2:	9609      	str	r6, [sp, #36]	@ 0x24
 801a3c4:	2b00      	cmp	r3, #0
 801a3c6:	d000      	beq.n	801a3ca <fn_0801A398+0x32>
 801a3c8:	e103      	b.n	801a5d2 <fn_0801A398+0x23a>
 801a3ca:	2380      	movs	r3, #128	@ 0x80
 801a3cc:	000a      	movs	r2, r1
 801a3ce:	021b      	lsls	r3, r3, #8
 801a3d0:	401a      	ands	r2, r3
 801a3d2:	4690      	mov	r8, r2
 801a3d4:	4219      	tst	r1, r3
 801a3d6:	d100      	bne.n	801a3da <fn_0801A398+0x42>
 801a3d8:	e104      	b.n	801a5e4 <fn_0801A398+0x24c>
 801a3da:	2301      	movs	r3, #1
 801a3dc:	469b      	mov	fp, r3
 801a3de:	4698      	mov	r8, r3
 801a3e0:	4bb8      	ldr	r3, [pc, #736]	@ (801a6c4 <fn_0801A398+0x32c>)
 801a3e2:	401c      	ands	r4, r3
 801a3e4:	1e63      	subs	r3, r4, #1
 801a3e6:	2b6c      	cmp	r3, #108	@ 0x6c
 801a3e8:	d903      	bls.n	801a3f2 <fn_0801A398+0x5a>
 801a3ea:	0021      	movs	r1, r4
 801a3ec:	48b6      	ldr	r0, [pc, #728]	@ (801a6c8 <fn_0801A398+0x330>)
 801a3ee:	f7e6 f8db 	bl	80005a8 <fn_080005A8>
 801a3f2:	00a3      	lsls	r3, r4, #2
 801a3f4:	4ab5      	ldr	r2, [pc, #724]	@ (801a6cc <fn_0801A398+0x334>)
 801a3f6:	469a      	mov	sl, r3
 801a3f8:	191b      	adds	r3, r3, r4
 801a3fa:	009b      	lsls	r3, r3, #2
 801a3fc:	18d3      	adds	r3, r2, r3
 801a3fe:	4691      	mov	r9, r2
 801a400:	68da      	ldr	r2, [r3, #12]
 801a402:	2a00      	cmp	r2, #0
 801a404:	d100      	bne.n	801a408 <fn_0801A398+0x70>
 801a406:	e1ab      	b.n	801a760 <fn_0801A398+0x3c8>
 801a408:	691b      	ldr	r3, [r3, #16]
 801a40a:	18f6      	adds	r6, r6, r3
 801a40c:	9609      	str	r6, [sp, #36]	@ 0x24
 801a40e:	2e00      	cmp	r6, #0
 801a410:	dc00      	bgt.n	801a414 <fn_0801A398+0x7c>
 801a412:	e0de      	b.n	801a5d2 <fn_0801A398+0x23a>
 801a414:	683b      	ldr	r3, [r7, #0]
 801a416:	4aa9      	ldr	r2, [pc, #676]	@ (801a6bc <fn_0801A398+0x324>)
 801a418:	589a      	ldr	r2, [r3, r2]
 801a41a:	4296      	cmp	r6, r2
 801a41c:	dd00      	ble.n	801a420 <fn_0801A398+0x88>
 801a41e:	e0ec      	b.n	801a5fa <fn_0801A398+0x262>
 801a420:	22e0      	movs	r2, #224	@ 0xe0
 801a422:	5898      	ldr	r0, [r3, r2]
 801a424:	42a8      	cmp	r0, r5
 801a426:	d100      	bne.n	801a42a <fn_0801A398+0x92>
 801a428:	e0ee      	b.n	801a608 <fn_0801A398+0x270>
 801a42a:	2800      	cmp	r0, #0
 801a42c:	d100      	bne.n	801a430 <fn_0801A398+0x98>
 801a42e:	e0d0      	b.n	801a5d2 <fn_0801A398+0x23a>
 801a430:	ab0a      	add	r3, sp, #40	@ 0x28
 801a432:	9300      	str	r3, [sp, #0]
 801a434:	9a0f      	ldr	r2, [sp, #60]	@ 0x3c
 801a436:	990e      	ldr	r1, [sp, #56]	@ 0x38
 801a438:	ab09      	add	r3, sp, #36	@ 0x24
 801a43a:	f7ff fc33 	bl	8019ca4 <fn_08019CA4>
 801a43e:	2800      	cmp	r0, #0
 801a440:	d100      	bne.n	801a444 <fn_0801A398+0xac>
 801a442:	e0c6      	b.n	801a5d2 <fn_0801A398+0x23a>
 801a444:	683b      	ldr	r3, [r7, #0]
 801a446:	4aa2      	ldr	r2, [pc, #648]	@ (801a6d0 <fn_0801A398+0x338>)
 801a448:	589a      	ldr	r2, [r3, r2]
 801a44a:	2a00      	cmp	r2, #0
 801a44c:	d004      	beq.n	801a458 <fn_0801A398+0xc0>
 801a44e:	4aa1      	ldr	r2, [pc, #644]	@ (801a6d4 <fn_0801A398+0x33c>)
 801a450:	589a      	ldr	r2, [r3, r2]
 801a452:	42aa      	cmp	r2, r5
 801a454:	d100      	bne.n	801a458 <fn_0801A398+0xc0>
 801a456:	e0e7      	b.n	801a628 <fn_0801A398+0x290>
 801a458:	4a9f      	ldr	r2, [pc, #636]	@ (801a6d8 <fn_0801A398+0x340>)
 801a45a:	589a      	ldr	r2, [r3, r2]
 801a45c:	2a00      	cmp	r2, #0
 801a45e:	d004      	beq.n	801a46a <fn_0801A398+0xd2>
 801a460:	4a9e      	ldr	r2, [pc, #632]	@ (801a6dc <fn_0801A398+0x344>)
 801a462:	589a      	ldr	r2, [r3, r2]
 801a464:	42aa      	cmp	r2, r5
 801a466:	d100      	bne.n	801a46a <fn_0801A398+0xd2>
 801a468:	e0e5      	b.n	801a636 <fn_0801A398+0x29e>
 801a46a:	4a9d      	ldr	r2, [pc, #628]	@ (801a6e0 <fn_0801A398+0x348>)
 801a46c:	589a      	ldr	r2, [r3, r2]
 801a46e:	2a00      	cmp	r2, #0
 801a470:	d004      	beq.n	801a47c <fn_0801A398+0xe4>
 801a472:	4a9c      	ldr	r2, [pc, #624]	@ (801a6e4 <fn_0801A398+0x34c>)
 801a474:	589a      	ldr	r2, [r3, r2]
 801a476:	42aa      	cmp	r2, r5
 801a478:	d100      	bne.n	801a47c <fn_0801A398+0xe4>
 801a47a:	e10f      	b.n	801a69c <fn_0801A398+0x304>
 801a47c:	4a9a      	ldr	r2, [pc, #616]	@ (801a6e8 <fn_0801A398+0x350>)
 801a47e:	589a      	ldr	r2, [r3, r2]
 801a480:	2a00      	cmp	r2, #0
 801a482:	d004      	beq.n	801a48e <fn_0801A398+0xf6>
 801a484:	4a99      	ldr	r2, [pc, #612]	@ (801a6ec <fn_0801A398+0x354>)
 801a486:	589a      	ldr	r2, [r3, r2]
 801a488:	42aa      	cmp	r2, r5
 801a48a:	d100      	bne.n	801a48e <fn_0801A398+0xf6>
 801a48c:	e10d      	b.n	801a6aa <fn_0801A398+0x312>
 801a48e:	22ac      	movs	r2, #172	@ 0xac
 801a490:	01d2      	lsls	r2, r2, #7
 801a492:	589a      	ldr	r2, [r3, r2]
 801a494:	2a00      	cmp	r2, #0
 801a496:	d004      	beq.n	801a4a2 <fn_0801A398+0x10a>
 801a498:	4a95      	ldr	r2, [pc, #596]	@ (801a6f0 <fn_0801A398+0x358>)
 801a49a:	589a      	ldr	r2, [r3, r2]
 801a49c:	42aa      	cmp	r2, r5
 801a49e:	d100      	bne.n	801a4a2 <fn_0801A398+0x10a>
 801a4a0:	e142      	b.n	801a728 <fn_0801A398+0x390>
 801a4a2:	4a94      	ldr	r2, [pc, #592]	@ (801a6f4 <fn_0801A398+0x35c>)
 801a4a4:	589a      	ldr	r2, [r3, r2]
 801a4a6:	2a00      	cmp	r2, #0
 801a4a8:	d004      	beq.n	801a4b4 <fn_0801A398+0x11c>
 801a4aa:	4a93      	ldr	r2, [pc, #588]	@ (801a6f8 <fn_0801A398+0x360>)
 801a4ac:	589a      	ldr	r2, [r3, r2]
 801a4ae:	42aa      	cmp	r2, r5
 801a4b0:	d100      	bne.n	801a4b4 <fn_0801A398+0x11c>
 801a4b2:	e140      	b.n	801a736 <fn_0801A398+0x39e>
 801a4b4:	4a91      	ldr	r2, [pc, #580]	@ (801a6fc <fn_0801A398+0x364>)
 801a4b6:	589a      	ldr	r2, [r3, r2]
 801a4b8:	2a00      	cmp	r2, #0
 801a4ba:	d004      	beq.n	801a4c6 <fn_0801A398+0x12e>
 801a4bc:	4a90      	ldr	r2, [pc, #576]	@ (801a700 <fn_0801A398+0x368>)
 801a4be:	589a      	ldr	r2, [r3, r2]
 801a4c0:	42aa      	cmp	r2, r5
 801a4c2:	d100      	bne.n	801a4c6 <fn_0801A398+0x12e>
 801a4c4:	e13e      	b.n	801a744 <fn_0801A398+0x3ac>
 801a4c6:	4a8f      	ldr	r2, [pc, #572]	@ (801a704 <fn_0801A398+0x36c>)
 801a4c8:	589a      	ldr	r2, [r3, r2]
 801a4ca:	2a00      	cmp	r2, #0
 801a4cc:	d004      	beq.n	801a4d8 <fn_0801A398+0x140>
 801a4ce:	4a8e      	ldr	r2, [pc, #568]	@ (801a708 <fn_0801A398+0x370>)
 801a4d0:	589a      	ldr	r2, [r3, r2]
 801a4d2:	42aa      	cmp	r2, r5
 801a4d4:	d100      	bne.n	801a4d8 <fn_0801A398+0x140>
 801a4d6:	e13c      	b.n	801a752 <fn_0801A398+0x3ba>
 801a4d8:	4a7d      	ldr	r2, [pc, #500]	@ (801a6d0 <fn_0801A398+0x338>)
 801a4da:	589a      	ldr	r2, [r3, r2]
 801a4dc:	2a00      	cmp	r2, #0
 801a4de:	d100      	bne.n	801a4e2 <fn_0801A398+0x14a>
 801a4e0:	e166      	b.n	801a7b0 <fn_0801A398+0x418>
 801a4e2:	497c      	ldr	r1, [pc, #496]	@ (801a6d4 <fn_0801A398+0x33c>)
 801a4e4:	5859      	ldr	r1, [r3, r1]
 801a4e6:	42a9      	cmp	r1, r5
 801a4e8:	d100      	bne.n	801a4ec <fn_0801A398+0x154>
 801a4ea:	e13b      	b.n	801a764 <fn_0801A398+0x3cc>
 801a4ec:	497a      	ldr	r1, [pc, #488]	@ (801a6d8 <fn_0801A398+0x340>)
 801a4ee:	5859      	ldr	r1, [r3, r1]
 801a4f0:	2900      	cmp	r1, #0
 801a4f2:	d100      	bne.n	801a4f6 <fn_0801A398+0x15e>
 801a4f4:	e15e      	b.n	801a7b4 <fn_0801A398+0x41c>
 801a4f6:	4879      	ldr	r0, [pc, #484]	@ (801a6dc <fn_0801A398+0x344>)
 801a4f8:	5818      	ldr	r0, [r3, r0]
 801a4fa:	42a8      	cmp	r0, r5
 801a4fc:	d100      	bne.n	801a500 <fn_0801A398+0x168>
 801a4fe:	e138      	b.n	801a772 <fn_0801A398+0x3da>
 801a500:	4877      	ldr	r0, [pc, #476]	@ (801a6e0 <fn_0801A398+0x348>)
 801a502:	5818      	ldr	r0, [r3, r0]
 801a504:	2800      	cmp	r0, #0
 801a506:	d100      	bne.n	801a50a <fn_0801A398+0x172>
 801a508:	e157      	b.n	801a7ba <fn_0801A398+0x422>
 801a50a:	4e76      	ldr	r6, [pc, #472]	@ (801a6e4 <fn_0801A398+0x34c>)
 801a50c:	599e      	ldr	r6, [r3, r6]
 801a50e:	42ae      	cmp	r6, r5
 801a510:	d100      	bne.n	801a514 <fn_0801A398+0x17c>
 801a512:	e135      	b.n	801a780 <fn_0801A398+0x3e8>
 801a514:	4e74      	ldr	r6, [pc, #464]	@ (801a6e8 <fn_0801A398+0x350>)
 801a516:	599e      	ldr	r6, [r3, r6]
 801a518:	9603      	str	r6, [sp, #12]
 801a51a:	2e00      	cmp	r6, #0
 801a51c:	d100      	bne.n	801a520 <fn_0801A398+0x188>
 801a51e:	e14f      	b.n	801a7c0 <fn_0801A398+0x428>
 801a520:	4e72      	ldr	r6, [pc, #456]	@ (801a6ec <fn_0801A398+0x354>)
 801a522:	599e      	ldr	r6, [r3, r6]
 801a524:	42ae      	cmp	r6, r5
 801a526:	d100      	bne.n	801a52a <fn_0801A398+0x192>
 801a528:	e132      	b.n	801a790 <fn_0801A398+0x3f8>
 801a52a:	26ac      	movs	r6, #172	@ 0xac
 801a52c:	01f6      	lsls	r6, r6, #7
 801a52e:	599e      	ldr	r6, [r3, r6]
 801a530:	9604      	str	r6, [sp, #16]
 801a532:	2e00      	cmp	r6, #0
 801a534:	d100      	bne.n	801a538 <fn_0801A398+0x1a0>
 801a536:	e146      	b.n	801a7c6 <fn_0801A398+0x42e>
 801a538:	4e6d      	ldr	r6, [pc, #436]	@ (801a6f0 <fn_0801A398+0x358>)
 801a53a:	599e      	ldr	r6, [r3, r6]
 801a53c:	42ae      	cmp	r6, r5
 801a53e:	d100      	bne.n	801a542 <fn_0801A398+0x1aa>
 801a540:	e12e      	b.n	801a7a0 <fn_0801A398+0x408>
 801a542:	4e6c      	ldr	r6, [pc, #432]	@ (801a6f4 <fn_0801A398+0x35c>)
 801a544:	599e      	ldr	r6, [r3, r6]
 801a546:	9605      	str	r6, [sp, #20]
 801a548:	2e00      	cmp	r6, #0
 801a54a:	d100      	bne.n	801a54e <fn_0801A398+0x1b6>
 801a54c:	e13e      	b.n	801a7cc <fn_0801A398+0x434>
 801a54e:	4e6a      	ldr	r6, [pc, #424]	@ (801a6f8 <fn_0801A398+0x360>)
 801a550:	599e      	ldr	r6, [r3, r6]
 801a552:	42ae      	cmp	r6, r5
 801a554:	d05b      	beq.n	801a60e <fn_0801A398+0x276>
 801a556:	4e69      	ldr	r6, [pc, #420]	@ (801a6fc <fn_0801A398+0x364>)
 801a558:	599e      	ldr	r6, [r3, r6]
 801a55a:	9606      	str	r6, [sp, #24]
 801a55c:	2e00      	cmp	r6, #0
 801a55e:	d100      	bne.n	801a562 <fn_0801A398+0x1ca>
 801a560:	e137      	b.n	801a7d2 <fn_0801A398+0x43a>
 801a562:	4f67      	ldr	r7, [pc, #412]	@ (801a700 <fn_0801A398+0x368>)
 801a564:	59df      	ldr	r7, [r3, r7]
 801a566:	42af      	cmp	r7, r5
 801a568:	d058      	beq.n	801a61c <fn_0801A398+0x284>
 801a56a:	4f66      	ldr	r7, [pc, #408]	@ (801a704 <fn_0801A398+0x36c>)
 801a56c:	59de      	ldr	r6, [r3, r7]
 801a56e:	9607      	str	r6, [sp, #28]
 801a570:	2e00      	cmp	r6, #0
 801a572:	d100      	bne.n	801a576 <fn_0801A398+0x1de>
 801a574:	e130      	b.n	801a7d8 <fn_0801A398+0x440>
 801a576:	4e64      	ldr	r6, [pc, #400]	@ (801a708 <fn_0801A398+0x370>)
 801a578:	599e      	ldr	r6, [r3, r6]
 801a57a:	42ae      	cmp	r6, r5
 801a57c:	d06a      	beq.n	801a654 <fn_0801A398+0x2bc>
 801a57e:	46d4      	mov	ip, sl
 801a580:	44a4      	add	ip, r4
 801a582:	4666      	mov	r6, ip
 801a584:	00b6      	lsls	r6, r6, #2
 801a586:	46b4      	mov	ip, r6
 801a588:	44cc      	add	ip, r9
 801a58a:	4666      	mov	r6, ip
 801a58c:	6892      	ldr	r2, [r2, #8]
 801a58e:	68b6      	ldr	r6, [r6, #8]
 801a590:	42b2      	cmp	r2, r6
 801a592:	db00      	blt.n	801a596 <fn_0801A398+0x1fe>
 801a594:	e0eb      	b.n	801a76e <fn_0801A398+0x3d6>
 801a596:	688a      	ldr	r2, [r1, #8]
 801a598:	4296      	cmp	r6, r2
 801a59a:	dc00      	bgt.n	801a59e <fn_0801A398+0x206>
 801a59c:	e0ee      	b.n	801a77c <fn_0801A398+0x3e4>
 801a59e:	6882      	ldr	r2, [r0, #8]
 801a5a0:	4296      	cmp	r6, r2
 801a5a2:	dc00      	bgt.n	801a5a6 <fn_0801A398+0x20e>
 801a5a4:	e0f2      	b.n	801a78c <fn_0801A398+0x3f4>
 801a5a6:	9a03      	ldr	r2, [sp, #12]
 801a5a8:	6892      	ldr	r2, [r2, #8]
 801a5aa:	4296      	cmp	r6, r2
 801a5ac:	dc00      	bgt.n	801a5b0 <fn_0801A398+0x218>
 801a5ae:	e0f5      	b.n	801a79c <fn_0801A398+0x404>
 801a5b0:	9a04      	ldr	r2, [sp, #16]
 801a5b2:	6892      	ldr	r2, [r2, #8]
 801a5b4:	4296      	cmp	r6, r2
 801a5b6:	dc00      	bgt.n	801a5ba <fn_0801A398+0x222>
 801a5b8:	e0f8      	b.n	801a7ac <fn_0801A398+0x414>
 801a5ba:	9a05      	ldr	r2, [sp, #20]
 801a5bc:	6892      	ldr	r2, [r2, #8]
 801a5be:	4296      	cmp	r6, r2
 801a5c0:	dd2a      	ble.n	801a618 <fn_0801A398+0x280>
 801a5c2:	9a06      	ldr	r2, [sp, #24]
 801a5c4:	6892      	ldr	r2, [r2, #8]
 801a5c6:	4296      	cmp	r6, r2
 801a5c8:	dd2c      	ble.n	801a624 <fn_0801A398+0x28c>
 801a5ca:	9a07      	ldr	r2, [sp, #28]
 801a5cc:	6892      	ldr	r2, [r2, #8]
 801a5ce:	42b2      	cmp	r2, r6
 801a5d0:	da45      	bge.n	801a65e <fn_0801A398+0x2c6>
 801a5d2:	b011      	add	sp, #68	@ 0x44
 801a5d4:	bcf0      	pop	{r4, r5, r6, r7}
 801a5d6:	46bb      	mov	fp, r7
 801a5d8:	46b2      	mov	sl, r6
 801a5da:	46a9      	mov	r9, r5
 801a5dc:	46a0      	mov	r8, r4
 801a5de:	bcf0      	pop	{r4, r5, r6, r7}
 801a5e0:	bc01      	pop	{r0}
 801a5e2:	4700      	bx	r0
 801a5e4:	2922      	cmp	r1, #34	@ 0x22
 801a5e6:	d004      	beq.n	801a5f2 <fn_0801A398+0x25a>
 801a5e8:	2300      	movs	r3, #0
 801a5ea:	469b      	mov	fp, r3
 801a5ec:	2951      	cmp	r1, #81	@ 0x51
 801a5ee:	d000      	beq.n	801a5f2 <fn_0801A398+0x25a>
 801a5f0:	e6f6      	b.n	801a3e0 <fn_0801A398+0x48>
 801a5f2:	2301      	movs	r3, #1
 801a5f4:	469b      	mov	fp, r3
 801a5f6:	4698      	mov	r8, r3
 801a5f8:	e6fb      	b.n	801a3f2 <fn_0801A398+0x5a>
 801a5fa:	0016      	movs	r6, r2
 801a5fc:	9209      	str	r2, [sp, #36]	@ 0x24
 801a5fe:	22e0      	movs	r2, #224	@ 0xe0
 801a600:	5898      	ldr	r0, [r3, r2]
 801a602:	42a8      	cmp	r0, r5
 801a604:	d000      	beq.n	801a608 <fn_0801A398+0x270>
 801a606:	e710      	b.n	801a42a <fn_0801A398+0x92>
 801a608:	00f6      	lsls	r6, r6, #3
 801a60a:	9609      	str	r6, [sp, #36]	@ 0x24
 801a60c:	e71b      	b.n	801a446 <fn_0801A398+0xae>
 801a60e:	4e3f      	ldr	r6, [pc, #252]	@ (801a70c <fn_0801A398+0x374>)
 801a610:	5f9e      	ldrsh	r6, [r3, r6]
 801a612:	4647      	mov	r7, r8
 801a614:	42b7      	cmp	r7, r6
 801a616:	d19e      	bne.n	801a556 <fn_0801A398+0x1be>
 801a618:	2105      	movs	r1, #5
 801a61a:	e021      	b.n	801a660 <fn_0801A398+0x2c8>
 801a61c:	4f3c      	ldr	r7, [pc, #240]	@ (801a710 <fn_0801A398+0x378>)
 801a61e:	5fdf      	ldrsh	r7, [r3, r7]
 801a620:	45b8      	cmp	r8, r7
 801a622:	d1a2      	bne.n	801a56a <fn_0801A398+0x1d2>
 801a624:	2106      	movs	r1, #6
 801a626:	e01b      	b.n	801a660 <fn_0801A398+0x2c8>
 801a628:	4a3a      	ldr	r2, [pc, #232]	@ (801a714 <fn_0801A398+0x37c>)
 801a62a:	5e9a      	ldrsh	r2, [r3, r2]
 801a62c:	4590      	cmp	r8, r2
 801a62e:	d000      	beq.n	801a632 <fn_0801A398+0x29a>
 801a630:	e712      	b.n	801a458 <fn_0801A398+0xc0>
 801a632:	2100      	movs	r1, #0
 801a634:	e005      	b.n	801a642 <fn_0801A398+0x2aa>
 801a636:	4a38      	ldr	r2, [pc, #224]	@ (801a718 <fn_0801A398+0x380>)
 801a638:	5e9a      	ldrsh	r2, [r3, r2]
 801a63a:	4590      	cmp	r8, r2
 801a63c:	d000      	beq.n	801a640 <fn_0801A398+0x2a8>
 801a63e:	e714      	b.n	801a46a <fn_0801A398+0xd2>
 801a640:	2101      	movs	r1, #1
 801a642:	004a      	lsls	r2, r1, #1
 801a644:	1852      	adds	r2, r2, r1
 801a646:	0092      	lsls	r2, r2, #2
 801a648:	4921      	ldr	r1, [pc, #132]	@ (801a6d0 <fn_0801A398+0x338>)
 801a64a:	189a      	adds	r2, r3, r2
 801a64c:	1852      	adds	r2, r2, r1
 801a64e:	2100      	movs	r1, #0
 801a650:	6011      	str	r1, [r2, #0]
 801a652:	e741      	b.n	801a4d8 <fn_0801A398+0x140>
 801a654:	4e31      	ldr	r6, [pc, #196]	@ (801a71c <fn_0801A398+0x384>)
 801a656:	5f9e      	ldrsh	r6, [r3, r6]
 801a658:	4546      	cmp	r6, r8
 801a65a:	d000      	beq.n	801a65e <fn_0801A398+0x2c6>
 801a65c:	e78f      	b.n	801a57e <fn_0801A398+0x1e6>
 801a65e:	2107      	movs	r1, #7
 801a660:	004a      	lsls	r2, r1, #1
 801a662:	1850      	adds	r0, r2, r1
 801a664:	4e1a      	ldr	r6, [pc, #104]	@ (801a6d0 <fn_0801A398+0x338>)
 801a666:	0080      	lsls	r0, r0, #2
 801a668:	1818      	adds	r0, r3, r0
 801a66a:	1980      	adds	r0, r0, r6
 801a66c:	2600      	movs	r6, #0
 801a66e:	6006      	str	r6, [r0, #0]
 801a670:	1852      	adds	r2, r2, r1
 801a672:	0092      	lsls	r2, r2, #2
 801a674:	189b      	adds	r3, r3, r2
 801a676:	4a16      	ldr	r2, [pc, #88]	@ (801a6d0 <fn_0801A398+0x338>)
 801a678:	1898      	adds	r0, r3, r2
 801a67a:	4652      	mov	r2, sl
 801a67c:	1912      	adds	r2, r2, r4
 801a67e:	0092      	lsls	r2, r2, #2
 801a680:	444a      	add	r2, r9
 801a682:	6002      	str	r2, [r0, #0]
 801a684:	4a13      	ldr	r2, [pc, #76]	@ (801a6d4 <fn_0801A398+0x33c>)
 801a686:	509d      	str	r5, [r3, r2]
 801a688:	4a22      	ldr	r2, [pc, #136]	@ (801a714 <fn_0801A398+0x37c>)
 801a68a:	189b      	adds	r3, r3, r2
 801a68c:	465a      	mov	r2, fp
 801a68e:	0020      	movs	r0, r4
 801a690:	801a      	strh	r2, [r3, #0]
 801a692:	9b0a      	ldr	r3, [sp, #40]	@ 0x28
 801a694:	9a09      	ldr	r2, [sp, #36]	@ 0x24
 801a696:	f7ea fb59 	bl	8004d4c <fn_08004D4C>
 801a69a:	e79a      	b.n	801a5d2 <fn_0801A398+0x23a>
 801a69c:	4a20      	ldr	r2, [pc, #128]	@ (801a720 <fn_0801A398+0x388>)
 801a69e:	5e9a      	ldrsh	r2, [r3, r2]
 801a6a0:	4590      	cmp	r8, r2
 801a6a2:	d000      	beq.n	801a6a6 <fn_0801A398+0x30e>
 801a6a4:	e6ea      	b.n	801a47c <fn_0801A398+0xe4>
 801a6a6:	2102      	movs	r1, #2
 801a6a8:	e7cb      	b.n	801a642 <fn_0801A398+0x2aa>
 801a6aa:	4a1e      	ldr	r2, [pc, #120]	@ (801a724 <fn_0801A398+0x38c>)
 801a6ac:	5e9a      	ldrsh	r2, [r3, r2]
 801a6ae:	4590      	cmp	r8, r2
 801a6b0:	d000      	beq.n	801a6b4 <fn_0801A398+0x31c>
 801a6b2:	e6ec      	b.n	801a48e <fn_0801A398+0xf6>
 801a6b4:	2103      	movs	r1, #3
 801a6b6:	e7c4      	b.n	801a642 <fn_0801A398+0x2aa>
 801a6b8:	030064c4 	.word	0x030064c4
 801a6bc:	00005630 	.word	0x00005630
 801a6c0:	080258a6 	.word	0x080258a6
 801a6c4:	ffff7fff 	.word	0xffff7fff
 801a6c8:	0814a8e8 	.word	0x0814a8e8
 801a6cc:	0812f828 	.word	0x0812f828
 801a6d0:	000055d0 	.word	0x000055d0
 801a6d4:	000055d4 	.word	0x000055d4
 801a6d8:	000055dc 	.word	0x000055dc
 801a6dc:	000055e0 	.word	0x000055e0
 801a6e0:	000055e8 	.word	0x000055e8
 801a6e4:	000055ec 	.word	0x000055ec
 801a6e8:	000055f4 	.word	0x000055f4
 801a6ec:	000055f8 	.word	0x000055f8
 801a6f0:	00005604 	.word	0x00005604
 801a6f4:	0000560c 	.word	0x0000560c
 801a6f8:	00005610 	.word	0x00005610
 801a6fc:	00005618 	.word	0x00005618
 801a700:	0000561c 	.word	0x0000561c
 801a704:	00005624 	.word	0x00005624
 801a708:	00005628 	.word	0x00005628
 801a70c:	00005614 	.word	0x00005614
 801a710:	00005620 	.word	0x00005620
 801a714:	000055d8 	.word	0x000055d8
 801a718:	000055e4 	.word	0x000055e4
 801a71c:	0000562c 	.word	0x0000562c
 801a720:	000055f0 	.word	0x000055f0
 801a724:	000055fc 	.word	0x000055fc
 801a728:	4a2d      	ldr	r2, [pc, #180]	@ (801a7e0 <fn_0801A398+0x448>)
 801a72a:	5e9a      	ldrsh	r2, [r3, r2]
 801a72c:	4590      	cmp	r8, r2
 801a72e:	d000      	beq.n	801a732 <fn_0801A398+0x39a>
 801a730:	e6b7      	b.n	801a4a2 <fn_0801A398+0x10a>
 801a732:	2104      	movs	r1, #4
 801a734:	e785      	b.n	801a642 <fn_0801A398+0x2aa>
 801a736:	4a2b      	ldr	r2, [pc, #172]	@ (801a7e4 <fn_0801A398+0x44c>)
 801a738:	5e9a      	ldrsh	r2, [r3, r2]
 801a73a:	4590      	cmp	r8, r2
 801a73c:	d000      	beq.n	801a740 <fn_0801A398+0x3a8>
 801a73e:	e6b9      	b.n	801a4b4 <fn_0801A398+0x11c>
 801a740:	2105      	movs	r1, #5
 801a742:	e77e      	b.n	801a642 <fn_0801A398+0x2aa>
 801a744:	4a28      	ldr	r2, [pc, #160]	@ (801a7e8 <fn_0801A398+0x450>)
 801a746:	5e9a      	ldrsh	r2, [r3, r2]
 801a748:	4590      	cmp	r8, r2
 801a74a:	d000      	beq.n	801a74e <fn_0801A398+0x3b6>
 801a74c:	e6bb      	b.n	801a4c6 <fn_0801A398+0x12e>
 801a74e:	2106      	movs	r1, #6
 801a750:	e777      	b.n	801a642 <fn_0801A398+0x2aa>
 801a752:	4a26      	ldr	r2, [pc, #152]	@ (801a7ec <fn_0801A398+0x454>)
 801a754:	5e9a      	ldrsh	r2, [r3, r2]
 801a756:	2107      	movs	r1, #7
 801a758:	4542      	cmp	r2, r8
 801a75a:	d000      	beq.n	801a75e <fn_0801A398+0x3c6>
 801a75c:	e6bc      	b.n	801a4d8 <fn_0801A398+0x140>
 801a75e:	e770      	b.n	801a642 <fn_0801A398+0x2aa>
 801a760:	683b      	ldr	r3, [r7, #0]
 801a762:	e65d      	b.n	801a420 <fn_0801A398+0x88>
 801a764:	4922      	ldr	r1, [pc, #136]	@ (801a7f0 <fn_0801A398+0x458>)
 801a766:	5e59      	ldrsh	r1, [r3, r1]
 801a768:	4588      	cmp	r8, r1
 801a76a:	d000      	beq.n	801a76e <fn_0801A398+0x3d6>
 801a76c:	e6be      	b.n	801a4ec <fn_0801A398+0x154>
 801a76e:	2100      	movs	r1, #0
 801a770:	e776      	b.n	801a660 <fn_0801A398+0x2c8>
 801a772:	4820      	ldr	r0, [pc, #128]	@ (801a7f4 <fn_0801A398+0x45c>)
 801a774:	5e18      	ldrsh	r0, [r3, r0]
 801a776:	4580      	cmp	r8, r0
 801a778:	d000      	beq.n	801a77c <fn_0801A398+0x3e4>
 801a77a:	e6c1      	b.n	801a500 <fn_0801A398+0x168>
 801a77c:	2101      	movs	r1, #1
 801a77e:	e76f      	b.n	801a660 <fn_0801A398+0x2c8>
 801a780:	4e1d      	ldr	r6, [pc, #116]	@ (801a7f8 <fn_0801A398+0x460>)
 801a782:	5f9e      	ldrsh	r6, [r3, r6]
 801a784:	4647      	mov	r7, r8
 801a786:	42b7      	cmp	r7, r6
 801a788:	d000      	beq.n	801a78c <fn_0801A398+0x3f4>
 801a78a:	e6c3      	b.n	801a514 <fn_0801A398+0x17c>
 801a78c:	2102      	movs	r1, #2
 801a78e:	e767      	b.n	801a660 <fn_0801A398+0x2c8>
 801a790:	4e1a      	ldr	r6, [pc, #104]	@ (801a7fc <fn_0801A398+0x464>)
 801a792:	5f9e      	ldrsh	r6, [r3, r6]
 801a794:	4647      	mov	r7, r8
 801a796:	42b7      	cmp	r7, r6
 801a798:	d000      	beq.n	801a79c <fn_0801A398+0x404>
 801a79a:	e6c6      	b.n	801a52a <fn_0801A398+0x192>
 801a79c:	2103      	movs	r1, #3
 801a79e:	e75f      	b.n	801a660 <fn_0801A398+0x2c8>
 801a7a0:	4e0f      	ldr	r6, [pc, #60]	@ (801a7e0 <fn_0801A398+0x448>)
 801a7a2:	5f9e      	ldrsh	r6, [r3, r6]
 801a7a4:	4647      	mov	r7, r8
 801a7a6:	42b7      	cmp	r7, r6
 801a7a8:	d000      	beq.n	801a7ac <fn_0801A398+0x414>
 801a7aa:	e6ca      	b.n	801a542 <fn_0801A398+0x1aa>
 801a7ac:	2104      	movs	r1, #4
 801a7ae:	e757      	b.n	801a660 <fn_0801A398+0x2c8>
 801a7b0:	2100      	movs	r1, #0
 801a7b2:	e75d      	b.n	801a670 <fn_0801A398+0x2d8>
 801a7b4:	2101      	movs	r1, #1
 801a7b6:	2202      	movs	r2, #2
 801a7b8:	e75a      	b.n	801a670 <fn_0801A398+0x2d8>
 801a7ba:	2102      	movs	r1, #2
 801a7bc:	2204      	movs	r2, #4
 801a7be:	e757      	b.n	801a670 <fn_0801A398+0x2d8>
 801a7c0:	2103      	movs	r1, #3
 801a7c2:	2206      	movs	r2, #6
 801a7c4:	e754      	b.n	801a670 <fn_0801A398+0x2d8>
 801a7c6:	2104      	movs	r1, #4
 801a7c8:	2208      	movs	r2, #8
 801a7ca:	e751      	b.n	801a670 <fn_0801A398+0x2d8>
 801a7cc:	2105      	movs	r1, #5
 801a7ce:	220a      	movs	r2, #10
 801a7d0:	e74e      	b.n	801a670 <fn_0801A398+0x2d8>
 801a7d2:	2106      	movs	r1, #6
 801a7d4:	220c      	movs	r2, #12
 801a7d6:	e74b      	b.n	801a670 <fn_0801A398+0x2d8>
 801a7d8:	2107      	movs	r1, #7
 801a7da:	220e      	movs	r2, #14
 801a7dc:	e748      	b.n	801a670 <fn_0801A398+0x2d8>
 801a7de:	46c0      	nop			@ (mov r8, r8)
 801a7e0:	00005608 	.word	0x00005608
 801a7e4:	00005614 	.word	0x00005614
 801a7e8:	00005620 	.word	0x00005620
 801a7ec:	0000562c 	.word	0x0000562c
 801a7f0:	000055d8 	.word	0x000055d8
 801a7f4:	000055e4 	.word	0x000055e4
 801a7f8:	000055f0 	.word	0x000055f0
 801a7fc:	000055fc 	.word	0x000055fc
