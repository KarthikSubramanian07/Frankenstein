fn_0801C274:
 801c274:	b570      	push	{r4, r5, r6, lr}
 801c276:	0004      	movs	r4, r0
 801c278:	f001 f9b4 	bl	801d5e4 <fn_0801D5E4>
 801c27c:	2396      	movs	r3, #150	@ 0x96
 801c27e:	021b      	lsls	r3, r3, #8
 801c280:	4298      	cmp	r0, r3
 801c282:	d006      	beq.n	801c292 <fn_0801C274+0x1e>
 801c284:	0020      	movs	r0, r4
 801c286:	f001 f983 	bl	801d590 <fn_0801D590>
 801c28a:	0001      	movs	r1, r0
 801c28c:	480d      	ldr	r0, [pc, #52]	@ (801c2c4 <fn_0801C274+0x50>)
 801c28e:	f7e4 f98b 	bl	80005a8 <fn_080005A8>
 801c292:	0020      	movs	r0, r4
 801c294:	f001 f9c0 	bl	801d618 <fn_0801D618>
 801c298:	4b0b      	ldr	r3, [pc, #44]	@ (801c2c8 <fn_0801C274+0x54>)
 801c29a:	681a      	ldr	r2, [r3, #0]
 801c29c:	4b0b      	ldr	r3, [pc, #44]	@ (801c2cc <fn_0801C274+0x58>)
 801c29e:	58d3      	ldr	r3, [r2, r3]
 801c2a0:	2296      	movs	r2, #150	@ 0x96
 801c2a2:	0212      	lsls	r2, r2, #8
 801c2a4:	1886      	adds	r6, r0, r2
 801c2a6:	4d0a      	ldr	r5, [pc, #40]	@ (801c2d0 <fn_0801C274+0x5c>)
 801c2a8:	4c0a      	ldr	r4, [pc, #40]	@ (801c2d4 <fn_0801C274+0x60>)
 801c2aa:	490b      	ldr	r1, [pc, #44]	@ (801c2d8 <fn_0801C274+0x64>)
 801c2ac:	4a0b      	ldr	r2, [pc, #44]	@ (801c2dc <fn_0801C274+0x68>)
 801c2ae:	6028      	str	r0, [r5, #0]
 801c2b0:	30f0      	adds	r0, #240	@ 0xf0
 801c2b2:	6023      	str	r3, [r4, #0]
 801c2b4:	600a      	str	r2, [r1, #0]
 801c2b6:	33f0      	adds	r3, #240	@ 0xf0
 801c2b8:	42b0      	cmp	r0, r6
 801c2ba:	d1f8      	bne.n	801c2ae <fn_0801C274+0x3a>
 801c2bc:	bc70      	pop	{r4, r5, r6}
 801c2be:	bc01      	pop	{r0}
 801c2c0:	4700      	bx	r0
 801c2c2:	46c0      	nop			@ (mov r8, r8)
 801c2c4:	0814a9bc 	.word	0x0814a9bc
 801c2c8:	030064c4 	.word	0x030064c4
 801c2cc:	00005a30 	.word	0x00005a30
 801c2d0:	040000d4 	.word	0x040000d4
 801c2d4:	040000d8 	.word	0x040000d8
 801c2d8:	040000dc 	.word	0x040000dc
 801c2dc:	80000078 	.word	0x80000078
