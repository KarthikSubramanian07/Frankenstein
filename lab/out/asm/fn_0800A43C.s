fn_0800A43C:
 800a43c:	225c      	movs	r2, #92	@ 0x5c
 800a43e:	b510      	push	{r4, lr}
 800a440:	5c83      	ldrb	r3, [r0, r2]
 800a442:	3b01      	subs	r3, #1
 800a444:	061b      	lsls	r3, r3, #24
 800a446:	0e1b      	lsrs	r3, r3, #24
 800a448:	5483      	strb	r3, [r0, r2]
 800a44a:	d101      	bne.n	800a450 <fn_0800A43C+0x14>
 800a44c:	f7fd fc58 	bl	8007d00 <fn_08007D00>
 800a450:	bc10      	pop	{r4}
 800a452:	bc01      	pop	{r0}
 800a454:	4700      	bx	r0
 800a456:	46c0      	nop			@ (mov r8, r8)
