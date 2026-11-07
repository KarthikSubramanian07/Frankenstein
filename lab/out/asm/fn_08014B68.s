fn_08014B68:
 8014b68:	b5f0      	push	{r4, r5, r6, r7, lr}
 8014b6a:	46d6      	mov	lr, sl
 8014b6c:	464f      	mov	r7, r9
 8014b6e:	4646      	mov	r6, r8
 8014b70:	b5c0      	push	{r6, r7, lr}
 8014b72:	221e      	movs	r2, #30
 8014b74:	5e83      	ldrsh	r3, [r0, r2]
 8014b76:	4689      	mov	r9, r1
 8014b78:	469a      	mov	sl, r3
 8014b7a:	2b00      	cmp	r3, #0
 8014b7c:	dd37      	ble.n	8014bee <fn_08014B68+0x86>
 8014b7e:	22e0      	movs	r2, #224	@ 0xe0
 8014b80:	4b3e      	ldr	r3, [pc, #248]	@ (8014c7c <fn_08014B68+0x114>)
 8014b82:	681b      	ldr	r3, [r3, #0]
 8014b84:	0112      	lsls	r2, r2, #4
 8014b86:	589a      	ldr	r2, [r3, r2]
 8014b88:	4694      	mov	ip, r2
 8014b8a:	6982      	ldr	r2, [r0, #24]
 8014b8c:	4690      	mov	r8, r2
 8014b8e:	22df      	movs	r2, #223	@ 0xdf
 8014b90:	0112      	lsls	r2, r2, #4
 8014b92:	589f      	ldr	r7, [r3, r2]
 8014b94:	4a3a      	ldr	r2, [pc, #232]	@ (8014c80 <fn_08014B68+0x118>)
 8014b96:	2100      	movs	r1, #0
 8014b98:	589d      	ldr	r5, [r3, r2]
 8014b9a:	e007      	b.n	8014bac <fn_08014B68+0x44>
 8014b9c:	2e00      	cmp	r6, #0
 8014b9e:	d002      	beq.n	8014ba6 <fn_08014B68+0x3e>
 8014ba0:	6872      	ldr	r2, [r6, #4]
 8014ba2:	454a      	cmp	r2, r9
 8014ba4:	dc2c      	bgt.n	8014c00 <fn_08014B68+0x98>
 8014ba6:	3101      	adds	r1, #1
 8014ba8:	4551      	cmp	r1, sl
 8014baa:	da20      	bge.n	8014bee <fn_08014B68+0x86>
 8014bac:	4643      	mov	r3, r8
 8014bae:	004c      	lsls	r4, r1, #1
 8014bb0:	5b1a      	ldrh	r2, [r3, r4]
 8014bb2:	0152      	lsls	r2, r2, #5
 8014bb4:	4462      	add	r2, ip
 8014bb6:	8a96      	ldrh	r6, [r2, #20]
 8014bb8:	0073      	lsls	r3, r6, #1
 8014bba:	199b      	adds	r3, r3, r6
 8014bbc:	009b      	lsls	r3, r3, #2
 8014bbe:	18eb      	adds	r3, r5, r3
 8014bc0:	895e      	ldrh	r6, [r3, #10]
 8014bc2:	00b3      	lsls	r3, r6, #2
 8014bc4:	199b      	adds	r3, r3, r6
 8014bc6:	00db      	lsls	r3, r3, #3
 8014bc8:	18fe      	adds	r6, r7, r3
 8014bca:	42b0      	cmp	r0, r6
 8014bcc:	d1e6      	bne.n	8014b9c <fn_08014B68+0x34>
 8014bce:	8ad6      	ldrh	r6, [r2, #22]
 8014bd0:	4a2c      	ldr	r2, [pc, #176]	@ (8014c84 <fn_08014B68+0x11c>)
 8014bd2:	4296      	cmp	r6, r2
 8014bd4:	d0e7      	beq.n	8014ba6 <fn_08014B68+0x3e>
 8014bd6:	0072      	lsls	r2, r6, #1
 8014bd8:	1992      	adds	r2, r2, r6
 8014bda:	0092      	lsls	r2, r2, #2
 8014bdc:	18aa      	adds	r2, r5, r2
 8014bde:	8956      	ldrh	r6, [r2, #10]
 8014be0:	00b2      	lsls	r2, r6, #2
 8014be2:	1992      	adds	r2, r2, r6
 8014be4:	00d2      	lsls	r2, r2, #3
 8014be6:	4293      	cmp	r3, r2
 8014be8:	d0dd      	beq.n	8014ba6 <fn_08014B68+0x3e>
 8014bea:	18be      	adds	r6, r7, r2
 8014bec:	e7d6      	b.n	8014b9c <fn_08014B68+0x34>
 8014bee:	464a      	mov	r2, r9
 8014bf0:	0010      	movs	r0, r2
 8014bf2:	bce0      	pop	{r5, r6, r7}
 8014bf4:	46ba      	mov	sl, r7
 8014bf6:	46b1      	mov	r9, r6
 8014bf8:	46a8      	mov	r8, r5
 8014bfa:	bcf0      	pop	{r4, r5, r6, r7}
 8014bfc:	bc02      	pop	{r1}
 8014bfe:	4708      	bx	r1
 8014c00:	3101      	adds	r1, #1
 8014c02:	4551      	cmp	r1, sl
 8014c04:	daf4      	bge.n	8014bf0 <fn_08014B68+0x88>
 8014c06:	4643      	mov	r3, r8
 8014c08:	3302      	adds	r3, #2
 8014c0a:	191c      	adds	r4, r3, r4
 8014c0c:	4653      	mov	r3, sl
 8014c0e:	005e      	lsls	r6, r3, #1
 8014c10:	4b1c      	ldr	r3, [pc, #112]	@ (8014c84 <fn_08014B68+0x11c>)
 8014c12:	4446      	add	r6, r8
 8014c14:	46b2      	mov	sl, r6
 8014c16:	4698      	mov	r8, r3
 8014c18:	e012      	b.n	8014c40 <fn_08014B68+0xd8>
 8014c1a:	2e00      	cmp	r6, #0
 8014c1c:	d00d      	beq.n	8014c3a <fn_08014B68+0xd2>
 8014c1e:	6871      	ldr	r1, [r6, #4]
 8014c20:	2301      	movs	r3, #1
 8014c22:	4291      	cmp	r1, r2
 8014c24:	db00      	blt.n	8014c28 <fn_08014B68+0xc0>
 8014c26:	2300      	movs	r3, #0
 8014c28:	061b      	lsls	r3, r3, #24
 8014c2a:	d006      	beq.n	8014c3a <fn_08014B68+0xd2>
 8014c2c:	2301      	movs	r3, #1
 8014c2e:	4549      	cmp	r1, r9
 8014c30:	dc00      	bgt.n	8014c34 <fn_08014B68+0xcc>
 8014c32:	2300      	movs	r3, #0
 8014c34:	061b      	lsls	r3, r3, #24
 8014c36:	d000      	beq.n	8014c3a <fn_08014B68+0xd2>
 8014c38:	000a      	movs	r2, r1
 8014c3a:	3402      	adds	r4, #2
 8014c3c:	4554      	cmp	r4, sl
 8014c3e:	d0d7      	beq.n	8014bf0 <fn_08014B68+0x88>
 8014c40:	8821      	ldrh	r1, [r4, #0]
 8014c42:	0149      	lsls	r1, r1, #5
 8014c44:	4461      	add	r1, ip
 8014c46:	8a8e      	ldrh	r6, [r1, #20]
 8014c48:	0073      	lsls	r3, r6, #1
 8014c4a:	199b      	adds	r3, r3, r6
 8014c4c:	009b      	lsls	r3, r3, #2
 8014c4e:	18eb      	adds	r3, r5, r3
 8014c50:	895e      	ldrh	r6, [r3, #10]
 8014c52:	00b3      	lsls	r3, r6, #2
 8014c54:	199b      	adds	r3, r3, r6
 8014c56:	00db      	lsls	r3, r3, #3
 8014c58:	18fe      	adds	r6, r7, r3
 8014c5a:	42b0      	cmp	r0, r6
 8014c5c:	d1dd      	bne.n	8014c1a <fn_08014B68+0xb2>
 8014c5e:	8ace      	ldrh	r6, [r1, #22]
 8014c60:	4546      	cmp	r6, r8
 8014c62:	d0ea      	beq.n	8014c3a <fn_08014B68+0xd2>
 8014c64:	0071      	lsls	r1, r6, #1
 8014c66:	1989      	adds	r1, r1, r6
 8014c68:	0089      	lsls	r1, r1, #2
 8014c6a:	1869      	adds	r1, r5, r1
 8014c6c:	894e      	ldrh	r6, [r1, #10]
 8014c6e:	00b1      	lsls	r1, r6, #2
 8014c70:	1989      	adds	r1, r1, r6
 8014c72:	00c9      	lsls	r1, r1, #3
 8014c74:	187e      	adds	r6, r7, r1
 8014c76:	428b      	cmp	r3, r1
 8014c78:	d1cf      	bne.n	8014c1a <fn_08014B68+0xb2>
 8014c7a:	e7de      	b.n	8014c3a <fn_08014B68+0xd2>
 8014c7c:	030064c4 	.word	0x030064c4
 8014c80:	00000e0c 	.word	0x00000e0c
 8014c84:	0000ffff 	.word	0x0000ffff
