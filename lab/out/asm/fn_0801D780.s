fn_0801D780:
 801d780:	b570      	push	{r4, r5, r6, lr}
 801d782:	000c      	movs	r4, r1
 801d784:	4344      	muls	r4, r0
 801d786:	0011      	movs	r1, r2
 801d788:	0020      	movs	r0, r4
 801d78a:	001a      	movs	r2, r3
 801d78c:	f7ff ff76 	bl	801d67c <fn_0801D67C>
 801d790:	0005      	movs	r5, r0
 801d792:	0022      	movs	r2, r4
 801d794:	2100      	movs	r1, #0
 801d796:	f003 f8fb 	bl	8020990 <fn_08020990>
 801d79a:	0028      	movs	r0, r5
 801d79c:	bc70      	pop	{r4, r5, r6}
 801d79e:	bc02      	pop	{r1}
 801d7a0:	4708      	bx	r1
 801d7a2:	46c0      	nop			@ (mov r8, r8)
