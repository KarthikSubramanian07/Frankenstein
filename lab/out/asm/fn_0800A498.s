fn_0800A498:
 800a498:	4b08      	ldr	r3, [pc, #32]	@ (800a4bc <fn_0800A498+0x24>)
 800a49a:	681a      	ldr	r2, [r3, #0]
 800a49c:	235a      	movs	r3, #90	@ 0x5a
 800a49e:	b510      	push	{r4, lr}
 800a4a0:	5cc1      	ldrb	r1, [r0, r3]
 800a4a2:	23ea      	movs	r3, #234	@ 0xea
 800a4a4:	00db      	lsls	r3, r3, #3
 800a4a6:	58d3      	ldr	r3, [r2, r3]
 800a4a8:	225c      	movs	r2, #92	@ 0x5c
 800a4aa:	434a      	muls	r2, r1
 800a4ac:	189b      	adds	r3, r3, r2
 800a4ae:	6cda      	ldr	r2, [r3, #76]	@ 0x4c
 800a4b0:	6d01      	ldr	r1, [r0, #80]	@ 0x50
 800a4b2:	f005 fbed 	bl	800fc90 <fn_0800FC90>
 800a4b6:	bc10      	pop	{r4}
 800a4b8:	bc01      	pop	{r0}
 800a4ba:	4700      	bx	r0
 800a4bc:	030064c4 	.word	0x030064c4	@ data_030064C4
