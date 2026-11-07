fn_0801D7A4:
 801d7a4:	b570      	push	{r4, r5, r6, lr}
 801d7a6:	0005      	movs	r5, r0
 801d7a8:	f003 f824 	bl	80207f4 <fn_080207F4>
 801d7ac:	2800      	cmp	r0, #0
 801d7ae:	d00c      	beq.n	801d7ca <fn_0801D7A4+0x26>
 801d7b0:	2101      	movs	r1, #1
 801d7b2:	2200      	movs	r2, #0
 801d7b4:	3001      	adds	r0, #1
 801d7b6:	f7ff ff61 	bl	801d67c <fn_0801D67C>
 801d7ba:	0029      	movs	r1, r5
 801d7bc:	0004      	movs	r4, r0
 801d7be:	f003 f8df 	bl	8020980 <fn_08020980>
 801d7c2:	0020      	movs	r0, r4
 801d7c4:	bc70      	pop	{r4, r5, r6}
 801d7c6:	bc02      	pop	{r1}
 801d7c8:	4708      	bx	r1
 801d7ca:	2400      	movs	r4, #0
 801d7cc:	e7f9      	b.n	801d7c2 <fn_0801D7A4+0x1e>
 801d7ce:	46c0      	nop			@ (mov r8, r8)
