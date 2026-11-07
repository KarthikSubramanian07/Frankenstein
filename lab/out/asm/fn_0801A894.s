fn_0801A894:
 801a894:	4b0c      	ldr	r3, [pc, #48]	@ (801a8c8 <fn_0801A894+0x34>)
 801a896:	b570      	push	{r4, r5, r6, lr}
 801a898:	781c      	ldrb	r4, [r3, #0]
 801a89a:	2c00      	cmp	r4, #0
 801a89c:	d109      	bne.n	801a8b2 <fn_0801A894+0x1e>
 801a89e:	4d0b      	ldr	r5, [pc, #44]	@ (801a8cc <fn_0801A894+0x38>)
 801a8a0:	4a0b      	ldr	r2, [pc, #44]	@ (801a8d0 <fn_0801A894+0x3c>)
 801a8a2:	682b      	ldr	r3, [r5, #0]
 801a8a4:	589a      	ldr	r2, [r3, r2]
 801a8a6:	2a00      	cmp	r2, #0
 801a8a8:	d003      	beq.n	801a8b2 <fn_0801A894+0x1e>
 801a8aa:	4a0a      	ldr	r2, [pc, #40]	@ (801a8d4 <fn_0801A894+0x40>)
 801a8ac:	5c9b      	ldrb	r3, [r3, r2]
 801a8ae:	2b00      	cmp	r3, #0
 801a8b0:	d102      	bne.n	801a8b8 <fn_0801A894+0x24>
 801a8b2:	bc70      	pop	{r4, r5, r6}
 801a8b4:	bc01      	pop	{r0}
 801a8b6:	4700      	bx	r0
 801a8b8:	2000      	movs	r0, #0
 801a8ba:	f7ea fab9 	bl	8004e30 <fn_08004E30>
 801a8be:	682b      	ldr	r3, [r5, #0]
 801a8c0:	4a04      	ldr	r2, [pc, #16]	@ (801a8d4 <fn_0801A894+0x40>)
 801a8c2:	549c      	strb	r4, [r3, r2]
 801a8c4:	e7f5      	b.n	801a8b2 <fn_0801A894+0x1e>
 801a8c6:	46c0      	nop			@ (mov r8, r8)
 801a8c8:	080257f5 	.word	0x080257f5	@ data_080257F5
 801a8cc:	030064c4 	.word	0x030064c4	@ data_030064C4
 801a8d0:	00005638 	.word	0x00005638
 801a8d4:	00005640 	.word	0x00005640
