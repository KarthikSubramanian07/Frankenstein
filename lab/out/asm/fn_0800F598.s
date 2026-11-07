fn_0800F598:
 800f598:	b570      	push	{r4, r5, r6, lr}
 800f59a:	6902      	ldr	r2, [r0, #16]
 800f59c:	68c1      	ldr	r1, [r0, #12]
 800f59e:	0004      	movs	r4, r0
 800f5a0:	6946      	ldr	r6, [r0, #20]
 800f5a2:	6b05      	ldr	r5, [r0, #48]	@ 0x30
 800f5a4:	f7ff ff16 	bl	800f3d4 <fn_0800F3D4>
 800f5a8:	4b33      	ldr	r3, [pc, #204]	@ (800f678 <fn_0800F598+0xe0>)
 800f5aa:	681a      	ldr	r2, [r3, #0]
 800f5ac:	238b      	movs	r3, #139	@ 0x8b
 800f5ae:	011b      	lsls	r3, r3, #4
 800f5b0:	58d1      	ldr	r1, [r2, r3]
 800f5b2:	4b32      	ldr	r3, [pc, #200]	@ (800f67c <fn_0800F598+0xe4>)
 800f5b4:	6321      	str	r1, [r4, #48]	@ 0x30
 800f5b6:	58d3      	ldr	r3, [r2, r3]
 800f5b8:	6ba0      	ldr	r0, [r4, #56]	@ 0x38
 800f5ba:	6363      	str	r3, [r4, #52]	@ 0x34
 800f5bc:	42ae      	cmp	r6, r5
 800f5be:	d021      	beq.n	800f604 <fn_0800F598+0x6c>
 800f5c0:	6965      	ldr	r5, [r4, #20]
 800f5c2:	1945      	adds	r5, r0, r5
 800f5c4:	42ab      	cmp	r3, r5
 800f5c6:	db1a      	blt.n	800f5fe <fn_0800F598+0x66>
 800f5c8:	1a5b      	subs	r3, r3, r1
 800f5ca:	4298      	cmp	r0, r3
 800f5cc:	dd13      	ble.n	800f5f6 <fn_0800F598+0x5e>
 800f5ce:	2354      	movs	r3, #84	@ 0x54
 800f5d0:	5ee3      	ldrsh	r3, [r4, r3]
 800f5d2:	2b00      	cmp	r3, #0
 800f5d4:	dd1c      	ble.n	800f610 <fn_0800F598+0x78>
 800f5d6:	6ce3      	ldr	r3, [r4, #76]	@ 0x4c
 800f5d8:	0399      	lsls	r1, r3, #14
 800f5da:	d415      	bmi.n	800f608 <fn_0800F598+0x70>
 800f5dc:	075b      	lsls	r3, r3, #29
 800f5de:	d50a      	bpl.n	800f5f6 <fn_0800F598+0x5e>
 800f5e0:	2101      	movs	r1, #1
 800f5e2:	4b27      	ldr	r3, [pc, #156]	@ (800f680 <fn_0800F598+0xe8>)
 800f5e4:	54d1      	strb	r1, [r2, r3]
 800f5e6:	4b27      	ldr	r3, [pc, #156]	@ (800f684 <fn_0800F598+0xec>)
 800f5e8:	5cd3      	ldrb	r3, [r2, r3]
 800f5ea:	2b00      	cmp	r3, #0
 800f5ec:	d003      	beq.n	800f5f6 <fn_0800F598+0x5e>
 800f5ee:	4b26      	ldr	r3, [pc, #152]	@ (800f688 <fn_0800F598+0xf0>)
 800f5f0:	58d3      	ldr	r3, [r2, r3]
 800f5f2:	079b      	lsls	r3, r3, #30
 800f5f4:	d01c      	beq.n	800f630 <fn_0800F598+0x98>
 800f5f6:	2001      	movs	r0, #1
 800f5f8:	bc70      	pop	{r4, r5, r6}
 800f5fa:	bc02      	pop	{r1}
 800f5fc:	4708      	bx	r1
 800f5fe:	1a1d      	subs	r5, r3, r0
 800f600:	6165      	str	r5, [r4, #20]
 800f602:	e7e1      	b.n	800f5c8 <fn_0800F598+0x30>
 800f604:	6161      	str	r1, [r4, #20]
 800f606:	e7df      	b.n	800f5c8 <fn_0800F598+0x30>
 800f608:	0020      	movs	r0, r4
 800f60a:	f001 fd55 	bl	80110b8 <fn_080110B8>
 800f60e:	e7f2      	b.n	800f5f6 <fn_0800F598+0x5e>
 800f610:	491e      	ldr	r1, [pc, #120]	@ (800f68c <fn_0800F598+0xf4>)
 800f612:	0020      	movs	r0, r4
 800f614:	f001 fdfa 	bl	801120c <fn_0801120C>
 800f618:	0020      	movs	r0, r4
 800f61a:	f001 fbad 	bl	8010d78 <fn_08010D78>
 800f61e:	2202      	movs	r2, #2
 800f620:	6ce3      	ldr	r3, [r4, #76]	@ 0x4c
 800f622:	4393      	bics	r3, r2
 800f624:	64e3      	str	r3, [r4, #76]	@ 0x4c
 800f626:	2300      	movs	r3, #0
 800f628:	3259      	adds	r2, #89	@ 0x59
 800f62a:	63a3      	str	r3, [r4, #56]	@ 0x38
 800f62c:	54a3      	strb	r3, [r4, r2]
 800f62e:	e7e2      	b.n	800f5f6 <fn_0800F598+0x5e>
 800f630:	0020      	movs	r0, r4
 800f632:	230a      	movs	r3, #10
 800f634:	2200      	movs	r2, #0
 800f636:	2100      	movs	r1, #0
 800f638:	f7fe f9c0 	bl	800d9bc <fn_0800D9BC>
 800f63c:	6ba3      	ldr	r3, [r4, #56]	@ 0x38
 800f63e:	0fda      	lsrs	r2, r3, #31
 800f640:	18d2      	adds	r2, r2, r3
 800f642:	6963      	ldr	r3, [r4, #20]
 800f644:	1052      	asrs	r2, r2, #1
 800f646:	340c      	adds	r4, #12
 800f648:	cc03      	ldmia	r4!, {r0, r1}
 800f64a:	18d2      	adds	r2, r2, r3
 800f64c:	2326      	movs	r3, #38	@ 0x26
 800f64e:	f001 fbcd 	bl	8010dec <fn_08010DEC>
 800f652:	0005      	movs	r5, r0
 800f654:	f7f7 fa54 	bl	8006b00 <fn_08006B00>
 800f658:	0004      	movs	r4, r0
 800f65a:	f7f7 fa51 	bl	8006b00 <fn_08006B00>
 800f65e:	1a24      	subs	r4, r4, r0
 800f660:	0324      	lsls	r4, r4, #12
 800f662:	63ec      	str	r4, [r5, #60]	@ 0x3c
 800f664:	f7f7 fa4c 	bl	8006b00 <fn_08006B00>
 800f668:	0004      	movs	r4, r0
 800f66a:	f7f7 fa49 	bl	8006b00 <fn_08006B00>
 800f66e:	1a24      	subs	r4, r4, r0
 800f670:	0324      	lsls	r4, r4, #12
 800f672:	642c      	str	r4, [r5, #64]	@ 0x40
 800f674:	e7bf      	b.n	800f5f6 <fn_0800F598+0x5e>
 800f676:	46c0      	nop			@ (mov r8, r8)
 800f678:	030064c4 	.word	0x030064c4
 800f67c:	000008b4 	.word	0x000008b4
 800f680:	00000927 	.word	0x00000927
 800f684:	00000926 	.word	0x00000926
 800f688:	000010ec 	.word	0x000010ec
 800f68c:	0000037f 	.word	0x0000037f
