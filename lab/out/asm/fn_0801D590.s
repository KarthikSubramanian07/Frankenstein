fn_0801D590:
 801d590:	2800      	cmp	r0, #0
 801d592:	db09      	blt.n	801d5a8 <fn_0801D590+0x18>
 801d594:	4b05      	ldr	r3, [pc, #20]	@ (801d5ac <fn_0801D590+0x1c>)
 801d596:	685a      	ldr	r2, [r3, #4]
 801d598:	4290      	cmp	r0, r2
 801d59a:	da05      	bge.n	801d5a8 <fn_0801D590+0x18>
 801d59c:	689a      	ldr	r2, [r3, #8]
 801d59e:	0100      	lsls	r0, r0, #4
 801d5a0:	1880      	adds	r0, r0, r2
 801d5a2:	18c0      	adds	r0, r0, r3
 801d5a4:	3008      	adds	r0, #8
 801d5a6:	4770      	bx	lr
 801d5a8:	2000      	movs	r0, #0
 801d5aa:	e7fc      	b.n	801d5a6 <fn_0801D590+0x16>
 801d5ac:	08156c40 	.word	0x08156c40
