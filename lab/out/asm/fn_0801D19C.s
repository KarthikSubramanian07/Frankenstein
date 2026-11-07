fn_0801D19C:
 801d19c:	b510      	push	{r4, lr}
 801d19e:	4b0a      	ldr	r3, [pc, #40]	@ (801d1c8 <fn_0801D19C+0x2c>)
 801d1a0:	681a      	ldr	r2, [r3, #0]
 801d1a2:	4b0a      	ldr	r3, [pc, #40]	@ (801d1cc <fn_0801D19C+0x30>)
 801d1a4:	56d3      	ldrsb	r3, [r2, r3]
 801d1a6:	2b00      	cmp	r3, #0
 801d1a8:	d00b      	beq.n	801d1c2 <fn_0801D19C+0x26>
 801d1aa:	2b01      	cmp	r3, #1
 801d1ac:	d004      	beq.n	801d1b8 <fn_0801D19C+0x1c>
 801d1ae:	3301      	adds	r3, #1
 801d1b0:	d104      	bne.n	801d1bc <fn_0801D19C+0x20>
 801d1b2:	2101      	movs	r1, #1
 801d1b4:	4b06      	ldr	r3, [pc, #24]	@ (801d1d0 <fn_0801D19C+0x34>)
 801d1b6:	54d1      	strb	r1, [r2, r3]
 801d1b8:	f7ff fc18 	bl	801c9ec <fn_0801C9EC>
 801d1bc:	bc10      	pop	{r4}
 801d1be:	bc01      	pop	{r0}
 801d1c0:	4700      	bx	r0
 801d1c2:	f7ff fe31 	bl	801ce28 <fn_0801CE28>
 801d1c6:	e7f9      	b.n	801d1bc <fn_0801D19C+0x20>
 801d1c8:	030064c4 	.word	0x030064c4	@ data_030064C4
 801d1cc:	00005a3c 	.word	0x00005a3c
 801d1d0:	00005a98 	.word	0x00005a98
