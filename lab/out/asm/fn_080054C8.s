fn_080054C8:
 80054c8:	22c2      	movs	r2, #194	@ 0xc2
 80054ca:	2002      	movs	r0, #2
 80054cc:	4b0e      	ldr	r3, [pc, #56]	@ (8005508 <fn_080054C8+0x40>)
 80054ce:	681b      	ldr	r3, [r3, #0]
 80054d0:	0052      	lsls	r2, r2, #1
 80054d2:	5899      	ldr	r1, [r3, r2]
 80054d4:	4041      	eors	r1, r0
 80054d6:	5099      	str	r1, [r3, r2]
 80054d8:	4a0c      	ldr	r2, [pc, #48]	@ (800550c <fn_080054C8+0x44>)
 80054da:	589a      	ldr	r2, [r3, r2]
 80054dc:	4208      	tst	r0, r1
 80054de:	d00e      	beq.n	80054fe <fn_080054C8+0x36>
 80054e0:	21eb      	movs	r1, #235	@ 0xeb
 80054e2:	00c9      	lsls	r1, r1, #3
 80054e4:	5859      	ldr	r1, [r3, r1]
 80054e6:	6a48      	ldr	r0, [r1, #36]	@ 0x24
 80054e8:	2184      	movs	r1, #132	@ 0x84
 80054ea:	0049      	lsls	r1, r1, #1
 80054ec:	5058      	str	r0, [r3, r1]
 80054ee:	21d6      	movs	r1, #214	@ 0xd6
 80054f0:	0089      	lsls	r1, r1, #2
 80054f2:	5851      	ldr	r1, [r2, r1]
 80054f4:	1852      	adds	r2, r2, r1
 80054f6:	21cc      	movs	r1, #204	@ 0xcc
 80054f8:	0049      	lsls	r1, r1, #1
 80054fa:	505a      	str	r2, [r3, r1]
 80054fc:	4770      	bx	lr
 80054fe:	21d7      	movs	r1, #215	@ 0xd7
 8005500:	0089      	lsls	r1, r1, #2
 8005502:	5851      	ldr	r1, [r2, r1]
 8005504:	1852      	adds	r2, r2, r1
 8005506:	e7f6      	b.n	80054f6 <fn_080054C8+0x2e>
 8005508:	030064c4 	.word	0x030064c4	@ data_030064C4
 800550c:	0000075c 	.word	0x0000075c
