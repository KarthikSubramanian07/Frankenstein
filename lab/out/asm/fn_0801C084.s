fn_0801C084:
 801c084:	b5f0      	push	{r4, r5, r6, r7, lr}
 801c086:	4657      	mov	r7, sl
 801c088:	4645      	mov	r5, r8
 801c08a:	46de      	mov	lr, fp
 801c08c:	464e      	mov	r6, r9
 801c08e:	b5e0      	push	{r5, r6, r7, lr}
 801c090:	001d      	movs	r5, r3
 801c092:	2404      	movs	r4, #4
 801c094:	5f1b      	ldrsh	r3, [r3, r4]
 801c096:	1ac0      	subs	r0, r0, r3
 801c098:	0043      	lsls	r3, r0, #1
 801c09a:	181b      	adds	r3, r3, r0
 801c09c:	039b      	lsls	r3, r3, #14
 801c09e:	141b      	asrs	r3, r3, #16
 801c0a0:	469a      	mov	sl, r3
 801c0a2:	2400      	movs	r4, #0
 801c0a4:	5f2b      	ldrsh	r3, [r5, r4]
 801c0a6:	1818      	adds	r0, r3, r0
 801c0a8:	0043      	lsls	r3, r0, #1
 801c0aa:	181b      	adds	r3, r3, r0
 801c0ac:	039b      	lsls	r3, r3, #14
 801c0ae:	b089      	sub	sp, #36	@ 0x24
 801c0b0:	1418      	asrs	r0, r3, #16
 801c0b2:	4582      	cmp	sl, r0
 801c0b4:	da7d      	bge.n	801c1b2 <fn_0801C084+0x12e>
 801c0b6:	2406      	movs	r4, #6
 801c0b8:	5f2b      	ldrsh	r3, [r5, r4]
 801c0ba:	1ace      	subs	r6, r1, r3
 801c0bc:	4944      	ldr	r1, [pc, #272]	@ (801c1d0 <fn_0801C084+0x14c>)
 801c0be:	4b45      	ldr	r3, [pc, #276]	@ (801c1d4 <fn_0801C084+0x150>)
 801c0c0:	1852      	adds	r2, r2, r1
 801c0c2:	681b      	ldr	r3, [r3, #0]
 801c0c4:	00d2      	lsls	r2, r2, #3
 801c0c6:	58d4      	ldr	r4, [r2, r3]
 801c0c8:	2202      	movs	r2, #2
 801c0ca:	5eab      	ldrsh	r3, [r5, r2]
 801c0cc:	4942      	ldr	r1, [pc, #264]	@ (801c1d8 <fn_0801C084+0x154>)
 801c0ce:	199a      	adds	r2, r3, r6
 801c0d0:	000b      	movs	r3, r1
 801c0d2:	4353      	muls	r3, r2
 801c0d4:	9103      	str	r1, [sp, #12]
 801c0d6:	1419      	asrs	r1, r3, #16
 801c0d8:	2301      	movs	r3, #1
 801c0da:	9404      	str	r4, [sp, #16]
 801c0dc:	2200      	movs	r2, #0
 801c0de:	469c      	mov	ip, r3
 801c0e0:	27ff      	movs	r7, #255	@ 0xff
 801c0e2:	0034      	movs	r4, r6
 801c0e4:	9005      	str	r0, [sp, #20]
 801c0e6:	9107      	str	r1, [sp, #28]
 801c0e8:	4653      	mov	r3, sl
 801c0ea:	2b00      	cmp	r3, #0
 801c0ec:	db5a      	blt.n	801c1a4 <fn_0801C084+0x120>
 801c0ee:	2bef      	cmp	r3, #239	@ 0xef
 801c0f0:	dc5f      	bgt.n	801c1b2 <fn_0801C084+0x12e>
 801c0f2:	1413      	asrs	r3, r2, #16
 801c0f4:	3302      	adds	r3, #2
 801c0f6:	009b      	lsls	r3, r3, #2
 801c0f8:	58eb      	ldr	r3, [r5, r3]
 801c0fa:	18ee      	adds	r6, r5, r3
 801c0fc:	5ceb      	ldrb	r3, [r5, r3]
 801c0fe:	2bff      	cmp	r3, #255	@ 0xff
 801c100:	d050      	beq.n	801c1a4 <fn_0801C084+0x120>
 801c102:	9907      	ldr	r1, [sp, #28]
 801c104:	299f      	cmp	r1, #159	@ 0x9f
 801c106:	dd5d      	ble.n	801c1c4 <fn_0801C084+0x140>
 801c108:	219f      	movs	r1, #159	@ 0x9f
 801c10a:	46a3      	mov	fp, r4
 801c10c:	0034      	movs	r4, r6
 801c10e:	9102      	str	r1, [sp, #8]
 801c110:	9206      	str	r2, [sp, #24]
 801c112:	9803      	ldr	r0, [sp, #12]
 801c114:	445b      	add	r3, fp
 801c116:	0001      	movs	r1, r0
 801c118:	4359      	muls	r1, r3
 801c11a:	9a02      	ldr	r2, [sp, #8]
 801c11c:	1409      	asrs	r1, r1, #16
 801c11e:	4291      	cmp	r1, r2
 801c120:	dc3e      	bgt.n	801c1a0 <fn_0801C084+0x11c>
 801c122:	7862      	ldrb	r2, [r4, #1]
 801c124:	4690      	mov	r8, r2
 801c126:	4443      	add	r3, r8
 801c128:	001a      	movs	r2, r3
 801c12a:	0003      	movs	r3, r0
 801c12c:	4353      	muls	r3, r2
 801c12e:	141b      	asrs	r3, r3, #16
 801c130:	1a5a      	subs	r2, r3, r1
 801c132:	428b      	cmp	r3, r1
 801c134:	d02e      	beq.n	801c194 <fn_0801C084+0x110>
 801c136:	010b      	lsls	r3, r1, #4
 801c138:	1a5b      	subs	r3, r3, r1
 801c13a:	011b      	lsls	r3, r3, #4
 801c13c:	9904      	ldr	r1, [sp, #16]
 801c13e:	4453      	add	r3, sl
 801c140:	18cb      	adds	r3, r1, r3
 801c142:	4641      	mov	r1, r8
 801c144:	0096      	lsls	r6, r2, #2
 801c146:	18b6      	adds	r6, r6, r2
 801c148:	46a8      	mov	r8, r5
 801c14a:	2200      	movs	r2, #0
 801c14c:	9101      	str	r1, [sp, #4]
 801c14e:	1e58      	subs	r0, r3, #1
 801c150:	03b5      	lsls	r5, r6, #14
 801c152:	e00b      	b.n	801c16c <fn_0801C084+0xe8>
 801c154:	8806      	ldrh	r6, [r0, #0]
 801c156:	0209      	lsls	r1, r1, #8
 801c158:	403e      	ands	r6, r7
 801c15a:	430e      	orrs	r6, r1
 801c15c:	21a0      	movs	r1, #160	@ 0xa0
 801c15e:	0249      	lsls	r1, r1, #9
 801c160:	1852      	adds	r2, r2, r1
 801c162:	8006      	strh	r6, [r0, #0]
 801c164:	33f0      	adds	r3, #240	@ 0xf0
 801c166:	30f0      	adds	r0, #240	@ 0xf0
 801c168:	42aa      	cmp	r2, r5
 801c16a:	d010      	beq.n	801c18e <fn_0801C084+0x10a>
 801c16c:	4666      	mov	r6, ip
 801c16e:	1411      	asrs	r1, r2, #16
 801c170:	1861      	adds	r1, r4, r1
 801c172:	78c9      	ldrb	r1, [r1, #3]
 801c174:	4233      	tst	r3, r6
 801c176:	d1ed      	bne.n	801c154 <fn_0801C084+0xd0>
 801c178:	881e      	ldrh	r6, [r3, #0]
 801c17a:	43be      	bics	r6, r7
 801c17c:	4331      	orrs	r1, r6
 801c17e:	8019      	strh	r1, [r3, #0]
 801c180:	21a0      	movs	r1, #160	@ 0xa0
 801c182:	0249      	lsls	r1, r1, #9
 801c184:	1852      	adds	r2, r2, r1
 801c186:	33f0      	adds	r3, #240	@ 0xf0
 801c188:	30f0      	adds	r0, #240	@ 0xf0
 801c18a:	42aa      	cmp	r2, r5
 801c18c:	d1ee      	bne.n	801c16c <fn_0801C084+0xe8>
 801c18e:	9b01      	ldr	r3, [sp, #4]
 801c190:	4645      	mov	r5, r8
 801c192:	4698      	mov	r8, r3
 801c194:	4643      	mov	r3, r8
 801c196:	3304      	adds	r3, #4
 801c198:	18e4      	adds	r4, r4, r3
 801c19a:	7823      	ldrb	r3, [r4, #0]
 801c19c:	2bff      	cmp	r3, #255	@ 0xff
 801c19e:	d1b8      	bne.n	801c112 <fn_0801C084+0x8e>
 801c1a0:	465c      	mov	r4, fp
 801c1a2:	9a06      	ldr	r2, [sp, #24]
 801c1a4:	2301      	movs	r3, #1
 801c1a6:	449a      	add	sl, r3
 801c1a8:	4b0c      	ldr	r3, [pc, #48]	@ (801c1dc <fn_0801C084+0x158>)
 801c1aa:	18d2      	adds	r2, r2, r3
 801c1ac:	9b05      	ldr	r3, [sp, #20]
 801c1ae:	4553      	cmp	r3, sl
 801c1b0:	d19a      	bne.n	801c0e8 <fn_0801C084+0x64>
 801c1b2:	b009      	add	sp, #36	@ 0x24
 801c1b4:	bcf0      	pop	{r4, r5, r6, r7}
 801c1b6:	46bb      	mov	fp, r7
 801c1b8:	46b2      	mov	sl, r6
 801c1ba:	46a9      	mov	r9, r5
 801c1bc:	46a0      	mov	r8, r4
 801c1be:	bcf0      	pop	{r4, r5, r6, r7}
 801c1c0:	bc01      	pop	{r0}
 801c1c2:	4700      	bx	r0
 801c1c4:	46a3      	mov	fp, r4
 801c1c6:	9102      	str	r1, [sp, #8]
 801c1c8:	0034      	movs	r4, r6
 801c1ca:	9206      	str	r2, [sp, #24]
 801c1cc:	e7a1      	b.n	801c112 <fn_0801C084+0x8e>
 801c1ce:	46c0      	nop			@ (mov r8, r8)
 801c1d0:	00000b46 	.word	0x00000b46
 801c1d4:	030064c4 	.word	0x030064c4
 801c1d8:	0000ce14 	.word	0x0000ce14
 801c1dc:	00015555 	.word	0x00015555
