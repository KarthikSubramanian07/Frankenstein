fn_0801201C:
 801201c:	b5f0      	push	{r4, r5, r6, r7, lr}
 801201e:	46ce      	mov	lr, r9
 8012020:	4647      	mov	r7, r8
 8012022:	b580      	push	{r7, lr}
 8012024:	000f      	movs	r7, r1
 8012026:	2180      	movs	r1, #128	@ 0x80
 8012028:	0013      	movs	r3, r2
 801202a:	6942      	ldr	r2, [r0, #20]
 801202c:	0389      	lsls	r1, r1, #14
 801202e:	1852      	adds	r2, r2, r1
 8012030:	0006      	movs	r6, r0
 8012032:	6901      	ldr	r1, [r0, #16]
 8012034:	b083      	sub	sp, #12
 8012036:	68c0      	ldr	r0, [r0, #12]
 8012038:	f7fe fed8 	bl	8010dec <fn_08010DEC>
 801203c:	4b34      	ldr	r3, [pc, #208]	@ (8012110 <fn_0801201C+0xf4>)
 801203e:	681a      	ldr	r2, [r3, #0]
 8012040:	4699      	mov	r9, r3
 8012042:	235a      	movs	r3, #90	@ 0x5a
 8012044:	5cc1      	ldrb	r1, [r0, r3]
 8012046:	23ea      	movs	r3, #234	@ 0xea
 8012048:	00db      	lsls	r3, r3, #3
 801204a:	58d3      	ldr	r3, [r2, r3]
 801204c:	225c      	movs	r2, #92	@ 0x5c
 801204e:	434a      	muls	r2, r1
 8012050:	189b      	adds	r3, r3, r2
 8012052:	6919      	ldr	r1, [r3, #16]
 8012054:	0005      	movs	r5, r0
 8012056:	2900      	cmp	r1, #0
 8012058:	d157      	bne.n	801210a <fn_0801201C+0xee>
 801205a:	0028      	movs	r0, r5
 801205c:	0031      	movs	r1, r6
 801205e:	3050      	adds	r0, #80	@ 0x50
 8012060:	f006 faa6 	bl	80185b0 <fn_080185B0>
 8012064:	693b      	ldr	r3, [r7, #16]
 8012066:	68fa      	ldr	r2, [r7, #12]
 8012068:	6931      	ldr	r1, [r6, #16]
 801206a:	68f0      	ldr	r0, [r6, #12]
 801206c:	f013 fa78 	bl	8025560 <fn_08025560>
 8012070:	6cfb      	ldr	r3, [r7, #76]	@ 0x4c
 8012072:	0004      	movs	r4, r0
 8012074:	035b      	lsls	r3, r3, #13
 8012076:	d43e      	bmi.n	80120f6 <fn_0801201C+0xda>
 8012078:	464b      	mov	r3, r9
 801207a:	681a      	ldr	r2, [r3, #0]
 801207c:	235a      	movs	r3, #90	@ 0x5a
 801207e:	622c      	str	r4, [r5, #32]
 8012080:	5ce9      	ldrb	r1, [r5, r3]
 8012082:	23ea      	movs	r3, #234	@ 0xea
 8012084:	00db      	lsls	r3, r3, #3
 8012086:	58d3      	ldr	r3, [r2, r3]
 8012088:	225c      	movs	r2, #92	@ 0x5c
 801208a:	434a      	muls	r2, r1
 801208c:	189b      	adds	r3, r3, r2
 801208e:	6bd8      	ldr	r0, [r3, #60]	@ 0x3c
 8012090:	2380      	movs	r3, #128	@ 0x80
 8012092:	0ce4      	lsrs	r4, r4, #19
 8012094:	011b      	lsls	r3, r3, #4
 8012096:	4a1f      	ldr	r2, [pc, #124]	@ (8012114 <fn_0801201C+0xf8>)
 8012098:	18e3      	adds	r3, r4, r3
 801209a:	009b      	lsls	r3, r3, #2
 801209c:	58d1      	ldr	r1, [r2, r3]
 801209e:	4680      	mov	r8, r0
 80120a0:	9201      	str	r2, [sp, #4]
 80120a2:	f013 fa9b 	bl	80255dc <fn_080255DC>
 80120a6:	9a01      	ldr	r2, [sp, #4]
 80120a8:	00a4      	lsls	r4, r4, #2
 80120aa:	58a1      	ldr	r1, [r4, r2]
 80120ac:	63e8      	str	r0, [r5, #60]	@ 0x3c
 80120ae:	4640      	mov	r0, r8
 80120b0:	f013 fa94 	bl	80255dc <fn_080255DC>
 80120b4:	6933      	ldr	r3, [r6, #16]
 80120b6:	6939      	ldr	r1, [r7, #16]
 80120b8:	6428      	str	r0, [r5, #64]	@ 0x40
 80120ba:	1ac9      	subs	r1, r1, r3
 80120bc:	68f8      	ldr	r0, [r7, #12]
 80120be:	68f3      	ldr	r3, [r6, #12]
 80120c0:	1ac0      	subs	r0, r0, r3
 80120c2:	f7fd fe9b 	bl	800fdfc <fn_0800FDFC>
 80120c6:	6973      	ldr	r3, [r6, #20]
 80120c8:	697c      	ldr	r4, [r7, #20]
 80120ca:	4641      	mov	r1, r8
 80120cc:	1ae4      	subs	r4, r4, r3
 80120ce:	f013 fa5f 	bl	8025590 <fn_08025590>
 80120d2:	1e01      	subs	r1, r0, #0
 80120d4:	dc00      	bgt.n	80120d8 <fn_0801201C+0xbc>
 80120d6:	2101      	movs	r1, #1
 80120d8:	0020      	movs	r0, r4
 80120da:	f013 fa59 	bl	8025590 <fn_08025590>
 80120de:	6468      	str	r0, [r5, #68]	@ 0x44
 80120e0:	0028      	movs	r0, r5
 80120e2:	f7ff ff37 	bl	8011f54 <fn_08011F54>
 80120e6:	0028      	movs	r0, r5
 80120e8:	b003      	add	sp, #12
 80120ea:	bcc0      	pop	{r6, r7}
 80120ec:	46b9      	mov	r9, r7
 80120ee:	46b0      	mov	r8, r6
 80120f0:	bcf0      	pop	{r4, r5, r6, r7}
 80120f2:	bc02      	pop	{r1}
 80120f4:	4708      	bx	r1
 80120f6:	f7f4 fd03 	bl	8006b00 <fn_08006B00>
 80120fa:	4680      	mov	r8, r0
 80120fc:	f7f4 fd00 	bl	8006b00 <fn_08006B00>
 8012100:	4643      	mov	r3, r8
 8012102:	1a18      	subs	r0, r3, r0
 8012104:	0500      	lsls	r0, r0, #20
 8012106:	1824      	adds	r4, r4, r0
 8012108:	e7b6      	b.n	8012078 <fn_0801201C+0x5c>
 801210a:	f008 f8dd 	bl	801a2c8 <fn_0801A2C8>
 801210e:	e7a4      	b.n	801205a <fn_0801201C+0x3e>
 8012110:	030064c4 	.word	0x030064c4
 8012114:	081397cc 	.word	0x081397cc
