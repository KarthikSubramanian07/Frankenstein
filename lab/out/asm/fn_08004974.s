fn_08004974:
 8004974:	b530      	push	{r4, r5, lr}
 8004976:	4d3a      	ldr	r5, [pc, #232]	@ (8004a60 <fn_08004974+0xec>)
 8004978:	4a3a      	ldr	r2, [pc, #232]	@ (8004a64 <fn_08004974+0xf0>)
 800497a:	682b      	ldr	r3, [r5, #0]
 800497c:	5c99      	ldrb	r1, [r3, r2]
 800497e:	b085      	sub	sp, #20
 8004980:	2900      	cmp	r1, #0
 8004982:	d001      	beq.n	8004988 <fn_08004974+0x14>
 8004984:	2100      	movs	r1, #0
 8004986:	5499      	strb	r1, [r3, r2]
 8004988:	22fb      	movs	r2, #251	@ 0xfb
 800498a:	2100      	movs	r1, #0
 800498c:	0092      	lsls	r2, r2, #2
 800498e:	5299      	strh	r1, [r3, r2]
 8004990:	3a50      	subs	r2, #80	@ 0x50
 8004992:	1898      	adds	r0, r3, r2
 8004994:	3250      	adds	r2, #80	@ 0x50
 8004996:	189a      	adds	r2, r3, r2
 8004998:	9202      	str	r2, [sp, #8]
 800499a:	2299      	movs	r2, #153	@ 0x99
 800499c:	2421      	movs	r4, #33	@ 0x21
 800499e:	0092      	lsls	r2, r2, #2
 80049a0:	189b      	adds	r3, r3, r2
 80049a2:	9300      	str	r3, [sp, #0]
 80049a4:	2200      	movs	r2, #0
 80049a6:	2301      	movs	r3, #1
 80049a8:	9401      	str	r4, [sp, #4]
 80049aa:	f7ff fef5 	bl	8004798 <fn_08004798>
 80049ae:	2299      	movs	r2, #153	@ 0x99
 80049b0:	6828      	ldr	r0, [r5, #0]
 80049b2:	0092      	lsls	r2, r2, #2
 80049b4:	5882      	ldr	r2, [r0, r2]
 80049b6:	2102      	movs	r1, #2
 80049b8:	5e51      	ldrsh	r1, [r2, r1]
 80049ba:	227f      	movs	r2, #127	@ 0x7f
 80049bc:	2399      	movs	r3, #153	@ 0x99
 80049be:	1a52      	subs	r2, r2, r1
 80049c0:	21d8      	movs	r1, #216	@ 0xd8
 80049c2:	009b      	lsls	r3, r3, #2
 80049c4:	0089      	lsls	r1, r1, #2
 80049c6:	18c3      	adds	r3, r0, r3
 80049c8:	9400      	str	r4, [sp, #0]
 80049ca:	1840      	adds	r0, r0, r1
 80049cc:	2100      	movs	r1, #0
 80049ce:	f7ff fe57 	bl	8004680 <fn_08004680>
 80049d2:	23d5      	movs	r3, #213	@ 0xd5
 80049d4:	6828      	ldr	r0, [r5, #0]
 80049d6:	56c3      	ldrsb	r3, [r0, r3]
 80049d8:	2b00      	cmp	r3, #0
 80049da:	d11f      	bne.n	8004a1c <fn_08004974+0xa8>
 80049dc:	4a22      	ldr	r2, [pc, #136]	@ (8004a68 <fn_08004974+0xf4>)
 80049de:	5884      	ldr	r4, [r0, r2]
 80049e0:	22dc      	movs	r2, #220	@ 0xdc
 80049e2:	3394      	adds	r3, #148	@ 0x94
 80049e4:	5cc3      	ldrb	r3, [r0, r3]
 80049e6:	5882      	ldr	r2, [r0, r2]
 80049e8:	2b01      	cmp	r3, #1
 80049ea:	d81e      	bhi.n	8004a2a <fn_08004974+0xb6>
 80049ec:	23d8      	movs	r3, #216	@ 0xd8
 80049ee:	58c1      	ldr	r1, [r0, r3]
 80049f0:	3901      	subs	r1, #1
 80049f2:	00cb      	lsls	r3, r1, #3
 80049f4:	185b      	adds	r3, r3, r1
 80049f6:	189b      	adds	r3, r3, r2
 80049f8:	4a1c      	ldr	r2, [pc, #112]	@ (8004a6c <fn_08004974+0xf8>)
 80049fa:	189b      	adds	r3, r3, r2
 80049fc:	009b      	lsls	r3, r3, #2
 80049fe:	591b      	ldr	r3, [r3, r4]
 8004a00:	18e4      	adds	r4, r4, r3
 8004a02:	7821      	ldrb	r1, [r4, #0]
 8004a04:	2900      	cmp	r1, #0
 8004a06:	d009      	beq.n	8004a1c <fn_08004974+0xa8>
 8004a08:	23d8      	movs	r3, #216	@ 0xd8
 8004a0a:	009b      	lsls	r3, r3, #2
 8004a0c:	3401      	adds	r4, #1
 8004a0e:	18c0      	adds	r0, r0, r3
 8004a10:	f7ff fe42 	bl	8004698 <fn_08004698>
 8004a14:	7821      	ldrb	r1, [r4, #0]
 8004a16:	6828      	ldr	r0, [r5, #0]
 8004a18:	2900      	cmp	r1, #0
 8004a1a:	d1f5      	bne.n	8004a08 <fn_08004974+0x94>
 8004a1c:	2201      	movs	r2, #1
 8004a1e:	4b11      	ldr	r3, [pc, #68]	@ (8004a64 <fn_08004974+0xf0>)
 8004a20:	54c2      	strb	r2, [r0, r3]
 8004a22:	b005      	add	sp, #20
 8004a24:	bc30      	pop	{r4, r5}
 8004a26:	bc01      	pop	{r0}
 8004a28:	4700      	bx	r0
 8004a2a:	2b03      	cmp	r3, #3
 8004a2c:	d0de      	beq.n	80049ec <fn_08004974+0x78>
 8004a2e:	2395      	movs	r3, #149	@ 0x95
 8004a30:	5cc3      	ldrb	r3, [r0, r3]
 8004a32:	2b02      	cmp	r3, #2
 8004a34:	d007      	beq.n	8004a46 <fn_08004974+0xd2>
 8004a36:	2b03      	cmp	r3, #3
 8004a38:	d00b      	beq.n	8004a52 <fn_08004974+0xde>
 8004a3a:	4b0d      	ldr	r3, [pc, #52]	@ (8004a70 <fn_08004974+0xfc>)
 8004a3c:	18d2      	adds	r2, r2, r3
 8004a3e:	0092      	lsls	r2, r2, #2
 8004a40:	5913      	ldr	r3, [r2, r4]
 8004a42:	18e4      	adds	r4, r4, r3
 8004a44:	e7dd      	b.n	8004a02 <fn_08004974+0x8e>
 8004a46:	4b0b      	ldr	r3, [pc, #44]	@ (8004a74 <fn_08004974+0x100>)
 8004a48:	18d2      	adds	r2, r2, r3
 8004a4a:	0092      	lsls	r2, r2, #2
 8004a4c:	5913      	ldr	r3, [r2, r4]
 8004a4e:	18e4      	adds	r4, r4, r3
 8004a50:	e7d7      	b.n	8004a02 <fn_08004974+0x8e>
 8004a52:	4b09      	ldr	r3, [pc, #36]	@ (8004a78 <fn_08004974+0x104>)
 8004a54:	18d2      	adds	r2, r2, r3
 8004a56:	0092      	lsls	r2, r2, #2
 8004a58:	5913      	ldr	r3, [r2, r4]
 8004a5a:	18e4      	adds	r4, r4, r3
 8004a5c:	e7d1      	b.n	8004a02 <fn_08004974+0x8e>
 8004a5e:	46c0      	nop			@ (mov r8, r8)
 8004a60:	030064c4 	.word	0x030064c4
 8004a64:	000003ee 	.word	0x000003ee
 8004a68:	0000075c 	.word	0x0000075c
 8004a6c:	4000002a 	.word	0x4000002a
 8004a70:	4000004e 	.word	0x4000004e
 8004a74:	4000008e 	.word	0x4000008e
 8004a78:	4000006e 	.word	0x4000006e
