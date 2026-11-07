fn_0801C150:
 801c150:	4b16      	ldr	r3, [pc, #88]	@ (801c1ac <fn_0801C150+0x5c>)
 801c152:	b5f0      	push	{r4, r5, r6, r7, lr}
 801c154:	000f      	movs	r7, r1
 801c156:	6819      	ldr	r1, [r3, #0]
 801c158:	4b15      	ldr	r3, [pc, #84]	@ (801c1b0 <fn_0801C150+0x60>)
 801c15a:	58cc      	ldr	r4, [r1, r3]
 801c15c:	2396      	movs	r3, #150	@ 0x96
 801c15e:	021b      	lsls	r3, r3, #8
 801c160:	469c      	mov	ip, r3
 801c162:	1886      	adds	r6, r0, r2
 801c164:	44a4      	add	ip, r4
 801c166:	07d2      	lsls	r2, r2, #31
 801c168:	d40d      	bmi.n	801c186 <fn_0801C150+0x36>
 801c16a:	4812      	ldr	r0, [pc, #72]	@ (801c1b4 <fn_0801C150+0x64>)
 801c16c:	4912      	ldr	r1, [pc, #72]	@ (801c1b8 <fn_0801C150+0x68>)
 801c16e:	4a13      	ldr	r2, [pc, #76]	@ (801c1bc <fn_0801C150+0x6c>)
 801c170:	4b13      	ldr	r3, [pc, #76]	@ (801c1c0 <fn_0801C150+0x70>)
 801c172:	6006      	str	r6, [r0, #0]
 801c174:	600c      	str	r4, [r1, #0]
 801c176:	34f0      	adds	r4, #240	@ 0xf0
 801c178:	6013      	str	r3, [r2, #0]
 801c17a:	19f6      	adds	r6, r6, r7
 801c17c:	45a4      	cmp	ip, r4
 801c17e:	d1f8      	bne.n	801c172 <fn_0801C150+0x22>
 801c180:	bcf0      	pop	{r4, r5, r6, r7}
 801c182:	bc01      	pop	{r0}
 801c184:	4700      	bx	r0
 801c186:	1c75      	adds	r5, r6, #1
 801c188:	2200      	movs	r2, #0
 801c18a:	1e73      	subs	r3, r6, #1
 801c18c:	8818      	ldrh	r0, [r3, #0]
 801c18e:	0a03      	lsrs	r3, r0, #8
 801c190:	5aa8      	ldrh	r0, [r5, r2]
 801c192:	0201      	lsls	r1, r0, #8
 801c194:	430b      	orrs	r3, r1
 801c196:	52a3      	strh	r3, [r4, r2]
 801c198:	3202      	adds	r2, #2
 801c19a:	2af0      	cmp	r2, #240	@ 0xf0
 801c19c:	d1f7      	bne.n	801c18e <fn_0801C150+0x3e>
 801c19e:	34f0      	adds	r4, #240	@ 0xf0
 801c1a0:	19f6      	adds	r6, r6, r7
 801c1a2:	19ed      	adds	r5, r5, r7
 801c1a4:	45a4      	cmp	ip, r4
 801c1a6:	d1ef      	bne.n	801c188 <fn_0801C150+0x38>
 801c1a8:	e7ea      	b.n	801c180 <fn_0801C150+0x30>
 801c1aa:	46c0      	nop			@ (mov r8, r8)
 801c1ac:	030064c4 	.word	0x030064c4	@ data_030064C4
 801c1b0:	00005a30 	.word	0x00005a30
 801c1b4:	040000d4 	.word	0x040000d4
 801c1b8:	040000d8 	.word	0x040000d8
 801c1bc:	040000dc 	.word	0x040000dc
 801c1c0:	80000078 	.word	0x80000078
