fn_080133B4:
 80133b4:	b510      	push	{r4, lr}
 80133b6:	0004      	movs	r4, r0
 80133b8:	219b      	movs	r1, #155	@ 0x9b
 80133ba:	6800      	ldr	r0, [r0, #0]
 80133bc:	f7fd ff26 	bl	801120c <fn_0801120C>
 80133c0:	2100      	movs	r1, #0
 80133c2:	0020      	movs	r0, r4
 80133c4:	f7ff fa86 	bl	80128d4 <fn_080128D4>
 80133c8:	bc10      	pop	{r4}
 80133ca:	bc01      	pop	{r0}
 80133cc:	4700      	bx	r0
 80133ce:	46c0      	nop			@ (mov r8, r8)
