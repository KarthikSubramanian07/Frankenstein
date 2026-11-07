fn_08014EBC:
 8014ebc:	b5f0      	push	{r4, r5, r6, r7, lr}
 8014ebe:	464e      	mov	r6, r9
 8014ec0:	46de      	mov	lr, fp
 8014ec2:	4657      	mov	r7, sl
 8014ec4:	4645      	mov	r5, r8
 8014ec6:	22df      	movs	r2, #223	@ 0xdf
 8014ec8:	4b30      	ldr	r3, [pc, #192]	@ (8014f8c <fn_08014EBC+0xd0>)
 8014eca:	b5e0      	push	{r5, r6, r7, lr}
 8014ecc:	681c      	ldr	r4, [r3, #0]
 8014ece:	0112      	lsls	r2, r2, #4
 8014ed0:	0083      	lsls	r3, r0, #2
 8014ed2:	58a2      	ldr	r2, [r4, r2]
 8014ed4:	181b      	adds	r3, r3, r0
 8014ed6:	00db      	lsls	r3, r3, #3
 8014ed8:	18d3      	adds	r3, r2, r3
 8014eda:	221e      	movs	r2, #30
 8014edc:	5e9e      	ldrsh	r6, [r3, r2]
 8014ede:	b083      	sub	sp, #12
 8014ee0:	2e00      	cmp	r6, #0
 8014ee2:	dd47      	ble.n	8014f74 <fn_08014EBC+0xb8>
 8014ee4:	22e0      	movs	r2, #224	@ 0xe0
 8014ee6:	27fa      	movs	r7, #250	@ 0xfa
 8014ee8:	699b      	ldr	r3, [r3, #24]
 8014eea:	0018      	movs	r0, r3
 8014eec:	4b28      	ldr	r3, [pc, #160]	@ (8014f90 <fn_08014EBC+0xd4>)
 8014eee:	681b      	ldr	r3, [r3, #0]
 8014ef0:	0112      	lsls	r2, r2, #4
 8014ef2:	58a2      	ldr	r2, [r4, r2]
 8014ef4:	9301      	str	r3, [sp, #4]
 8014ef6:	4b27      	ldr	r3, [pc, #156]	@ (8014f94 <fn_08014EBC+0xd8>)
 8014ef8:	4693      	mov	fp, r2
 8014efa:	469c      	mov	ip, r3
 8014efc:	2200      	movs	r2, #0
 8014efe:	05ff      	lsls	r7, r7, #23
 8014f00:	e01f      	b.n	8014f42 <fn_08014EBC+0x86>
 8014f02:	4925      	ldr	r1, [pc, #148]	@ (8014f98 <fn_08014EBC+0xdc>)
 8014f04:	5861      	ldr	r1, [r4, r1]
 8014f06:	18cb      	adds	r3, r1, r3
 8014f08:	889b      	ldrh	r3, [r3, #4]
 8014f0a:	2b00      	cmp	r3, #0
 8014f0c:	d005      	beq.n	8014f1a <fn_08014EBC+0x5e>
 8014f0e:	9901      	ldr	r1, [sp, #4]
 8014f10:	009b      	lsls	r3, r3, #2
 8014f12:	585b      	ldr	r3, [r3, r1]
 8014f14:	429f      	cmp	r7, r3
 8014f16:	dd00      	ble.n	8014f1a <fn_08014EBC+0x5e>
 8014f18:	001f      	movs	r7, r3
 8014f1a:	006b      	lsls	r3, r5, #1
 8014f1c:	195b      	adds	r3, r3, r5
 8014f1e:	009b      	lsls	r3, r3, #2
 8014f20:	45a9      	cmp	r9, r5
 8014f22:	d923      	bls.n	8014f6c <fn_08014EBC+0xb0>
 8014f24:	491c      	ldr	r1, [pc, #112]	@ (8014f98 <fn_08014EBC+0xdc>)
 8014f26:	5861      	ldr	r1, [r4, r1]
 8014f28:	18cb      	adds	r3, r1, r3
 8014f2a:	889b      	ldrh	r3, [r3, #4]
 8014f2c:	2b00      	cmp	r3, #0
 8014f2e:	d005      	beq.n	8014f3c <fn_08014EBC+0x80>
 8014f30:	9901      	ldr	r1, [sp, #4]
 8014f32:	009b      	lsls	r3, r3, #2
 8014f34:	585b      	ldr	r3, [r3, r1]
 8014f36:	429f      	cmp	r7, r3
 8014f38:	dd00      	ble.n	8014f3c <fn_08014EBC+0x80>
 8014f3a:	001f      	movs	r7, r3
 8014f3c:	3201      	adds	r2, #1
 8014f3e:	42b2      	cmp	r2, r6
 8014f40:	da1a      	bge.n	8014f78 <fn_08014EBC+0xbc>
 8014f42:	0053      	lsls	r3, r2, #1
 8014f44:	5ac3      	ldrh	r3, [r0, r3]
 8014f46:	015b      	lsls	r3, r3, #5
 8014f48:	445b      	add	r3, fp
 8014f4a:	8add      	ldrh	r5, [r3, #22]
 8014f4c:	4565      	cmp	r5, ip
 8014f4e:	d0f5      	beq.n	8014f3c <fn_08014EBC+0x80>
 8014f50:	8a99      	ldrh	r1, [r3, #20]
 8014f52:	23e1      	movs	r3, #225	@ 0xe1
 8014f54:	011b      	lsls	r3, r3, #4
 8014f56:	58e3      	ldr	r3, [r4, r3]
 8014f58:	4699      	mov	r9, r3
 8014f5a:	004b      	lsls	r3, r1, #1
 8014f5c:	185b      	adds	r3, r3, r1
 8014f5e:	009b      	lsls	r3, r3, #2
 8014f60:	4549      	cmp	r1, r9
 8014f62:	d3ce      	bcc.n	8014f02 <fn_08014EBC+0x46>
 8014f64:	490d      	ldr	r1, [pc, #52]	@ (8014f9c <fn_08014EBC+0xe0>)
 8014f66:	5861      	ldr	r1, [r4, r1]
 8014f68:	18cb      	adds	r3, r1, r3
 8014f6a:	e7cd      	b.n	8014f08 <fn_08014EBC+0x4c>
 8014f6c:	490b      	ldr	r1, [pc, #44]	@ (8014f9c <fn_08014EBC+0xe0>)
 8014f6e:	5861      	ldr	r1, [r4, r1]
 8014f70:	18cb      	adds	r3, r1, r3
 8014f72:	e7da      	b.n	8014f2a <fn_08014EBC+0x6e>
 8014f74:	27fa      	movs	r7, #250	@ 0xfa
 8014f76:	05ff      	lsls	r7, r7, #23
 8014f78:	0038      	movs	r0, r7
 8014f7a:	b003      	add	sp, #12
 8014f7c:	bcf0      	pop	{r4, r5, r6, r7}
 8014f7e:	46bb      	mov	fp, r7
 8014f80:	46b2      	mov	sl, r6
 8014f82:	46a9      	mov	r9, r5
 8014f84:	46a0      	mov	r8, r4
 8014f86:	bcf0      	pop	{r4, r5, r6, r7}
 8014f88:	bc02      	pop	{r1}
 8014f8a:	4708      	bx	r1
 8014f8c:	030064c4 	.word	0x030064c4
 8014f90:	030065c4 	.word	0x030065c4
 8014f94:	0000ffff 	.word	0x0000ffff
 8014f98:	00000e14 	.word	0x00000e14
 8014f9c:	00000e0c 	.word	0x00000e0c
