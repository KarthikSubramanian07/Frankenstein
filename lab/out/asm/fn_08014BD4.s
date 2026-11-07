fn_08014BD4:
 8014bd4:	b5f0      	push	{r4, r5, r6, r7, lr}
 8014bd6:	46ce      	mov	lr, r9
 8014bd8:	4647      	mov	r7, r8
 8014bda:	b580      	push	{r7, lr}
 8014bdc:	221e      	movs	r2, #30
 8014bde:	5e83      	ldrsh	r3, [r0, r2]
 8014be0:	0004      	movs	r4, r0
 8014be2:	4699      	mov	r9, r3
 8014be4:	2b00      	cmp	r3, #0
 8014be6:	dd3a      	ble.n	8014c5e <fn_08014BD4+0x8a>
 8014be8:	22e0      	movs	r2, #224	@ 0xe0
 8014bea:	4b21      	ldr	r3, [pc, #132]	@ (8014c70 <fn_08014BD4+0x9c>)
 8014bec:	681b      	ldr	r3, [r3, #0]
 8014bee:	0112      	lsls	r2, r2, #4
 8014bf0:	589a      	ldr	r2, [r3, r2]
 8014bf2:	4690      	mov	r8, r2
 8014bf4:	6982      	ldr	r2, [r0, #24]
 8014bf6:	4694      	mov	ip, r2
 8014bf8:	22df      	movs	r2, #223	@ 0xdf
 8014bfa:	20fa      	movs	r0, #250	@ 0xfa
 8014bfc:	0112      	lsls	r2, r2, #4
 8014bfe:	589e      	ldr	r6, [r3, r2]
 8014c00:	4a1c      	ldr	r2, [pc, #112]	@ (8014c74 <fn_08014BD4+0xa0>)
 8014c02:	2100      	movs	r1, #0
 8014c04:	589d      	ldr	r5, [r3, r2]
 8014c06:	05c0      	lsls	r0, r0, #23
 8014c08:	e008      	b.n	8014c1c <fn_08014BD4+0x48>
 8014c0a:	2f00      	cmp	r7, #0
 8014c0c:	d003      	beq.n	8014c16 <fn_08014BD4+0x42>
 8014c0e:	687b      	ldr	r3, [r7, #4]
 8014c10:	4298      	cmp	r0, r3
 8014c12:	dd00      	ble.n	8014c16 <fn_08014BD4+0x42>
 8014c14:	0018      	movs	r0, r3
 8014c16:	3101      	adds	r1, #1
 8014c18:	4589      	cmp	r9, r1
 8014c1a:	dd22      	ble.n	8014c62 <fn_08014BD4+0x8e>
 8014c1c:	4662      	mov	r2, ip
 8014c1e:	004b      	lsls	r3, r1, #1
 8014c20:	5ad2      	ldrh	r2, [r2, r3]
 8014c22:	0152      	lsls	r2, r2, #5
 8014c24:	4442      	add	r2, r8
 8014c26:	8a97      	ldrh	r7, [r2, #20]
 8014c28:	007b      	lsls	r3, r7, #1
 8014c2a:	19db      	adds	r3, r3, r7
 8014c2c:	009b      	lsls	r3, r3, #2
 8014c2e:	18eb      	adds	r3, r5, r3
 8014c30:	895f      	ldrh	r7, [r3, #10]
 8014c32:	00bb      	lsls	r3, r7, #2
 8014c34:	19db      	adds	r3, r3, r7
 8014c36:	00db      	lsls	r3, r3, #3
 8014c38:	18f7      	adds	r7, r6, r3
 8014c3a:	42bc      	cmp	r4, r7
 8014c3c:	d1e5      	bne.n	8014c0a <fn_08014BD4+0x36>
 8014c3e:	8ad7      	ldrh	r7, [r2, #22]
 8014c40:	4a0d      	ldr	r2, [pc, #52]	@ (8014c78 <fn_08014BD4+0xa4>)
 8014c42:	4297      	cmp	r7, r2
 8014c44:	d0e7      	beq.n	8014c16 <fn_08014BD4+0x42>
 8014c46:	007a      	lsls	r2, r7, #1
 8014c48:	19d2      	adds	r2, r2, r7
 8014c4a:	0092      	lsls	r2, r2, #2
 8014c4c:	18aa      	adds	r2, r5, r2
 8014c4e:	8957      	ldrh	r7, [r2, #10]
 8014c50:	00ba      	lsls	r2, r7, #2
 8014c52:	19d2      	adds	r2, r2, r7
 8014c54:	00d2      	lsls	r2, r2, #3
 8014c56:	4293      	cmp	r3, r2
 8014c58:	d0dd      	beq.n	8014c16 <fn_08014BD4+0x42>
 8014c5a:	18b7      	adds	r7, r6, r2
 8014c5c:	e7d5      	b.n	8014c0a <fn_08014BD4+0x36>
 8014c5e:	20fa      	movs	r0, #250	@ 0xfa
 8014c60:	05c0      	lsls	r0, r0, #23
 8014c62:	bcc0      	pop	{r6, r7}
 8014c64:	46b9      	mov	r9, r7
 8014c66:	46b0      	mov	r8, r6
 8014c68:	bcf0      	pop	{r4, r5, r6, r7}
 8014c6a:	bc02      	pop	{r1}
 8014c6c:	4708      	bx	r1
 8014c6e:	46c0      	nop			@ (mov r8, r8)
 8014c70:	030064c4 	.word	0x030064c4
 8014c74:	00000e0c 	.word	0x00000e0c
 8014c78:	0000ffff 	.word	0x0000ffff
