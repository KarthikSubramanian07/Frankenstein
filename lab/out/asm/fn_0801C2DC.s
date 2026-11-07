fn_0801C2DC:
 801c2dc:	b5f0      	push	{r4, r5, r6, r7, lr}
 801c2de:	4657      	mov	r7, sl
 801c2e0:	464e      	mov	r6, r9
 801c2e2:	4645      	mov	r5, r8
 801c2e4:	46de      	mov	lr, fp
 801c2e6:	0003      	movs	r3, r0
 801c2e8:	b5e0      	push	{r5, r6, r7, lr}
 801c2ea:	6884      	ldr	r4, [r0, #8]
 801c2ec:	6805      	ldr	r5, [r0, #0]
 801c2ee:	1b60      	subs	r0, r4, r5
 801c2f0:	17c2      	asrs	r2, r0, #31
 801c2f2:	1880      	adds	r0, r0, r2
 801c2f4:	4050      	eors	r0, r2
 801c2f6:	68da      	ldr	r2, [r3, #12]
 801c2f8:	685b      	ldr	r3, [r3, #4]
 801c2fa:	1ad6      	subs	r6, r2, r3
 801c2fc:	17f7      	asrs	r7, r6, #31
 801c2fe:	19f6      	adds	r6, r6, r7
 801c300:	b085      	sub	sp, #20
 801c302:	407e      	eors	r6, r7
 801c304:	42ac      	cmp	r4, r5
 801c306:	dd4a      	ble.n	801c39e <fn_0801C2DC+0xc2>
 801c308:	2400      	movs	r4, #0
 801c30a:	9401      	str	r4, [sp, #4]
 801c30c:	3401      	adds	r4, #1
 801c30e:	46a0      	mov	r8, r4
 801c310:	429a      	cmp	r2, r3
 801c312:	dd4a      	ble.n	801c3aa <fn_0801C2DC+0xce>
 801c314:	22f0      	movs	r2, #240	@ 0xf0
 801c316:	4693      	mov	fp, r2
 801c318:	4a4e      	ldr	r2, [pc, #312]	@ (801c454 <fn_0801C2DC+0x178>)
 801c31a:	6814      	ldr	r4, [r2, #0]
 801c31c:	01da      	lsls	r2, r3, #7
 801c31e:	00db      	lsls	r3, r3, #3
 801c320:	1ad2      	subs	r2, r2, r3
 801c322:	4b4d      	ldr	r3, [pc, #308]	@ (801c458 <fn_0801C2DC+0x17c>)
 801c324:	58e3      	ldr	r3, [r4, r3]
 801c326:	24ff      	movs	r4, #255	@ 0xff
 801c328:	0052      	lsls	r2, r2, #1
 801c32a:	1952      	adds	r2, r2, r5
 801c32c:	400c      	ands	r4, r1
 801c32e:	189b      	adds	r3, r3, r2
 801c330:	46a4      	mov	ip, r4
 801c332:	1b82      	subs	r2, r0, r6
 801c334:	4286      	cmp	r6, r0
 801c336:	dd3c      	ble.n	801c3b2 <fn_0801C2DC+0xd6>
 801c338:	21ff      	movs	r1, #255	@ 0xff
 801c33a:	468a      	mov	sl, r1
 801c33c:	0221      	lsls	r1, r4, #8
 801c33e:	9101      	str	r1, [sp, #4]
 801c340:	4271      	negs	r1, r6
 801c342:	0035      	movs	r5, r6
 801c344:	2701      	movs	r7, #1
 801c346:	4689      	mov	r9, r1
 801c348:	9602      	str	r6, [sp, #8]
 801c34a:	0019      	movs	r1, r3
 801c34c:	43b9      	bics	r1, r7
 801c34e:	4656      	mov	r6, sl
 801c350:	880c      	ldrh	r4, [r1, #0]
 801c352:	423b      	tst	r3, r7
 801c354:	d014      	beq.n	801c380 <fn_0801C2DC+0xa4>
 801c356:	4034      	ands	r4, r6
 801c358:	9e01      	ldr	r6, [sp, #4]
 801c35a:	4334      	orrs	r4, r6
 801c35c:	800c      	strh	r4, [r1, #0]
 801c35e:	2d00      	cmp	r5, #0
 801c360:	d014      	beq.n	801c38c <fn_0801C2DC+0xb0>
 801c362:	0051      	lsls	r1, r2, #1
 801c364:	445b      	add	r3, fp
 801c366:	1812      	adds	r2, r2, r0
 801c368:	3d01      	subs	r5, #1
 801c36a:	4589      	cmp	r9, r1
 801c36c:	dced      	bgt.n	801c34a <fn_0801C2DC+0x6e>
 801c36e:	9902      	ldr	r1, [sp, #8]
 801c370:	4443      	add	r3, r8
 801c372:	1a52      	subs	r2, r2, r1
 801c374:	0019      	movs	r1, r3
 801c376:	43b9      	bics	r1, r7
 801c378:	4656      	mov	r6, sl
 801c37a:	880c      	ldrh	r4, [r1, #0]
 801c37c:	423b      	tst	r3, r7
 801c37e:	d1ea      	bne.n	801c356 <fn_0801C2DC+0x7a>
 801c380:	43b4      	bics	r4, r6
 801c382:	4666      	mov	r6, ip
 801c384:	4334      	orrs	r4, r6
 801c386:	800c      	strh	r4, [r1, #0]
 801c388:	2d00      	cmp	r5, #0
 801c38a:	d1ea      	bne.n	801c362 <fn_0801C2DC+0x86>
 801c38c:	b005      	add	sp, #20
 801c38e:	bcf0      	pop	{r4, r5, r6, r7}
 801c390:	46bb      	mov	fp, r7
 801c392:	46b2      	mov	sl, r6
 801c394:	46a9      	mov	r9, r5
 801c396:	46a0      	mov	r8, r4
 801c398:	bcf0      	pop	{r4, r5, r6, r7}
 801c39a:	bc01      	pop	{r0}
 801c39c:	4700      	bx	r0
 801c39e:	2401      	movs	r4, #1
 801c3a0:	9401      	str	r4, [sp, #4]
 801c3a2:	3c02      	subs	r4, #2
 801c3a4:	46a0      	mov	r8, r4
 801c3a6:	429a      	cmp	r2, r3
 801c3a8:	dcb4      	bgt.n	801c314 <fn_0801C2DC+0x38>
 801c3aa:	22f0      	movs	r2, #240	@ 0xf0
 801c3ac:	4252      	negs	r2, r2
 801c3ae:	4693      	mov	fp, r2
 801c3b0:	e7b2      	b.n	801c318 <fn_0801C2DC+0x3c>
 801c3b2:	2501      	movs	r5, #1
 801c3b4:	0221      	lsls	r1, r4, #8
 801c3b6:	46b2      	mov	sl, r6
 801c3b8:	0004      	movs	r4, r0
 801c3ba:	46a9      	mov	r9, r5
 801c3bc:	0006      	movs	r6, r0
 801c3be:	9102      	str	r1, [sp, #8]
 801c3c0:	4461      	add	r1, ip
 801c3c2:	9103      	str	r1, [sp, #12]
 801c3c4:	4648      	mov	r0, r9
 801c3c6:	001d      	movs	r5, r3
 801c3c8:	4649      	mov	r1, r9
 801c3ca:	0057      	lsls	r7, r2, #1
 801c3cc:	4018      	ands	r0, r3
 801c3ce:	438d      	bics	r5, r1
 801c3d0:	2c00      	cmp	r4, #0
 801c3d2:	d020      	beq.n	801c416 <fn_0801C2DC+0x13a>
 801c3d4:	2101      	movs	r1, #1
 801c3d6:	42b7      	cmp	r7, r6
 801c3d8:	dc00      	bgt.n	801c3dc <fn_0801C2DC+0x100>
 801c3da:	2100      	movs	r1, #0
 801c3dc:	0609      	lsls	r1, r1, #24
 801c3de:	d01a      	beq.n	801c416 <fn_0801C2DC+0x13a>
 801c3e0:	9901      	ldr	r1, [sp, #4]
 801c3e2:	4281      	cmp	r1, r0
 801c3e4:	d028      	beq.n	801c438 <fn_0801C2DC+0x15c>
 801c3e6:	8829      	ldrh	r1, [r5, #0]
 801c3e8:	2800      	cmp	r0, #0
 801c3ea:	d02d      	beq.n	801c448 <fn_0801C2DC+0x16c>
 801c3ec:	20ff      	movs	r0, #255	@ 0xff
 801c3ee:	4001      	ands	r1, r0
 801c3f0:	9802      	ldr	r0, [sp, #8]
 801c3f2:	4301      	orrs	r1, r0
 801c3f4:	8029      	strh	r1, [r5, #0]
 801c3f6:	4651      	mov	r1, sl
 801c3f8:	4443      	add	r3, r8
 801c3fa:	1a52      	subs	r2, r2, r1
 801c3fc:	3c01      	subs	r4, #1
 801c3fe:	42be      	cmp	r6, r7
 801c400:	dbe0      	blt.n	801c3c4 <fn_0801C2DC+0xe8>
 801c402:	445b      	add	r3, fp
 801c404:	4648      	mov	r0, r9
 801c406:	001d      	movs	r5, r3
 801c408:	4649      	mov	r1, r9
 801c40a:	1992      	adds	r2, r2, r6
 801c40c:	0057      	lsls	r7, r2, #1
 801c40e:	4018      	ands	r0, r3
 801c410:	438d      	bics	r5, r1
 801c412:	2c00      	cmp	r4, #0
 801c414:	d1de      	bne.n	801c3d4 <fn_0801C2DC+0xf8>
 801c416:	8829      	ldrh	r1, [r5, #0]
 801c418:	2800      	cmp	r0, #0
 801c41a:	d007      	beq.n	801c42c <fn_0801C2DC+0x150>
 801c41c:	20ff      	movs	r0, #255	@ 0xff
 801c41e:	4001      	ands	r1, r0
 801c420:	9802      	ldr	r0, [sp, #8]
 801c422:	4301      	orrs	r1, r0
 801c424:	8029      	strh	r1, [r5, #0]
 801c426:	2c00      	cmp	r4, #0
 801c428:	d1e5      	bne.n	801c3f6 <fn_0801C2DC+0x11a>
 801c42a:	e7af      	b.n	801c38c <fn_0801C2DC+0xb0>
 801c42c:	20ff      	movs	r0, #255	@ 0xff
 801c42e:	4381      	bics	r1, r0
 801c430:	4660      	mov	r0, ip
 801c432:	4301      	orrs	r1, r0
 801c434:	8029      	strh	r1, [r5, #0]
 801c436:	e7f6      	b.n	801c426 <fn_0801C2DC+0x14a>
 801c438:	9903      	ldr	r1, [sp, #12]
 801c43a:	8029      	strh	r1, [r5, #0]
 801c43c:	4651      	mov	r1, sl
 801c43e:	1a52      	subs	r2, r2, r1
 801c440:	4443      	add	r3, r8
 801c442:	3c01      	subs	r4, #1
 801c444:	0057      	lsls	r7, r2, #1
 801c446:	e7ee      	b.n	801c426 <fn_0801C2DC+0x14a>
 801c448:	20ff      	movs	r0, #255	@ 0xff
 801c44a:	4381      	bics	r1, r0
 801c44c:	4660      	mov	r0, ip
 801c44e:	4301      	orrs	r1, r0
 801c450:	8029      	strh	r1, [r5, #0]
 801c452:	e7d0      	b.n	801c3f6 <fn_0801C2DC+0x11a>
 801c454:	030064c4 	.word	0x030064c4	@ data_030064C4
 801c458:	00005a30 	.word	0x00005a30
