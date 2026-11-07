fn_08003B18:
 8003b18:	b510      	push	{r4, lr}
 8003b1a:	0004      	movs	r4, r0
 8003b1c:	4b07      	ldr	r3, [pc, #28]	@ (8003b3c <fn_08003B18+0x24>)
 8003b1e:	4808      	ldr	r0, [pc, #32]	@ (8003b40 <fn_08003B18+0x28>)
 8003b20:	681b      	ldr	r3, [r3, #0]
 8003b22:	541c      	strb	r4, [r3, r0]
 8003b24:	3003      	adds	r0, #3
 8003b26:	5019      	str	r1, [r3, r0]
 8003b28:	2195      	movs	r1, #149	@ 0x95
 8003b2a:	0089      	lsls	r1, r1, #2
 8003b2c:	505a      	str	r2, [r3, r1]
 8003b2e:	22d4      	movs	r2, #212	@ 0xd4
 8003b30:	2102      	movs	r1, #2
 8003b32:	5499      	strb	r1, [r3, r2]
 8003b34:	bc10      	pop	{r4}
 8003b36:	bc01      	pop	{r0}
 8003b38:	4700      	bx	r0
 8003b3a:	46c0      	nop			@ (mov r8, r8)
 8003b3c:	030064c4 	.word	0x030064c4
 8003b40:	0000024d 	.word	0x0000024d
