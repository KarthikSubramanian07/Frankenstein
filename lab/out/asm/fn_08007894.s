fn_08007894:
 8007894:	b5f0      	push	{r4, r5, r6, r7, lr}
 8007896:	4657      	mov	r7, sl
 8007898:	4645      	mov	r5, r8
 800789a:	46de      	mov	lr, fp
 800789c:	464e      	mov	r6, r9
 800789e:	b5e0      	push	{r5, r6, r7, lr}
 80078a0:	0005      	movs	r5, r0
 80078a2:	b085      	sub	sp, #20
 80078a4:	9302      	str	r3, [sp, #8]
 80078a6:	0010      	movs	r0, r2
 80078a8:	241e      	movs	r4, #30
 80078aa:	5f2a      	ldrsh	r2, [r5, r4]
 80078ac:	000f      	movs	r7, r1
 80078ae:	2a00      	cmp	r2, #0
 80078b0:	dc00      	bgt.n	80078b4 <fn_08007894+0x20>
 80078b2:	e08a      	b.n	80079ca <fn_08007894+0x136>
 80078b4:	4b46      	ldr	r3, [pc, #280]	@ (80079d0 <fn_08007894+0x13c>)
 80078b6:	4699      	mov	r9, r3
 80078b8:	6819      	ldr	r1, [r3, #0]
 80078ba:	9b0e      	ldr	r3, [sp, #56]	@ 0x38
 80078bc:	9300      	str	r3, [sp, #0]
 80078be:	2303      	movs	r3, #3
 80078c0:	26e0      	movs	r6, #224	@ 0xe0
 80078c2:	2400      	movs	r4, #0
 80078c4:	46b8      	mov	r8, r7
 80078c6:	4003      	ands	r3, r0
 80078c8:	9303      	str	r3, [sp, #12]
 80078ca:	0136      	lsls	r6, r6, #4
 80078cc:	69ab      	ldr	r3, [r5, #24]
 80078ce:	0060      	lsls	r0, r4, #1
 80078d0:	5ac3      	ldrh	r3, [r0, r3]
 80078d2:	5988      	ldr	r0, [r1, r6]
 80078d4:	015b      	lsls	r3, r3, #5
 80078d6:	18c0      	adds	r0, r0, r3
 80078d8:	8b07      	ldrh	r7, [r0, #24]
 80078da:	077b      	lsls	r3, r7, #29
 80078dc:	d568      	bpl.n	80079b0 <fn_08007894+0x11c>
 80078de:	2340      	movs	r3, #64	@ 0x40
 80078e0:	403b      	ands	r3, r7
 80078e2:	4543      	cmp	r3, r8
 80078e4:	d164      	bne.n	80079b0 <fn_08007894+0x11c>
 80078e6:	23df      	movs	r3, #223	@ 0xdf
 80078e8:	011b      	lsls	r3, r3, #4
 80078ea:	58cb      	ldr	r3, [r1, r3]
 80078ec:	469a      	mov	sl, r3
 80078ee:	4b39      	ldr	r3, [pc, #228]	@ (80079d4 <fn_08007894+0x140>)
 80078f0:	58cb      	ldr	r3, [r1, r3]
 80078f2:	469c      	mov	ip, r3
 80078f4:	8a83      	ldrh	r3, [r0, #20]
 80078f6:	469b      	mov	fp, r3
 80078f8:	005b      	lsls	r3, r3, #1
 80078fa:	445b      	add	r3, fp
 80078fc:	009b      	lsls	r3, r3, #2
 80078fe:	4463      	add	r3, ip
 8007900:	895b      	ldrh	r3, [r3, #10]
 8007902:	469b      	mov	fp, r3
 8007904:	009b      	lsls	r3, r3, #2
 8007906:	445b      	add	r3, fp
 8007908:	00db      	lsls	r3, r3, #3
 800790a:	4453      	add	r3, sl
 800790c:	1aef      	subs	r7, r5, r3
 800790e:	427b      	negs	r3, r7
 8007910:	417b      	adcs	r3, r7
 8007912:	005b      	lsls	r3, r3, #1
 8007914:	18c3      	adds	r3, r0, r3
 8007916:	8a9b      	ldrh	r3, [r3, #20]
 8007918:	469b      	mov	fp, r3
 800791a:	005b      	lsls	r3, r3, #1
 800791c:	445b      	add	r3, fp
 800791e:	009b      	lsls	r3, r3, #2
 8007920:	4463      	add	r3, ip
 8007922:	895b      	ldrh	r3, [r3, #10]
 8007924:	469c      	mov	ip, r3
 8007926:	009b      	lsls	r3, r3, #2
 8007928:	4463      	add	r3, ip
 800792a:	00db      	lsls	r3, r3, #3
 800792c:	449a      	add	sl, r3
 800792e:	4b2a      	ldr	r3, [pc, #168]	@ (80079d8 <fn_08007894+0x144>)
 8007930:	469b      	mov	fp, r3
 8007932:	4653      	mov	r3, sl
 8007934:	8b9b      	ldrh	r3, [r3, #28]
 8007936:	469c      	mov	ip, r3
 8007938:	465b      	mov	r3, fp
 800793a:	5acb      	ldrh	r3, [r1, r3]
 800793c:	459c      	cmp	ip, r3
 800793e:	d037      	beq.n	80079b0 <fn_08007894+0x11c>
 8007940:	f008 fb76 	bl	8010030 <fn_08010030>
 8007944:	464b      	mov	r3, r9
 8007946:	6819      	ldr	r1, [r3, #0]
 8007948:	4b24      	ldr	r3, [pc, #144]	@ (80079dc <fn_08007894+0x148>)
 800794a:	58cb      	ldr	r3, [r1, r3]
 800794c:	2b00      	cmp	r3, #0
 800794e:	dd2d      	ble.n	80079ac <fn_08007894+0x118>
 8007950:	465b      	mov	r3, fp
 8007952:	4652      	mov	r2, sl
 8007954:	5acb      	ldrh	r3, [r1, r3]
 8007956:	8393      	strh	r3, [r2, #28]
 8007958:	2227      	movs	r2, #39	@ 0x27
 800795a:	4653      	mov	r3, sl
 800795c:	2103      	movs	r1, #3
 800795e:	5c9b      	ldrb	r3, [r3, r2]
 8007960:	438b      	bics	r3, r1
 8007962:	9903      	ldr	r1, [sp, #12]
 8007964:	4650      	mov	r0, sl
 8007966:	430b      	orrs	r3, r1
 8007968:	4651      	mov	r1, sl
 800796a:	3008      	adds	r0, #8
 800796c:	548b      	strb	r3, [r1, r2]
 800796e:	9902      	ldr	r1, [sp, #8]
 8007970:	f010 fe1e 	bl	80185b0 <fn_080185B0>
 8007974:	464b      	mov	r3, r9
 8007976:	6819      	ldr	r1, [r3, #0]
 8007978:	4b19      	ldr	r3, [pc, #100]	@ (80079e0 <fn_08007894+0x14c>)
 800797a:	58cb      	ldr	r3, [r1, r3]
 800797c:	469b      	mov	fp, r3
 800797e:	9b00      	ldr	r3, [sp, #0]
 8007980:	0058      	lsls	r0, r3, #1
 8007982:	23df      	movs	r3, #223	@ 0xdf
 8007984:	011b      	lsls	r3, r3, #4
 8007986:	58cf      	ldr	r7, [r1, r3]
 8007988:	4653      	mov	r3, sl
 800798a:	1bdf      	subs	r7, r3, r7
 800798c:	10ff      	asrs	r7, r7, #3
 800798e:	007b      	lsls	r3, r7, #1
 8007990:	19db      	adds	r3, r3, r7
 8007992:	011a      	lsls	r2, r3, #4
 8007994:	189b      	adds	r3, r3, r2
 8007996:	021a      	lsls	r2, r3, #8
 8007998:	189b      	adds	r3, r3, r2
 800799a:	041a      	lsls	r2, r3, #16
 800799c:	189b      	adds	r3, r3, r2
 800799e:	465a      	mov	r2, fp
 80079a0:	009b      	lsls	r3, r3, #2
 80079a2:	19db      	adds	r3, r3, r7
 80079a4:	5283      	strh	r3, [r0, r2]
 80079a6:	9b00      	ldr	r3, [sp, #0]
 80079a8:	3301      	adds	r3, #1
 80079aa:	9300      	str	r3, [sp, #0]
 80079ac:	231e      	movs	r3, #30
 80079ae:	5eea      	ldrsh	r2, [r5, r3]
 80079b0:	3401      	adds	r4, #1
 80079b2:	42a2      	cmp	r2, r4
 80079b4:	dc8a      	bgt.n	80078cc <fn_08007894+0x38>
 80079b6:	9800      	ldr	r0, [sp, #0]
 80079b8:	b005      	add	sp, #20
 80079ba:	bcf0      	pop	{r4, r5, r6, r7}
 80079bc:	46bb      	mov	fp, r7
 80079be:	46b2      	mov	sl, r6
 80079c0:	46a9      	mov	r9, r5
 80079c2:	46a0      	mov	r8, r4
 80079c4:	bcf0      	pop	{r4, r5, r6, r7}
 80079c6:	bc02      	pop	{r1}
 80079c8:	4708      	bx	r1
 80079ca:	9b0e      	ldr	r3, [sp, #56]	@ 0x38
 80079cc:	9300      	str	r3, [sp, #0]
 80079ce:	e7f2      	b.n	80079b6 <fn_08007894+0x122>
 80079d0:	030064c4 	.word	0x030064c4
 80079d4:	00000e0c 	.word	0x00000e0c
 80079d8:	00001122 	.word	0x00001122
 80079dc:	00000934 	.word	0x00000934
 80079e0:	0000085c 	.word	0x0000085c
