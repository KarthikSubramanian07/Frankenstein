fn_0801CAE4:
 801cae4:	2101      	movs	r1, #1
 801cae6:	b510      	push	{r4, lr}
 801cae8:	4b04      	ldr	r3, [pc, #16]	@ (801cafc <fn_0801CAE4+0x18>)
 801caea:	681a      	ldr	r2, [r3, #0]
 801caec:	4b04      	ldr	r3, [pc, #16]	@ (801cb00 <fn_0801CAE4+0x1c>)
 801caee:	54d1      	strb	r1, [r2, r3]
 801caf0:	f7ff ff7c 	bl	801c9ec <fn_0801C9EC>
 801caf4:	bc10      	pop	{r4}
 801caf6:	bc01      	pop	{r0}
 801caf8:	4700      	bx	r0
 801cafa:	46c0      	nop			@ (mov r8, r8)
 801cafc:	030064c4 	.word	0x030064c4	@ data_030064C4
 801cb00:	00005a98 	.word	0x00005a98
