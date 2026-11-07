fn_0800A578:
 800a578:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800a57a:	4647      	mov	r7, r8
 800a57c:	46ce      	mov	lr, r9
 800a57e:	b580      	push	{r7, lr}
 800a580:	7b43      	ldrb	r3, [r0, #13]
 800a582:	6905      	ldr	r5, [r0, #16]
 800a584:	6a82      	ldr	r2, [r0, #40]	@ 0x28
 800a586:	6a47      	ldr	r7, [r0, #36]	@ 0x24
 800a588:	0004      	movs	r4, r0
 800a58a:	4698      	mov	r8, r3
 800a58c:	6943      	ldr	r3, [r0, #20]
 800a58e:	20d6      	movs	r0, #214	@ 0xd6
 800a590:	469c      	mov	ip, r3
 800a592:	4e5a      	ldr	r6, [pc, #360]	@ (800a6fc <fn_0800A578+0x184>)
 800a594:	6831      	ldr	r1, [r6, #0]
 800a596:	0100      	lsls	r0, r0, #4
 800a598:	580b      	ldr	r3, [r1, r0]
 800a59a:	3301      	adds	r3, #1
 800a59c:	500b      	str	r3, [r1, r0]
 800a59e:	4663      	mov	r3, ip
 800a5a0:	3301      	adds	r3, #1
 800a5a2:	d024      	beq.n	800a5ee <fn_0800A578+0x76>
 800a5a4:	4663      	mov	r3, ip
 800a5a6:	2b01      	cmp	r3, #1
 800a5a8:	d009      	beq.n	800a5be <fn_0800A578+0x46>
 800a5aa:	4b55      	ldr	r3, [pc, #340]	@ (800a700 <fn_0800A578+0x188>)
 800a5ac:	58cb      	ldr	r3, [r1, r3]
 800a5ae:	075b      	lsls	r3, r3, #29
 800a5b0:	d02f      	beq.n	800a612 <fn_0800A578+0x9a>
 800a5b2:	bcc0      	pop	{r6, r7}
 800a5b4:	46b9      	mov	r9, r7
 800a5b6:	46b0      	mov	r8, r6
 800a5b8:	bcf8      	pop	{r3, r4, r5, r6, r7}
 800a5ba:	bc01      	pop	{r0}
 800a5bc:	4700      	bx	r0
 800a5be:	686b      	ldr	r3, [r5, #4]
 800a5c0:	42bb      	cmp	r3, r7
 800a5c2:	dc24      	bgt.n	800a60e <fn_0800A578+0x96>
 800a5c4:	682f      	ldr	r7, [r5, #0]
 800a5c6:	19d2      	adds	r2, r2, r7
 800a5c8:	4293      	cmp	r3, r2
 800a5ca:	db27      	blt.n	800a61c <fn_0800A578+0xa4>
 800a5cc:	4641      	mov	r1, r8
 800a5ce:	0028      	movs	r0, r5
 800a5d0:	602a      	str	r2, [r5, #0]
 800a5d2:	f005 fba9 	bl	800fd28 <fn_0800FD28>
 800a5d6:	2800      	cmp	r0, #0
 800a5d8:	d16b      	bne.n	800a6b2 <fn_0800A578+0x13a>
 800a5da:	6832      	ldr	r2, [r6, #0]
 800a5dc:	4b48      	ldr	r3, [pc, #288]	@ (800a700 <fn_0800A578+0x188>)
 800a5de:	58d3      	ldr	r3, [r2, r3]
 800a5e0:	075b      	lsls	r3, r3, #29
 800a5e2:	d1e6      	bne.n	800a5b2 <fn_0800A578+0x3a>
 800a5e4:	2116      	movs	r1, #22
 800a5e6:	6920      	ldr	r0, [r4, #16]
 800a5e8:	f00a ffba 	bl	8015560 <fn_08015560>
 800a5ec:	e7e1      	b.n	800a5b2 <fn_0800A578+0x3a>
 800a5ee:	682b      	ldr	r3, [r5, #0]
 800a5f0:	4699      	mov	r9, r3
 800a5f2:	1a9a      	subs	r2, r3, r2
 800a5f4:	4297      	cmp	r7, r2
 800a5f6:	dc52      	bgt.n	800a69e <fn_0800A578+0x126>
 800a5f8:	602a      	str	r2, [r5, #0]
 800a5fa:	4641      	mov	r1, r8
 800a5fc:	0028      	movs	r0, r5
 800a5fe:	f005 fb93 	bl	800fd28 <fn_0800FD28>
 800a602:	6832      	ldr	r2, [r6, #0]
 800a604:	4b3e      	ldr	r3, [pc, #248]	@ (800a700 <fn_0800A578+0x188>)
 800a606:	58d3      	ldr	r3, [r2, r3]
 800a608:	075b      	lsls	r3, r3, #29
 800a60a:	d1d2      	bne.n	800a5b2 <fn_0800A578+0x3a>
 800a60c:	e7ea      	b.n	800a5e4 <fn_0800A578+0x6c>
 800a60e:	003b      	movs	r3, r7
 800a610:	e7d8      	b.n	800a5c4 <fn_0800A578+0x4c>
 800a612:	2116      	movs	r1, #22
 800a614:	0028      	movs	r0, r5
 800a616:	f00a ffa3 	bl	8015560 <fn_08015560>
 800a61a:	e7ca      	b.n	800a5b2 <fn_0800A578+0x3a>
 800a61c:	4641      	mov	r1, r8
 800a61e:	0028      	movs	r0, r5
 800a620:	602b      	str	r3, [r5, #0]
 800a622:	f005 fb81 	bl	800fd28 <fn_0800FD28>
 800a626:	2800      	cmp	r0, #0
 800a628:	d159      	bne.n	800a6de <fn_0800A578+0x166>
 800a62a:	6832      	ldr	r2, [r6, #0]
 800a62c:	4b34      	ldr	r3, [pc, #208]	@ (800a700 <fn_0800A578+0x188>)
 800a62e:	58d3      	ldr	r3, [r2, r3]
 800a630:	075b      	lsls	r3, r3, #29
 800a632:	d05e      	beq.n	800a6f2 <fn_0800A578+0x17a>
 800a634:	6963      	ldr	r3, [r4, #20]
 800a636:	6922      	ldr	r2, [r4, #16]
 800a638:	2b01      	cmp	r3, #1
 800a63a:	d00b      	beq.n	800a654 <fn_0800A578+0xdc>
 800a63c:	3301      	adds	r3, #1
 800a63e:	d015      	beq.n	800a66c <fn_0800A578+0xf4>
 800a640:	2300      	movs	r3, #0
 800a642:	0020      	movs	r0, r4
 800a644:	6113      	str	r3, [r2, #16]
 800a646:	f00d ffd3 	bl	80185f0 <fn_080185F0>
 800a64a:	2113      	movs	r1, #19
 800a64c:	6920      	ldr	r0, [r4, #16]
 800a64e:	f00a ff87 	bl	8015560 <fn_08015560>
 800a652:	e7ae      	b.n	800a5b2 <fn_0800A578+0x3a>
 800a654:	7b21      	ldrb	r1, [r4, #12]
 800a656:	2912      	cmp	r1, #18
 800a658:	d01d      	beq.n	800a696 <fn_0800A578+0x11e>
 800a65a:	d82c      	bhi.n	800a6b6 <fn_0800A578+0x13e>
 800a65c:	290f      	cmp	r1, #15
 800a65e:	d1ef      	bne.n	800a640 <fn_0800A578+0xc8>
 800a660:	69a3      	ldr	r3, [r4, #24]
 800a662:	8413      	strh	r3, [r2, #32]
 800a664:	2324      	movs	r3, #36	@ 0x24
 800a666:	8c21      	ldrh	r1, [r4, #32]
 800a668:	54d1      	strb	r1, [r2, r3]
 800a66a:	e7e9      	b.n	800a640 <fn_0800A578+0xc8>
 800a66c:	7b23      	ldrb	r3, [r4, #12]
 800a66e:	2b12      	cmp	r3, #18
 800a670:	d011      	beq.n	800a696 <fn_0800A578+0x11e>
 800a672:	d931      	bls.n	800a6d8 <fn_0800A578+0x160>
 800a674:	3b13      	subs	r3, #19
 800a676:	061b      	lsls	r3, r3, #24
 800a678:	0e1b      	lsrs	r3, r3, #24
 800a67a:	2b01      	cmp	r3, #1
 800a67c:	d8e0      	bhi.n	800a640 <fn_0800A578+0xc8>
 800a67e:	2027      	movs	r0, #39	@ 0x27
 800a680:	2101      	movs	r1, #1
 800a682:	2504      	movs	r5, #4
 800a684:	69a3      	ldr	r3, [r4, #24]
 800a686:	8413      	strh	r3, [r2, #32]
 800a688:	69e3      	ldr	r3, [r4, #28]
 800a68a:	4019      	ands	r1, r3
 800a68c:	5c13      	ldrb	r3, [r2, r0]
 800a68e:	0089      	lsls	r1, r1, #2
 800a690:	43ab      	bics	r3, r5
 800a692:	430b      	orrs	r3, r1
 800a694:	5413      	strb	r3, [r2, r0]
 800a696:	2324      	movs	r3, #36	@ 0x24
 800a698:	8c21      	ldrh	r1, [r4, #32]
 800a69a:	54d1      	strb	r1, [r2, r3]
 800a69c:	e7d0      	b.n	800a640 <fn_0800A578+0xc8>
 800a69e:	4641      	mov	r1, r8
 800a6a0:	0028      	movs	r0, r5
 800a6a2:	602f      	str	r7, [r5, #0]
 800a6a4:	f005 fb40 	bl	800fd28 <fn_0800FD28>
 800a6a8:	2800      	cmp	r0, #0
 800a6aa:	d0be      	beq.n	800a62a <fn_0800A578+0xb2>
 800a6ac:	464b      	mov	r3, r9
 800a6ae:	602b      	str	r3, [r5, #0]
 800a6b0:	e016      	b.n	800a6e0 <fn_0800A578+0x168>
 800a6b2:	602f      	str	r7, [r5, #0]
 800a6b4:	e7a1      	b.n	800a5fa <fn_0800A578+0x82>
 800a6b6:	3913      	subs	r1, #19
 800a6b8:	0609      	lsls	r1, r1, #24
 800a6ba:	0e09      	lsrs	r1, r1, #24
 800a6bc:	2901      	cmp	r1, #1
 800a6be:	d8bf      	bhi.n	800a640 <fn_0800A578+0xc8>
 800a6c0:	2027      	movs	r0, #39	@ 0x27
 800a6c2:	2504      	movs	r5, #4
 800a6c4:	69a1      	ldr	r1, [r4, #24]
 800a6c6:	8411      	strh	r1, [r2, #32]
 800a6c8:	69e1      	ldr	r1, [r4, #28]
 800a6ca:	400b      	ands	r3, r1
 800a6cc:	5c11      	ldrb	r1, [r2, r0]
 800a6ce:	009b      	lsls	r3, r3, #2
 800a6d0:	43a9      	bics	r1, r5
 800a6d2:	430b      	orrs	r3, r1
 800a6d4:	5413      	strb	r3, [r2, r0]
 800a6d6:	e7de      	b.n	800a696 <fn_0800A578+0x11e>
 800a6d8:	2b09      	cmp	r3, #9
 800a6da:	d0d0      	beq.n	800a67e <fn_0800A578+0x106>
 800a6dc:	e7b0      	b.n	800a640 <fn_0800A578+0xc8>
 800a6de:	602f      	str	r7, [r5, #0]
 800a6e0:	4641      	mov	r1, r8
 800a6e2:	0028      	movs	r0, r5
 800a6e4:	f005 fb20 	bl	800fd28 <fn_0800FD28>
 800a6e8:	6832      	ldr	r2, [r6, #0]
 800a6ea:	4b05      	ldr	r3, [pc, #20]	@ (800a700 <fn_0800A578+0x188>)
 800a6ec:	58d3      	ldr	r3, [r2, r3]
 800a6ee:	075b      	lsls	r3, r3, #29
 800a6f0:	d1a0      	bne.n	800a634 <fn_0800A578+0xbc>
 800a6f2:	2116      	movs	r1, #22
 800a6f4:	6920      	ldr	r0, [r4, #16]
 800a6f6:	f00a ff33 	bl	8015560 <fn_08015560>
 800a6fa:	e79b      	b.n	800a634 <fn_0800A578+0xbc>
 800a6fc:	030064c4 	.word	0x030064c4
 800a700:	000010ec 	.word	0x000010ec
