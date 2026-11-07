fn_0800893C:
 800893c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800893e:	46ce      	mov	lr, r9
 8008940:	4647      	mov	r7, r8
 8008942:	225c      	movs	r2, #92	@ 0x5c
 8008944:	b580      	push	{r7, lr}
 8008946:	5c83      	ldrb	r3, [r0, r2]
 8008948:	0004      	movs	r4, r0
 800894a:	2b00      	cmp	r3, #0
 800894c:	d001      	beq.n	8008952 <fn_0800893C+0x16>
 800894e:	3b01      	subs	r3, #1
 8008950:	5483      	strb	r3, [r0, r2]
 8008952:	235e      	movs	r3, #94	@ 0x5e
 8008954:	215d      	movs	r1, #93	@ 0x5d
 8008956:	5ce3      	ldrb	r3, [r4, r3]
 8008958:	5c62      	ldrb	r2, [r4, r1]
 800895a:	071b      	lsls	r3, r3, #28
 800895c:	6d25      	ldr	r5, [r4, #80]	@ 0x50
 800895e:	0f1b      	lsrs	r3, r3, #28
 8008960:	2a00      	cmp	r2, #0
 8008962:	d100      	bne.n	8008966 <fn_0800893C+0x2a>
 8008964:	e0ad      	b.n	8008ac2 <fn_0800893C+0x186>
 8008966:	2d00      	cmp	r5, #0
 8008968:	d100      	bne.n	800896c <fn_0800893C+0x30>
 800896a:	e0e1      	b.n	8008b30 <fn_0800893C+0x1f4>
 800896c:	2054      	movs	r0, #84	@ 0x54
 800896e:	5e28      	ldrsh	r0, [r5, r0]
 8008970:	2800      	cmp	r0, #0
 8008972:	dc00      	bgt.n	8008976 <fn_0800893C+0x3a>
 8008974:	e0e0      	b.n	8008b38 <fn_0800893C+0x1fc>
 8008976:	3a01      	subs	r2, #1
 8008978:	5462      	strb	r2, [r4, r1]
 800897a:	2b07      	cmp	r3, #7
 800897c:	d800      	bhi.n	8008980 <fn_0800893C+0x44>
 800897e:	e0a2      	b.n	8008ac6 <fn_0800893C+0x18a>
 8008980:	6ceb      	ldr	r3, [r5, #76]	@ 0x4c
 8008982:	075b      	lsls	r3, r3, #29
 8008984:	d400      	bmi.n	8008988 <fn_0800893C+0x4c>
 8008986:	e0ac      	b.n	8008ae2 <fn_0800893C+0x1a6>
 8008988:	4fa5      	ldr	r7, [pc, #660]	@ (8008c20 <fn_0800893C+0x2e4>)
 800898a:	683a      	ldr	r2, [r7, #0]
 800898c:	4690      	mov	r8, r2
 800898e:	2280      	movs	r2, #128	@ 0x80
 8008990:	6ce3      	ldr	r3, [r4, #76]	@ 0x4c
 8008992:	421a      	tst	r2, r3
 8008994:	d000      	beq.n	8008998 <fn_0800893C+0x5c>
 8008996:	e0c0      	b.n	8008b1a <fn_0800893C+0x1de>
 8008998:	22ea      	movs	r2, #234	@ 0xea
 800899a:	4643      	mov	r3, r8
 800899c:	00d2      	lsls	r2, r2, #3
 800899e:	589b      	ldr	r3, [r3, r2]
 80089a0:	225a      	movs	r2, #90	@ 0x5a
 80089a2:	5ca6      	ldrb	r6, [r4, r2]
 80089a4:	3202      	adds	r2, #2
 80089a6:	4372      	muls	r2, r6
 80089a8:	189e      	adds	r6, r3, r2
 80089aa:	4699      	mov	r9, r3
 80089ac:	6ab3      	ldr	r3, [r6, #40]	@ 0x28
 80089ae:	2b00      	cmp	r3, #0
 80089b0:	d000      	beq.n	80089b4 <fn_0800893C+0x78>
 80089b2:	e0d5      	b.n	8008b60 <fn_0800893C+0x224>
 80089b4:	6af3      	ldr	r3, [r6, #44]	@ 0x2c
 80089b6:	2b00      	cmp	r3, #0
 80089b8:	d05b      	beq.n	8008a72 <fn_0800893C+0x136>
 80089ba:	23d6      	movs	r3, #214	@ 0xd6
 80089bc:	4642      	mov	r2, r8
 80089be:	56d3      	ldrsb	r3, [r2, r3]
 80089c0:	2b03      	cmp	r3, #3
 80089c2:	dc03      	bgt.n	80089cc <fn_0800893C+0x90>
 80089c4:	2358      	movs	r3, #88	@ 0x58
 80089c6:	5ee3      	ldrsh	r3, [r4, r3]
 80089c8:	2b00      	cmp	r3, #0
 80089ca:	d154      	bne.n	8008a76 <fn_0800893C+0x13a>
 80089cc:	0020      	movs	r0, r4
 80089ce:	6d21      	ldr	r1, [r4, #80]	@ 0x50
 80089d0:	f00b fc5c 	bl	801428c <fn_0801428C>
 80089d4:	2800      	cmp	r0, #0
 80089d6:	d04c      	beq.n	8008a72 <fn_0800893C+0x136>
 80089d8:	2240      	movs	r2, #64	@ 0x40
 80089da:	6ce3      	ldr	r3, [r4, #76]	@ 0x4c
 80089dc:	421a      	tst	r2, r3
 80089de:	d000      	beq.n	80089e2 <fn_0800893C+0xa6>
 80089e0:	e0fd      	b.n	8008bde <fn_0800893C+0x2a2>
 80089e2:	255c      	movs	r5, #92	@ 0x5c
 80089e4:	5d63      	ldrb	r3, [r4, r5]
 80089e6:	2b00      	cmp	r3, #0
 80089e8:	d143      	bne.n	8008a72 <fn_0800893C+0x136>
 80089ea:	6d23      	ldr	r3, [r4, #80]	@ 0x50
 80089ec:	6921      	ldr	r1, [r4, #16]
 80089ee:	691a      	ldr	r2, [r3, #16]
 80089f0:	68e0      	ldr	r0, [r4, #12]
 80089f2:	68db      	ldr	r3, [r3, #12]
 80089f4:	1a89      	subs	r1, r1, r2
 80089f6:	1ac0      	subs	r0, r0, r3
 80089f8:	f007 fa00 	bl	800fdfc <fn_0800FDFC>
 80089fc:	235a      	movs	r3, #90	@ 0x5a
 80089fe:	22ea      	movs	r2, #234	@ 0xea
 8008a00:	5ce3      	ldrb	r3, [r4, r3]
 8008a02:	435d      	muls	r5, r3
 8008a04:	6839      	ldr	r1, [r7, #0]
 8008a06:	00d2      	lsls	r2, r2, #3
 8008a08:	588a      	ldr	r2, [r1, r2]
 8008a0a:	1952      	adds	r2, r2, r5
 8008a0c:	6a91      	ldr	r1, [r2, #40]	@ 0x28
 8008a0e:	4a85      	ldr	r2, [pc, #532]	@ (8008c24 <fn_0800893C+0x2e8>)
 8008a10:	1882      	adds	r2, r0, r2
 8008a12:	2900      	cmp	r1, #0
 8008a14:	d001      	beq.n	8008a1a <fn_0800893C+0xde>
 8008a16:	4a84      	ldr	r2, [pc, #528]	@ (8008c28 <fn_0800893C+0x2ec>)
 8008a18:	1882      	adds	r2, r0, r2
 8008a1a:	1415      	asrs	r5, r2, #16
 8008a1c:	2b03      	cmp	r3, #3
 8008a1e:	d024      	beq.n	8008a6a <fn_0800893C+0x12e>
 8008a20:	2b05      	cmp	r3, #5
 8008a22:	d100      	bne.n	8008a26 <fn_0800893C+0xea>
 8008a24:	e0f8      	b.n	8008c18 <fn_0800893C+0x2dc>
 8008a26:	0019      	movs	r1, r3
 8008a28:	20fd      	movs	r0, #253	@ 0xfd
 8008a2a:	3913      	subs	r1, #19
 8008a2c:	4201      	tst	r1, r0
 8008a2e:	d100      	bne.n	8008a32 <fn_0800893C+0xf6>
 8008a30:	e0e6      	b.n	8008c00 <fn_0800893C+0x2c4>
 8008a32:	2b12      	cmp	r3, #18
 8008a34:	d100      	bne.n	8008a38 <fn_0800893C+0xfc>
 8008a36:	1455      	asrs	r5, r2, #17
 8008a38:	2dc8      	cmp	r5, #200	@ 0xc8
 8008a3a:	dd00      	ble.n	8008a3e <fn_0800893C+0x102>
 8008a3c:	25c8      	movs	r5, #200	@ 0xc8
 8008a3e:	f7fe f85f 	bl	8006b00 <fn_08006B00>
 8008a42:	42a8      	cmp	r0, r5
 8008a44:	db15      	blt.n	8008a72 <fn_0800893C+0x136>
 8008a46:	235a      	movs	r3, #90	@ 0x5a
 8008a48:	5ce1      	ldrb	r1, [r4, r3]
 8008a4a:	23ea      	movs	r3, #234	@ 0xea
 8008a4c:	683a      	ldr	r2, [r7, #0]
 8008a4e:	00db      	lsls	r3, r3, #3
 8008a50:	58d3      	ldr	r3, [r2, r3]
 8008a52:	225c      	movs	r2, #92	@ 0x5c
 8008a54:	434a      	muls	r2, r1
 8008a56:	189b      	adds	r3, r3, r2
 8008a58:	8d99      	ldrh	r1, [r3, #44]	@ 0x2c
 8008a5a:	0020      	movs	r0, r4
 8008a5c:	f008 fbd6 	bl	801120c <fn_0801120C>
 8008a60:	2280      	movs	r2, #128	@ 0x80
 8008a62:	6ce3      	ldr	r3, [r4, #76]	@ 0x4c
 8008a64:	4313      	orrs	r3, r2
 8008a66:	64e3      	str	r3, [r4, #76]	@ 0x4c
 8008a68:	e025      	b.n	8008ab6 <fn_0800893C+0x17a>
 8008a6a:	23e0      	movs	r3, #224	@ 0xe0
 8008a6c:	009b      	lsls	r3, r3, #2
 8008a6e:	429d      	cmp	r5, r3
 8008a70:	dde2      	ble.n	8008a38 <fn_0800893C+0xfc>
 8008a72:	2358      	movs	r3, #88	@ 0x58
 8008a74:	5ee3      	ldrsh	r3, [r4, r3]
 8008a76:	2258      	movs	r2, #88	@ 0x58
 8008a78:	3b01      	subs	r3, #1
 8008a7a:	041b      	lsls	r3, r3, #16
 8008a7c:	141b      	asrs	r3, r3, #16
 8008a7e:	52a3      	strh	r3, [r4, r2]
 8008a80:	d40a      	bmi.n	8008a98 <fn_0800893C+0x15c>
 8008a82:	235e      	movs	r3, #94	@ 0x5e
 8008a84:	5ce2      	ldrb	r2, [r4, r3]
 8008a86:	3b4f      	subs	r3, #79	@ 0x4f
 8008a88:	4013      	ands	r3, r2
 8008a8a:	2b08      	cmp	r3, #8
 8008a8c:	d004      	beq.n	8008a98 <fn_0800893C+0x15c>
 8008a8e:	0020      	movs	r0, r4
 8008a90:	f7ff f81c 	bl	8007acc <fn_08007ACC>
 8008a94:	2800      	cmp	r0, #0
 8008a96:	d102      	bne.n	8008a9e <fn_0800893C+0x162>
 8008a98:	0020      	movs	r0, r4
 8008a9a:	f7ff f987 	bl	8007dac <fn_08007DAC>
 8008a9e:	225a      	movs	r2, #90	@ 0x5a
 8008aa0:	255c      	movs	r5, #92	@ 0x5c
 8008aa2:	26ea      	movs	r6, #234	@ 0xea
 8008aa4:	5ca2      	ldrb	r2, [r4, r2]
 8008aa6:	436a      	muls	r2, r5
 8008aa8:	683b      	ldr	r3, [r7, #0]
 8008aaa:	00f6      	lsls	r6, r6, #3
 8008aac:	599b      	ldr	r3, [r3, r6]
 8008aae:	189b      	adds	r3, r3, r2
 8008ab0:	6d1b      	ldr	r3, [r3, #80]	@ 0x50
 8008ab2:	2b00      	cmp	r3, #0
 8008ab4:	d145      	bne.n	8008b42 <fn_0800893C+0x206>
 8008ab6:	bcc0      	pop	{r6, r7}
 8008ab8:	46b9      	mov	r9, r7
 8008aba:	46b0      	mov	r8, r6
 8008abc:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8008abe:	bc01      	pop	{r0}
 8008ac0:	4700      	bx	r0
 8008ac2:	2b07      	cmp	r3, #7
 8008ac4:	d80a      	bhi.n	8008adc <fn_0800893C+0x1a0>
 8008ac6:	6a22      	ldr	r2, [r4, #32]
 8008ac8:	0f52      	lsrs	r2, r2, #29
 8008aca:	0752      	lsls	r2, r2, #29
 8008acc:	075b      	lsls	r3, r3, #29
 8008ace:	1ad3      	subs	r3, r2, r3
 8008ad0:	2b00      	cmp	r3, #0
 8008ad2:	dd1b      	ble.n	8008b0c <fn_0800893C+0x1d0>
 8008ad4:	23e0      	movs	r3, #224	@ 0xe0
 8008ad6:	061b      	lsls	r3, r3, #24
 8008ad8:	18d2      	adds	r2, r2, r3
 8008ada:	6222      	str	r2, [r4, #32]
 8008adc:	2d00      	cmp	r5, #0
 8008ade:	d000      	beq.n	8008ae2 <fn_0800893C+0x1a6>
 8008ae0:	e74e      	b.n	8008980 <fn_0800893C+0x44>
 8008ae2:	2101      	movs	r1, #1
 8008ae4:	0020      	movs	r0, r4
 8008ae6:	f7fe ff7d 	bl	80079e4 <fn_080079E4>
 8008aea:	2800      	cmp	r0, #0
 8008aec:	d1e3      	bne.n	8008ab6 <fn_0800893C+0x17a>
 8008aee:	4b4c      	ldr	r3, [pc, #304]	@ (8008c20 <fn_0800893C+0x2e4>)
 8008af0:	681a      	ldr	r2, [r3, #0]
 8008af2:	235a      	movs	r3, #90	@ 0x5a
 8008af4:	5ce1      	ldrb	r1, [r4, r3]
 8008af6:	23ea      	movs	r3, #234	@ 0xea
 8008af8:	00db      	lsls	r3, r3, #3
 8008afa:	58d3      	ldr	r3, [r2, r3]
 8008afc:	225c      	movs	r2, #92	@ 0x5c
 8008afe:	434a      	muls	r2, r1
 8008b00:	189b      	adds	r3, r3, r2
 8008b02:	0020      	movs	r0, r4
 8008b04:	8899      	ldrh	r1, [r3, #4]
 8008b06:	f008 fb81 	bl	801120c <fn_0801120C>
 8008b0a:	e7d4      	b.n	8008ab6 <fn_0800893C+0x17a>
 8008b0c:	2b00      	cmp	r3, #0
 8008b0e:	d002      	beq.n	8008b16 <fn_0800893C+0x1da>
 8008b10:	2380      	movs	r3, #128	@ 0x80
 8008b12:	059b      	lsls	r3, r3, #22
 8008b14:	18d2      	adds	r2, r2, r3
 8008b16:	6222      	str	r2, [r4, #32]
 8008b18:	e7e0      	b.n	8008adc <fn_0800893C+0x1a0>
 8008b1a:	4393      	bics	r3, r2
 8008b1c:	64e3      	str	r3, [r4, #76]	@ 0x4c
 8008b1e:	4642      	mov	r2, r8
 8008b20:	23d6      	movs	r3, #214	@ 0xd6
 8008b22:	56d3      	ldrsb	r3, [r2, r3]
 8008b24:	2b04      	cmp	r3, #4
 8008b26:	d0c6      	beq.n	8008ab6 <fn_0800893C+0x17a>
 8008b28:	0020      	movs	r0, r4
 8008b2a:	f7ff f93f 	bl	8007dac <fn_08007DAC>
 8008b2e:	e7c2      	b.n	8008ab6 <fn_0800893C+0x17a>
 8008b30:	5465      	strb	r5, [r4, r1]
 8008b32:	2b07      	cmp	r3, #7
 8008b34:	d9c7      	bls.n	8008ac6 <fn_0800893C+0x18a>
 8008b36:	e7d4      	b.n	8008ae2 <fn_0800893C+0x1a6>
 8008b38:	2200      	movs	r2, #0
 8008b3a:	5462      	strb	r2, [r4, r1]
 8008b3c:	2b07      	cmp	r3, #7
 8008b3e:	d9c2      	bls.n	8008ac6 <fn_0800893C+0x18a>
 8008b40:	e71e      	b.n	8008980 <fn_0800893C+0x44>
 8008b42:	f7fd ffdd 	bl	8006b00 <fn_08006B00>
 8008b46:	2802      	cmp	r0, #2
 8008b48:	dcb5      	bgt.n	8008ab6 <fn_0800893C+0x17a>
 8008b4a:	225a      	movs	r2, #90	@ 0x5a
 8008b4c:	5ca2      	ldrb	r2, [r4, r2]
 8008b4e:	4355      	muls	r5, r2
 8008b50:	683b      	ldr	r3, [r7, #0]
 8008b52:	599b      	ldr	r3, [r3, r6]
 8008b54:	195b      	adds	r3, r3, r5
 8008b56:	0020      	movs	r0, r4
 8008b58:	6d19      	ldr	r1, [r3, #80]	@ 0x50
 8008b5a:	f011 fbb5 	bl	801a2c8 <fn_0801A2C8>
 8008b5e:	e7aa      	b.n	8008ab6 <fn_0800893C+0x17a>
 8008b60:	6923      	ldr	r3, [r4, #16]
 8008b62:	6929      	ldr	r1, [r5, #16]
 8008b64:	68e8      	ldr	r0, [r5, #12]
 8008b66:	1ac9      	subs	r1, r1, r3
 8008b68:	68e3      	ldr	r3, [r4, #12]
 8008b6a:	1ac0      	subs	r0, r0, r3
 8008b6c:	f007 f946 	bl	800fdfc <fn_0800FDFC>
 8008b70:	235a      	movs	r3, #90	@ 0x5a
 8008b72:	225c      	movs	r2, #92	@ 0x5c
 8008b74:	5ceb      	ldrb	r3, [r5, r3]
 8008b76:	435a      	muls	r2, r3
 8008b78:	0013      	movs	r3, r2
 8008b7a:	444b      	add	r3, r9
 8008b7c:	6c1b      	ldr	r3, [r3, #64]	@ 0x40
 8008b7e:	4a2b      	ldr	r2, [pc, #172]	@ (8008c2c <fn_0800893C+0x2f0>)
 8008b80:	189b      	adds	r3, r3, r2
 8008b82:	4283      	cmp	r3, r0
 8008b84:	da00      	bge.n	8008b88 <fn_0800893C+0x24c>
 8008b86:	e715      	b.n	80089b4 <fn_0800893C+0x78>
 8008b88:	0029      	movs	r1, r5
 8008b8a:	0020      	movs	r0, r4
 8008b8c:	f00b fb7e 	bl	801428c <fn_0801428C>
 8008b90:	235a      	movs	r3, #90	@ 0x5a
 8008b92:	215c      	movs	r1, #92	@ 0x5c
 8008b94:	5ce3      	ldrb	r3, [r4, r3]
 8008b96:	4359      	muls	r1, r3
 8008b98:	000b      	movs	r3, r1
 8008b9a:	21ea      	movs	r1, #234	@ 0xea
 8008b9c:	683a      	ldr	r2, [r7, #0]
 8008b9e:	00c9      	lsls	r1, r1, #3
 8008ba0:	5856      	ldr	r6, [r2, r1]
 8008ba2:	4690      	mov	r8, r2
 8008ba4:	18f6      	adds	r6, r6, r3
 8008ba6:	2800      	cmp	r0, #0
 8008ba8:	d100      	bne.n	8008bac <fn_0800893C+0x270>
 8008baa:	e703      	b.n	80089b4 <fn_0800893C+0x78>
 8008bac:	69b1      	ldr	r1, [r6, #24]
 8008bae:	2900      	cmp	r1, #0
 8008bb0:	d118      	bne.n	8008be4 <fn_0800893C+0x2a8>
 8008bb2:	8d31      	ldrh	r1, [r6, #40]	@ 0x28
 8008bb4:	0020      	movs	r0, r4
 8008bb6:	f008 fb29 	bl	801120c <fn_0801120C>
 8008bba:	235a      	movs	r3, #90	@ 0x5a
 8008bbc:	5ce1      	ldrb	r1, [r4, r3]
 8008bbe:	23ea      	movs	r3, #234	@ 0xea
 8008bc0:	683a      	ldr	r2, [r7, #0]
 8008bc2:	00db      	lsls	r3, r3, #3
 8008bc4:	58d3      	ldr	r3, [r2, r3]
 8008bc6:	225c      	movs	r2, #92	@ 0x5c
 8008bc8:	434a      	muls	r2, r1
 8008bca:	189b      	adds	r3, r3, r2
 8008bcc:	6adb      	ldr	r3, [r3, #44]	@ 0x2c
 8008bce:	2b00      	cmp	r3, #0
 8008bd0:	d000      	beq.n	8008bd4 <fn_0800893C+0x298>
 8008bd2:	e770      	b.n	8008ab6 <fn_0800893C+0x17a>
 8008bd4:	2240      	movs	r2, #64	@ 0x40
 8008bd6:	6ce3      	ldr	r3, [r4, #76]	@ 0x4c
 8008bd8:	4313      	orrs	r3, r2
 8008bda:	64e3      	str	r3, [r4, #76]	@ 0x4c
 8008bdc:	e76b      	b.n	8008ab6 <fn_0800893C+0x17a>
 8008bde:	4393      	bics	r3, r2
 8008be0:	64e3      	str	r3, [r4, #76]	@ 0x4c
 8008be2:	e730      	b.n	8008a46 <fn_0800893C+0x10a>
 8008be4:	0020      	movs	r0, r4
 8008be6:	f011 fb6f 	bl	801a2c8 <fn_0801A2C8>
 8008bea:	235a      	movs	r3, #90	@ 0x5a
 8008bec:	215c      	movs	r1, #92	@ 0x5c
 8008bee:	5ce3      	ldrb	r3, [r4, r3]
 8008bf0:	4359      	muls	r1, r3
 8008bf2:	000b      	movs	r3, r1
 8008bf4:	21ea      	movs	r1, #234	@ 0xea
 8008bf6:	683a      	ldr	r2, [r7, #0]
 8008bf8:	00c9      	lsls	r1, r1, #3
 8008bfa:	5856      	ldr	r6, [r2, r1]
 8008bfc:	18f6      	adds	r6, r6, r3
 8008bfe:	e7d8      	b.n	8008bb2 <fn_0800893C+0x276>
 8008c00:	1455      	asrs	r5, r2, #17
 8008c02:	2dc8      	cmp	r5, #200	@ 0xc8
 8008c04:	dd00      	ble.n	8008c08 <fn_0800893C+0x2cc>
 8008c06:	25c8      	movs	r5, #200	@ 0xc8
 8008c08:	2b15      	cmp	r3, #21
 8008c0a:	d000      	beq.n	8008c0e <fn_0800893C+0x2d2>
 8008c0c:	e717      	b.n	8008a3e <fn_0800893C+0x102>
 8008c0e:	2da0      	cmp	r5, #160	@ 0xa0
 8008c10:	dc00      	bgt.n	8008c14 <fn_0800893C+0x2d8>
 8008c12:	e714      	b.n	8008a3e <fn_0800893C+0x102>
 8008c14:	25a0      	movs	r5, #160	@ 0xa0
 8008c16:	e712      	b.n	8008a3e <fn_0800893C+0x102>
 8008c18:	2dc3      	cmp	r5, #195	@ 0xc3
 8008c1a:	dd00      	ble.n	8008c1e <fn_0800893C+0x2e2>
 8008c1c:	e70b      	b.n	8008a36 <fn_0800893C+0xfa>
 8008c1e:	e728      	b.n	8008a72 <fn_0800893C+0x136>
 8008c20:	030064c4 	.word	0x030064c4	@ data_030064C4
 8008c24:	ff400000 	.word	0xff400000
 8008c28:	ffc00000 	.word	0xffc00000
 8008c2c:	002bffff 	.word	0x002bffff
