fn_0801D830:
 801d830:	b570      	push	{r4, r5, r6, lr}
 801d832:	000c      	movs	r4, r1
 801d834:	4344      	muls	r4, r0
 801d836:	0011      	movs	r1, r2
 801d838:	0020      	movs	r0, r4
 801d83a:	001a      	movs	r2, r3
 801d83c:	f7ff ff76 	bl	801d72c <fn_0801D72C>
 801d840:	0005      	movs	r5, r0
 801d842:	0022      	movs	r2, r4
 801d844:	2100      	movs	r1, #0
 801d846:	f003 f8fb 	bl	8020a40 <fn_08020A40>
 801d84a:	0028      	movs	r0, r5
 801d84c:	bc70      	pop	{r4, r5, r6}
 801d84e:	bc02      	pop	{r1}
 801d850:	4708      	bx	r1
 801d852:	46c0      	nop			@ (mov r8, r8)
