fn_08014D30:
 8014d30:	b5f0      	push	{r4, r5, r6, r7, lr}
 8014d32:	46ce      	mov	lr, r9
 8014d34:	4647      	mov	r7, r8
 8014d36:	b580      	push	{r7, lr}
 8014d38:	221e      	movs	r2, #30
 8014d3a:	5e83      	ldrsh	r3, [r0, r2]
 8014d3c:	0004      	movs	r4, r0
 8014d3e:	4699      	mov	r9, r3
 8014d40:	2b00      	cmp	r3, #0
 8014d42:	dd3a      	ble.n	8014dba <fn_08014D30+0x8a>
 8014d44:	22e0      	movs	r2, #224	@ 0xe0
 8014d46:	4b21      	ldr	r3, [pc, #132]	@ (8014dcc <fn_08014D30+0x9c>)
 8014d48:	681b      	ldr	r3, [r3, #0]
 8014d4a:	0112      	lsls	r2, r2, #4
 8014d4c:	589a      	ldr	r2, [r3, r2]
 8014d4e:	4690      	mov	r8, r2
 8014d50:	6982      	ldr	r2, [r0, #24]
 8014d52:	4694      	mov	ip, r2
 8014d54:	22df      	movs	r2, #223	@ 0xdf
 8014d56:	2083      	movs	r0, #131	@ 0x83
 8014d58:	0112      	lsls	r2, r2, #4
 8014d5a:	589e      	ldr	r6, [r3, r2]
 8014d5c:	4a1c      	ldr	r2, [pc, #112]	@ (8014dd0 <fn_08014D30+0xa0>)
 8014d5e:	2100      	movs	r1, #0
 8014d60:	589d      	ldr	r5, [r3, r2]
 8014d62:	0600      	lsls	r0, r0, #24
 8014d64:	e008      	b.n	8014d78 <fn_08014D30+0x48>
 8014d66:	2f00      	cmp	r7, #0
 8014d68:	d003      	beq.n	8014d72 <fn_08014D30+0x42>
 8014d6a:	687b      	ldr	r3, [r7, #4]
 8014d6c:	4298      	cmp	r0, r3
 8014d6e:	da00      	bge.n	8014d72 <fn_08014D30+0x42>
 8014d70:	0018      	movs	r0, r3
 8014d72:	3101      	adds	r1, #1
 8014d74:	4589      	cmp	r9, r1
 8014d76:	dd22      	ble.n	8014dbe <fn_08014D30+0x8e>
 8014d78:	4662      	mov	r2, ip
 8014d7a:	004b      	lsls	r3, r1, #1
 8014d7c:	5ad2      	ldrh	r2, [r2, r3]
 8014d7e:	0152      	lsls	r2, r2, #5
 8014d80:	4442      	add	r2, r8
 8014d82:	8a97      	ldrh	r7, [r2, #20]
 8014d84:	007b      	lsls	r3, r7, #1
 8014d86:	19db      	adds	r3, r3, r7
 8014d88:	009b      	lsls	r3, r3, #2
 8014d8a:	18eb      	adds	r3, r5, r3
 8014d8c:	895f      	ldrh	r7, [r3, #10]
 8014d8e:	00bb      	lsls	r3, r7, #2
 8014d90:	19db      	adds	r3, r3, r7
 8014d92:	00db      	lsls	r3, r3, #3
 8014d94:	18f7      	adds	r7, r6, r3
 8014d96:	42bc      	cmp	r4, r7
 8014d98:	d1e5      	bne.n	8014d66 <fn_08014D30+0x36>
 8014d9a:	8ad7      	ldrh	r7, [r2, #22]
 8014d9c:	4a0d      	ldr	r2, [pc, #52]	@ (8014dd4 <fn_08014D30+0xa4>)
 8014d9e:	4297      	cmp	r7, r2
 8014da0:	d0e7      	beq.n	8014d72 <fn_08014D30+0x42>
 8014da2:	007a      	lsls	r2, r7, #1
 8014da4:	19d2      	adds	r2, r2, r7
 8014da6:	0092      	lsls	r2, r2, #2
 8014da8:	18aa      	adds	r2, r5, r2
 8014daa:	8957      	ldrh	r7, [r2, #10]
 8014dac:	00ba      	lsls	r2, r7, #2
 8014dae:	19d2      	adds	r2, r2, r7
 8014db0:	00d2      	lsls	r2, r2, #3
 8014db2:	4293      	cmp	r3, r2
 8014db4:	d0dd      	beq.n	8014d72 <fn_08014D30+0x42>
 8014db6:	18b7      	adds	r7, r6, r2
 8014db8:	e7d5      	b.n	8014d66 <fn_08014D30+0x36>
 8014dba:	2083      	movs	r0, #131	@ 0x83
 8014dbc:	0600      	lsls	r0, r0, #24
 8014dbe:	bcc0      	pop	{r6, r7}
 8014dc0:	46b9      	mov	r9, r7
 8014dc2:	46b0      	mov	r8, r6
 8014dc4:	bcf0      	pop	{r4, r5, r6, r7}
 8014dc6:	bc02      	pop	{r1}
 8014dc8:	4708      	bx	r1
 8014dca:	46c0      	nop			@ (mov r8, r8)
 8014dcc:	030064c4 	.word	0x030064c4
 8014dd0:	00000e0c 	.word	0x00000e0c
 8014dd4:	0000ffff 	.word	0x0000ffff
