fn_080199EC:
 80199ec:	b5f0      	push	{r4, r5, r6, r7, lr}
 80199ee:	46de      	mov	lr, fp
 80199f0:	4657      	mov	r7, sl
 80199f2:	4645      	mov	r5, r8
 80199f4:	464e      	mov	r6, r9
 80199f6:	b5e0      	push	{r5, r6, r7, lr}
 80199f8:	b083      	sub	sp, #12
 80199fa:	0005      	movs	r5, r0
 80199fc:	f00b fde8 	bl	80255d0 <fn_080255D0>
 8019a00:	4b2a      	ldr	r3, [pc, #168]	@ (8019aac <fn_080199EC+0xc0>)
 8019a02:	681c      	ldr	r4, [r3, #0]
 8019a04:	469a      	mov	sl, r3
 8019a06:	23ab      	movs	r3, #171	@ 0xab
 8019a08:	00db      	lsls	r3, r3, #3
 8019a0a:	5ce3      	ldrb	r3, [r4, r3]
 8019a0c:	4683      	mov	fp, r0
 8019a0e:	2b00      	cmp	r3, #0
 8019a10:	d042      	beq.n	8019a98 <fn_080199EC+0xac>
 8019a12:	2300      	movs	r3, #0
 8019a14:	4698      	mov	r8, r3
 8019a16:	239c      	movs	r3, #156	@ 0x9c
 8019a18:	00db      	lsls	r3, r3, #3
 8019a1a:	4699      	mov	r9, r3
 8019a1c:	4643      	mov	r3, r8
 8019a1e:	9501      	str	r5, [sp, #4]
 8019a20:	46a0      	mov	r8, r4
 8019a22:	001c      	movs	r4, r3
 8019a24:	e002      	b.n	8019a2c <fn_080199EC+0x40>
 8019a26:	4653      	mov	r3, sl
 8019a28:	681b      	ldr	r3, [r3, #0]
 8019a2a:	4698      	mov	r8, r3
 8019a2c:	4643      	mov	r3, r8
 8019a2e:	0126      	lsls	r6, r4, #4
 8019a30:	199f      	adds	r7, r3, r6
 8019a32:	239b      	movs	r3, #155	@ 0x9b
 8019a34:	00db      	lsls	r3, r3, #3
 8019a36:	58f9      	ldr	r1, [r7, r3]
 8019a38:	2900      	cmp	r1, #0
 8019a3a:	d01c      	beq.n	8019a76 <fn_080199EC+0x8a>
 8019a3c:	4b1c      	ldr	r3, [pc, #112]	@ (8019ab0 <fn_080199EC+0xc4>)
 8019a3e:	58fa      	ldr	r2, [r7, r3]
 8019a40:	464b      	mov	r3, r9
 8019a42:	58fd      	ldr	r5, [r7, r3]
 8019a44:	1aad      	subs	r5, r5, r2
 8019a46:	2de0      	cmp	r5, #224	@ 0xe0
 8019a48:	dd00      	ble.n	8019a4c <fn_080199EC+0x60>
 8019a4a:	25e0      	movs	r5, #224	@ 0xe0
 8019a4c:	4b19      	ldr	r3, [pc, #100]	@ (8019ab4 <fn_080199EC+0xc8>)
 8019a4e:	1889      	adds	r1, r1, r2
 8019a50:	58fb      	ldr	r3, [r7, r3]
 8019a52:	002a      	movs	r2, r5
 8019a54:	4658      	mov	r0, fp
 8019a56:	f00b fdc7 	bl	80255e8 <fn_080255E8>
 8019a5a:	4b15      	ldr	r3, [pc, #84]	@ (8019ab0 <fn_080199EC+0xc4>)
 8019a5c:	4446      	add	r6, r8
 8019a5e:	58f2      	ldr	r2, [r6, r3]
 8019a60:	18ad      	adds	r5, r5, r2
 8019a62:	50f5      	str	r5, [r6, r3]
 8019a64:	464b      	mov	r3, r9
 8019a66:	58fb      	ldr	r3, [r7, r3]
 8019a68:	429d      	cmp	r5, r3
 8019a6a:	db04      	blt.n	8019a76 <fn_080199EC+0x8a>
 8019a6c:	239b      	movs	r3, #155	@ 0x9b
 8019a6e:	00db      	lsls	r3, r3, #3
 8019a70:	18f6      	adds	r6, r6, r3
 8019a72:	2300      	movs	r3, #0
 8019a74:	6033      	str	r3, [r6, #0]
 8019a76:	3401      	adds	r4, #1
 8019a78:	2c08      	cmp	r4, #8
 8019a7a:	d1d4      	bne.n	8019a26 <fn_080199EC+0x3a>
 8019a7c:	22e0      	movs	r2, #224	@ 0xe0
 8019a7e:	4659      	mov	r1, fp
 8019a80:	9801      	ldr	r0, [sp, #4]
 8019a82:	f00b fd7f 	bl	8025584 <fn_08025584>
 8019a86:	b003      	add	sp, #12
 8019a88:	bcf0      	pop	{r4, r5, r6, r7}
 8019a8a:	46bb      	mov	fp, r7
 8019a8c:	46b2      	mov	sl, r6
 8019a8e:	46a9      	mov	r9, r5
 8019a90:	46a0      	mov	r8, r4
 8019a92:	bcf0      	pop	{r4, r5, r6, r7}
 8019a94:	bc01      	pop	{r0}
 8019a96:	4700      	bx	r0
 8019a98:	4b07      	ldr	r3, [pc, #28]	@ (8019ab8 <fn_080199EC+0xcc>)
 8019a9a:	22e0      	movs	r2, #224	@ 0xe0
 8019a9c:	58e0      	ldr	r0, [r4, r3]
 8019a9e:	4659      	mov	r1, fp
 8019aa0:	f004 fc34 	bl	801e30c <fn_0801E30C>
 8019aa4:	4653      	mov	r3, sl
 8019aa6:	681c      	ldr	r4, [r3, #0]
 8019aa8:	e7b3      	b.n	8019a12 <fn_080199EC+0x26>
 8019aaa:	46c0      	nop			@ (mov r8, r8)
 8019aac:	030064c4 	.word	0x030064c4
 8019ab0:	000004dc 	.word	0x000004dc
 8019ab4:	000004e4 	.word	0x000004e4
 8019ab8:	000004d4 	.word	0x000004d4
