fn_08014C7C:
 8014c7c:	b5f0      	push	{r4, r5, r6, r7, lr}
 8014c7e:	46ce      	mov	lr, r9
 8014c80:	4647      	mov	r7, r8
 8014c82:	b580      	push	{r7, lr}
 8014c84:	221e      	movs	r2, #30
 8014c86:	5e83      	ldrsh	r3, [r0, r2]
 8014c88:	0004      	movs	r4, r0
 8014c8a:	4699      	mov	r9, r3
 8014c8c:	2b00      	cmp	r3, #0
 8014c8e:	dd3a      	ble.n	8014d06 <fn_08014C7C+0x8a>
 8014c90:	22e0      	movs	r2, #224	@ 0xe0
 8014c92:	4b21      	ldr	r3, [pc, #132]	@ (8014d18 <fn_08014C7C+0x9c>)
 8014c94:	681b      	ldr	r3, [r3, #0]
 8014c96:	0112      	lsls	r2, r2, #4
 8014c98:	589a      	ldr	r2, [r3, r2]
 8014c9a:	4690      	mov	r8, r2
 8014c9c:	6982      	ldr	r2, [r0, #24]
 8014c9e:	4694      	mov	ip, r2
 8014ca0:	22df      	movs	r2, #223	@ 0xdf
 8014ca2:	2083      	movs	r0, #131	@ 0x83
 8014ca4:	0112      	lsls	r2, r2, #4
 8014ca6:	589e      	ldr	r6, [r3, r2]
 8014ca8:	4a1c      	ldr	r2, [pc, #112]	@ (8014d1c <fn_08014C7C+0xa0>)
 8014caa:	2100      	movs	r1, #0
 8014cac:	589d      	ldr	r5, [r3, r2]
 8014cae:	0600      	lsls	r0, r0, #24
 8014cb0:	e008      	b.n	8014cc4 <fn_08014C7C+0x48>
 8014cb2:	2f00      	cmp	r7, #0
 8014cb4:	d003      	beq.n	8014cbe <fn_08014C7C+0x42>
 8014cb6:	687b      	ldr	r3, [r7, #4]
 8014cb8:	4298      	cmp	r0, r3
 8014cba:	da00      	bge.n	8014cbe <fn_08014C7C+0x42>
 8014cbc:	0018      	movs	r0, r3
 8014cbe:	3101      	adds	r1, #1
 8014cc0:	4589      	cmp	r9, r1
 8014cc2:	dd22      	ble.n	8014d0a <fn_08014C7C+0x8e>
 8014cc4:	4662      	mov	r2, ip
 8014cc6:	004b      	lsls	r3, r1, #1
 8014cc8:	5ad2      	ldrh	r2, [r2, r3]
 8014cca:	0152      	lsls	r2, r2, #5
 8014ccc:	4442      	add	r2, r8
 8014cce:	8a97      	ldrh	r7, [r2, #20]
 8014cd0:	007b      	lsls	r3, r7, #1
 8014cd2:	19db      	adds	r3, r3, r7
 8014cd4:	009b      	lsls	r3, r3, #2
 8014cd6:	18eb      	adds	r3, r5, r3
 8014cd8:	895f      	ldrh	r7, [r3, #10]
 8014cda:	00bb      	lsls	r3, r7, #2
 8014cdc:	19db      	adds	r3, r3, r7
 8014cde:	00db      	lsls	r3, r3, #3
 8014ce0:	18f7      	adds	r7, r6, r3
 8014ce2:	42bc      	cmp	r4, r7
 8014ce4:	d1e5      	bne.n	8014cb2 <fn_08014C7C+0x36>
 8014ce6:	8ad7      	ldrh	r7, [r2, #22]
 8014ce8:	4a0d      	ldr	r2, [pc, #52]	@ (8014d20 <fn_08014C7C+0xa4>)
 8014cea:	4297      	cmp	r7, r2
 8014cec:	d0e7      	beq.n	8014cbe <fn_08014C7C+0x42>
 8014cee:	007a      	lsls	r2, r7, #1
 8014cf0:	19d2      	adds	r2, r2, r7
 8014cf2:	0092      	lsls	r2, r2, #2
 8014cf4:	18aa      	adds	r2, r5, r2
 8014cf6:	8957      	ldrh	r7, [r2, #10]
 8014cf8:	00ba      	lsls	r2, r7, #2
 8014cfa:	19d2      	adds	r2, r2, r7
 8014cfc:	00d2      	lsls	r2, r2, #3
 8014cfe:	4293      	cmp	r3, r2
 8014d00:	d0dd      	beq.n	8014cbe <fn_08014C7C+0x42>
 8014d02:	18b7      	adds	r7, r6, r2
 8014d04:	e7d5      	b.n	8014cb2 <fn_08014C7C+0x36>
 8014d06:	2083      	movs	r0, #131	@ 0x83
 8014d08:	0600      	lsls	r0, r0, #24
 8014d0a:	bcc0      	pop	{r6, r7}
 8014d0c:	46b9      	mov	r9, r7
 8014d0e:	46b0      	mov	r8, r6
 8014d10:	bcf0      	pop	{r4, r5, r6, r7}
 8014d12:	bc02      	pop	{r1}
 8014d14:	4708      	bx	r1
 8014d16:	46c0      	nop			@ (mov r8, r8)
 8014d18:	030064c4 	.word	0x030064c4	@ data_030064C4
 8014d1c:	00000e0c 	.word	0x00000e0c
 8014d20:	0000ffff 	.word	0x0000ffff
