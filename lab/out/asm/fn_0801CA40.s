fn_0801CA40:
 801ca40:	4b11      	ldr	r3, [pc, #68]	@ (801ca88 <fn_0801CA40+0x48>)
 801ca42:	4912      	ldr	r1, [pc, #72]	@ (801ca8c <fn_0801CA40+0x4c>)
 801ca44:	681b      	ldr	r3, [r3, #0]
 801ca46:	585a      	ldr	r2, [r3, r1]
 801ca48:	3a01      	subs	r2, #1
 801ca4a:	b510      	push	{r4, lr}
 801ca4c:	505a      	str	r2, [r3, r1]
 801ca4e:	2a00      	cmp	r2, #0
 801ca50:	d003      	beq.n	801ca5a <fn_0801CA40+0x1a>
 801ca52:	490f      	ldr	r1, [pc, #60]	@ (801ca90 <fn_0801CA40+0x50>)
 801ca54:	5859      	ldr	r1, [r3, r1]
 801ca56:	2900      	cmp	r1, #0
 801ca58:	d00b      	beq.n	801ca72 <fn_0801CA40+0x32>
 801ca5a:	21ff      	movs	r1, #255	@ 0xff
 801ca5c:	4a0d      	ldr	r2, [pc, #52]	@ (801ca94 <fn_0801CA40+0x54>)
 801ca5e:	5499      	strb	r1, [r3, r2]
 801ca60:	2100      	movs	r1, #0
 801ca62:	4a0b      	ldr	r2, [pc, #44]	@ (801ca90 <fn_0801CA40+0x50>)
 801ca64:	5099      	str	r1, [r3, r2]
 801ca66:	4a09      	ldr	r2, [pc, #36]	@ (801ca8c <fn_0801CA40+0x4c>)
 801ca68:	310a      	adds	r1, #10
 801ca6a:	5099      	str	r1, [r3, r2]
 801ca6c:	bc10      	pop	{r4}
 801ca6e:	bc01      	pop	{r0}
 801ca70:	4700      	bx	r0
 801ca72:	201f      	movs	r0, #31
 801ca74:	4010      	ands	r0, r2
 801ca76:	2213      	movs	r2, #19
 801ca78:	0014      	movs	r4, r2
 801ca7a:	2200      	movs	r2, #0
 801ca7c:	4284      	cmp	r4, r0
 801ca7e:	414a      	adcs	r2, r1
 801ca80:	4905      	ldr	r1, [pc, #20]	@ (801ca98 <fn_0801CA40+0x58>)
 801ca82:	545a      	strb	r2, [r3, r1]
 801ca84:	e7f2      	b.n	801ca6c <fn_0801CA40+0x2c>
 801ca86:	46c0      	nop			@ (mov r8, r8)
 801ca88:	030064c4 	.word	0x030064c4
 801ca8c:	00005a48 	.word	0x00005a48
 801ca90:	00005a38 	.word	0x00005a38
 801ca94:	00005a3c 	.word	0x00005a3c
 801ca98:	00005a98 	.word	0x00005a98
