fn_08014E08:
 8014e08:	b5f0      	push	{r4, r5, r6, r7, lr}
 8014e0a:	464e      	mov	r6, r9
 8014e0c:	46de      	mov	lr, fp
 8014e0e:	4657      	mov	r7, sl
 8014e10:	4645      	mov	r5, r8
 8014e12:	22df      	movs	r2, #223	@ 0xdf
 8014e14:	4b30      	ldr	r3, [pc, #192]	@ (8014ed8 <fn_08014E08+0xd0>)
 8014e16:	b5e0      	push	{r5, r6, r7, lr}
 8014e18:	681c      	ldr	r4, [r3, #0]
 8014e1a:	0112      	lsls	r2, r2, #4
 8014e1c:	0083      	lsls	r3, r0, #2
 8014e1e:	58a2      	ldr	r2, [r4, r2]
 8014e20:	181b      	adds	r3, r3, r0
 8014e22:	00db      	lsls	r3, r3, #3
 8014e24:	18d3      	adds	r3, r2, r3
 8014e26:	221e      	movs	r2, #30
 8014e28:	5e9e      	ldrsh	r6, [r3, r2]
 8014e2a:	b083      	sub	sp, #12
 8014e2c:	2e00      	cmp	r6, #0
 8014e2e:	dd47      	ble.n	8014ec0 <fn_08014E08+0xb8>
 8014e30:	22e0      	movs	r2, #224	@ 0xe0
 8014e32:	27fa      	movs	r7, #250	@ 0xfa
 8014e34:	699b      	ldr	r3, [r3, #24]
 8014e36:	0018      	movs	r0, r3
 8014e38:	4b28      	ldr	r3, [pc, #160]	@ (8014edc <fn_08014E08+0xd4>)
 8014e3a:	681b      	ldr	r3, [r3, #0]
 8014e3c:	0112      	lsls	r2, r2, #4
 8014e3e:	58a2      	ldr	r2, [r4, r2]
 8014e40:	9301      	str	r3, [sp, #4]
 8014e42:	4b27      	ldr	r3, [pc, #156]	@ (8014ee0 <fn_08014E08+0xd8>)
 8014e44:	4693      	mov	fp, r2
 8014e46:	469c      	mov	ip, r3
 8014e48:	2200      	movs	r2, #0
 8014e4a:	05ff      	lsls	r7, r7, #23
 8014e4c:	e01f      	b.n	8014e8e <fn_08014E08+0x86>
 8014e4e:	4925      	ldr	r1, [pc, #148]	@ (8014ee4 <fn_08014E08+0xdc>)
 8014e50:	5861      	ldr	r1, [r4, r1]
 8014e52:	18cb      	adds	r3, r1, r3
 8014e54:	889b      	ldrh	r3, [r3, #4]
 8014e56:	2b00      	cmp	r3, #0
 8014e58:	d005      	beq.n	8014e66 <fn_08014E08+0x5e>
 8014e5a:	9901      	ldr	r1, [sp, #4]
 8014e5c:	009b      	lsls	r3, r3, #2
 8014e5e:	585b      	ldr	r3, [r3, r1]
 8014e60:	429f      	cmp	r7, r3
 8014e62:	dd00      	ble.n	8014e66 <fn_08014E08+0x5e>
 8014e64:	001f      	movs	r7, r3
 8014e66:	006b      	lsls	r3, r5, #1
 8014e68:	195b      	adds	r3, r3, r5
 8014e6a:	009b      	lsls	r3, r3, #2
 8014e6c:	45a9      	cmp	r9, r5
 8014e6e:	d923      	bls.n	8014eb8 <fn_08014E08+0xb0>
 8014e70:	491c      	ldr	r1, [pc, #112]	@ (8014ee4 <fn_08014E08+0xdc>)
 8014e72:	5861      	ldr	r1, [r4, r1]
 8014e74:	18cb      	adds	r3, r1, r3
 8014e76:	889b      	ldrh	r3, [r3, #4]
 8014e78:	2b00      	cmp	r3, #0
 8014e7a:	d005      	beq.n	8014e88 <fn_08014E08+0x80>
 8014e7c:	9901      	ldr	r1, [sp, #4]
 8014e7e:	009b      	lsls	r3, r3, #2
 8014e80:	585b      	ldr	r3, [r3, r1]
 8014e82:	429f      	cmp	r7, r3
 8014e84:	dd00      	ble.n	8014e88 <fn_08014E08+0x80>
 8014e86:	001f      	movs	r7, r3
 8014e88:	3201      	adds	r2, #1
 8014e8a:	42b2      	cmp	r2, r6
 8014e8c:	da1a      	bge.n	8014ec4 <fn_08014E08+0xbc>
 8014e8e:	0053      	lsls	r3, r2, #1
 8014e90:	5ac3      	ldrh	r3, [r0, r3]
 8014e92:	015b      	lsls	r3, r3, #5
 8014e94:	445b      	add	r3, fp
 8014e96:	8add      	ldrh	r5, [r3, #22]
 8014e98:	4565      	cmp	r5, ip
 8014e9a:	d0f5      	beq.n	8014e88 <fn_08014E08+0x80>
 8014e9c:	8a99      	ldrh	r1, [r3, #20]
 8014e9e:	23e1      	movs	r3, #225	@ 0xe1
 8014ea0:	011b      	lsls	r3, r3, #4
 8014ea2:	58e3      	ldr	r3, [r4, r3]
 8014ea4:	4699      	mov	r9, r3
 8014ea6:	004b      	lsls	r3, r1, #1
 8014ea8:	185b      	adds	r3, r3, r1
 8014eaa:	009b      	lsls	r3, r3, #2
 8014eac:	4549      	cmp	r1, r9
 8014eae:	d3ce      	bcc.n	8014e4e <fn_08014E08+0x46>
 8014eb0:	490d      	ldr	r1, [pc, #52]	@ (8014ee8 <fn_08014E08+0xe0>)
 8014eb2:	5861      	ldr	r1, [r4, r1]
 8014eb4:	18cb      	adds	r3, r1, r3
 8014eb6:	e7cd      	b.n	8014e54 <fn_08014E08+0x4c>
 8014eb8:	490b      	ldr	r1, [pc, #44]	@ (8014ee8 <fn_08014E08+0xe0>)
 8014eba:	5861      	ldr	r1, [r4, r1]
 8014ebc:	18cb      	adds	r3, r1, r3
 8014ebe:	e7da      	b.n	8014e76 <fn_08014E08+0x6e>
 8014ec0:	27fa      	movs	r7, #250	@ 0xfa
 8014ec2:	05ff      	lsls	r7, r7, #23
 8014ec4:	0038      	movs	r0, r7
 8014ec6:	b003      	add	sp, #12
 8014ec8:	bcf0      	pop	{r4, r5, r6, r7}
 8014eca:	46bb      	mov	fp, r7
 8014ecc:	46b2      	mov	sl, r6
 8014ece:	46a9      	mov	r9, r5
 8014ed0:	46a0      	mov	r8, r4
 8014ed2:	bcf0      	pop	{r4, r5, r6, r7}
 8014ed4:	bc02      	pop	{r1}
 8014ed6:	4708      	bx	r1
 8014ed8:	030064c4 	.word	0x030064c4	@ data_030064C4
 8014edc:	030065c4 	.word	0x030065c4	@ data_030065C4
 8014ee0:	0000ffff 	.word	0x0000ffff
 8014ee4:	00000e14 	.word	0x00000e14
 8014ee8:	00000e0c 	.word	0x00000e0c
