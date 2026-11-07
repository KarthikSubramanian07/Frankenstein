fn_0801D854:
 801d854:	b570      	push	{r4, r5, r6, lr}
 801d856:	0005      	movs	r5, r0
 801d858:	f003 f824 	bl	80208a4 <fn_080208A4>
 801d85c:	2800      	cmp	r0, #0
 801d85e:	d00c      	beq.n	801d87a <fn_0801D854+0x26>
 801d860:	2101      	movs	r1, #1
 801d862:	2200      	movs	r2, #0
 801d864:	3001      	adds	r0, #1
 801d866:	f7ff ff61 	bl	801d72c <fn_0801D72C>
 801d86a:	0029      	movs	r1, r5
 801d86c:	0004      	movs	r4, r0
 801d86e:	f003 f8df 	bl	8020a30 <fn_08020A30>
 801d872:	0020      	movs	r0, r4
 801d874:	bc70      	pop	{r4, r5, r6}
 801d876:	bc02      	pop	{r1}
 801d878:	4708      	bx	r1
 801d87a:	2400      	movs	r4, #0
 801d87c:	e7f9      	b.n	801d872 <fn_0801D854+0x1e>
 801d87e:	46c0      	nop			@ (mov r8, r8)
