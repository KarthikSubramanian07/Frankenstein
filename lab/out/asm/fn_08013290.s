fn_08013290:
 8013290:	4b14      	ldr	r3, [pc, #80]	@ (80132e4 <fn_08013290+0x54>)
 8013292:	b510      	push	{r4, lr}
 8013294:	681c      	ldr	r4, [r3, #0]
 8013296:	2353      	movs	r3, #83	@ 0x53
 8013298:	5cc3      	ldrb	r3, [r0, r3]
 801329a:	4913      	ldr	r1, [pc, #76]	@ (80132e8 <fn_08013290+0x58>)
 801329c:	005a      	lsls	r2, r3, #1
 801329e:	5861      	ldr	r1, [r4, r1]
 80132a0:	18d2      	adds	r2, r2, r3
 80132a2:	00d2      	lsls	r2, r2, #3
 80132a4:	1889      	adds	r1, r1, r2
 80132a6:	680a      	ldr	r2, [r1, #0]
 80132a8:	4694      	mov	ip, r2
 80132aa:	0612      	lsls	r2, r2, #24
 80132ac:	0e12      	lsrs	r2, r2, #24
 80132ae:	2b06      	cmp	r3, #6
 80132b0:	d013      	beq.n	80132da <fn_08013290+0x4a>
 80132b2:	3b08      	subs	r3, #8
 80132b4:	425c      	negs	r4, r3
 80132b6:	4163      	adcs	r3, r4
 80132b8:	3301      	adds	r3, #1
 80132ba:	2a05      	cmp	r2, #5
 80132bc:	d00a      	beq.n	80132d4 <fn_08013290+0x44>
 80132be:	22ff      	movs	r2, #255	@ 0xff
 80132c0:	4664      	mov	r4, ip
 80132c2:	4022      	ands	r2, r4
 80132c4:	0092      	lsls	r2, r2, #2
 80132c6:	1882      	adds	r2, r0, r2
 80132c8:	6fd2      	ldr	r2, [r2, #124]	@ 0x7c
 80132ca:	429a      	cmp	r2, r3
 80132cc:	da02      	bge.n	80132d4 <fn_08013290+0x44>
 80132ce:	8909      	ldrh	r1, [r1, #8]
 80132d0:	f7ff faa6 	bl	8012820 <fn_08012820>
 80132d4:	bc10      	pop	{r4}
 80132d6:	bc01      	pop	{r0}
 80132d8:	4700      	bx	r0
 80132da:	23eb      	movs	r3, #235	@ 0xeb
 80132dc:	00db      	lsls	r3, r3, #3
 80132de:	58e3      	ldr	r3, [r4, r3]
 80132e0:	6b1b      	ldr	r3, [r3, #48]	@ 0x30
 80132e2:	e7ea      	b.n	80132ba <fn_08013290+0x2a>
 80132e4:	030064c4 	.word	0x030064c4
 80132e8:	00000754 	.word	0x00000754
