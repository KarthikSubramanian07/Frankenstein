fn_080039DC:
 80039dc:	4b05      	ldr	r3, [pc, #20]	@ (80039f4 <fn_080039DC+0x18>)
 80039de:	681a      	ldr	r2, [r3, #0]
 80039e0:	2396      	movs	r3, #150	@ 0x96
 80039e2:	b510      	push	{r4, lr}
 80039e4:	009b      	lsls	r3, r3, #2
 80039e6:	54d0      	strb	r0, [r2, r3]
 80039e8:	f7ff fe88 	bl	80036fc <fn_080036FC>
 80039ec:	bc10      	pop	{r4}
 80039ee:	bc01      	pop	{r0}
 80039f0:	4700      	bx	r0
 80039f2:	46c0      	nop			@ (mov r8, r8)
 80039f4:	030064c4 	.word	0x030064c4	@ data_030064C4
