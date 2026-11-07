fn_0801D06C:
 801d06c:	b510      	push	{r4, lr}
 801d06e:	4b1b      	ldr	r3, [pc, #108]	@ (801d0dc <fn_0801D06C+0x70>)
 801d070:	4a1b      	ldr	r2, [pc, #108]	@ (801d0e0 <fn_0801D06C+0x74>)
 801d072:	681b      	ldr	r3, [r3, #0]
 801d074:	5c9a      	ldrb	r2, [r3, r2]
 801d076:	2a00      	cmp	r2, #0
 801d078:	d01a      	beq.n	801d0b0 <fn_0801D06C+0x44>
 801d07a:	001a      	movs	r2, r3
 801d07c:	2001      	movs	r0, #1
 801d07e:	32e0      	adds	r2, #224	@ 0xe0
 801d080:	7b52      	ldrb	r2, [r2, #13]
 801d082:	4210      	tst	r0, r2
 801d084:	d117      	bne.n	801d0b6 <fn_0801D06C+0x4a>
 801d086:	0019      	movs	r1, r3
 801d088:	2000      	movs	r0, #0
 801d08a:	317d      	adds	r1, #125	@ 0x7d
 801d08c:	31ff      	adds	r1, #255	@ 0xff
 801d08e:	6008      	str	r0, [r1, #0]
 801d090:	2102      	movs	r1, #2
 801d092:	0008      	movs	r0, r1
 801d094:	4010      	ands	r0, r2
 801d096:	4211      	tst	r1, r2
 801d098:	d01c      	beq.n	801d0d4 <fn_0801D06C+0x68>
 801d09a:	001a      	movs	r2, r3
 801d09c:	3281      	adds	r2, #129	@ 0x81
 801d09e:	32ff      	adds	r2, #255	@ 0xff
 801d0a0:	6811      	ldr	r1, [r2, #0]
 801d0a2:	2900      	cmp	r1, #0
 801d0a4:	d102      	bne.n	801d0ac <fn_0801D06C+0x40>
 801d0a6:	2001      	movs	r0, #1
 801d0a8:	490e      	ldr	r1, [pc, #56]	@ (801d0e4 <fn_0801D06C+0x78>)
 801d0aa:	5058      	str	r0, [r3, r1]
 801d0ac:	2301      	movs	r3, #1
 801d0ae:	6013      	str	r3, [r2, #0]
 801d0b0:	bc10      	pop	{r4}
 801d0b2:	bc01      	pop	{r0}
 801d0b4:	4700      	bx	r0
 801d0b6:	0019      	movs	r1, r3
 801d0b8:	317d      	adds	r1, #125	@ 0x7d
 801d0ba:	31ff      	adds	r1, #255	@ 0xff
 801d0bc:	680c      	ldr	r4, [r1, #0]
 801d0be:	2c00      	cmp	r4, #0
 801d0c0:	d101      	bne.n	801d0c6 <fn_0801D06C+0x5a>
 801d0c2:	4c08      	ldr	r4, [pc, #32]	@ (801d0e4 <fn_0801D06C+0x78>)
 801d0c4:	5118      	str	r0, [r3, r4]
 801d0c6:	2001      	movs	r0, #1
 801d0c8:	6008      	str	r0, [r1, #0]
 801d0ca:	2102      	movs	r1, #2
 801d0cc:	0008      	movs	r0, r1
 801d0ce:	4010      	ands	r0, r2
 801d0d0:	4211      	tst	r1, r2
 801d0d2:	d1e2      	bne.n	801d09a <fn_0801D06C+0x2e>
 801d0d4:	3381      	adds	r3, #129	@ 0x81
 801d0d6:	33ff      	adds	r3, #255	@ 0xff
 801d0d8:	6018      	str	r0, [r3, #0]
 801d0da:	e7e9      	b.n	801d0b0 <fn_0801D06C+0x44>
 801d0dc:	030064c4 	.word	0x030064c4
 801d0e0:	0000025d 	.word	0x0000025d
 801d0e4:	00005a38 	.word	0x00005a38
