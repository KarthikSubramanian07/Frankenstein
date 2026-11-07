fn_0800C188:
 800c188:	b5f0      	push	{r4, r5, r6, r7, lr}
 800c18a:	4657      	mov	r7, sl
 800c18c:	464e      	mov	r6, r9
 800c18e:	46de      	mov	lr, fp
 800c190:	4645      	mov	r5, r8
 800c192:	b5e0      	push	{r5, r6, r7, lr}
 800c194:	4f8e      	ldr	r7, [pc, #568]	@ (800c3d0 <fn_0800C188+0x248>)
 800c196:	4b8f      	ldr	r3, [pc, #572]	@ (800c3d4 <fn_0800C188+0x24c>)
 800c198:	6839      	ldr	r1, [r7, #0]
 800c19a:	8bc2      	ldrh	r2, [r0, #30]
 800c19c:	58cb      	ldr	r3, [r1, r3]
 800c19e:	0092      	lsls	r2, r2, #2
 800c1a0:	189b      	adds	r3, r3, r2
 800c1a2:	78db      	ldrb	r3, [r3, #3]
 800c1a4:	0006      	movs	r6, r0
 800c1a6:	b083      	sub	sp, #12
 800c1a8:	065a      	lsls	r2, r3, #25
 800c1aa:	d442      	bmi.n	800c232 <fn_0800C188+0xaa>
 800c1ac:	211a      	movs	r1, #26
 800c1ae:	5e42      	ldrsh	r2, [r0, r1]
 800c1b0:	2103      	movs	r1, #3
 800c1b2:	2407      	movs	r4, #7
 800c1b4:	09db      	lsrs	r3, r3, #7
 800c1b6:	021b      	lsls	r3, r3, #8
 800c1b8:	4053      	eors	r3, r2
 800c1ba:	4a87      	ldr	r2, [pc, #540]	@ (800c3d8 <fn_0800C188+0x250>)
 800c1bc:	189a      	adds	r2, r3, r2
 800c1be:	0a10      	lsrs	r0, r2, #8
 800c1c0:	4008      	ands	r0, r1
 800c1c2:	0005      	movs	r5, r0
 800c1c4:	4682      	mov	sl, r0
 800c1c6:	0990      	lsrs	r0, r2, #6
 800c1c8:	08d2      	lsrs	r2, r2, #3
 800c1ca:	4008      	ands	r0, r1
 800c1cc:	4011      	ands	r1, r2
 800c1ce:	4681      	mov	r9, r0
 800c1d0:	468b      	mov	fp, r1
 800c1d2:	401c      	ands	r4, r3
 800c1d4:	2d03      	cmp	r5, #3
 800c1d6:	d100      	bne.n	800c1da <fn_0800C188+0x52>
 800c1d8:	e09f      	b.n	800c31a <fn_0800C188+0x192>
 800c1da:	3c06      	subs	r4, #6
 800c1dc:	2c01      	cmp	r4, #1
 800c1de:	d900      	bls.n	800c1e2 <fn_0800C188+0x5a>
 800c1e0:	e0a3      	b.n	800c32a <fn_0800C188+0x1a2>
 800c1e2:	8af2      	ldrh	r2, [r6, #22]
 800c1e4:	4b7d      	ldr	r3, [pc, #500]	@ (800c3dc <fn_0800C188+0x254>)
 800c1e6:	429a      	cmp	r2, r3
 800c1e8:	d017      	beq.n	800c21a <fn_0800C188+0x92>
 800c1ea:	6839      	ldr	r1, [r7, #0]
 800c1ec:	4b7c      	ldr	r3, [pc, #496]	@ (800c3e0 <fn_0800C188+0x258>)
 800c1ee:	58c8      	ldr	r0, [r1, r3]
 800c1f0:	0053      	lsls	r3, r2, #1
 800c1f2:	189b      	adds	r3, r3, r2
 800c1f4:	009b      	lsls	r3, r3, #2
 800c1f6:	18c3      	adds	r3, r0, r3
 800c1f8:	895b      	ldrh	r3, [r3, #10]
 800c1fa:	009c      	lsls	r4, r3, #2
 800c1fc:	18e4      	adds	r4, r4, r3
 800c1fe:	23df      	movs	r3, #223	@ 0xdf
 800c200:	011b      	lsls	r3, r3, #4
 800c202:	58cd      	ldr	r5, [r1, r3]
 800c204:	00e4      	lsls	r4, r4, #3
 800c206:	192d      	adds	r5, r5, r4
 800c208:	2d00      	cmp	r5, #0
 800c20a:	d006      	beq.n	800c21a <fn_0800C188+0x92>
 800c20c:	0029      	movs	r1, r5
 800c20e:	2000      	movs	r0, #0
 800c210:	f009 f8d6 	bl	80153c0 <fn_080153C0>
 800c214:	2800      	cmp	r0, #0
 800c216:	d100      	bne.n	800c21a <fn_0800C188+0x92>
 800c218:	e08c      	b.n	800c334 <fn_0800C188+0x1ac>
 800c21a:	2300      	movs	r3, #0
 800c21c:	4698      	mov	r8, r3
 800c21e:	4640      	mov	r0, r8
 800c220:	b003      	add	sp, #12
 800c222:	bcf0      	pop	{r4, r5, r6, r7}
 800c224:	46bb      	mov	fp, r7
 800c226:	46b2      	mov	sl, r6
 800c228:	46a9      	mov	r9, r5
 800c22a:	46a0      	mov	r8, r4
 800c22c:	bcf0      	pop	{r4, r5, r6, r7}
 800c22e:	bc02      	pop	{r1}
 800c230:	4708      	bx	r1
 800c232:	2300      	movs	r3, #0
 800c234:	2401      	movs	r4, #1
 800c236:	4699      	mov	r9, r3
 800c238:	469a      	mov	sl, r3
 800c23a:	469b      	mov	fp, r3
 800c23c:	4698      	mov	r8, r3
 800c23e:	4264      	negs	r4, r4
 800c240:	0021      	movs	r1, r4
 800c242:	0030      	movs	r0, r6
 800c244:	f008 ff1e 	bl	8015084 <fn_08015084>
 800c248:	1e04      	subs	r4, r0, #0
 800c24a:	dbe8      	blt.n	800c21e <fn_0800C188+0x96>
 800c24c:	22df      	movs	r2, #223	@ 0xdf
 800c24e:	6839      	ldr	r1, [r7, #0]
 800c250:	0112      	lsls	r2, r2, #4
 800c252:	00a3      	lsls	r3, r4, #2
 800c254:	588d      	ldr	r5, [r1, r2]
 800c256:	191b      	adds	r3, r3, r4
 800c258:	00db      	lsls	r3, r3, #3
 800c25a:	18ed      	adds	r5, r5, r3
 800c25c:	0029      	movs	r1, r5
 800c25e:	2000      	movs	r0, #0
 800c260:	f009 f8ae 	bl	80153c0 <fn_080153C0>
 800c264:	9001      	str	r0, [sp, #4]
 800c266:	2800      	cmp	r0, #0
 800c268:	d1ea      	bne.n	800c240 <fn_0800C188+0xb8>
 800c26a:	2200      	movs	r2, #0
 800c26c:	2103      	movs	r1, #3
 800c26e:	2030      	movs	r0, #48	@ 0x30
 800c270:	f011 fa04 	bl	801d67c <fn_0801D67C>
 800c274:	4680      	mov	r8, r0
 800c276:	2230      	movs	r2, #48	@ 0x30
 800c278:	2100      	movs	r1, #0
 800c27a:	f014 fb89 	bl	8020990 <fn_08020990>
 800c27e:	4640      	mov	r0, r8
 800c280:	f00c f94c 	bl	801851c <fn_0801851C>
 800c284:	4640      	mov	r0, r8
 800c286:	4b57      	ldr	r3, [pc, #348]	@ (800c3e4 <fn_0800C188+0x25c>)
 800c288:	60c5      	str	r5, [r0, #12]
 800c28a:	2200      	movs	r2, #0
 800c28c:	6128      	str	r0, [r5, #16]
 800c28e:	6083      	str	r3, [r0, #8]
 800c290:	2326      	movs	r3, #38	@ 0x26
 800c292:	54c2      	strb	r2, [r0, r3]
 800c294:	221c      	movs	r2, #28
 800c296:	5eb3      	ldrsh	r3, [r6, r2]
 800c298:	2205      	movs	r2, #5
 800c29a:	6283      	str	r3, [r0, #40]	@ 0x28
 800c29c:	232c      	movs	r3, #44	@ 0x2c
 800c29e:	54c2      	strb	r2, [r0, r3]
 800c2a0:	6829      	ldr	r1, [r5, #0]
 800c2a2:	0003      	movs	r3, r0
 800c2a4:	6181      	str	r1, [r0, #24]
 800c2a6:	2001      	movs	r0, #1
 800c2a8:	321f      	adds	r2, #31
 800c2aa:	5498      	strb	r0, [r3, r2]
 800c2ac:	4652      	mov	r2, sl
 800c2ae:	9300      	str	r3, [sp, #0]
 800c2b0:	2a02      	cmp	r2, #2
 800c2b2:	d100      	bne.n	800c2b6 <fn_0800C188+0x12e>
 800c2b4:	e080      	b.n	800c3b8 <fn_0800C188+0x230>
 800c2b6:	2a03      	cmp	r2, #3
 800c2b8:	d061      	beq.n	800c37e <fn_0800C188+0x1f6>
 800c2ba:	0028      	movs	r0, r5
 800c2bc:	2a01      	cmp	r2, #1
 800c2be:	d147      	bne.n	800c350 <fn_0800C188+0x1c8>
 800c2c0:	f008 fad8 	bl	8014874 <fn_08014874>
 800c2c4:	9b00      	ldr	r3, [sp, #0]
 800c2c6:	6158      	str	r0, [r3, #20]
 800c2c8:	465b      	mov	r3, fp
 800c2ca:	2b02      	cmp	r3, #2
 800c2cc:	d054      	beq.n	800c378 <fn_0800C188+0x1f0>
 800c2ce:	2b03      	cmp	r3, #3
 800c2d0:	d04f      	beq.n	800c372 <fn_0800C188+0x1ea>
 800c2d2:	3b01      	subs	r3, #1
 800c2d4:	425a      	negs	r2, r3
 800c2d6:	4153      	adcs	r3, r2
 800c2d8:	2280      	movs	r2, #128	@ 0x80
 800c2da:	045b      	lsls	r3, r3, #17
 800c2dc:	0292      	lsls	r2, r2, #10
 800c2de:	189b      	adds	r3, r3, r2
 800c2e0:	9a00      	ldr	r2, [sp, #0]
 800c2e2:	6113      	str	r3, [r2, #16]
 800c2e4:	464b      	mov	r3, r9
 800c2e6:	2b02      	cmp	r3, #2
 800c2e8:	d041      	beq.n	800c36e <fn_0800C188+0x1e6>
 800c2ea:	2b03      	cmp	r3, #3
 800c2ec:	d03c      	beq.n	800c368 <fn_0800C188+0x1e0>
 800c2ee:	1e5a      	subs	r2, r3, #1
 800c2f0:	4253      	negs	r3, r2
 800c2f2:	415a      	adcs	r2, r3
 800c2f4:	2346      	movs	r3, #70	@ 0x46
 800c2f6:	4252      	negs	r2, r2
 800c2f8:	4013      	ands	r3, r2
 800c2fa:	3323      	adds	r3, #35	@ 0x23
 800c2fc:	9a00      	ldr	r2, [sp, #0]
 800c2fe:	2112      	movs	r1, #18
 800c300:	61d3      	str	r3, [r2, #28]
 800c302:	0028      	movs	r0, r5
 800c304:	f009 f8d2 	bl	80154ac <fn_080154AC>
 800c308:	9800      	ldr	r0, [sp, #0]
 800c30a:	f006 fa31 	bl	8012770 <fn_08012770>
 800c30e:	9b01      	ldr	r3, [sp, #4]
 800c310:	2b00      	cmp	r3, #0
 800c312:	d126      	bne.n	800c362 <fn_0800C188+0x1da>
 800c314:	3301      	adds	r3, #1
 800c316:	4698      	mov	r8, r3
 800c318:	e792      	b.n	800c240 <fn_0800C188+0xb8>
 800c31a:	231c      	movs	r3, #28
 800c31c:	5ef0      	ldrsh	r0, [r6, r3]
 800c31e:	3c06      	subs	r4, #6
 800c320:	f006 f9ca 	bl	80126b8 <fn_080126B8>
 800c324:	2c01      	cmp	r4, #1
 800c326:	d800      	bhi.n	800c32a <fn_0800C188+0x1a2>
 800c328:	e75b      	b.n	800c1e2 <fn_0800C188+0x5a>
 800c32a:	2300      	movs	r3, #0
 800c32c:	2401      	movs	r4, #1
 800c32e:	4698      	mov	r8, r3
 800c330:	4264      	negs	r4, r4
 800c332:	e785      	b.n	800c240 <fn_0800C188+0xb8>
 800c334:	10e3      	asrs	r3, r4, #3
 800c336:	08a4      	lsrs	r4, r4, #2
 800c338:	18e4      	adds	r4, r4, r3
 800c33a:	0122      	lsls	r2, r4, #4
 800c33c:	18a4      	adds	r4, r4, r2
 800c33e:	0222      	lsls	r2, r4, #8
 800c340:	18a4      	adds	r4, r4, r2
 800c342:	0422      	lsls	r2, r4, #16
 800c344:	18a4      	adds	r4, r4, r2
 800c346:	00a4      	lsls	r4, r4, #2
 800c348:	18e4      	adds	r4, r4, r3
 800c34a:	2301      	movs	r3, #1
 800c34c:	9301      	str	r3, [sp, #4]
 800c34e:	e78c      	b.n	800c26a <fn_0800C188+0xe2>
 800c350:	f008 f95c 	bl	801460c <fn_0801460C>
 800c354:	9a00      	ldr	r2, [sp, #0]
 800c356:	682b      	ldr	r3, [r5, #0]
 800c358:	6150      	str	r0, [r2, #20]
 800c35a:	4298      	cmp	r0, r3
 800c35c:	ddb4      	ble.n	800c2c8 <fn_0800C188+0x140>
 800c35e:	6153      	str	r3, [r2, #20]
 800c360:	e7b2      	b.n	800c2c8 <fn_0800C188+0x140>
 800c362:	2301      	movs	r3, #1
 800c364:	4698      	mov	r8, r3
 800c366:	e75a      	b.n	800c21e <fn_0800C188+0x96>
 800c368:	23af      	movs	r3, #175	@ 0xaf
 800c36a:	005b      	lsls	r3, r3, #1
 800c36c:	e7c6      	b.n	800c2fc <fn_0800C188+0x174>
 800c36e:	23af      	movs	r3, #175	@ 0xaf
 800c370:	e7c4      	b.n	800c2fc <fn_0800C188+0x174>
 800c372:	2380      	movs	r3, #128	@ 0x80
 800c374:	035b      	lsls	r3, r3, #13
 800c376:	e7b3      	b.n	800c2e0 <fn_0800C188+0x158>
 800c378:	2380      	movs	r3, #128	@ 0x80
 800c37a:	031b      	lsls	r3, r3, #12
 800c37c:	e7b0      	b.n	800c2e0 <fn_0800C188+0x158>
 800c37e:	2206      	movs	r2, #6
 800c380:	212c      	movs	r1, #44	@ 0x2c
 800c382:	0028      	movs	r0, r5
 800c384:	545a      	strb	r2, [r3, r1]
 800c386:	f008 f941 	bl	801460c <fn_0801460C>
 800c38a:	682b      	ldr	r3, [r5, #0]
 800c38c:	4283      	cmp	r3, r0
 800c38e:	dd00      	ble.n	800c392 <fn_0800C188+0x20a>
 800c390:	0003      	movs	r3, r0
 800c392:	9a00      	ldr	r2, [sp, #0]
 800c394:	0028      	movs	r0, r5
 800c396:	6153      	str	r3, [r2, #20]
 800c398:	f008 f988 	bl	80146ac <fn_080146AC>
 800c39c:	682b      	ldr	r3, [r5, #0]
 800c39e:	4283      	cmp	r3, r0
 800c3a0:	da00      	bge.n	800c3a4 <fn_0800C188+0x21c>
 800c3a2:	0003      	movs	r3, r0
 800c3a4:	9a00      	ldr	r2, [sp, #0]
 800c3a6:	6193      	str	r3, [r2, #24]
 800c3a8:	f7fa fbaa 	bl	8006b00 <fn_08006B00>
 800c3ac:	2301      	movs	r3, #1
 800c3ae:	2224      	movs	r2, #36	@ 0x24
 800c3b0:	9900      	ldr	r1, [sp, #0]
 800c3b2:	4003      	ands	r3, r0
 800c3b4:	548b      	strb	r3, [r1, r2]
 800c3b6:	e787      	b.n	800c2c8 <fn_0800C188+0x140>
 800c3b8:	0028      	movs	r0, r5
 800c3ba:	f008 fc0b 	bl	8014bd4 <fn_08014BD4>
 800c3be:	9a00      	ldr	r2, [sp, #0]
 800c3c0:	682b      	ldr	r3, [r5, #0]
 800c3c2:	6150      	str	r0, [r2, #20]
 800c3c4:	4298      	cmp	r0, r3
 800c3c6:	dc00      	bgt.n	800c3ca <fn_0800C188+0x242>
 800c3c8:	e77e      	b.n	800c2c8 <fn_0800C188+0x140>
 800c3ca:	6153      	str	r3, [r2, #20]
 800c3cc:	e77c      	b.n	800c2c8 <fn_0800C188+0x140>
 800c3ce:	46c0      	nop			@ (mov r8, r8)
 800c3d0:	030064c4 	.word	0x030064c4	@ data_030064C4
 800c3d4:	00000e04 	.word	0x00000e04
 800c3d8:	ffffcc00 	.word	0xffffcc00
 800c3dc:	0000ffff 	.word	0x0000ffff
 800c3e0:	00000e0c 	.word	0x00000e0c
 800c3e4:	08012255 	.word	0x08012255	@ fn_08012254
