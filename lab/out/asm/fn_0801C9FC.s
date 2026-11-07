fn_0801C9FC:
 801c9fc:	2294      	movs	r2, #148	@ 0x94
 801c9fe:	b510      	push	{r4, lr}
 801ca00:	4b0b      	ldr	r3, [pc, #44]	@ (801ca30 <fn_0801C9FC+0x34>)
 801ca02:	681b      	ldr	r3, [r3, #0]
 801ca04:	5c9a      	ldrb	r2, [r3, r2]
 801ca06:	2a02      	cmp	r2, #2
 801ca08:	d003      	beq.n	801ca12 <fn_0801C9FC+0x16>
 801ca0a:	22dc      	movs	r2, #220	@ 0xdc
 801ca0c:	589a      	ldr	r2, [r3, r2]
 801ca0e:	2a08      	cmp	r2, #8
 801ca10:	d00b      	beq.n	801ca2a <fn_0801C9FC+0x2e>
 801ca12:	2101      	movs	r1, #1
 801ca14:	4a07      	ldr	r2, [pc, #28]	@ (801ca34 <fn_0801C9FC+0x38>)
 801ca16:	5499      	strb	r1, [r3, r2]
 801ca18:	2100      	movs	r1, #0
 801ca1a:	4a07      	ldr	r2, [pc, #28]	@ (801ca38 <fn_0801C9FC+0x3c>)
 801ca1c:	5099      	str	r1, [r3, r2]
 801ca1e:	4a07      	ldr	r2, [pc, #28]	@ (801ca3c <fn_0801C9FC+0x40>)
 801ca20:	318c      	adds	r1, #140	@ 0x8c
 801ca22:	5099      	str	r1, [r3, r2]
 801ca24:	bc10      	pop	{r4}
 801ca26:	bc01      	pop	{r0}
 801ca28:	4700      	bx	r0
 801ca2a:	f7e6 fd9b 	bl	8003564 <fn_08003564>
 801ca2e:	e7f9      	b.n	801ca24 <fn_0801C9FC+0x28>
 801ca30:	030064c4 	.word	0x030064c4
 801ca34:	00005a3c 	.word	0x00005a3c
 801ca38:	00005a38 	.word	0x00005a38
 801ca3c:	00005a48 	.word	0x00005a48
