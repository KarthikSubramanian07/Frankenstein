fn_0800DECC:
 800decc:	221f      	movs	r2, #31
 800dece:	b570      	push	{r4, r5, r6, lr}
 800ded0:	8c03      	ldrh	r3, [r0, #32]
 800ded2:	4393      	bics	r3, r2
 800ded4:	0005      	movs	r5, r0
 800ded6:	8403      	strh	r3, [r0, #32]
 800ded8:	2200      	movs	r2, #0
 800deda:	2103      	movs	r1, #3
 800dedc:	2024      	movs	r0, #36	@ 0x24
 800dede:	f00f fbcd 	bl	801d67c <fn_0801D67C>
 800dee2:	0004      	movs	r4, r0
 800dee4:	2224      	movs	r2, #36	@ 0x24
 800dee6:	2100      	movs	r1, #0
 800dee8:	f012 fd52 	bl	8020990 <fn_08020990>
 800deec:	0020      	movs	r0, r4
 800deee:	f00a fb15 	bl	801851c <fn_0801851C>
 800def2:	4b0b      	ldr	r3, [pc, #44]	@ (800df20 <fn_0800DECC+0x54>)
 800def4:	60a3      	str	r3, [r4, #8]
 800def6:	2326      	movs	r3, #38	@ 0x26
 800def8:	60e5      	str	r5, [r4, #12]
 800defa:	5ce9      	ldrb	r1, [r5, r3]
 800defc:	0028      	movs	r0, r5
 800defe:	6161      	str	r1, [r4, #20]
 800df00:	f007 f90e 	bl	8015120 <fn_08015120>
 800df04:	2340      	movs	r3, #64	@ 0x40
 800df06:	61e3      	str	r3, [r4, #28]
 800df08:	3b39      	subs	r3, #57	@ 0x39
 800df0a:	6223      	str	r3, [r4, #32]
 800df0c:	61a0      	str	r0, [r4, #24]
 800df0e:	f7f8 fdf7 	bl	8006b00 <fn_08006B00>
 800df12:	69e3      	ldr	r3, [r4, #28]
 800df14:	4003      	ands	r3, r0
 800df16:	3301      	adds	r3, #1
 800df18:	6123      	str	r3, [r4, #16]
 800df1a:	bc70      	pop	{r4, r5, r6}
 800df1c:	bc01      	pop	{r0}
 800df1e:	4700      	bx	r0
 800df20:	0800de41 	.word	0x0800de41	@ fn_0800DE40
