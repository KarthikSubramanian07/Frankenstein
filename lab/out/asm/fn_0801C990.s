fn_0801C990:
 801c990:	4b11      	ldr	r3, [pc, #68]	@ (801c9d8 <fn_0801C990+0x48>)
 801c992:	4912      	ldr	r1, [pc, #72]	@ (801c9dc <fn_0801C990+0x4c>)
 801c994:	681b      	ldr	r3, [r3, #0]
 801c996:	585a      	ldr	r2, [r3, r1]
 801c998:	3a01      	subs	r2, #1
 801c99a:	b510      	push	{r4, lr}
 801c99c:	505a      	str	r2, [r3, r1]
 801c99e:	2a00      	cmp	r2, #0
 801c9a0:	d003      	beq.n	801c9aa <fn_0801C990+0x1a>
 801c9a2:	490f      	ldr	r1, [pc, #60]	@ (801c9e0 <fn_0801C990+0x50>)
 801c9a4:	5859      	ldr	r1, [r3, r1]
 801c9a6:	2900      	cmp	r1, #0
 801c9a8:	d00b      	beq.n	801c9c2 <fn_0801C990+0x32>
 801c9aa:	21ff      	movs	r1, #255	@ 0xff
 801c9ac:	4a0d      	ldr	r2, [pc, #52]	@ (801c9e4 <fn_0801C990+0x54>)
 801c9ae:	5499      	strb	r1, [r3, r2]
 801c9b0:	2100      	movs	r1, #0
 801c9b2:	4a0b      	ldr	r2, [pc, #44]	@ (801c9e0 <fn_0801C990+0x50>)
 801c9b4:	5099      	str	r1, [r3, r2]
 801c9b6:	4a09      	ldr	r2, [pc, #36]	@ (801c9dc <fn_0801C990+0x4c>)
 801c9b8:	310a      	adds	r1, #10
 801c9ba:	5099      	str	r1, [r3, r2]
 801c9bc:	bc10      	pop	{r4}
 801c9be:	bc01      	pop	{r0}
 801c9c0:	4700      	bx	r0
 801c9c2:	201f      	movs	r0, #31
 801c9c4:	4010      	ands	r0, r2
 801c9c6:	2213      	movs	r2, #19
 801c9c8:	0014      	movs	r4, r2
 801c9ca:	2200      	movs	r2, #0
 801c9cc:	4284      	cmp	r4, r0
 801c9ce:	414a      	adcs	r2, r1
 801c9d0:	4905      	ldr	r1, [pc, #20]	@ (801c9e8 <fn_0801C990+0x58>)
 801c9d2:	545a      	strb	r2, [r3, r1]
 801c9d4:	e7f2      	b.n	801c9bc <fn_0801C990+0x2c>
 801c9d6:	46c0      	nop			@ (mov r8, r8)
 801c9d8:	030064c4 	.word	0x030064c4	@ data_030064C4
 801c9dc:	00005a48 	.word	0x00005a48
 801c9e0:	00005a38 	.word	0x00005a38
 801c9e4:	00005a3c 	.word	0x00005a3c
 801c9e8:	00005a98 	.word	0x00005a98
