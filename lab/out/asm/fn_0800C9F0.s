fn_0800C9F0:
 800c9f0:	b5f0      	push	{r4, r5, r6, r7, lr}
 800c9f2:	464e      	mov	r6, r9
 800c9f4:	4645      	mov	r5, r8
 800c9f6:	46de      	mov	lr, fp
 800c9f8:	4657      	mov	r7, sl
 800c9fa:	b5e0      	push	{r5, r6, r7, lr}
 800c9fc:	4e79      	ldr	r6, [pc, #484]	@ (800cbe4 <fn_0800C9F0+0x1f4>)
 800c9fe:	4b7a      	ldr	r3, [pc, #488]	@ (800cbe8 <fn_0800C9F0+0x1f8>)
 800ca00:	6831      	ldr	r1, [r6, #0]
 800ca02:	8bc2      	ldrh	r2, [r0, #30]
 800ca04:	58cb      	ldr	r3, [r1, r3]
 800ca06:	0092      	lsls	r2, r2, #2
 800ca08:	189b      	adds	r3, r3, r2
 800ca0a:	78db      	ldrb	r3, [r3, #3]
 800ca0c:	0005      	movs	r5, r0
 800ca0e:	b083      	sub	sp, #12
 800ca10:	065a      	lsls	r2, r3, #25
 800ca12:	d438      	bmi.n	800ca86 <fn_0800C9F0+0x96>
 800ca14:	201a      	movs	r0, #26
 800ca16:	5e2a      	ldrsh	r2, [r5, r0]
 800ca18:	09db      	lsrs	r3, r3, #7
 800ca1a:	021b      	lsls	r3, r3, #8
 800ca1c:	4053      	eors	r3, r2
 800ca1e:	069a      	lsls	r2, r3, #26
 800ca20:	0fd2      	lsrs	r2, r2, #31
 800ca22:	4693      	mov	fp, r2
 800ca24:	06da      	lsls	r2, r3, #27
 800ca26:	0f92      	lsrs	r2, r2, #30
 800ca28:	4692      	mov	sl, r2
 800ca2a:	2207      	movs	r2, #7
 800ca2c:	4013      	ands	r3, r2
 800ca2e:	3b06      	subs	r3, #6
 800ca30:	2b01      	cmp	r3, #1
 800ca32:	d900      	bls.n	800ca36 <fn_0800C9F0+0x46>
 800ca34:	e07c      	b.n	800cb30 <fn_0800C9F0+0x140>
 800ca36:	8aea      	ldrh	r2, [r5, #22]
 800ca38:	4b6c      	ldr	r3, [pc, #432]	@ (800cbec <fn_0800C9F0+0x1fc>)
 800ca3a:	429a      	cmp	r2, r3
 800ca3c:	d017      	beq.n	800ca6e <fn_0800C9F0+0x7e>
 800ca3e:	4b6c      	ldr	r3, [pc, #432]	@ (800cbf0 <fn_0800C9F0+0x200>)
 800ca40:	58c8      	ldr	r0, [r1, r3]
 800ca42:	0053      	lsls	r3, r2, #1
 800ca44:	189b      	adds	r3, r3, r2
 800ca46:	009b      	lsls	r3, r3, #2
 800ca48:	18c3      	adds	r3, r0, r3
 800ca4a:	895b      	ldrh	r3, [r3, #10]
 800ca4c:	009c      	lsls	r4, r3, #2
 800ca4e:	18e4      	adds	r4, r4, r3
 800ca50:	23df      	movs	r3, #223	@ 0xdf
 800ca52:	011b      	lsls	r3, r3, #4
 800ca54:	58cf      	ldr	r7, [r1, r3]
 800ca56:	00e4      	lsls	r4, r4, #3
 800ca58:	193b      	adds	r3, r7, r4
 800ca5a:	4699      	mov	r9, r3
 800ca5c:	2b00      	cmp	r3, #0
 800ca5e:	d006      	beq.n	800ca6e <fn_0800C9F0+0x7e>
 800ca60:	0019      	movs	r1, r3
 800ca62:	2001      	movs	r0, #1
 800ca64:	f008 fd06 	bl	8015474 <fn_08015474>
 800ca68:	2800      	cmp	r0, #0
 800ca6a:	d100      	bne.n	800ca6e <fn_0800C9F0+0x7e>
 800ca6c:	e080      	b.n	800cb70 <fn_0800C9F0+0x180>
 800ca6e:	2300      	movs	r3, #0
 800ca70:	4698      	mov	r8, r3
 800ca72:	4640      	mov	r0, r8
 800ca74:	b003      	add	sp, #12
 800ca76:	bcf0      	pop	{r4, r5, r6, r7}
 800ca78:	46bb      	mov	fp, r7
 800ca7a:	46b2      	mov	sl, r6
 800ca7c:	46a9      	mov	r9, r5
 800ca7e:	46a0      	mov	r8, r4
 800ca80:	bcf0      	pop	{r4, r5, r6, r7}
 800ca82:	bc02      	pop	{r1}
 800ca84:	4708      	bx	r1
 800ca86:	2300      	movs	r3, #0
 800ca88:	2401      	movs	r4, #1
 800ca8a:	469a      	mov	sl, r3
 800ca8c:	469b      	mov	fp, r3
 800ca8e:	4698      	mov	r8, r3
 800ca90:	4264      	negs	r4, r4
 800ca92:	0021      	movs	r1, r4
 800ca94:	0028      	movs	r0, r5
 800ca96:	f008 fb4f 	bl	8015138 <fn_08015138>
 800ca9a:	1e04      	subs	r4, r0, #0
 800ca9c:	dbe9      	blt.n	800ca72 <fn_0800C9F0+0x82>
 800ca9e:	22df      	movs	r2, #223	@ 0xdf
 800caa0:	6831      	ldr	r1, [r6, #0]
 800caa2:	0112      	lsls	r2, r2, #4
 800caa4:	00a3      	lsls	r3, r4, #2
 800caa6:	588f      	ldr	r7, [r1, r2]
 800caa8:	191b      	adds	r3, r3, r4
 800caaa:	00db      	lsls	r3, r3, #3
 800caac:	18fb      	adds	r3, r7, r3
 800caae:	0019      	movs	r1, r3
 800cab0:	2001      	movs	r0, #1
 800cab2:	4699      	mov	r9, r3
 800cab4:	f008 fcde 	bl	8015474 <fn_08015474>
 800cab8:	9001      	str	r0, [sp, #4]
 800caba:	2800      	cmp	r0, #0
 800cabc:	d1e9      	bne.n	800ca92 <fn_0800C9F0+0xa2>
 800cabe:	2200      	movs	r2, #0
 800cac0:	2103      	movs	r1, #3
 800cac2:	2030      	movs	r0, #48	@ 0x30
 800cac4:	f010 fe32 	bl	801d72c <fn_0801D72C>
 800cac8:	0007      	movs	r7, r0
 800caca:	2230      	movs	r2, #48	@ 0x30
 800cacc:	2100      	movs	r1, #0
 800cace:	f013 ffb7 	bl	8020a40 <fn_08020A40>
 800cad2:	0038      	movs	r0, r7
 800cad4:	f00b fd7c 	bl	80185d0 <fn_080185D0>
 800cad8:	4648      	mov	r0, r9
 800cada:	4b46      	ldr	r3, [pc, #280]	@ (800cbf4 <fn_0800C9F0+0x204>)
 800cadc:	6147      	str	r7, [r0, #20]
 800cade:	60bb      	str	r3, [r7, #8]
 800cae0:	2396      	movs	r3, #150	@ 0x96
 800cae2:	6138      	str	r0, [r7, #16]
 800cae4:	623b      	str	r3, [r7, #32]
 800cae6:	62bd      	str	r5, [r7, #40]	@ 0x28
 800cae8:	f008 f8ce 	bl	8014c88 <fn_08014C88>
 800caec:	4b42      	ldr	r3, [pc, #264]	@ (800cbf8 <fn_0800C9F0+0x208>)
 800caee:	18c0      	adds	r0, r0, r3
 800caf0:	2301      	movs	r3, #1
 800caf2:	6178      	str	r0, [r7, #20]
 800caf4:	61fb      	str	r3, [r7, #28]
 800caf6:	6831      	ldr	r1, [r6, #0]
 800caf8:	4b3b      	ldr	r3, [pc, #236]	@ (800cbe8 <fn_0800C9F0+0x1f8>)
 800cafa:	8bea      	ldrh	r2, [r5, #30]
 800cafc:	58cb      	ldr	r3, [r1, r3]
 800cafe:	0092      	lsls	r2, r2, #2
 800cb00:	189b      	adds	r3, r3, r2
 800cb02:	78db      	ldrb	r3, [r3, #3]
 800cb04:	065a      	lsls	r2, r3, #25
 800cb06:	d418      	bmi.n	800cb3a <fn_0800C9F0+0x14a>
 800cb08:	211a      	movs	r1, #26
 800cb0a:	5e6a      	ldrsh	r2, [r5, r1]
 800cb0c:	09db      	lsrs	r3, r3, #7
 800cb0e:	021b      	lsls	r3, r3, #8
 800cb10:	4053      	eors	r3, r2
 800cb12:	2206      	movs	r2, #6
 800cb14:	401a      	ands	r2, r3
 800cb16:	2a06      	cmp	r2, #6
 800cb18:	d10f      	bne.n	800cb3a <fn_0800C9F0+0x14a>
 800cb1a:	21e0      	movs	r1, #224	@ 0xe0
 800cb1c:	2201      	movs	r2, #1
 800cb1e:	0189      	lsls	r1, r1, #6
 800cb20:	428b      	cmp	r3, r1
 800cb22:	dc00      	bgt.n	800cb26 <fn_0800C9F0+0x136>
 800cb24:	2200      	movs	r2, #0
 800cb26:	0612      	lsls	r2, r2, #24
 800cb28:	d007      	beq.n	800cb3a <fn_0800C9F0+0x14a>
 800cb2a:	221c      	movs	r2, #28
 800cb2c:	5eab      	ldrsh	r3, [r5, r2]
 800cb2e:	e005      	b.n	800cb3c <fn_0800C9F0+0x14c>
 800cb30:	2300      	movs	r3, #0
 800cb32:	2401      	movs	r4, #1
 800cb34:	4698      	mov	r8, r3
 800cb36:	4264      	negs	r4, r4
 800cb38:	e7ab      	b.n	800ca92 <fn_0800C9F0+0xa2>
 800cb3a:	2300      	movs	r3, #0
 800cb3c:	62fb      	str	r3, [r7, #44]	@ 0x2c
 800cb3e:	4653      	mov	r3, sl
 800cb40:	2b02      	cmp	r3, #2
 800cb42:	d038      	beq.n	800cbb6 <fn_0800C9F0+0x1c6>
 800cb44:	2b03      	cmp	r3, #3
 800cb46:	d02b      	beq.n	800cba0 <fn_0800C9F0+0x1b0>
 800cb48:	2b01      	cmp	r3, #1
 800cb4a:	d11f      	bne.n	800cb8c <fn_0800C9F0+0x19c>
 800cb4c:	465b      	mov	r3, fp
 800cb4e:	2b00      	cmp	r3, #0
 800cb50:	d040      	beq.n	800cbd4 <fn_0800C9F0+0x1e4>
 800cb52:	2380      	movs	r3, #128	@ 0x80
 800cb54:	220a      	movs	r2, #10
 800cb56:	02db      	lsls	r3, r3, #11
 800cb58:	2114      	movs	r1, #20
 800cb5a:	733a      	strb	r2, [r7, #12]
 800cb5c:	61bb      	str	r3, [r7, #24]
 800cb5e:	6938      	ldr	r0, [r7, #16]
 800cb60:	f008 fcfe 	bl	8015560 <fn_08015560>
 800cb64:	9b01      	ldr	r3, [sp, #4]
 800cb66:	2b00      	cmp	r3, #0
 800cb68:	d117      	bne.n	800cb9a <fn_0800C9F0+0x1aa>
 800cb6a:	3301      	adds	r3, #1
 800cb6c:	4698      	mov	r8, r3
 800cb6e:	e790      	b.n	800ca92 <fn_0800C9F0+0xa2>
 800cb70:	10e3      	asrs	r3, r4, #3
 800cb72:	08a4      	lsrs	r4, r4, #2
 800cb74:	18e4      	adds	r4, r4, r3
 800cb76:	0122      	lsls	r2, r4, #4
 800cb78:	18a4      	adds	r4, r4, r2
 800cb7a:	0222      	lsls	r2, r4, #8
 800cb7c:	18a4      	adds	r4, r4, r2
 800cb7e:	0422      	lsls	r2, r4, #16
 800cb80:	18a4      	adds	r4, r4, r2
 800cb82:	00a4      	lsls	r4, r4, #2
 800cb84:	18e4      	adds	r4, r4, r3
 800cb86:	2301      	movs	r3, #1
 800cb88:	9301      	str	r3, [sp, #4]
 800cb8a:	e798      	b.n	800cabe <fn_0800C9F0+0xce>
 800cb8c:	465b      	mov	r3, fp
 800cb8e:	2b00      	cmp	r3, #0
 800cb90:	d024      	beq.n	800cbdc <fn_0800C9F0+0x1ec>
 800cb92:	2380      	movs	r3, #128	@ 0x80
 800cb94:	220a      	movs	r2, #10
 800cb96:	029b      	lsls	r3, r3, #10
 800cb98:	e7de      	b.n	800cb58 <fn_0800C9F0+0x168>
 800cb9a:	2301      	movs	r3, #1
 800cb9c:	4698      	mov	r8, r3
 800cb9e:	e768      	b.n	800ca72 <fn_0800C9F0+0x82>
 800cba0:	465b      	mov	r3, fp
 800cba2:	2b00      	cmp	r3, #0
 800cba4:	d00e      	beq.n	800cbc4 <fn_0800C9F0+0x1d4>
 800cba6:	2380      	movs	r3, #128	@ 0x80
 800cba8:	220b      	movs	r2, #11
 800cbaa:	035b      	lsls	r3, r3, #13
 800cbac:	2158      	movs	r1, #88	@ 0x58
 800cbae:	733a      	strb	r2, [r7, #12]
 800cbb0:	61bb      	str	r3, [r7, #24]
 800cbb2:	6938      	ldr	r0, [r7, #16]
 800cbb4:	e7d4      	b.n	800cb60 <fn_0800C9F0+0x170>
 800cbb6:	465b      	mov	r3, fp
 800cbb8:	2b00      	cmp	r3, #0
 800cbba:	d007      	beq.n	800cbcc <fn_0800C9F0+0x1dc>
 800cbbc:	2380      	movs	r3, #128	@ 0x80
 800cbbe:	220b      	movs	r2, #11
 800cbc0:	031b      	lsls	r3, r3, #12
 800cbc2:	e7f3      	b.n	800cbac <fn_0800C9F0+0x1bc>
 800cbc4:	2380      	movs	r3, #128	@ 0x80
 800cbc6:	2209      	movs	r2, #9
 800cbc8:	035b      	lsls	r3, r3, #13
 800cbca:	e7ef      	b.n	800cbac <fn_0800C9F0+0x1bc>
 800cbcc:	2380      	movs	r3, #128	@ 0x80
 800cbce:	2209      	movs	r2, #9
 800cbd0:	031b      	lsls	r3, r3, #12
 800cbd2:	e7eb      	b.n	800cbac <fn_0800C9F0+0x1bc>
 800cbd4:	2380      	movs	r3, #128	@ 0x80
 800cbd6:	2208      	movs	r2, #8
 800cbd8:	02db      	lsls	r3, r3, #11
 800cbda:	e7bd      	b.n	800cb58 <fn_0800C9F0+0x168>
 800cbdc:	2380      	movs	r3, #128	@ 0x80
 800cbde:	2208      	movs	r2, #8
 800cbe0:	029b      	lsls	r3, r3, #10
 800cbe2:	e7b9      	b.n	800cb58 <fn_0800C9F0+0x168>
 800cbe4:	030064c4 	.word	0x030064c4
 800cbe8:	00000e04 	.word	0x00000e04
 800cbec:	0000ffff 	.word	0x0000ffff
 800cbf0:	00000e0c 	.word	0x00000e0c
 800cbf4:	0800704d 	.word	0x0800704d
 800cbf8:	fffc0000 	.word	0xfffc0000
