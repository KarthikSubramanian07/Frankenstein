fn_08005AD0:
 8005ad0:	b510      	push	{r4, lr}
 8005ad2:	480a      	ldr	r0, [pc, #40]	@ (8005afc <fn_08005AD0+0x2c>)
 8005ad4:	f017 fcd4 	bl	801d480 <fn_0801D480>
 8005ad8:	2200      	movs	r2, #0
 8005ada:	0003      	movs	r3, r0
 8005adc:	210e      	movs	r1, #14
 8005ade:	2060      	movs	r0, #96	@ 0x60
 8005ae0:	f016 fb26 	bl	801c130 <fn_0801C130>
 8005ae4:	4806      	ldr	r0, [pc, #24]	@ (8005b00 <fn_08005AD0+0x30>)
 8005ae6:	f017 fccb 	bl	801d480 <fn_0801D480>
 8005aea:	2200      	movs	r2, #0
 8005aec:	0003      	movs	r3, r0
 8005aee:	2126      	movs	r1, #38	@ 0x26
 8005af0:	2036      	movs	r0, #54	@ 0x36
 8005af2:	f016 fb1d 	bl	801c130 <fn_0801C130>
 8005af6:	bc10      	pop	{r4}
 8005af8:	bc01      	pop	{r0}
 8005afa:	4700      	bx	r0
 8005afc:	08149d24 	.word	0x08149d24
 8005b00:	08149d2c 	.word	0x08149d2c
