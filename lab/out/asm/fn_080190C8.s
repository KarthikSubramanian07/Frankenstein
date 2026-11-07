fn_080190C8:
 80190c8:	b570      	push	{r4, r5, r6, lr}
 80190ca:	0005      	movs	r5, r0
 80190cc:	f004 fa0a 	bl	801d4e4 <fn_0801D4E4>
 80190d0:	0004      	movs	r4, r0
 80190d2:	1c43      	adds	r3, r0, #1
 80190d4:	d008      	beq.n	80190e8 <fn_080190C8+0x20>
 80190d6:	4b07      	ldr	r3, [pc, #28]	@ (80190f4 <fn_080190C8+0x2c>)
 80190d8:	681a      	ldr	r2, [r3, #0]
 80190da:	2388      	movs	r3, #136	@ 0x88
 80190dc:	015b      	lsls	r3, r3, #5
 80190de:	58d0      	ldr	r0, [r2, r3]
 80190e0:	1a20      	subs	r0, r4, r0
 80190e2:	bc70      	pop	{r4, r5, r6}
 80190e4:	bc02      	pop	{r1}
 80190e6:	4708      	bx	r1
 80190e8:	0029      	movs	r1, r5
 80190ea:	4803      	ldr	r0, [pc, #12]	@ (80190f8 <fn_080190C8+0x30>)
 80190ec:	f7e7 fa5c 	bl	80005a8 <fn_080005A8>
 80190f0:	e7f1      	b.n	80190d6 <fn_080190C8+0xe>
 80190f2:	46c0      	nop			@ (mov r8, r8)
 80190f4:	030064c4 	.word	0x030064c4
 80190f8:	0814a414 	.word	0x0814a414
