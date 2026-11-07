fn_0801CB94:
 801cb94:	2101      	movs	r1, #1
 801cb96:	b510      	push	{r4, lr}
 801cb98:	4b04      	ldr	r3, [pc, #16]	@ (801cbac <fn_0801CB94+0x18>)
 801cb9a:	681a      	ldr	r2, [r3, #0]
 801cb9c:	4b04      	ldr	r3, [pc, #16]	@ (801cbb0 <fn_0801CB94+0x1c>)
 801cb9e:	54d1      	strb	r1, [r2, r3]
 801cba0:	f7ff ff7c 	bl	801ca9c <fn_0801CA9C>
 801cba4:	bc10      	pop	{r4}
 801cba6:	bc01      	pop	{r0}
 801cba8:	4700      	bx	r0
 801cbaa:	46c0      	nop			@ (mov r8, r8)
 801cbac:	030064c4 	.word	0x030064c4
 801cbb0:	00005a98 	.word	0x00005a98
