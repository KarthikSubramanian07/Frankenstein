fn_08010664:
 8010664:	b5f0      	push	{r4, r5, r6, r7, lr}
 8010666:	4645      	mov	r5, r8
 8010668:	46de      	mov	lr, fp
 801066a:	4657      	mov	r7, sl
 801066c:	464e      	mov	r6, r9
 801066e:	225b      	movs	r2, #91	@ 0x5b
 8010670:	4b5d      	ldr	r3, [pc, #372]	@ (80107e8 <fn_08010664+0x184>)
 8010672:	b5e0      	push	{r5, r6, r7, lr}
 8010674:	681d      	ldr	r5, [r3, #0]
 8010676:	4b5d      	ldr	r3, [pc, #372]	@ (80107ec <fn_08010664+0x188>)
 8010678:	58e9      	ldr	r1, [r5, r3]
 801067a:	3304      	adds	r3, #4
 801067c:	58eb      	ldr	r3, [r5, r3]
 801067e:	b08b      	sub	sp, #44	@ 0x2c
 8010680:	9101      	str	r1, [sp, #4]
 8010682:	9302      	str	r3, [sp, #8]
 8010684:	5c84      	ldrb	r4, [r0, r2]
 8010686:	4059      	eors	r1, r3
 8010688:	68c3      	ldr	r3, [r0, #12]
 801068a:	0424      	lsls	r4, r4, #16
 801068c:	6906      	ldr	r6, [r0, #16]
 801068e:	1b1a      	subs	r2, r3, r4
 8010690:	9200      	str	r2, [sp, #0]
 8010692:	191b      	adds	r3, r3, r4
 8010694:	1b32      	subs	r2, r6, r4
 8010696:	4680      	mov	r8, r0
 8010698:	468a      	mov	sl, r1
 801069a:	4693      	mov	fp, r2
 801069c:	9303      	str	r3, [sp, #12]
 801069e:	19a6      	adds	r6, r4, r6
 80106a0:	2900      	cmp	r1, #0
 80106a2:	dc01      	bgt.n	80106a8 <fn_08010664+0x44>
 80106a4:	46b3      	mov	fp, r6
 80106a6:	0016      	movs	r6, r2
 80106a8:	9b01      	ldr	r3, [sp, #4]
 80106aa:	2b00      	cmp	r3, #0
 80106ac:	d13a      	bne.n	8010724 <fn_08010664+0xc0>
 80106ae:	4652      	mov	r2, sl
 80106b0:	4b4f      	ldr	r3, [pc, #316]	@ (80107f0 <fn_08010664+0x18c>)
 80106b2:	9900      	ldr	r1, [sp, #0]
 80106b4:	58eb      	ldr	r3, [r5, r3]
 80106b6:	0fd7      	lsrs	r7, r2, #31
 80106b8:	428b      	cmp	r3, r1
 80106ba:	db02      	blt.n	80106c2 <fn_08010664+0x5e>
 80106bc:	17d7      	asrs	r7, r2, #31
 80106be:	1abf      	subs	r7, r7, r2
 80106c0:	0fff      	lsrs	r7, r7, #31
 80106c2:	4652      	mov	r2, sl
 80106c4:	9803      	ldr	r0, [sp, #12]
 80106c6:	0fd1      	lsrs	r1, r2, #31
 80106c8:	4283      	cmp	r3, r0
 80106ca:	da41      	bge.n	8010750 <fn_08010664+0xec>
 80106cc:	428f      	cmp	r7, r1
 80106ce:	d01f      	beq.n	8010710 <fn_08010664+0xac>
 80106d0:	9b00      	ldr	r3, [sp, #0]
 80106d2:	9306      	str	r3, [sp, #24]
 80106d4:	465b      	mov	r3, fp
 80106d6:	9607      	str	r6, [sp, #28]
 80106d8:	1b9e      	subs	r6, r3, r6
 80106da:	4b45      	ldr	r3, [pc, #276]	@ (80107f0 <fn_08010664+0x18c>)
 80106dc:	0064      	lsls	r4, r4, #1
 80106de:	a906      	add	r1, sp, #24
 80106e0:	18e8      	adds	r0, r5, r3
 80106e2:	9408      	str	r4, [sp, #32]
 80106e4:	9609      	str	r6, [sp, #36]	@ 0x24
 80106e6:	f7ff fc69 	bl	800ffbc <fn_0800FFBC>
 80106ea:	2800      	cmp	r0, #0
 80106ec:	db10      	blt.n	8010710 <fn_08010664+0xac>
 80106ee:	24bd      	movs	r4, #189	@ 0xbd
 80106f0:	4940      	ldr	r1, [pc, #256]	@ (80107f4 <fn_08010664+0x190>)
 80106f2:	4b41      	ldr	r3, [pc, #260]	@ (80107f8 <fn_08010664+0x194>)
 80106f4:	586a      	ldr	r2, [r5, r1]
 80106f6:	18eb      	adds	r3, r5, r3
 80106f8:	1ad3      	subs	r3, r2, r3
 80106fa:	00a4      	lsls	r4, r4, #2
 80106fc:	42a3      	cmp	r3, r4
 80106fe:	d865      	bhi.n	80107cc <fn_08010664+0x168>
 8010700:	2300      	movs	r3, #0
 8010702:	7113      	strb	r3, [r2, #4]
 8010704:	4643      	mov	r3, r8
 8010706:	6093      	str	r3, [r2, #8]
 8010708:	586b      	ldr	r3, [r5, r1]
 801070a:	330c      	adds	r3, #12
 801070c:	6010      	str	r0, [r2, #0]
 801070e:	506b      	str	r3, [r5, r1]
 8010710:	2001      	movs	r0, #1
 8010712:	b00b      	add	sp, #44	@ 0x2c
 8010714:	bcf0      	pop	{r4, r5, r6, r7}
 8010716:	46bb      	mov	fp, r7
 8010718:	46b2      	mov	sl, r6
 801071a:	46a9      	mov	r9, r5
 801071c:	46a0      	mov	r8, r4
 801071e:	bcf0      	pop	{r4, r5, r6, r7}
 8010720:	bc02      	pop	{r1}
 8010722:	4708      	bx	r1
 8010724:	4b32      	ldr	r3, [pc, #200]	@ (80107f0 <fn_08010664+0x18c>)
 8010726:	18eb      	adds	r3, r5, r3
 8010728:	685b      	ldr	r3, [r3, #4]
 801072a:	9a02      	ldr	r2, [sp, #8]
 801072c:	9304      	str	r3, [sp, #16]
 801072e:	2a00      	cmp	r2, #0
 8010730:	d112      	bne.n	8010758 <fn_08010664+0xf4>
 8010732:	429e      	cmp	r6, r3
 8010734:	dd4c      	ble.n	80107d0 <fn_08010664+0x16c>
 8010736:	4653      	mov	r3, sl
 8010738:	17df      	asrs	r7, r3, #31
 801073a:	1aff      	subs	r7, r7, r3
 801073c:	0fff      	lsrs	r7, r7, #31
 801073e:	4653      	mov	r3, sl
 8010740:	9a04      	ldr	r2, [sp, #16]
 8010742:	0fd9      	lsrs	r1, r3, #31
 8010744:	4593      	cmp	fp, r2
 8010746:	ddc1      	ble.n	80106cc <fn_08010664+0x68>
 8010748:	17d9      	asrs	r1, r3, #31
 801074a:	1ac9      	subs	r1, r1, r3
 801074c:	0fc9      	lsrs	r1, r1, #31
 801074e:	e7bd      	b.n	80106cc <fn_08010664+0x68>
 8010750:	17d1      	asrs	r1, r2, #31
 8010752:	1a89      	subs	r1, r1, r2
 8010754:	0fc9      	lsrs	r1, r1, #31
 8010756:	e7b9      	b.n	80106cc <fn_08010664+0x68>
 8010758:	4b25      	ldr	r3, [pc, #148]	@ (80107f0 <fn_08010664+0x18c>)
 801075a:	9a00      	ldr	r2, [sp, #0]
 801075c:	58eb      	ldr	r3, [r5, r3]
 801075e:	1ad7      	subs	r7, r2, r3
 8010760:	9305      	str	r3, [sp, #20]
 8010762:	9b04      	ldr	r3, [sp, #16]
 8010764:	1af0      	subs	r0, r6, r3
 8010766:	4653      	mov	r3, sl
 8010768:	407b      	eors	r3, r7
 801076a:	4043      	eors	r3, r0
 801076c:	d433      	bmi.n	80107d6 <fn_08010664+0x172>
 801076e:	9b01      	ldr	r3, [sp, #4]
 8010770:	1200      	asrs	r0, r0, #8
 8010772:	1219      	asrs	r1, r3, #8
 8010774:	f014 ff32 	bl	80255dc <fn_080255DC>
 8010778:	4681      	mov	r9, r0
 801077a:	9b02      	ldr	r3, [sp, #8]
 801077c:	1239      	asrs	r1, r7, #8
 801077e:	1218      	asrs	r0, r3, #8
 8010780:	f014 ff2c 	bl	80255dc <fn_080255DC>
 8010784:	464a      	mov	r2, r9
 8010786:	0fc3      	lsrs	r3, r0, #31
 8010788:	17d7      	asrs	r7, r2, #31
 801078a:	4282      	cmp	r2, r0
 801078c:	415f      	adcs	r7, r3
 801078e:	063f      	lsls	r7, r7, #24
 8010790:	0e3f      	lsrs	r7, r7, #24
 8010792:	9b03      	ldr	r3, [sp, #12]
 8010794:	9a05      	ldr	r2, [sp, #20]
 8010796:	1a9a      	subs	r2, r3, r2
 8010798:	465b      	mov	r3, fp
 801079a:	9904      	ldr	r1, [sp, #16]
 801079c:	1a58      	subs	r0, r3, r1
 801079e:	4653      	mov	r3, sl
 80107a0:	4053      	eors	r3, r2
 80107a2:	9203      	str	r2, [sp, #12]
 80107a4:	4043      	eors	r3, r0
 80107a6:	d41a      	bmi.n	80107de <fn_08010664+0x17a>
 80107a8:	9b01      	ldr	r3, [sp, #4]
 80107aa:	1200      	asrs	r0, r0, #8
 80107ac:	1219      	asrs	r1, r3, #8
 80107ae:	f014 ff15 	bl	80255dc <fn_080255DC>
 80107b2:	4681      	mov	r9, r0
 80107b4:	9b03      	ldr	r3, [sp, #12]
 80107b6:	1219      	asrs	r1, r3, #8
 80107b8:	9b02      	ldr	r3, [sp, #8]
 80107ba:	1218      	asrs	r0, r3, #8
 80107bc:	f014 ff0e 	bl	80255dc <fn_080255DC>
 80107c0:	464a      	mov	r2, r9
 80107c2:	0fc3      	lsrs	r3, r0, #31
 80107c4:	17d1      	asrs	r1, r2, #31
 80107c6:	4282      	cmp	r2, r0
 80107c8:	4159      	adcs	r1, r3
 80107ca:	e77f      	b.n	80106cc <fn_08010664+0x68>
 80107cc:	2000      	movs	r0, #0
 80107ce:	e7a0      	b.n	8010712 <fn_08010664+0xae>
 80107d0:	4653      	mov	r3, sl
 80107d2:	0fdf      	lsrs	r7, r3, #31
 80107d4:	e7b3      	b.n	801073e <fn_08010664+0xda>
 80107d6:	9b02      	ldr	r3, [sp, #8]
 80107d8:	405f      	eors	r7, r3
 80107da:	0fff      	lsrs	r7, r7, #31
 80107dc:	e7d9      	b.n	8010792 <fn_08010664+0x12e>
 80107de:	9902      	ldr	r1, [sp, #8]
 80107e0:	4051      	eors	r1, r2
 80107e2:	0fc9      	lsrs	r1, r1, #31
 80107e4:	e772      	b.n	80106cc <fn_08010664+0x68>
 80107e6:	46c0      	nop			@ (mov r8, r8)
 80107e8:	030064c4 	.word	0x030064c4	@ data_030064C4
 80107ec:	0000094c 	.word	0x0000094c
 80107f0:	00000944 	.word	0x00000944
 80107f4:	00000c54 	.word	0x00000c54
 80107f8:	00000954 	.word	0x00000954
