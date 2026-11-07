fn_0800F190:
 800f190:	b5f0      	push	{r4, r5, r6, r7, lr}
 800f192:	46de      	mov	lr, fp
 800f194:	4645      	mov	r5, r8
 800f196:	4657      	mov	r7, sl
 800f198:	464e      	mov	r6, r9
 800f19a:	b5e0      	push	{r5, r6, r7, lr}
 800f19c:	b085      	sub	sp, #20
 800f19e:	0014      	movs	r4, r2
 800f1a0:	4688      	mov	r8, r1
 800f1a2:	001d      	movs	r5, r3
 800f1a4:	0007      	movs	r7, r0
 800f1a6:	9101      	str	r1, [sp, #4]
 800f1a8:	9000      	str	r0, [sp, #0]
 800f1aa:	f003 f843 	bl	8012234 <fn_08012234>
 800f1ae:	1e43      	subs	r3, r0, #1
 800f1b0:	4198      	sbcs	r0, r3
 800f1b2:	4305      	orrs	r5, r0
 800f1b4:	4640      	mov	r0, r8
 800f1b6:	4e42      	ldr	r6, [pc, #264]	@ (800f2c0 <fn_0800F190+0x130>)
 800f1b8:	4b42      	ldr	r3, [pc, #264]	@ (800f2c4 <fn_0800F190+0x134>)
 800f1ba:	6832      	ldr	r2, [r6, #0]
 800f1bc:	54d5      	strb	r5, [r2, r3]
 800f1be:	4b42      	ldr	r3, [pc, #264]	@ (800f2c8 <fn_0800F190+0x138>)
 800f1c0:	50d7      	str	r7, [r2, r3]
 800f1c2:	3304      	adds	r3, #4
 800f1c4:	50d0      	str	r0, [r2, r3]
 800f1c6:	4b41      	ldr	r3, [pc, #260]	@ (800f2cc <fn_0800F190+0x13c>)
 800f1c8:	50d4      	str	r4, [r2, r3]
 800f1ca:	235b      	movs	r3, #91	@ 0x5b
 800f1cc:	4d40      	ldr	r5, [pc, #256]	@ (800f2d0 <fn_0800F190+0x140>)
 800f1ce:	5cfb      	ldrb	r3, [r7, r3]
 800f1d0:	5952      	ldr	r2, [r2, r5]
 800f1d2:	041b      	lsls	r3, r3, #16
 800f1d4:	1919      	adds	r1, r3, r4
 800f1d6:	6011      	str	r1, [r2, #0]
 800f1d8:	1ae1      	subs	r1, r4, r3
 800f1da:	6051      	str	r1, [r2, #4]
 800f1dc:	1819      	adds	r1, r3, r0
 800f1de:	1ac3      	subs	r3, r0, r3
 800f1e0:	60d1      	str	r1, [r2, #12]
 800f1e2:	6093      	str	r3, [r2, #8]
 800f1e4:	0021      	movs	r1, r4
 800f1e6:	f016 f9ed 	bl	80255c4 <fn_080255C4>
 800f1ea:	2100      	movs	r1, #0
 800f1ec:	6833      	ldr	r3, [r6, #0]
 800f1ee:	46b3      	mov	fp, r6
 800f1f0:	0006      	movs	r6, r0
 800f1f2:	4a38      	ldr	r2, [pc, #224]	@ (800f2d4 <fn_0800F190+0x144>)
 800f1f4:	9002      	str	r0, [sp, #8]
 800f1f6:	5099      	str	r1, [r3, r2]
 800f1f8:	6802      	ldr	r2, [r0, #0]
 800f1fa:	4837      	ldr	r0, [pc, #220]	@ (800f2d8 <fn_0800F190+0x148>)
 800f1fc:	501a      	str	r2, [r3, r0]
 800f1fe:	3808      	subs	r0, #8
 800f200:	501a      	str	r2, [r3, r0]
 800f202:	4a36      	ldr	r2, [pc, #216]	@ (800f2dc <fn_0800F190+0x14c>)
 800f204:	6870      	ldr	r0, [r6, #4]
 800f206:	5098      	str	r0, [r3, r2]
 800f208:	4835      	ldr	r0, [pc, #212]	@ (800f2e0 <fn_0800F190+0x150>)
 800f20a:	5a1a      	ldrh	r2, [r3, r0]
 800f20c:	3201      	adds	r2, #1
 800f20e:	521a      	strh	r2, [r3, r0]
 800f210:	4a34      	ldr	r2, [pc, #208]	@ (800f2e4 <fn_0800F190+0x154>)
 800f212:	5099      	str	r1, [r3, r2]
 800f214:	5959      	ldr	r1, [r3, r5]
 800f216:	4a34      	ldr	r2, [pc, #208]	@ (800f2e8 <fn_0800F190+0x158>)
 800f218:	5898      	ldr	r0, [r3, r2]
 800f21a:	688a      	ldr	r2, [r1, #8]
 800f21c:	4d33      	ldr	r5, [pc, #204]	@ (800f2ec <fn_0800F190+0x15c>)
 800f21e:	1a12      	subs	r2, r2, r0
 800f220:	1952      	adds	r2, r2, r5
 800f222:	15d2      	asrs	r2, r2, #23
 800f224:	4690      	mov	r8, r2
 800f226:	68ca      	ldr	r2, [r1, #12]
 800f228:	1a12      	subs	r2, r2, r0
 800f22a:	2080      	movs	r0, #128	@ 0x80
 800f22c:	0380      	lsls	r0, r0, #14
 800f22e:	1812      	adds	r2, r2, r0
 800f230:	15d2      	asrs	r2, r2, #23
 800f232:	4590      	cmp	r8, r2
 800f234:	dc2e      	bgt.n	800f294 <fn_0800F190+0x104>
 800f236:	482e      	ldr	r0, [pc, #184]	@ (800f2f0 <fn_0800F190+0x160>)
 800f238:	684f      	ldr	r7, [r1, #4]
 800f23a:	5818      	ldr	r0, [r3, r0]
 800f23c:	680b      	ldr	r3, [r1, #0]
 800f23e:	2180      	movs	r1, #128	@ 0x80
 800f240:	1a1b      	subs	r3, r3, r0
 800f242:	0389      	lsls	r1, r1, #14
 800f244:	185b      	adds	r3, r3, r1
 800f246:	15db      	asrs	r3, r3, #23
 800f248:	3201      	adds	r2, #1
 800f24a:	4699      	mov	r9, r3
 800f24c:	4692      	mov	sl, r2
 800f24e:	1a3f      	subs	r7, r7, r0
 800f250:	197f      	adds	r7, r7, r5
 800f252:	15ff      	asrs	r7, r7, #23
 800f254:	4646      	mov	r6, r8
 800f256:	46b8      	mov	r8, r7
 800f258:	4f26      	ldr	r7, [pc, #152]	@ (800f2f4 <fn_0800F190+0x164>)
 800f25a:	9403      	str	r4, [sp, #12]
 800f25c:	1c5c      	adds	r4, r3, #1
 800f25e:	4645      	mov	r5, r8
 800f260:	45c8      	cmp	r8, r9
 800f262:	dd03      	ble.n	800f26c <fn_0800F190+0xdc>
 800f264:	e012      	b.n	800f28c <fn_0800F190+0xfc>
 800f266:	3501      	adds	r5, #1
 800f268:	42a5      	cmp	r5, r4
 800f26a:	d00f      	beq.n	800f28c <fn_0800F190+0xfc>
 800f26c:	003a      	movs	r2, r7
 800f26e:	0029      	movs	r1, r5
 800f270:	0030      	movs	r0, r6
 800f272:	f001 f887 	bl	8010384 <fn_08010384>
 800f276:	2800      	cmp	r0, #0
 800f278:	d1f5      	bne.n	800f266 <fn_0800F190+0xd6>
 800f27a:	b005      	add	sp, #20
 800f27c:	bcf0      	pop	{r4, r5, r6, r7}
 800f27e:	46bb      	mov	fp, r7
 800f280:	46b2      	mov	sl, r6
 800f282:	46a9      	mov	r9, r5
 800f284:	46a0      	mov	r8, r4
 800f286:	bcf0      	pop	{r4, r5, r6, r7}
 800f288:	bc02      	pop	{r1}
 800f28a:	4708      	bx	r1
 800f28c:	3601      	adds	r6, #1
 800f28e:	45b2      	cmp	sl, r6
 800f290:	d1e5      	bne.n	800f25e <fn_0800F190+0xce>
 800f292:	9c03      	ldr	r4, [sp, #12]
 800f294:	9d00      	ldr	r5, [sp, #0]
 800f296:	0028      	movs	r0, r5
 800f298:	f000 ff24 	bl	80100e4 <fn_080100E4>
 800f29c:	465b      	mov	r3, fp
 800f29e:	228b      	movs	r2, #139	@ 0x8b
 800f2a0:	681b      	ldr	r3, [r3, #0]
 800f2a2:	0112      	lsls	r2, r2, #4
 800f2a4:	589a      	ldr	r2, [r3, r2]
 800f2a6:	632a      	str	r2, [r5, #48]	@ 0x30
 800f2a8:	4a0c      	ldr	r2, [pc, #48]	@ (800f2dc <fn_0800F190+0x14c>)
 800f2aa:	589b      	ldr	r3, [r3, r2]
 800f2ac:	636b      	str	r3, [r5, #52]	@ 0x34
 800f2ae:	9b01      	ldr	r3, [sp, #4]
 800f2b0:	0028      	movs	r0, r5
 800f2b2:	60eb      	str	r3, [r5, #12]
 800f2b4:	612c      	str	r4, [r5, #16]
 800f2b6:	9902      	ldr	r1, [sp, #8]
 800f2b8:	f000 ff82 	bl	80101c0 <fn_080101C0>
 800f2bc:	2001      	movs	r0, #1
 800f2be:	e7dc      	b.n	800f27a <fn_0800F190+0xea>
 800f2c0:	030064c4 	.word	0x030064c4	@ data_030064C4
 800f2c4:	00000928 	.word	0x00000928
 800f2c8:	0000088c 	.word	0x0000088c
 800f2cc:	00000894 	.word	0x00000894
 800f2d0:	000008a8 	.word	0x000008a8
 800f2d4:	000008bc 	.word	0x000008bc
 800f2d8:	000008b8 	.word	0x000008b8
 800f2dc:	000008b4 	.word	0x000008b4
 800f2e0:	00001122 	.word	0x00001122
 800f2e4:	000008dc 	.word	0x000008dc
 800f2e8:	00000e28 	.word	0x00000e28
 800f2ec:	ffe00000 	.word	0xffe00000
 800f2f0:	00000e2c 	.word	0x00000e2c
 800f2f4:	0800e2cd 	.word	0x0800e2cd	@ fn_0800E2CC
