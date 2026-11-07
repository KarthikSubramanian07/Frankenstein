fn_0801AA10:
 801aa10:	4b0b      	ldr	r3, [pc, #44]	@ (801aa40 <fn_0801AA10+0x30>)
 801aa12:	781b      	ldrb	r3, [r3, #0]
 801aa14:	b510      	push	{r4, lr}
 801aa16:	0004      	movs	r4, r0
 801aa18:	2b00      	cmp	r3, #0
 801aa1a:	d108      	bne.n	801aa2e <fn_0801AA10+0x1e>
 801aa1c:	280f      	cmp	r0, #15
 801aa1e:	d809      	bhi.n	801aa34 <fn_0801AA10+0x24>
 801aa20:	0020      	movs	r0, r4
 801aa22:	f7ea fa21 	bl	8004e68 <fn_08004E68>
 801aa26:	4b07      	ldr	r3, [pc, #28]	@ (801aa44 <fn_0801AA10+0x34>)
 801aa28:	681a      	ldr	r2, [r3, #0]
 801aa2a:	4b07      	ldr	r3, [pc, #28]	@ (801aa48 <fn_0801AA10+0x38>)
 801aa2c:	50d4      	str	r4, [r2, r3]
 801aa2e:	bc10      	pop	{r4}
 801aa30:	bc01      	pop	{r0}
 801aa32:	4700      	bx	r0
 801aa34:	0021      	movs	r1, r4
 801aa36:	4805      	ldr	r0, [pc, #20]	@ (801aa4c <fn_0801AA10+0x3c>)
 801aa38:	f7e5 fdb6 	bl	80005a8 <fn_080005A8>
 801aa3c:	e7f0      	b.n	801aa20 <fn_0801AA10+0x10>
 801aa3e:	46c0      	nop			@ (mov r8, r8)
 801aa40:	080258a5 	.word	0x080258a5
 801aa44:	030064c4 	.word	0x030064c4
 801aa48:	00005634 	.word	0x00005634
 801aa4c:	0814a8b4 	.word	0x0814a8b4
