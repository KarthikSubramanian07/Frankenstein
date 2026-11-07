fn_08014FA0:
 8014fa0:	b5f0      	push	{r4, r5, r6, r7, lr}
 8014fa2:	46de      	mov	lr, fp
 8014fa4:	464e      	mov	r6, r9
 8014fa6:	4657      	mov	r7, sl
 8014fa8:	4645      	mov	r5, r8
 8014faa:	4b2c      	ldr	r3, [pc, #176]	@ (801505c <fn_08014FA0+0xbc>)
 8014fac:	b5e0      	push	{r5, r6, r7, lr}
 8014fae:	681e      	ldr	r6, [r3, #0]
 8014fb0:	23df      	movs	r3, #223	@ 0xdf
 8014fb2:	468b      	mov	fp, r1
 8014fb4:	011b      	lsls	r3, r3, #4
 8014fb6:	58f2      	ldr	r2, [r6, r3]
 8014fb8:	008b      	lsls	r3, r1, #2
 8014fba:	b085      	sub	sp, #20
 8014fbc:	445b      	add	r3, fp
 8014fbe:	9002      	str	r0, [sp, #8]
 8014fc0:	9201      	str	r2, [sp, #4]
 8014fc2:	00db      	lsls	r3, r3, #3
 8014fc4:	18d3      	adds	r3, r2, r3
 8014fc6:	211e      	movs	r1, #30
 8014fc8:	5e5a      	ldrsh	r2, [r3, r1]
 8014fca:	4694      	mov	ip, r2
 8014fcc:	2a00      	cmp	r2, #0
 8014fce:	dd3a      	ble.n	8015046 <fn_08014FA0+0xa6>
 8014fd0:	699b      	ldr	r3, [r3, #24]
 8014fd2:	22e0      	movs	r2, #224	@ 0xe0
 8014fd4:	4699      	mov	r9, r3
 8014fd6:	4b22      	ldr	r3, [pc, #136]	@ (8015060 <fn_08014FA0+0xc0>)
 8014fd8:	4698      	mov	r8, r3
 8014fda:	465b      	mov	r3, fp
 8014fdc:	0112      	lsls	r2, r2, #4
 8014fde:	58b2      	ldr	r2, [r6, r2]
 8014fe0:	9303      	str	r3, [sp, #12]
 8014fe2:	4692      	mov	sl, r2
 8014fe4:	2200      	movs	r2, #0
 8014fe6:	e00d      	b.n	8015004 <fn_08014FA0+0x64>
 8014fe8:	18c9      	adds	r1, r1, r3
 8014fea:	894b      	ldrh	r3, [r1, #10]
 8014fec:	0098      	lsls	r0, r3, #2
 8014fee:	18c0      	adds	r0, r0, r3
 8014ff0:	9b01      	ldr	r3, [sp, #4]
 8014ff2:	00c0      	lsls	r0, r0, #3
 8014ff4:	1818      	adds	r0, r3, r0
 8014ff6:	6803      	ldr	r3, [r0, #0]
 8014ff8:	9902      	ldr	r1, [sp, #8]
 8014ffa:	428b      	cmp	r3, r1
 8014ffc:	d024      	beq.n	8015048 <fn_08014FA0+0xa8>
 8014ffe:	3201      	adds	r2, #1
 8015000:	4594      	cmp	ip, r2
 8015002:	dd20      	ble.n	8015046 <fn_08014FA0+0xa6>
 8015004:	4649      	mov	r1, r9
 8015006:	0053      	lsls	r3, r2, #1
 8015008:	5acb      	ldrh	r3, [r1, r3]
 801500a:	015b      	lsls	r3, r3, #5
 801500c:	4453      	add	r3, sl
 801500e:	8adc      	ldrh	r4, [r3, #22]
 8015010:	4544      	cmp	r4, r8
 8015012:	d0f4      	beq.n	8014ffe <fn_08014FA0+0x5e>
 8015014:	25e1      	movs	r5, #225	@ 0xe1
 8015016:	8a98      	ldrh	r0, [r3, #20]
 8015018:	4b12      	ldr	r3, [pc, #72]	@ (8015064 <fn_08014FA0+0xc4>)
 801501a:	012d      	lsls	r5, r5, #4
 801501c:	58f1      	ldr	r1, [r6, r3]
 801501e:	0043      	lsls	r3, r0, #1
 8015020:	5977      	ldr	r7, [r6, r5]
 8015022:	181b      	adds	r3, r3, r0
 8015024:	009b      	lsls	r3, r3, #2
 8015026:	18cd      	adds	r5, r1, r3
 8015028:	42b8      	cmp	r0, r7
 801502a:	d202      	bcs.n	8015032 <fn_08014FA0+0x92>
 801502c:	480e      	ldr	r0, [pc, #56]	@ (8015068 <fn_08014FA0+0xc8>)
 801502e:	5835      	ldr	r5, [r6, r0]
 8015030:	18ed      	adds	r5, r5, r3
 8015032:	8968      	ldrh	r0, [r5, #10]
 8015034:	9d03      	ldr	r5, [sp, #12]
 8015036:	42a8      	cmp	r0, r5
 8015038:	d1d6      	bne.n	8014fe8 <fn_08014FA0+0x48>
 801503a:	0063      	lsls	r3, r4, #1
 801503c:	191b      	adds	r3, r3, r4
 801503e:	009b      	lsls	r3, r3, #2
 8015040:	18cb      	adds	r3, r1, r3
 8015042:	895b      	ldrh	r3, [r3, #10]
 8015044:	e7d2      	b.n	8014fec <fn_08014FA0+0x4c>
 8015046:	2000      	movs	r0, #0
 8015048:	b005      	add	sp, #20
 801504a:	bcf0      	pop	{r4, r5, r6, r7}
 801504c:	46bb      	mov	fp, r7
 801504e:	46b2      	mov	sl, r6
 8015050:	46a9      	mov	r9, r5
 8015052:	46a0      	mov	r8, r4
 8015054:	bcf0      	pop	{r4, r5, r6, r7}
 8015056:	bc02      	pop	{r1}
 8015058:	4708      	bx	r1
 801505a:	46c0      	nop			@ (mov r8, r8)
 801505c:	030064c4 	.word	0x030064c4
 8015060:	0000ffff 	.word	0x0000ffff
 8015064:	00000e0c 	.word	0x00000e0c
 8015068:	00000e14 	.word	0x00000e14
