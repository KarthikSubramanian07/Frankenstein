fn_08005CF4:
 8005cf4:	b510      	push	{r4, lr}
 8005cf6:	4c0f      	ldr	r4, [pc, #60]	@ (8005d34 <fn_08005CF4+0x40>)
 8005cf8:	2800      	cmp	r0, #0
 8005cfa:	d013      	beq.n	8005d24 <fn_08005CF4+0x30>
 8005cfc:	2801      	cmp	r0, #1
 8005cfe:	d009      	beq.n	8005d14 <fn_08005CF4+0x20>
 8005d00:	f7fd fe7a 	bl	80039f8 <fn_080039F8>
 8005d04:	6822      	ldr	r2, [r4, #0]
 8005d06:	4b0c      	ldr	r3, [pc, #48]	@ (8005d38 <fn_08005CF4+0x44>)
 8005d08:	58d0      	ldr	r0, [r2, r3]
 8005d0a:	f014 fe81 	bl	801aa10 <fn_0801AA10>
 8005d0e:	bc10      	pop	{r4}
 8005d10:	bc01      	pop	{r0}
 8005d12:	4700      	bx	r0
 8005d14:	6821      	ldr	r1, [r4, #0]
 8005d16:	4a08      	ldr	r2, [pc, #32]	@ (8005d38 <fn_08005CF4+0x44>)
 8005d18:	588b      	ldr	r3, [r1, r2]
 8005d1a:	2b0e      	cmp	r3, #14
 8005d1c:	dcf0      	bgt.n	8005d00 <fn_08005CF4+0xc>
 8005d1e:	3301      	adds	r3, #1
 8005d20:	508b      	str	r3, [r1, r2]
 8005d22:	e7ed      	b.n	8005d00 <fn_08005CF4+0xc>
 8005d24:	6821      	ldr	r1, [r4, #0]
 8005d26:	4a04      	ldr	r2, [pc, #16]	@ (8005d38 <fn_08005CF4+0x44>)
 8005d28:	588b      	ldr	r3, [r1, r2]
 8005d2a:	2b00      	cmp	r3, #0
 8005d2c:	d0e8      	beq.n	8005d00 <fn_08005CF4+0xc>
 8005d2e:	3b01      	subs	r3, #1
 8005d30:	508b      	str	r3, [r1, r2]
 8005d32:	e7e5      	b.n	8005d00 <fn_08005CF4+0xc>
 8005d34:	030064c4 	.word	0x030064c4
 8005d38:	00005634 	.word	0x00005634
