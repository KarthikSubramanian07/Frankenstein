fn_0801506C:
 801506c:	b5f0      	push	{r4, r5, r6, r7, lr}
 801506e:	46de      	mov	lr, fp
 8015070:	464e      	mov	r6, r9
 8015072:	4657      	mov	r7, sl
 8015074:	4645      	mov	r5, r8
 8015076:	4b2c      	ldr	r3, [pc, #176]	@ (8015128 <fn_0801506C+0xbc>)
 8015078:	b5e0      	push	{r5, r6, r7, lr}
 801507a:	681e      	ldr	r6, [r3, #0]
 801507c:	23df      	movs	r3, #223	@ 0xdf
 801507e:	468b      	mov	fp, r1
 8015080:	011b      	lsls	r3, r3, #4
 8015082:	58f2      	ldr	r2, [r6, r3]
 8015084:	008b      	lsls	r3, r1, #2
 8015086:	b085      	sub	sp, #20
 8015088:	445b      	add	r3, fp
 801508a:	9002      	str	r0, [sp, #8]
 801508c:	9201      	str	r2, [sp, #4]
 801508e:	00db      	lsls	r3, r3, #3
 8015090:	18d3      	adds	r3, r2, r3
 8015092:	211e      	movs	r1, #30
 8015094:	5e5a      	ldrsh	r2, [r3, r1]
 8015096:	4694      	mov	ip, r2
 8015098:	2a00      	cmp	r2, #0
 801509a:	dd3a      	ble.n	8015112 <fn_0801506C+0xa6>
 801509c:	699b      	ldr	r3, [r3, #24]
 801509e:	22e0      	movs	r2, #224	@ 0xe0
 80150a0:	4699      	mov	r9, r3
 80150a2:	4b22      	ldr	r3, [pc, #136]	@ (801512c <fn_0801506C+0xc0>)
 80150a4:	4698      	mov	r8, r3
 80150a6:	465b      	mov	r3, fp
 80150a8:	0112      	lsls	r2, r2, #4
 80150aa:	58b2      	ldr	r2, [r6, r2]
 80150ac:	9303      	str	r3, [sp, #12]
 80150ae:	4692      	mov	sl, r2
 80150b0:	2200      	movs	r2, #0
 80150b2:	e00d      	b.n	80150d0 <fn_0801506C+0x64>
 80150b4:	18c9      	adds	r1, r1, r3
 80150b6:	894b      	ldrh	r3, [r1, #10]
 80150b8:	0098      	lsls	r0, r3, #2
 80150ba:	18c0      	adds	r0, r0, r3
 80150bc:	9b01      	ldr	r3, [sp, #4]
 80150be:	00c0      	lsls	r0, r0, #3
 80150c0:	1818      	adds	r0, r3, r0
 80150c2:	6843      	ldr	r3, [r0, #4]
 80150c4:	9902      	ldr	r1, [sp, #8]
 80150c6:	428b      	cmp	r3, r1
 80150c8:	d024      	beq.n	8015114 <fn_0801506C+0xa8>
 80150ca:	3201      	adds	r2, #1
 80150cc:	4594      	cmp	ip, r2
 80150ce:	dd20      	ble.n	8015112 <fn_0801506C+0xa6>
 80150d0:	4649      	mov	r1, r9
 80150d2:	0053      	lsls	r3, r2, #1
 80150d4:	5acb      	ldrh	r3, [r1, r3]
 80150d6:	015b      	lsls	r3, r3, #5
 80150d8:	4453      	add	r3, sl
 80150da:	8adc      	ldrh	r4, [r3, #22]
 80150dc:	4544      	cmp	r4, r8
 80150de:	d0f4      	beq.n	80150ca <fn_0801506C+0x5e>
 80150e0:	25e1      	movs	r5, #225	@ 0xe1
 80150e2:	8a98      	ldrh	r0, [r3, #20]
 80150e4:	4b12      	ldr	r3, [pc, #72]	@ (8015130 <fn_0801506C+0xc4>)
 80150e6:	012d      	lsls	r5, r5, #4
 80150e8:	58f1      	ldr	r1, [r6, r3]
 80150ea:	0043      	lsls	r3, r0, #1
 80150ec:	5977      	ldr	r7, [r6, r5]
 80150ee:	181b      	adds	r3, r3, r0
 80150f0:	009b      	lsls	r3, r3, #2
 80150f2:	18cd      	adds	r5, r1, r3
 80150f4:	42b8      	cmp	r0, r7
 80150f6:	d202      	bcs.n	80150fe <fn_0801506C+0x92>
 80150f8:	480e      	ldr	r0, [pc, #56]	@ (8015134 <fn_0801506C+0xc8>)
 80150fa:	5835      	ldr	r5, [r6, r0]
 80150fc:	18ed      	adds	r5, r5, r3
 80150fe:	8968      	ldrh	r0, [r5, #10]
 8015100:	9d03      	ldr	r5, [sp, #12]
 8015102:	42a8      	cmp	r0, r5
 8015104:	d1d6      	bne.n	80150b4 <fn_0801506C+0x48>
 8015106:	0063      	lsls	r3, r4, #1
 8015108:	191b      	adds	r3, r3, r4
 801510a:	009b      	lsls	r3, r3, #2
 801510c:	18cb      	adds	r3, r1, r3
 801510e:	895b      	ldrh	r3, [r3, #10]
 8015110:	e7d2      	b.n	80150b8 <fn_0801506C+0x4c>
 8015112:	2000      	movs	r0, #0
 8015114:	b005      	add	sp, #20
 8015116:	bcf0      	pop	{r4, r5, r6, r7}
 8015118:	46bb      	mov	fp, r7
 801511a:	46b2      	mov	sl, r6
 801511c:	46a9      	mov	r9, r5
 801511e:	46a0      	mov	r8, r4
 8015120:	bcf0      	pop	{r4, r5, r6, r7}
 8015122:	bc02      	pop	{r1}
 8015124:	4708      	bx	r1
 8015126:	46c0      	nop			@ (mov r8, r8)
 8015128:	030064c4 	.word	0x030064c4
 801512c:	0000ffff 	.word	0x0000ffff
 8015130:	00000e0c 	.word	0x00000e0c
 8015134:	00000e14 	.word	0x00000e14
