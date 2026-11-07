fn_08014808:
 8014808:	b5f0      	push	{r4, r5, r6, r7, lr}
 801480a:	46d6      	mov	lr, sl
 801480c:	464f      	mov	r7, r9
 801480e:	4646      	mov	r6, r8
 8014810:	b5c0      	push	{r6, r7, lr}
 8014812:	221e      	movs	r2, #30
 8014814:	5e83      	ldrsh	r3, [r0, r2]
 8014816:	4689      	mov	r9, r1
 8014818:	469a      	mov	sl, r3
 801481a:	2b00      	cmp	r3, #0
 801481c:	dd37      	ble.n	801488e <fn_08014808+0x86>
 801481e:	22e0      	movs	r2, #224	@ 0xe0
 8014820:	4b3e      	ldr	r3, [pc, #248]	@ (801491c <fn_08014808+0x114>)
 8014822:	681b      	ldr	r3, [r3, #0]
 8014824:	0112      	lsls	r2, r2, #4
 8014826:	589a      	ldr	r2, [r3, r2]
 8014828:	4694      	mov	ip, r2
 801482a:	6982      	ldr	r2, [r0, #24]
 801482c:	4690      	mov	r8, r2
 801482e:	22df      	movs	r2, #223	@ 0xdf
 8014830:	0112      	lsls	r2, r2, #4
 8014832:	589f      	ldr	r7, [r3, r2]
 8014834:	4a3a      	ldr	r2, [pc, #232]	@ (8014920 <fn_08014808+0x118>)
 8014836:	2100      	movs	r1, #0
 8014838:	589d      	ldr	r5, [r3, r2]
 801483a:	e007      	b.n	801484c <fn_08014808+0x44>
 801483c:	2e00      	cmp	r6, #0
 801483e:	d002      	beq.n	8014846 <fn_08014808+0x3e>
 8014840:	6832      	ldr	r2, [r6, #0]
 8014842:	454a      	cmp	r2, r9
 8014844:	dc2c      	bgt.n	80148a0 <fn_08014808+0x98>
 8014846:	3101      	adds	r1, #1
 8014848:	4551      	cmp	r1, sl
 801484a:	da20      	bge.n	801488e <fn_08014808+0x86>
 801484c:	4643      	mov	r3, r8
 801484e:	004c      	lsls	r4, r1, #1
 8014850:	5b1a      	ldrh	r2, [r3, r4]
 8014852:	0152      	lsls	r2, r2, #5
 8014854:	4462      	add	r2, ip
 8014856:	8a96      	ldrh	r6, [r2, #20]
 8014858:	0073      	lsls	r3, r6, #1
 801485a:	199b      	adds	r3, r3, r6
 801485c:	009b      	lsls	r3, r3, #2
 801485e:	18eb      	adds	r3, r5, r3
 8014860:	895e      	ldrh	r6, [r3, #10]
 8014862:	00b3      	lsls	r3, r6, #2
 8014864:	199b      	adds	r3, r3, r6
 8014866:	00db      	lsls	r3, r3, #3
 8014868:	18fe      	adds	r6, r7, r3
 801486a:	42b0      	cmp	r0, r6
 801486c:	d1e6      	bne.n	801483c <fn_08014808+0x34>
 801486e:	8ad6      	ldrh	r6, [r2, #22]
 8014870:	4a2c      	ldr	r2, [pc, #176]	@ (8014924 <fn_08014808+0x11c>)
 8014872:	4296      	cmp	r6, r2
 8014874:	d0e7      	beq.n	8014846 <fn_08014808+0x3e>
 8014876:	0072      	lsls	r2, r6, #1
 8014878:	1992      	adds	r2, r2, r6
 801487a:	0092      	lsls	r2, r2, #2
 801487c:	18aa      	adds	r2, r5, r2
 801487e:	8956      	ldrh	r6, [r2, #10]
 8014880:	00b2      	lsls	r2, r6, #2
 8014882:	1992      	adds	r2, r2, r6
 8014884:	00d2      	lsls	r2, r2, #3
 8014886:	4293      	cmp	r3, r2
 8014888:	d0dd      	beq.n	8014846 <fn_08014808+0x3e>
 801488a:	18be      	adds	r6, r7, r2
 801488c:	e7d6      	b.n	801483c <fn_08014808+0x34>
 801488e:	464a      	mov	r2, r9
 8014890:	0010      	movs	r0, r2
 8014892:	bce0      	pop	{r5, r6, r7}
 8014894:	46ba      	mov	sl, r7
 8014896:	46b1      	mov	r9, r6
 8014898:	46a8      	mov	r8, r5
 801489a:	bcf0      	pop	{r4, r5, r6, r7}
 801489c:	bc02      	pop	{r1}
 801489e:	4708      	bx	r1
 80148a0:	3101      	adds	r1, #1
 80148a2:	4551      	cmp	r1, sl
 80148a4:	daf4      	bge.n	8014890 <fn_08014808+0x88>
 80148a6:	4643      	mov	r3, r8
 80148a8:	3302      	adds	r3, #2
 80148aa:	191c      	adds	r4, r3, r4
 80148ac:	4653      	mov	r3, sl
 80148ae:	005e      	lsls	r6, r3, #1
 80148b0:	4b1c      	ldr	r3, [pc, #112]	@ (8014924 <fn_08014808+0x11c>)
 80148b2:	4446      	add	r6, r8
 80148b4:	46b2      	mov	sl, r6
 80148b6:	4698      	mov	r8, r3
 80148b8:	e012      	b.n	80148e0 <fn_08014808+0xd8>
 80148ba:	2e00      	cmp	r6, #0
 80148bc:	d00d      	beq.n	80148da <fn_08014808+0xd2>
 80148be:	6831      	ldr	r1, [r6, #0]
 80148c0:	2301      	movs	r3, #1
 80148c2:	4291      	cmp	r1, r2
 80148c4:	db00      	blt.n	80148c8 <fn_08014808+0xc0>
 80148c6:	2300      	movs	r3, #0
 80148c8:	061b      	lsls	r3, r3, #24
 80148ca:	d006      	beq.n	80148da <fn_08014808+0xd2>
 80148cc:	2301      	movs	r3, #1
 80148ce:	4549      	cmp	r1, r9
 80148d0:	dc00      	bgt.n	80148d4 <fn_08014808+0xcc>
 80148d2:	2300      	movs	r3, #0
 80148d4:	061b      	lsls	r3, r3, #24
 80148d6:	d000      	beq.n	80148da <fn_08014808+0xd2>
 80148d8:	000a      	movs	r2, r1
 80148da:	3402      	adds	r4, #2
 80148dc:	4554      	cmp	r4, sl
 80148de:	d0d7      	beq.n	8014890 <fn_08014808+0x88>
 80148e0:	8821      	ldrh	r1, [r4, #0]
 80148e2:	0149      	lsls	r1, r1, #5
 80148e4:	4461      	add	r1, ip
 80148e6:	8a8e      	ldrh	r6, [r1, #20]
 80148e8:	0073      	lsls	r3, r6, #1
 80148ea:	199b      	adds	r3, r3, r6
 80148ec:	009b      	lsls	r3, r3, #2
 80148ee:	18eb      	adds	r3, r5, r3
 80148f0:	895e      	ldrh	r6, [r3, #10]
 80148f2:	00b3      	lsls	r3, r6, #2
 80148f4:	199b      	adds	r3, r3, r6
 80148f6:	00db      	lsls	r3, r3, #3
 80148f8:	18fe      	adds	r6, r7, r3
 80148fa:	42b0      	cmp	r0, r6
 80148fc:	d1dd      	bne.n	80148ba <fn_08014808+0xb2>
 80148fe:	8ace      	ldrh	r6, [r1, #22]
 8014900:	4546      	cmp	r6, r8
 8014902:	d0ea      	beq.n	80148da <fn_08014808+0xd2>
 8014904:	0071      	lsls	r1, r6, #1
 8014906:	1989      	adds	r1, r1, r6
 8014908:	0089      	lsls	r1, r1, #2
 801490a:	1869      	adds	r1, r5, r1
 801490c:	894e      	ldrh	r6, [r1, #10]
 801490e:	00b1      	lsls	r1, r6, #2
 8014910:	1989      	adds	r1, r1, r6
 8014912:	00c9      	lsls	r1, r1, #3
 8014914:	187e      	adds	r6, r7, r1
 8014916:	428b      	cmp	r3, r1
 8014918:	d1cf      	bne.n	80148ba <fn_08014808+0xb2>
 801491a:	e7de      	b.n	80148da <fn_08014808+0xd2>
 801491c:	030064c4 	.word	0x030064c4
 8014920:	00000e0c 	.word	0x00000e0c
 8014924:	0000ffff 	.word	0x0000ffff
