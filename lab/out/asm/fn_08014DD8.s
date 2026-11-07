fn_08014DD8:
 8014dd8:	b5f0      	push	{r4, r5, r6, r7, lr}
 8014dda:	464e      	mov	r6, r9
 8014ddc:	46de      	mov	lr, fp
 8014dde:	4657      	mov	r7, sl
 8014de0:	4645      	mov	r5, r8
 8014de2:	22df      	movs	r2, #223	@ 0xdf
 8014de4:	4b30      	ldr	r3, [pc, #192]	@ (8014ea8 <fn_08014DD8+0xd0>)
 8014de6:	b5e0      	push	{r5, r6, r7, lr}
 8014de8:	681c      	ldr	r4, [r3, #0]
 8014dea:	0112      	lsls	r2, r2, #4
 8014dec:	0083      	lsls	r3, r0, #2
 8014dee:	58a2      	ldr	r2, [r4, r2]
 8014df0:	181b      	adds	r3, r3, r0
 8014df2:	00db      	lsls	r3, r3, #3
 8014df4:	18d3      	adds	r3, r2, r3
 8014df6:	221e      	movs	r2, #30
 8014df8:	5e9e      	ldrsh	r6, [r3, r2]
 8014dfa:	b083      	sub	sp, #12
 8014dfc:	2e00      	cmp	r6, #0
 8014dfe:	dd47      	ble.n	8014e90 <fn_08014DD8+0xb8>
 8014e00:	22e0      	movs	r2, #224	@ 0xe0
 8014e02:	27fa      	movs	r7, #250	@ 0xfa
 8014e04:	699b      	ldr	r3, [r3, #24]
 8014e06:	0018      	movs	r0, r3
 8014e08:	4b28      	ldr	r3, [pc, #160]	@ (8014eac <fn_08014DD8+0xd4>)
 8014e0a:	681b      	ldr	r3, [r3, #0]
 8014e0c:	0112      	lsls	r2, r2, #4
 8014e0e:	58a2      	ldr	r2, [r4, r2]
 8014e10:	9301      	str	r3, [sp, #4]
 8014e12:	4b27      	ldr	r3, [pc, #156]	@ (8014eb0 <fn_08014DD8+0xd8>)
 8014e14:	4693      	mov	fp, r2
 8014e16:	469c      	mov	ip, r3
 8014e18:	2200      	movs	r2, #0
 8014e1a:	05ff      	lsls	r7, r7, #23
 8014e1c:	e01f      	b.n	8014e5e <fn_08014DD8+0x86>
 8014e1e:	4925      	ldr	r1, [pc, #148]	@ (8014eb4 <fn_08014DD8+0xdc>)
 8014e20:	5861      	ldr	r1, [r4, r1]
 8014e22:	18cb      	adds	r3, r1, r3
 8014e24:	88db      	ldrh	r3, [r3, #6]
 8014e26:	2b00      	cmp	r3, #0
 8014e28:	d005      	beq.n	8014e36 <fn_08014DD8+0x5e>
 8014e2a:	9901      	ldr	r1, [sp, #4]
 8014e2c:	009b      	lsls	r3, r3, #2
 8014e2e:	585b      	ldr	r3, [r3, r1]
 8014e30:	429f      	cmp	r7, r3
 8014e32:	dd00      	ble.n	8014e36 <fn_08014DD8+0x5e>
 8014e34:	001f      	movs	r7, r3
 8014e36:	006b      	lsls	r3, r5, #1
 8014e38:	195b      	adds	r3, r3, r5
 8014e3a:	009b      	lsls	r3, r3, #2
 8014e3c:	45a9      	cmp	r9, r5
 8014e3e:	d923      	bls.n	8014e88 <fn_08014DD8+0xb0>
 8014e40:	491c      	ldr	r1, [pc, #112]	@ (8014eb4 <fn_08014DD8+0xdc>)
 8014e42:	5861      	ldr	r1, [r4, r1]
 8014e44:	18cb      	adds	r3, r1, r3
 8014e46:	88db      	ldrh	r3, [r3, #6]
 8014e48:	2b00      	cmp	r3, #0
 8014e4a:	d005      	beq.n	8014e58 <fn_08014DD8+0x80>
 8014e4c:	9901      	ldr	r1, [sp, #4]
 8014e4e:	009b      	lsls	r3, r3, #2
 8014e50:	585b      	ldr	r3, [r3, r1]
 8014e52:	429f      	cmp	r7, r3
 8014e54:	dd00      	ble.n	8014e58 <fn_08014DD8+0x80>
 8014e56:	001f      	movs	r7, r3
 8014e58:	3201      	adds	r2, #1
 8014e5a:	42b2      	cmp	r2, r6
 8014e5c:	da1a      	bge.n	8014e94 <fn_08014DD8+0xbc>
 8014e5e:	0053      	lsls	r3, r2, #1
 8014e60:	5ac3      	ldrh	r3, [r0, r3]
 8014e62:	015b      	lsls	r3, r3, #5
 8014e64:	445b      	add	r3, fp
 8014e66:	8add      	ldrh	r5, [r3, #22]
 8014e68:	4565      	cmp	r5, ip
 8014e6a:	d0f5      	beq.n	8014e58 <fn_08014DD8+0x80>
 8014e6c:	8a99      	ldrh	r1, [r3, #20]
 8014e6e:	23e1      	movs	r3, #225	@ 0xe1
 8014e70:	011b      	lsls	r3, r3, #4
 8014e72:	58e3      	ldr	r3, [r4, r3]
 8014e74:	4699      	mov	r9, r3
 8014e76:	004b      	lsls	r3, r1, #1
 8014e78:	185b      	adds	r3, r3, r1
 8014e7a:	009b      	lsls	r3, r3, #2
 8014e7c:	4549      	cmp	r1, r9
 8014e7e:	d3ce      	bcc.n	8014e1e <fn_08014DD8+0x46>
 8014e80:	490d      	ldr	r1, [pc, #52]	@ (8014eb8 <fn_08014DD8+0xe0>)
 8014e82:	5861      	ldr	r1, [r4, r1]
 8014e84:	18cb      	adds	r3, r1, r3
 8014e86:	e7cd      	b.n	8014e24 <fn_08014DD8+0x4c>
 8014e88:	490b      	ldr	r1, [pc, #44]	@ (8014eb8 <fn_08014DD8+0xe0>)
 8014e8a:	5861      	ldr	r1, [r4, r1]
 8014e8c:	18cb      	adds	r3, r1, r3
 8014e8e:	e7da      	b.n	8014e46 <fn_08014DD8+0x6e>
 8014e90:	27fa      	movs	r7, #250	@ 0xfa
 8014e92:	05ff      	lsls	r7, r7, #23
 8014e94:	0038      	movs	r0, r7
 8014e96:	b003      	add	sp, #12
 8014e98:	bcf0      	pop	{r4, r5, r6, r7}
 8014e9a:	46bb      	mov	fp, r7
 8014e9c:	46b2      	mov	sl, r6
 8014e9e:	46a9      	mov	r9, r5
 8014ea0:	46a0      	mov	r8, r4
 8014ea2:	bcf0      	pop	{r4, r5, r6, r7}
 8014ea4:	bc02      	pop	{r1}
 8014ea6:	4708      	bx	r1
 8014ea8:	030064c4 	.word	0x030064c4
 8014eac:	030065c4 	.word	0x030065c4
 8014eb0:	0000ffff 	.word	0x0000ffff
 8014eb4:	00000e14 	.word	0x00000e14
 8014eb8:	00000e0c 	.word	0x00000e0c
