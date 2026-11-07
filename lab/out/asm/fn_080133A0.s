fn_080133A0:
 80133a0:	22c0      	movs	r2, #192	@ 0xc0
 80133a2:	68cb      	ldr	r3, [r1, #12]
 80133a4:	02d2      	lsls	r2, r2, #11
 80133a6:	189b      	adds	r3, r3, r2
 80133a8:	4a1b      	ldr	r2, [pc, #108]	@ (8013418 <fn_080133A0+0x78>)
 80133aa:	b510      	push	{r4, lr}
 80133ac:	0004      	movs	r4, r0
 80133ae:	60cb      	str	r3, [r1, #12]
 80133b0:	4293      	cmp	r3, r2
 80133b2:	dd1e      	ble.n	80133f2 <fn_080133A0+0x52>
 80133b4:	7903      	ldrb	r3, [r0, #4]
 80133b6:	2b01      	cmp	r3, #1
 80133b8:	d022      	beq.n	8013400 <fn_080133A0+0x60>
 80133ba:	6a83      	ldr	r3, [r0, #40]	@ 0x28
 80133bc:	2b00      	cmp	r3, #0
 80133be:	d01b      	beq.n	80133f8 <fn_080133A0+0x58>
 80133c0:	2354      	movs	r3, #84	@ 0x54
 80133c2:	5cc2      	ldrb	r2, [r0, r3]
 80133c4:	3b01      	subs	r3, #1
 80133c6:	54c2      	strb	r2, [r0, r3]
 80133c8:	2a07      	cmp	r2, #7
 80133ca:	d01d      	beq.n	8013408 <fn_080133A0+0x68>
 80133cc:	4b13      	ldr	r3, [pc, #76]	@ (801341c <fn_080133A0+0x7c>)
 80133ce:	6819      	ldr	r1, [r3, #0]
 80133d0:	4b13      	ldr	r3, [pc, #76]	@ (8013420 <fn_080133A0+0x80>)
 80133d2:	58c9      	ldr	r1, [r1, r3]
 80133d4:	0053      	lsls	r3, r2, #1
 80133d6:	189b      	adds	r3, r3, r2
 80133d8:	00db      	lsls	r3, r3, #3
 80133da:	18cb      	adds	r3, r1, r3
 80133dc:	8899      	ldrh	r1, [r3, #4]
 80133de:	220a      	movs	r2, #10
 80133e0:	2354      	movs	r3, #84	@ 0x54
 80133e2:	54e2      	strb	r2, [r4, r3]
 80133e4:	2282      	movs	r2, #130	@ 0x82
 80133e6:	338c      	adds	r3, #140	@ 0x8c
 80133e8:	0412      	lsls	r2, r2, #16
 80133ea:	0020      	movs	r0, r4
 80133ec:	50e2      	str	r2, [r4, r3]
 80133ee:	f7ff fa17 	bl	8012820 <fn_08012820>
 80133f2:	bc10      	pop	{r4}
 80133f4:	bc01      	pop	{r0}
 80133f6:	4700      	bx	r0
 80133f8:	2100      	movs	r1, #0
 80133fa:	f7ff fa11 	bl	8012820 <fn_08012820>
 80133fe:	e7f8      	b.n	80133f2 <fn_080133A0+0x52>
 8013400:	2380      	movs	r3, #128	@ 0x80
 8013402:	041b      	lsls	r3, r3, #16
 8013404:	60cb      	str	r3, [r1, #12]
 8013406:	e7f4      	b.n	80133f2 <fn_080133A0+0x52>
 8013408:	210a      	movs	r1, #10
 801340a:	6800      	ldr	r0, [r0, #0]
 801340c:	f006 ffb6 	bl	801a37c <fn_0801A37C>
 8013410:	2354      	movs	r3, #84	@ 0x54
 8013412:	5ce2      	ldrb	r2, [r4, r3]
 8013414:	e7da      	b.n	80133cc <fn_080133A0+0x2c>
 8013416:	46c0      	nop			@ (mov r8, r8)
 8013418:	007fffff 	.word	0x007fffff
 801341c:	030064c4 	.word	0x030064c4
 8013420:	00000754 	.word	0x00000754
