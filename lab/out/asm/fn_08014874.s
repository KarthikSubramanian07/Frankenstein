fn_08014874:
 8014874:	b5f0      	push	{r4, r5, r6, r7, lr}
 8014876:	46d6      	mov	lr, sl
 8014878:	464f      	mov	r7, r9
 801487a:	4646      	mov	r6, r8
 801487c:	b5c0      	push	{r6, r7, lr}
 801487e:	221e      	movs	r2, #30
 8014880:	5e83      	ldrsh	r3, [r0, r2]
 8014882:	4689      	mov	r9, r1
 8014884:	469a      	mov	sl, r3
 8014886:	2b00      	cmp	r3, #0
 8014888:	dd37      	ble.n	80148fa <fn_08014874+0x86>
 801488a:	22e0      	movs	r2, #224	@ 0xe0
 801488c:	4b3e      	ldr	r3, [pc, #248]	@ (8014988 <fn_08014874+0x114>)
 801488e:	681b      	ldr	r3, [r3, #0]
 8014890:	0112      	lsls	r2, r2, #4
 8014892:	589a      	ldr	r2, [r3, r2]
 8014894:	4694      	mov	ip, r2
 8014896:	6982      	ldr	r2, [r0, #24]
 8014898:	4690      	mov	r8, r2
 801489a:	22df      	movs	r2, #223	@ 0xdf
 801489c:	0112      	lsls	r2, r2, #4
 801489e:	589f      	ldr	r7, [r3, r2]
 80148a0:	4a3a      	ldr	r2, [pc, #232]	@ (801498c <fn_08014874+0x118>)
 80148a2:	2100      	movs	r1, #0
 80148a4:	589d      	ldr	r5, [r3, r2]
 80148a6:	e007      	b.n	80148b8 <fn_08014874+0x44>
 80148a8:	2e00      	cmp	r6, #0
 80148aa:	d002      	beq.n	80148b2 <fn_08014874+0x3e>
 80148ac:	6832      	ldr	r2, [r6, #0]
 80148ae:	454a      	cmp	r2, r9
 80148b0:	db2c      	blt.n	801490c <fn_08014874+0x98>
 80148b2:	3101      	adds	r1, #1
 80148b4:	4551      	cmp	r1, sl
 80148b6:	da20      	bge.n	80148fa <fn_08014874+0x86>
 80148b8:	4643      	mov	r3, r8
 80148ba:	004c      	lsls	r4, r1, #1
 80148bc:	5b1a      	ldrh	r2, [r3, r4]
 80148be:	0152      	lsls	r2, r2, #5
 80148c0:	4462      	add	r2, ip
 80148c2:	8a96      	ldrh	r6, [r2, #20]
 80148c4:	0073      	lsls	r3, r6, #1
 80148c6:	199b      	adds	r3, r3, r6
 80148c8:	009b      	lsls	r3, r3, #2
 80148ca:	18eb      	adds	r3, r5, r3
 80148cc:	895e      	ldrh	r6, [r3, #10]
 80148ce:	00b3      	lsls	r3, r6, #2
 80148d0:	199b      	adds	r3, r3, r6
 80148d2:	00db      	lsls	r3, r3, #3
 80148d4:	18fe      	adds	r6, r7, r3
 80148d6:	42b0      	cmp	r0, r6
 80148d8:	d1e6      	bne.n	80148a8 <fn_08014874+0x34>
 80148da:	8ad6      	ldrh	r6, [r2, #22]
 80148dc:	4a2c      	ldr	r2, [pc, #176]	@ (8014990 <fn_08014874+0x11c>)
 80148de:	4296      	cmp	r6, r2
 80148e0:	d0e7      	beq.n	80148b2 <fn_08014874+0x3e>
 80148e2:	0072      	lsls	r2, r6, #1
 80148e4:	1992      	adds	r2, r2, r6
 80148e6:	0092      	lsls	r2, r2, #2
 80148e8:	18aa      	adds	r2, r5, r2
 80148ea:	8956      	ldrh	r6, [r2, #10]
 80148ec:	00b2      	lsls	r2, r6, #2
 80148ee:	1992      	adds	r2, r2, r6
 80148f0:	00d2      	lsls	r2, r2, #3
 80148f2:	4293      	cmp	r3, r2
 80148f4:	d0dd      	beq.n	80148b2 <fn_08014874+0x3e>
 80148f6:	18be      	adds	r6, r7, r2
 80148f8:	e7d6      	b.n	80148a8 <fn_08014874+0x34>
 80148fa:	464a      	mov	r2, r9
 80148fc:	0010      	movs	r0, r2
 80148fe:	bce0      	pop	{r5, r6, r7}
 8014900:	46ba      	mov	sl, r7
 8014902:	46b1      	mov	r9, r6
 8014904:	46a8      	mov	r8, r5
 8014906:	bcf0      	pop	{r4, r5, r6, r7}
 8014908:	bc02      	pop	{r1}
 801490a:	4708      	bx	r1
 801490c:	3101      	adds	r1, #1
 801490e:	4551      	cmp	r1, sl
 8014910:	daf4      	bge.n	80148fc <fn_08014874+0x88>
 8014912:	4643      	mov	r3, r8
 8014914:	3302      	adds	r3, #2
 8014916:	191c      	adds	r4, r3, r4
 8014918:	4653      	mov	r3, sl
 801491a:	005e      	lsls	r6, r3, #1
 801491c:	4b1c      	ldr	r3, [pc, #112]	@ (8014990 <fn_08014874+0x11c>)
 801491e:	4446      	add	r6, r8
 8014920:	46b2      	mov	sl, r6
 8014922:	4698      	mov	r8, r3
 8014924:	e012      	b.n	801494c <fn_08014874+0xd8>
 8014926:	2e00      	cmp	r6, #0
 8014928:	d00d      	beq.n	8014946 <fn_08014874+0xd2>
 801492a:	6831      	ldr	r1, [r6, #0]
 801492c:	2301      	movs	r3, #1
 801492e:	4291      	cmp	r1, r2
 8014930:	dc00      	bgt.n	8014934 <fn_08014874+0xc0>
 8014932:	2300      	movs	r3, #0
 8014934:	061b      	lsls	r3, r3, #24
 8014936:	d006      	beq.n	8014946 <fn_08014874+0xd2>
 8014938:	2301      	movs	r3, #1
 801493a:	4549      	cmp	r1, r9
 801493c:	db00      	blt.n	8014940 <fn_08014874+0xcc>
 801493e:	2300      	movs	r3, #0
 8014940:	061b      	lsls	r3, r3, #24
 8014942:	d000      	beq.n	8014946 <fn_08014874+0xd2>
 8014944:	000a      	movs	r2, r1
 8014946:	3402      	adds	r4, #2
 8014948:	4554      	cmp	r4, sl
 801494a:	d0d7      	beq.n	80148fc <fn_08014874+0x88>
 801494c:	8821      	ldrh	r1, [r4, #0]
 801494e:	0149      	lsls	r1, r1, #5
 8014950:	4461      	add	r1, ip
 8014952:	8a8e      	ldrh	r6, [r1, #20]
 8014954:	0073      	lsls	r3, r6, #1
 8014956:	199b      	adds	r3, r3, r6
 8014958:	009b      	lsls	r3, r3, #2
 801495a:	18eb      	adds	r3, r5, r3
 801495c:	895e      	ldrh	r6, [r3, #10]
 801495e:	00b3      	lsls	r3, r6, #2
 8014960:	199b      	adds	r3, r3, r6
 8014962:	00db      	lsls	r3, r3, #3
 8014964:	18fe      	adds	r6, r7, r3
 8014966:	42b0      	cmp	r0, r6
 8014968:	d1dd      	bne.n	8014926 <fn_08014874+0xb2>
 801496a:	8ace      	ldrh	r6, [r1, #22]
 801496c:	4546      	cmp	r6, r8
 801496e:	d0ea      	beq.n	8014946 <fn_08014874+0xd2>
 8014970:	0071      	lsls	r1, r6, #1
 8014972:	1989      	adds	r1, r1, r6
 8014974:	0089      	lsls	r1, r1, #2
 8014976:	1869      	adds	r1, r5, r1
 8014978:	894e      	ldrh	r6, [r1, #10]
 801497a:	00b1      	lsls	r1, r6, #2
 801497c:	1989      	adds	r1, r1, r6
 801497e:	00c9      	lsls	r1, r1, #3
 8014980:	187e      	adds	r6, r7, r1
 8014982:	428b      	cmp	r3, r1
 8014984:	d1cf      	bne.n	8014926 <fn_08014874+0xb2>
 8014986:	e7de      	b.n	8014946 <fn_08014874+0xd2>
 8014988:	030064c4 	.word	0x030064c4
 801498c:	00000e0c 	.word	0x00000e0c
 8014990:	0000ffff 	.word	0x0000ffff
