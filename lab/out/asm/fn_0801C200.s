fn_0801C200:
 801c200:	4b16      	ldr	r3, [pc, #88]	@ (801c25c <fn_0801C200+0x5c>)
 801c202:	b5f0      	push	{r4, r5, r6, r7, lr}
 801c204:	000f      	movs	r7, r1
 801c206:	6819      	ldr	r1, [r3, #0]
 801c208:	4b15      	ldr	r3, [pc, #84]	@ (801c260 <fn_0801C200+0x60>)
 801c20a:	58cc      	ldr	r4, [r1, r3]
 801c20c:	2396      	movs	r3, #150	@ 0x96
 801c20e:	021b      	lsls	r3, r3, #8
 801c210:	469c      	mov	ip, r3
 801c212:	1886      	adds	r6, r0, r2
 801c214:	44a4      	add	ip, r4
 801c216:	07d2      	lsls	r2, r2, #31
 801c218:	d40d      	bmi.n	801c236 <fn_0801C200+0x36>
 801c21a:	4812      	ldr	r0, [pc, #72]	@ (801c264 <fn_0801C200+0x64>)
 801c21c:	4912      	ldr	r1, [pc, #72]	@ (801c268 <fn_0801C200+0x68>)
 801c21e:	4a13      	ldr	r2, [pc, #76]	@ (801c26c <fn_0801C200+0x6c>)
 801c220:	4b13      	ldr	r3, [pc, #76]	@ (801c270 <fn_0801C200+0x70>)
 801c222:	6006      	str	r6, [r0, #0]
 801c224:	600c      	str	r4, [r1, #0]
 801c226:	34f0      	adds	r4, #240	@ 0xf0
 801c228:	6013      	str	r3, [r2, #0]
 801c22a:	19f6      	adds	r6, r6, r7
 801c22c:	45a4      	cmp	ip, r4
 801c22e:	d1f8      	bne.n	801c222 <fn_0801C200+0x22>
 801c230:	bcf0      	pop	{r4, r5, r6, r7}
 801c232:	bc01      	pop	{r0}
 801c234:	4700      	bx	r0
 801c236:	1c75      	adds	r5, r6, #1
 801c238:	2200      	movs	r2, #0
 801c23a:	1e73      	subs	r3, r6, #1
 801c23c:	8818      	ldrh	r0, [r3, #0]
 801c23e:	0a03      	lsrs	r3, r0, #8
 801c240:	5aa8      	ldrh	r0, [r5, r2]
 801c242:	0201      	lsls	r1, r0, #8
 801c244:	430b      	orrs	r3, r1
 801c246:	52a3      	strh	r3, [r4, r2]
 801c248:	3202      	adds	r2, #2
 801c24a:	2af0      	cmp	r2, #240	@ 0xf0
 801c24c:	d1f7      	bne.n	801c23e <fn_0801C200+0x3e>
 801c24e:	34f0      	adds	r4, #240	@ 0xf0
 801c250:	19f6      	adds	r6, r6, r7
 801c252:	19ed      	adds	r5, r5, r7
 801c254:	45a4      	cmp	ip, r4
 801c256:	d1ef      	bne.n	801c238 <fn_0801C200+0x38>
 801c258:	e7ea      	b.n	801c230 <fn_0801C200+0x30>
 801c25a:	46c0      	nop			@ (mov r8, r8)
 801c25c:	030064c4 	.word	0x030064c4
 801c260:	00005a30 	.word	0x00005a30
 801c264:	040000d4 	.word	0x040000d4
 801c268:	040000d8 	.word	0x040000d8
 801c26c:	040000dc 	.word	0x040000dc
 801c270:	80000078 	.word	0x80000078
