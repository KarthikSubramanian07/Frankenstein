fn_08014A48:
 8014a48:	b5f0      	push	{r4, r5, r6, r7, lr}
 8014a4a:	46d6      	mov	lr, sl
 8014a4c:	464f      	mov	r7, r9
 8014a4e:	4646      	mov	r6, r8
 8014a50:	b5c0      	push	{r6, r7, lr}
 8014a52:	221e      	movs	r2, #30
 8014a54:	5e83      	ldrsh	r3, [r0, r2]
 8014a56:	4689      	mov	r9, r1
 8014a58:	469a      	mov	sl, r3
 8014a5a:	2b00      	cmp	r3, #0
 8014a5c:	dd37      	ble.n	8014ace <fn_08014A48+0x86>
 8014a5e:	22e0      	movs	r2, #224	@ 0xe0
 8014a60:	4b3e      	ldr	r3, [pc, #248]	@ (8014b5c <fn_08014A48+0x114>)
 8014a62:	681b      	ldr	r3, [r3, #0]
 8014a64:	0112      	lsls	r2, r2, #4
 8014a66:	589a      	ldr	r2, [r3, r2]
 8014a68:	4694      	mov	ip, r2
 8014a6a:	6982      	ldr	r2, [r0, #24]
 8014a6c:	4690      	mov	r8, r2
 8014a6e:	22df      	movs	r2, #223	@ 0xdf
 8014a70:	0112      	lsls	r2, r2, #4
 8014a72:	589f      	ldr	r7, [r3, r2]
 8014a74:	4a3a      	ldr	r2, [pc, #232]	@ (8014b60 <fn_08014A48+0x118>)
 8014a76:	2100      	movs	r1, #0
 8014a78:	589d      	ldr	r5, [r3, r2]
 8014a7a:	e007      	b.n	8014a8c <fn_08014A48+0x44>
 8014a7c:	2e00      	cmp	r6, #0
 8014a7e:	d002      	beq.n	8014a86 <fn_08014A48+0x3e>
 8014a80:	6872      	ldr	r2, [r6, #4]
 8014a82:	454a      	cmp	r2, r9
 8014a84:	db2c      	blt.n	8014ae0 <fn_08014A48+0x98>
 8014a86:	3101      	adds	r1, #1
 8014a88:	4551      	cmp	r1, sl
 8014a8a:	da20      	bge.n	8014ace <fn_08014A48+0x86>
 8014a8c:	4643      	mov	r3, r8
 8014a8e:	004c      	lsls	r4, r1, #1
 8014a90:	5b1a      	ldrh	r2, [r3, r4]
 8014a92:	0152      	lsls	r2, r2, #5
 8014a94:	4462      	add	r2, ip
 8014a96:	8a96      	ldrh	r6, [r2, #20]
 8014a98:	0073      	lsls	r3, r6, #1
 8014a9a:	199b      	adds	r3, r3, r6
 8014a9c:	009b      	lsls	r3, r3, #2
 8014a9e:	18eb      	adds	r3, r5, r3
 8014aa0:	895e      	ldrh	r6, [r3, #10]
 8014aa2:	00b3      	lsls	r3, r6, #2
 8014aa4:	199b      	adds	r3, r3, r6
 8014aa6:	00db      	lsls	r3, r3, #3
 8014aa8:	18fe      	adds	r6, r7, r3
 8014aaa:	42b0      	cmp	r0, r6
 8014aac:	d1e6      	bne.n	8014a7c <fn_08014A48+0x34>
 8014aae:	8ad6      	ldrh	r6, [r2, #22]
 8014ab0:	4a2c      	ldr	r2, [pc, #176]	@ (8014b64 <fn_08014A48+0x11c>)
 8014ab2:	4296      	cmp	r6, r2
 8014ab4:	d0e7      	beq.n	8014a86 <fn_08014A48+0x3e>
 8014ab6:	0072      	lsls	r2, r6, #1
 8014ab8:	1992      	adds	r2, r2, r6
 8014aba:	0092      	lsls	r2, r2, #2
 8014abc:	18aa      	adds	r2, r5, r2
 8014abe:	8956      	ldrh	r6, [r2, #10]
 8014ac0:	00b2      	lsls	r2, r6, #2
 8014ac2:	1992      	adds	r2, r2, r6
 8014ac4:	00d2      	lsls	r2, r2, #3
 8014ac6:	4293      	cmp	r3, r2
 8014ac8:	d0dd      	beq.n	8014a86 <fn_08014A48+0x3e>
 8014aca:	18be      	adds	r6, r7, r2
 8014acc:	e7d6      	b.n	8014a7c <fn_08014A48+0x34>
 8014ace:	464a      	mov	r2, r9
 8014ad0:	0010      	movs	r0, r2
 8014ad2:	bce0      	pop	{r5, r6, r7}
 8014ad4:	46ba      	mov	sl, r7
 8014ad6:	46b1      	mov	r9, r6
 8014ad8:	46a8      	mov	r8, r5
 8014ada:	bcf0      	pop	{r4, r5, r6, r7}
 8014adc:	bc02      	pop	{r1}
 8014ade:	4708      	bx	r1
 8014ae0:	3101      	adds	r1, #1
 8014ae2:	4551      	cmp	r1, sl
 8014ae4:	daf4      	bge.n	8014ad0 <fn_08014A48+0x88>
 8014ae6:	4643      	mov	r3, r8
 8014ae8:	3302      	adds	r3, #2
 8014aea:	191c      	adds	r4, r3, r4
 8014aec:	4653      	mov	r3, sl
 8014aee:	005e      	lsls	r6, r3, #1
 8014af0:	4b1c      	ldr	r3, [pc, #112]	@ (8014b64 <fn_08014A48+0x11c>)
 8014af2:	4446      	add	r6, r8
 8014af4:	46b2      	mov	sl, r6
 8014af6:	4698      	mov	r8, r3
 8014af8:	e012      	b.n	8014b20 <fn_08014A48+0xd8>
 8014afa:	2e00      	cmp	r6, #0
 8014afc:	d00d      	beq.n	8014b1a <fn_08014A48+0xd2>
 8014afe:	6871      	ldr	r1, [r6, #4]
 8014b00:	2301      	movs	r3, #1
 8014b02:	4291      	cmp	r1, r2
 8014b04:	dc00      	bgt.n	8014b08 <fn_08014A48+0xc0>
 8014b06:	2300      	movs	r3, #0
 8014b08:	061b      	lsls	r3, r3, #24
 8014b0a:	d006      	beq.n	8014b1a <fn_08014A48+0xd2>
 8014b0c:	2301      	movs	r3, #1
 8014b0e:	4549      	cmp	r1, r9
 8014b10:	db00      	blt.n	8014b14 <fn_08014A48+0xcc>
 8014b12:	2300      	movs	r3, #0
 8014b14:	061b      	lsls	r3, r3, #24
 8014b16:	d000      	beq.n	8014b1a <fn_08014A48+0xd2>
 8014b18:	000a      	movs	r2, r1
 8014b1a:	3402      	adds	r4, #2
 8014b1c:	4554      	cmp	r4, sl
 8014b1e:	d0d7      	beq.n	8014ad0 <fn_08014A48+0x88>
 8014b20:	8821      	ldrh	r1, [r4, #0]
 8014b22:	0149      	lsls	r1, r1, #5
 8014b24:	4461      	add	r1, ip
 8014b26:	8a8e      	ldrh	r6, [r1, #20]
 8014b28:	0073      	lsls	r3, r6, #1
 8014b2a:	199b      	adds	r3, r3, r6
 8014b2c:	009b      	lsls	r3, r3, #2
 8014b2e:	18eb      	adds	r3, r5, r3
 8014b30:	895e      	ldrh	r6, [r3, #10]
 8014b32:	00b3      	lsls	r3, r6, #2
 8014b34:	199b      	adds	r3, r3, r6
 8014b36:	00db      	lsls	r3, r3, #3
 8014b38:	18fe      	adds	r6, r7, r3
 8014b3a:	42b0      	cmp	r0, r6
 8014b3c:	d1dd      	bne.n	8014afa <fn_08014A48+0xb2>
 8014b3e:	8ace      	ldrh	r6, [r1, #22]
 8014b40:	4546      	cmp	r6, r8
 8014b42:	d0ea      	beq.n	8014b1a <fn_08014A48+0xd2>
 8014b44:	0071      	lsls	r1, r6, #1
 8014b46:	1989      	adds	r1, r1, r6
 8014b48:	0089      	lsls	r1, r1, #2
 8014b4a:	1869      	adds	r1, r5, r1
 8014b4c:	894e      	ldrh	r6, [r1, #10]
 8014b4e:	00b1      	lsls	r1, r6, #2
 8014b50:	1989      	adds	r1, r1, r6
 8014b52:	00c9      	lsls	r1, r1, #3
 8014b54:	187e      	adds	r6, r7, r1
 8014b56:	428b      	cmp	r3, r1
 8014b58:	d1cf      	bne.n	8014afa <fn_08014A48+0xb2>
 8014b5a:	e7de      	b.n	8014b1a <fn_08014A48+0xd2>
 8014b5c:	030064c4 	.word	0x030064c4
 8014b60:	00000e0c 	.word	0x00000e0c
 8014b64:	0000ffff 	.word	0x0000ffff
