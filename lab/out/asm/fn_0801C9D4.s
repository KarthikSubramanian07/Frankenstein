fn_0801C9D4:
 801c9d4:	4b07      	ldr	r3, [pc, #28]	@ (801c9f4 <fn_0801C9D4+0x20>)
 801c9d6:	4a08      	ldr	r2, [pc, #32]	@ (801c9f8 <fn_0801C9D4+0x24>)
 801c9d8:	6819      	ldr	r1, [r3, #0]
 801c9da:	588b      	ldr	r3, [r1, r2]
 801c9dc:	3b01      	subs	r3, #1
 801c9de:	b510      	push	{r4, lr}
 801c9e0:	508b      	str	r3, [r1, r2]
 801c9e2:	2b00      	cmp	r3, #0
 801c9e4:	d002      	beq.n	801c9ec <fn_0801C9D4+0x18>
 801c9e6:	bc10      	pop	{r4}
 801c9e8:	bc01      	pop	{r0}
 801c9ea:	4700      	bx	r0
 801c9ec:	f7e6 fdba 	bl	8003564 <fn_08003564>
 801c9f0:	e7f9      	b.n	801c9e6 <fn_0801C9D4+0x12>
 801c9f2:	46c0      	nop			@ (mov r8, r8)
 801c9f4:	030064c4 	.word	0x030064c4
 801c9f8:	00005a48 	.word	0x00005a48
