fn_0801ABC0:
 801abc0:	4b0e      	ldr	r3, [pc, #56]	@ (801abfc <fn_0801ABC0+0x3c>)
 801abc2:	781b      	ldrb	r3, [r3, #0]
 801abc4:	b510      	push	{r4, lr}
 801abc6:	2b00      	cmp	r3, #0
 801abc8:	d110      	bne.n	801abec <fn_0801ABC0+0x2c>
 801abca:	4c0d      	ldr	r4, [pc, #52]	@ (801ac00 <fn_0801ABC0+0x40>)
 801abcc:	4a0d      	ldr	r2, [pc, #52]	@ (801ac04 <fn_0801ABC0+0x44>)
 801abce:	6823      	ldr	r3, [r4, #0]
 801abd0:	589a      	ldr	r2, [r3, r2]
 801abd2:	2a00      	cmp	r2, #0
 801abd4:	d00a      	beq.n	801abec <fn_0801ABC0+0x2c>
 801abd6:	4a0c      	ldr	r2, [pc, #48]	@ (801ac08 <fn_0801ABC0+0x48>)
 801abd8:	5c9b      	ldrb	r3, [r3, r2]
 801abda:	2b00      	cmp	r3, #0
 801abdc:	d109      	bne.n	801abf2 <fn_0801ABC0+0x32>
 801abde:	2000      	movs	r0, #0
 801abe0:	f7ea f934 	bl	8004e4c <fn_08004E4C>
 801abe4:	2100      	movs	r1, #0
 801abe6:	6822      	ldr	r2, [r4, #0]
 801abe8:	4b06      	ldr	r3, [pc, #24]	@ (801ac04 <fn_0801ABC0+0x44>)
 801abea:	50d1      	str	r1, [r2, r3]
 801abec:	bc10      	pop	{r4}
 801abee:	bc01      	pop	{r0}
 801abf0:	4700      	bx	r0
 801abf2:	2000      	movs	r0, #0
 801abf4:	f7ea f91c 	bl	8004e30 <fn_08004E30>
 801abf8:	e7f1      	b.n	801abde <fn_0801ABC0+0x1e>
 801abfa:	46c0      	nop			@ (mov r8, r8)
 801abfc:	080257f5 	.word	0x080257f5	@ data_080257F5
 801ac00:	030064c4 	.word	0x030064c4	@ data_030064C4
 801ac04:	00005638 	.word	0x00005638
 801ac08:	00005640 	.word	0x00005640
