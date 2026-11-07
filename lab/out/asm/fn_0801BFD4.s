fn_0801BFD4:
 801bfd4:	b5f0      	push	{r4, r5, r6, r7, lr}
 801bfd6:	4657      	mov	r7, sl
 801bfd8:	4645      	mov	r5, r8
 801bfda:	46de      	mov	lr, fp
 801bfdc:	464e      	mov	r6, r9
 801bfde:	b5e0      	push	{r5, r6, r7, lr}
 801bfe0:	001d      	movs	r5, r3
 801bfe2:	2404      	movs	r4, #4
 801bfe4:	5f1b      	ldrsh	r3, [r3, r4]
 801bfe6:	1ac0      	subs	r0, r0, r3
 801bfe8:	0043      	lsls	r3, r0, #1
 801bfea:	181b      	adds	r3, r3, r0
 801bfec:	039b      	lsls	r3, r3, #14
 801bfee:	141b      	asrs	r3, r3, #16
 801bff0:	469a      	mov	sl, r3
 801bff2:	2400      	movs	r4, #0
 801bff4:	5f2b      	ldrsh	r3, [r5, r4]
 801bff6:	1818      	adds	r0, r3, r0
 801bff8:	0043      	lsls	r3, r0, #1
 801bffa:	181b      	adds	r3, r3, r0
 801bffc:	039b      	lsls	r3, r3, #14
 801bffe:	b089      	sub	sp, #36	@ 0x24
 801c000:	1418      	asrs	r0, r3, #16
 801c002:	4582      	cmp	sl, r0
 801c004:	da7d      	bge.n	801c102 <fn_0801BFD4+0x12e>
 801c006:	2406      	movs	r4, #6
 801c008:	5f2b      	ldrsh	r3, [r5, r4]
 801c00a:	1ace      	subs	r6, r1, r3
 801c00c:	4944      	ldr	r1, [pc, #272]	@ (801c120 <fn_0801BFD4+0x14c>)
 801c00e:	4b45      	ldr	r3, [pc, #276]	@ (801c124 <fn_0801BFD4+0x150>)
 801c010:	1852      	adds	r2, r2, r1
 801c012:	681b      	ldr	r3, [r3, #0]
 801c014:	00d2      	lsls	r2, r2, #3
 801c016:	58d4      	ldr	r4, [r2, r3]
 801c018:	2202      	movs	r2, #2
 801c01a:	5eab      	ldrsh	r3, [r5, r2]
 801c01c:	4942      	ldr	r1, [pc, #264]	@ (801c128 <fn_0801BFD4+0x154>)
 801c01e:	199a      	adds	r2, r3, r6
 801c020:	000b      	movs	r3, r1
 801c022:	4353      	muls	r3, r2
 801c024:	9103      	str	r1, [sp, #12]
 801c026:	1419      	asrs	r1, r3, #16
 801c028:	2301      	movs	r3, #1
 801c02a:	9404      	str	r4, [sp, #16]
 801c02c:	2200      	movs	r2, #0
 801c02e:	469c      	mov	ip, r3
 801c030:	27ff      	movs	r7, #255	@ 0xff
 801c032:	0034      	movs	r4, r6
 801c034:	9005      	str	r0, [sp, #20]
 801c036:	9107      	str	r1, [sp, #28]
 801c038:	4653      	mov	r3, sl
 801c03a:	2b00      	cmp	r3, #0
 801c03c:	db5a      	blt.n	801c0f4 <fn_0801BFD4+0x120>
 801c03e:	2bef      	cmp	r3, #239	@ 0xef
 801c040:	dc5f      	bgt.n	801c102 <fn_0801BFD4+0x12e>
 801c042:	1413      	asrs	r3, r2, #16
 801c044:	3302      	adds	r3, #2
 801c046:	009b      	lsls	r3, r3, #2
 801c048:	58eb      	ldr	r3, [r5, r3]
 801c04a:	18ee      	adds	r6, r5, r3
 801c04c:	5ceb      	ldrb	r3, [r5, r3]
 801c04e:	2bff      	cmp	r3, #255	@ 0xff
 801c050:	d050      	beq.n	801c0f4 <fn_0801BFD4+0x120>
 801c052:	9907      	ldr	r1, [sp, #28]
 801c054:	299f      	cmp	r1, #159	@ 0x9f
 801c056:	dd5d      	ble.n	801c114 <fn_0801BFD4+0x140>
 801c058:	219f      	movs	r1, #159	@ 0x9f
 801c05a:	46a3      	mov	fp, r4
 801c05c:	0034      	movs	r4, r6
 801c05e:	9102      	str	r1, [sp, #8]
 801c060:	9206      	str	r2, [sp, #24]
 801c062:	9803      	ldr	r0, [sp, #12]
 801c064:	445b      	add	r3, fp
 801c066:	0001      	movs	r1, r0
 801c068:	4359      	muls	r1, r3
 801c06a:	9a02      	ldr	r2, [sp, #8]
 801c06c:	1409      	asrs	r1, r1, #16
 801c06e:	4291      	cmp	r1, r2
 801c070:	dc3e      	bgt.n	801c0f0 <fn_0801BFD4+0x11c>
 801c072:	7862      	ldrb	r2, [r4, #1]
 801c074:	4690      	mov	r8, r2
 801c076:	4443      	add	r3, r8
 801c078:	001a      	movs	r2, r3
 801c07a:	0003      	movs	r3, r0
 801c07c:	4353      	muls	r3, r2
 801c07e:	141b      	asrs	r3, r3, #16
 801c080:	1a5a      	subs	r2, r3, r1
 801c082:	428b      	cmp	r3, r1
 801c084:	d02e      	beq.n	801c0e4 <fn_0801BFD4+0x110>
 801c086:	010b      	lsls	r3, r1, #4
 801c088:	1a5b      	subs	r3, r3, r1
 801c08a:	011b      	lsls	r3, r3, #4
 801c08c:	9904      	ldr	r1, [sp, #16]
 801c08e:	4453      	add	r3, sl
 801c090:	18cb      	adds	r3, r1, r3
 801c092:	4641      	mov	r1, r8
 801c094:	0096      	lsls	r6, r2, #2
 801c096:	18b6      	adds	r6, r6, r2
 801c098:	46a8      	mov	r8, r5
 801c09a:	2200      	movs	r2, #0
 801c09c:	9101      	str	r1, [sp, #4]
 801c09e:	1e58      	subs	r0, r3, #1
 801c0a0:	03b5      	lsls	r5, r6, #14
 801c0a2:	e00b      	b.n	801c0bc <fn_0801BFD4+0xe8>
 801c0a4:	8806      	ldrh	r6, [r0, #0]
 801c0a6:	0209      	lsls	r1, r1, #8
 801c0a8:	403e      	ands	r6, r7
 801c0aa:	430e      	orrs	r6, r1
 801c0ac:	21a0      	movs	r1, #160	@ 0xa0
 801c0ae:	0249      	lsls	r1, r1, #9
 801c0b0:	1852      	adds	r2, r2, r1
 801c0b2:	8006      	strh	r6, [r0, #0]
 801c0b4:	33f0      	adds	r3, #240	@ 0xf0
 801c0b6:	30f0      	adds	r0, #240	@ 0xf0
 801c0b8:	42aa      	cmp	r2, r5
 801c0ba:	d010      	beq.n	801c0de <fn_0801BFD4+0x10a>
 801c0bc:	4666      	mov	r6, ip
 801c0be:	1411      	asrs	r1, r2, #16
 801c0c0:	1861      	adds	r1, r4, r1
 801c0c2:	78c9      	ldrb	r1, [r1, #3]
 801c0c4:	4233      	tst	r3, r6
 801c0c6:	d1ed      	bne.n	801c0a4 <fn_0801BFD4+0xd0>
 801c0c8:	881e      	ldrh	r6, [r3, #0]
 801c0ca:	43be      	bics	r6, r7
 801c0cc:	4331      	orrs	r1, r6
 801c0ce:	8019      	strh	r1, [r3, #0]
 801c0d0:	21a0      	movs	r1, #160	@ 0xa0
 801c0d2:	0249      	lsls	r1, r1, #9
 801c0d4:	1852      	adds	r2, r2, r1
 801c0d6:	33f0      	adds	r3, #240	@ 0xf0
 801c0d8:	30f0      	adds	r0, #240	@ 0xf0
 801c0da:	42aa      	cmp	r2, r5
 801c0dc:	d1ee      	bne.n	801c0bc <fn_0801BFD4+0xe8>
 801c0de:	9b01      	ldr	r3, [sp, #4]
 801c0e0:	4645      	mov	r5, r8
 801c0e2:	4698      	mov	r8, r3
 801c0e4:	4643      	mov	r3, r8
 801c0e6:	3304      	adds	r3, #4
 801c0e8:	18e4      	adds	r4, r4, r3
 801c0ea:	7823      	ldrb	r3, [r4, #0]
 801c0ec:	2bff      	cmp	r3, #255	@ 0xff
 801c0ee:	d1b8      	bne.n	801c062 <fn_0801BFD4+0x8e>
 801c0f0:	465c      	mov	r4, fp
 801c0f2:	9a06      	ldr	r2, [sp, #24]
 801c0f4:	2301      	movs	r3, #1
 801c0f6:	449a      	add	sl, r3
 801c0f8:	4b0c      	ldr	r3, [pc, #48]	@ (801c12c <fn_0801BFD4+0x158>)
 801c0fa:	18d2      	adds	r2, r2, r3
 801c0fc:	9b05      	ldr	r3, [sp, #20]
 801c0fe:	4553      	cmp	r3, sl
 801c100:	d19a      	bne.n	801c038 <fn_0801BFD4+0x64>
 801c102:	b009      	add	sp, #36	@ 0x24
 801c104:	bcf0      	pop	{r4, r5, r6, r7}
 801c106:	46bb      	mov	fp, r7
 801c108:	46b2      	mov	sl, r6
 801c10a:	46a9      	mov	r9, r5
 801c10c:	46a0      	mov	r8, r4
 801c10e:	bcf0      	pop	{r4, r5, r6, r7}
 801c110:	bc01      	pop	{r0}
 801c112:	4700      	bx	r0
 801c114:	46a3      	mov	fp, r4
 801c116:	9102      	str	r1, [sp, #8]
 801c118:	0034      	movs	r4, r6
 801c11a:	9206      	str	r2, [sp, #24]
 801c11c:	e7a1      	b.n	801c062 <fn_0801BFD4+0x8e>
 801c11e:	46c0      	nop			@ (mov r8, r8)
 801c120:	00000b46 	.word	0x00000b46
 801c124:	030064c4 	.word	0x030064c4	@ data_030064C4
 801c128:	0000ce14 	.word	0x0000ce14
 801c12c:	00015555 	.word	0x00015555
