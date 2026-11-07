fn_0800F3D4:
 800f3d4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800f3d6:	0004      	movs	r4, r0
 800f3d8:	46de      	mov	lr, fp
 800f3da:	4645      	mov	r5, r8
 800f3dc:	4657      	mov	r7, sl
 800f3de:	464e      	mov	r6, r9
 800f3e0:	0008      	movs	r0, r1
 800f3e2:	4b5c      	ldr	r3, [pc, #368]	@ (800f554 <fn_0800F3D4+0x180>)
 800f3e4:	6819      	ldr	r1, [r3, #0]
 800f3e6:	4698      	mov	r8, r3
 800f3e8:	4b5b      	ldr	r3, [pc, #364]	@ (800f558 <fn_0800F3D4+0x184>)
 800f3ea:	b5e0      	push	{r5, r6, r7, lr}
 800f3ec:	50cc      	str	r4, [r1, r3]
 800f3ee:	3304      	adds	r3, #4
 800f3f0:	50c8      	str	r0, [r1, r3]
 800f3f2:	4b5a      	ldr	r3, [pc, #360]	@ (800f55c <fn_0800F3D4+0x188>)
 800f3f4:	50ca      	str	r2, [r1, r3]
 800f3f6:	235b      	movs	r3, #91	@ 0x5b
 800f3f8:	4d59      	ldr	r5, [pc, #356]	@ (800f560 <fn_0800F3D4+0x18c>)
 800f3fa:	5ce3      	ldrb	r3, [r4, r3]
 800f3fc:	5949      	ldr	r1, [r1, r5]
 800f3fe:	041b      	lsls	r3, r3, #16
 800f400:	189d      	adds	r5, r3, r2
 800f402:	600d      	str	r5, [r1, #0]
 800f404:	1ad5      	subs	r5, r2, r3
 800f406:	604d      	str	r5, [r1, #4]
 800f408:	181d      	adds	r5, r3, r0
 800f40a:	1ac3      	subs	r3, r0, r3
 800f40c:	60cd      	str	r5, [r1, #12]
 800f40e:	608b      	str	r3, [r1, #8]
 800f410:	0011      	movs	r1, r2
 800f412:	f016 f8d7 	bl	80255c4 <fn_080255C4>
 800f416:	4643      	mov	r3, r8
 800f418:	4a52      	ldr	r2, [pc, #328]	@ (800f564 <fn_0800F3D4+0x190>)
 800f41a:	681b      	ldr	r3, [r3, #0]
 800f41c:	5098      	str	r0, [r3, r2]
 800f41e:	2200      	movs	r2, #0
 800f420:	4951      	ldr	r1, [pc, #324]	@ (800f568 <fn_0800F3D4+0x194>)
 800f422:	505a      	str	r2, [r3, r1]
 800f424:	3104      	adds	r1, #4
 800f426:	505a      	str	r2, [r3, r1]
 800f428:	4950      	ldr	r1, [pc, #320]	@ (800f56c <fn_0800F3D4+0x198>)
 800f42a:	0005      	movs	r5, r0
 800f42c:	505a      	str	r2, [r3, r1]
 800f42e:	0020      	movs	r0, r4
 800f430:	f002 ff00 	bl	8012234 <fn_08012234>
 800f434:	2200      	movs	r2, #0
 800f436:	2800      	cmp	r0, #0
 800f438:	d006      	beq.n	800f448 <fn_0800F3D4+0x74>
 800f43a:	0020      	movs	r0, r4
 800f43c:	f002 fefa 	bl	8012234 <fn_08012234>
 800f440:	6802      	ldr	r2, [r0, #0]
 800f442:	1b12      	subs	r2, r2, r4
 800f444:	4253      	negs	r3, r2
 800f446:	415a      	adcs	r2, r3
 800f448:	4643      	mov	r3, r8
 800f44a:	4949      	ldr	r1, [pc, #292]	@ (800f570 <fn_0800F3D4+0x19c>)
 800f44c:	681b      	ldr	r3, [r3, #0]
 800f44e:	505a      	str	r2, [r3, r1]
 800f450:	4948      	ldr	r1, [pc, #288]	@ (800f574 <fn_0800F3D4+0x1a0>)
 800f452:	682a      	ldr	r2, [r5, #0]
 800f454:	505a      	str	r2, [r3, r1]
 800f456:	3908      	subs	r1, #8
 800f458:	505a      	str	r2, [r3, r1]
 800f45a:	4a47      	ldr	r2, [pc, #284]	@ (800f578 <fn_0800F3D4+0x1a4>)
 800f45c:	6869      	ldr	r1, [r5, #4]
 800f45e:	5099      	str	r1, [r3, r2]
 800f460:	4946      	ldr	r1, [pc, #280]	@ (800f57c <fn_0800F3D4+0x1a8>)
 800f462:	5a5a      	ldrh	r2, [r3, r1]
 800f464:	3201      	adds	r2, #1
 800f466:	525a      	strh	r2, [r3, r1]
 800f468:	2100      	movs	r1, #0
 800f46a:	4a45      	ldr	r2, [pc, #276]	@ (800f580 <fn_0800F3D4+0x1ac>)
 800f46c:	5099      	str	r1, [r3, r2]
 800f46e:	4a3a      	ldr	r2, [pc, #232]	@ (800f558 <fn_0800F3D4+0x184>)
 800f470:	589a      	ldr	r2, [r3, r2]
 800f472:	6cd2      	ldr	r2, [r2, #76]	@ 0x4c
 800f474:	04d2      	lsls	r2, r2, #19
 800f476:	d46a      	bmi.n	800f54e <fn_0800F3D4+0x17a>
 800f478:	4a39      	ldr	r2, [pc, #228]	@ (800f560 <fn_0800F3D4+0x18c>)
 800f47a:	4942      	ldr	r1, [pc, #264]	@ (800f584 <fn_0800F3D4+0x1b0>)
 800f47c:	589a      	ldr	r2, [r3, r2]
 800f47e:	4e42      	ldr	r6, [pc, #264]	@ (800f588 <fn_0800F3D4+0x1b4>)
 800f480:	585c      	ldr	r4, [r3, r1]
 800f482:	6890      	ldr	r0, [r2, #8]
 800f484:	68d1      	ldr	r1, [r2, #12]
 800f486:	599b      	ldr	r3, [r3, r6]
 800f488:	6857      	ldr	r7, [r2, #4]
 800f48a:	6812      	ldr	r2, [r2, #0]
 800f48c:	1b00      	subs	r0, r0, r4
 800f48e:	1b09      	subs	r1, r1, r4
 800f490:	1aff      	subs	r7, r7, r3
 800f492:	15c5      	asrs	r5, r0, #23
 800f494:	15cc      	asrs	r4, r1, #23
 800f496:	1ad3      	subs	r3, r2, r3
 800f498:	42a5      	cmp	r5, r4
 800f49a:	dc30      	bgt.n	800f4fe <fn_0800F3D4+0x12a>
 800f49c:	15fa      	asrs	r2, r7, #23
 800f49e:	15db      	asrs	r3, r3, #23
 800f4a0:	4691      	mov	r9, r2
 800f4a2:	1c62      	adds	r2, r4, #1
 800f4a4:	469a      	mov	sl, r3
 800f4a6:	4693      	mov	fp, r2
 800f4a8:	4e38      	ldr	r6, [pc, #224]	@ (800f58c <fn_0800F3D4+0x1b8>)
 800f4aa:	1c5f      	adds	r7, r3, #1
 800f4ac:	464c      	mov	r4, r9
 800f4ae:	45d1      	cmp	r9, sl
 800f4b0:	dd03      	ble.n	800f4ba <fn_0800F3D4+0xe6>
 800f4b2:	e011      	b.n	800f4d8 <fn_0800F3D4+0x104>
 800f4b4:	3401      	adds	r4, #1
 800f4b6:	42bc      	cmp	r4, r7
 800f4b8:	d00e      	beq.n	800f4d8 <fn_0800F3D4+0x104>
 800f4ba:	0032      	movs	r2, r6
 800f4bc:	0021      	movs	r1, r4
 800f4be:	0028      	movs	r0, r5
 800f4c0:	f000 feda 	bl	8010278 <fn_08010278>
 800f4c4:	2800      	cmp	r0, #0
 800f4c6:	d1f5      	bne.n	800f4b4 <fn_0800F3D4+0xe0>
 800f4c8:	bcf0      	pop	{r4, r5, r6, r7}
 800f4ca:	46bb      	mov	fp, r7
 800f4cc:	46b2      	mov	sl, r6
 800f4ce:	46a9      	mov	r9, r5
 800f4d0:	46a0      	mov	r8, r4
 800f4d2:	bcf8      	pop	{r3, r4, r5, r6, r7}
 800f4d4:	bc02      	pop	{r1}
 800f4d6:	4708      	bx	r1
 800f4d8:	3501      	adds	r5, #1
 800f4da:	455d      	cmp	r5, fp
 800f4dc:	d1e6      	bne.n	800f4ac <fn_0800F3D4+0xd8>
 800f4de:	4643      	mov	r3, r8
 800f4e0:	681a      	ldr	r2, [r3, #0]
 800f4e2:	4b1f      	ldr	r3, [pc, #124]	@ (800f560 <fn_0800F3D4+0x18c>)
 800f4e4:	4927      	ldr	r1, [pc, #156]	@ (800f584 <fn_0800F3D4+0x1b0>)
 800f4e6:	58d3      	ldr	r3, [r2, r3]
 800f4e8:	5854      	ldr	r4, [r2, r1]
 800f4ea:	6898      	ldr	r0, [r3, #8]
 800f4ec:	68d9      	ldr	r1, [r3, #12]
 800f4ee:	1b00      	subs	r0, r0, r4
 800f4f0:	1b09      	subs	r1, r1, r4
 800f4f2:	4c25      	ldr	r4, [pc, #148]	@ (800f588 <fn_0800F3D4+0x1b4>)
 800f4f4:	685f      	ldr	r7, [r3, #4]
 800f4f6:	5912      	ldr	r2, [r2, r4]
 800f4f8:	681b      	ldr	r3, [r3, #0]
 800f4fa:	1abf      	subs	r7, r7, r2
 800f4fc:	1a9b      	subs	r3, r3, r2
 800f4fe:	4a24      	ldr	r2, [pc, #144]	@ (800f590 <fn_0800F3D4+0x1bc>)
 800f500:	1885      	adds	r5, r0, r2
 800f502:	2280      	movs	r2, #128	@ 0x80
 800f504:	0392      	lsls	r2, r2, #14
 800f506:	188e      	adds	r6, r1, r2
 800f508:	15ed      	asrs	r5, r5, #23
 800f50a:	15f6      	asrs	r6, r6, #23
 800f50c:	42b5      	cmp	r5, r6
 800f50e:	dc1e      	bgt.n	800f54e <fn_0800F3D4+0x17a>
 800f510:	4a1f      	ldr	r2, [pc, #124]	@ (800f590 <fn_0800F3D4+0x1bc>)
 800f512:	18bf      	adds	r7, r7, r2
 800f514:	15fa      	asrs	r2, r7, #23
 800f516:	4690      	mov	r8, r2
 800f518:	2280      	movs	r2, #128	@ 0x80
 800f51a:	0392      	lsls	r2, r2, #14
 800f51c:	189b      	adds	r3, r3, r2
 800f51e:	15db      	asrs	r3, r3, #23
 800f520:	1c72      	adds	r2, r6, #1
 800f522:	4699      	mov	r9, r3
 800f524:	4692      	mov	sl, r2
 800f526:	4e1b      	ldr	r6, [pc, #108]	@ (800f594 <fn_0800F3D4+0x1c0>)
 800f528:	1c5f      	adds	r7, r3, #1
 800f52a:	4644      	mov	r4, r8
 800f52c:	45c8      	cmp	r8, r9
 800f52e:	dd03      	ble.n	800f538 <fn_0800F3D4+0x164>
 800f530:	e00a      	b.n	800f548 <fn_0800F3D4+0x174>
 800f532:	3401      	adds	r4, #1
 800f534:	42bc      	cmp	r4, r7
 800f536:	d007      	beq.n	800f548 <fn_0800F3D4+0x174>
 800f538:	0032      	movs	r2, r6
 800f53a:	0021      	movs	r1, r4
 800f53c:	0028      	movs	r0, r5
 800f53e:	f000 ff21 	bl	8010384 <fn_08010384>
 800f542:	2800      	cmp	r0, #0
 800f544:	d1f5      	bne.n	800f532 <fn_0800F3D4+0x15e>
 800f546:	e7bf      	b.n	800f4c8 <fn_0800F3D4+0xf4>
 800f548:	3501      	adds	r5, #1
 800f54a:	4555      	cmp	r5, sl
 800f54c:	d1ed      	bne.n	800f52a <fn_0800F3D4+0x156>
 800f54e:	2001      	movs	r0, #1
 800f550:	e7ba      	b.n	800f4c8 <fn_0800F3D4+0xf4>
 800f552:	46c0      	nop			@ (mov r8, r8)
 800f554:	030064c4 	.word	0x030064c4
 800f558:	0000088c 	.word	0x0000088c
 800f55c:	00000894 	.word	0x00000894
 800f560:	000008a8 	.word	0x000008a8
 800f564:	000008ac 	.word	0x000008ac
 800f568:	000008bc 	.word	0x000008bc
 800f56c:	000008c4 	.word	0x000008c4
 800f570:	000008c8 	.word	0x000008c8
 800f574:	000008b8 	.word	0x000008b8
 800f578:	000008b4 	.word	0x000008b4
 800f57c:	00001122 	.word	0x00001122
 800f580:	000008dc 	.word	0x000008dc
 800f584:	00000e28 	.word	0x00000e28
 800f588:	00000e2c 	.word	0x00000e2c
 800f58c:	0800e7ad 	.word	0x0800e7ad
 800f590:	ffe00000 	.word	0xffe00000
 800f594:	0800e3c5 	.word	0x0800e3c5
