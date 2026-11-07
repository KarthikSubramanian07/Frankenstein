fn_0801BA30:
 801ba30:	b5f0      	push	{r4, r5, r6, r7, lr}
 801ba32:	46ce      	mov	lr, r9
 801ba34:	4647      	mov	r7, r8
 801ba36:	b580      	push	{r7, lr}
 801ba38:	4bb3      	ldr	r3, [pc, #716]	@ (801bd08 <fn_0801BA30+0x2d8>)
 801ba3a:	4699      	mov	r9, r3
 801ba3c:	7a1b      	ldrb	r3, [r3, #8]
 801ba3e:	b083      	sub	sp, #12
 801ba40:	2b00      	cmp	r3, #0
 801ba42:	d100      	bne.n	801ba46 <fn_0801BA30+0x16>
 801ba44:	e159      	b.n	801bcfa <fn_0801BA30+0x2ca>
 801ba46:	2101      	movs	r1, #1
 801ba48:	4fb0      	ldr	r7, [pc, #704]	@ (801bd0c <fn_0801BA30+0x2dc>)
 801ba4a:	4bb1      	ldr	r3, [pc, #708]	@ (801bd10 <fn_0801BA30+0x2e0>)
 801ba4c:	683a      	ldr	r2, [r7, #0]
 801ba4e:	54d1      	strb	r1, [r2, r3]
 801ba50:	2100      	movs	r1, #0
 801ba52:	2001      	movs	r0, #1
 801ba54:	4baf      	ldr	r3, [pc, #700]	@ (801bd14 <fn_0801BA30+0x2e4>)
 801ba56:	50d1      	str	r1, [r2, r3]
 801ba58:	4baf      	ldr	r3, [pc, #700]	@ (801bd18 <fn_0801BA30+0x2e8>)
 801ba5a:	4240      	negs	r0, r0
 801ba5c:	50d0      	str	r0, [r2, r3]
 801ba5e:	3b28      	subs	r3, #40	@ 0x28
 801ba60:	50d0      	str	r0, [r2, r3]
 801ba62:	23a4      	movs	r3, #164	@ 0xa4
 801ba64:	005b      	lsls	r3, r3, #1
 801ba66:	58d3      	ldr	r3, [r2, r3]
 801ba68:	1e59      	subs	r1, r3, #1
 801ba6a:	418b      	sbcs	r3, r1
 801ba6c:	21a6      	movs	r1, #166	@ 0xa6
 801ba6e:	0049      	lsls	r1, r1, #1
 801ba70:	5851      	ldr	r1, [r2, r1]
 801ba72:	1e4c      	subs	r4, r1, #1
 801ba74:	41a1      	sbcs	r1, r4
 801ba76:	24a8      	movs	r4, #168	@ 0xa8
 801ba78:	0209      	lsls	r1, r1, #8
 801ba7a:	430b      	orrs	r3, r1
 801ba7c:	21aa      	movs	r1, #170	@ 0xaa
 801ba7e:	0064      	lsls	r4, r4, #1
 801ba80:	5914      	ldr	r4, [r2, r4]
 801ba82:	0049      	lsls	r1, r1, #1
 801ba84:	5851      	ldr	r1, [r2, r1]
 801ba86:	1e65      	subs	r5, r4, #1
 801ba88:	41ac      	sbcs	r4, r5
 801ba8a:	1e4d      	subs	r5, r1, #1
 801ba8c:	41a9      	sbcs	r1, r5
 801ba8e:	0424      	lsls	r4, r4, #16
 801ba90:	4323      	orrs	r3, r4
 801ba92:	0609      	lsls	r1, r1, #24
 801ba94:	430b      	orrs	r3, r1
 801ba96:	219c      	movs	r1, #156	@ 0x9c
 801ba98:	0049      	lsls	r1, r1, #1
 801ba9a:	5851      	ldr	r1, [r2, r1]
 801ba9c:	1e4c      	subs	r4, r1, #1
 801ba9e:	41a1      	sbcs	r1, r4
 801baa0:	249e      	movs	r4, #158	@ 0x9e
 801baa2:	0064      	lsls	r4, r4, #1
 801baa4:	5914      	ldr	r4, [r2, r4]
 801baa6:	1e65      	subs	r5, r4, #1
 801baa8:	41ac      	sbcs	r4, r5
 801baaa:	25a0      	movs	r5, #160	@ 0xa0
 801baac:	0224      	lsls	r4, r4, #8
 801baae:	4321      	orrs	r1, r4
 801bab0:	24a2      	movs	r4, #162	@ 0xa2
 801bab2:	006d      	lsls	r5, r5, #1
 801bab4:	5955      	ldr	r5, [r2, r5]
 801bab6:	0064      	lsls	r4, r4, #1
 801bab8:	5914      	ldr	r4, [r2, r4]
 801baba:	1e6e      	subs	r6, r5, #1
 801babc:	41b5      	sbcs	r5, r6
 801babe:	1e66      	subs	r6, r4, #1
 801bac0:	41b4      	sbcs	r4, r6
 801bac2:	042d      	lsls	r5, r5, #16
 801bac4:	0624      	lsls	r4, r4, #24
 801bac6:	4329      	orrs	r1, r5
 801bac8:	4321      	orrs	r1, r4
 801baca:	4c94      	ldr	r4, [pc, #592]	@ (801bd1c <fn_0801BA30+0x2ec>)
 801bacc:	5111      	str	r1, [r2, r4]
 801bace:	4994      	ldr	r1, [pc, #592]	@ (801bd20 <fn_0801BA30+0x2f0>)
 801bad0:	5053      	str	r3, [r2, r1]
 801bad2:	23ac      	movs	r3, #172	@ 0xac
 801bad4:	005b      	lsls	r3, r3, #1
 801bad6:	58d3      	ldr	r3, [r2, r3]
 801bad8:	1e59      	subs	r1, r3, #1
 801bada:	418b      	sbcs	r3, r1
 801badc:	4991      	ldr	r1, [pc, #580]	@ (801bd24 <fn_0801BA30+0x2f4>)
 801bade:	5453      	strb	r3, [r2, r1]
 801bae0:	2102      	movs	r1, #2
 801bae2:	4b91      	ldr	r3, [pc, #580]	@ (801bd28 <fn_0801BA30+0x2f8>)
 801bae4:	50d0      	str	r0, [r2, r3]
 801bae6:	4b91      	ldr	r3, [pc, #580]	@ (801bd2c <fn_0801BA30+0x2fc>)
 801bae8:	50d0      	str	r0, [r2, r3]
 801baea:	4b91      	ldr	r3, [pc, #580]	@ (801bd30 <fn_0801BA30+0x300>)
 801baec:	50d0      	str	r0, [r2, r3]
 801baee:	4b91      	ldr	r3, [pc, #580]	@ (801bd34 <fn_0801BA30+0x304>)
 801baf0:	50d1      	str	r1, [r2, r3]
 801baf2:	4b91      	ldr	r3, [pc, #580]	@ (801bd38 <fn_0801BA30+0x308>)
 801baf4:	3180      	adds	r1, #128	@ 0x80
 801baf6:	18d0      	adds	r0, r2, r3
 801baf8:	5c51      	ldrb	r1, [r2, r1]
 801bafa:	4b90      	ldr	r3, [pc, #576]	@ (801bd3c <fn_0801BA30+0x30c>)
 801bafc:	18d3      	adds	r3, r2, r3
 801bafe:	2900      	cmp	r1, #0
 801bb00:	d000      	beq.n	801bb04 <fn_0801BA30+0xd4>
 801bb02:	e0f8      	b.n	801bcf6 <fn_0801BA30+0x2c6>
 801bb04:	2134      	movs	r1, #52	@ 0x34
 801bb06:	31ff      	adds	r1, #255	@ 0xff
 801bb08:	5c54      	ldrb	r4, [r2, r1]
 801bb0a:	498d      	ldr	r1, [pc, #564]	@ (801bd40 <fn_0801BA30+0x310>)
 801bb0c:	5855      	ldr	r5, [r2, r1]
 801bb0e:	0061      	lsls	r1, r4, #1
 801bb10:	1909      	adds	r1, r1, r4
 801bb12:	00c9      	lsls	r1, r1, #3
 801bb14:	5949      	ldr	r1, [r1, r5]
 801bb16:	2905      	cmp	r1, #5
 801bb18:	d100      	bne.n	801bb1c <fn_0801BA30+0xec>
 801bb1a:	e0ea      	b.n	801bcf2 <fn_0801BA30+0x2c2>
 801bb1c:	3157      	adds	r1, #87	@ 0x57
 801bb1e:	0089      	lsls	r1, r1, #2
 801bb20:	1852      	adds	r2, r2, r1
 801bb22:	2403      	movs	r4, #3
 801bb24:	2120      	movs	r1, #32
 801bb26:	9401      	str	r4, [sp, #4]
 801bb28:	9200      	str	r2, [sp, #0]
 801bb2a:	2286      	movs	r2, #134	@ 0x86
 801bb2c:	f7ff f950 	bl	801add0 <fn_0801ADD0>
 801bb30:	4d82      	ldr	r5, [pc, #520]	@ (801bd3c <fn_0801BA30+0x30c>)
 801bb32:	683a      	ldr	r2, [r7, #0]
 801bb34:	4983      	ldr	r1, [pc, #524]	@ (801bd44 <fn_0801BA30+0x314>)
 801bb36:	1953      	adds	r3, r2, r5
 801bb38:	1850      	adds	r0, r2, r1
 801bb3a:	3209      	adds	r2, #9
 801bb3c:	32ff      	adds	r2, #255	@ 0xff
 801bb3e:	2142      	movs	r1, #66	@ 0x42
 801bb40:	9401      	str	r4, [sp, #4]
 801bb42:	9200      	str	r2, [sp, #0]
 801bb44:	2286      	movs	r2, #134	@ 0x86
 801bb46:	f7ff f943 	bl	801add0 <fn_0801ADD0>
 801bb4a:	683a      	ldr	r2, [r7, #0]
 801bb4c:	497e      	ldr	r1, [pc, #504]	@ (801bd48 <fn_0801BA30+0x318>)
 801bb4e:	1953      	adds	r3, r2, r5
 801bb50:	1850      	adds	r0, r2, r1
 801bb52:	320d      	adds	r2, #13
 801bb54:	32ff      	adds	r2, #255	@ 0xff
 801bb56:	9401      	str	r4, [sp, #4]
 801bb58:	9200      	str	r2, [sp, #0]
 801bb5a:	21a6      	movs	r1, #166	@ 0xa6
 801bb5c:	2286      	movs	r2, #134	@ 0x86
 801bb5e:	f7ff f937 	bl	801add0 <fn_0801ADD0>
 801bb62:	4b7a      	ldr	r3, [pc, #488]	@ (801bd4c <fn_0801BA30+0x31c>)
 801bb64:	2400      	movs	r4, #0
 801bb66:	4698      	mov	r8, r3
 801bb68:	0020      	movs	r0, r4
 801bb6a:	2103      	movs	r1, #3
 801bb6c:	f009 fd14 	bl	8025598 <fn_08025598>
 801bb70:	0020      	movs	r0, r4
 801bb72:	00cd      	lsls	r5, r1, #3
 801bb74:	2103      	movs	r1, #3
 801bb76:	f009 fd63 	bl	8025640 <fn_08025640>
 801bb7a:	230a      	movs	r3, #10
 801bb7c:	4974      	ldr	r1, [pc, #464]	@ (801bd50 <fn_0801BA30+0x320>)
 801bb7e:	4242      	negs	r2, r0
 801bb80:	401a      	ands	r2, r3
 801bb82:	00e3      	lsls	r3, r4, #3
 801bb84:	185b      	adds	r3, r3, r1
 801bb86:	4641      	mov	r1, r8
 801bb88:	683e      	ldr	r6, [r7, #0]
 801bb8a:	3401      	adds	r4, #1
 801bb8c:	1870      	adds	r0, r6, r1
 801bb8e:	00a1      	lsls	r1, r4, #2
 801bb90:	3139      	adds	r1, #57	@ 0x39
 801bb92:	31ff      	adds	r1, #255	@ 0xff
 801bb94:	18f3      	adds	r3, r6, r3
 801bb96:	1876      	adds	r6, r6, r1
 801bb98:	2102      	movs	r1, #2
 801bb9a:	3552      	adds	r5, #82	@ 0x52
 801bb9c:	9100      	str	r1, [sp, #0]
 801bb9e:	9601      	str	r6, [sp, #4]
 801bba0:	0029      	movs	r1, r5
 801bba2:	3284      	adds	r2, #132	@ 0x84
 801bba4:	f7ff fa7e 	bl	801b0a4 <fn_0801B0A4>
 801bba8:	231c      	movs	r3, #28
 801bbaa:	4498      	add	r8, r3
 801bbac:	2c06      	cmp	r4, #6
 801bbae:	d1db      	bne.n	801bb68 <fn_0801BA30+0x138>
 801bbb0:	683a      	ldr	r2, [r7, #0]
 801bbb2:	4968      	ldr	r1, [pc, #416]	@ (801bd54 <fn_0801BA30+0x324>)
 801bbb4:	4d68      	ldr	r5, [pc, #416]	@ (801bd58 <fn_0801BA30+0x328>)
 801bbb6:	1850      	adds	r0, r2, r1
 801bbb8:	495b      	ldr	r1, [pc, #364]	@ (801bd28 <fn_0801BA30+0x2f8>)
 801bbba:	1953      	adds	r3, r2, r5
 801bbbc:	1852      	adds	r2, r2, r1
 801bbbe:	9201      	str	r2, [sp, #4]
 801bbc0:	9400      	str	r4, [sp, #0]
 801bbc2:	2283      	movs	r2, #131	@ 0x83
 801bbc4:	21b2      	movs	r1, #178	@ 0xb2
 801bbc6:	f7ff fa6d 	bl	801b0a4 <fn_0801B0A4>
 801bbca:	683a      	ldr	r2, [r7, #0]
 801bbcc:	4963      	ldr	r1, [pc, #396]	@ (801bd5c <fn_0801BA30+0x32c>)
 801bbce:	1850      	adds	r0, r2, r1
 801bbd0:	4956      	ldr	r1, [pc, #344]	@ (801bd2c <fn_0801BA30+0x2fc>)
 801bbd2:	1953      	adds	r3, r2, r5
 801bbd4:	1852      	adds	r2, r2, r1
 801bbd6:	9201      	str	r2, [sp, #4]
 801bbd8:	9400      	str	r4, [sp, #0]
 801bbda:	228d      	movs	r2, #141	@ 0x8d
 801bbdc:	21b2      	movs	r1, #178	@ 0xb2
 801bbde:	f7ff fa61 	bl	801b0a4 <fn_0801B0A4>
 801bbe2:	683a      	ldr	r2, [r7, #0]
 801bbe4:	495e      	ldr	r1, [pc, #376]	@ (801bd60 <fn_0801BA30+0x330>)
 801bbe6:	1850      	adds	r0, r2, r1
 801bbe8:	4951      	ldr	r1, [pc, #324]	@ (801bd30 <fn_0801BA30+0x300>)
 801bbea:	1953      	adds	r3, r2, r5
 801bbec:	1852      	adds	r2, r2, r1
 801bbee:	9201      	str	r2, [sp, #4]
 801bbf0:	9400      	str	r4, [sp, #0]
 801bbf2:	2297      	movs	r2, #151	@ 0x97
 801bbf4:	21b2      	movs	r1, #178	@ 0xb2
 801bbf6:	4d5b      	ldr	r5, [pc, #364]	@ (801bd64 <fn_0801BA30+0x334>)
 801bbf8:	f7ff fa54 	bl	801b0a4 <fn_0801B0A4>
 801bbfc:	683a      	ldr	r2, [r7, #0]
 801bbfe:	495a      	ldr	r1, [pc, #360]	@ (801bd68 <fn_0801BA30+0x338>)
 801bc00:	1953      	adds	r3, r2, r5
 801bc02:	1850      	adds	r0, r2, r1
 801bc04:	325d      	adds	r2, #93	@ 0x5d
 801bc06:	3c03      	subs	r4, #3
 801bc08:	32ff      	adds	r2, #255	@ 0xff
 801bc0a:	9200      	str	r2, [sp, #0]
 801bc0c:	21dc      	movs	r1, #220	@ 0xdc
 801bc0e:	2285      	movs	r2, #133	@ 0x85
 801bc10:	9401      	str	r4, [sp, #4]
 801bc12:	f7ff f8dd 	bl	801add0 <fn_0801ADD0>
 801bc16:	21b2      	movs	r1, #178	@ 0xb2
 801bc18:	683a      	ldr	r2, [r7, #0]
 801bc1a:	01c9      	lsls	r1, r1, #7
 801bc1c:	1953      	adds	r3, r2, r5
 801bc1e:	1850      	adds	r0, r2, r1
 801bc20:	3261      	adds	r2, #97	@ 0x61
 801bc22:	32ff      	adds	r2, #255	@ 0xff
 801bc24:	9200      	str	r2, [sp, #0]
 801bc26:	21dc      	movs	r1, #220	@ 0xdc
 801bc28:	228b      	movs	r2, #139	@ 0x8b
 801bc2a:	9401      	str	r4, [sp, #4]
 801bc2c:	f7ff f8d0 	bl	801add0 <fn_0801ADD0>
 801bc30:	683a      	ldr	r2, [r7, #0]
 801bc32:	494e      	ldr	r1, [pc, #312]	@ (801bd6c <fn_0801BA30+0x33c>)
 801bc34:	1953      	adds	r3, r2, r5
 801bc36:	1850      	adds	r0, r2, r1
 801bc38:	3265      	adds	r2, #101	@ 0x65
 801bc3a:	32ff      	adds	r2, #255	@ 0xff
 801bc3c:	9200      	str	r2, [sp, #0]
 801bc3e:	21dc      	movs	r1, #220	@ 0xdc
 801bc40:	2297      	movs	r2, #151	@ 0x97
 801bc42:	9401      	str	r4, [sp, #4]
 801bc44:	f7ff f8c4 	bl	801add0 <fn_0801ADD0>
 801bc48:	683a      	ldr	r2, [r7, #0]
 801bc4a:	4949      	ldr	r1, [pc, #292]	@ (801bd70 <fn_0801BA30+0x340>)
 801bc4c:	1953      	adds	r3, r2, r5
 801bc4e:	1850      	adds	r0, r2, r1
 801bc50:	3269      	adds	r2, #105	@ 0x69
 801bc52:	32ff      	adds	r2, #255	@ 0xff
 801bc54:	9200      	str	r2, [sp, #0]
 801bc56:	21dc      	movs	r1, #220	@ 0xdc
 801bc58:	2291      	movs	r2, #145	@ 0x91
 801bc5a:	9401      	str	r4, [sp, #4]
 801bc5c:	f7ff f8b8 	bl	801add0 <fn_0801ADD0>
 801bc60:	683a      	ldr	r2, [r7, #0]
 801bc62:	4944      	ldr	r1, [pc, #272]	@ (801bd74 <fn_0801BA30+0x344>)
 801bc64:	1953      	adds	r3, r2, r5
 801bc66:	1850      	adds	r0, r2, r1
 801bc68:	326d      	adds	r2, #109	@ 0x6d
 801bc6a:	32ff      	adds	r2, #255	@ 0xff
 801bc6c:	9200      	str	r2, [sp, #0]
 801bc6e:	21ee      	movs	r1, #238	@ 0xee
 801bc70:	2285      	movs	r2, #133	@ 0x85
 801bc72:	9401      	str	r4, [sp, #4]
 801bc74:	f7ff f8ac 	bl	801add0 <fn_0801ADD0>
 801bc78:	21b3      	movs	r1, #179	@ 0xb3
 801bc7a:	683a      	ldr	r2, [r7, #0]
 801bc7c:	01c9      	lsls	r1, r1, #7
 801bc7e:	1953      	adds	r3, r2, r5
 801bc80:	1850      	adds	r0, r2, r1
 801bc82:	3271      	adds	r2, #113	@ 0x71
 801bc84:	32ff      	adds	r2, #255	@ 0xff
 801bc86:	9200      	str	r2, [sp, #0]
 801bc88:	21ee      	movs	r1, #238	@ 0xee
 801bc8a:	228b      	movs	r2, #139	@ 0x8b
 801bc8c:	9401      	str	r4, [sp, #4]
 801bc8e:	f7ff f89f 	bl	801add0 <fn_0801ADD0>
 801bc92:	683a      	ldr	r2, [r7, #0]
 801bc94:	4938      	ldr	r1, [pc, #224]	@ (801bd78 <fn_0801BA30+0x348>)
 801bc96:	1953      	adds	r3, r2, r5
 801bc98:	1850      	adds	r0, r2, r1
 801bc9a:	3275      	adds	r2, #117	@ 0x75
 801bc9c:	32ff      	adds	r2, #255	@ 0xff
 801bc9e:	9200      	str	r2, [sp, #0]
 801bca0:	21ee      	movs	r1, #238	@ 0xee
 801bca2:	2297      	movs	r2, #151	@ 0x97
 801bca4:	9401      	str	r4, [sp, #4]
 801bca6:	f7ff f893 	bl	801add0 <fn_0801ADD0>
 801bcaa:	683a      	ldr	r2, [r7, #0]
 801bcac:	4933      	ldr	r1, [pc, #204]	@ (801bd7c <fn_0801BA30+0x34c>)
 801bcae:	1953      	adds	r3, r2, r5
 801bcb0:	1850      	adds	r0, r2, r1
 801bcb2:	3279      	adds	r2, #121	@ 0x79
 801bcb4:	32ff      	adds	r2, #255	@ 0xff
 801bcb6:	9200      	str	r2, [sp, #0]
 801bcb8:	21ee      	movs	r1, #238	@ 0xee
 801bcba:	2291      	movs	r2, #145	@ 0x91
 801bcbc:	9401      	str	r4, [sp, #4]
 801bcbe:	f7ff f887 	bl	801add0 <fn_0801ADD0>
 801bcc2:	683a      	ldr	r2, [r7, #0]
 801bcc4:	492e      	ldr	r1, [pc, #184]	@ (801bd80 <fn_0801BA30+0x350>)
 801bcc6:	4b2f      	ldr	r3, [pc, #188]	@ (801bd84 <fn_0801BA30+0x354>)
 801bcc8:	1850      	adds	r0, r2, r1
 801bcca:	4912      	ldr	r1, [pc, #72]	@ (801bd14 <fn_0801BA30+0x2e4>)
 801bccc:	18d3      	adds	r3, r2, r3
 801bcce:	1852      	adds	r2, r2, r1
 801bcd0:	9201      	str	r2, [sp, #4]
 801bcd2:	222a      	movs	r2, #42	@ 0x2a
 801bcd4:	2168      	movs	r1, #104	@ 0x68
 801bcd6:	9200      	str	r2, [sp, #0]
 801bcd8:	3256      	adds	r2, #86	@ 0x56
 801bcda:	f7ff f9e3 	bl	801b0a4 <fn_0801B0A4>
 801bcde:	2300      	movs	r3, #0
 801bce0:	464a      	mov	r2, r9
 801bce2:	7213      	strb	r3, [r2, #8]
 801bce4:	b003      	add	sp, #12
 801bce6:	bcc0      	pop	{r6, r7}
 801bce8:	46b9      	mov	r9, r7
 801bcea:	46b0      	mov	r8, r6
 801bcec:	bcf0      	pop	{r4, r5, r6, r7}
 801bcee:	bc01      	pop	{r0}
 801bcf0:	4700      	bx	r0
 801bcf2:	4a25      	ldr	r2, [pc, #148]	@ (801bd88 <fn_0801BA30+0x358>)
 801bcf4:	e715      	b.n	801bb22 <fn_0801BA30+0xf2>
 801bcf6:	3290      	adds	r2, #144	@ 0x90
 801bcf8:	e713      	b.n	801bb22 <fn_0801BA30+0xf2>
 801bcfa:	2000      	movs	r0, #0
 801bcfc:	f000 faf0 	bl	801c2e0 <fn_0801C2E0>
 801bd00:	2301      	movs	r3, #1
 801bd02:	464a      	mov	r2, r9
 801bd04:	7213      	strb	r3, [r2, #8]
 801bd06:	e69e      	b.n	801ba46 <fn_0801BA30+0x16>
 801bd08:	03006bac 	.word	0x03006bac
 801bd0c:	030064c4 	.word	0x030064c4
 801bd10:	00005a2c 	.word	0x00005a2c
 801bd14:	00005a14 	.word	0x00005a14
 801bd18:	00005a28 	.word	0x00005a28
 801bd1c:	00005a04 	.word	0x00005a04
 801bd20:	00005a08 	.word	0x00005a08
 801bd24:	00005a0c 	.word	0x00005a0c
 801bd28:	00005a18 	.word	0x00005a18
 801bd2c:	00005a1c 	.word	0x00005a1c
 801bd30:	00005a20 	.word	0x00005a20
 801bd34:	00005644 	.word	0x00005644
 801bd38:	00005788 	.word	0x00005788
 801bd3c:	00005648 	.word	0x00005648
 801bd40:	00000754 	.word	0x00000754
 801bd44:	000057a8 	.word	0x000057a8
 801bd48:	000059e0 	.word	0x000059e0
 801bd4c:	000057c8 	.word	0x000057c8
 801bd50:	00005758 	.word	0x00005758
 801bd54:	0000588c 	.word	0x0000588c
 801bd58:	00005698 	.word	0x00005698
 801bd5c:	000058a8 	.word	0x000058a8
 801bd60:	000058c4 	.word	0x000058c4
 801bd64:	00005670 	.word	0x00005670
 801bd68:	000058e0 	.word	0x000058e0
 801bd6c:	00005920 	.word	0x00005920
 801bd70:	00005940 	.word	0x00005940
 801bd74:	00005960 	.word	0x00005960
 801bd78:	000059a0 	.word	0x000059a0
 801bd7c:	000059c0 	.word	0x000059c0
 801bd80:	00005870 	.word	0x00005870
 801bd84:	000056b0 	.word	0x000056b0
 801bd88:	08131ed4 	.word	0x08131ed4
