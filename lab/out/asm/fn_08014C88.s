fn_08014C88:
 8014c88:	b5f0      	push	{r4, r5, r6, r7, lr}
 8014c8a:	46ce      	mov	lr, r9
 8014c8c:	4647      	mov	r7, r8
 8014c8e:	b580      	push	{r7, lr}
 8014c90:	221e      	movs	r2, #30
 8014c92:	5e83      	ldrsh	r3, [r0, r2]
 8014c94:	0004      	movs	r4, r0
 8014c96:	4699      	mov	r9, r3
 8014c98:	2b00      	cmp	r3, #0
 8014c9a:	dd3a      	ble.n	8014d12 <fn_08014C88+0x8a>
 8014c9c:	22e0      	movs	r2, #224	@ 0xe0
 8014c9e:	4b21      	ldr	r3, [pc, #132]	@ (8014d24 <fn_08014C88+0x9c>)
 8014ca0:	681b      	ldr	r3, [r3, #0]
 8014ca2:	0112      	lsls	r2, r2, #4
 8014ca4:	589a      	ldr	r2, [r3, r2]
 8014ca6:	4690      	mov	r8, r2
 8014ca8:	6982      	ldr	r2, [r0, #24]
 8014caa:	4694      	mov	ip, r2
 8014cac:	22df      	movs	r2, #223	@ 0xdf
 8014cae:	20fa      	movs	r0, #250	@ 0xfa
 8014cb0:	0112      	lsls	r2, r2, #4
 8014cb2:	589e      	ldr	r6, [r3, r2]
 8014cb4:	4a1c      	ldr	r2, [pc, #112]	@ (8014d28 <fn_08014C88+0xa0>)
 8014cb6:	2100      	movs	r1, #0
 8014cb8:	589d      	ldr	r5, [r3, r2]
 8014cba:	05c0      	lsls	r0, r0, #23
 8014cbc:	e008      	b.n	8014cd0 <fn_08014C88+0x48>
 8014cbe:	2f00      	cmp	r7, #0
 8014cc0:	d003      	beq.n	8014cca <fn_08014C88+0x42>
 8014cc2:	687b      	ldr	r3, [r7, #4]
 8014cc4:	4298      	cmp	r0, r3
 8014cc6:	dd00      	ble.n	8014cca <fn_08014C88+0x42>
 8014cc8:	0018      	movs	r0, r3
 8014cca:	3101      	adds	r1, #1
 8014ccc:	4589      	cmp	r9, r1
 8014cce:	dd22      	ble.n	8014d16 <fn_08014C88+0x8e>
 8014cd0:	4662      	mov	r2, ip
 8014cd2:	004b      	lsls	r3, r1, #1
 8014cd4:	5ad2      	ldrh	r2, [r2, r3]
 8014cd6:	0152      	lsls	r2, r2, #5
 8014cd8:	4442      	add	r2, r8
 8014cda:	8a97      	ldrh	r7, [r2, #20]
 8014cdc:	007b      	lsls	r3, r7, #1
 8014cde:	19db      	adds	r3, r3, r7
 8014ce0:	009b      	lsls	r3, r3, #2
 8014ce2:	18eb      	adds	r3, r5, r3
 8014ce4:	895f      	ldrh	r7, [r3, #10]
 8014ce6:	00bb      	lsls	r3, r7, #2
 8014ce8:	19db      	adds	r3, r3, r7
 8014cea:	00db      	lsls	r3, r3, #3
 8014cec:	18f7      	adds	r7, r6, r3
 8014cee:	42bc      	cmp	r4, r7
 8014cf0:	d1e5      	bne.n	8014cbe <fn_08014C88+0x36>
 8014cf2:	8ad7      	ldrh	r7, [r2, #22]
 8014cf4:	4a0d      	ldr	r2, [pc, #52]	@ (8014d2c <fn_08014C88+0xa4>)
 8014cf6:	4297      	cmp	r7, r2
 8014cf8:	d0e7      	beq.n	8014cca <fn_08014C88+0x42>
 8014cfa:	007a      	lsls	r2, r7, #1
 8014cfc:	19d2      	adds	r2, r2, r7
 8014cfe:	0092      	lsls	r2, r2, #2
 8014d00:	18aa      	adds	r2, r5, r2
 8014d02:	8957      	ldrh	r7, [r2, #10]
 8014d04:	00ba      	lsls	r2, r7, #2
 8014d06:	19d2      	adds	r2, r2, r7
 8014d08:	00d2      	lsls	r2, r2, #3
 8014d0a:	4293      	cmp	r3, r2
 8014d0c:	d0dd      	beq.n	8014cca <fn_08014C88+0x42>
 8014d0e:	18b7      	adds	r7, r6, r2
 8014d10:	e7d5      	b.n	8014cbe <fn_08014C88+0x36>
 8014d12:	20fa      	movs	r0, #250	@ 0xfa
 8014d14:	05c0      	lsls	r0, r0, #23
 8014d16:	bcc0      	pop	{r6, r7}
 8014d18:	46b9      	mov	r9, r7
 8014d1a:	46b0      	mov	r8, r6
 8014d1c:	bcf0      	pop	{r4, r5, r6, r7}
 8014d1e:	bc02      	pop	{r1}
 8014d20:	4708      	bx	r1
 8014d22:	46c0      	nop			@ (mov r8, r8)
 8014d24:	030064c4 	.word	0x030064c4
 8014d28:	00000e0c 	.word	0x00000e0c
 8014d2c:	0000ffff 	.word	0x0000ffff
