fn_08014994:
 8014994:	b5f0      	push	{r4, r5, r6, r7, lr}
 8014996:	46d6      	mov	lr, sl
 8014998:	464f      	mov	r7, r9
 801499a:	4646      	mov	r6, r8
 801499c:	b5c0      	push	{r6, r7, lr}
 801499e:	221e      	movs	r2, #30
 80149a0:	5e83      	ldrsh	r3, [r0, r2]
 80149a2:	4689      	mov	r9, r1
 80149a4:	469a      	mov	sl, r3
 80149a6:	2b00      	cmp	r3, #0
 80149a8:	dd37      	ble.n	8014a1a <fn_08014994+0x86>
 80149aa:	22e0      	movs	r2, #224	@ 0xe0
 80149ac:	4b3e      	ldr	r3, [pc, #248]	@ (8014aa8 <fn_08014994+0x114>)
 80149ae:	681b      	ldr	r3, [r3, #0]
 80149b0:	0112      	lsls	r2, r2, #4
 80149b2:	589a      	ldr	r2, [r3, r2]
 80149b4:	4694      	mov	ip, r2
 80149b6:	6982      	ldr	r2, [r0, #24]
 80149b8:	4690      	mov	r8, r2
 80149ba:	22df      	movs	r2, #223	@ 0xdf
 80149bc:	0112      	lsls	r2, r2, #4
 80149be:	589f      	ldr	r7, [r3, r2]
 80149c0:	4a3a      	ldr	r2, [pc, #232]	@ (8014aac <fn_08014994+0x118>)
 80149c2:	2100      	movs	r1, #0
 80149c4:	589d      	ldr	r5, [r3, r2]
 80149c6:	e007      	b.n	80149d8 <fn_08014994+0x44>
 80149c8:	2e00      	cmp	r6, #0
 80149ca:	d002      	beq.n	80149d2 <fn_08014994+0x3e>
 80149cc:	6872      	ldr	r2, [r6, #4]
 80149ce:	454a      	cmp	r2, r9
 80149d0:	db2c      	blt.n	8014a2c <fn_08014994+0x98>
 80149d2:	3101      	adds	r1, #1
 80149d4:	4551      	cmp	r1, sl
 80149d6:	da20      	bge.n	8014a1a <fn_08014994+0x86>
 80149d8:	4643      	mov	r3, r8
 80149da:	004c      	lsls	r4, r1, #1
 80149dc:	5b1a      	ldrh	r2, [r3, r4]
 80149de:	0152      	lsls	r2, r2, #5
 80149e0:	4462      	add	r2, ip
 80149e2:	8a96      	ldrh	r6, [r2, #20]
 80149e4:	0073      	lsls	r3, r6, #1
 80149e6:	199b      	adds	r3, r3, r6
 80149e8:	009b      	lsls	r3, r3, #2
 80149ea:	18eb      	adds	r3, r5, r3
 80149ec:	895e      	ldrh	r6, [r3, #10]
 80149ee:	00b3      	lsls	r3, r6, #2
 80149f0:	199b      	adds	r3, r3, r6
 80149f2:	00db      	lsls	r3, r3, #3
 80149f4:	18fe      	adds	r6, r7, r3
 80149f6:	42b0      	cmp	r0, r6
 80149f8:	d1e6      	bne.n	80149c8 <fn_08014994+0x34>
 80149fa:	8ad6      	ldrh	r6, [r2, #22]
 80149fc:	4a2c      	ldr	r2, [pc, #176]	@ (8014ab0 <fn_08014994+0x11c>)
 80149fe:	4296      	cmp	r6, r2
 8014a00:	d0e7      	beq.n	80149d2 <fn_08014994+0x3e>
 8014a02:	0072      	lsls	r2, r6, #1
 8014a04:	1992      	adds	r2, r2, r6
 8014a06:	0092      	lsls	r2, r2, #2
 8014a08:	18aa      	adds	r2, r5, r2
 8014a0a:	8956      	ldrh	r6, [r2, #10]
 8014a0c:	00b2      	lsls	r2, r6, #2
 8014a0e:	1992      	adds	r2, r2, r6
 8014a10:	00d2      	lsls	r2, r2, #3
 8014a12:	4293      	cmp	r3, r2
 8014a14:	d0dd      	beq.n	80149d2 <fn_08014994+0x3e>
 8014a16:	18be      	adds	r6, r7, r2
 8014a18:	e7d6      	b.n	80149c8 <fn_08014994+0x34>
 8014a1a:	464a      	mov	r2, r9
 8014a1c:	0010      	movs	r0, r2
 8014a1e:	bce0      	pop	{r5, r6, r7}
 8014a20:	46ba      	mov	sl, r7
 8014a22:	46b1      	mov	r9, r6
 8014a24:	46a8      	mov	r8, r5
 8014a26:	bcf0      	pop	{r4, r5, r6, r7}
 8014a28:	bc02      	pop	{r1}
 8014a2a:	4708      	bx	r1
 8014a2c:	3101      	adds	r1, #1
 8014a2e:	4551      	cmp	r1, sl
 8014a30:	daf4      	bge.n	8014a1c <fn_08014994+0x88>
 8014a32:	4643      	mov	r3, r8
 8014a34:	3302      	adds	r3, #2
 8014a36:	191c      	adds	r4, r3, r4
 8014a38:	4653      	mov	r3, sl
 8014a3a:	005e      	lsls	r6, r3, #1
 8014a3c:	4b1c      	ldr	r3, [pc, #112]	@ (8014ab0 <fn_08014994+0x11c>)
 8014a3e:	4446      	add	r6, r8
 8014a40:	46b2      	mov	sl, r6
 8014a42:	4698      	mov	r8, r3
 8014a44:	e012      	b.n	8014a6c <fn_08014994+0xd8>
 8014a46:	2e00      	cmp	r6, #0
 8014a48:	d00d      	beq.n	8014a66 <fn_08014994+0xd2>
 8014a4a:	6871      	ldr	r1, [r6, #4]
 8014a4c:	2301      	movs	r3, #1
 8014a4e:	4291      	cmp	r1, r2
 8014a50:	dc00      	bgt.n	8014a54 <fn_08014994+0xc0>
 8014a52:	2300      	movs	r3, #0
 8014a54:	061b      	lsls	r3, r3, #24
 8014a56:	d006      	beq.n	8014a66 <fn_08014994+0xd2>
 8014a58:	2301      	movs	r3, #1
 8014a5a:	4549      	cmp	r1, r9
 8014a5c:	db00      	blt.n	8014a60 <fn_08014994+0xcc>
 8014a5e:	2300      	movs	r3, #0
 8014a60:	061b      	lsls	r3, r3, #24
 8014a62:	d000      	beq.n	8014a66 <fn_08014994+0xd2>
 8014a64:	000a      	movs	r2, r1
 8014a66:	3402      	adds	r4, #2
 8014a68:	4554      	cmp	r4, sl
 8014a6a:	d0d7      	beq.n	8014a1c <fn_08014994+0x88>
 8014a6c:	8821      	ldrh	r1, [r4, #0]
 8014a6e:	0149      	lsls	r1, r1, #5
 8014a70:	4461      	add	r1, ip
 8014a72:	8a8e      	ldrh	r6, [r1, #20]
 8014a74:	0073      	lsls	r3, r6, #1
 8014a76:	199b      	adds	r3, r3, r6
 8014a78:	009b      	lsls	r3, r3, #2
 8014a7a:	18eb      	adds	r3, r5, r3
 8014a7c:	895e      	ldrh	r6, [r3, #10]
 8014a7e:	00b3      	lsls	r3, r6, #2
 8014a80:	199b      	adds	r3, r3, r6
 8014a82:	00db      	lsls	r3, r3, #3
 8014a84:	18fe      	adds	r6, r7, r3
 8014a86:	42b0      	cmp	r0, r6
 8014a88:	d1dd      	bne.n	8014a46 <fn_08014994+0xb2>
 8014a8a:	8ace      	ldrh	r6, [r1, #22]
 8014a8c:	4546      	cmp	r6, r8
 8014a8e:	d0ea      	beq.n	8014a66 <fn_08014994+0xd2>
 8014a90:	0071      	lsls	r1, r6, #1
 8014a92:	1989      	adds	r1, r1, r6
 8014a94:	0089      	lsls	r1, r1, #2
 8014a96:	1869      	adds	r1, r5, r1
 8014a98:	894e      	ldrh	r6, [r1, #10]
 8014a9a:	00b1      	lsls	r1, r6, #2
 8014a9c:	1989      	adds	r1, r1, r6
 8014a9e:	00c9      	lsls	r1, r1, #3
 8014aa0:	187e      	adds	r6, r7, r1
 8014aa2:	428b      	cmp	r3, r1
 8014aa4:	d1cf      	bne.n	8014a46 <fn_08014994+0xb2>
 8014aa6:	e7de      	b.n	8014a66 <fn_08014994+0xd2>
 8014aa8:	030064c4 	.word	0x030064c4	@ data_030064C4
 8014aac:	00000e0c 	.word	0x00000e0c
 8014ab0:	0000ffff 	.word	0x0000ffff
