fn_0801D4E0:
 801d4e0:	2800      	cmp	r0, #0
 801d4e2:	db09      	blt.n	801d4f8 <fn_0801D4E0+0x18>
 801d4e4:	4b05      	ldr	r3, [pc, #20]	@ (801d4fc <fn_0801D4E0+0x1c>)
 801d4e6:	685a      	ldr	r2, [r3, #4]
 801d4e8:	4290      	cmp	r0, r2
 801d4ea:	da05      	bge.n	801d4f8 <fn_0801D4E0+0x18>
 801d4ec:	689a      	ldr	r2, [r3, #8]
 801d4ee:	0100      	lsls	r0, r0, #4
 801d4f0:	1880      	adds	r0, r0, r2
 801d4f2:	18c0      	adds	r0, r0, r3
 801d4f4:	3008      	adds	r0, #8
 801d4f6:	4770      	bx	lr
 801d4f8:	2000      	movs	r0, #0
 801d4fa:	e7fc      	b.n	801d4f6 <fn_0801D4E0+0x16>
 801d4fc:	08156b80 	.word	0x08156b80
