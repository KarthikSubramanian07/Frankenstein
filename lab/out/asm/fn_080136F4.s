fn_080136F4:
 80136f4:	b5f0      	push	{r4, r5, r6, r7, lr}
 80136f6:	46de      	mov	lr, fp
 80136f8:	464e      	mov	r6, r9
 80136fa:	4645      	mov	r5, r8
 80136fc:	4657      	mov	r7, sl
 80136fe:	b5e0      	push	{r5, r6, r7, lr}
 8013700:	0007      	movs	r7, r0
 8013702:	b083      	sub	sp, #12
 8013704:	2102      	movs	r1, #2
 8013706:	6800      	ldr	r0, [r0, #0]
 8013708:	f006 fdde 	bl	801a2c8 <fn_0801A2C8>
 801370c:	219b      	movs	r1, #155	@ 0x9b
 801370e:	6838      	ldr	r0, [r7, #0]
 8013710:	f7fd fd7c 	bl	801120c <fn_0801120C>
 8013714:	4b3a      	ldr	r3, [pc, #232]	@ (8013800 <fn_080136F4+0x10c>)
 8013716:	469b      	mov	fp, r3
 8013718:	6819      	ldr	r1, [r3, #0]
 801371a:	2353      	movs	r3, #83	@ 0x53
 801371c:	5cfa      	ldrb	r2, [r7, r3]
 801371e:	4b39      	ldr	r3, [pc, #228]	@ (8013804 <fn_080136F4+0x110>)
 8013720:	58c9      	ldr	r1, [r1, r3]
 8013722:	0053      	lsls	r3, r2, #1
 8013724:	189b      	adds	r3, r3, r2
 8013726:	00db      	lsls	r3, r3, #3
 8013728:	585b      	ldr	r3, [r3, r1]
 801372a:	009b      	lsls	r3, r3, #2
 801372c:	18fb      	adds	r3, r7, r3
 801372e:	6fda      	ldr	r2, [r3, #124]	@ 0x7c
 8013730:	3a01      	subs	r2, #1
 8013732:	67da      	str	r2, [r3, #124]	@ 0x7c
 8013734:	2100      	movs	r1, #0
 8013736:	0038      	movs	r0, r7
 8013738:	f7ff f8cc 	bl	80128d4 <fn_080128D4>
 801373c:	465b      	mov	r3, fp
 801373e:	681b      	ldr	r3, [r3, #0]
 8013740:	2280      	movs	r2, #128	@ 0x80
 8013742:	4698      	mov	r8, r3
 8013744:	683c      	ldr	r4, [r7, #0]
 8013746:	6a25      	ldr	r5, [r4, #32]
 8013748:	04d2      	lsls	r2, r2, #19
 801374a:	0029      	movs	r1, r5
 801374c:	0020      	movs	r0, r4
 801374e:	f7fc f9b3 	bl	800fab8 <fn_0800FAB8>
 8013752:	4643      	mov	r3, r8
 8013754:	4e2c      	ldr	r6, [pc, #176]	@ (8013808 <fn_080136F4+0x114>)
 8013756:	5198      	str	r0, [r3, r6]
 8013758:	465b      	mov	r3, fp
 801375a:	681b      	ldr	r3, [r3, #0]
 801375c:	4699      	mov	r9, r3
 801375e:	4b2b      	ldr	r3, [pc, #172]	@ (801380c <fn_080136F4+0x118>)
 8013760:	4698      	mov	r8, r3
 8013762:	464b      	mov	r3, r9
 8013764:	4642      	mov	r2, r8
 8013766:	589b      	ldr	r3, [r3, r2]
 8013768:	2b00      	cmp	r3, #0
 801376a:	d02e      	beq.n	80137ca <fn_080136F4+0xd6>
 801376c:	2507      	movs	r5, #7
 801376e:	683e      	ldr	r6, [r7, #0]
 8013770:	f7f3 f9c6 	bl	8006b00 <fn_08006B00>
 8013774:	6a33      	ldr	r3, [r6, #32]
 8013776:	4681      	mov	r9, r0
 8013778:	469a      	mov	sl, r3
 801377a:	f7f3 f9c1 	bl	8006b00 <fn_08006B00>
 801377e:	0004      	movs	r4, r0
 8013780:	f7f3 f9be 	bl	8006b00 <fn_08006B00>
 8013784:	465b      	mov	r3, fp
 8013786:	4a20      	ldr	r2, [pc, #128]	@ (8013808 <fn_080136F4+0x114>)
 8013788:	681b      	ldr	r3, [r3, #0]
 801378a:	589b      	ldr	r3, [r3, r2]
 801378c:	1a24      	subs	r4, r4, r0
 801378e:	2103      	movs	r1, #3
 8013790:	4648      	mov	r0, r9
 8013792:	4698      	mov	r8, r3
 8013794:	f011 fea8 	bl	80254e8 <fn_080254E8>
 8013798:	2280      	movs	r2, #128	@ 0x80
 801379a:	3101      	adds	r1, #1
 801379c:	008b      	lsls	r3, r1, #2
 801379e:	04a4      	lsls	r4, r4, #18
 80137a0:	185b      	adds	r3, r3, r1
 80137a2:	4454      	add	r4, sl
 80137a4:	9300      	str	r3, [sp, #0]
 80137a6:	0021      	movs	r1, r4
 80137a8:	4643      	mov	r3, r8
 80137aa:	0030      	movs	r0, r6
 80137ac:	0512      	lsls	r2, r2, #20
 80137ae:	3d01      	subs	r5, #1
 80137b0:	f7fc f9dc 	bl	800fb6c <fn_0800FB6C>
 80137b4:	2d00      	cmp	r5, #0
 80137b6:	d1da      	bne.n	801376e <fn_080136F4+0x7a>
 80137b8:	b003      	add	sp, #12
 80137ba:	bcf0      	pop	{r4, r5, r6, r7}
 80137bc:	46bb      	mov	fp, r7
 80137be:	46b2      	mov	sl, r6
 80137c0:	46a9      	mov	r9, r5
 80137c2:	46a0      	mov	r8, r4
 80137c4:	bcf0      	pop	{r4, r5, r6, r7}
 80137c6:	bc01      	pop	{r0}
 80137c8:	4700      	bx	r0
 80137ca:	2280      	movs	r2, #128	@ 0x80
 80137cc:	04d2      	lsls	r2, r2, #19
 80137ce:	18a9      	adds	r1, r5, r2
 80137d0:	0020      	movs	r0, r4
 80137d2:	f7fc f971 	bl	800fab8 <fn_0800FAB8>
 80137d6:	464b      	mov	r3, r9
 80137d8:	5198      	str	r0, [r3, r6]
 80137da:	465b      	mov	r3, fp
 80137dc:	4642      	mov	r2, r8
 80137de:	681b      	ldr	r3, [r3, #0]
 80137e0:	4699      	mov	r9, r3
 80137e2:	589b      	ldr	r3, [r3, r2]
 80137e4:	2b00      	cmp	r3, #0
 80137e6:	d1c1      	bne.n	801376c <fn_080136F4+0x78>
 80137e8:	23fc      	movs	r3, #252	@ 0xfc
 80137ea:	2280      	movs	r2, #128	@ 0x80
 80137ec:	061b      	lsls	r3, r3, #24
 80137ee:	18e9      	adds	r1, r5, r3
 80137f0:	0020      	movs	r0, r4
 80137f2:	04d2      	lsls	r2, r2, #19
 80137f4:	f7fc f960 	bl	800fab8 <fn_0800FAB8>
 80137f8:	464b      	mov	r3, r9
 80137fa:	5198      	str	r0, [r3, r6]
 80137fc:	e7b6      	b.n	801376c <fn_080136F4+0x78>
 80137fe:	46c0      	nop			@ (mov r8, r8)
 8013800:	030064c4 	.word	0x030064c4	@ data_030064C4
 8013804:	00000754 	.word	0x00000754
 8013808:	00000de4 	.word	0x00000de4
 801380c:	000008f4 	.word	0x000008f4
