fn_08005AB0:
 8005ab0:	b510      	push	{r4, lr}
 8005ab2:	4806      	ldr	r0, [pc, #24]	@ (8005acc <fn_08005AB0+0x1c>)
 8005ab4:	f017 fce4 	bl	801d480 <fn_0801D480>
 8005ab8:	2200      	movs	r2, #0
 8005aba:	0003      	movs	r3, r0
 8005abc:	2126      	movs	r1, #38	@ 0x26
 8005abe:	2036      	movs	r0, #54	@ 0x36
 8005ac0:	f016 fb36 	bl	801c130 <fn_0801C130>
 8005ac4:	bc10      	pop	{r4}
 8005ac6:	bc01      	pop	{r0}
 8005ac8:	4700      	bx	r0
 8005aca:	46c0      	nop			@ (mov r8, r8)
 8005acc:	08149d18 	.word	0x08149d18
