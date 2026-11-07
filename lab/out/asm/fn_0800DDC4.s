fn_0800DDC4:
 800ddc4:	6983      	ldr	r3, [r0, #24]
 800ddc6:	b510      	push	{r4, lr}
 800ddc8:	1c5a      	adds	r2, r3, #1
 800ddca:	d00f      	beq.n	800ddec <fn_0800DDC4+0x28>
 800ddcc:	2b01      	cmp	r3, #1
 800ddce:	d002      	beq.n	800ddd6 <fn_0800DDC4+0x12>
 800ddd0:	bc10      	pop	{r4}
 800ddd2:	bc01      	pop	{r0}
 800ddd4:	4700      	bx	r0
 800ddd6:	2226      	movs	r2, #38	@ 0x26
 800ddd8:	68c1      	ldr	r1, [r0, #12]
 800ddda:	5c8b      	ldrb	r3, [r1, r2]
 800dddc:	6944      	ldr	r4, [r0, #20]
 800ddde:	3308      	adds	r3, #8
 800dde0:	42a3      	cmp	r3, r4
 800dde2:	db0a      	blt.n	800ddfa <fn_0800DDC4+0x36>
 800dde4:	2301      	movs	r3, #1
 800dde6:	425b      	negs	r3, r3
 800dde8:	6183      	str	r3, [r0, #24]
 800ddea:	e7f1      	b.n	800ddd0 <fn_0800DDC4+0xc>
 800ddec:	2226      	movs	r2, #38	@ 0x26
 800ddee:	68c1      	ldr	r1, [r0, #12]
 800ddf0:	5c8b      	ldrb	r3, [r1, r2]
 800ddf2:	6904      	ldr	r4, [r0, #16]
 800ddf4:	3b08      	subs	r3, #8
 800ddf6:	42a3      	cmp	r3, r4
 800ddf8:	dd01      	ble.n	800ddfe <fn_0800DDC4+0x3a>
 800ddfa:	548b      	strb	r3, [r1, r2]
 800ddfc:	e7e8      	b.n	800ddd0 <fn_0800DDC4+0xc>
 800ddfe:	2301      	movs	r3, #1
 800de00:	6183      	str	r3, [r0, #24]
 800de02:	e7e5      	b.n	800ddd0 <fn_0800DDC4+0xc>
