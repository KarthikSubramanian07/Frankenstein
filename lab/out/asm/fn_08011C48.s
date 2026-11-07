fn_08011C48:
 8011c48:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8011c4a:	464e      	mov	r6, r9
 8011c4c:	46de      	mov	lr, fp
 8011c4e:	4657      	mov	r7, sl
 8011c50:	4645      	mov	r5, r8
 8011c52:	b5e0      	push	{r5, r6, r7, lr}
 8011c54:	79c3      	ldrb	r3, [r0, #7]
 8011c56:	7982      	ldrb	r2, [r0, #6]
 8011c58:	021b      	lsls	r3, r3, #8
 8011c5a:	4313      	orrs	r3, r2
 8011c5c:	041e      	lsls	r6, r3, #16
 8011c5e:	0004      	movs	r4, r0
 8011c60:	1436      	asrs	r6, r6, #16
 8011c62:	2b00      	cmp	r3, #0
 8011c64:	d005      	beq.n	8011c72 <fn_08011C48+0x2a>
 8011c66:	4b79      	ldr	r3, [pc, #484]	@ (8011e4c <fn_08011C48+0x204>)
 8011c68:	18f3      	adds	r3, r6, r3
 8011c6a:	041b      	lsls	r3, r3, #16
 8011c6c:	0c1b      	lsrs	r3, r3, #16
 8011c6e:	2b03      	cmp	r3, #3
 8011c70:	d807      	bhi.n	8011c82 <fn_08011C48+0x3a>
 8011c72:	bcf0      	pop	{r4, r5, r6, r7}
 8011c74:	46bb      	mov	fp, r7
 8011c76:	46b2      	mov	sl, r6
 8011c78:	46a9      	mov	r9, r5
 8011c7a:	46a0      	mov	r8, r4
 8011c7c:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8011c7e:	bc01      	pop	{r0}
 8011c80:	4700      	bx	r0
 8011c82:	7a43      	ldrb	r3, [r0, #9]
 8011c84:	7a02      	ldrb	r2, [r0, #8]
 8011c86:	021b      	lsls	r3, r3, #8
 8011c88:	4313      	orrs	r3, r2
 8011c8a:	041d      	lsls	r5, r3, #16
 8011c8c:	142d      	asrs	r5, r5, #16
 8011c8e:	05db      	lsls	r3, r3, #23
 8011c90:	d470      	bmi.n	8011d74 <fn_08011C48+0x12c>
 8011c92:	2e01      	cmp	r6, #1
 8011c94:	d100      	bne.n	8011c98 <fn_08011C48+0x50>
 8011c96:	e080      	b.n	8011d9a <fn_08011C48+0x152>
 8011c98:	2310      	movs	r3, #16
 8011c9a:	001a      	movs	r2, r3
 8011c9c:	402a      	ands	r2, r5
 8011c9e:	4690      	mov	r8, r2
 8011ca0:	422b      	tst	r3, r5
 8011ca2:	d1e6      	bne.n	8011c72 <fn_08011C48+0x2a>
 8011ca4:	4b6a      	ldr	r3, [pc, #424]	@ (8011e50 <fn_08011C48+0x208>)
 8011ca6:	681a      	ldr	r2, [r3, #0]
 8011ca8:	4699      	mov	r9, r3
 8011caa:	23d6      	movs	r3, #214	@ 0xd6
 8011cac:	5cd3      	ldrb	r3, [r2, r3]
 8011cae:	2b01      	cmp	r3, #1
 8011cb0:	d970      	bls.n	8011d94 <fn_08011C48+0x14c>
 8011cb2:	3b03      	subs	r3, #3
 8011cb4:	061b      	lsls	r3, r3, #24
 8011cb6:	0e1b      	lsrs	r3, r3, #24
 8011cb8:	2b01      	cmp	r3, #1
 8011cba:	d800      	bhi.n	8011cbe <fn_08011C48+0x76>
 8011cbc:	e07e      	b.n	8011dbc <fn_08011C48+0x174>
 8011cbe:	07ab      	lsls	r3, r5, #30
 8011cc0:	d5d7      	bpl.n	8011c72 <fn_08011C48+0x2a>
 8011cc2:	23ea      	movs	r3, #234	@ 0xea
 8011cc4:	00db      	lsls	r3, r3, #3
 8011cc6:	58d2      	ldr	r2, [r2, r3]
 8011cc8:	2300      	movs	r3, #0
 8011cca:	e003      	b.n	8011cd4 <fn_08011C48+0x8c>
 8011ccc:	3301      	adds	r3, #1
 8011cce:	325c      	adds	r2, #92	@ 0x5c
 8011cd0:	2b8a      	cmp	r3, #138	@ 0x8a
 8011cd2:	d0ce      	beq.n	8011c72 <fn_08011C48+0x2a>
 8011cd4:	6811      	ldr	r1, [r2, #0]
 8011cd6:	428e      	cmp	r6, r1
 8011cd8:	d1f8      	bne.n	8011ccc <fn_08011C48+0x84>
 8011cda:	2155      	movs	r1, #85	@ 0x55
 8011cdc:	5c52      	ldrb	r2, [r2, r1]
 8011cde:	2180      	movs	r1, #128	@ 0x80
 8011ce0:	07d2      	lsls	r2, r2, #31
 8011ce2:	0609      	lsls	r1, r1, #24
 8011ce4:	17d2      	asrs	r2, r2, #31
 8011ce6:	1852      	adds	r2, r2, r1
 8011ce8:	78e1      	ldrb	r1, [r4, #3]
 8011cea:	78a0      	ldrb	r0, [r4, #2]
 8011cec:	0209      	lsls	r1, r1, #8
 8011cee:	4301      	orrs	r1, r0
 8011cf0:	7860      	ldrb	r0, [r4, #1]
 8011cf2:	7826      	ldrb	r6, [r4, #0]
 8011cf4:	0200      	lsls	r0, r0, #8
 8011cf6:	4330      	orrs	r0, r6
 8011cf8:	061b      	lsls	r3, r3, #24
 8011cfa:	0e1b      	lsrs	r3, r3, #24
 8011cfc:	0409      	lsls	r1, r1, #16
 8011cfe:	0400      	lsls	r0, r0, #16
 8011d00:	f7ff f874 	bl	8010dec <fn_08010DEC>
 8011d04:	2356      	movs	r3, #86	@ 0x56
 8011d06:	5ec3      	ldrsh	r3, [r0, r3]
 8011d08:	0006      	movs	r6, r0
 8011d0a:	2b00      	cmp	r3, #0
 8011d0c:	dd07      	ble.n	8011d1e <fn_08011C48+0xd6>
 8011d0e:	2756      	movs	r7, #86	@ 0x56
 8011d10:	f7f4 fef6 	bl	8006b00 <fn_08006B00>
 8011d14:	5ff1      	ldrsh	r1, [r6, r7]
 8011d16:	f013 fc3f 	bl	8025598 <fn_08025598>
 8011d1a:	3101      	adds	r1, #1
 8011d1c:	53f1      	strh	r1, [r6, r7]
 8011d1e:	4b4d      	ldr	r3, [pc, #308]	@ (8011e54 <fn_08011C48+0x20c>)
 8011d20:	68b2      	ldr	r2, [r6, #8]
 8011d22:	429a      	cmp	r2, r3
 8011d24:	d04e      	beq.n	8011dc4 <fn_08011C48+0x17c>
 8011d26:	6cf3      	ldr	r3, [r6, #76]	@ 0x4c
 8011d28:	025a      	lsls	r2, r3, #9
 8011d2a:	d507      	bpl.n	8011d3c <fn_08011C48+0xf4>
 8011d2c:	464b      	mov	r3, r9
 8011d2e:	22f2      	movs	r2, #242	@ 0xf2
 8011d30:	6819      	ldr	r1, [r3, #0]
 8011d32:	0052      	lsls	r2, r2, #1
 8011d34:	588b      	ldr	r3, [r1, r2]
 8011d36:	3301      	adds	r3, #1
 8011d38:	508b      	str	r3, [r1, r2]
 8011d3a:	6cf3      	ldr	r3, [r6, #76]	@ 0x4c
 8011d3c:	021b      	lsls	r3, r3, #8
 8011d3e:	d506      	bpl.n	8011d4e <fn_08011C48+0x106>
 8011d40:	464b      	mov	r3, r9
 8011d42:	22f4      	movs	r2, #244	@ 0xf4
 8011d44:	6819      	ldr	r1, [r3, #0]
 8011d46:	0052      	lsls	r2, r2, #1
 8011d48:	588b      	ldr	r3, [r1, r2]
 8011d4a:	3301      	adds	r3, #1
 8011d4c:	508b      	str	r3, [r1, r2]
 8011d4e:	7960      	ldrb	r0, [r4, #5]
 8011d50:	7923      	ldrb	r3, [r4, #4]
 8011d52:	0200      	lsls	r0, r0, #8
 8011d54:	4318      	orrs	r0, r3
 8011d56:	0400      	lsls	r0, r0, #16
 8011d58:	212d      	movs	r1, #45	@ 0x2d
 8011d5a:	1400      	asrs	r0, r0, #16
 8011d5c:	f013 fc70 	bl	8025640 <fn_08025640>
 8011d60:	0740      	lsls	r0, r0, #29
 8011d62:	6230      	str	r0, [r6, #32]
 8011d64:	072d      	lsls	r5, r5, #28
 8011d66:	d400      	bmi.n	8011d6a <fn_08011C48+0x122>
 8011d68:	e783      	b.n	8011c72 <fn_08011C48+0x2a>
 8011d6a:	2220      	movs	r2, #32
 8011d6c:	6cf3      	ldr	r3, [r6, #76]	@ 0x4c
 8011d6e:	4313      	orrs	r3, r2
 8011d70:	64f3      	str	r3, [r6, #76]	@ 0x4c
 8011d72:	e77e      	b.n	8011c72 <fn_08011C48+0x2a>
 8011d74:	0032      	movs	r2, r6
 8011d76:	0029      	movs	r1, r5
 8011d78:	4837      	ldr	r0, [pc, #220]	@ (8011e58 <fn_08011C48+0x210>)
 8011d7a:	f7f3 fb53 	bl	8005424 <fn_08005424>
 8011d7e:	231f      	movs	r3, #31
 8011d80:	79e6      	ldrb	r6, [r4, #7]
 8011d82:	401d      	ands	r5, r3
 8011d84:	79a3      	ldrb	r3, [r4, #6]
 8011d86:	0236      	lsls	r6, r6, #8
 8011d88:	431e      	orrs	r6, r3
 8011d8a:	0436      	lsls	r6, r6, #16
 8011d8c:	1436      	asrs	r6, r6, #16
 8011d8e:	2e01      	cmp	r6, #1
 8011d90:	d182      	bne.n	8011c98 <fn_08011C48+0x50>
 8011d92:	e002      	b.n	8011d9a <fn_08011C48+0x152>
 8011d94:	07eb      	lsls	r3, r5, #31
 8011d96:	d494      	bmi.n	8011cc2 <fn_08011C48+0x7a>
 8011d98:	e76b      	b.n	8011c72 <fn_08011C48+0x2a>
 8011d9a:	4b2d      	ldr	r3, [pc, #180]	@ (8011e50 <fn_08011C48+0x208>)
 8011d9c:	681d      	ldr	r5, [r3, #0]
 8011d9e:	4b2f      	ldr	r3, [pc, #188]	@ (8011e5c <fn_08011C48+0x214>)
 8011da0:	469c      	mov	ip, r3
 8011da2:	44ac      	add	ip, r5
 8011da4:	0021      	movs	r1, r4
 8011da6:	4664      	mov	r4, ip
 8011da8:	220a      	movs	r2, #10
 8011daa:	0020      	movs	r0, r4
 8011dac:	f00e fd24 	bl	80207f8 <fn_080207F8>
 8011db0:	4b2b      	ldr	r3, [pc, #172]	@ (8011e60 <fn_08011C48+0x218>)
 8011db2:	0020      	movs	r0, r4
 8011db4:	52ee      	strh	r6, [r5, r3]
 8011db6:	f7ff fecf 	bl	8011b58 <fn_08011B58>
 8011dba:	e75a      	b.n	8011c72 <fn_08011C48+0x2a>
 8011dbc:	076b      	lsls	r3, r5, #29
 8011dbe:	d500      	bpl.n	8011dc2 <fn_08011C48+0x17a>
 8011dc0:	e77f      	b.n	8011cc2 <fn_08011C48+0x7a>
 8011dc2:	e756      	b.n	8011c72 <fn_08011C48+0x2a>
 8011dc4:	464b      	mov	r3, r9
 8011dc6:	6cb0      	ldr	r0, [r6, #72]	@ 0x48
 8011dc8:	46aa      	mov	sl, r5
 8011dca:	681f      	ldr	r7, [r3, #0]
 8011dcc:	4645      	mov	r5, r8
 8011dce:	0003      	movs	r3, r0
 8011dd0:	46a0      	mov	r8, r4
 8011dd2:	2221      	movs	r2, #33	@ 0x21
 8011dd4:	0004      	movs	r4, r0
 8011dd6:	46b3      	mov	fp, r6
 8011dd8:	e009      	b.n	8011dee <fn_08011C48+0x1a6>
 8011dda:	891b      	ldrh	r3, [r3, #8]
 8011ddc:	4e21      	ldr	r6, [pc, #132]	@ (8011e64 <fn_08011C48+0x21c>)
 8011dde:	186d      	adds	r5, r5, r1
 8011de0:	0099      	lsls	r1, r3, #2
 8011de2:	18c9      	adds	r1, r1, r3
 8011de4:	59bb      	ldr	r3, [r7, r6]
 8011de6:	0049      	lsls	r1, r1, #1
 8011de8:	185b      	adds	r3, r3, r1
 8011dea:	429c      	cmp	r4, r3
 8011dec:	d012      	beq.n	8011e14 <fn_08011C48+0x1cc>
 8011dee:	2004      	movs	r0, #4
 8011df0:	5e19      	ldrsh	r1, [r3, r0]
 8011df2:	2900      	cmp	r1, #0
 8011df4:	dd0a      	ble.n	8011e0c <fn_08011C48+0x1c4>
 8011df6:	88d8      	ldrh	r0, [r3, #6]
 8011df8:	2800      	cmp	r0, #0
 8011dfa:	d107      	bne.n	8011e0c <fn_08011C48+0x1c4>
 8011dfc:	881e      	ldrh	r6, [r3, #0]
 8011dfe:	46b4      	mov	ip, r6
 8011e00:	8826      	ldrh	r6, [r4, #0]
 8011e02:	45b4      	cmp	ip, r6
 8011e04:	d102      	bne.n	8011e0c <fn_08011C48+0x1c4>
 8011e06:	3a01      	subs	r2, #1
 8011e08:	2a00      	cmp	r2, #0
 8011e0a:	d1e6      	bne.n	8011dda <fn_08011C48+0x192>
 8011e0c:	4655      	mov	r5, sl
 8011e0e:	4644      	mov	r4, r8
 8011e10:	465e      	mov	r6, fp
 8011e12:	e788      	b.n	8011d26 <fn_08011C48+0xde>
 8011e14:	4b14      	ldr	r3, [pc, #80]	@ (8011e68 <fn_08011C48+0x220>)
 8011e16:	002f      	movs	r7, r5
 8011e18:	4684      	mov	ip, r0
 8011e1a:	4655      	mov	r5, sl
 8011e1c:	0020      	movs	r0, r4
 8011e1e:	465e      	mov	r6, fp
 8011e20:	4644      	mov	r4, r8
 8011e22:	429f      	cmp	r7, r3
 8011e24:	dd00      	ble.n	8011e28 <fn_08011C48+0x1e0>
 8011e26:	e77e      	b.n	8011d26 <fn_08011C48+0xde>
 8011e28:	2256      	movs	r2, #86	@ 0x56
 8011e2a:	8883      	ldrh	r3, [r0, #4]
 8011e2c:	5ab0      	ldrh	r0, [r6, r2]
 8011e2e:	1a1b      	subs	r3, r3, r0
 8011e30:	6cf1      	ldr	r1, [r6, #76]	@ 0x4c
 8011e32:	52b3      	strh	r3, [r6, r2]
 8011e34:	2358      	movs	r3, #88	@ 0x58
 8011e36:	52f7      	strh	r7, [r6, r3]
 8011e38:	2380      	movs	r3, #128	@ 0x80
 8011e3a:	059b      	lsls	r3, r3, #22
 8011e3c:	430b      	orrs	r3, r1
 8011e3e:	64f3      	str	r3, [r6, #76]	@ 0x4c
 8011e40:	4663      	mov	r3, ip
 8011e42:	0030      	movs	r0, r6
 8011e44:	60b3      	str	r3, [r6, #8]
 8011e46:	f006 fbd9 	bl	80185fc <fn_080185FC>
 8011e4a:	e76c      	b.n	8011d26 <fn_08011C48+0xde>
 8011e4c:	fffff05f 	.word	0xfffff05f
 8011e50:	030064c4 	.word	0x030064c4
 8011e54:	080114b9 	.word	0x080114b9
 8011e58:	0814a03c 	.word	0x0814a03c
 8011e5c:	00000e3c 	.word	0x00000e3c
 8011e60:	00000e44 	.word	0x00000e44
 8011e64:	0000074c 	.word	0x0000074c
 8011e68:	00007fff 	.word	0x00007fff
