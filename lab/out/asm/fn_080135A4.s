fn_080135A4:
 80135a4:	b510      	push	{r4, lr}
 80135a6:	2108      	movs	r1, #8
 80135a8:	0004      	movs	r4, r0
 80135aa:	6800      	ldr	r0, [r0, #0]
 80135ac:	f006 fe8c 	bl	801a2c8 <fn_0801A2C8>
 80135b0:	4b0e      	ldr	r3, [pc, #56]	@ (80135ec <fn_080135A4+0x48>)
 80135b2:	6819      	ldr	r1, [r3, #0]
 80135b4:	2353      	movs	r3, #83	@ 0x53
 80135b6:	5ce2      	ldrb	r2, [r4, r3]
 80135b8:	4b0d      	ldr	r3, [pc, #52]	@ (80135f0 <fn_080135A4+0x4c>)
 80135ba:	58c9      	ldr	r1, [r1, r3]
 80135bc:	0053      	lsls	r3, r2, #1
 80135be:	189b      	adds	r3, r3, r2
 80135c0:	00db      	lsls	r3, r3, #3
 80135c2:	585b      	ldr	r3, [r3, r1]
 80135c4:	009b      	lsls	r3, r3, #2
 80135c6:	18e3      	adds	r3, r4, r3
 80135c8:	6fda      	ldr	r2, [r3, #124]	@ 0x7c
 80135ca:	3a01      	subs	r2, #1
 80135cc:	67da      	str	r2, [r3, #124]	@ 0x7c
 80135ce:	f7f3 fa97 	bl	8006b00 <fn_08006B00>
 80135d2:	2101      	movs	r1, #1
 80135d4:	4001      	ands	r1, r0
 80135d6:	0020      	movs	r0, r4
 80135d8:	f7ff f97c 	bl	80128d4 <fn_080128D4>
 80135dc:	2122      	movs	r1, #34	@ 0x22
 80135de:	6820      	ldr	r0, [r4, #0]
 80135e0:	f7fe fd9a 	bl	8012118 <fn_08012118>
 80135e4:	bc10      	pop	{r4}
 80135e6:	bc01      	pop	{r0}
 80135e8:	4700      	bx	r0
 80135ea:	46c0      	nop			@ (mov r8, r8)
 80135ec:	030064c4 	.word	0x030064c4
 80135f0:	00000754 	.word	0x00000754
