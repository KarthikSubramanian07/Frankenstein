fn_0801AA50:
 801aa50:	4b09      	ldr	r3, [pc, #36]	@ (801aa78 <fn_0801AA50+0x28>)
 801aa52:	781b      	ldrb	r3, [r3, #0]
 801aa54:	b510      	push	{r4, lr}
 801aa56:	0004      	movs	r4, r0
 801aa58:	2b00      	cmp	r3, #0
 801aa5a:	d105      	bne.n	801aa68 <fn_0801AA50+0x18>
 801aa5c:	287f      	cmp	r0, #127	@ 0x7f
 801aa5e:	d806      	bhi.n	801aa6e <fn_0801AA50+0x1e>
 801aa60:	4b06      	ldr	r3, [pc, #24]	@ (801aa7c <fn_0801AA50+0x2c>)
 801aa62:	681a      	ldr	r2, [r3, #0]
 801aa64:	4b06      	ldr	r3, [pc, #24]	@ (801aa80 <fn_0801AA50+0x30>)
 801aa66:	50d4      	str	r4, [r2, r3]
 801aa68:	bc10      	pop	{r4}
 801aa6a:	bc01      	pop	{r0}
 801aa6c:	4700      	bx	r0
 801aa6e:	0021      	movs	r1, r4
 801aa70:	4804      	ldr	r0, [pc, #16]	@ (801aa84 <fn_0801AA50+0x34>)
 801aa72:	f7e5 fd99 	bl	80005a8 <fn_080005A8>
 801aa76:	e7f3      	b.n	801aa60 <fn_0801AA50+0x10>
 801aa78:	080258a6 	.word	0x080258a6
 801aa7c:	030064c4 	.word	0x030064c4
 801aa80:	00005630 	.word	0x00005630
 801aa84:	0814a884 	.word	0x0814a884
