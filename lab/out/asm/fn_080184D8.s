fn_080184D8:
 80184d8:	6803      	ldr	r3, [r0, #0]
 80184da:	6842      	ldr	r2, [r0, #4]
 80184dc:	b510      	push	{r4, lr}
 80184de:	6013      	str	r3, [r2, #0]
 80184e0:	605a      	str	r2, [r3, #4]
 80184e2:	6cc3      	ldr	r3, [r0, #76]	@ 0x4c
 80184e4:	00db      	lsls	r3, r3, #3
 80184e6:	d505      	bpl.n	80184f4 <fn_080184D8+0x1c>
 80184e8:	235a      	movs	r3, #90	@ 0x5a
 80184ea:	2289      	movs	r2, #137	@ 0x89
 80184ec:	54c2      	strb	r2, [r0, r3]
 80184ee:	bc10      	pop	{r4}
 80184f0:	bc01      	pop	{r0}
 80184f2:	4700      	bx	r0
 80184f4:	f005 f878 	bl	801d5e8 <fn_0801D5E8>
 80184f8:	e7f9      	b.n	80184ee <fn_080184D8+0x16>
 80184fa:	46c0      	nop			@ (mov r8, r8)
