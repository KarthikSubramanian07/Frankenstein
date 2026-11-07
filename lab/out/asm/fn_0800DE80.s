fn_0800DE80:
 800de80:	221f      	movs	r2, #31
 800de82:	b570      	push	{r4, r5, r6, lr}
 800de84:	8c03      	ldrh	r3, [r0, #32]
 800de86:	4393      	bics	r3, r2
 800de88:	0005      	movs	r5, r0
 800de8a:	8403      	strh	r3, [r0, #32]
 800de8c:	2200      	movs	r2, #0
 800de8e:	2103      	movs	r1, #3
 800de90:	201c      	movs	r0, #28
 800de92:	f00f fbf3 	bl	801d67c <fn_0801D67C>
 800de96:	0004      	movs	r4, r0
 800de98:	221c      	movs	r2, #28
 800de9a:	2100      	movs	r1, #0
 800de9c:	f012 fd78 	bl	8020990 <fn_08020990>
 800dea0:	0020      	movs	r0, r4
 800dea2:	f00a fb3b 	bl	801851c <fn_0801851C>
 800dea6:	4b08      	ldr	r3, [pc, #32]	@ (800dec8 <fn_0800DE80+0x48>)
 800dea8:	60a3      	str	r3, [r4, #8]
 800deaa:	2326      	movs	r3, #38	@ 0x26
 800deac:	60e5      	str	r5, [r4, #12]
 800deae:	5ce9      	ldrb	r1, [r5, r3]
 800deb0:	0028      	movs	r0, r5
 800deb2:	6161      	str	r1, [r4, #20]
 800deb4:	f007 f934 	bl	8015120 <fn_08015120>
 800deb8:	2304      	movs	r3, #4
 800deba:	3010      	adds	r0, #16
 800debc:	61a0      	str	r0, [r4, #24]
 800debe:	6123      	str	r3, [r4, #16]
 800dec0:	bc70      	pop	{r4, r5, r6}
 800dec2:	bc01      	pop	{r0}
 800dec4:	4700      	bx	r0
 800dec6:	46c0      	nop			@ (mov r8, r8)
 800dec8:	0800de05 	.word	0x0800de05
