fn_0801C1C4:
 801c1c4:	b570      	push	{r4, r5, r6, lr}
 801c1c6:	0004      	movs	r4, r0
 801c1c8:	f001 f9b4 	bl	801d534 <fn_0801D534>
 801c1cc:	2396      	movs	r3, #150	@ 0x96
 801c1ce:	021b      	lsls	r3, r3, #8
 801c1d0:	4298      	cmp	r0, r3
 801c1d2:	d006      	beq.n	801c1e2 <fn_0801C1C4+0x1e>
 801c1d4:	0020      	movs	r0, r4
 801c1d6:	f001 f983 	bl	801d4e0 <fn_0801D4E0>
 801c1da:	0001      	movs	r1, r0
 801c1dc:	480d      	ldr	r0, [pc, #52]	@ (801c214 <fn_0801C1C4+0x50>)
 801c1de:	f7e4 f9e3 	bl	80005a8 <fn_080005A8>
 801c1e2:	0020      	movs	r0, r4
 801c1e4:	f001 f9c0 	bl	801d568 <fn_0801D568>
 801c1e8:	4b0b      	ldr	r3, [pc, #44]	@ (801c218 <fn_0801C1C4+0x54>)
 801c1ea:	681a      	ldr	r2, [r3, #0]
 801c1ec:	4b0b      	ldr	r3, [pc, #44]	@ (801c21c <fn_0801C1C4+0x58>)
 801c1ee:	58d3      	ldr	r3, [r2, r3]
 801c1f0:	2296      	movs	r2, #150	@ 0x96
 801c1f2:	0212      	lsls	r2, r2, #8
 801c1f4:	1886      	adds	r6, r0, r2
 801c1f6:	4d0a      	ldr	r5, [pc, #40]	@ (801c220 <fn_0801C1C4+0x5c>)
 801c1f8:	4c0a      	ldr	r4, [pc, #40]	@ (801c224 <fn_0801C1C4+0x60>)
 801c1fa:	490b      	ldr	r1, [pc, #44]	@ (801c228 <fn_0801C1C4+0x64>)
 801c1fc:	4a0b      	ldr	r2, [pc, #44]	@ (801c22c <fn_0801C1C4+0x68>)
 801c1fe:	6028      	str	r0, [r5, #0]
 801c200:	30f0      	adds	r0, #240	@ 0xf0
 801c202:	6023      	str	r3, [r4, #0]
 801c204:	600a      	str	r2, [r1, #0]
 801c206:	33f0      	adds	r3, #240	@ 0xf0
 801c208:	42b0      	cmp	r0, r6
 801c20a:	d1f8      	bne.n	801c1fe <fn_0801C1C4+0x3a>
 801c20c:	bc70      	pop	{r4, r5, r6}
 801c20e:	bc01      	pop	{r0}
 801c210:	4700      	bx	r0
 801c212:	46c0      	nop			@ (mov r8, r8)
 801c214:	0814a8e8 	.word	0x0814a8e8
 801c218:	030064c4 	.word	0x030064c4	@ data_030064C4
 801c21c:	00005a30 	.word	0x00005a30
 801c220:	040000d4 	.word	0x040000d4
 801c224:	040000d8 	.word	0x040000d8
 801c228:	040000dc 	.word	0x040000dc
 801c22c:	80000078 	.word	0x80000078
