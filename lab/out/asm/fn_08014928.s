fn_08014928:
 8014928:	b5f0      	push	{r4, r5, r6, r7, lr}
 801492a:	46d6      	mov	lr, sl
 801492c:	464f      	mov	r7, r9
 801492e:	4646      	mov	r6, r8
 8014930:	b5c0      	push	{r6, r7, lr}
 8014932:	221e      	movs	r2, #30
 8014934:	5e83      	ldrsh	r3, [r0, r2]
 8014936:	4689      	mov	r9, r1
 8014938:	469a      	mov	sl, r3
 801493a:	2b00      	cmp	r3, #0
 801493c:	dd37      	ble.n	80149ae <fn_08014928+0x86>
 801493e:	22e0      	movs	r2, #224	@ 0xe0
 8014940:	4b3e      	ldr	r3, [pc, #248]	@ (8014a3c <fn_08014928+0x114>)
 8014942:	681b      	ldr	r3, [r3, #0]
 8014944:	0112      	lsls	r2, r2, #4
 8014946:	589a      	ldr	r2, [r3, r2]
 8014948:	4694      	mov	ip, r2
 801494a:	6982      	ldr	r2, [r0, #24]
 801494c:	4690      	mov	r8, r2
 801494e:	22df      	movs	r2, #223	@ 0xdf
 8014950:	0112      	lsls	r2, r2, #4
 8014952:	589f      	ldr	r7, [r3, r2]
 8014954:	4a3a      	ldr	r2, [pc, #232]	@ (8014a40 <fn_08014928+0x118>)
 8014956:	2100      	movs	r1, #0
 8014958:	589d      	ldr	r5, [r3, r2]
 801495a:	e007      	b.n	801496c <fn_08014928+0x44>
 801495c:	2e00      	cmp	r6, #0
 801495e:	d002      	beq.n	8014966 <fn_08014928+0x3e>
 8014960:	6832      	ldr	r2, [r6, #0]
 8014962:	454a      	cmp	r2, r9
 8014964:	db2c      	blt.n	80149c0 <fn_08014928+0x98>
 8014966:	3101      	adds	r1, #1
 8014968:	4551      	cmp	r1, sl
 801496a:	da20      	bge.n	80149ae <fn_08014928+0x86>
 801496c:	4643      	mov	r3, r8
 801496e:	004c      	lsls	r4, r1, #1
 8014970:	5b1a      	ldrh	r2, [r3, r4]
 8014972:	0152      	lsls	r2, r2, #5
 8014974:	4462      	add	r2, ip
 8014976:	8a96      	ldrh	r6, [r2, #20]
 8014978:	0073      	lsls	r3, r6, #1
 801497a:	199b      	adds	r3, r3, r6
 801497c:	009b      	lsls	r3, r3, #2
 801497e:	18eb      	adds	r3, r5, r3
 8014980:	895e      	ldrh	r6, [r3, #10]
 8014982:	00b3      	lsls	r3, r6, #2
 8014984:	199b      	adds	r3, r3, r6
 8014986:	00db      	lsls	r3, r3, #3
 8014988:	18fe      	adds	r6, r7, r3
 801498a:	42b0      	cmp	r0, r6
 801498c:	d1e6      	bne.n	801495c <fn_08014928+0x34>
 801498e:	8ad6      	ldrh	r6, [r2, #22]
 8014990:	4a2c      	ldr	r2, [pc, #176]	@ (8014a44 <fn_08014928+0x11c>)
 8014992:	4296      	cmp	r6, r2
 8014994:	d0e7      	beq.n	8014966 <fn_08014928+0x3e>
 8014996:	0072      	lsls	r2, r6, #1
 8014998:	1992      	adds	r2, r2, r6
 801499a:	0092      	lsls	r2, r2, #2
 801499c:	18aa      	adds	r2, r5, r2
 801499e:	8956      	ldrh	r6, [r2, #10]
 80149a0:	00b2      	lsls	r2, r6, #2
 80149a2:	1992      	adds	r2, r2, r6
 80149a4:	00d2      	lsls	r2, r2, #3
 80149a6:	4293      	cmp	r3, r2
 80149a8:	d0dd      	beq.n	8014966 <fn_08014928+0x3e>
 80149aa:	18be      	adds	r6, r7, r2
 80149ac:	e7d6      	b.n	801495c <fn_08014928+0x34>
 80149ae:	464a      	mov	r2, r9
 80149b0:	0010      	movs	r0, r2
 80149b2:	bce0      	pop	{r5, r6, r7}
 80149b4:	46ba      	mov	sl, r7
 80149b6:	46b1      	mov	r9, r6
 80149b8:	46a8      	mov	r8, r5
 80149ba:	bcf0      	pop	{r4, r5, r6, r7}
 80149bc:	bc02      	pop	{r1}
 80149be:	4708      	bx	r1
 80149c0:	3101      	adds	r1, #1
 80149c2:	4551      	cmp	r1, sl
 80149c4:	daf4      	bge.n	80149b0 <fn_08014928+0x88>
 80149c6:	4643      	mov	r3, r8
 80149c8:	3302      	adds	r3, #2
 80149ca:	191c      	adds	r4, r3, r4
 80149cc:	4653      	mov	r3, sl
 80149ce:	005e      	lsls	r6, r3, #1
 80149d0:	4b1c      	ldr	r3, [pc, #112]	@ (8014a44 <fn_08014928+0x11c>)
 80149d2:	4446      	add	r6, r8
 80149d4:	46b2      	mov	sl, r6
 80149d6:	4698      	mov	r8, r3
 80149d8:	e012      	b.n	8014a00 <fn_08014928+0xd8>
 80149da:	2e00      	cmp	r6, #0
 80149dc:	d00d      	beq.n	80149fa <fn_08014928+0xd2>
 80149de:	6831      	ldr	r1, [r6, #0]
 80149e0:	2301      	movs	r3, #1
 80149e2:	4291      	cmp	r1, r2
 80149e4:	dc00      	bgt.n	80149e8 <fn_08014928+0xc0>
 80149e6:	2300      	movs	r3, #0
 80149e8:	061b      	lsls	r3, r3, #24
 80149ea:	d006      	beq.n	80149fa <fn_08014928+0xd2>
 80149ec:	2301      	movs	r3, #1
 80149ee:	4549      	cmp	r1, r9
 80149f0:	db00      	blt.n	80149f4 <fn_08014928+0xcc>
 80149f2:	2300      	movs	r3, #0
 80149f4:	061b      	lsls	r3, r3, #24
 80149f6:	d000      	beq.n	80149fa <fn_08014928+0xd2>
 80149f8:	000a      	movs	r2, r1
 80149fa:	3402      	adds	r4, #2
 80149fc:	4554      	cmp	r4, sl
 80149fe:	d0d7      	beq.n	80149b0 <fn_08014928+0x88>
 8014a00:	8821      	ldrh	r1, [r4, #0]
 8014a02:	0149      	lsls	r1, r1, #5
 8014a04:	4461      	add	r1, ip
 8014a06:	8a8e      	ldrh	r6, [r1, #20]
 8014a08:	0073      	lsls	r3, r6, #1
 8014a0a:	199b      	adds	r3, r3, r6
 8014a0c:	009b      	lsls	r3, r3, #2
 8014a0e:	18eb      	adds	r3, r5, r3
 8014a10:	895e      	ldrh	r6, [r3, #10]
 8014a12:	00b3      	lsls	r3, r6, #2
 8014a14:	199b      	adds	r3, r3, r6
 8014a16:	00db      	lsls	r3, r3, #3
 8014a18:	18fe      	adds	r6, r7, r3
 8014a1a:	42b0      	cmp	r0, r6
 8014a1c:	d1dd      	bne.n	80149da <fn_08014928+0xb2>
 8014a1e:	8ace      	ldrh	r6, [r1, #22]
 8014a20:	4546      	cmp	r6, r8
 8014a22:	d0ea      	beq.n	80149fa <fn_08014928+0xd2>
 8014a24:	0071      	lsls	r1, r6, #1
 8014a26:	1989      	adds	r1, r1, r6
 8014a28:	0089      	lsls	r1, r1, #2
 8014a2a:	1869      	adds	r1, r5, r1
 8014a2c:	894e      	ldrh	r6, [r1, #10]
 8014a2e:	00b1      	lsls	r1, r6, #2
 8014a30:	1989      	adds	r1, r1, r6
 8014a32:	00c9      	lsls	r1, r1, #3
 8014a34:	187e      	adds	r6, r7, r1
 8014a36:	428b      	cmp	r3, r1
 8014a38:	d1cf      	bne.n	80149da <fn_08014928+0xb2>
 8014a3a:	e7de      	b.n	80149fa <fn_08014928+0xd2>
 8014a3c:	030064c4 	.word	0x030064c4
 8014a40:	00000e0c 	.word	0x00000e0c
 8014a44:	0000ffff 	.word	0x0000ffff
