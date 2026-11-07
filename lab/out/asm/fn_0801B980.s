fn_0801B980:
 801b980:	b5f0      	push	{r4, r5, r6, r7, lr}
 801b982:	46ce      	mov	lr, r9
 801b984:	4647      	mov	r7, r8
 801b986:	b580      	push	{r7, lr}
 801b988:	4bb3      	ldr	r3, [pc, #716]	@ (801bc58 <fn_0801B980+0x2d8>)
 801b98a:	4699      	mov	r9, r3
 801b98c:	7a1b      	ldrb	r3, [r3, #8]
 801b98e:	b083      	sub	sp, #12
 801b990:	2b00      	cmp	r3, #0
 801b992:	d100      	bne.n	801b996 <fn_0801B980+0x16>
 801b994:	e159      	b.n	801bc4a <fn_0801B980+0x2ca>
 801b996:	2101      	movs	r1, #1
 801b998:	4fb0      	ldr	r7, [pc, #704]	@ (801bc5c <fn_0801B980+0x2dc>)
 801b99a:	4bb1      	ldr	r3, [pc, #708]	@ (801bc60 <fn_0801B980+0x2e0>)
 801b99c:	683a      	ldr	r2, [r7, #0]
 801b99e:	54d1      	strb	r1, [r2, r3]
 801b9a0:	2100      	movs	r1, #0
 801b9a2:	2001      	movs	r0, #1
 801b9a4:	4baf      	ldr	r3, [pc, #700]	@ (801bc64 <fn_0801B980+0x2e4>)
 801b9a6:	50d1      	str	r1, [r2, r3]
 801b9a8:	4baf      	ldr	r3, [pc, #700]	@ (801bc68 <fn_0801B980+0x2e8>)
 801b9aa:	4240      	negs	r0, r0
 801b9ac:	50d0      	str	r0, [r2, r3]
 801b9ae:	3b28      	subs	r3, #40	@ 0x28
 801b9b0:	50d0      	str	r0, [r2, r3]
 801b9b2:	23a4      	movs	r3, #164	@ 0xa4
 801b9b4:	005b      	lsls	r3, r3, #1
 801b9b6:	58d3      	ldr	r3, [r2, r3]
 801b9b8:	1e59      	subs	r1, r3, #1
 801b9ba:	418b      	sbcs	r3, r1
 801b9bc:	21a6      	movs	r1, #166	@ 0xa6
 801b9be:	0049      	lsls	r1, r1, #1
 801b9c0:	5851      	ldr	r1, [r2, r1]
 801b9c2:	1e4c      	subs	r4, r1, #1
 801b9c4:	41a1      	sbcs	r1, r4
 801b9c6:	24a8      	movs	r4, #168	@ 0xa8
 801b9c8:	0209      	lsls	r1, r1, #8
 801b9ca:	430b      	orrs	r3, r1
 801b9cc:	21aa      	movs	r1, #170	@ 0xaa
 801b9ce:	0064      	lsls	r4, r4, #1
 801b9d0:	5914      	ldr	r4, [r2, r4]
 801b9d2:	0049      	lsls	r1, r1, #1
 801b9d4:	5851      	ldr	r1, [r2, r1]
 801b9d6:	1e65      	subs	r5, r4, #1
 801b9d8:	41ac      	sbcs	r4, r5
 801b9da:	1e4d      	subs	r5, r1, #1
 801b9dc:	41a9      	sbcs	r1, r5
 801b9de:	0424      	lsls	r4, r4, #16
 801b9e0:	4323      	orrs	r3, r4
 801b9e2:	0609      	lsls	r1, r1, #24
 801b9e4:	430b      	orrs	r3, r1
 801b9e6:	219c      	movs	r1, #156	@ 0x9c
 801b9e8:	0049      	lsls	r1, r1, #1
 801b9ea:	5851      	ldr	r1, [r2, r1]
 801b9ec:	1e4c      	subs	r4, r1, #1
 801b9ee:	41a1      	sbcs	r1, r4
 801b9f0:	249e      	movs	r4, #158	@ 0x9e
 801b9f2:	0064      	lsls	r4, r4, #1
 801b9f4:	5914      	ldr	r4, [r2, r4]
 801b9f6:	1e65      	subs	r5, r4, #1
 801b9f8:	41ac      	sbcs	r4, r5
 801b9fa:	25a0      	movs	r5, #160	@ 0xa0
 801b9fc:	0224      	lsls	r4, r4, #8
 801b9fe:	4321      	orrs	r1, r4
 801ba00:	24a2      	movs	r4, #162	@ 0xa2
 801ba02:	006d      	lsls	r5, r5, #1
 801ba04:	5955      	ldr	r5, [r2, r5]
 801ba06:	0064      	lsls	r4, r4, #1
 801ba08:	5914      	ldr	r4, [r2, r4]
 801ba0a:	1e6e      	subs	r6, r5, #1
 801ba0c:	41b5      	sbcs	r5, r6
 801ba0e:	1e66      	subs	r6, r4, #1
 801ba10:	41b4      	sbcs	r4, r6
 801ba12:	042d      	lsls	r5, r5, #16
 801ba14:	0624      	lsls	r4, r4, #24
 801ba16:	4329      	orrs	r1, r5
 801ba18:	4321      	orrs	r1, r4
 801ba1a:	4c94      	ldr	r4, [pc, #592]	@ (801bc6c <fn_0801B980+0x2ec>)
 801ba1c:	5111      	str	r1, [r2, r4]
 801ba1e:	4994      	ldr	r1, [pc, #592]	@ (801bc70 <fn_0801B980+0x2f0>)
 801ba20:	5053      	str	r3, [r2, r1]
 801ba22:	23ac      	movs	r3, #172	@ 0xac
 801ba24:	005b      	lsls	r3, r3, #1
 801ba26:	58d3      	ldr	r3, [r2, r3]
 801ba28:	1e59      	subs	r1, r3, #1
 801ba2a:	418b      	sbcs	r3, r1
 801ba2c:	4991      	ldr	r1, [pc, #580]	@ (801bc74 <fn_0801B980+0x2f4>)
 801ba2e:	5453      	strb	r3, [r2, r1]
 801ba30:	2102      	movs	r1, #2
 801ba32:	4b91      	ldr	r3, [pc, #580]	@ (801bc78 <fn_0801B980+0x2f8>)
 801ba34:	50d0      	str	r0, [r2, r3]
 801ba36:	4b91      	ldr	r3, [pc, #580]	@ (801bc7c <fn_0801B980+0x2fc>)
 801ba38:	50d0      	str	r0, [r2, r3]
 801ba3a:	4b91      	ldr	r3, [pc, #580]	@ (801bc80 <fn_0801B980+0x300>)
 801ba3c:	50d0      	str	r0, [r2, r3]
 801ba3e:	4b91      	ldr	r3, [pc, #580]	@ (801bc84 <fn_0801B980+0x304>)
 801ba40:	50d1      	str	r1, [r2, r3]
 801ba42:	4b91      	ldr	r3, [pc, #580]	@ (801bc88 <fn_0801B980+0x308>)
 801ba44:	3180      	adds	r1, #128	@ 0x80
 801ba46:	18d0      	adds	r0, r2, r3
 801ba48:	5c51      	ldrb	r1, [r2, r1]
 801ba4a:	4b90      	ldr	r3, [pc, #576]	@ (801bc8c <fn_0801B980+0x30c>)
 801ba4c:	18d3      	adds	r3, r2, r3
 801ba4e:	2900      	cmp	r1, #0
 801ba50:	d000      	beq.n	801ba54 <fn_0801B980+0xd4>
 801ba52:	e0f8      	b.n	801bc46 <fn_0801B980+0x2c6>
 801ba54:	2134      	movs	r1, #52	@ 0x34
 801ba56:	31ff      	adds	r1, #255	@ 0xff
 801ba58:	5c54      	ldrb	r4, [r2, r1]
 801ba5a:	498d      	ldr	r1, [pc, #564]	@ (801bc90 <fn_0801B980+0x310>)
 801ba5c:	5855      	ldr	r5, [r2, r1]
 801ba5e:	0061      	lsls	r1, r4, #1
 801ba60:	1909      	adds	r1, r1, r4
 801ba62:	00c9      	lsls	r1, r1, #3
 801ba64:	5949      	ldr	r1, [r1, r5]
 801ba66:	2905      	cmp	r1, #5
 801ba68:	d100      	bne.n	801ba6c <fn_0801B980+0xec>
 801ba6a:	e0ea      	b.n	801bc42 <fn_0801B980+0x2c2>
 801ba6c:	3157      	adds	r1, #87	@ 0x57
 801ba6e:	0089      	lsls	r1, r1, #2
 801ba70:	1852      	adds	r2, r2, r1
 801ba72:	2403      	movs	r4, #3
 801ba74:	2120      	movs	r1, #32
 801ba76:	9401      	str	r4, [sp, #4]
 801ba78:	9200      	str	r2, [sp, #0]
 801ba7a:	2286      	movs	r2, #134	@ 0x86
 801ba7c:	f7ff f94e 	bl	801ad1c <fn_0801AD1C>
 801ba80:	4d82      	ldr	r5, [pc, #520]	@ (801bc8c <fn_0801B980+0x30c>)
 801ba82:	683a      	ldr	r2, [r7, #0]
 801ba84:	4983      	ldr	r1, [pc, #524]	@ (801bc94 <fn_0801B980+0x314>)
 801ba86:	1953      	adds	r3, r2, r5
 801ba88:	1850      	adds	r0, r2, r1
 801ba8a:	3209      	adds	r2, #9
 801ba8c:	32ff      	adds	r2, #255	@ 0xff
 801ba8e:	2142      	movs	r1, #66	@ 0x42
 801ba90:	9401      	str	r4, [sp, #4]
 801ba92:	9200      	str	r2, [sp, #0]
 801ba94:	2286      	movs	r2, #134	@ 0x86
 801ba96:	f7ff f941 	bl	801ad1c <fn_0801AD1C>
 801ba9a:	683a      	ldr	r2, [r7, #0]
 801ba9c:	497e      	ldr	r1, [pc, #504]	@ (801bc98 <fn_0801B980+0x318>)
 801ba9e:	1953      	adds	r3, r2, r5
 801baa0:	1850      	adds	r0, r2, r1
 801baa2:	320d      	adds	r2, #13
 801baa4:	32ff      	adds	r2, #255	@ 0xff
 801baa6:	9401      	str	r4, [sp, #4]
 801baa8:	9200      	str	r2, [sp, #0]
 801baaa:	21a6      	movs	r1, #166	@ 0xa6
 801baac:	2286      	movs	r2, #134	@ 0x86
 801baae:	f7ff f935 	bl	801ad1c <fn_0801AD1C>
 801bab2:	4b7a      	ldr	r3, [pc, #488]	@ (801bc9c <fn_0801B980+0x31c>)
 801bab4:	2400      	movs	r4, #0
 801bab6:	4698      	mov	r8, r3
 801bab8:	0020      	movs	r0, r4
 801baba:	2103      	movs	r1, #3
 801babc:	f009 fd14 	bl	80254e8 <fn_080254E8>
 801bac0:	0020      	movs	r0, r4
 801bac2:	00cd      	lsls	r5, r1, #3
 801bac4:	2103      	movs	r1, #3
 801bac6:	f009 fd63 	bl	8025590 <fn_08025590>
 801baca:	230a      	movs	r3, #10
 801bacc:	4974      	ldr	r1, [pc, #464]	@ (801bca0 <fn_0801B980+0x320>)
 801bace:	4242      	negs	r2, r0
 801bad0:	401a      	ands	r2, r3
 801bad2:	00e3      	lsls	r3, r4, #3
 801bad4:	185b      	adds	r3, r3, r1
 801bad6:	4641      	mov	r1, r8
 801bad8:	683e      	ldr	r6, [r7, #0]
 801bada:	3401      	adds	r4, #1
 801badc:	1870      	adds	r0, r6, r1
 801bade:	00a1      	lsls	r1, r4, #2
 801bae0:	3139      	adds	r1, #57	@ 0x39
 801bae2:	31ff      	adds	r1, #255	@ 0xff
 801bae4:	18f3      	adds	r3, r6, r3
 801bae6:	1876      	adds	r6, r6, r1
 801bae8:	2102      	movs	r1, #2
 801baea:	3552      	adds	r5, #82	@ 0x52
 801baec:	9100      	str	r1, [sp, #0]
 801baee:	9601      	str	r6, [sp, #4]
 801baf0:	0029      	movs	r1, r5
 801baf2:	3284      	adds	r2, #132	@ 0x84
 801baf4:	f7ff fa7c 	bl	801aff0 <fn_0801AFF0>
 801baf8:	231c      	movs	r3, #28
 801bafa:	4498      	add	r8, r3
 801bafc:	2c06      	cmp	r4, #6
 801bafe:	d1db      	bne.n	801bab8 <fn_0801B980+0x138>
 801bb00:	683a      	ldr	r2, [r7, #0]
 801bb02:	4968      	ldr	r1, [pc, #416]	@ (801bca4 <fn_0801B980+0x324>)
 801bb04:	4d68      	ldr	r5, [pc, #416]	@ (801bca8 <fn_0801B980+0x328>)
 801bb06:	1850      	adds	r0, r2, r1
 801bb08:	495b      	ldr	r1, [pc, #364]	@ (801bc78 <fn_0801B980+0x2f8>)
 801bb0a:	1953      	adds	r3, r2, r5
 801bb0c:	1852      	adds	r2, r2, r1
 801bb0e:	9201      	str	r2, [sp, #4]
 801bb10:	9400      	str	r4, [sp, #0]
 801bb12:	2283      	movs	r2, #131	@ 0x83
 801bb14:	21b2      	movs	r1, #178	@ 0xb2
 801bb16:	f7ff fa6b 	bl	801aff0 <fn_0801AFF0>
 801bb1a:	683a      	ldr	r2, [r7, #0]
 801bb1c:	4963      	ldr	r1, [pc, #396]	@ (801bcac <fn_0801B980+0x32c>)
 801bb1e:	1850      	adds	r0, r2, r1
 801bb20:	4956      	ldr	r1, [pc, #344]	@ (801bc7c <fn_0801B980+0x2fc>)
 801bb22:	1953      	adds	r3, r2, r5
 801bb24:	1852      	adds	r2, r2, r1
 801bb26:	9201      	str	r2, [sp, #4]
 801bb28:	9400      	str	r4, [sp, #0]
 801bb2a:	228d      	movs	r2, #141	@ 0x8d
 801bb2c:	21b2      	movs	r1, #178	@ 0xb2
 801bb2e:	f7ff fa5f 	bl	801aff0 <fn_0801AFF0>
 801bb32:	683a      	ldr	r2, [r7, #0]
 801bb34:	495e      	ldr	r1, [pc, #376]	@ (801bcb0 <fn_0801B980+0x330>)
 801bb36:	1850      	adds	r0, r2, r1
 801bb38:	4951      	ldr	r1, [pc, #324]	@ (801bc80 <fn_0801B980+0x300>)
 801bb3a:	1953      	adds	r3, r2, r5
 801bb3c:	1852      	adds	r2, r2, r1
 801bb3e:	9201      	str	r2, [sp, #4]
 801bb40:	9400      	str	r4, [sp, #0]
 801bb42:	2297      	movs	r2, #151	@ 0x97
 801bb44:	21b2      	movs	r1, #178	@ 0xb2
 801bb46:	4d5b      	ldr	r5, [pc, #364]	@ (801bcb4 <fn_0801B980+0x334>)
 801bb48:	f7ff fa52 	bl	801aff0 <fn_0801AFF0>
 801bb4c:	683a      	ldr	r2, [r7, #0]
 801bb4e:	495a      	ldr	r1, [pc, #360]	@ (801bcb8 <fn_0801B980+0x338>)
 801bb50:	1953      	adds	r3, r2, r5
 801bb52:	1850      	adds	r0, r2, r1
 801bb54:	325d      	adds	r2, #93	@ 0x5d
 801bb56:	3c03      	subs	r4, #3
 801bb58:	32ff      	adds	r2, #255	@ 0xff
 801bb5a:	9200      	str	r2, [sp, #0]
 801bb5c:	21dc      	movs	r1, #220	@ 0xdc
 801bb5e:	2285      	movs	r2, #133	@ 0x85
 801bb60:	9401      	str	r4, [sp, #4]
 801bb62:	f7ff f8db 	bl	801ad1c <fn_0801AD1C>
 801bb66:	21b2      	movs	r1, #178	@ 0xb2
 801bb68:	683a      	ldr	r2, [r7, #0]
 801bb6a:	01c9      	lsls	r1, r1, #7
 801bb6c:	1953      	adds	r3, r2, r5
 801bb6e:	1850      	adds	r0, r2, r1
 801bb70:	3261      	adds	r2, #97	@ 0x61
 801bb72:	32ff      	adds	r2, #255	@ 0xff
 801bb74:	9200      	str	r2, [sp, #0]
 801bb76:	21dc      	movs	r1, #220	@ 0xdc
 801bb78:	228b      	movs	r2, #139	@ 0x8b
 801bb7a:	9401      	str	r4, [sp, #4]
 801bb7c:	f7ff f8ce 	bl	801ad1c <fn_0801AD1C>
 801bb80:	683a      	ldr	r2, [r7, #0]
 801bb82:	494e      	ldr	r1, [pc, #312]	@ (801bcbc <fn_0801B980+0x33c>)
 801bb84:	1953      	adds	r3, r2, r5
 801bb86:	1850      	adds	r0, r2, r1
 801bb88:	3265      	adds	r2, #101	@ 0x65
 801bb8a:	32ff      	adds	r2, #255	@ 0xff
 801bb8c:	9200      	str	r2, [sp, #0]
 801bb8e:	21dc      	movs	r1, #220	@ 0xdc
 801bb90:	2297      	movs	r2, #151	@ 0x97
 801bb92:	9401      	str	r4, [sp, #4]
 801bb94:	f7ff f8c2 	bl	801ad1c <fn_0801AD1C>
 801bb98:	683a      	ldr	r2, [r7, #0]
 801bb9a:	4949      	ldr	r1, [pc, #292]	@ (801bcc0 <fn_0801B980+0x340>)
 801bb9c:	1953      	adds	r3, r2, r5
 801bb9e:	1850      	adds	r0, r2, r1
 801bba0:	3269      	adds	r2, #105	@ 0x69
 801bba2:	32ff      	adds	r2, #255	@ 0xff
 801bba4:	9200      	str	r2, [sp, #0]
 801bba6:	21dc      	movs	r1, #220	@ 0xdc
 801bba8:	2291      	movs	r2, #145	@ 0x91
 801bbaa:	9401      	str	r4, [sp, #4]
 801bbac:	f7ff f8b6 	bl	801ad1c <fn_0801AD1C>
 801bbb0:	683a      	ldr	r2, [r7, #0]
 801bbb2:	4944      	ldr	r1, [pc, #272]	@ (801bcc4 <fn_0801B980+0x344>)
 801bbb4:	1953      	adds	r3, r2, r5
 801bbb6:	1850      	adds	r0, r2, r1
 801bbb8:	326d      	adds	r2, #109	@ 0x6d
 801bbba:	32ff      	adds	r2, #255	@ 0xff
 801bbbc:	9200      	str	r2, [sp, #0]
 801bbbe:	21ee      	movs	r1, #238	@ 0xee
 801bbc0:	2285      	movs	r2, #133	@ 0x85
 801bbc2:	9401      	str	r4, [sp, #4]
 801bbc4:	f7ff f8aa 	bl	801ad1c <fn_0801AD1C>
 801bbc8:	21b3      	movs	r1, #179	@ 0xb3
 801bbca:	683a      	ldr	r2, [r7, #0]
 801bbcc:	01c9      	lsls	r1, r1, #7
 801bbce:	1953      	adds	r3, r2, r5
 801bbd0:	1850      	adds	r0, r2, r1
 801bbd2:	3271      	adds	r2, #113	@ 0x71
 801bbd4:	32ff      	adds	r2, #255	@ 0xff
 801bbd6:	9200      	str	r2, [sp, #0]
 801bbd8:	21ee      	movs	r1, #238	@ 0xee
 801bbda:	228b      	movs	r2, #139	@ 0x8b
 801bbdc:	9401      	str	r4, [sp, #4]
 801bbde:	f7ff f89d 	bl	801ad1c <fn_0801AD1C>
 801bbe2:	683a      	ldr	r2, [r7, #0]
 801bbe4:	4938      	ldr	r1, [pc, #224]	@ (801bcc8 <fn_0801B980+0x348>)
 801bbe6:	1953      	adds	r3, r2, r5
 801bbe8:	1850      	adds	r0, r2, r1
 801bbea:	3275      	adds	r2, #117	@ 0x75
 801bbec:	32ff      	adds	r2, #255	@ 0xff
 801bbee:	9200      	str	r2, [sp, #0]
 801bbf0:	21ee      	movs	r1, #238	@ 0xee
 801bbf2:	2297      	movs	r2, #151	@ 0x97
 801bbf4:	9401      	str	r4, [sp, #4]
 801bbf6:	f7ff f891 	bl	801ad1c <fn_0801AD1C>
 801bbfa:	683a      	ldr	r2, [r7, #0]
 801bbfc:	4933      	ldr	r1, [pc, #204]	@ (801bccc <fn_0801B980+0x34c>)
 801bbfe:	1953      	adds	r3, r2, r5
 801bc00:	1850      	adds	r0, r2, r1
 801bc02:	3279      	adds	r2, #121	@ 0x79
 801bc04:	32ff      	adds	r2, #255	@ 0xff
 801bc06:	9200      	str	r2, [sp, #0]
 801bc08:	21ee      	movs	r1, #238	@ 0xee
 801bc0a:	2291      	movs	r2, #145	@ 0x91
 801bc0c:	9401      	str	r4, [sp, #4]
 801bc0e:	f7ff f885 	bl	801ad1c <fn_0801AD1C>
 801bc12:	683a      	ldr	r2, [r7, #0]
 801bc14:	492e      	ldr	r1, [pc, #184]	@ (801bcd0 <fn_0801B980+0x350>)
 801bc16:	4b2f      	ldr	r3, [pc, #188]	@ (801bcd4 <fn_0801B980+0x354>)
 801bc18:	1850      	adds	r0, r2, r1
 801bc1a:	4912      	ldr	r1, [pc, #72]	@ (801bc64 <fn_0801B980+0x2e4>)
 801bc1c:	18d3      	adds	r3, r2, r3
 801bc1e:	1852      	adds	r2, r2, r1
 801bc20:	9201      	str	r2, [sp, #4]
 801bc22:	222a      	movs	r2, #42	@ 0x2a
 801bc24:	2168      	movs	r1, #104	@ 0x68
 801bc26:	9200      	str	r2, [sp, #0]
 801bc28:	3256      	adds	r2, #86	@ 0x56
 801bc2a:	f7ff f9e1 	bl	801aff0 <fn_0801AFF0>
 801bc2e:	2300      	movs	r3, #0
 801bc30:	464a      	mov	r2, r9
 801bc32:	7213      	strb	r3, [r2, #8]
 801bc34:	b003      	add	sp, #12
 801bc36:	bcc0      	pop	{r6, r7}
 801bc38:	46b9      	mov	r9, r7
 801bc3a:	46b0      	mov	r8, r6
 801bc3c:	bcf0      	pop	{r4, r5, r6, r7}
 801bc3e:	bc01      	pop	{r0}
 801bc40:	4700      	bx	r0
 801bc42:	4a25      	ldr	r2, [pc, #148]	@ (801bcd8 <fn_0801B980+0x358>)
 801bc44:	e715      	b.n	801ba72 <fn_0801B980+0xf2>
 801bc46:	3290      	adds	r2, #144	@ 0x90
 801bc48:	e713      	b.n	801ba72 <fn_0801B980+0xf2>
 801bc4a:	2000      	movs	r0, #0
 801bc4c:	f000 faf0 	bl	801c230 <fn_0801C230>
 801bc50:	2301      	movs	r3, #1
 801bc52:	464a      	mov	r2, r9
 801bc54:	7213      	strb	r3, [r2, #8]
 801bc56:	e69e      	b.n	801b996 <fn_0801B980+0x16>
 801bc58:	03006bac 	.word	0x03006bac	@ data_03006BAC
 801bc5c:	030064c4 	.word	0x030064c4	@ data_030064C4
 801bc60:	00005a2c 	.word	0x00005a2c
 801bc64:	00005a14 	.word	0x00005a14
 801bc68:	00005a28 	.word	0x00005a28
 801bc6c:	00005a04 	.word	0x00005a04
 801bc70:	00005a08 	.word	0x00005a08
 801bc74:	00005a0c 	.word	0x00005a0c
 801bc78:	00005a18 	.word	0x00005a18
 801bc7c:	00005a1c 	.word	0x00005a1c
 801bc80:	00005a20 	.word	0x00005a20
 801bc84:	00005644 	.word	0x00005644
 801bc88:	00005788 	.word	0x00005788
 801bc8c:	00005648 	.word	0x00005648
 801bc90:	00000754 	.word	0x00000754
 801bc94:	000057a8 	.word	0x000057a8
 801bc98:	000059e0 	.word	0x000059e0
 801bc9c:	000057c8 	.word	0x000057c8
 801bca0:	00005758 	.word	0x00005758
 801bca4:	0000588c 	.word	0x0000588c
 801bca8:	00005698 	.word	0x00005698
 801bcac:	000058a8 	.word	0x000058a8
 801bcb0:	000058c4 	.word	0x000058c4
 801bcb4:	00005670 	.word	0x00005670
 801bcb8:	000058e0 	.word	0x000058e0
 801bcbc:	00005920 	.word	0x00005920
 801bcc0:	00005940 	.word	0x00005940
 801bcc4:	00005960 	.word	0x00005960
 801bcc8:	000059a0 	.word	0x000059a0
 801bccc:	000059c0 	.word	0x000059c0
 801bcd0:	00005870 	.word	0x00005870
 801bcd4:	000056b0 	.word	0x000056b0
 801bcd8:	08131e00 	.word	0x08131e00	@ data_08131E00
