fn_0801D568:
 801d568:	2800      	cmp	r0, #0
 801d56a:	db09      	blt.n	801d580 <fn_0801D568+0x18>
 801d56c:	4b05      	ldr	r3, [pc, #20]	@ (801d584 <fn_0801D568+0x1c>)
 801d56e:	685a      	ldr	r2, [r3, #4]
 801d570:	4290      	cmp	r0, r2
 801d572:	da05      	bge.n	801d580 <fn_0801D568+0x18>
 801d574:	689a      	ldr	r2, [r3, #8]
 801d576:	0100      	lsls	r0, r0, #4
 801d578:	1880      	adds	r0, r0, r2
 801d57a:	5818      	ldr	r0, [r3, r0]
 801d57c:	18c0      	adds	r0, r0, r3
 801d57e:	4770      	bx	lr
 801d580:	2000      	movs	r0, #0
 801d582:	e7fc      	b.n	801d57e <fn_0801D568+0x16>
 801d584:	08156b80 	.word	0x08156b80
