fn_0801A99C:
 801a99c:	4b09      	ldr	r3, [pc, #36]	@ (801a9c4 <fn_0801A99C+0x28>)
 801a99e:	781b      	ldrb	r3, [r3, #0]
 801a9a0:	b510      	push	{r4, lr}
 801a9a2:	0004      	movs	r4, r0
 801a9a4:	2b00      	cmp	r3, #0
 801a9a6:	d105      	bne.n	801a9b4 <fn_0801A99C+0x18>
 801a9a8:	287f      	cmp	r0, #127	@ 0x7f
 801a9aa:	d806      	bhi.n	801a9ba <fn_0801A99C+0x1e>
 801a9ac:	4b06      	ldr	r3, [pc, #24]	@ (801a9c8 <fn_0801A99C+0x2c>)
 801a9ae:	681a      	ldr	r2, [r3, #0]
 801a9b0:	4b06      	ldr	r3, [pc, #24]	@ (801a9cc <fn_0801A99C+0x30>)
 801a9b2:	50d4      	str	r4, [r2, r3]
 801a9b4:	bc10      	pop	{r4}
 801a9b6:	bc01      	pop	{r0}
 801a9b8:	4700      	bx	r0
 801a9ba:	0021      	movs	r1, r4
 801a9bc:	4804      	ldr	r0, [pc, #16]	@ (801a9d0 <fn_0801A99C+0x34>)
 801a9be:	f7e5 fdf3 	bl	80005a8 <fn_080005A8>
 801a9c2:	e7f3      	b.n	801a9ac <fn_0801A99C+0x10>
 801a9c4:	080257f6 	.word	0x080257f6
 801a9c8:	030064c4 	.word	0x030064c4
 801a9cc:	00005630 	.word	0x00005630
 801a9d0:	0814a7b0 	.word	0x0814a7b0
