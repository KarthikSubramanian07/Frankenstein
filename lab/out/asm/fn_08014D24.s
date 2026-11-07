fn_08014D24:
 8014d24:	b5f0      	push	{r4, r5, r6, r7, lr}
 8014d26:	464e      	mov	r6, r9
 8014d28:	46de      	mov	lr, fp
 8014d2a:	4657      	mov	r7, sl
 8014d2c:	4645      	mov	r5, r8
 8014d2e:	22df      	movs	r2, #223	@ 0xdf
 8014d30:	4b30      	ldr	r3, [pc, #192]	@ (8014df4 <fn_08014D24+0xd0>)
 8014d32:	b5e0      	push	{r5, r6, r7, lr}
 8014d34:	681c      	ldr	r4, [r3, #0]
 8014d36:	0112      	lsls	r2, r2, #4
 8014d38:	0083      	lsls	r3, r0, #2
 8014d3a:	58a2      	ldr	r2, [r4, r2]
 8014d3c:	181b      	adds	r3, r3, r0
 8014d3e:	00db      	lsls	r3, r3, #3
 8014d40:	18d3      	adds	r3, r2, r3
 8014d42:	221e      	movs	r2, #30
 8014d44:	5e9e      	ldrsh	r6, [r3, r2]
 8014d46:	b083      	sub	sp, #12
 8014d48:	2e00      	cmp	r6, #0
 8014d4a:	dd47      	ble.n	8014ddc <fn_08014D24+0xb8>
 8014d4c:	22e0      	movs	r2, #224	@ 0xe0
 8014d4e:	27fa      	movs	r7, #250	@ 0xfa
 8014d50:	699b      	ldr	r3, [r3, #24]
 8014d52:	0018      	movs	r0, r3
 8014d54:	4b28      	ldr	r3, [pc, #160]	@ (8014df8 <fn_08014D24+0xd4>)
 8014d56:	681b      	ldr	r3, [r3, #0]
 8014d58:	0112      	lsls	r2, r2, #4
 8014d5a:	58a2      	ldr	r2, [r4, r2]
 8014d5c:	9301      	str	r3, [sp, #4]
 8014d5e:	4b27      	ldr	r3, [pc, #156]	@ (8014dfc <fn_08014D24+0xd8>)
 8014d60:	4693      	mov	fp, r2
 8014d62:	469c      	mov	ip, r3
 8014d64:	2200      	movs	r2, #0
 8014d66:	05ff      	lsls	r7, r7, #23
 8014d68:	e01f      	b.n	8014daa <fn_08014D24+0x86>
 8014d6a:	4925      	ldr	r1, [pc, #148]	@ (8014e00 <fn_08014D24+0xdc>)
 8014d6c:	5861      	ldr	r1, [r4, r1]
 8014d6e:	18cb      	adds	r3, r1, r3
 8014d70:	88db      	ldrh	r3, [r3, #6]
 8014d72:	2b00      	cmp	r3, #0
 8014d74:	d005      	beq.n	8014d82 <fn_08014D24+0x5e>
 8014d76:	9901      	ldr	r1, [sp, #4]
 8014d78:	009b      	lsls	r3, r3, #2
 8014d7a:	585b      	ldr	r3, [r3, r1]
 8014d7c:	429f      	cmp	r7, r3
 8014d7e:	dd00      	ble.n	8014d82 <fn_08014D24+0x5e>
 8014d80:	001f      	movs	r7, r3
 8014d82:	006b      	lsls	r3, r5, #1
 8014d84:	195b      	adds	r3, r3, r5
 8014d86:	009b      	lsls	r3, r3, #2
 8014d88:	45a9      	cmp	r9, r5
 8014d8a:	d923      	bls.n	8014dd4 <fn_08014D24+0xb0>
 8014d8c:	491c      	ldr	r1, [pc, #112]	@ (8014e00 <fn_08014D24+0xdc>)
 8014d8e:	5861      	ldr	r1, [r4, r1]
 8014d90:	18cb      	adds	r3, r1, r3
 8014d92:	88db      	ldrh	r3, [r3, #6]
 8014d94:	2b00      	cmp	r3, #0
 8014d96:	d005      	beq.n	8014da4 <fn_08014D24+0x80>
 8014d98:	9901      	ldr	r1, [sp, #4]
 8014d9a:	009b      	lsls	r3, r3, #2
 8014d9c:	585b      	ldr	r3, [r3, r1]
 8014d9e:	429f      	cmp	r7, r3
 8014da0:	dd00      	ble.n	8014da4 <fn_08014D24+0x80>
 8014da2:	001f      	movs	r7, r3
 8014da4:	3201      	adds	r2, #1
 8014da6:	42b2      	cmp	r2, r6
 8014da8:	da1a      	bge.n	8014de0 <fn_08014D24+0xbc>
 8014daa:	0053      	lsls	r3, r2, #1
 8014dac:	5ac3      	ldrh	r3, [r0, r3]
 8014dae:	015b      	lsls	r3, r3, #5
 8014db0:	445b      	add	r3, fp
 8014db2:	8add      	ldrh	r5, [r3, #22]
 8014db4:	4565      	cmp	r5, ip
 8014db6:	d0f5      	beq.n	8014da4 <fn_08014D24+0x80>
 8014db8:	8a99      	ldrh	r1, [r3, #20]
 8014dba:	23e1      	movs	r3, #225	@ 0xe1
 8014dbc:	011b      	lsls	r3, r3, #4
 8014dbe:	58e3      	ldr	r3, [r4, r3]
 8014dc0:	4699      	mov	r9, r3
 8014dc2:	004b      	lsls	r3, r1, #1
 8014dc4:	185b      	adds	r3, r3, r1
 8014dc6:	009b      	lsls	r3, r3, #2
 8014dc8:	4549      	cmp	r1, r9
 8014dca:	d3ce      	bcc.n	8014d6a <fn_08014D24+0x46>
 8014dcc:	490d      	ldr	r1, [pc, #52]	@ (8014e04 <fn_08014D24+0xe0>)
 8014dce:	5861      	ldr	r1, [r4, r1]
 8014dd0:	18cb      	adds	r3, r1, r3
 8014dd2:	e7cd      	b.n	8014d70 <fn_08014D24+0x4c>
 8014dd4:	490b      	ldr	r1, [pc, #44]	@ (8014e04 <fn_08014D24+0xe0>)
 8014dd6:	5861      	ldr	r1, [r4, r1]
 8014dd8:	18cb      	adds	r3, r1, r3
 8014dda:	e7da      	b.n	8014d92 <fn_08014D24+0x6e>
 8014ddc:	27fa      	movs	r7, #250	@ 0xfa
 8014dde:	05ff      	lsls	r7, r7, #23
 8014de0:	0038      	movs	r0, r7
 8014de2:	b003      	add	sp, #12
 8014de4:	bcf0      	pop	{r4, r5, r6, r7}
 8014de6:	46bb      	mov	fp, r7
 8014de8:	46b2      	mov	sl, r6
 8014dea:	46a9      	mov	r9, r5
 8014dec:	46a0      	mov	r8, r4
 8014dee:	bcf0      	pop	{r4, r5, r6, r7}
 8014df0:	bc02      	pop	{r1}
 8014df2:	4708      	bx	r1
 8014df4:	030064c4 	.word	0x030064c4	@ data_030064C4
 8014df8:	030065c4 	.word	0x030065c4	@ data_030065C4
 8014dfc:	0000ffff 	.word	0x0000ffff
 8014e00:	00000e14 	.word	0x00000e14
 8014e04:	00000e0c 	.word	0x00000e0c
