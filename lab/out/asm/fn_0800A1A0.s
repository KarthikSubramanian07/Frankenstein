fn_0800A1A0:
 800a1a0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800a1a2:	4647      	mov	r7, r8
 800a1a4:	46ce      	mov	lr, r9
 800a1a6:	2288      	movs	r2, #136	@ 0x88
 800a1a8:	2300      	movs	r3, #0
 800a1aa:	b580      	push	{r7, lr}
 800a1ac:	4f24      	ldr	r7, [pc, #144]	@ (800a240 <fn_0800A1A0+0xa0>)
 800a1ae:	683d      	ldr	r5, [r7, #0]
 800a1b0:	0112      	lsls	r2, r2, #4
 800a1b2:	50ab      	str	r3, [r5, r2]
 800a1b4:	4a23      	ldr	r2, [pc, #140]	@ (800a244 <fn_0800A1A0+0xa4>)
 800a1b6:	50ab      	str	r3, [r5, r2]
 800a1b8:	4a23      	ldr	r2, [pc, #140]	@ (800a248 <fn_0800A1A0+0xa8>)
 800a1ba:	50ab      	str	r3, [r5, r2]
 800a1bc:	4b23      	ldr	r3, [pc, #140]	@ (800a24c <fn_0800A1A0+0xac>)
 800a1be:	58ec      	ldr	r4, [r5, r3]
 800a1c0:	4b23      	ldr	r3, [pc, #140]	@ (800a250 <fn_0800A1A0+0xb0>)
 800a1c2:	18ea      	adds	r2, r5, r3
 800a1c4:	4294      	cmp	r4, r2
 800a1c6:	d031      	beq.n	800a22c <fn_0800A1A0+0x8c>
 800a1c8:	4e22      	ldr	r6, [pc, #136]	@ (800a254 <fn_0800A1A0+0xb4>)
 800a1ca:	e002      	b.n	800a1d2 <fn_0800A1A0+0x32>
 800a1cc:	6864      	ldr	r4, [r4, #4]
 800a1ce:	4294      	cmp	r4, r2
 800a1d0:	d02c      	beq.n	800a22c <fn_0800A1A0+0x8c>
 800a1d2:	68a3      	ldr	r3, [r4, #8]
 800a1d4:	42b3      	cmp	r3, r6
 800a1d6:	d1f9      	bne.n	800a1cc <fn_0800A1A0+0x2c>
 800a1d8:	235a      	movs	r3, #90	@ 0x5a
 800a1da:	5ce3      	ldrb	r3, [r4, r3]
 800a1dc:	2b1b      	cmp	r3, #27
 800a1de:	d1f5      	bne.n	800a1cc <fn_0800A1A0+0x2c>
 800a1e0:	4b1d      	ldr	r3, [pc, #116]	@ (800a258 <fn_0800A1A0+0xb8>)
 800a1e2:	58e9      	ldr	r1, [r5, r3]
 800a1e4:	3304      	adds	r3, #4
 800a1e6:	58eb      	ldr	r3, [r5, r3]
 800a1e8:	428b      	cmp	r3, r1
 800a1ea:	db10      	blt.n	800a20e <fn_0800A1A0+0x6e>
 800a1ec:	4b1b      	ldr	r3, [pc, #108]	@ (800a25c <fn_0800A1A0+0xbc>)
 800a1ee:	58e8      	ldr	r0, [r5, r3]
 800a1f0:	2900      	cmp	r1, #0
 800a1f2:	d021      	beq.n	800a238 <fn_0800A1A0+0x98>
 800a1f4:	004a      	lsls	r2, r1, #1
 800a1f6:	00c9      	lsls	r1, r1, #3
 800a1f8:	4b17      	ldr	r3, [pc, #92]	@ (800a258 <fn_0800A1A0+0xb8>)
 800a1fa:	50ea      	str	r2, [r5, r3]
 800a1fc:	2300      	movs	r3, #0
 800a1fe:	2201      	movs	r2, #1
 800a200:	f013 fb3e 	bl	801d880 <fn_0801D880>
 800a204:	4b15      	ldr	r3, [pc, #84]	@ (800a25c <fn_0800A1A0+0xbc>)
 800a206:	50e8      	str	r0, [r5, r3]
 800a208:	683d      	ldr	r5, [r7, #0]
 800a20a:	4b11      	ldr	r3, [pc, #68]	@ (800a250 <fn_0800A1A0+0xb0>)
 800a20c:	18ea      	adds	r2, r5, r3
 800a20e:	4b13      	ldr	r3, [pc, #76]	@ (800a25c <fn_0800A1A0+0xbc>)
 800a210:	58eb      	ldr	r3, [r5, r3]
 800a212:	4699      	mov	r9, r3
 800a214:	2388      	movs	r3, #136	@ 0x88
 800a216:	011b      	lsls	r3, r3, #4
 800a218:	0018      	movs	r0, r3
 800a21a:	58eb      	ldr	r3, [r5, r3]
 800a21c:	1c59      	adds	r1, r3, #1
 800a21e:	5029      	str	r1, [r5, r0]
 800a220:	4649      	mov	r1, r9
 800a222:	009b      	lsls	r3, r3, #2
 800a224:	505c      	str	r4, [r3, r1]
 800a226:	6864      	ldr	r4, [r4, #4]
 800a228:	4294      	cmp	r4, r2
 800a22a:	d1d2      	bne.n	800a1d2 <fn_0800A1A0+0x32>
 800a22c:	bcc0      	pop	{r6, r7}
 800a22e:	46b9      	mov	r9, r7
 800a230:	46b0      	mov	r8, r6
 800a232:	bcf8      	pop	{r3, r4, r5, r6, r7}
 800a234:	bc01      	pop	{r0}
 800a236:	4700      	bx	r0
 800a238:	2180      	movs	r1, #128	@ 0x80
 800a23a:	2220      	movs	r2, #32
 800a23c:	e7dc      	b.n	800a1f8 <fn_0800A1A0+0x58>
 800a23e:	46c0      	nop			@ (mov r8, r8)
 800a240:	030064c4 	.word	0x030064c4
 800a244:	00000888 	.word	0x00000888
 800a248:	00000884 	.word	0x00000884
 800a24c:	000010f4 	.word	0x000010f4
 800a250:	000010f0 	.word	0x000010f0
 800a254:	03001618 	.word	0x03001618
 800a258:	0000087c 	.word	0x0000087c
 800a25c:	00000878 	.word	0x00000878
