fn_08005AD0:
 8005ad0:	b510      	push	{r4, lr}
 8005ad2:	480a      	ldr	r0, [pc, #40]	@ (8005afc <fn_08005AD0+0x2c>)
 8005ad4:	f017 fd2c 	bl	801d530 <fn_0801D530>
 8005ad8:	2200      	movs	r2, #0
 8005ada:	0003      	movs	r3, r0
 8005adc:	210e      	movs	r1, #14
 8005ade:	2060      	movs	r0, #96	@ 0x60
 8005ae0:	f016 fb7e 	bl	801c1e0 <fn_0801C1E0>
 8005ae4:	4806      	ldr	r0, [pc, #24]	@ (8005b00 <fn_08005AD0+0x30>)
 8005ae6:	f017 fd23 	bl	801d530 <fn_0801D530>
 8005aea:	2200      	movs	r2, #0
 8005aec:	0003      	movs	r3, r0
 8005aee:	2126      	movs	r1, #38	@ 0x26
 8005af0:	2036      	movs	r0, #54	@ 0x36
 8005af2:	f016 fb75 	bl	801c1e0 <fn_0801C1E0>
 8005af6:	bc10      	pop	{r4}
 8005af8:	bc01      	pop	{r0}
 8005afa:	4700      	bx	r0
 8005afc:	08149df8 	.word	0x08149df8
 8005b00:	08149e00 	.word	0x08149e00
