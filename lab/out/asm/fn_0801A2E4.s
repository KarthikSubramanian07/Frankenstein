fn_0801A2E4:
 801a2e4:	b5f0      	push	{r4, r5, r6, r7, lr}
 801a2e6:	4645      	mov	r5, r8
 801a2e8:	4657      	mov	r7, sl
 801a2ea:	464e      	mov	r6, r9
 801a2ec:	46de      	mov	lr, fp
 801a2ee:	b5e0      	push	{r5, r6, r7, lr}
 801a2f0:	6803      	ldr	r3, [r0, #0]
 801a2f2:	b091      	sub	sp, #68	@ 0x44
 801a2f4:	4fc3      	ldr	r7, [pc, #780]	@ (801a604 <fn_0801A2E4+0x320>)
 801a2f6:	930e      	str	r3, [sp, #56]	@ 0x38
 801a2f8:	6843      	ldr	r3, [r0, #4]
 801a2fa:	683a      	ldr	r2, [r7, #0]
 801a2fc:	930f      	str	r3, [sp, #60]	@ 0x3c
 801a2fe:	4bc2      	ldr	r3, [pc, #776]	@ (801a608 <fn_0801A2E4+0x324>)
 801a300:	58d6      	ldr	r6, [r2, r3]
 801a302:	2380      	movs	r3, #128	@ 0x80
 801a304:	930a      	str	r3, [sp, #40]	@ 0x28
 801a306:	4bc1      	ldr	r3, [pc, #772]	@ (801a60c <fn_0801A2E4+0x328>)
 801a308:	781b      	ldrb	r3, [r3, #0]
 801a30a:	ad0b      	add	r5, sp, #44	@ 0x2c
 801a30c:	000c      	movs	r4, r1
 801a30e:	9609      	str	r6, [sp, #36]	@ 0x24
 801a310:	2b00      	cmp	r3, #0
 801a312:	d000      	beq.n	801a316 <fn_0801A2E4+0x32>
 801a314:	e103      	b.n	801a51e <fn_0801A2E4+0x23a>
 801a316:	2380      	movs	r3, #128	@ 0x80
 801a318:	000a      	movs	r2, r1
 801a31a:	021b      	lsls	r3, r3, #8
 801a31c:	401a      	ands	r2, r3
 801a31e:	4690      	mov	r8, r2
 801a320:	4219      	tst	r1, r3
 801a322:	d100      	bne.n	801a326 <fn_0801A2E4+0x42>
 801a324:	e104      	b.n	801a530 <fn_0801A2E4+0x24c>
 801a326:	2301      	movs	r3, #1
 801a328:	469b      	mov	fp, r3
 801a32a:	4698      	mov	r8, r3
 801a32c:	4bb8      	ldr	r3, [pc, #736]	@ (801a610 <fn_0801A2E4+0x32c>)
 801a32e:	401c      	ands	r4, r3
 801a330:	1e63      	subs	r3, r4, #1
 801a332:	2b6c      	cmp	r3, #108	@ 0x6c
 801a334:	d903      	bls.n	801a33e <fn_0801A2E4+0x5a>
 801a336:	0021      	movs	r1, r4
 801a338:	48b6      	ldr	r0, [pc, #728]	@ (801a614 <fn_0801A2E4+0x330>)
 801a33a:	f7e6 f935 	bl	80005a8 <fn_080005A8>
 801a33e:	00a3      	lsls	r3, r4, #2
 801a340:	4ab5      	ldr	r2, [pc, #724]	@ (801a618 <fn_0801A2E4+0x334>)
 801a342:	469a      	mov	sl, r3
 801a344:	191b      	adds	r3, r3, r4
 801a346:	009b      	lsls	r3, r3, #2
 801a348:	18d3      	adds	r3, r2, r3
 801a34a:	4691      	mov	r9, r2
 801a34c:	68da      	ldr	r2, [r3, #12]
 801a34e:	2a00      	cmp	r2, #0
 801a350:	d100      	bne.n	801a354 <fn_0801A2E4+0x70>
 801a352:	e1ab      	b.n	801a6ac <fn_0801A2E4+0x3c8>
 801a354:	691b      	ldr	r3, [r3, #16]
 801a356:	18f6      	adds	r6, r6, r3
 801a358:	9609      	str	r6, [sp, #36]	@ 0x24
 801a35a:	2e00      	cmp	r6, #0
 801a35c:	dc00      	bgt.n	801a360 <fn_0801A2E4+0x7c>
 801a35e:	e0de      	b.n	801a51e <fn_0801A2E4+0x23a>
 801a360:	683b      	ldr	r3, [r7, #0]
 801a362:	4aa9      	ldr	r2, [pc, #676]	@ (801a608 <fn_0801A2E4+0x324>)
 801a364:	589a      	ldr	r2, [r3, r2]
 801a366:	4296      	cmp	r6, r2
 801a368:	dd00      	ble.n	801a36c <fn_0801A2E4+0x88>
 801a36a:	e0ec      	b.n	801a546 <fn_0801A2E4+0x262>
 801a36c:	22e0      	movs	r2, #224	@ 0xe0
 801a36e:	5898      	ldr	r0, [r3, r2]
 801a370:	42a8      	cmp	r0, r5
 801a372:	d100      	bne.n	801a376 <fn_0801A2E4+0x92>
 801a374:	e0ee      	b.n	801a554 <fn_0801A2E4+0x270>
 801a376:	2800      	cmp	r0, #0
 801a378:	d100      	bne.n	801a37c <fn_0801A2E4+0x98>
 801a37a:	e0d0      	b.n	801a51e <fn_0801A2E4+0x23a>
 801a37c:	ab0a      	add	r3, sp, #40	@ 0x28
 801a37e:	9300      	str	r3, [sp, #0]
 801a380:	9a0f      	ldr	r2, [sp, #60]	@ 0x3c
 801a382:	990e      	ldr	r1, [sp, #56]	@ 0x38
 801a384:	ab09      	add	r3, sp, #36	@ 0x24
 801a386:	f7ff fc33 	bl	8019bf0 <fn_08019BF0>
 801a38a:	2800      	cmp	r0, #0
 801a38c:	d100      	bne.n	801a390 <fn_0801A2E4+0xac>
 801a38e:	e0c6      	b.n	801a51e <fn_0801A2E4+0x23a>
 801a390:	683b      	ldr	r3, [r7, #0]
 801a392:	4aa2      	ldr	r2, [pc, #648]	@ (801a61c <fn_0801A2E4+0x338>)
 801a394:	589a      	ldr	r2, [r3, r2]
 801a396:	2a00      	cmp	r2, #0
 801a398:	d004      	beq.n	801a3a4 <fn_0801A2E4+0xc0>
 801a39a:	4aa1      	ldr	r2, [pc, #644]	@ (801a620 <fn_0801A2E4+0x33c>)
 801a39c:	589a      	ldr	r2, [r3, r2]
 801a39e:	42aa      	cmp	r2, r5
 801a3a0:	d100      	bne.n	801a3a4 <fn_0801A2E4+0xc0>
 801a3a2:	e0e7      	b.n	801a574 <fn_0801A2E4+0x290>
 801a3a4:	4a9f      	ldr	r2, [pc, #636]	@ (801a624 <fn_0801A2E4+0x340>)
 801a3a6:	589a      	ldr	r2, [r3, r2]
 801a3a8:	2a00      	cmp	r2, #0
 801a3aa:	d004      	beq.n	801a3b6 <fn_0801A2E4+0xd2>
 801a3ac:	4a9e      	ldr	r2, [pc, #632]	@ (801a628 <fn_0801A2E4+0x344>)
 801a3ae:	589a      	ldr	r2, [r3, r2]
 801a3b0:	42aa      	cmp	r2, r5
 801a3b2:	d100      	bne.n	801a3b6 <fn_0801A2E4+0xd2>
 801a3b4:	e0e5      	b.n	801a582 <fn_0801A2E4+0x29e>
 801a3b6:	4a9d      	ldr	r2, [pc, #628]	@ (801a62c <fn_0801A2E4+0x348>)
 801a3b8:	589a      	ldr	r2, [r3, r2]
 801a3ba:	2a00      	cmp	r2, #0
 801a3bc:	d004      	beq.n	801a3c8 <fn_0801A2E4+0xe4>
 801a3be:	4a9c      	ldr	r2, [pc, #624]	@ (801a630 <fn_0801A2E4+0x34c>)
 801a3c0:	589a      	ldr	r2, [r3, r2]
 801a3c2:	42aa      	cmp	r2, r5
 801a3c4:	d100      	bne.n	801a3c8 <fn_0801A2E4+0xe4>
 801a3c6:	e10f      	b.n	801a5e8 <fn_0801A2E4+0x304>
 801a3c8:	4a9a      	ldr	r2, [pc, #616]	@ (801a634 <fn_0801A2E4+0x350>)
 801a3ca:	589a      	ldr	r2, [r3, r2]
 801a3cc:	2a00      	cmp	r2, #0
 801a3ce:	d004      	beq.n	801a3da <fn_0801A2E4+0xf6>
 801a3d0:	4a99      	ldr	r2, [pc, #612]	@ (801a638 <fn_0801A2E4+0x354>)
 801a3d2:	589a      	ldr	r2, [r3, r2]
 801a3d4:	42aa      	cmp	r2, r5
 801a3d6:	d100      	bne.n	801a3da <fn_0801A2E4+0xf6>
 801a3d8:	e10d      	b.n	801a5f6 <fn_0801A2E4+0x312>
 801a3da:	22ac      	movs	r2, #172	@ 0xac
 801a3dc:	01d2      	lsls	r2, r2, #7
 801a3de:	589a      	ldr	r2, [r3, r2]
 801a3e0:	2a00      	cmp	r2, #0
 801a3e2:	d004      	beq.n	801a3ee <fn_0801A2E4+0x10a>
 801a3e4:	4a95      	ldr	r2, [pc, #596]	@ (801a63c <fn_0801A2E4+0x358>)
 801a3e6:	589a      	ldr	r2, [r3, r2]
 801a3e8:	42aa      	cmp	r2, r5
 801a3ea:	d100      	bne.n	801a3ee <fn_0801A2E4+0x10a>
 801a3ec:	e142      	b.n	801a674 <fn_0801A2E4+0x390>
 801a3ee:	4a94      	ldr	r2, [pc, #592]	@ (801a640 <fn_0801A2E4+0x35c>)
 801a3f0:	589a      	ldr	r2, [r3, r2]
 801a3f2:	2a00      	cmp	r2, #0
 801a3f4:	d004      	beq.n	801a400 <fn_0801A2E4+0x11c>
 801a3f6:	4a93      	ldr	r2, [pc, #588]	@ (801a644 <fn_0801A2E4+0x360>)
 801a3f8:	589a      	ldr	r2, [r3, r2]
 801a3fa:	42aa      	cmp	r2, r5
 801a3fc:	d100      	bne.n	801a400 <fn_0801A2E4+0x11c>
 801a3fe:	e140      	b.n	801a682 <fn_0801A2E4+0x39e>
 801a400:	4a91      	ldr	r2, [pc, #580]	@ (801a648 <fn_0801A2E4+0x364>)
 801a402:	589a      	ldr	r2, [r3, r2]
 801a404:	2a00      	cmp	r2, #0
 801a406:	d004      	beq.n	801a412 <fn_0801A2E4+0x12e>
 801a408:	4a90      	ldr	r2, [pc, #576]	@ (801a64c <fn_0801A2E4+0x368>)
 801a40a:	589a      	ldr	r2, [r3, r2]
 801a40c:	42aa      	cmp	r2, r5
 801a40e:	d100      	bne.n	801a412 <fn_0801A2E4+0x12e>
 801a410:	e13e      	b.n	801a690 <fn_0801A2E4+0x3ac>
 801a412:	4a8f      	ldr	r2, [pc, #572]	@ (801a650 <fn_0801A2E4+0x36c>)
 801a414:	589a      	ldr	r2, [r3, r2]
 801a416:	2a00      	cmp	r2, #0
 801a418:	d004      	beq.n	801a424 <fn_0801A2E4+0x140>
 801a41a:	4a8e      	ldr	r2, [pc, #568]	@ (801a654 <fn_0801A2E4+0x370>)
 801a41c:	589a      	ldr	r2, [r3, r2]
 801a41e:	42aa      	cmp	r2, r5
 801a420:	d100      	bne.n	801a424 <fn_0801A2E4+0x140>
 801a422:	e13c      	b.n	801a69e <fn_0801A2E4+0x3ba>
 801a424:	4a7d      	ldr	r2, [pc, #500]	@ (801a61c <fn_0801A2E4+0x338>)
 801a426:	589a      	ldr	r2, [r3, r2]
 801a428:	2a00      	cmp	r2, #0
 801a42a:	d100      	bne.n	801a42e <fn_0801A2E4+0x14a>
 801a42c:	e166      	b.n	801a6fc <fn_0801A2E4+0x418>
 801a42e:	497c      	ldr	r1, [pc, #496]	@ (801a620 <fn_0801A2E4+0x33c>)
 801a430:	5859      	ldr	r1, [r3, r1]
 801a432:	42a9      	cmp	r1, r5
 801a434:	d100      	bne.n	801a438 <fn_0801A2E4+0x154>
 801a436:	e13b      	b.n	801a6b0 <fn_0801A2E4+0x3cc>
 801a438:	497a      	ldr	r1, [pc, #488]	@ (801a624 <fn_0801A2E4+0x340>)
 801a43a:	5859      	ldr	r1, [r3, r1]
 801a43c:	2900      	cmp	r1, #0
 801a43e:	d100      	bne.n	801a442 <fn_0801A2E4+0x15e>
 801a440:	e15e      	b.n	801a700 <fn_0801A2E4+0x41c>
 801a442:	4879      	ldr	r0, [pc, #484]	@ (801a628 <fn_0801A2E4+0x344>)
 801a444:	5818      	ldr	r0, [r3, r0]
 801a446:	42a8      	cmp	r0, r5
 801a448:	d100      	bne.n	801a44c <fn_0801A2E4+0x168>
 801a44a:	e138      	b.n	801a6be <fn_0801A2E4+0x3da>
 801a44c:	4877      	ldr	r0, [pc, #476]	@ (801a62c <fn_0801A2E4+0x348>)
 801a44e:	5818      	ldr	r0, [r3, r0]
 801a450:	2800      	cmp	r0, #0
 801a452:	d100      	bne.n	801a456 <fn_0801A2E4+0x172>
 801a454:	e157      	b.n	801a706 <fn_0801A2E4+0x422>
 801a456:	4e76      	ldr	r6, [pc, #472]	@ (801a630 <fn_0801A2E4+0x34c>)
 801a458:	599e      	ldr	r6, [r3, r6]
 801a45a:	42ae      	cmp	r6, r5
 801a45c:	d100      	bne.n	801a460 <fn_0801A2E4+0x17c>
 801a45e:	e135      	b.n	801a6cc <fn_0801A2E4+0x3e8>
 801a460:	4e74      	ldr	r6, [pc, #464]	@ (801a634 <fn_0801A2E4+0x350>)
 801a462:	599e      	ldr	r6, [r3, r6]
 801a464:	9603      	str	r6, [sp, #12]
 801a466:	2e00      	cmp	r6, #0
 801a468:	d100      	bne.n	801a46c <fn_0801A2E4+0x188>
 801a46a:	e14f      	b.n	801a70c <fn_0801A2E4+0x428>
 801a46c:	4e72      	ldr	r6, [pc, #456]	@ (801a638 <fn_0801A2E4+0x354>)
 801a46e:	599e      	ldr	r6, [r3, r6]
 801a470:	42ae      	cmp	r6, r5
 801a472:	d100      	bne.n	801a476 <fn_0801A2E4+0x192>
 801a474:	e132      	b.n	801a6dc <fn_0801A2E4+0x3f8>
 801a476:	26ac      	movs	r6, #172	@ 0xac
 801a478:	01f6      	lsls	r6, r6, #7
 801a47a:	599e      	ldr	r6, [r3, r6]
 801a47c:	9604      	str	r6, [sp, #16]
 801a47e:	2e00      	cmp	r6, #0
 801a480:	d100      	bne.n	801a484 <fn_0801A2E4+0x1a0>
 801a482:	e146      	b.n	801a712 <fn_0801A2E4+0x42e>
 801a484:	4e6d      	ldr	r6, [pc, #436]	@ (801a63c <fn_0801A2E4+0x358>)
 801a486:	599e      	ldr	r6, [r3, r6]
 801a488:	42ae      	cmp	r6, r5
 801a48a:	d100      	bne.n	801a48e <fn_0801A2E4+0x1aa>
 801a48c:	e12e      	b.n	801a6ec <fn_0801A2E4+0x408>
 801a48e:	4e6c      	ldr	r6, [pc, #432]	@ (801a640 <fn_0801A2E4+0x35c>)
 801a490:	599e      	ldr	r6, [r3, r6]
 801a492:	9605      	str	r6, [sp, #20]
 801a494:	2e00      	cmp	r6, #0
 801a496:	d100      	bne.n	801a49a <fn_0801A2E4+0x1b6>
 801a498:	e13e      	b.n	801a718 <fn_0801A2E4+0x434>
 801a49a:	4e6a      	ldr	r6, [pc, #424]	@ (801a644 <fn_0801A2E4+0x360>)
 801a49c:	599e      	ldr	r6, [r3, r6]
 801a49e:	42ae      	cmp	r6, r5
 801a4a0:	d05b      	beq.n	801a55a <fn_0801A2E4+0x276>
 801a4a2:	4e69      	ldr	r6, [pc, #420]	@ (801a648 <fn_0801A2E4+0x364>)
 801a4a4:	599e      	ldr	r6, [r3, r6]
 801a4a6:	9606      	str	r6, [sp, #24]
 801a4a8:	2e00      	cmp	r6, #0
 801a4aa:	d100      	bne.n	801a4ae <fn_0801A2E4+0x1ca>
 801a4ac:	e137      	b.n	801a71e <fn_0801A2E4+0x43a>
 801a4ae:	4f67      	ldr	r7, [pc, #412]	@ (801a64c <fn_0801A2E4+0x368>)
 801a4b0:	59df      	ldr	r7, [r3, r7]
 801a4b2:	42af      	cmp	r7, r5
 801a4b4:	d058      	beq.n	801a568 <fn_0801A2E4+0x284>
 801a4b6:	4f66      	ldr	r7, [pc, #408]	@ (801a650 <fn_0801A2E4+0x36c>)
 801a4b8:	59de      	ldr	r6, [r3, r7]
 801a4ba:	9607      	str	r6, [sp, #28]
 801a4bc:	2e00      	cmp	r6, #0
 801a4be:	d100      	bne.n	801a4c2 <fn_0801A2E4+0x1de>
 801a4c0:	e130      	b.n	801a724 <fn_0801A2E4+0x440>
 801a4c2:	4e64      	ldr	r6, [pc, #400]	@ (801a654 <fn_0801A2E4+0x370>)
 801a4c4:	599e      	ldr	r6, [r3, r6]
 801a4c6:	42ae      	cmp	r6, r5
 801a4c8:	d06a      	beq.n	801a5a0 <fn_0801A2E4+0x2bc>
 801a4ca:	46d4      	mov	ip, sl
 801a4cc:	44a4      	add	ip, r4
 801a4ce:	4666      	mov	r6, ip
 801a4d0:	00b6      	lsls	r6, r6, #2
 801a4d2:	46b4      	mov	ip, r6
 801a4d4:	44cc      	add	ip, r9
 801a4d6:	4666      	mov	r6, ip
 801a4d8:	6892      	ldr	r2, [r2, #8]
 801a4da:	68b6      	ldr	r6, [r6, #8]
 801a4dc:	42b2      	cmp	r2, r6
 801a4de:	db00      	blt.n	801a4e2 <fn_0801A2E4+0x1fe>
 801a4e0:	e0eb      	b.n	801a6ba <fn_0801A2E4+0x3d6>
 801a4e2:	688a      	ldr	r2, [r1, #8]
 801a4e4:	4296      	cmp	r6, r2
 801a4e6:	dc00      	bgt.n	801a4ea <fn_0801A2E4+0x206>
 801a4e8:	e0ee      	b.n	801a6c8 <fn_0801A2E4+0x3e4>
 801a4ea:	6882      	ldr	r2, [r0, #8]
 801a4ec:	4296      	cmp	r6, r2
 801a4ee:	dc00      	bgt.n	801a4f2 <fn_0801A2E4+0x20e>
 801a4f0:	e0f2      	b.n	801a6d8 <fn_0801A2E4+0x3f4>
 801a4f2:	9a03      	ldr	r2, [sp, #12]
 801a4f4:	6892      	ldr	r2, [r2, #8]
 801a4f6:	4296      	cmp	r6, r2
 801a4f8:	dc00      	bgt.n	801a4fc <fn_0801A2E4+0x218>
 801a4fa:	e0f5      	b.n	801a6e8 <fn_0801A2E4+0x404>
 801a4fc:	9a04      	ldr	r2, [sp, #16]
 801a4fe:	6892      	ldr	r2, [r2, #8]
 801a500:	4296      	cmp	r6, r2
 801a502:	dc00      	bgt.n	801a506 <fn_0801A2E4+0x222>
 801a504:	e0f8      	b.n	801a6f8 <fn_0801A2E4+0x414>
 801a506:	9a05      	ldr	r2, [sp, #20]
 801a508:	6892      	ldr	r2, [r2, #8]
 801a50a:	4296      	cmp	r6, r2
 801a50c:	dd2a      	ble.n	801a564 <fn_0801A2E4+0x280>
 801a50e:	9a06      	ldr	r2, [sp, #24]
 801a510:	6892      	ldr	r2, [r2, #8]
 801a512:	4296      	cmp	r6, r2
 801a514:	dd2c      	ble.n	801a570 <fn_0801A2E4+0x28c>
 801a516:	9a07      	ldr	r2, [sp, #28]
 801a518:	6892      	ldr	r2, [r2, #8]
 801a51a:	42b2      	cmp	r2, r6
 801a51c:	da45      	bge.n	801a5aa <fn_0801A2E4+0x2c6>
 801a51e:	b011      	add	sp, #68	@ 0x44
 801a520:	bcf0      	pop	{r4, r5, r6, r7}
 801a522:	46bb      	mov	fp, r7
 801a524:	46b2      	mov	sl, r6
 801a526:	46a9      	mov	r9, r5
 801a528:	46a0      	mov	r8, r4
 801a52a:	bcf0      	pop	{r4, r5, r6, r7}
 801a52c:	bc01      	pop	{r0}
 801a52e:	4700      	bx	r0
 801a530:	2922      	cmp	r1, #34	@ 0x22
 801a532:	d004      	beq.n	801a53e <fn_0801A2E4+0x25a>
 801a534:	2300      	movs	r3, #0
 801a536:	469b      	mov	fp, r3
 801a538:	2951      	cmp	r1, #81	@ 0x51
 801a53a:	d000      	beq.n	801a53e <fn_0801A2E4+0x25a>
 801a53c:	e6f6      	b.n	801a32c <fn_0801A2E4+0x48>
 801a53e:	2301      	movs	r3, #1
 801a540:	469b      	mov	fp, r3
 801a542:	4698      	mov	r8, r3
 801a544:	e6fb      	b.n	801a33e <fn_0801A2E4+0x5a>
 801a546:	0016      	movs	r6, r2
 801a548:	9209      	str	r2, [sp, #36]	@ 0x24
 801a54a:	22e0      	movs	r2, #224	@ 0xe0
 801a54c:	5898      	ldr	r0, [r3, r2]
 801a54e:	42a8      	cmp	r0, r5
 801a550:	d000      	beq.n	801a554 <fn_0801A2E4+0x270>
 801a552:	e710      	b.n	801a376 <fn_0801A2E4+0x92>
 801a554:	00f6      	lsls	r6, r6, #3
 801a556:	9609      	str	r6, [sp, #36]	@ 0x24
 801a558:	e71b      	b.n	801a392 <fn_0801A2E4+0xae>
 801a55a:	4e3f      	ldr	r6, [pc, #252]	@ (801a658 <fn_0801A2E4+0x374>)
 801a55c:	5f9e      	ldrsh	r6, [r3, r6]
 801a55e:	4647      	mov	r7, r8
 801a560:	42b7      	cmp	r7, r6
 801a562:	d19e      	bne.n	801a4a2 <fn_0801A2E4+0x1be>
 801a564:	2105      	movs	r1, #5
 801a566:	e021      	b.n	801a5ac <fn_0801A2E4+0x2c8>
 801a568:	4f3c      	ldr	r7, [pc, #240]	@ (801a65c <fn_0801A2E4+0x378>)
 801a56a:	5fdf      	ldrsh	r7, [r3, r7]
 801a56c:	45b8      	cmp	r8, r7
 801a56e:	d1a2      	bne.n	801a4b6 <fn_0801A2E4+0x1d2>
 801a570:	2106      	movs	r1, #6
 801a572:	e01b      	b.n	801a5ac <fn_0801A2E4+0x2c8>
 801a574:	4a3a      	ldr	r2, [pc, #232]	@ (801a660 <fn_0801A2E4+0x37c>)
 801a576:	5e9a      	ldrsh	r2, [r3, r2]
 801a578:	4590      	cmp	r8, r2
 801a57a:	d000      	beq.n	801a57e <fn_0801A2E4+0x29a>
 801a57c:	e712      	b.n	801a3a4 <fn_0801A2E4+0xc0>
 801a57e:	2100      	movs	r1, #0
 801a580:	e005      	b.n	801a58e <fn_0801A2E4+0x2aa>
 801a582:	4a38      	ldr	r2, [pc, #224]	@ (801a664 <fn_0801A2E4+0x380>)
 801a584:	5e9a      	ldrsh	r2, [r3, r2]
 801a586:	4590      	cmp	r8, r2
 801a588:	d000      	beq.n	801a58c <fn_0801A2E4+0x2a8>
 801a58a:	e714      	b.n	801a3b6 <fn_0801A2E4+0xd2>
 801a58c:	2101      	movs	r1, #1
 801a58e:	004a      	lsls	r2, r1, #1
 801a590:	1852      	adds	r2, r2, r1
 801a592:	0092      	lsls	r2, r2, #2
 801a594:	4921      	ldr	r1, [pc, #132]	@ (801a61c <fn_0801A2E4+0x338>)
 801a596:	189a      	adds	r2, r3, r2
 801a598:	1852      	adds	r2, r2, r1
 801a59a:	2100      	movs	r1, #0
 801a59c:	6011      	str	r1, [r2, #0]
 801a59e:	e741      	b.n	801a424 <fn_0801A2E4+0x140>
 801a5a0:	4e31      	ldr	r6, [pc, #196]	@ (801a668 <fn_0801A2E4+0x384>)
 801a5a2:	5f9e      	ldrsh	r6, [r3, r6]
 801a5a4:	4546      	cmp	r6, r8
 801a5a6:	d000      	beq.n	801a5aa <fn_0801A2E4+0x2c6>
 801a5a8:	e78f      	b.n	801a4ca <fn_0801A2E4+0x1e6>
 801a5aa:	2107      	movs	r1, #7
 801a5ac:	004a      	lsls	r2, r1, #1
 801a5ae:	1850      	adds	r0, r2, r1
 801a5b0:	4e1a      	ldr	r6, [pc, #104]	@ (801a61c <fn_0801A2E4+0x338>)
 801a5b2:	0080      	lsls	r0, r0, #2
 801a5b4:	1818      	adds	r0, r3, r0
 801a5b6:	1980      	adds	r0, r0, r6
 801a5b8:	2600      	movs	r6, #0
 801a5ba:	6006      	str	r6, [r0, #0]
 801a5bc:	1852      	adds	r2, r2, r1
 801a5be:	0092      	lsls	r2, r2, #2
 801a5c0:	189b      	adds	r3, r3, r2
 801a5c2:	4a16      	ldr	r2, [pc, #88]	@ (801a61c <fn_0801A2E4+0x338>)
 801a5c4:	1898      	adds	r0, r3, r2
 801a5c6:	4652      	mov	r2, sl
 801a5c8:	1912      	adds	r2, r2, r4
 801a5ca:	0092      	lsls	r2, r2, #2
 801a5cc:	444a      	add	r2, r9
 801a5ce:	6002      	str	r2, [r0, #0]
 801a5d0:	4a13      	ldr	r2, [pc, #76]	@ (801a620 <fn_0801A2E4+0x33c>)
 801a5d2:	509d      	str	r5, [r3, r2]
 801a5d4:	4a22      	ldr	r2, [pc, #136]	@ (801a660 <fn_0801A2E4+0x37c>)
 801a5d6:	189b      	adds	r3, r3, r2
 801a5d8:	465a      	mov	r2, fp
 801a5da:	0020      	movs	r0, r4
 801a5dc:	801a      	strh	r2, [r3, #0]
 801a5de:	9b0a      	ldr	r3, [sp, #40]	@ 0x28
 801a5e0:	9a09      	ldr	r2, [sp, #36]	@ 0x24
 801a5e2:	f7ea fbb3 	bl	8004d4c <fn_08004D4C>
 801a5e6:	e79a      	b.n	801a51e <fn_0801A2E4+0x23a>
 801a5e8:	4a20      	ldr	r2, [pc, #128]	@ (801a66c <fn_0801A2E4+0x388>)
 801a5ea:	5e9a      	ldrsh	r2, [r3, r2]
 801a5ec:	4590      	cmp	r8, r2
 801a5ee:	d000      	beq.n	801a5f2 <fn_0801A2E4+0x30e>
 801a5f0:	e6ea      	b.n	801a3c8 <fn_0801A2E4+0xe4>
 801a5f2:	2102      	movs	r1, #2
 801a5f4:	e7cb      	b.n	801a58e <fn_0801A2E4+0x2aa>
 801a5f6:	4a1e      	ldr	r2, [pc, #120]	@ (801a670 <fn_0801A2E4+0x38c>)
 801a5f8:	5e9a      	ldrsh	r2, [r3, r2]
 801a5fa:	4590      	cmp	r8, r2
 801a5fc:	d000      	beq.n	801a600 <fn_0801A2E4+0x31c>
 801a5fe:	e6ec      	b.n	801a3da <fn_0801A2E4+0xf6>
 801a600:	2103      	movs	r1, #3
 801a602:	e7c4      	b.n	801a58e <fn_0801A2E4+0x2aa>
 801a604:	030064c4 	.word	0x030064c4
 801a608:	00005630 	.word	0x00005630
 801a60c:	080257f6 	.word	0x080257f6
 801a610:	ffff7fff 	.word	0xffff7fff
 801a614:	0814a814 	.word	0x0814a814
 801a618:	0812f754 	.word	0x0812f754
 801a61c:	000055d0 	.word	0x000055d0
 801a620:	000055d4 	.word	0x000055d4
 801a624:	000055dc 	.word	0x000055dc
 801a628:	000055e0 	.word	0x000055e0
 801a62c:	000055e8 	.word	0x000055e8
 801a630:	000055ec 	.word	0x000055ec
 801a634:	000055f4 	.word	0x000055f4
 801a638:	000055f8 	.word	0x000055f8
 801a63c:	00005604 	.word	0x00005604
 801a640:	0000560c 	.word	0x0000560c
 801a644:	00005610 	.word	0x00005610
 801a648:	00005618 	.word	0x00005618
 801a64c:	0000561c 	.word	0x0000561c
 801a650:	00005624 	.word	0x00005624
 801a654:	00005628 	.word	0x00005628
 801a658:	00005614 	.word	0x00005614
 801a65c:	00005620 	.word	0x00005620
 801a660:	000055d8 	.word	0x000055d8
 801a664:	000055e4 	.word	0x000055e4
 801a668:	0000562c 	.word	0x0000562c
 801a66c:	000055f0 	.word	0x000055f0
 801a670:	000055fc 	.word	0x000055fc
 801a674:	4a2d      	ldr	r2, [pc, #180]	@ (801a72c <fn_0801A2E4+0x448>)
 801a676:	5e9a      	ldrsh	r2, [r3, r2]
 801a678:	4590      	cmp	r8, r2
 801a67a:	d000      	beq.n	801a67e <fn_0801A2E4+0x39a>
 801a67c:	e6b7      	b.n	801a3ee <fn_0801A2E4+0x10a>
 801a67e:	2104      	movs	r1, #4
 801a680:	e785      	b.n	801a58e <fn_0801A2E4+0x2aa>
 801a682:	4a2b      	ldr	r2, [pc, #172]	@ (801a730 <fn_0801A2E4+0x44c>)
 801a684:	5e9a      	ldrsh	r2, [r3, r2]
 801a686:	4590      	cmp	r8, r2
 801a688:	d000      	beq.n	801a68c <fn_0801A2E4+0x3a8>
 801a68a:	e6b9      	b.n	801a400 <fn_0801A2E4+0x11c>
 801a68c:	2105      	movs	r1, #5
 801a68e:	e77e      	b.n	801a58e <fn_0801A2E4+0x2aa>
 801a690:	4a28      	ldr	r2, [pc, #160]	@ (801a734 <fn_0801A2E4+0x450>)
 801a692:	5e9a      	ldrsh	r2, [r3, r2]
 801a694:	4590      	cmp	r8, r2
 801a696:	d000      	beq.n	801a69a <fn_0801A2E4+0x3b6>
 801a698:	e6bb      	b.n	801a412 <fn_0801A2E4+0x12e>
 801a69a:	2106      	movs	r1, #6
 801a69c:	e777      	b.n	801a58e <fn_0801A2E4+0x2aa>
 801a69e:	4a26      	ldr	r2, [pc, #152]	@ (801a738 <fn_0801A2E4+0x454>)
 801a6a0:	5e9a      	ldrsh	r2, [r3, r2]
 801a6a2:	2107      	movs	r1, #7
 801a6a4:	4542      	cmp	r2, r8
 801a6a6:	d000      	beq.n	801a6aa <fn_0801A2E4+0x3c6>
 801a6a8:	e6bc      	b.n	801a424 <fn_0801A2E4+0x140>
 801a6aa:	e770      	b.n	801a58e <fn_0801A2E4+0x2aa>
 801a6ac:	683b      	ldr	r3, [r7, #0]
 801a6ae:	e65d      	b.n	801a36c <fn_0801A2E4+0x88>
 801a6b0:	4922      	ldr	r1, [pc, #136]	@ (801a73c <fn_0801A2E4+0x458>)
 801a6b2:	5e59      	ldrsh	r1, [r3, r1]
 801a6b4:	4588      	cmp	r8, r1
 801a6b6:	d000      	beq.n	801a6ba <fn_0801A2E4+0x3d6>
 801a6b8:	e6be      	b.n	801a438 <fn_0801A2E4+0x154>
 801a6ba:	2100      	movs	r1, #0
 801a6bc:	e776      	b.n	801a5ac <fn_0801A2E4+0x2c8>
 801a6be:	4820      	ldr	r0, [pc, #128]	@ (801a740 <fn_0801A2E4+0x45c>)
 801a6c0:	5e18      	ldrsh	r0, [r3, r0]
 801a6c2:	4580      	cmp	r8, r0
 801a6c4:	d000      	beq.n	801a6c8 <fn_0801A2E4+0x3e4>
 801a6c6:	e6c1      	b.n	801a44c <fn_0801A2E4+0x168>
 801a6c8:	2101      	movs	r1, #1
 801a6ca:	e76f      	b.n	801a5ac <fn_0801A2E4+0x2c8>
 801a6cc:	4e1d      	ldr	r6, [pc, #116]	@ (801a744 <fn_0801A2E4+0x460>)
 801a6ce:	5f9e      	ldrsh	r6, [r3, r6]
 801a6d0:	4647      	mov	r7, r8
 801a6d2:	42b7      	cmp	r7, r6
 801a6d4:	d000      	beq.n	801a6d8 <fn_0801A2E4+0x3f4>
 801a6d6:	e6c3      	b.n	801a460 <fn_0801A2E4+0x17c>
 801a6d8:	2102      	movs	r1, #2
 801a6da:	e767      	b.n	801a5ac <fn_0801A2E4+0x2c8>
 801a6dc:	4e1a      	ldr	r6, [pc, #104]	@ (801a748 <fn_0801A2E4+0x464>)
 801a6de:	5f9e      	ldrsh	r6, [r3, r6]
 801a6e0:	4647      	mov	r7, r8
 801a6e2:	42b7      	cmp	r7, r6
 801a6e4:	d000      	beq.n	801a6e8 <fn_0801A2E4+0x404>
 801a6e6:	e6c6      	b.n	801a476 <fn_0801A2E4+0x192>
 801a6e8:	2103      	movs	r1, #3
 801a6ea:	e75f      	b.n	801a5ac <fn_0801A2E4+0x2c8>
 801a6ec:	4e0f      	ldr	r6, [pc, #60]	@ (801a72c <fn_0801A2E4+0x448>)
 801a6ee:	5f9e      	ldrsh	r6, [r3, r6]
 801a6f0:	4647      	mov	r7, r8
 801a6f2:	42b7      	cmp	r7, r6
 801a6f4:	d000      	beq.n	801a6f8 <fn_0801A2E4+0x414>
 801a6f6:	e6ca      	b.n	801a48e <fn_0801A2E4+0x1aa>
 801a6f8:	2104      	movs	r1, #4
 801a6fa:	e757      	b.n	801a5ac <fn_0801A2E4+0x2c8>
 801a6fc:	2100      	movs	r1, #0
 801a6fe:	e75d      	b.n	801a5bc <fn_0801A2E4+0x2d8>
 801a700:	2101      	movs	r1, #1
 801a702:	2202      	movs	r2, #2
 801a704:	e75a      	b.n	801a5bc <fn_0801A2E4+0x2d8>
 801a706:	2102      	movs	r1, #2
 801a708:	2204      	movs	r2, #4
 801a70a:	e757      	b.n	801a5bc <fn_0801A2E4+0x2d8>
 801a70c:	2103      	movs	r1, #3
 801a70e:	2206      	movs	r2, #6
 801a710:	e754      	b.n	801a5bc <fn_0801A2E4+0x2d8>
 801a712:	2104      	movs	r1, #4
 801a714:	2208      	movs	r2, #8
 801a716:	e751      	b.n	801a5bc <fn_0801A2E4+0x2d8>
 801a718:	2105      	movs	r1, #5
 801a71a:	220a      	movs	r2, #10
 801a71c:	e74e      	b.n	801a5bc <fn_0801A2E4+0x2d8>
 801a71e:	2106      	movs	r1, #6
 801a720:	220c      	movs	r2, #12
 801a722:	e74b      	b.n	801a5bc <fn_0801A2E4+0x2d8>
 801a724:	2107      	movs	r1, #7
 801a726:	220e      	movs	r2, #14
 801a728:	e748      	b.n	801a5bc <fn_0801A2E4+0x2d8>
 801a72a:	46c0      	nop			@ (mov r8, r8)
 801a72c:	00005608 	.word	0x00005608
 801a730:	00005614 	.word	0x00005614
 801a734:	00005620 	.word	0x00005620
 801a738:	0000562c 	.word	0x0000562c
 801a73c:	000055d8 	.word	0x000055d8
 801a740:	000055e4 	.word	0x000055e4
 801a744:	000055f0 	.word	0x000055f0
 801a748:	000055fc 	.word	0x000055fc
