fn_0801B728:
 801b728:	b570      	push	{r4, r5, r6, lr}
 801b72a:	4c2c      	ldr	r4, [pc, #176]	@ (801b7dc <fn_0801B728+0xb4>)
 801b72c:	6825      	ldr	r5, [r4, #0]
 801b72e:	f7eb f9f7 	bl	8006b20 <fn_08006B20>
 801b732:	2282      	movs	r2, #130	@ 0x82
 801b734:	4b2a      	ldr	r3, [pc, #168]	@ (801b7e0 <fn_0801B728+0xb8>)
 801b736:	50e8      	str	r0, [r5, r3]
 801b738:	6823      	ldr	r3, [r4, #0]
 801b73a:	5c9a      	ldrb	r2, [r3, r2]
 801b73c:	2a00      	cmp	r2, #0
 801b73e:	d149      	bne.n	801b7d4 <fn_0801B728+0xac>
 801b740:	2234      	movs	r2, #52	@ 0x34
 801b742:	32ff      	adds	r2, #255	@ 0xff
 801b744:	5c99      	ldrb	r1, [r3, r2]
 801b746:	4a27      	ldr	r2, [pc, #156]	@ (801b7e4 <fn_0801B728+0xbc>)
 801b748:	5898      	ldr	r0, [r3, r2]
 801b74a:	004a      	lsls	r2, r1, #1
 801b74c:	1852      	adds	r2, r2, r1
 801b74e:	00d2      	lsls	r2, r2, #3
 801b750:	5812      	ldr	r2, [r2, r0]
 801b752:	2a05      	cmp	r2, #5
 801b754:	d03c      	beq.n	801b7d0 <fn_0801B728+0xa8>
 801b756:	3257      	adds	r2, #87	@ 0x57
 801b758:	0092      	lsls	r2, r2, #2
 801b75a:	189a      	adds	r2, r3, r2
 801b75c:	4922      	ldr	r1, [pc, #136]	@ (801b7e8 <fn_0801B728+0xc0>)
 801b75e:	505a      	str	r2, [r3, r1]
 801b760:	2297      	movs	r2, #151	@ 0x97
 801b762:	0052      	lsls	r2, r2, #1
 801b764:	5c99      	ldrb	r1, [r3, r2]
 801b766:	1e4a      	subs	r2, r1, #1
 801b768:	4191      	sbcs	r1, r2
 801b76a:	2203      	movs	r2, #3
 801b76c:	4249      	negs	r1, r1
 801b76e:	400a      	ands	r2, r1
 801b770:	2132      	movs	r1, #50	@ 0x32
 801b772:	31ff      	adds	r1, #255	@ 0xff
 801b774:	5c59      	ldrb	r1, [r3, r1]
 801b776:	3a01      	subs	r2, #1
 801b778:	2900      	cmp	r1, #0
 801b77a:	d000      	beq.n	801b77e <fn_0801B728+0x56>
 801b77c:	2205      	movs	r2, #5
 801b77e:	491b      	ldr	r1, [pc, #108]	@ (801b7ec <fn_0801B728+0xc4>)
 801b780:	505a      	str	r2, [r3, r1]
 801b782:	222e      	movs	r2, #46	@ 0x2e
 801b784:	32ff      	adds	r2, #255	@ 0xff
 801b786:	5c9a      	ldrb	r2, [r3, r2]
 801b788:	1e51      	subs	r1, r2, #1
 801b78a:	418a      	sbcs	r2, r1
 801b78c:	2198      	movs	r1, #152	@ 0x98
 801b78e:	0049      	lsls	r1, r1, #1
 801b790:	5c59      	ldrb	r1, [r3, r1]
 801b792:	0052      	lsls	r2, r2, #1
 801b794:	3a01      	subs	r2, #1
 801b796:	2900      	cmp	r1, #0
 801b798:	d000      	beq.n	801b79c <fn_0801B728+0x74>
 801b79a:	2204      	movs	r2, #4
 801b79c:	4914      	ldr	r1, [pc, #80]	@ (801b7f0 <fn_0801B728+0xc8>)
 801b79e:	505a      	str	r2, [r3, r1]
 801b7a0:	2296      	movs	r2, #150	@ 0x96
 801b7a2:	2130      	movs	r1, #48	@ 0x30
 801b7a4:	0052      	lsls	r2, r2, #1
 801b7a6:	31ff      	adds	r1, #255	@ 0xff
 801b7a8:	5c9a      	ldrb	r2, [r3, r2]
 801b7aa:	5c59      	ldrb	r1, [r3, r1]
 801b7ac:	3a01      	subs	r2, #1
 801b7ae:	2900      	cmp	r1, #0
 801b7b0:	d000      	beq.n	801b7b4 <fn_0801B728+0x8c>
 801b7b2:	2203      	movs	r2, #3
 801b7b4:	490f      	ldr	r1, [pc, #60]	@ (801b7f4 <fn_0801B728+0xcc>)
 801b7b6:	505a      	str	r2, [r3, r1]
 801b7b8:	f7ff fd6e 	bl	801b298 <fn_0801B298>
 801b7bc:	2284      	movs	r2, #132	@ 0x84
 801b7be:	6823      	ldr	r3, [r4, #0]
 801b7c0:	0052      	lsls	r2, r2, #1
 801b7c2:	5899      	ldr	r1, [r3, r2]
 801b7c4:	22b4      	movs	r2, #180	@ 0xb4
 801b7c6:	01d2      	lsls	r2, r2, #7
 801b7c8:	5099      	str	r1, [r3, r2]
 801b7ca:	bc70      	pop	{r4, r5, r6}
 801b7cc:	bc01      	pop	{r0}
 801b7ce:	4700      	bx	r0
 801b7d0:	4a09      	ldr	r2, [pc, #36]	@ (801b7f8 <fn_0801B728+0xd0>)
 801b7d2:	e7c3      	b.n	801b75c <fn_0801B728+0x34>
 801b7d4:	001a      	movs	r2, r3
 801b7d6:	3290      	adds	r2, #144	@ 0x90
 801b7d8:	e7c0      	b.n	801b75c <fn_0801B728+0x34>
 801b7da:	46c0      	nop			@ (mov r8, r8)
 801b7dc:	030064c4 	.word	0x030064c4
 801b7e0:	00005a24 	.word	0x00005a24
 801b7e4:	00000754 	.word	0x00000754
 801b7e8:	00005794 	.word	0x00005794
 801b7ec:	00005a20 	.word	0x00005a20
 801b7f0:	00005a1c 	.word	0x00005a1c
 801b7f4:	00005a18 	.word	0x00005a18
 801b7f8:	08131e00 	.word	0x08131e00
