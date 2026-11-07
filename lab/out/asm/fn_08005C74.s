fn_08005C74:
 8005c74:	20ee      	movs	r0, #238	@ 0xee
 8005c76:	2201      	movs	r2, #1
 8005c78:	4b09      	ldr	r3, [pc, #36]	@ (8005ca0 <fn_08005C74+0x2c>)
 8005c7a:	681b      	ldr	r3, [r3, #0]
 8005c7c:	00c0      	lsls	r0, r0, #3
 8005c7e:	5819      	ldr	r1, [r3, r0]
 8005c80:	1a52      	subs	r2, r2, r1
 8005c82:	b510      	push	{r4, lr}
 8005c84:	501a      	str	r2, [r3, r0]
 8005c86:	2901      	cmp	r1, #1
 8005c88:	d008      	beq.n	8005c9c <fn_08005C74+0x28>
 8005c8a:	4906      	ldr	r1, [pc, #24]	@ (8005ca4 <fn_08005C74+0x30>)
 8005c8c:	22cc      	movs	r2, #204	@ 0xcc
 8005c8e:	0052      	lsls	r2, r2, #1
 8005c90:	5099      	str	r1, [r3, r2]
 8005c92:	f7fd feb1 	bl	80039f8 <fn_080039F8>
 8005c96:	bc10      	pop	{r4}
 8005c98:	bc01      	pop	{r0}
 8005c9a:	4700      	bx	r0
 8005c9c:	4902      	ldr	r1, [pc, #8]	@ (8005ca8 <fn_08005C74+0x34>)
 8005c9e:	e7f5      	b.n	8005c8c <fn_08005C74+0x18>
 8005ca0:	030064c4 	.word	0x030064c4
 8005ca4:	08149ee0 	.word	0x08149ee0
 8005ca8:	08149ed4 	.word	0x08149ed4
