fn_080181A8:
 80181a8:	b5f0      	push	{r4, r5, r6, r7, lr}
 80181aa:	4657      	mov	r7, sl
 80181ac:	46de      	mov	lr, fp
 80181ae:	464e      	mov	r6, r9
 80181b0:	4645      	mov	r5, r8
 80181b2:	b5e0      	push	{r5, r6, r7, lr}
 80181b4:	4692      	mov	sl, r2
 80181b6:	0007      	movs	r7, r0
 80181b8:	469b      	mov	fp, r3
 80181ba:	b089      	sub	sp, #36	@ 0x24
 80181bc:	2900      	cmp	r1, #0
 80181be:	d000      	beq.n	80181c2 <fn_080181A8+0x1a>
 80181c0:	e13b      	b.n	801843a <fn_080181A8+0x292>
 80181c2:	6cd2      	ldr	r2, [r2, #76]	@ 0x4c
 80181c4:	2380      	movs	r3, #128	@ 0x80
 80181c6:	0011      	movs	r1, r2
 80181c8:	025b      	lsls	r3, r3, #9
 80181ca:	4019      	ands	r1, r3
 80181cc:	4688      	mov	r8, r1
 80181ce:	421a      	tst	r2, r3
 80181d0:	d000      	beq.n	80181d4 <fn_080181A8+0x2c>
 80181d2:	e132      	b.n	801843a <fn_080181A8+0x292>
 80181d4:	2101      	movs	r1, #1
 80181d6:	26e0      	movs	r6, #224	@ 0xe0
 80181d8:	4db6      	ldr	r5, [pc, #728]	@ (80184b4 <fn_080181A8+0x30c>)
 80181da:	4249      	negs	r1, r1
 80181dc:	0136      	lsls	r6, r6, #4
 80181de:	0038      	movs	r0, r7
 80181e0:	f7fc ff78 	bl	80150d4 <fn_080150D4>
 80181e4:	1e01      	subs	r1, r0, #0
 80181e6:	da00      	bge.n	80181ea <fn_080181A8+0x42>
 80181e8:	e127      	b.n	801843a <fn_080181A8+0x292>
 80181ea:	682a      	ldr	r2, [r5, #0]
 80181ec:	5994      	ldr	r4, [r2, r6]
 80181ee:	014b      	lsls	r3, r1, #5
 80181f0:	18e4      	adds	r4, r4, r3
 80181f2:	42a7      	cmp	r7, r4
 80181f4:	d0f3      	beq.n	80181de <fn_080181A8+0x36>
 80181f6:	8ae3      	ldrh	r3, [r4, #22]
 80181f8:	4aaf      	ldr	r2, [pc, #700]	@ (80184b8 <fn_080181A8+0x310>)
 80181fa:	4293      	cmp	r3, r2
 80181fc:	d0ef      	beq.n	80181de <fn_080181A8+0x36>
 80181fe:	2308      	movs	r3, #8
 8018200:	5efa      	ldrsh	r2, [r7, r3]
 8018202:	210a      	movs	r1, #10
 8018204:	5e7b      	ldrsh	r3, [r7, r1]
 8018206:	17d0      	asrs	r0, r2, #31
 8018208:	1811      	adds	r1, r2, r0
 801820a:	17de      	asrs	r6, r3, #31
 801820c:	4041      	eors	r1, r0
 801820e:	1998      	adds	r0, r3, r6
 8018210:	4070      	eors	r0, r6
 8018212:	0409      	lsls	r1, r1, #16
 8018214:	0400      	lsls	r0, r0, #16
 8018216:	4288      	cmp	r0, r1
 8018218:	d300      	bcc.n	801821c <fn_080181A8+0x74>
 801821a:	e128      	b.n	801846e <fn_080181A8+0x2c6>
 801821c:	4651      	mov	r1, sl
 801821e:	883b      	ldrh	r3, [r7, #0]
 8018220:	68c8      	ldr	r0, [r1, #12]
 8018222:	041b      	lsls	r3, r3, #16
 8018224:	1ac0      	subs	r0, r0, r3
 8018226:	0003      	movs	r3, r0
 8018228:	0412      	lsls	r2, r2, #16
 801822a:	4053      	eors	r3, r2
 801822c:	9301      	str	r3, [sp, #4]
 801822e:	17c3      	asrs	r3, r0, #31
 8018230:	18c0      	adds	r0, r0, r3
 8018232:	4058      	eors	r0, r3
 8018234:	17d3      	asrs	r3, r2, #31
 8018236:	18d2      	adds	r2, r2, r3
 8018238:	405a      	eors	r2, r3
 801823a:	0401      	lsls	r1, r0, #16
 801823c:	1400      	asrs	r0, r0, #16
 801823e:	f00d f99b 	bl	8025578 <fn_08025578>
 8018242:	9b01      	ldr	r3, [sp, #4]
 8018244:	0006      	movs	r6, r0
 8018246:	2b00      	cmp	r3, #0
 8018248:	da00      	bge.n	801824c <fn_080181A8+0xa4>
 801824a:	e128      	b.n	801849e <fn_080181A8+0x2f6>
 801824c:	465b      	mov	r3, fp
 801824e:	2b00      	cmp	r3, #0
 8018250:	d100      	bne.n	8018254 <fn_080181A8+0xac>
 8018252:	e108      	b.n	8018466 <fn_080181A8+0x2be>
 8018254:	2380      	movs	r3, #128	@ 0x80
 8018256:	025b      	lsls	r3, r3, #9
 8018258:	1b9e      	subs	r6, r3, r6
 801825a:	8963      	ldrh	r3, [r4, #10]
 801825c:	8922      	ldrh	r2, [r4, #8]
 801825e:	2100      	movs	r1, #0
 8018260:	041b      	lsls	r3, r3, #16
 8018262:	0412      	lsls	r2, r2, #16
 8018264:	2000      	movs	r0, #0
 8018266:	f00d f97b 	bl	8025560 <fn_08025560>
 801826a:	46c4      	mov	ip, r8
 801826c:	4484      	add	ip, r0
 801826e:	4663      	mov	r3, ip
 8018270:	9301      	str	r3, [sp, #4]
 8018272:	897b      	ldrh	r3, [r7, #10]
 8018274:	893a      	ldrh	r2, [r7, #8]
 8018276:	2100      	movs	r1, #0
 8018278:	0412      	lsls	r2, r2, #16
 801827a:	041b      	lsls	r3, r3, #16
 801827c:	2000      	movs	r0, #0
 801827e:	f00d f96f 	bl	8025560 <fn_08025560>
 8018282:	9b01      	ldr	r3, [sp, #4]
 8018284:	1a1b      	subs	r3, r3, r0
 8018286:	9302      	str	r3, [sp, #8]
 8018288:	8921      	ldrh	r1, [r4, #8]
 801828a:	0030      	movs	r0, r6
 801828c:	0409      	lsls	r1, r1, #16
 801828e:	f00d f9a5 	bl	80255dc <fn_080255DC>
 8018292:	88a3      	ldrh	r3, [r4, #4]
 8018294:	8961      	ldrh	r1, [r4, #10]
 8018296:	041b      	lsls	r3, r3, #16
 8018298:	1a1a      	subs	r2, r3, r0
 801829a:	0409      	lsls	r1, r1, #16
 801829c:	0030      	movs	r0, r6
 801829e:	4691      	mov	r9, r2
 80182a0:	f00d f99c 	bl	80255dc <fn_080255DC>
 80182a4:	88e7      	ldrh	r7, [r4, #6]
 80182a6:	9b02      	ldr	r3, [sp, #8]
 80182a8:	043f      	lsls	r7, r7, #16
 80182aa:	1a3a      	subs	r2, r7, r0
 80182ac:	0cdb      	lsrs	r3, r3, #19
 80182ae:	4690      	mov	r8, r2
 80182b0:	4a82      	ldr	r2, [pc, #520]	@ (80184bc <fn_080181A8+0x314>)
 80182b2:	0099      	lsls	r1, r3, #2
 80182b4:	5889      	ldr	r1, [r1, r2]
 80182b6:	9103      	str	r1, [sp, #12]
 80182b8:	2180      	movs	r1, #128	@ 0x80
 80182ba:	0109      	lsls	r1, r1, #4
 80182bc:	185b      	adds	r3, r3, r1
 80182be:	009b      	lsls	r3, r3, #2
 80182c0:	58d3      	ldr	r3, [r2, r3]
 80182c2:	4650      	mov	r0, sl
 80182c4:	9304      	str	r3, [sp, #16]
 80182c6:	f7f9 ffb5 	bl	8012234 <fn_08012234>
 80182ca:	9001      	str	r0, [sp, #4]
 80182cc:	2800      	cmp	r0, #0
 80182ce:	d008      	beq.n	80182e2 <fn_080181A8+0x13a>
 80182d0:	4650      	mov	r0, sl
 80182d2:	f7f9 ffaf 	bl	8012234 <fn_08012234>
 80182d6:	2200      	movs	r2, #0
 80182d8:	6803      	ldr	r3, [r0, #0]
 80182da:	9201      	str	r2, [sp, #4]
 80182dc:	4553      	cmp	r3, sl
 80182de:	d100      	bne.n	80182e2 <fn_080181A8+0x13a>
 80182e0:	e0df      	b.n	80184a2 <fn_080181A8+0x2fa>
 80182e2:	22df      	movs	r2, #223	@ 0xdf
 80182e4:	682b      	ldr	r3, [r5, #0]
 80182e6:	0112      	lsls	r2, r2, #4
 80182e8:	5899      	ldr	r1, [r3, r2]
 80182ea:	8aa0      	ldrh	r0, [r4, #20]
 80182ec:	4a74      	ldr	r2, [pc, #464]	@ (80184c0 <fn_080181A8+0x318>)
 80182ee:	589a      	ldr	r2, [r3, r2]
 80182f0:	0043      	lsls	r3, r0, #1
 80182f2:	181b      	adds	r3, r3, r0
 80182f4:	009b      	lsls	r3, r3, #2
 80182f6:	18d3      	adds	r3, r2, r3
 80182f8:	8958      	ldrh	r0, [r3, #10]
 80182fa:	0083      	lsls	r3, r0, #2
 80182fc:	181b      	adds	r3, r3, r0
 80182fe:	00db      	lsls	r3, r3, #3
 8018300:	5858      	ldr	r0, [r3, r1]
 8018302:	8ae6      	ldrh	r6, [r4, #22]
 8018304:	4b6c      	ldr	r3, [pc, #432]	@ (80184b8 <fn_080181A8+0x310>)
 8018306:	429e      	cmp	r6, r3
 8018308:	d100      	bne.n	801830c <fn_080181A8+0x164>
 801830a:	e0cf      	b.n	80184ac <fn_080181A8+0x304>
 801830c:	0073      	lsls	r3, r6, #1
 801830e:	199b      	adds	r3, r3, r6
 8018310:	009b      	lsls	r3, r3, #2
 8018312:	18d2      	adds	r2, r2, r3
 8018314:	8952      	ldrh	r2, [r2, #10]
 8018316:	0093      	lsls	r3, r2, #2
 8018318:	189b      	adds	r3, r3, r2
 801831a:	00db      	lsls	r3, r3, #3
 801831c:	585b      	ldr	r3, [r3, r1]
 801831e:	2201      	movs	r2, #1
 8018320:	4298      	cmp	r0, r3
 8018322:	db00      	blt.n	8018326 <fn_080181A8+0x17e>
 8018324:	2200      	movs	r2, #0
 8018326:	4653      	mov	r3, sl
 8018328:	0612      	lsls	r2, r2, #24
 801832a:	0e11      	lsrs	r1, r2, #24
 801832c:	695a      	ldr	r2, [r3, #20]
 801832e:	6b1b      	ldr	r3, [r3, #48]	@ 0x30
 8018330:	9307      	str	r3, [sp, #28]
 8018332:	465b      	mov	r3, fp
 8018334:	2701      	movs	r7, #1
 8018336:	9105      	str	r1, [sp, #20]
 8018338:	9206      	str	r2, [sp, #24]
 801833a:	2b00      	cmp	r3, #0
 801833c:	d103      	bne.n	8018346 <fn_080181A8+0x19e>
 801833e:	9f01      	ldr	r7, [sp, #4]
 8018340:	1e7a      	subs	r2, r7, #1
 8018342:	4197      	sbcs	r7, r2
 8018344:	400f      	ands	r7, r1
 8018346:	260b      	movs	r6, #11
 8018348:	46ab      	mov	fp, r5
 801834a:	0022      	movs	r2, r4
 801834c:	4641      	mov	r1, r8
 801834e:	4648      	mov	r0, r9
 8018350:	f7f7 fd64 	bl	800fe1c <fn_0800FE1C>
 8018354:	42b8      	cmp	r0, r7
 8018356:	d022      	beq.n	801839e <fn_080181A8+0x1f6>
 8018358:	3e01      	subs	r6, #1
 801835a:	2e00      	cmp	r6, #0
 801835c:	d01f      	beq.n	801839e <fn_080181A8+0x1f6>
 801835e:	2308      	movs	r3, #8
 8018360:	5ee2      	ldrsh	r2, [r4, r3]
 8018362:	210a      	movs	r1, #10
 8018364:	5e63      	ldrsh	r3, [r4, r1]
 8018366:	17d8      	asrs	r0, r3, #31
 8018368:	1819      	adds	r1, r3, r0
 801836a:	17d5      	asrs	r5, r2, #31
 801836c:	4041      	eors	r1, r0
 801836e:	1950      	adds	r0, r2, r5
 8018370:	4068      	eors	r0, r5
 8018372:	0409      	lsls	r1, r1, #16
 8018374:	0400      	lsls	r0, r0, #16
 8018376:	4288      	cmp	r0, r1
 8018378:	d969      	bls.n	801844e <fn_080181A8+0x2a6>
 801837a:	0fd3      	lsrs	r3, r2, #31
 801837c:	1bdb      	subs	r3, r3, r7
 801837e:	425a      	negs	r2, r3
 8018380:	4153      	adcs	r3, r2
 8018382:	2202      	movs	r2, #2
 8018384:	425b      	negs	r3, r3
 8018386:	4013      	ands	r3, r2
 8018388:	4642      	mov	r2, r8
 801838a:	3b01      	subs	r3, #1
 801838c:	1ad3      	subs	r3, r2, r3
 801838e:	4698      	mov	r8, r3
 8018390:	0022      	movs	r2, r4
 8018392:	4641      	mov	r1, r8
 8018394:	4648      	mov	r0, r9
 8018396:	f7f7 fd41 	bl	800fe1c <fn_0800FE1C>
 801839a:	42b8      	cmp	r0, r7
 801839c:	d1dc      	bne.n	8018358 <fn_080181A8+0x1b0>
 801839e:	2300      	movs	r3, #0
 80183a0:	4642      	mov	r2, r8
 80183a2:	4649      	mov	r1, r9
 80183a4:	4650      	mov	r0, sl
 80183a6:	465d      	mov	r5, fp
 80183a8:	f7f6 fef2 	bl	800f190 <fn_0800F190>
 80183ac:	2800      	cmp	r0, #0
 80183ae:	d044      	beq.n	801843a <fn_080181A8+0x292>
 80183b0:	9b05      	ldr	r3, [sp, #20]
 80183b2:	005b      	lsls	r3, r3, #1
 80183b4:	18e4      	adds	r4, r4, r3
 80183b6:	8aa0      	ldrh	r0, [r4, #20]
 80183b8:	682a      	ldr	r2, [r5, #0]
 80183ba:	4b41      	ldr	r3, [pc, #260]	@ (80184c0 <fn_080181A8+0x318>)
 80183bc:	58d1      	ldr	r1, [r2, r3]
 80183be:	0043      	lsls	r3, r0, #1
 80183c0:	181b      	adds	r3, r3, r0
 80183c2:	009b      	lsls	r3, r3, #2
 80183c4:	18cb      	adds	r3, r1, r3
 80183c6:	8959      	ldrh	r1, [r3, #10]
 80183c8:	23df      	movs	r3, #223	@ 0xdf
 80183ca:	4657      	mov	r7, sl
 80183cc:	011b      	lsls	r3, r3, #4
 80183ce:	58d0      	ldr	r0, [r2, r3]
 80183d0:	008b      	lsls	r3, r1, #2
 80183d2:	185b      	adds	r3, r3, r1
 80183d4:	9a06      	ldr	r2, [sp, #24]
 80183d6:	9907      	ldr	r1, [sp, #28]
 80183d8:	00db      	lsls	r3, r3, #3
 80183da:	581b      	ldr	r3, [r3, r0]
 80183dc:	1a52      	subs	r2, r2, r1
 80183de:	189b      	adds	r3, r3, r2
 80183e0:	617b      	str	r3, [r7, #20]
 80183e2:	9a02      	ldr	r2, [sp, #8]
 80183e4:	6a3b      	ldr	r3, [r7, #32]
 80183e6:	189b      	adds	r3, r3, r2
 80183e8:	6bfd      	ldr	r5, [r7, #60]	@ 0x3c
 80183ea:	623b      	str	r3, [r7, #32]
 80183ec:	9b04      	ldr	r3, [sp, #16]
 80183ee:	0028      	movs	r0, r5
 80183f0:	0019      	movs	r1, r3
 80183f2:	4699      	mov	r9, r3
 80183f4:	f00d f8f2 	bl	80255dc <fn_080255DC>
 80183f8:	6c3e      	ldr	r6, [r7, #64]	@ 0x40
 80183fa:	9b03      	ldr	r3, [sp, #12]
 80183fc:	0004      	movs	r4, r0
 80183fe:	0019      	movs	r1, r3
 8018400:	0030      	movs	r0, r6
 8018402:	4698      	mov	r8, r3
 8018404:	f00d f8ea 	bl	80255dc <fn_080255DC>
 8018408:	1a24      	subs	r4, r4, r0
 801840a:	4649      	mov	r1, r9
 801840c:	63fc      	str	r4, [r7, #60]	@ 0x3c
 801840e:	0030      	movs	r0, r6
 8018410:	f00d f8e4 	bl	80255dc <fn_080255DC>
 8018414:	4641      	mov	r1, r8
 8018416:	0004      	movs	r4, r0
 8018418:	0028      	movs	r0, r5
 801841a:	f00d f8df 	bl	80255dc <fn_080255DC>
 801841e:	9d01      	ldr	r5, [sp, #4]
 8018420:	1824      	adds	r4, r4, r0
 8018422:	643c      	str	r4, [r7, #64]	@ 0x40
 8018424:	2d00      	cmp	r5, #0
 8018426:	d006      	beq.n	8018436 <fn_080181A8+0x28e>
 8018428:	2300      	movs	r3, #0
 801842a:	69ac      	ldr	r4, [r5, #24]
 801842c:	0028      	movs	r0, r5
 801842e:	61ab      	str	r3, [r5, #24]
 8018430:	f000 f91a 	bl	8018668 <fn_08018668>
 8018434:	61ac      	str	r4, [r5, #24]
 8018436:	2001      	movs	r0, #1
 8018438:	e000      	b.n	801843c <fn_080181A8+0x294>
 801843a:	2000      	movs	r0, #0
 801843c:	b009      	add	sp, #36	@ 0x24
 801843e:	bcf0      	pop	{r4, r5, r6, r7}
 8018440:	46bb      	mov	fp, r7
 8018442:	46b2      	mov	sl, r6
 8018444:	46a9      	mov	r9, r5
 8018446:	46a0      	mov	r8, r4
 8018448:	bcf0      	pop	{r4, r5, r6, r7}
 801844a:	bc02      	pop	{r1}
 801844c:	4708      	bx	r1
 801844e:	0fdb      	lsrs	r3, r3, #31
 8018450:	1bdb      	subs	r3, r3, r7
 8018452:	425a      	negs	r2, r3
 8018454:	4153      	adcs	r3, r2
 8018456:	2202      	movs	r2, #2
 8018458:	46cc      	mov	ip, r9
 801845a:	425b      	negs	r3, r3
 801845c:	4013      	ands	r3, r2
 801845e:	3b01      	subs	r3, #1
 8018460:	449c      	add	ip, r3
 8018462:	46e1      	mov	r9, ip
 8018464:	e771      	b.n	801834a <fn_080181A8+0x1a2>
 8018466:	2380      	movs	r3, #128	@ 0x80
 8018468:	061b      	lsls	r3, r3, #24
 801846a:	4698      	mov	r8, r3
 801846c:	e6f5      	b.n	801825a <fn_080181A8+0xb2>
 801846e:	4651      	mov	r1, sl
 8018470:	887a      	ldrh	r2, [r7, #2]
 8018472:	6908      	ldr	r0, [r1, #16]
 8018474:	0412      	lsls	r2, r2, #16
 8018476:	1a80      	subs	r0, r0, r2
 8018478:	0002      	movs	r2, r0
 801847a:	041b      	lsls	r3, r3, #16
 801847c:	405a      	eors	r2, r3
 801847e:	9201      	str	r2, [sp, #4]
 8018480:	17c2      	asrs	r2, r0, #31
 8018482:	17d9      	asrs	r1, r3, #31
 8018484:	1880      	adds	r0, r0, r2
 8018486:	4050      	eors	r0, r2
 8018488:	185a      	adds	r2, r3, r1
 801848a:	404a      	eors	r2, r1
 801848c:	0401      	lsls	r1, r0, #16
 801848e:	1400      	asrs	r0, r0, #16
 8018490:	f00d f872 	bl	8025578 <fn_08025578>
 8018494:	9a01      	ldr	r2, [sp, #4]
 8018496:	0006      	movs	r6, r0
 8018498:	2a00      	cmp	r2, #0
 801849a:	db00      	blt.n	801849e <fn_080181A8+0x2f6>
 801849c:	e6d6      	b.n	801824c <fn_080181A8+0xa4>
 801849e:	4276      	negs	r6, r6
 80184a0:	e6d4      	b.n	801824c <fn_080181A8+0xa4>
 80184a2:	4650      	mov	r0, sl
 80184a4:	f7f9 fec6 	bl	8012234 <fn_08012234>
 80184a8:	9001      	str	r0, [sp, #4]
 80184aa:	e71a      	b.n	80182e2 <fn_080181A8+0x13a>
 80184ac:	2300      	movs	r3, #0
 80184ae:	681b      	ldr	r3, [r3, #0]
 80184b0:	deff      	udf	#255	@ 0xff
 80184b2:	46c0      	nop			@ (mov r8, r8)
 80184b4:	030064c4 	.word	0x030064c4
 80184b8:	0000ffff 	.word	0x0000ffff
 80184bc:	081397cc 	.word	0x081397cc
 80184c0:	00000e0c 	.word	0x00000e0c
