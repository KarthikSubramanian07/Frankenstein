fn_0801D618:
 801d618:	2800      	cmp	r0, #0
 801d61a:	db09      	blt.n	801d630 <fn_0801D618+0x18>
 801d61c:	4b05      	ldr	r3, [pc, #20]	@ (801d634 <fn_0801D618+0x1c>)
 801d61e:	685a      	ldr	r2, [r3, #4]
 801d620:	4290      	cmp	r0, r2
 801d622:	da05      	bge.n	801d630 <fn_0801D618+0x18>
 801d624:	689a      	ldr	r2, [r3, #8]
 801d626:	0100      	lsls	r0, r0, #4
 801d628:	1880      	adds	r0, r0, r2
 801d62a:	5818      	ldr	r0, [r3, r0]
 801d62c:	18c0      	adds	r0, r0, r3
 801d62e:	4770      	bx	lr
 801d630:	2000      	movs	r0, #0
 801d632:	e7fc      	b.n	801d62e <fn_0801D618+0x16>
 801d634:	08156c40 	.word	0x08156c40
