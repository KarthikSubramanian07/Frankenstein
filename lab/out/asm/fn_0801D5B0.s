fn_0801D5B0:
 801d5b0:	4b08      	ldr	r3, [pc, #32]	@ (801d5d4 <fn_0801D5B0+0x24>)
 801d5b2:	695b      	ldr	r3, [r3, #20]
 801d5b4:	b510      	push	{r4, lr}
 801d5b6:	2b0b      	cmp	r3, #11
 801d5b8:	d906      	bls.n	801d5c8 <fn_0801D5B0+0x18>
 801d5ba:	2204      	movs	r2, #4
 801d5bc:	4906      	ldr	r1, [pc, #24]	@ (801d5d8 <fn_0801D5B0+0x28>)
 801d5be:	4807      	ldr	r0, [pc, #28]	@ (801d5dc <fn_0801D5B0+0x2c>)
 801d5c0:	f004 f8de 	bl	8021780 <fn_08021780>
 801d5c4:	2800      	cmp	r0, #0
 801d5c6:	d002      	beq.n	801d5ce <fn_0801D5B0+0x1e>
 801d5c8:	4805      	ldr	r0, [pc, #20]	@ (801d5e0 <fn_0801D5B0+0x30>)
 801d5ca:	f7e2 ffed 	bl	80005a8 <fn_080005A8>
 801d5ce:	bc10      	pop	{r4}
 801d5d0:	bc01      	pop	{r0}
 801d5d2:	4700      	bx	r0
 801d5d4:	08156c20 	.word	0x08156c20
 801d5d8:	081490b4 	.word	0x081490b4
 801d5dc:	08156c40 	.word	0x08156c40
 801d5e0:	0814aa84 	.word	0x0814aa84
