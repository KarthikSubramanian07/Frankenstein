fn_080110B8:
 80110b8:	b510      	push	{r4, lr}
 80110ba:	0004      	movs	r4, r0
 80110bc:	f7ff f812 	bl	80100e4 <fn_080100E4>
 80110c0:	0020      	movs	r0, r4
 80110c2:	f009 fb43 	bl	801a74c <fn_0801A74C>
 80110c6:	4b0b      	ldr	r3, [pc, #44]	@ (80110f4 <fn_080110B8+0x3c>)
 80110c8:	681a      	ldr	r2, [r3, #0]
 80110ca:	4b0b      	ldr	r3, [pc, #44]	@ (80110f8 <fn_080110B8+0x40>)
 80110cc:	5cd3      	ldrb	r3, [r2, r3]
 80110ce:	2b00      	cmp	r3, #0
 80110d0:	d005      	beq.n	80110de <fn_080110B8+0x26>
 80110d2:	0020      	movs	r0, r4
 80110d4:	f007 fa40 	bl	8018558 <fn_08018558>
 80110d8:	bc10      	pop	{r4}
 80110da:	bc01      	pop	{r0}
 80110dc:	4700      	bx	r0
 80110de:	0020      	movs	r0, r4
 80110e0:	2100      	movs	r1, #0
 80110e2:	3050      	adds	r0, #80	@ 0x50
 80110e4:	f007 fa64 	bl	80185b0 <fn_080185B0>
 80110e8:	0020      	movs	r0, r4
 80110ea:	2100      	movs	r1, #0
 80110ec:	3060      	adds	r0, #96	@ 0x60
 80110ee:	f007 fa5f 	bl	80185b0 <fn_080185B0>
 80110f2:	e7ee      	b.n	80110d2 <fn_080110B8+0x1a>
 80110f4:	030064c4 	.word	0x030064c4
 80110f8:	0000025e 	.word	0x0000025e
