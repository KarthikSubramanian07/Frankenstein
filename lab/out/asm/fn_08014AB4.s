fn_08014AB4:
 8014ab4:	b5f0      	push	{r4, r5, r6, r7, lr}
 8014ab6:	46d6      	mov	lr, sl
 8014ab8:	464f      	mov	r7, r9
 8014aba:	4646      	mov	r6, r8
 8014abc:	b5c0      	push	{r6, r7, lr}
 8014abe:	221e      	movs	r2, #30
 8014ac0:	5e83      	ldrsh	r3, [r0, r2]
 8014ac2:	4689      	mov	r9, r1
 8014ac4:	469a      	mov	sl, r3
 8014ac6:	2b00      	cmp	r3, #0
 8014ac8:	dd37      	ble.n	8014b3a <fn_08014AB4+0x86>
 8014aca:	22e0      	movs	r2, #224	@ 0xe0
 8014acc:	4b3e      	ldr	r3, [pc, #248]	@ (8014bc8 <fn_08014AB4+0x114>)
 8014ace:	681b      	ldr	r3, [r3, #0]
 8014ad0:	0112      	lsls	r2, r2, #4
 8014ad2:	589a      	ldr	r2, [r3, r2]
 8014ad4:	4694      	mov	ip, r2
 8014ad6:	6982      	ldr	r2, [r0, #24]
 8014ad8:	4690      	mov	r8, r2
 8014ada:	22df      	movs	r2, #223	@ 0xdf
 8014adc:	0112      	lsls	r2, r2, #4
 8014ade:	589f      	ldr	r7, [r3, r2]
 8014ae0:	4a3a      	ldr	r2, [pc, #232]	@ (8014bcc <fn_08014AB4+0x118>)
 8014ae2:	2100      	movs	r1, #0
 8014ae4:	589d      	ldr	r5, [r3, r2]
 8014ae6:	e007      	b.n	8014af8 <fn_08014AB4+0x44>
 8014ae8:	2e00      	cmp	r6, #0
 8014aea:	d002      	beq.n	8014af2 <fn_08014AB4+0x3e>
 8014aec:	6872      	ldr	r2, [r6, #4]
 8014aee:	454a      	cmp	r2, r9
 8014af0:	dc2c      	bgt.n	8014b4c <fn_08014AB4+0x98>
 8014af2:	3101      	adds	r1, #1
 8014af4:	4551      	cmp	r1, sl
 8014af6:	da20      	bge.n	8014b3a <fn_08014AB4+0x86>
 8014af8:	4643      	mov	r3, r8
 8014afa:	004c      	lsls	r4, r1, #1
 8014afc:	5b1a      	ldrh	r2, [r3, r4]
 8014afe:	0152      	lsls	r2, r2, #5
 8014b00:	4462      	add	r2, ip
 8014b02:	8a96      	ldrh	r6, [r2, #20]
 8014b04:	0073      	lsls	r3, r6, #1
 8014b06:	199b      	adds	r3, r3, r6
 8014b08:	009b      	lsls	r3, r3, #2
 8014b0a:	18eb      	adds	r3, r5, r3
 8014b0c:	895e      	ldrh	r6, [r3, #10]
 8014b0e:	00b3      	lsls	r3, r6, #2
 8014b10:	199b      	adds	r3, r3, r6
 8014b12:	00db      	lsls	r3, r3, #3
 8014b14:	18fe      	adds	r6, r7, r3
 8014b16:	42b0      	cmp	r0, r6
 8014b18:	d1e6      	bne.n	8014ae8 <fn_08014AB4+0x34>
 8014b1a:	8ad6      	ldrh	r6, [r2, #22]
 8014b1c:	4a2c      	ldr	r2, [pc, #176]	@ (8014bd0 <fn_08014AB4+0x11c>)
 8014b1e:	4296      	cmp	r6, r2
 8014b20:	d0e7      	beq.n	8014af2 <fn_08014AB4+0x3e>
 8014b22:	0072      	lsls	r2, r6, #1
 8014b24:	1992      	adds	r2, r2, r6
 8014b26:	0092      	lsls	r2, r2, #2
 8014b28:	18aa      	adds	r2, r5, r2
 8014b2a:	8956      	ldrh	r6, [r2, #10]
 8014b2c:	00b2      	lsls	r2, r6, #2
 8014b2e:	1992      	adds	r2, r2, r6
 8014b30:	00d2      	lsls	r2, r2, #3
 8014b32:	4293      	cmp	r3, r2
 8014b34:	d0dd      	beq.n	8014af2 <fn_08014AB4+0x3e>
 8014b36:	18be      	adds	r6, r7, r2
 8014b38:	e7d6      	b.n	8014ae8 <fn_08014AB4+0x34>
 8014b3a:	464a      	mov	r2, r9
 8014b3c:	0010      	movs	r0, r2
 8014b3e:	bce0      	pop	{r5, r6, r7}
 8014b40:	46ba      	mov	sl, r7
 8014b42:	46b1      	mov	r9, r6
 8014b44:	46a8      	mov	r8, r5
 8014b46:	bcf0      	pop	{r4, r5, r6, r7}
 8014b48:	bc02      	pop	{r1}
 8014b4a:	4708      	bx	r1
 8014b4c:	3101      	adds	r1, #1
 8014b4e:	4551      	cmp	r1, sl
 8014b50:	daf4      	bge.n	8014b3c <fn_08014AB4+0x88>
 8014b52:	4643      	mov	r3, r8
 8014b54:	3302      	adds	r3, #2
 8014b56:	191c      	adds	r4, r3, r4
 8014b58:	4653      	mov	r3, sl
 8014b5a:	005e      	lsls	r6, r3, #1
 8014b5c:	4b1c      	ldr	r3, [pc, #112]	@ (8014bd0 <fn_08014AB4+0x11c>)
 8014b5e:	4446      	add	r6, r8
 8014b60:	46b2      	mov	sl, r6
 8014b62:	4698      	mov	r8, r3
 8014b64:	e012      	b.n	8014b8c <fn_08014AB4+0xd8>
 8014b66:	2e00      	cmp	r6, #0
 8014b68:	d00d      	beq.n	8014b86 <fn_08014AB4+0xd2>
 8014b6a:	6871      	ldr	r1, [r6, #4]
 8014b6c:	2301      	movs	r3, #1
 8014b6e:	4291      	cmp	r1, r2
 8014b70:	db00      	blt.n	8014b74 <fn_08014AB4+0xc0>
 8014b72:	2300      	movs	r3, #0
 8014b74:	061b      	lsls	r3, r3, #24
 8014b76:	d006      	beq.n	8014b86 <fn_08014AB4+0xd2>
 8014b78:	2301      	movs	r3, #1
 8014b7a:	4549      	cmp	r1, r9
 8014b7c:	dc00      	bgt.n	8014b80 <fn_08014AB4+0xcc>
 8014b7e:	2300      	movs	r3, #0
 8014b80:	061b      	lsls	r3, r3, #24
 8014b82:	d000      	beq.n	8014b86 <fn_08014AB4+0xd2>
 8014b84:	000a      	movs	r2, r1
 8014b86:	3402      	adds	r4, #2
 8014b88:	4554      	cmp	r4, sl
 8014b8a:	d0d7      	beq.n	8014b3c <fn_08014AB4+0x88>
 8014b8c:	8821      	ldrh	r1, [r4, #0]
 8014b8e:	0149      	lsls	r1, r1, #5
 8014b90:	4461      	add	r1, ip
 8014b92:	8a8e      	ldrh	r6, [r1, #20]
 8014b94:	0073      	lsls	r3, r6, #1
 8014b96:	199b      	adds	r3, r3, r6
 8014b98:	009b      	lsls	r3, r3, #2
 8014b9a:	18eb      	adds	r3, r5, r3
 8014b9c:	895e      	ldrh	r6, [r3, #10]
 8014b9e:	00b3      	lsls	r3, r6, #2
 8014ba0:	199b      	adds	r3, r3, r6
 8014ba2:	00db      	lsls	r3, r3, #3
 8014ba4:	18fe      	adds	r6, r7, r3
 8014ba6:	42b0      	cmp	r0, r6
 8014ba8:	d1dd      	bne.n	8014b66 <fn_08014AB4+0xb2>
 8014baa:	8ace      	ldrh	r6, [r1, #22]
 8014bac:	4546      	cmp	r6, r8
 8014bae:	d0ea      	beq.n	8014b86 <fn_08014AB4+0xd2>
 8014bb0:	0071      	lsls	r1, r6, #1
 8014bb2:	1989      	adds	r1, r1, r6
 8014bb4:	0089      	lsls	r1, r1, #2
 8014bb6:	1869      	adds	r1, r5, r1
 8014bb8:	894e      	ldrh	r6, [r1, #10]
 8014bba:	00b1      	lsls	r1, r6, #2
 8014bbc:	1989      	adds	r1, r1, r6
 8014bbe:	00c9      	lsls	r1, r1, #3
 8014bc0:	187e      	adds	r6, r7, r1
 8014bc2:	428b      	cmp	r3, r1
 8014bc4:	d1cf      	bne.n	8014b66 <fn_08014AB4+0xb2>
 8014bc6:	e7de      	b.n	8014b86 <fn_08014AB4+0xd2>
 8014bc8:	030064c4 	.word	0x030064c4
 8014bcc:	00000e0c 	.word	0x00000e0c
 8014bd0:	0000ffff 	.word	0x0000ffff
