fn_0801B7D8:
 801b7d8:	b570      	push	{r4, r5, r6, lr}
 801b7da:	4c2c      	ldr	r4, [pc, #176]	@ (801b88c <fn_0801B7D8+0xb4>)
 801b7dc:	6825      	ldr	r5, [r4, #0]
 801b7de:	f7eb f99f 	bl	8006b20 <fn_08006B20>
 801b7e2:	2282      	movs	r2, #130	@ 0x82
 801b7e4:	4b2a      	ldr	r3, [pc, #168]	@ (801b890 <fn_0801B7D8+0xb8>)
 801b7e6:	50e8      	str	r0, [r5, r3]
 801b7e8:	6823      	ldr	r3, [r4, #0]
 801b7ea:	5c9a      	ldrb	r2, [r3, r2]
 801b7ec:	2a00      	cmp	r2, #0
 801b7ee:	d149      	bne.n	801b884 <fn_0801B7D8+0xac>
 801b7f0:	2234      	movs	r2, #52	@ 0x34
 801b7f2:	32ff      	adds	r2, #255	@ 0xff
 801b7f4:	5c99      	ldrb	r1, [r3, r2]
 801b7f6:	4a27      	ldr	r2, [pc, #156]	@ (801b894 <fn_0801B7D8+0xbc>)
 801b7f8:	5898      	ldr	r0, [r3, r2]
 801b7fa:	004a      	lsls	r2, r1, #1
 801b7fc:	1852      	adds	r2, r2, r1
 801b7fe:	00d2      	lsls	r2, r2, #3
 801b800:	5812      	ldr	r2, [r2, r0]
 801b802:	2a05      	cmp	r2, #5
 801b804:	d03c      	beq.n	801b880 <fn_0801B7D8+0xa8>
 801b806:	3257      	adds	r2, #87	@ 0x57
 801b808:	0092      	lsls	r2, r2, #2
 801b80a:	189a      	adds	r2, r3, r2
 801b80c:	4922      	ldr	r1, [pc, #136]	@ (801b898 <fn_0801B7D8+0xc0>)
 801b80e:	505a      	str	r2, [r3, r1]
 801b810:	2296      	movs	r2, #150	@ 0x96
 801b812:	2130      	movs	r1, #48	@ 0x30
 801b814:	0052      	lsls	r2, r2, #1
 801b816:	31ff      	adds	r1, #255	@ 0xff
 801b818:	5c9a      	ldrb	r2, [r3, r2]
 801b81a:	5c59      	ldrb	r1, [r3, r1]
 801b81c:	3a01      	subs	r2, #1
 801b81e:	2900      	cmp	r1, #0
 801b820:	d000      	beq.n	801b824 <fn_0801B7D8+0x4c>
 801b822:	2203      	movs	r2, #3
 801b824:	491d      	ldr	r1, [pc, #116]	@ (801b89c <fn_0801B7D8+0xc4>)
 801b826:	505a      	str	r2, [r3, r1]
 801b828:	222e      	movs	r2, #46	@ 0x2e
 801b82a:	32ff      	adds	r2, #255	@ 0xff
 801b82c:	5c9a      	ldrb	r2, [r3, r2]
 801b82e:	1e51      	subs	r1, r2, #1
 801b830:	418a      	sbcs	r2, r1
 801b832:	2198      	movs	r1, #152	@ 0x98
 801b834:	0049      	lsls	r1, r1, #1
 801b836:	5c59      	ldrb	r1, [r3, r1]
 801b838:	0052      	lsls	r2, r2, #1
 801b83a:	3a01      	subs	r2, #1
 801b83c:	2900      	cmp	r1, #0
 801b83e:	d000      	beq.n	801b842 <fn_0801B7D8+0x6a>
 801b840:	2204      	movs	r2, #4
 801b842:	4917      	ldr	r1, [pc, #92]	@ (801b8a0 <fn_0801B7D8+0xc8>)
 801b844:	505a      	str	r2, [r3, r1]
 801b846:	2297      	movs	r2, #151	@ 0x97
 801b848:	0052      	lsls	r2, r2, #1
 801b84a:	5c99      	ldrb	r1, [r3, r2]
 801b84c:	1e4a      	subs	r2, r1, #1
 801b84e:	4191      	sbcs	r1, r2
 801b850:	2203      	movs	r2, #3
 801b852:	4249      	negs	r1, r1
 801b854:	400a      	ands	r2, r1
 801b856:	2132      	movs	r1, #50	@ 0x32
 801b858:	31ff      	adds	r1, #255	@ 0xff
 801b85a:	5c59      	ldrb	r1, [r3, r1]
 801b85c:	3a01      	subs	r2, #1
 801b85e:	2900      	cmp	r1, #0
 801b860:	d000      	beq.n	801b864 <fn_0801B7D8+0x8c>
 801b862:	2205      	movs	r2, #5
 801b864:	490f      	ldr	r1, [pc, #60]	@ (801b8a4 <fn_0801B7D8+0xcc>)
 801b866:	505a      	str	r2, [r3, r1]
 801b868:	f7ff fd70 	bl	801b34c <fn_0801B34C>
 801b86c:	2284      	movs	r2, #132	@ 0x84
 801b86e:	6823      	ldr	r3, [r4, #0]
 801b870:	0052      	lsls	r2, r2, #1
 801b872:	5899      	ldr	r1, [r3, r2]
 801b874:	22b4      	movs	r2, #180	@ 0xb4
 801b876:	01d2      	lsls	r2, r2, #7
 801b878:	5099      	str	r1, [r3, r2]
 801b87a:	bc70      	pop	{r4, r5, r6}
 801b87c:	bc01      	pop	{r0}
 801b87e:	4700      	bx	r0
 801b880:	4a09      	ldr	r2, [pc, #36]	@ (801b8a8 <fn_0801B7D8+0xd0>)
 801b882:	e7c3      	b.n	801b80c <fn_0801B7D8+0x34>
 801b884:	001a      	movs	r2, r3
 801b886:	3290      	adds	r2, #144	@ 0x90
 801b888:	e7c0      	b.n	801b80c <fn_0801B7D8+0x34>
 801b88a:	46c0      	nop			@ (mov r8, r8)
 801b88c:	030064c4 	.word	0x030064c4
 801b890:	00005a24 	.word	0x00005a24
 801b894:	00000754 	.word	0x00000754
 801b898:	00005794 	.word	0x00005794
 801b89c:	00005a18 	.word	0x00005a18
 801b8a0:	00005a1c 	.word	0x00005a1c
 801b8a4:	00005a20 	.word	0x00005a20
 801b8a8:	08131ed4 	.word	0x08131ed4
