fn_0801825C:
 801825c:	b5f0      	push	{r4, r5, r6, r7, lr}
 801825e:	4657      	mov	r7, sl
 8018260:	46de      	mov	lr, fp
 8018262:	464e      	mov	r6, r9
 8018264:	4645      	mov	r5, r8
 8018266:	b5e0      	push	{r5, r6, r7, lr}
 8018268:	4692      	mov	sl, r2
 801826a:	0007      	movs	r7, r0
 801826c:	469b      	mov	fp, r3
 801826e:	b089      	sub	sp, #36	@ 0x24
 8018270:	2900      	cmp	r1, #0
 8018272:	d000      	beq.n	8018276 <fn_0801825C+0x1a>
 8018274:	e13b      	b.n	80184ee <fn_0801825C+0x292>
 8018276:	6cd2      	ldr	r2, [r2, #76]	@ 0x4c
 8018278:	2380      	movs	r3, #128	@ 0x80
 801827a:	0011      	movs	r1, r2
 801827c:	025b      	lsls	r3, r3, #9
 801827e:	4019      	ands	r1, r3
 8018280:	4688      	mov	r8, r1
 8018282:	421a      	tst	r2, r3
 8018284:	d000      	beq.n	8018288 <fn_0801825C+0x2c>
 8018286:	e132      	b.n	80184ee <fn_0801825C+0x292>
 8018288:	2101      	movs	r1, #1
 801828a:	26e0      	movs	r6, #224	@ 0xe0
 801828c:	4db6      	ldr	r5, [pc, #728]	@ (8018568 <fn_0801825C+0x30c>)
 801828e:	4249      	negs	r1, r1
 8018290:	0136      	lsls	r6, r6, #4
 8018292:	0038      	movs	r0, r7
 8018294:	f7fc ff78 	bl	8015188 <fn_08015188>
 8018298:	1e01      	subs	r1, r0, #0
 801829a:	da00      	bge.n	801829e <fn_0801825C+0x42>
 801829c:	e127      	b.n	80184ee <fn_0801825C+0x292>
 801829e:	682a      	ldr	r2, [r5, #0]
 80182a0:	5994      	ldr	r4, [r2, r6]
 80182a2:	014b      	lsls	r3, r1, #5
 80182a4:	18e4      	adds	r4, r4, r3
 80182a6:	42a7      	cmp	r7, r4
 80182a8:	d0f3      	beq.n	8018292 <fn_0801825C+0x36>
 80182aa:	8ae3      	ldrh	r3, [r4, #22]
 80182ac:	4aaf      	ldr	r2, [pc, #700]	@ (801856c <fn_0801825C+0x310>)
 80182ae:	4293      	cmp	r3, r2
 80182b0:	d0ef      	beq.n	8018292 <fn_0801825C+0x36>
 80182b2:	2308      	movs	r3, #8
 80182b4:	5efa      	ldrsh	r2, [r7, r3]
 80182b6:	210a      	movs	r1, #10
 80182b8:	5e7b      	ldrsh	r3, [r7, r1]
 80182ba:	17d0      	asrs	r0, r2, #31
 80182bc:	1811      	adds	r1, r2, r0
 80182be:	17de      	asrs	r6, r3, #31
 80182c0:	4041      	eors	r1, r0
 80182c2:	1998      	adds	r0, r3, r6
 80182c4:	4070      	eors	r0, r6
 80182c6:	0409      	lsls	r1, r1, #16
 80182c8:	0400      	lsls	r0, r0, #16
 80182ca:	4288      	cmp	r0, r1
 80182cc:	d300      	bcc.n	80182d0 <fn_0801825C+0x74>
 80182ce:	e128      	b.n	8018522 <fn_0801825C+0x2c6>
 80182d0:	4651      	mov	r1, sl
 80182d2:	883b      	ldrh	r3, [r7, #0]
 80182d4:	68c8      	ldr	r0, [r1, #12]
 80182d6:	041b      	lsls	r3, r3, #16
 80182d8:	1ac0      	subs	r0, r0, r3
 80182da:	0003      	movs	r3, r0
 80182dc:	0412      	lsls	r2, r2, #16
 80182de:	4053      	eors	r3, r2
 80182e0:	9301      	str	r3, [sp, #4]
 80182e2:	17c3      	asrs	r3, r0, #31
 80182e4:	18c0      	adds	r0, r0, r3
 80182e6:	4058      	eors	r0, r3
 80182e8:	17d3      	asrs	r3, r2, #31
 80182ea:	18d2      	adds	r2, r2, r3
 80182ec:	405a      	eors	r2, r3
 80182ee:	0401      	lsls	r1, r0, #16
 80182f0:	1400      	asrs	r0, r0, #16
 80182f2:	f00d f999 	bl	8025628 <fn_08025628>
 80182f6:	9b01      	ldr	r3, [sp, #4]
 80182f8:	0006      	movs	r6, r0
 80182fa:	2b00      	cmp	r3, #0
 80182fc:	da00      	bge.n	8018300 <fn_0801825C+0xa4>
 80182fe:	e128      	b.n	8018552 <fn_0801825C+0x2f6>
 8018300:	465b      	mov	r3, fp
 8018302:	2b00      	cmp	r3, #0
 8018304:	d100      	bne.n	8018308 <fn_0801825C+0xac>
 8018306:	e108      	b.n	801851a <fn_0801825C+0x2be>
 8018308:	2380      	movs	r3, #128	@ 0x80
 801830a:	025b      	lsls	r3, r3, #9
 801830c:	1b9e      	subs	r6, r3, r6
 801830e:	8963      	ldrh	r3, [r4, #10]
 8018310:	8922      	ldrh	r2, [r4, #8]
 8018312:	2100      	movs	r1, #0
 8018314:	041b      	lsls	r3, r3, #16
 8018316:	0412      	lsls	r2, r2, #16
 8018318:	2000      	movs	r0, #0
 801831a:	f00d f979 	bl	8025610 <fn_08025610>
 801831e:	46c4      	mov	ip, r8
 8018320:	4484      	add	ip, r0
 8018322:	4663      	mov	r3, ip
 8018324:	9301      	str	r3, [sp, #4]
 8018326:	897b      	ldrh	r3, [r7, #10]
 8018328:	893a      	ldrh	r2, [r7, #8]
 801832a:	2100      	movs	r1, #0
 801832c:	0412      	lsls	r2, r2, #16
 801832e:	041b      	lsls	r3, r3, #16
 8018330:	2000      	movs	r0, #0
 8018332:	f00d f96d 	bl	8025610 <fn_08025610>
 8018336:	9b01      	ldr	r3, [sp, #4]
 8018338:	1a1b      	subs	r3, r3, r0
 801833a:	9302      	str	r3, [sp, #8]
 801833c:	8921      	ldrh	r1, [r4, #8]
 801833e:	0030      	movs	r0, r6
 8018340:	0409      	lsls	r1, r1, #16
 8018342:	f00d f9a3 	bl	802568c <fn_0802568C>
 8018346:	88a3      	ldrh	r3, [r4, #4]
 8018348:	8961      	ldrh	r1, [r4, #10]
 801834a:	041b      	lsls	r3, r3, #16
 801834c:	1a1a      	subs	r2, r3, r0
 801834e:	0409      	lsls	r1, r1, #16
 8018350:	0030      	movs	r0, r6
 8018352:	4691      	mov	r9, r2
 8018354:	f00d f99a 	bl	802568c <fn_0802568C>
 8018358:	88e7      	ldrh	r7, [r4, #6]
 801835a:	9b02      	ldr	r3, [sp, #8]
 801835c:	043f      	lsls	r7, r7, #16
 801835e:	1a3a      	subs	r2, r7, r0
 8018360:	0cdb      	lsrs	r3, r3, #19
 8018362:	4690      	mov	r8, r2
 8018364:	4a82      	ldr	r2, [pc, #520]	@ (8018570 <fn_0801825C+0x314>)
 8018366:	0099      	lsls	r1, r3, #2
 8018368:	5889      	ldr	r1, [r1, r2]
 801836a:	9103      	str	r1, [sp, #12]
 801836c:	2180      	movs	r1, #128	@ 0x80
 801836e:	0109      	lsls	r1, r1, #4
 8018370:	185b      	adds	r3, r3, r1
 8018372:	009b      	lsls	r3, r3, #2
 8018374:	58d3      	ldr	r3, [r2, r3]
 8018376:	4650      	mov	r0, sl
 8018378:	9304      	str	r3, [sp, #16]
 801837a:	f7f9 ff5b 	bl	8012234 <fn_08012234>
 801837e:	9001      	str	r0, [sp, #4]
 8018380:	2800      	cmp	r0, #0
 8018382:	d008      	beq.n	8018396 <fn_0801825C+0x13a>
 8018384:	4650      	mov	r0, sl
 8018386:	f7f9 ff55 	bl	8012234 <fn_08012234>
 801838a:	2200      	movs	r2, #0
 801838c:	6803      	ldr	r3, [r0, #0]
 801838e:	9201      	str	r2, [sp, #4]
 8018390:	4553      	cmp	r3, sl
 8018392:	d100      	bne.n	8018396 <fn_0801825C+0x13a>
 8018394:	e0df      	b.n	8018556 <fn_0801825C+0x2fa>
 8018396:	22df      	movs	r2, #223	@ 0xdf
 8018398:	682b      	ldr	r3, [r5, #0]
 801839a:	0112      	lsls	r2, r2, #4
 801839c:	5899      	ldr	r1, [r3, r2]
 801839e:	8aa0      	ldrh	r0, [r4, #20]
 80183a0:	4a74      	ldr	r2, [pc, #464]	@ (8018574 <fn_0801825C+0x318>)
 80183a2:	589a      	ldr	r2, [r3, r2]
 80183a4:	0043      	lsls	r3, r0, #1
 80183a6:	181b      	adds	r3, r3, r0
 80183a8:	009b      	lsls	r3, r3, #2
 80183aa:	18d3      	adds	r3, r2, r3
 80183ac:	8958      	ldrh	r0, [r3, #10]
 80183ae:	0083      	lsls	r3, r0, #2
 80183b0:	181b      	adds	r3, r3, r0
 80183b2:	00db      	lsls	r3, r3, #3
 80183b4:	5858      	ldr	r0, [r3, r1]
 80183b6:	8ae6      	ldrh	r6, [r4, #22]
 80183b8:	4b6c      	ldr	r3, [pc, #432]	@ (801856c <fn_0801825C+0x310>)
 80183ba:	429e      	cmp	r6, r3
 80183bc:	d100      	bne.n	80183c0 <fn_0801825C+0x164>
 80183be:	e0cf      	b.n	8018560 <fn_0801825C+0x304>
 80183c0:	0073      	lsls	r3, r6, #1
 80183c2:	199b      	adds	r3, r3, r6
 80183c4:	009b      	lsls	r3, r3, #2
 80183c6:	18d2      	adds	r2, r2, r3
 80183c8:	8952      	ldrh	r2, [r2, #10]
 80183ca:	0093      	lsls	r3, r2, #2
 80183cc:	189b      	adds	r3, r3, r2
 80183ce:	00db      	lsls	r3, r3, #3
 80183d0:	585b      	ldr	r3, [r3, r1]
 80183d2:	2201      	movs	r2, #1
 80183d4:	4298      	cmp	r0, r3
 80183d6:	db00      	blt.n	80183da <fn_0801825C+0x17e>
 80183d8:	2200      	movs	r2, #0
 80183da:	4653      	mov	r3, sl
 80183dc:	0612      	lsls	r2, r2, #24
 80183de:	0e11      	lsrs	r1, r2, #24
 80183e0:	695a      	ldr	r2, [r3, #20]
 80183e2:	6b1b      	ldr	r3, [r3, #48]	@ 0x30
 80183e4:	9307      	str	r3, [sp, #28]
 80183e6:	465b      	mov	r3, fp
 80183e8:	2701      	movs	r7, #1
 80183ea:	9105      	str	r1, [sp, #20]
 80183ec:	9206      	str	r2, [sp, #24]
 80183ee:	2b00      	cmp	r3, #0
 80183f0:	d103      	bne.n	80183fa <fn_0801825C+0x19e>
 80183f2:	9f01      	ldr	r7, [sp, #4]
 80183f4:	1e7a      	subs	r2, r7, #1
 80183f6:	4197      	sbcs	r7, r2
 80183f8:	400f      	ands	r7, r1
 80183fa:	260b      	movs	r6, #11
 80183fc:	46ab      	mov	fp, r5
 80183fe:	0022      	movs	r2, r4
 8018400:	4641      	mov	r1, r8
 8018402:	4648      	mov	r0, r9
 8018404:	f7f7 fd0a 	bl	800fe1c <fn_0800FE1C>
 8018408:	42b8      	cmp	r0, r7
 801840a:	d022      	beq.n	8018452 <fn_0801825C+0x1f6>
 801840c:	3e01      	subs	r6, #1
 801840e:	2e00      	cmp	r6, #0
 8018410:	d01f      	beq.n	8018452 <fn_0801825C+0x1f6>
 8018412:	2308      	movs	r3, #8
 8018414:	5ee2      	ldrsh	r2, [r4, r3]
 8018416:	210a      	movs	r1, #10
 8018418:	5e63      	ldrsh	r3, [r4, r1]
 801841a:	17d8      	asrs	r0, r3, #31
 801841c:	1819      	adds	r1, r3, r0
 801841e:	17d5      	asrs	r5, r2, #31
 8018420:	4041      	eors	r1, r0
 8018422:	1950      	adds	r0, r2, r5
 8018424:	4068      	eors	r0, r5
 8018426:	0409      	lsls	r1, r1, #16
 8018428:	0400      	lsls	r0, r0, #16
 801842a:	4288      	cmp	r0, r1
 801842c:	d969      	bls.n	8018502 <fn_0801825C+0x2a6>
 801842e:	0fd3      	lsrs	r3, r2, #31
 8018430:	1bdb      	subs	r3, r3, r7
 8018432:	425a      	negs	r2, r3
 8018434:	4153      	adcs	r3, r2
 8018436:	2202      	movs	r2, #2
 8018438:	425b      	negs	r3, r3
 801843a:	4013      	ands	r3, r2
 801843c:	4642      	mov	r2, r8
 801843e:	3b01      	subs	r3, #1
 8018440:	1ad3      	subs	r3, r2, r3
 8018442:	4698      	mov	r8, r3
 8018444:	0022      	movs	r2, r4
 8018446:	4641      	mov	r1, r8
 8018448:	4648      	mov	r0, r9
 801844a:	f7f7 fce7 	bl	800fe1c <fn_0800FE1C>
 801844e:	42b8      	cmp	r0, r7
 8018450:	d1dc      	bne.n	801840c <fn_0801825C+0x1b0>
 8018452:	2300      	movs	r3, #0
 8018454:	4642      	mov	r2, r8
 8018456:	4649      	mov	r1, r9
 8018458:	4650      	mov	r0, sl
 801845a:	465d      	mov	r5, fp
 801845c:	f7f6 fe98 	bl	800f190 <fn_0800F190>
 8018460:	2800      	cmp	r0, #0
 8018462:	d044      	beq.n	80184ee <fn_0801825C+0x292>
 8018464:	9b05      	ldr	r3, [sp, #20]
 8018466:	005b      	lsls	r3, r3, #1
 8018468:	18e4      	adds	r4, r4, r3
 801846a:	8aa0      	ldrh	r0, [r4, #20]
 801846c:	682a      	ldr	r2, [r5, #0]
 801846e:	4b41      	ldr	r3, [pc, #260]	@ (8018574 <fn_0801825C+0x318>)
 8018470:	58d1      	ldr	r1, [r2, r3]
 8018472:	0043      	lsls	r3, r0, #1
 8018474:	181b      	adds	r3, r3, r0
 8018476:	009b      	lsls	r3, r3, #2
 8018478:	18cb      	adds	r3, r1, r3
 801847a:	8959      	ldrh	r1, [r3, #10]
 801847c:	23df      	movs	r3, #223	@ 0xdf
 801847e:	4657      	mov	r7, sl
 8018480:	011b      	lsls	r3, r3, #4
 8018482:	58d0      	ldr	r0, [r2, r3]
 8018484:	008b      	lsls	r3, r1, #2
 8018486:	185b      	adds	r3, r3, r1
 8018488:	9a06      	ldr	r2, [sp, #24]
 801848a:	9907      	ldr	r1, [sp, #28]
 801848c:	00db      	lsls	r3, r3, #3
 801848e:	581b      	ldr	r3, [r3, r0]
 8018490:	1a52      	subs	r2, r2, r1
 8018492:	189b      	adds	r3, r3, r2
 8018494:	617b      	str	r3, [r7, #20]
 8018496:	9a02      	ldr	r2, [sp, #8]
 8018498:	6a3b      	ldr	r3, [r7, #32]
 801849a:	189b      	adds	r3, r3, r2
 801849c:	6bfd      	ldr	r5, [r7, #60]	@ 0x3c
 801849e:	623b      	str	r3, [r7, #32]
 80184a0:	9b04      	ldr	r3, [sp, #16]
 80184a2:	0028      	movs	r0, r5
 80184a4:	0019      	movs	r1, r3
 80184a6:	4699      	mov	r9, r3
 80184a8:	f00d f8f0 	bl	802568c <fn_0802568C>
 80184ac:	6c3e      	ldr	r6, [r7, #64]	@ 0x40
 80184ae:	9b03      	ldr	r3, [sp, #12]
 80184b0:	0004      	movs	r4, r0
 80184b2:	0019      	movs	r1, r3
 80184b4:	0030      	movs	r0, r6
 80184b6:	4698      	mov	r8, r3
 80184b8:	f00d f8e8 	bl	802568c <fn_0802568C>
 80184bc:	1a24      	subs	r4, r4, r0
 80184be:	4649      	mov	r1, r9
 80184c0:	63fc      	str	r4, [r7, #60]	@ 0x3c
 80184c2:	0030      	movs	r0, r6
 80184c4:	f00d f8e2 	bl	802568c <fn_0802568C>
 80184c8:	4641      	mov	r1, r8
 80184ca:	0004      	movs	r4, r0
 80184cc:	0028      	movs	r0, r5
 80184ce:	f00d f8dd 	bl	802568c <fn_0802568C>
 80184d2:	9d01      	ldr	r5, [sp, #4]
 80184d4:	1824      	adds	r4, r4, r0
 80184d6:	643c      	str	r4, [r7, #64]	@ 0x40
 80184d8:	2d00      	cmp	r5, #0
 80184da:	d006      	beq.n	80184ea <fn_0801825C+0x28e>
 80184dc:	2300      	movs	r3, #0
 80184de:	69ac      	ldr	r4, [r5, #24]
 80184e0:	0028      	movs	r0, r5
 80184e2:	61ab      	str	r3, [r5, #24]
 80184e4:	f000 f91a 	bl	801871c <fn_0801871C>
 80184e8:	61ac      	str	r4, [r5, #24]
 80184ea:	2001      	movs	r0, #1
 80184ec:	e000      	b.n	80184f0 <fn_0801825C+0x294>
 80184ee:	2000      	movs	r0, #0
 80184f0:	b009      	add	sp, #36	@ 0x24
 80184f2:	bcf0      	pop	{r4, r5, r6, r7}
 80184f4:	46bb      	mov	fp, r7
 80184f6:	46b2      	mov	sl, r6
 80184f8:	46a9      	mov	r9, r5
 80184fa:	46a0      	mov	r8, r4
 80184fc:	bcf0      	pop	{r4, r5, r6, r7}
 80184fe:	bc02      	pop	{r1}
 8018500:	4708      	bx	r1
 8018502:	0fdb      	lsrs	r3, r3, #31
 8018504:	1bdb      	subs	r3, r3, r7
 8018506:	425a      	negs	r2, r3
 8018508:	4153      	adcs	r3, r2
 801850a:	2202      	movs	r2, #2
 801850c:	46cc      	mov	ip, r9
 801850e:	425b      	negs	r3, r3
 8018510:	4013      	ands	r3, r2
 8018512:	3b01      	subs	r3, #1
 8018514:	449c      	add	ip, r3
 8018516:	46e1      	mov	r9, ip
 8018518:	e771      	b.n	80183fe <fn_0801825C+0x1a2>
 801851a:	2380      	movs	r3, #128	@ 0x80
 801851c:	061b      	lsls	r3, r3, #24
 801851e:	4698      	mov	r8, r3
 8018520:	e6f5      	b.n	801830e <fn_0801825C+0xb2>
 8018522:	4651      	mov	r1, sl
 8018524:	887a      	ldrh	r2, [r7, #2]
 8018526:	6908      	ldr	r0, [r1, #16]
 8018528:	0412      	lsls	r2, r2, #16
 801852a:	1a80      	subs	r0, r0, r2
 801852c:	0002      	movs	r2, r0
 801852e:	041b      	lsls	r3, r3, #16
 8018530:	405a      	eors	r2, r3
 8018532:	9201      	str	r2, [sp, #4]
 8018534:	17c2      	asrs	r2, r0, #31
 8018536:	17d9      	asrs	r1, r3, #31
 8018538:	1880      	adds	r0, r0, r2
 801853a:	4050      	eors	r0, r2
 801853c:	185a      	adds	r2, r3, r1
 801853e:	404a      	eors	r2, r1
 8018540:	0401      	lsls	r1, r0, #16
 8018542:	1400      	asrs	r0, r0, #16
 8018544:	f00d f870 	bl	8025628 <fn_08025628>
 8018548:	9a01      	ldr	r2, [sp, #4]
 801854a:	0006      	movs	r6, r0
 801854c:	2a00      	cmp	r2, #0
 801854e:	db00      	blt.n	8018552 <fn_0801825C+0x2f6>
 8018550:	e6d6      	b.n	8018300 <fn_0801825C+0xa4>
 8018552:	4276      	negs	r6, r6
 8018554:	e6d4      	b.n	8018300 <fn_0801825C+0xa4>
 8018556:	4650      	mov	r0, sl
 8018558:	f7f9 fe6c 	bl	8012234 <fn_08012234>
 801855c:	9001      	str	r0, [sp, #4]
 801855e:	e71a      	b.n	8018396 <fn_0801825C+0x13a>
 8018560:	2300      	movs	r3, #0
 8018562:	681b      	ldr	r3, [r3, #0]
 8018564:	deff      	udf	#255	@ 0xff
 8018566:	46c0      	nop			@ (mov r8, r8)
 8018568:	030064c4 	.word	0x030064c4
 801856c:	0000ffff 	.word	0x0000ffff
 8018570:	081398a0 	.word	0x081398a0
 8018574:	00000e0c 	.word	0x00000e0c
