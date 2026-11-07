fn_0800DF94:
 800df94:	b570      	push	{r4, r5, r6, lr}
 800df96:	2200      	movs	r2, #0
 800df98:	0005      	movs	r5, r0
 800df9a:	2103      	movs	r1, #3
 800df9c:	201c      	movs	r0, #28
 800df9e:	f00f fb6d 	bl	801d67c <fn_0801D67C>
 800dfa2:	0004      	movs	r4, r0
 800dfa4:	2626      	movs	r6, #38	@ 0x26
 800dfa6:	221c      	movs	r2, #28
 800dfa8:	2100      	movs	r1, #0
 800dfaa:	f012 fcf1 	bl	8020990 <fn_08020990>
 800dfae:	0020      	movs	r0, r4
 800dfb0:	f00a fab4 	bl	801851c <fn_0801851C>
 800dfb4:	60e5      	str	r5, [r4, #12]
 800dfb6:	0028      	movs	r0, r5
 800dfb8:	5da9      	ldrb	r1, [r5, r6]
 800dfba:	f007 f8b1 	bl	8015120 <fn_08015120>
 800dfbe:	6120      	str	r0, [r4, #16]
 800dfc0:	5dab      	ldrb	r3, [r5, r6]
 800dfc2:	6163      	str	r3, [r4, #20]
 800dfc4:	4b05      	ldr	r3, [pc, #20]	@ (800dfdc <fn_0800DF94+0x48>)
 800dfc6:	60a3      	str	r3, [r4, #8]
 800dfc8:	2301      	movs	r3, #1
 800dfca:	221f      	movs	r2, #31
 800dfcc:	425b      	negs	r3, r3
 800dfce:	61a3      	str	r3, [r4, #24]
 800dfd0:	8c2b      	ldrh	r3, [r5, #32]
 800dfd2:	4393      	bics	r3, r2
 800dfd4:	842b      	strh	r3, [r5, #32]
 800dfd6:	bc70      	pop	{r4, r5, r6}
 800dfd8:	bc01      	pop	{r0}
 800dfda:	4700      	bx	r0
 800dfdc:	0800ddc5 	.word	0x0800ddc5
