fn_0800E09C:
 800e09c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800e09e:	2301      	movs	r3, #1
 800e0a0:	425b      	negs	r3, r3
 800e0a2:	4657      	mov	r7, sl
 800e0a4:	469a      	mov	sl, r3
 800e0a6:	4b26      	ldr	r3, [pc, #152]	@ (800e140 <fn_0800E09C+0xa4>)
 800e0a8:	46de      	mov	lr, fp
 800e0aa:	464e      	mov	r6, r9
 800e0ac:	4645      	mov	r5, r8
 800e0ae:	4683      	mov	fp, r0
 800e0b0:	4698      	mov	r8, r3
 800e0b2:	2326      	movs	r3, #38	@ 0x26
 800e0b4:	4651      	mov	r1, sl
 800e0b6:	4658      	mov	r0, fp
 800e0b8:	b5e0      	push	{r5, r6, r7, lr}
 800e0ba:	4699      	mov	r9, r3
 800e0bc:	f006 ffe2 	bl	8015084 <fn_08015084>
 800e0c0:	4682      	mov	sl, r0
 800e0c2:	2800      	cmp	r0, #0
 800e0c4:	db33      	blt.n	800e12e <fn_0800E09C+0x92>
 800e0c6:	4643      	mov	r3, r8
 800e0c8:	21df      	movs	r1, #223	@ 0xdf
 800e0ca:	681a      	ldr	r2, [r3, #0]
 800e0cc:	4653      	mov	r3, sl
 800e0ce:	0109      	lsls	r1, r1, #4
 800e0d0:	009b      	lsls	r3, r3, #2
 800e0d2:	5855      	ldr	r5, [r2, r1]
 800e0d4:	4453      	add	r3, sl
 800e0d6:	00db      	lsls	r3, r3, #3
 800e0d8:	18ed      	adds	r5, r5, r3
 800e0da:	464b      	mov	r3, r9
 800e0dc:	5cee      	ldrb	r6, [r5, r3]
 800e0de:	211e      	movs	r1, #30
 800e0e0:	5e6b      	ldrsh	r3, [r5, r1]
 800e0e2:	2b00      	cmp	r3, #0
 800e0e4:	dd1a      	ble.n	800e11c <fn_0800E09C+0x80>
 800e0e6:	27e0      	movs	r7, #224	@ 0xe0
 800e0e8:	2400      	movs	r4, #0
 800e0ea:	013f      	lsls	r7, r7, #4
 800e0ec:	e001      	b.n	800e0f2 <fn_0800E09C+0x56>
 800e0ee:	4643      	mov	r3, r8
 800e0f0:	681a      	ldr	r2, [r3, #0]
 800e0f2:	69ab      	ldr	r3, [r5, #24]
 800e0f4:	0061      	lsls	r1, r4, #1
 800e0f6:	5acb      	ldrh	r3, [r1, r3]
 800e0f8:	59d0      	ldr	r0, [r2, r7]
 800e0fa:	015b      	lsls	r3, r3, #5
 800e0fc:	0029      	movs	r1, r5
 800e0fe:	18c0      	adds	r0, r0, r3
 800e100:	f006 fa4e 	bl	80145a0 <fn_080145A0>
 800e104:	2800      	cmp	r0, #0
 800e106:	d004      	beq.n	800e112 <fn_0800E09C+0x76>
 800e108:	464b      	mov	r3, r9
 800e10a:	5cc3      	ldrb	r3, [r0, r3]
 800e10c:	429e      	cmp	r6, r3
 800e10e:	dd00      	ble.n	800e112 <fn_0800E09C+0x76>
 800e110:	001e      	movs	r6, r3
 800e112:	221e      	movs	r2, #30
 800e114:	5eab      	ldrsh	r3, [r5, r2]
 800e116:	3401      	adds	r4, #1
 800e118:	42a3      	cmp	r3, r4
 800e11a:	dce8      	bgt.n	800e0ee <fn_0800E09C+0x52>
 800e11c:	464b      	mov	r3, r9
 800e11e:	4651      	mov	r1, sl
 800e120:	4658      	mov	r0, fp
 800e122:	54ee      	strb	r6, [r5, r3]
 800e124:	f006 ffae 	bl	8015084 <fn_08015084>
 800e128:	4682      	mov	sl, r0
 800e12a:	2800      	cmp	r0, #0
 800e12c:	dacb      	bge.n	800e0c6 <fn_0800E09C+0x2a>
 800e12e:	2001      	movs	r0, #1
 800e130:	bcf0      	pop	{r4, r5, r6, r7}
 800e132:	46bb      	mov	fp, r7
 800e134:	46b2      	mov	sl, r6
 800e136:	46a9      	mov	r9, r5
 800e138:	46a0      	mov	r8, r4
 800e13a:	bcf8      	pop	{r3, r4, r5, r6, r7}
 800e13c:	bc02      	pop	{r1}
 800e13e:	4708      	bx	r1
 800e140:	030064c4 	.word	0x030064c4	@ data_030064C4
