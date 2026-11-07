fn_08005CAC:
 8005cac:	b510      	push	{r4, lr}
 8005cae:	4c0f      	ldr	r4, [pc, #60]	@ (8005cec <fn_08005CAC+0x40>)
 8005cb0:	2800      	cmp	r0, #0
 8005cb2:	d013      	beq.n	8005cdc <fn_08005CAC+0x30>
 8005cb4:	2801      	cmp	r0, #1
 8005cb6:	d009      	beq.n	8005ccc <fn_08005CAC+0x20>
 8005cb8:	f7fd fe9e 	bl	80039f8 <fn_080039F8>
 8005cbc:	6822      	ldr	r2, [r4, #0]
 8005cbe:	4b0c      	ldr	r3, [pc, #48]	@ (8005cf0 <fn_08005CAC+0x44>)
 8005cc0:	58d0      	ldr	r0, [r2, r3]
 8005cc2:	f014 fe6b 	bl	801a99c <fn_0801A99C>
 8005cc6:	bc10      	pop	{r4}
 8005cc8:	bc01      	pop	{r0}
 8005cca:	4700      	bx	r0
 8005ccc:	6821      	ldr	r1, [r4, #0]
 8005cce:	4a08      	ldr	r2, [pc, #32]	@ (8005cf0 <fn_08005CAC+0x44>)
 8005cd0:	588b      	ldr	r3, [r1, r2]
 8005cd2:	2b0e      	cmp	r3, #14
 8005cd4:	dcf0      	bgt.n	8005cb8 <fn_08005CAC+0xc>
 8005cd6:	3301      	adds	r3, #1
 8005cd8:	508b      	str	r3, [r1, r2]
 8005cda:	e7ed      	b.n	8005cb8 <fn_08005CAC+0xc>
 8005cdc:	6821      	ldr	r1, [r4, #0]
 8005cde:	4a04      	ldr	r2, [pc, #16]	@ (8005cf0 <fn_08005CAC+0x44>)
 8005ce0:	588b      	ldr	r3, [r1, r2]
 8005ce2:	2b00      	cmp	r3, #0
 8005ce4:	d0e8      	beq.n	8005cb8 <fn_08005CAC+0xc>
 8005ce6:	3b01      	subs	r3, #1
 8005ce8:	508b      	str	r3, [r1, r2]
 8005cea:	e7e5      	b.n	8005cb8 <fn_08005CAC+0xc>
 8005cec:	030064c4 	.word	0x030064c4
 8005cf0:	00005630 	.word	0x00005630
