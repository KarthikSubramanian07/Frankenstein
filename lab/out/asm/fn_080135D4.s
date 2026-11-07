fn_080135D4:
 80135d4:	b510      	push	{r4, lr}
 80135d6:	210e      	movs	r1, #14
 80135d8:	0004      	movs	r4, r0
 80135da:	6800      	ldr	r0, [r0, #0]
 80135dc:	f006 fece 	bl	801a37c <fn_0801A37C>
 80135e0:	4b0a      	ldr	r3, [pc, #40]	@ (801360c <fn_080135D4+0x38>)
 80135e2:	6819      	ldr	r1, [r3, #0]
 80135e4:	2353      	movs	r3, #83	@ 0x53
 80135e6:	5ce2      	ldrb	r2, [r4, r3]
 80135e8:	4b09      	ldr	r3, [pc, #36]	@ (8013610 <fn_080135D4+0x3c>)
 80135ea:	58c9      	ldr	r1, [r1, r3]
 80135ec:	0053      	lsls	r3, r2, #1
 80135ee:	189b      	adds	r3, r3, r2
 80135f0:	00db      	lsls	r3, r3, #3
 80135f2:	585b      	ldr	r3, [r3, r1]
 80135f4:	009b      	lsls	r3, r3, #2
 80135f6:	18e3      	adds	r3, r4, r3
 80135f8:	6fda      	ldr	r2, [r3, #124]	@ 0x7c
 80135fa:	3a01      	subs	r2, #1
 80135fc:	67da      	str	r2, [r3, #124]	@ 0x7c
 80135fe:	2121      	movs	r1, #33	@ 0x21
 8013600:	6820      	ldr	r0, [r4, #0]
 8013602:	f7fe fd89 	bl	8012118 <fn_08012118>
 8013606:	bc10      	pop	{r4}
 8013608:	bc01      	pop	{r0}
 801360a:	4700      	bx	r0
 801360c:	030064c4 	.word	0x030064c4
 8013610:	00000754 	.word	0x00000754
