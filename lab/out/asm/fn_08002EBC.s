fn_08002EBC:
 8002ebc:	b5f0      	push	{r4, r5, r6, r7, lr}
 8002ebe:	46de      	mov	lr, fp
 8002ec0:	4645      	mov	r5, r8
 8002ec2:	4657      	mov	r7, sl
 8002ec4:	464e      	mov	r6, r9
 8002ec6:	b5e0      	push	{r5, r6, r7, lr}
 8002ec8:	b083      	sub	sp, #12
 8002eca:	0004      	movs	r4, r0
 8002ecc:	f7fd faca 	bl	8000464 <fn_08000464>
 8002ed0:	4680      	mov	r8, r0
 8002ed2:	f7fd fad5 	bl	8000480 <fn_08000480>
 8002ed6:	1e63      	subs	r3, r4, #1
 8002ed8:	4684      	mov	ip, r0
 8002eda:	2001      	movs	r0, #1
 8002edc:	2c00      	cmp	r4, #0
 8002ede:	d100      	bne.n	8002ee2 <fn_08002EBC+0x26>
 8002ee0:	e0b0      	b.n	8003044 <fn_08002EBC+0x188>
 8002ee2:	22f0      	movs	r2, #240	@ 0xf0
 8002ee4:	4691      	mov	r9, r2
 8002ee6:	32f0      	adds	r2, #240	@ 0xf0
 8002ee8:	4692      	mov	sl, r2
 8002eea:	32f0      	adds	r2, #240	@ 0xf0
 8002eec:	4693      	mov	fp, r2
 8002eee:	9301      	str	r3, [sp, #4]
 8002ef0:	2100      	movs	r1, #0
 8002ef2:	4a59      	ldr	r2, [pc, #356]	@ (8003058 <fn_08002EBC+0x19c>)
 8002ef4:	e005      	b.n	8002f02 <fn_08002EBC+0x46>
 8002ef6:	2b9f      	cmp	r3, #159	@ 0x9f
 8002ef8:	dd14      	ble.n	8002f24 <fn_08002EBC+0x68>
 8002efa:	3101      	adds	r1, #1
 8002efc:	3202      	adds	r2, #2
 8002efe:	2978      	cmp	r1, #120	@ 0x78
 8002f00:	d00a      	beq.n	8002f18 <fn_08002EBC+0x5c>
 8002f02:	2400      	movs	r4, #0
 8002f04:	5f13      	ldrsh	r3, [r2, r4]
 8002f06:	2b00      	cmp	r3, #0
 8002f08:	daf5      	bge.n	8002ef6 <fn_08002EBC+0x3a>
 8002f0a:	2000      	movs	r0, #0
 8002f0c:	3301      	adds	r3, #1
 8002f0e:	8013      	strh	r3, [r2, #0]
 8002f10:	3101      	adds	r1, #1
 8002f12:	3202      	adds	r2, #2
 8002f14:	2978      	cmp	r1, #120	@ 0x78
 8002f16:	d1f4      	bne.n	8002f02 <fn_08002EBC+0x46>
 8002f18:	9b01      	ldr	r3, [sp, #4]
 8002f1a:	3b01      	subs	r3, #1
 8002f1c:	d200      	bcs.n	8002f20 <fn_08002EBC+0x64>
 8002f1e:	e092      	b.n	8003046 <fn_08002EBC+0x18a>
 8002f20:	9301      	str	r3, [sp, #4]
 8002f22:	e7e5      	b.n	8002ef0 <fn_08002EBC+0x34>
 8002f24:	20a0      	movs	r0, #160	@ 0xa0
 8002f26:	1ac7      	subs	r7, r0, r3
 8002f28:	2b0f      	cmp	r3, #15
 8002f2a:	dd00      	ble.n	8002f2e <fn_08002EBC+0x72>
 8002f2c:	e07b      	b.n	8003026 <fn_08002EBC+0x16a>
 8002f2e:	3301      	adds	r3, #1
 8002f30:	041b      	lsls	r3, r3, #16
 8002f32:	141b      	asrs	r3, r3, #16
 8002f34:	1afd      	subs	r5, r7, r3
 8002f36:	001f      	movs	r7, r3
 8002f38:	3801      	subs	r0, #1
 8002f3a:	1ac0      	subs	r0, r0, r3
 8002f3c:	0104      	lsls	r4, r0, #4
 8002f3e:	1a24      	subs	r4, r4, r0
 8002f40:	4e46      	ldr	r6, [pc, #280]	@ (800305c <fn_08002EBC+0x1a0>)
 8002f42:	00e4      	lsls	r4, r4, #3
 8002f44:	1864      	adds	r4, r4, r1
 8002f46:	0064      	lsls	r4, r4, #1
 8002f48:	4466      	add	r6, ip
 8002f4a:	4464      	add	r4, ip
 8002f4c:	18b6      	adds	r6, r6, r2
 8002f4e:	012b      	lsls	r3, r5, #4
 8002f50:	1aed      	subs	r5, r5, r3
 8002f52:	2300      	movs	r3, #0
 8002f54:	012d      	lsls	r5, r5, #4
 8002f56:	5ae0      	ldrh	r0, [r4, r3]
 8002f58:	52f0      	strh	r0, [r6, r3]
 8002f5a:	3bf0      	subs	r3, #240	@ 0xf0
 8002f5c:	429d      	cmp	r5, r3
 8002f5e:	d1fa      	bne.n	8002f56 <fn_08002EBC+0x9a>
 8002f60:	2000      	movs	r0, #0
 8002f62:	5e13      	ldrsh	r3, [r2, r0]
 8002f64:	0118      	lsls	r0, r3, #4
 8002f66:	1ac3      	subs	r3, r0, r3
 8002f68:	4640      	mov	r0, r8
 8002f6a:	00db      	lsls	r3, r3, #3
 8002f6c:	185b      	adds	r3, r3, r1
 8002f6e:	005b      	lsls	r3, r3, #1
 8002f70:	18c4      	adds	r4, r0, r3
 8002f72:	4645      	mov	r5, r8
 8002f74:	4660      	mov	r0, ip
 8002f76:	18c0      	adds	r0, r0, r3
 8002f78:	5aeb      	ldrh	r3, [r5, r3]
 8002f7a:	8003      	strh	r3, [r0, #0]
 8002f7c:	2f01      	cmp	r7, #1
 8002f7e:	d04d      	beq.n	800301c <fn_08002EBC+0x160>
 8002f80:	464b      	mov	r3, r9
 8002f82:	464d      	mov	r5, r9
 8002f84:	5ae3      	ldrh	r3, [r4, r3]
 8002f86:	5343      	strh	r3, [r0, r5]
 8002f88:	2f02      	cmp	r7, #2
 8002f8a:	d047      	beq.n	800301c <fn_08002EBC+0x160>
 8002f8c:	4653      	mov	r3, sl
 8002f8e:	4655      	mov	r5, sl
 8002f90:	5ae3      	ldrh	r3, [r4, r3]
 8002f92:	5343      	strh	r3, [r0, r5]
 8002f94:	2f03      	cmp	r7, #3
 8002f96:	d041      	beq.n	800301c <fn_08002EBC+0x160>
 8002f98:	465b      	mov	r3, fp
 8002f9a:	465d      	mov	r5, fp
 8002f9c:	5ae3      	ldrh	r3, [r4, r3]
 8002f9e:	5343      	strh	r3, [r0, r5]
 8002fa0:	2f04      	cmp	r7, #4
 8002fa2:	d03b      	beq.n	800301c <fn_08002EBC+0x160>
 8002fa4:	25f0      	movs	r5, #240	@ 0xf0
 8002fa6:	00ad      	lsls	r5, r5, #2
 8002fa8:	5b63      	ldrh	r3, [r4, r5]
 8002faa:	5343      	strh	r3, [r0, r5]
 8002fac:	2f05      	cmp	r7, #5
 8002fae:	d035      	beq.n	800301c <fn_08002EBC+0x160>
 8002fb0:	35f0      	adds	r5, #240	@ 0xf0
 8002fb2:	5b63      	ldrh	r3, [r4, r5]
 8002fb4:	5343      	strh	r3, [r0, r5]
 8002fb6:	2f06      	cmp	r7, #6
 8002fb8:	d030      	beq.n	800301c <fn_08002EBC+0x160>
 8002fba:	35f0      	adds	r5, #240	@ 0xf0
 8002fbc:	5b63      	ldrh	r3, [r4, r5]
 8002fbe:	5343      	strh	r3, [r0, r5]
 8002fc0:	2f07      	cmp	r7, #7
 8002fc2:	d02b      	beq.n	800301c <fn_08002EBC+0x160>
 8002fc4:	35f0      	adds	r5, #240	@ 0xf0
 8002fc6:	5b63      	ldrh	r3, [r4, r5]
 8002fc8:	5343      	strh	r3, [r0, r5]
 8002fca:	2f08      	cmp	r7, #8
 8002fcc:	d026      	beq.n	800301c <fn_08002EBC+0x160>
 8002fce:	23f0      	movs	r3, #240	@ 0xf0
 8002fd0:	00db      	lsls	r3, r3, #3
 8002fd2:	5ae5      	ldrh	r5, [r4, r3]
 8002fd4:	52c5      	strh	r5, [r0, r3]
 8002fd6:	2f09      	cmp	r7, #9
 8002fd8:	d020      	beq.n	800301c <fn_08002EBC+0x160>
 8002fda:	33f0      	adds	r3, #240	@ 0xf0
 8002fdc:	5ae5      	ldrh	r5, [r4, r3]
 8002fde:	52c5      	strh	r5, [r0, r3]
 8002fe0:	2f0a      	cmp	r7, #10
 8002fe2:	d01b      	beq.n	800301c <fn_08002EBC+0x160>
 8002fe4:	33f0      	adds	r3, #240	@ 0xf0
 8002fe6:	5ae5      	ldrh	r5, [r4, r3]
 8002fe8:	52c5      	strh	r5, [r0, r3]
 8002fea:	2f0b      	cmp	r7, #11
 8002fec:	d016      	beq.n	800301c <fn_08002EBC+0x160>
 8002fee:	33f0      	adds	r3, #240	@ 0xf0
 8002ff0:	5ae5      	ldrh	r5, [r4, r3]
 8002ff2:	52c5      	strh	r5, [r0, r3]
 8002ff4:	2f0c      	cmp	r7, #12
 8002ff6:	d011      	beq.n	800301c <fn_08002EBC+0x160>
 8002ff8:	33f0      	adds	r3, #240	@ 0xf0
 8002ffa:	5ae5      	ldrh	r5, [r4, r3]
 8002ffc:	52c5      	strh	r5, [r0, r3]
 8002ffe:	2f0d      	cmp	r7, #13
 8003000:	d00c      	beq.n	800301c <fn_08002EBC+0x160>
 8003002:	33f0      	adds	r3, #240	@ 0xf0
 8003004:	5ae5      	ldrh	r5, [r4, r3]
 8003006:	52c5      	strh	r5, [r0, r3]
 8003008:	2f0e      	cmp	r7, #14
 800300a:	d007      	beq.n	800301c <fn_08002EBC+0x160>
 800300c:	33f0      	adds	r3, #240	@ 0xf0
 800300e:	5ae5      	ldrh	r5, [r4, r3]
 8003010:	52c5      	strh	r5, [r0, r3]
 8003012:	2f10      	cmp	r7, #16
 8003014:	d114      	bne.n	8003040 <fn_08002EBC+0x184>
 8003016:	33f0      	adds	r3, #240	@ 0xf0
 8003018:	5ae4      	ldrh	r4, [r4, r3]
 800301a:	52c4      	strh	r4, [r0, r3]
 800301c:	8813      	ldrh	r3, [r2, #0]
 800301e:	19db      	adds	r3, r3, r7
 8003020:	2000      	movs	r0, #0
 8003022:	8013      	strh	r3, [r2, #0]
 8003024:	e774      	b.n	8002f10 <fn_08002EBC+0x54>
 8003026:	2b99      	cmp	r3, #153	@ 0x99
 8003028:	dc9c      	bgt.n	8002f64 <fn_08002EBC+0xa8>
 800302a:	259a      	movs	r5, #154	@ 0x9a
 800302c:	480c      	ldr	r0, [pc, #48]	@ (8003060 <fn_08002EBC+0x1a4>)
 800302e:	4e0b      	ldr	r6, [pc, #44]	@ (800305c <fn_08002EBC+0x1a0>)
 8003030:	180c      	adds	r4, r1, r0
 8003032:	0064      	lsls	r4, r4, #1
 8003034:	4466      	add	r6, ip
 8003036:	2706      	movs	r7, #6
 8003038:	4464      	add	r4, ip
 800303a:	18b6      	adds	r6, r6, r2
 800303c:	1aed      	subs	r5, r5, r3
 800303e:	e786      	b.n	8002f4e <fn_08002EBC+0x92>
 8003040:	270f      	movs	r7, #15
 8003042:	e7eb      	b.n	800301c <fn_08002EBC+0x160>
 8003044:	2001      	movs	r0, #1
 8003046:	b003      	add	sp, #12
 8003048:	bcf0      	pop	{r4, r5, r6, r7}
 800304a:	46bb      	mov	fp, r7
 800304c:	46b2      	mov	sl, r6
 800304e:	46a9      	mov	r9, r5
 8003050:	46a0      	mov	r8, r4
 8003052:	bcf0      	pop	{r4, r5, r6, r7}
 8003054:	bc02      	pop	{r1}
 8003056:	4708      	bx	r1
 8003058:	06009bc4 	.word	0x06009bc4
 800305c:	f9fff94c 	.word	0xf9fff94c
 8003060:	000047b8 	.word	0x000047b8
