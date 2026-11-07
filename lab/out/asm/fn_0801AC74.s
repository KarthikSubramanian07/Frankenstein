fn_0801AC74:
 801ac74:	4b0e      	ldr	r3, [pc, #56]	@ (801acb0 <fn_0801AC74+0x3c>)
 801ac76:	781b      	ldrb	r3, [r3, #0]
 801ac78:	b510      	push	{r4, lr}
 801ac7a:	2b00      	cmp	r3, #0
 801ac7c:	d110      	bne.n	801aca0 <fn_0801AC74+0x2c>
 801ac7e:	4c0d      	ldr	r4, [pc, #52]	@ (801acb4 <fn_0801AC74+0x40>)
 801ac80:	4a0d      	ldr	r2, [pc, #52]	@ (801acb8 <fn_0801AC74+0x44>)
 801ac82:	6823      	ldr	r3, [r4, #0]
 801ac84:	589a      	ldr	r2, [r3, r2]
 801ac86:	2a00      	cmp	r2, #0
 801ac88:	d00a      	beq.n	801aca0 <fn_0801AC74+0x2c>
 801ac8a:	4a0c      	ldr	r2, [pc, #48]	@ (801acbc <fn_0801AC74+0x48>)
 801ac8c:	5c9b      	ldrb	r3, [r3, r2]
 801ac8e:	2b00      	cmp	r3, #0
 801ac90:	d109      	bne.n	801aca6 <fn_0801AC74+0x32>
 801ac92:	2000      	movs	r0, #0
 801ac94:	f7ea f8da 	bl	8004e4c <fn_08004E4C>
 801ac98:	2100      	movs	r1, #0
 801ac9a:	6822      	ldr	r2, [r4, #0]
 801ac9c:	4b06      	ldr	r3, [pc, #24]	@ (801acb8 <fn_0801AC74+0x44>)
 801ac9e:	50d1      	str	r1, [r2, r3]
 801aca0:	bc10      	pop	{r4}
 801aca2:	bc01      	pop	{r0}
 801aca4:	4700      	bx	r0
 801aca6:	2000      	movs	r0, #0
 801aca8:	f7ea f8c2 	bl	8004e30 <fn_08004E30>
 801acac:	e7f1      	b.n	801ac92 <fn_0801AC74+0x1e>
 801acae:	46c0      	nop			@ (mov r8, r8)
 801acb0:	080258a5 	.word	0x080258a5
 801acb4:	030064c4 	.word	0x030064c4
 801acb8:	00005638 	.word	0x00005638
 801acbc:	00005640 	.word	0x00005640
