fn_08014FB8:
 8014fb8:	b5f0      	push	{r4, r5, r6, r7, lr}
 8014fba:	46de      	mov	lr, fp
 8014fbc:	464e      	mov	r6, r9
 8014fbe:	4657      	mov	r7, sl
 8014fc0:	4645      	mov	r5, r8
 8014fc2:	4b2c      	ldr	r3, [pc, #176]	@ (8015074 <fn_08014FB8+0xbc>)
 8014fc4:	b5e0      	push	{r5, r6, r7, lr}
 8014fc6:	681e      	ldr	r6, [r3, #0]
 8014fc8:	23df      	movs	r3, #223	@ 0xdf
 8014fca:	468b      	mov	fp, r1
 8014fcc:	011b      	lsls	r3, r3, #4
 8014fce:	58f2      	ldr	r2, [r6, r3]
 8014fd0:	008b      	lsls	r3, r1, #2
 8014fd2:	b085      	sub	sp, #20
 8014fd4:	445b      	add	r3, fp
 8014fd6:	9002      	str	r0, [sp, #8]
 8014fd8:	9201      	str	r2, [sp, #4]
 8014fda:	00db      	lsls	r3, r3, #3
 8014fdc:	18d3      	adds	r3, r2, r3
 8014fde:	211e      	movs	r1, #30
 8014fe0:	5e5a      	ldrsh	r2, [r3, r1]
 8014fe2:	4694      	mov	ip, r2
 8014fe4:	2a00      	cmp	r2, #0
 8014fe6:	dd3a      	ble.n	801505e <fn_08014FB8+0xa6>
 8014fe8:	699b      	ldr	r3, [r3, #24]
 8014fea:	22e0      	movs	r2, #224	@ 0xe0
 8014fec:	4699      	mov	r9, r3
 8014fee:	4b22      	ldr	r3, [pc, #136]	@ (8015078 <fn_08014FB8+0xc0>)
 8014ff0:	4698      	mov	r8, r3
 8014ff2:	465b      	mov	r3, fp
 8014ff4:	0112      	lsls	r2, r2, #4
 8014ff6:	58b2      	ldr	r2, [r6, r2]
 8014ff8:	9303      	str	r3, [sp, #12]
 8014ffa:	4692      	mov	sl, r2
 8014ffc:	2200      	movs	r2, #0
 8014ffe:	e00d      	b.n	801501c <fn_08014FB8+0x64>
 8015000:	18c9      	adds	r1, r1, r3
 8015002:	894b      	ldrh	r3, [r1, #10]
 8015004:	0098      	lsls	r0, r3, #2
 8015006:	18c0      	adds	r0, r0, r3
 8015008:	9b01      	ldr	r3, [sp, #4]
 801500a:	00c0      	lsls	r0, r0, #3
 801500c:	1818      	adds	r0, r3, r0
 801500e:	6843      	ldr	r3, [r0, #4]
 8015010:	9902      	ldr	r1, [sp, #8]
 8015012:	428b      	cmp	r3, r1
 8015014:	d024      	beq.n	8015060 <fn_08014FB8+0xa8>
 8015016:	3201      	adds	r2, #1
 8015018:	4594      	cmp	ip, r2
 801501a:	dd20      	ble.n	801505e <fn_08014FB8+0xa6>
 801501c:	4649      	mov	r1, r9
 801501e:	0053      	lsls	r3, r2, #1
 8015020:	5acb      	ldrh	r3, [r1, r3]
 8015022:	015b      	lsls	r3, r3, #5
 8015024:	4453      	add	r3, sl
 8015026:	8adc      	ldrh	r4, [r3, #22]
 8015028:	4544      	cmp	r4, r8
 801502a:	d0f4      	beq.n	8015016 <fn_08014FB8+0x5e>
 801502c:	25e1      	movs	r5, #225	@ 0xe1
 801502e:	8a98      	ldrh	r0, [r3, #20]
 8015030:	4b12      	ldr	r3, [pc, #72]	@ (801507c <fn_08014FB8+0xc4>)
 8015032:	012d      	lsls	r5, r5, #4
 8015034:	58f1      	ldr	r1, [r6, r3]
 8015036:	0043      	lsls	r3, r0, #1
 8015038:	5977      	ldr	r7, [r6, r5]
 801503a:	181b      	adds	r3, r3, r0
 801503c:	009b      	lsls	r3, r3, #2
 801503e:	18cd      	adds	r5, r1, r3
 8015040:	42b8      	cmp	r0, r7
 8015042:	d202      	bcs.n	801504a <fn_08014FB8+0x92>
 8015044:	480e      	ldr	r0, [pc, #56]	@ (8015080 <fn_08014FB8+0xc8>)
 8015046:	5835      	ldr	r5, [r6, r0]
 8015048:	18ed      	adds	r5, r5, r3
 801504a:	8968      	ldrh	r0, [r5, #10]
 801504c:	9d03      	ldr	r5, [sp, #12]
 801504e:	42a8      	cmp	r0, r5
 8015050:	d1d6      	bne.n	8015000 <fn_08014FB8+0x48>
 8015052:	0063      	lsls	r3, r4, #1
 8015054:	191b      	adds	r3, r3, r4
 8015056:	009b      	lsls	r3, r3, #2
 8015058:	18cb      	adds	r3, r1, r3
 801505a:	895b      	ldrh	r3, [r3, #10]
 801505c:	e7d2      	b.n	8015004 <fn_08014FB8+0x4c>
 801505e:	2000      	movs	r0, #0
 8015060:	b005      	add	sp, #20
 8015062:	bcf0      	pop	{r4, r5, r6, r7}
 8015064:	46bb      	mov	fp, r7
 8015066:	46b2      	mov	sl, r6
 8015068:	46a9      	mov	r9, r5
 801506a:	46a0      	mov	r8, r4
 801506c:	bcf0      	pop	{r4, r5, r6, r7}
 801506e:	bc02      	pop	{r1}
 8015070:	4708      	bx	r1
 8015072:	46c0      	nop			@ (mov r8, r8)
 8015074:	030064c4 	.word	0x030064c4
 8015078:	0000ffff 	.word	0x0000ffff
 801507c:	00000e0c 	.word	0x00000e0c
 8015080:	00000e14 	.word	0x00000e14
