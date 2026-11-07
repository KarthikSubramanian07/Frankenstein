fn_0801D24C:
 801d24c:	b510      	push	{r4, lr}
 801d24e:	4b0a      	ldr	r3, [pc, #40]	@ (801d278 <fn_0801D24C+0x2c>)
 801d250:	681a      	ldr	r2, [r3, #0]
 801d252:	4b0a      	ldr	r3, [pc, #40]	@ (801d27c <fn_0801D24C+0x30>)
 801d254:	56d3      	ldrsb	r3, [r2, r3]
 801d256:	2b00      	cmp	r3, #0
 801d258:	d00b      	beq.n	801d272 <fn_0801D24C+0x26>
 801d25a:	2b01      	cmp	r3, #1
 801d25c:	d004      	beq.n	801d268 <fn_0801D24C+0x1c>
 801d25e:	3301      	adds	r3, #1
 801d260:	d104      	bne.n	801d26c <fn_0801D24C+0x20>
 801d262:	2101      	movs	r1, #1
 801d264:	4b06      	ldr	r3, [pc, #24]	@ (801d280 <fn_0801D24C+0x34>)
 801d266:	54d1      	strb	r1, [r2, r3]
 801d268:	f7ff fc18 	bl	801ca9c <fn_0801CA9C>
 801d26c:	bc10      	pop	{r4}
 801d26e:	bc01      	pop	{r0}
 801d270:	4700      	bx	r0
 801d272:	f7ff fe31 	bl	801ced8 <fn_0801CED8>
 801d276:	e7f9      	b.n	801d26c <fn_0801D24C+0x20>
 801d278:	030064c4 	.word	0x030064c4
 801d27c:	00005a3c 	.word	0x00005a3c
 801d280:	00005a98 	.word	0x00005a98
