fn_080137A8:
 80137a8:	b5f0      	push	{r4, r5, r6, r7, lr}
 80137aa:	46de      	mov	lr, fp
 80137ac:	464e      	mov	r6, r9
 80137ae:	4645      	mov	r5, r8
 80137b0:	4657      	mov	r7, sl
 80137b2:	b5e0      	push	{r5, r6, r7, lr}
 80137b4:	0007      	movs	r7, r0
 80137b6:	b083      	sub	sp, #12
 80137b8:	2102      	movs	r1, #2
 80137ba:	6800      	ldr	r0, [r0, #0]
 80137bc:	f006 fdde 	bl	801a37c <fn_0801A37C>
 80137c0:	219b      	movs	r1, #155	@ 0x9b
 80137c2:	6838      	ldr	r0, [r7, #0]
 80137c4:	f7fd fd22 	bl	801120c <fn_0801120C>
 80137c8:	4b3a      	ldr	r3, [pc, #232]	@ (80138b4 <fn_080137A8+0x10c>)
 80137ca:	469b      	mov	fp, r3
 80137cc:	6819      	ldr	r1, [r3, #0]
 80137ce:	2353      	movs	r3, #83	@ 0x53
 80137d0:	5cfa      	ldrb	r2, [r7, r3]
 80137d2:	4b39      	ldr	r3, [pc, #228]	@ (80138b8 <fn_080137A8+0x110>)
 80137d4:	58c9      	ldr	r1, [r1, r3]
 80137d6:	0053      	lsls	r3, r2, #1
 80137d8:	189b      	adds	r3, r3, r2
 80137da:	00db      	lsls	r3, r3, #3
 80137dc:	585b      	ldr	r3, [r3, r1]
 80137de:	009b      	lsls	r3, r3, #2
 80137e0:	18fb      	adds	r3, r7, r3
 80137e2:	6fda      	ldr	r2, [r3, #124]	@ 0x7c
 80137e4:	3a01      	subs	r2, #1
 80137e6:	67da      	str	r2, [r3, #124]	@ 0x7c
 80137e8:	2100      	movs	r1, #0
 80137ea:	0038      	movs	r0, r7
 80137ec:	f7ff f872 	bl	80128d4 <fn_080128D4>
 80137f0:	465b      	mov	r3, fp
 80137f2:	681b      	ldr	r3, [r3, #0]
 80137f4:	2280      	movs	r2, #128	@ 0x80
 80137f6:	4698      	mov	r8, r3
 80137f8:	683c      	ldr	r4, [r7, #0]
 80137fa:	6a25      	ldr	r5, [r4, #32]
 80137fc:	04d2      	lsls	r2, r2, #19
 80137fe:	0029      	movs	r1, r5
 8013800:	0020      	movs	r0, r4
 8013802:	f7fc f959 	bl	800fab8 <fn_0800FAB8>
 8013806:	4643      	mov	r3, r8
 8013808:	4e2c      	ldr	r6, [pc, #176]	@ (80138bc <fn_080137A8+0x114>)
 801380a:	5198      	str	r0, [r3, r6]
 801380c:	465b      	mov	r3, fp
 801380e:	681b      	ldr	r3, [r3, #0]
 8013810:	4699      	mov	r9, r3
 8013812:	4b2b      	ldr	r3, [pc, #172]	@ (80138c0 <fn_080137A8+0x118>)
 8013814:	4698      	mov	r8, r3
 8013816:	464b      	mov	r3, r9
 8013818:	4642      	mov	r2, r8
 801381a:	589b      	ldr	r3, [r3, r2]
 801381c:	2b00      	cmp	r3, #0
 801381e:	d02e      	beq.n	801387e <fn_080137A8+0xd6>
 8013820:	2507      	movs	r5, #7
 8013822:	683e      	ldr	r6, [r7, #0]
 8013824:	f7f3 f96c 	bl	8006b00 <fn_08006B00>
 8013828:	6a33      	ldr	r3, [r6, #32]
 801382a:	4681      	mov	r9, r0
 801382c:	469a      	mov	sl, r3
 801382e:	f7f3 f967 	bl	8006b00 <fn_08006B00>
 8013832:	0004      	movs	r4, r0
 8013834:	f7f3 f964 	bl	8006b00 <fn_08006B00>
 8013838:	465b      	mov	r3, fp
 801383a:	4a20      	ldr	r2, [pc, #128]	@ (80138bc <fn_080137A8+0x114>)
 801383c:	681b      	ldr	r3, [r3, #0]
 801383e:	589b      	ldr	r3, [r3, r2]
 8013840:	1a24      	subs	r4, r4, r0
 8013842:	2103      	movs	r1, #3
 8013844:	4648      	mov	r0, r9
 8013846:	4698      	mov	r8, r3
 8013848:	f011 fea6 	bl	8025598 <fn_08025598>
 801384c:	2280      	movs	r2, #128	@ 0x80
 801384e:	3101      	adds	r1, #1
 8013850:	008b      	lsls	r3, r1, #2
 8013852:	04a4      	lsls	r4, r4, #18
 8013854:	185b      	adds	r3, r3, r1
 8013856:	4454      	add	r4, sl
 8013858:	9300      	str	r3, [sp, #0]
 801385a:	0021      	movs	r1, r4
 801385c:	4643      	mov	r3, r8
 801385e:	0030      	movs	r0, r6
 8013860:	0512      	lsls	r2, r2, #20
 8013862:	3d01      	subs	r5, #1
 8013864:	f7fc f982 	bl	800fb6c <fn_0800FB6C>
 8013868:	2d00      	cmp	r5, #0
 801386a:	d1da      	bne.n	8013822 <fn_080137A8+0x7a>
 801386c:	b003      	add	sp, #12
 801386e:	bcf0      	pop	{r4, r5, r6, r7}
 8013870:	46bb      	mov	fp, r7
 8013872:	46b2      	mov	sl, r6
 8013874:	46a9      	mov	r9, r5
 8013876:	46a0      	mov	r8, r4
 8013878:	bcf0      	pop	{r4, r5, r6, r7}
 801387a:	bc01      	pop	{r0}
 801387c:	4700      	bx	r0
 801387e:	2280      	movs	r2, #128	@ 0x80
 8013880:	04d2      	lsls	r2, r2, #19
 8013882:	18a9      	adds	r1, r5, r2
 8013884:	0020      	movs	r0, r4
 8013886:	f7fc f917 	bl	800fab8 <fn_0800FAB8>
 801388a:	464b      	mov	r3, r9
 801388c:	5198      	str	r0, [r3, r6]
 801388e:	465b      	mov	r3, fp
 8013890:	4642      	mov	r2, r8
 8013892:	681b      	ldr	r3, [r3, #0]
 8013894:	4699      	mov	r9, r3
 8013896:	589b      	ldr	r3, [r3, r2]
 8013898:	2b00      	cmp	r3, #0
 801389a:	d1c1      	bne.n	8013820 <fn_080137A8+0x78>
 801389c:	23fc      	movs	r3, #252	@ 0xfc
 801389e:	2280      	movs	r2, #128	@ 0x80
 80138a0:	061b      	lsls	r3, r3, #24
 80138a2:	18e9      	adds	r1, r5, r3
 80138a4:	0020      	movs	r0, r4
 80138a6:	04d2      	lsls	r2, r2, #19
 80138a8:	f7fc f906 	bl	800fab8 <fn_0800FAB8>
 80138ac:	464b      	mov	r3, r9
 80138ae:	5198      	str	r0, [r3, r6]
 80138b0:	e7b6      	b.n	8013820 <fn_080137A8+0x78>
 80138b2:	46c0      	nop			@ (mov r8, r8)
 80138b4:	030064c4 	.word	0x030064c4
 80138b8:	00000754 	.word	0x00000754
 80138bc:	00000de4 	.word	0x00000de4
 80138c0:	000008f4 	.word	0x000008f4
