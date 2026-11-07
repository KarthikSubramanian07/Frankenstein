fn_08014EEC:
 8014eec:	b5f0      	push	{r4, r5, r6, r7, lr}
 8014eee:	46de      	mov	lr, fp
 8014ef0:	464e      	mov	r6, r9
 8014ef2:	4657      	mov	r7, sl
 8014ef4:	4645      	mov	r5, r8
 8014ef6:	4b2c      	ldr	r3, [pc, #176]	@ (8014fa8 <fn_08014EEC+0xbc>)
 8014ef8:	b5e0      	push	{r5, r6, r7, lr}
 8014efa:	681e      	ldr	r6, [r3, #0]
 8014efc:	23df      	movs	r3, #223	@ 0xdf
 8014efe:	468b      	mov	fp, r1
 8014f00:	011b      	lsls	r3, r3, #4
 8014f02:	58f2      	ldr	r2, [r6, r3]
 8014f04:	008b      	lsls	r3, r1, #2
 8014f06:	b085      	sub	sp, #20
 8014f08:	445b      	add	r3, fp
 8014f0a:	9002      	str	r0, [sp, #8]
 8014f0c:	9201      	str	r2, [sp, #4]
 8014f0e:	00db      	lsls	r3, r3, #3
 8014f10:	18d3      	adds	r3, r2, r3
 8014f12:	211e      	movs	r1, #30
 8014f14:	5e5a      	ldrsh	r2, [r3, r1]
 8014f16:	4694      	mov	ip, r2
 8014f18:	2a00      	cmp	r2, #0
 8014f1a:	dd3a      	ble.n	8014f92 <fn_08014EEC+0xa6>
 8014f1c:	699b      	ldr	r3, [r3, #24]
 8014f1e:	22e0      	movs	r2, #224	@ 0xe0
 8014f20:	4699      	mov	r9, r3
 8014f22:	4b22      	ldr	r3, [pc, #136]	@ (8014fac <fn_08014EEC+0xc0>)
 8014f24:	4698      	mov	r8, r3
 8014f26:	465b      	mov	r3, fp
 8014f28:	0112      	lsls	r2, r2, #4
 8014f2a:	58b2      	ldr	r2, [r6, r2]
 8014f2c:	9303      	str	r3, [sp, #12]
 8014f2e:	4692      	mov	sl, r2
 8014f30:	2200      	movs	r2, #0
 8014f32:	e00d      	b.n	8014f50 <fn_08014EEC+0x64>
 8014f34:	18c9      	adds	r1, r1, r3
 8014f36:	894b      	ldrh	r3, [r1, #10]
 8014f38:	0098      	lsls	r0, r3, #2
 8014f3a:	18c0      	adds	r0, r0, r3
 8014f3c:	9b01      	ldr	r3, [sp, #4]
 8014f3e:	00c0      	lsls	r0, r0, #3
 8014f40:	1818      	adds	r0, r3, r0
 8014f42:	6803      	ldr	r3, [r0, #0]
 8014f44:	9902      	ldr	r1, [sp, #8]
 8014f46:	428b      	cmp	r3, r1
 8014f48:	d024      	beq.n	8014f94 <fn_08014EEC+0xa8>
 8014f4a:	3201      	adds	r2, #1
 8014f4c:	4594      	cmp	ip, r2
 8014f4e:	dd20      	ble.n	8014f92 <fn_08014EEC+0xa6>
 8014f50:	4649      	mov	r1, r9
 8014f52:	0053      	lsls	r3, r2, #1
 8014f54:	5acb      	ldrh	r3, [r1, r3]
 8014f56:	015b      	lsls	r3, r3, #5
 8014f58:	4453      	add	r3, sl
 8014f5a:	8adc      	ldrh	r4, [r3, #22]
 8014f5c:	4544      	cmp	r4, r8
 8014f5e:	d0f4      	beq.n	8014f4a <fn_08014EEC+0x5e>
 8014f60:	25e1      	movs	r5, #225	@ 0xe1
 8014f62:	8a98      	ldrh	r0, [r3, #20]
 8014f64:	4b12      	ldr	r3, [pc, #72]	@ (8014fb0 <fn_08014EEC+0xc4>)
 8014f66:	012d      	lsls	r5, r5, #4
 8014f68:	58f1      	ldr	r1, [r6, r3]
 8014f6a:	0043      	lsls	r3, r0, #1
 8014f6c:	5977      	ldr	r7, [r6, r5]
 8014f6e:	181b      	adds	r3, r3, r0
 8014f70:	009b      	lsls	r3, r3, #2
 8014f72:	18cd      	adds	r5, r1, r3
 8014f74:	42b8      	cmp	r0, r7
 8014f76:	d202      	bcs.n	8014f7e <fn_08014EEC+0x92>
 8014f78:	480e      	ldr	r0, [pc, #56]	@ (8014fb4 <fn_08014EEC+0xc8>)
 8014f7a:	5835      	ldr	r5, [r6, r0]
 8014f7c:	18ed      	adds	r5, r5, r3
 8014f7e:	8968      	ldrh	r0, [r5, #10]
 8014f80:	9d03      	ldr	r5, [sp, #12]
 8014f82:	42a8      	cmp	r0, r5
 8014f84:	d1d6      	bne.n	8014f34 <fn_08014EEC+0x48>
 8014f86:	0063      	lsls	r3, r4, #1
 8014f88:	191b      	adds	r3, r3, r4
 8014f8a:	009b      	lsls	r3, r3, #2
 8014f8c:	18cb      	adds	r3, r1, r3
 8014f8e:	895b      	ldrh	r3, [r3, #10]
 8014f90:	e7d2      	b.n	8014f38 <fn_08014EEC+0x4c>
 8014f92:	2000      	movs	r0, #0
 8014f94:	b005      	add	sp, #20
 8014f96:	bcf0      	pop	{r4, r5, r6, r7}
 8014f98:	46bb      	mov	fp, r7
 8014f9a:	46b2      	mov	sl, r6
 8014f9c:	46a9      	mov	r9, r5
 8014f9e:	46a0      	mov	r8, r4
 8014fa0:	bcf0      	pop	{r4, r5, r6, r7}
 8014fa2:	bc02      	pop	{r1}
 8014fa4:	4708      	bx	r1
 8014fa6:	46c0      	nop			@ (mov r8, r8)
 8014fa8:	030064c4 	.word	0x030064c4	@ data_030064C4
 8014fac:	0000ffff 	.word	0x0000ffff
 8014fb0:	00000e0c 	.word	0x00000e0c
 8014fb4:	00000e14 	.word	0x00000e14
