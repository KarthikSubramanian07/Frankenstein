fn_0800A418:
 800a418:	b510      	push	{r4, lr}
 800a41a:	215f      	movs	r1, #95	@ 0x5f
 800a41c:	0004      	movs	r4, r0
 800a41e:	f00f ffad 	bl	801a37c <fn_0801A37C>
 800a422:	225c      	movs	r2, #92	@ 0x5c
 800a424:	5ca3      	ldrb	r3, [r4, r2]
 800a426:	3b01      	subs	r3, #1
 800a428:	061b      	lsls	r3, r3, #24
 800a42a:	0e1b      	lsrs	r3, r3, #24
 800a42c:	54a3      	strb	r3, [r4, r2]
 800a42e:	d102      	bne.n	800a436 <fn_0800A418+0x1e>
 800a430:	0020      	movs	r0, r4
 800a432:	f7fd fc65 	bl	8007d00 <fn_08007D00>
 800a436:	bc10      	pop	{r4}
 800a438:	bc01      	pop	{r0}
 800a43a:	4700      	bx	r0
