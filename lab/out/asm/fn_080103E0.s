fn_080103E0:
 80103e0:	b5f0      	push	{r4, r5, r6, r7, lr}
 80103e2:	4657      	mov	r7, sl
 80103e4:	464e      	mov	r6, r9
 80103e6:	4645      	mov	r5, r8
 80103e8:	46de      	mov	lr, fp
 80103ea:	b5e0      	push	{r5, r6, r7, lr}
 80103ec:	4b96      	ldr	r3, [pc, #600]	@ (8010648 <fn_080103E0+0x268>)
 80103ee:	681d      	ldr	r5, [r3, #0]
 80103f0:	4b96      	ldr	r3, [pc, #600]	@ (801064c <fn_080103E0+0x26c>)
 80103f2:	58ea      	ldr	r2, [r5, r3]
 80103f4:	8803      	ldrh	r3, [r0, #0]
 80103f6:	b08b      	sub	sp, #44	@ 0x2c
 80103f8:	041b      	lsls	r3, r3, #16
 80103fa:	9301      	str	r3, [sp, #4]
 80103fc:	8843      	ldrh	r3, [r0, #2]
 80103fe:	041b      	lsls	r3, r3, #16
 8010400:	9302      	str	r3, [sp, #8]
 8010402:	2380      	movs	r3, #128	@ 0x80
 8010404:	0006      	movs	r6, r0
 8010406:	4692      	mov	sl, r2
 8010408:	035b      	lsls	r3, r3, #13
 801040a:	429a      	cmp	r2, r3
 801040c:	dd26      	ble.n	801045c <fn_080103E0+0x7c>
 801040e:	4b90      	ldr	r3, [pc, #576]	@ (8010650 <fn_080103E0+0x270>)
 8010410:	18eb      	adds	r3, r5, r3
 8010412:	68df      	ldr	r7, [r3, #12]
 8010414:	685a      	ldr	r2, [r3, #4]
 8010416:	88f3      	ldrh	r3, [r6, #6]
 8010418:	041b      	lsls	r3, r3, #16
 801041a:	4691      	mov	r9, r2
 801041c:	469b      	mov	fp, r3
 801041e:	2f00      	cmp	r7, #0
 8010420:	d000      	beq.n	8010424 <fn_080103E0+0x44>
 8010422:	e084      	b.n	801052e <fn_080103E0+0x14e>
 8010424:	9b02      	ldr	r3, [sp, #8]
 8010426:	429a      	cmp	r2, r3
 8010428:	db00      	blt.n	801042c <fn_080103E0+0x4c>
 801042a:	e0c2      	b.n	80105b2 <fn_080103E0+0x1d2>
 801042c:	4653      	mov	r3, sl
 801042e:	17dc      	asrs	r4, r3, #31
 8010430:	1ae4      	subs	r4, r4, r3
 8010432:	0fe4      	lsrs	r4, r4, #31
 8010434:	4653      	mov	r3, sl
 8010436:	0fdb      	lsrs	r3, r3, #31
 8010438:	45d9      	cmp	r9, fp
 801043a:	da28      	bge.n	801048e <fn_080103E0+0xae>
 801043c:	4652      	mov	r2, sl
 801043e:	17d3      	asrs	r3, r2, #31
 8010440:	1a9b      	subs	r3, r3, r2
 8010442:	0fdb      	lsrs	r3, r3, #31
 8010444:	429c      	cmp	r4, r3
 8010446:	d124      	bne.n	8010492 <fn_080103E0+0xb2>
 8010448:	2001      	movs	r0, #1
 801044a:	b00b      	add	sp, #44	@ 0x2c
 801044c:	bcf0      	pop	{r4, r5, r6, r7}
 801044e:	46bb      	mov	fp, r7
 8010450:	46b2      	mov	sl, r6
 8010452:	46a9      	mov	r9, r5
 8010454:	46a0      	mov	r8, r4
 8010456:	bcf0      	pop	{r4, r5, r6, r7}
 8010458:	bc02      	pop	{r1}
 801045a:	4708      	bx	r1
 801045c:	2295      	movs	r2, #149	@ 0x95
 801045e:	0112      	lsls	r2, r2, #4
 8010460:	58af      	ldr	r7, [r5, r2]
 8010462:	429f      	cmp	r7, r3
 8010464:	dd37      	ble.n	80104d6 <fn_080103E0+0xf6>
 8010466:	4653      	mov	r3, sl
 8010468:	2b00      	cmp	r3, #0
 801046a:	d159      	bne.n	8010520 <fn_080103E0+0x140>
 801046c:	4b78      	ldr	r3, [pc, #480]	@ (8010650 <fn_080103E0+0x270>)
 801046e:	88b2      	ldrh	r2, [r6, #4]
 8010470:	58e9      	ldr	r1, [r5, r3]
 8010472:	9b01      	ldr	r3, [sp, #4]
 8010474:	0412      	lsls	r2, r2, #16
 8010476:	0ffc      	lsrs	r4, r7, #31
 8010478:	4299      	cmp	r1, r3
 801047a:	db02      	blt.n	8010482 <fn_080103E0+0xa2>
 801047c:	17fc      	asrs	r4, r7, #31
 801047e:	1be4      	subs	r4, r4, r7
 8010480:	0fe4      	lsrs	r4, r4, #31
 8010482:	0ffb      	lsrs	r3, r7, #31
 8010484:	4291      	cmp	r1, r2
 8010486:	db02      	blt.n	801048e <fn_080103E0+0xae>
 8010488:	17fb      	asrs	r3, r7, #31
 801048a:	1bdb      	subs	r3, r3, r7
 801048c:	0fdb      	lsrs	r3, r3, #31
 801048e:	429c      	cmp	r4, r3
 8010490:	d0da      	beq.n	8010448 <fn_080103E0+0x68>
 8010492:	9b01      	ldr	r3, [sp, #4]
 8010494:	9306      	str	r3, [sp, #24]
 8010496:	9b02      	ldr	r3, [sp, #8]
 8010498:	9307      	str	r3, [sp, #28]
 801049a:	8933      	ldrh	r3, [r6, #8]
 801049c:	041b      	lsls	r3, r3, #16
 801049e:	9308      	str	r3, [sp, #32]
 80104a0:	8973      	ldrh	r3, [r6, #10]
 80104a2:	041b      	lsls	r3, r3, #16
 80104a4:	9309      	str	r3, [sp, #36]	@ 0x24
 80104a6:	4b6a      	ldr	r3, [pc, #424]	@ (8010650 <fn_080103E0+0x270>)
 80104a8:	a906      	add	r1, sp, #24
 80104aa:	18e8      	adds	r0, r5, r3
 80104ac:	f7ff fd86 	bl	800ffbc <fn_0800FFBC>
 80104b0:	2800      	cmp	r0, #0
 80104b2:	dbc9      	blt.n	8010448 <fn_080103E0+0x68>
 80104b4:	24bd      	movs	r4, #189	@ 0xbd
 80104b6:	4967      	ldr	r1, [pc, #412]	@ (8010654 <fn_080103E0+0x274>)
 80104b8:	4b67      	ldr	r3, [pc, #412]	@ (8010658 <fn_080103E0+0x278>)
 80104ba:	586a      	ldr	r2, [r5, r1]
 80104bc:	18eb      	adds	r3, r5, r3
 80104be:	1ad3      	subs	r3, r2, r3
 80104c0:	00a4      	lsls	r4, r4, #2
 80104c2:	42a3      	cmp	r3, r4
 80104c4:	d87b      	bhi.n	80105be <fn_080103E0+0x1de>
 80104c6:	2301      	movs	r3, #1
 80104c8:	6096      	str	r6, [r2, #8]
 80104ca:	7113      	strb	r3, [r2, #4]
 80104cc:	586b      	ldr	r3, [r5, r1]
 80104ce:	330c      	adds	r3, #12
 80104d0:	6010      	str	r0, [r2, #0]
 80104d2:	506b      	str	r3, [r5, r1]
 80104d4:	e7b8      	b.n	8010448 <fn_080103E0+0x68>
 80104d6:	4b61      	ldr	r3, [pc, #388]	@ (801065c <fn_080103E0+0x27c>)
 80104d8:	459a      	cmp	sl, r3
 80104da:	db67      	blt.n	80105ac <fn_080103E0+0x1cc>
 80104dc:	429f      	cmp	r7, r3
 80104de:	dbc2      	blt.n	8010466 <fn_080103E0+0x86>
 80104e0:	4b5b      	ldr	r3, [pc, #364]	@ (8010650 <fn_080103E0+0x270>)
 80104e2:	58eb      	ldr	r3, [r5, r3]
 80104e4:	9303      	str	r3, [sp, #12]
 80104e6:	2108      	movs	r1, #8
 80104e8:	5e42      	ldrsh	r2, [r0, r1]
 80104ea:	210a      	movs	r1, #10
 80104ec:	5e40      	ldrsh	r0, [r0, r1]
 80104ee:	4694      	mov	ip, r2
 80104f0:	4680      	mov	r8, r0
 80104f2:	2a00      	cmp	r2, #0
 80104f4:	d069      	beq.n	80105ca <fn_080103E0+0x1ea>
 80104f6:	4b5a      	ldr	r3, [pc, #360]	@ (8010660 <fn_080103E0+0x280>)
 80104f8:	58e8      	ldr	r0, [r5, r3]
 80104fa:	4643      	mov	r3, r8
 80104fc:	183f      	adds	r7, r7, r0
 80104fe:	2b00      	cmp	r3, #0
 8010500:	d176      	bne.n	80105f0 <fn_080103E0+0x210>
 8010502:	9b02      	ldr	r3, [sp, #8]
 8010504:	4298      	cmp	r0, r3
 8010506:	dd00      	ble.n	801050a <fn_080103E0+0x12a>
 8010508:	e099      	b.n	801063e <fn_080103E0+0x25e>
 801050a:	0fd4      	lsrs	r4, r2, #31
 801050c:	4663      	mov	r3, ip
 801050e:	9a02      	ldr	r2, [sp, #8]
 8010510:	0fdb      	lsrs	r3, r3, #31
 8010512:	4297      	cmp	r7, r2
 8010514:	ddbb      	ble.n	801048e <fn_080103E0+0xae>
 8010516:	4662      	mov	r2, ip
 8010518:	17d3      	asrs	r3, r2, #31
 801051a:	1a9b      	subs	r3, r3, r2
 801051c:	0fdb      	lsrs	r3, r3, #31
 801051e:	e7b6      	b.n	801048e <fn_080103E0+0xae>
 8010520:	4b4b      	ldr	r3, [pc, #300]	@ (8010650 <fn_080103E0+0x270>)
 8010522:	18eb      	adds	r3, r5, r3
 8010524:	685b      	ldr	r3, [r3, #4]
 8010526:	4699      	mov	r9, r3
 8010528:	88f3      	ldrh	r3, [r6, #6]
 801052a:	041b      	lsls	r3, r3, #16
 801052c:	469b      	mov	fp, r3
 801052e:	4b48      	ldr	r3, [pc, #288]	@ (8010650 <fn_080103E0+0x270>)
 8010530:	4652      	mov	r2, sl
 8010532:	58eb      	ldr	r3, [r5, r3]
 8010534:	9901      	ldr	r1, [sp, #4]
 8010536:	1acc      	subs	r4, r1, r3
 8010538:	4649      	mov	r1, r9
 801053a:	407a      	eors	r2, r7
 801053c:	9303      	str	r3, [sp, #12]
 801053e:	9204      	str	r2, [sp, #16]
 8010540:	9b02      	ldr	r3, [sp, #8]
 8010542:	1a58      	subs	r0, r3, r1
 8010544:	88b3      	ldrh	r3, [r6, #4]
 8010546:	041b      	lsls	r3, r3, #16
 8010548:	9305      	str	r3, [sp, #20]
 801054a:	0023      	movs	r3, r4
 801054c:	4043      	eors	r3, r0
 801054e:	4053      	eors	r3, r2
 8010550:	d432      	bmi.n	80105b8 <fn_080103E0+0x1d8>
 8010552:	4653      	mov	r3, sl
 8010554:	1200      	asrs	r0, r0, #8
 8010556:	1219      	asrs	r1, r3, #8
 8010558:	f015 f898 	bl	802568c <fn_0802568C>
 801055c:	4680      	mov	r8, r0
 801055e:	1221      	asrs	r1, r4, #8
 8010560:	1238      	asrs	r0, r7, #8
 8010562:	f015 f893 	bl	802568c <fn_0802568C>
 8010566:	4642      	mov	r2, r8
 8010568:	0fc3      	lsrs	r3, r0, #31
 801056a:	17d4      	asrs	r4, r2, #31
 801056c:	4282      	cmp	r2, r0
 801056e:	415c      	adcs	r4, r3
 8010570:	0624      	lsls	r4, r4, #24
 8010572:	0e24      	lsrs	r4, r4, #24
 8010574:	9a03      	ldr	r2, [sp, #12]
 8010576:	9b05      	ldr	r3, [sp, #20]
 8010578:	4649      	mov	r1, r9
 801057a:	1a9b      	subs	r3, r3, r2
 801057c:	465a      	mov	r2, fp
 801057e:	1a50      	subs	r0, r2, r1
 8010580:	9a04      	ldr	r2, [sp, #16]
 8010582:	9303      	str	r3, [sp, #12]
 8010584:	4043      	eors	r3, r0
 8010586:	4053      	eors	r3, r2
 8010588:	d41b      	bmi.n	80105c2 <fn_080103E0+0x1e2>
 801058a:	4653      	mov	r3, sl
 801058c:	1200      	asrs	r0, r0, #8
 801058e:	1219      	asrs	r1, r3, #8
 8010590:	f015 f87c 	bl	802568c <fn_0802568C>
 8010594:	4680      	mov	r8, r0
 8010596:	9b03      	ldr	r3, [sp, #12]
 8010598:	1238      	asrs	r0, r7, #8
 801059a:	1219      	asrs	r1, r3, #8
 801059c:	f015 f876 	bl	802568c <fn_0802568C>
 80105a0:	4641      	mov	r1, r8
 80105a2:	0fc2      	lsrs	r2, r0, #31
 80105a4:	17cb      	asrs	r3, r1, #31
 80105a6:	4281      	cmp	r1, r0
 80105a8:	4153      	adcs	r3, r2
 80105aa:	e770      	b.n	801048e <fn_080103E0+0xae>
 80105ac:	4b28      	ldr	r3, [pc, #160]	@ (8010650 <fn_080103E0+0x270>)
 80105ae:	18eb      	adds	r3, r5, r3
 80105b0:	e730      	b.n	8010414 <fn_080103E0+0x34>
 80105b2:	4653      	mov	r3, sl
 80105b4:	0fdc      	lsrs	r4, r3, #31
 80105b6:	e73d      	b.n	8010434 <fn_080103E0+0x54>
 80105b8:	407c      	eors	r4, r7
 80105ba:	0fe4      	lsrs	r4, r4, #31
 80105bc:	e7da      	b.n	8010574 <fn_080103E0+0x194>
 80105be:	2000      	movs	r0, #0
 80105c0:	e743      	b.n	801044a <fn_080103E0+0x6a>
 80105c2:	9b03      	ldr	r3, [sp, #12]
 80105c4:	407b      	eors	r3, r7
 80105c6:	0fdb      	lsrs	r3, r3, #31
 80105c8:	e761      	b.n	801048e <fn_080103E0+0xae>
 80105ca:	4652      	mov	r2, sl
 80105cc:	9901      	ldr	r1, [sp, #4]
 80105ce:	18d2      	adds	r2, r2, r3
 80105d0:	0fc4      	lsrs	r4, r0, #31
 80105d2:	428b      	cmp	r3, r1
 80105d4:	dc02      	bgt.n	80105dc <fn_080103E0+0x1fc>
 80105d6:	17c4      	asrs	r4, r0, #31
 80105d8:	1a24      	subs	r4, r4, r0
 80105da:	0fe4      	lsrs	r4, r4, #31
 80105dc:	4641      	mov	r1, r8
 80105de:	9801      	ldr	r0, [sp, #4]
 80105e0:	0fcb      	lsrs	r3, r1, #31
 80105e2:	4282      	cmp	r2, r0
 80105e4:	dd00      	ble.n	80105e8 <fn_080103E0+0x208>
 80105e6:	e752      	b.n	801048e <fn_080103E0+0xae>
 80105e8:	17cb      	asrs	r3, r1, #31
 80105ea:	1a5b      	subs	r3, r3, r1
 80105ec:	0fdb      	lsrs	r3, r3, #31
 80105ee:	e74e      	b.n	801048e <fn_080103E0+0xae>
 80105f0:	9b02      	ldr	r3, [sp, #8]
 80105f2:	4661      	mov	r1, ip
 80105f4:	1ac0      	subs	r0, r0, r3
 80105f6:	4691      	mov	r9, r2
 80105f8:	f015 f848 	bl	802568c <fn_0802568C>
 80105fc:	9a03      	ldr	r2, [sp, #12]
 80105fe:	0004      	movs	r4, r0
 8010600:	9801      	ldr	r0, [sp, #4]
 8010602:	1a11      	subs	r1, r2, r0
 8010604:	4640      	mov	r0, r8
 8010606:	f015 f841 	bl	802568c <fn_0802568C>
 801060a:	17e2      	asrs	r2, r4, #31
 801060c:	0fc3      	lsrs	r3, r0, #31
 801060e:	4284      	cmp	r4, r0
 8010610:	415a      	adcs	r2, r3
 8010612:	4651      	mov	r1, sl
 8010614:	9b02      	ldr	r3, [sp, #8]
 8010616:	0014      	movs	r4, r2
 8010618:	9a03      	ldr	r2, [sp, #12]
 801061a:	1af8      	subs	r0, r7, r3
 801061c:	188a      	adds	r2, r1, r2
 801061e:	4649      	mov	r1, r9
 8010620:	9203      	str	r2, [sp, #12]
 8010622:	f015 f833 	bl	802568c <fn_0802568C>
 8010626:	9b01      	ldr	r3, [sp, #4]
 8010628:	9903      	ldr	r1, [sp, #12]
 801062a:	0007      	movs	r7, r0
 801062c:	1ac9      	subs	r1, r1, r3
 801062e:	4640      	mov	r0, r8
 8010630:	f015 f82c 	bl	802568c <fn_0802568C>
 8010634:	17fb      	asrs	r3, r7, #31
 8010636:	0fc2      	lsrs	r2, r0, #31
 8010638:	4287      	cmp	r7, r0
 801063a:	4153      	adcs	r3, r2
 801063c:	e727      	b.n	801048e <fn_080103E0+0xae>
 801063e:	17d4      	asrs	r4, r2, #31
 8010640:	1aa4      	subs	r4, r4, r2
 8010642:	0fe4      	lsrs	r4, r4, #31
 8010644:	e762      	b.n	801050c <fn_080103E0+0x12c>
 8010646:	46c0      	nop			@ (mov r8, r8)
 8010648:	030064c4 	.word	0x030064c4
 801064c:	0000094c 	.word	0x0000094c
 8010650:	00000944 	.word	0x00000944
 8010654:	00000c54 	.word	0x00000c54
 8010658:	00000954 	.word	0x00000954
 801065c:	fff00000 	.word	0xfff00000
 8010660:	00000948 	.word	0x00000948
