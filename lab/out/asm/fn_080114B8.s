fn_080114B8:
 80114b8:	2256      	movs	r2, #86	@ 0x56
 80114ba:	b510      	push	{r4, lr}
 80114bc:	5e83      	ldrsh	r3, [r0, r2]
 80114be:	1c59      	adds	r1, r3, #1
 80114c0:	d004      	beq.n	80114cc <fn_080114B8+0x14>
 80114c2:	3b01      	subs	r3, #1
 80114c4:	041b      	lsls	r3, r3, #16
 80114c6:	141b      	asrs	r3, r3, #16
 80114c8:	5283      	strh	r3, [r0, r2]
 80114ca:	d002      	beq.n	80114d2 <fn_080114B8+0x1a>
 80114cc:	bc10      	pop	{r4}
 80114ce:	bc01      	pop	{r0}
 80114d0:	4700      	bx	r0
 80114d2:	6c83      	ldr	r3, [r0, #72]	@ 0x48
 80114d4:	8919      	ldrh	r1, [r3, #8]
 80114d6:	f7ff fe99 	bl	801120c <fn_0801120C>
 80114da:	e7f7      	b.n	80114cc <fn_080114B8+0x14>
