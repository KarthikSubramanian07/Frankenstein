fn_0801A9D4:
 801a9d4:	4b18      	ldr	r3, [pc, #96]	@ (801aa38 <fn_0801A9D4+0x64>)
 801a9d6:	781b      	ldrb	r3, [r3, #0]
 801a9d8:	b570      	push	{r4, r5, r6, lr}
 801a9da:	0004      	movs	r4, r0
 801a9dc:	2b00      	cmp	r3, #0
 801a9de:	d002      	beq.n	801a9e6 <fn_0801A9D4+0x12>
 801a9e0:	bc70      	pop	{r4, r5, r6}
 801a9e2:	bc01      	pop	{r0}
 801a9e4:	4700      	bx	r0
 801a9e6:	1e43      	subs	r3, r0, #1
 801a9e8:	2b42      	cmp	r3, #66	@ 0x42
 801a9ea:	d81b      	bhi.n	801aa24 <fn_0801A9D4+0x50>
 801a9ec:	4b13      	ldr	r3, [pc, #76]	@ (801aa3c <fn_0801A9D4+0x68>)
 801a9ee:	681a      	ldr	r2, [r3, #0]
 801a9f0:	001d      	movs	r5, r3
 801a9f2:	4b13      	ldr	r3, [pc, #76]	@ (801aa40 <fn_0801A9D4+0x6c>)
 801a9f4:	58d3      	ldr	r3, [r2, r3]
 801a9f6:	429c      	cmp	r4, r3
 801a9f8:	d0f2      	beq.n	801a9e0 <fn_0801A9D4+0xc>
 801a9fa:	2b00      	cmp	r3, #0
 801a9fc:	d00a      	beq.n	801aa14 <fn_0801A9D4+0x40>
 801a9fe:	4b11      	ldr	r3, [pc, #68]	@ (801aa44 <fn_0801A9D4+0x70>)
 801aa00:	5cd3      	ldrb	r3, [r2, r3]
 801aa02:	2b00      	cmp	r3, #0
 801aa04:	d113      	bne.n	801aa2e <fn_0801A9D4+0x5a>
 801aa06:	2000      	movs	r0, #0
 801aa08:	f7ea fa20 	bl	8004e4c <fn_08004E4C>
 801aa0c:	2100      	movs	r1, #0
 801aa0e:	682a      	ldr	r2, [r5, #0]
 801aa10:	4b0b      	ldr	r3, [pc, #44]	@ (801aa40 <fn_0801A9D4+0x6c>)
 801aa12:	50d1      	str	r1, [r2, r3]
 801aa14:	2100      	movs	r1, #0
 801aa16:	0020      	movs	r0, r4
 801aa18:	f7ea f9cc 	bl	8004db4 <fn_08004DB4>
 801aa1c:	682a      	ldr	r2, [r5, #0]
 801aa1e:	4b08      	ldr	r3, [pc, #32]	@ (801aa40 <fn_0801A9D4+0x6c>)
 801aa20:	50d4      	str	r4, [r2, r3]
 801aa22:	e7dd      	b.n	801a9e0 <fn_0801A9D4+0xc>
 801aa24:	0021      	movs	r1, r4
 801aa26:	4808      	ldr	r0, [pc, #32]	@ (801aa48 <fn_0801A9D4+0x74>)
 801aa28:	f7e5 fdbe 	bl	80005a8 <fn_080005A8>
 801aa2c:	e7de      	b.n	801a9ec <fn_0801A9D4+0x18>
 801aa2e:	2000      	movs	r0, #0
 801aa30:	f7ea f9fe 	bl	8004e30 <fn_08004E30>
 801aa34:	e7e7      	b.n	801aa06 <fn_0801A9D4+0x32>
 801aa36:	46c0      	nop			@ (mov r8, r8)
 801aa38:	080257f5 	.word	0x080257f5
 801aa3c:	030064c4 	.word	0x030064c4
 801aa40:	00005638 	.word	0x00005638
 801aa44:	00005640 	.word	0x00005640
 801aa48:	0814a838 	.word	0x0814a838
