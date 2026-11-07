fn_08009FE4:
 8009fe4:	4b46      	ldr	r3, [pc, #280]	@ (800a100 <fn_08009FE4+0x11c>)
 8009fe6:	6819      	ldr	r1, [r3, #0]
 8009fe8:	2394      	movs	r3, #148	@ 0x94
 8009fea:	b5f0      	push	{r4, r5, r6, r7, lr}
 8009fec:	5cce      	ldrb	r6, [r1, r3]
 8009fee:	3348      	adds	r3, #72	@ 0x48
 8009ff0:	58cd      	ldr	r5, [r1, r3]
 8009ff2:	b089      	sub	sp, #36	@ 0x24
 8009ff4:	2e02      	cmp	r6, #2
 8009ff6:	d035      	beq.n	800a064 <fn_08009FE4+0x80>
 8009ff8:	23d8      	movs	r3, #216	@ 0xd8
 8009ffa:	58cb      	ldr	r3, [r1, r3]
 8009ffc:	2b03      	cmp	r3, #3
 8009ffe:	d03e      	beq.n	800a07e <fn_08009FE4+0x9a>
 800a000:	dc39      	bgt.n	800a076 <fn_08009FE4+0x92>
 800a002:	2b01      	cmp	r3, #1
 800a004:	d042      	beq.n	800a08c <fn_08009FE4+0xa8>
 800a006:	2b02      	cmp	r3, #2
 800a008:	d15e      	bne.n	800a0c8 <fn_08009FE4+0xe4>
 800a00a:	2d08      	cmp	r5, #8
 800a00c:	d126      	bne.n	800a05c <fn_08009FE4+0x78>
 800a00e:	235a      	movs	r3, #90	@ 0x5a
 800a010:	5cc3      	ldrb	r3, [r0, r3]
 800a012:	2b15      	cmp	r3, #21
 800a014:	d122      	bne.n	800a05c <fn_08009FE4+0x78>
 800a016:	4b3b      	ldr	r3, [pc, #236]	@ (800a104 <fn_08009FE4+0x120>)
 800a018:	5ccb      	ldrb	r3, [r1, r3]
 800a01a:	2b00      	cmp	r3, #0
 800a01c:	d01e      	beq.n	800a05c <fn_08009FE4+0x78>
 800a01e:	2384      	movs	r3, #132	@ 0x84
 800a020:	005b      	lsls	r3, r3, #1
 800a022:	58cb      	ldr	r3, [r1, r3]
 800a024:	2b00      	cmp	r3, #0
 800a026:	dd19      	ble.n	800a05c <fn_08009FE4+0x78>
 800a028:	4a37      	ldr	r2, [pc, #220]	@ (800a108 <fn_08009FE4+0x124>)
 800a02a:	4694      	mov	ip, r2
 800a02c:	4b37      	ldr	r3, [pc, #220]	@ (800a10c <fn_08009FE4+0x128>)
 800a02e:	58cb      	ldr	r3, [r1, r3]
 800a030:	448c      	add	ip, r1
 800a032:	4563      	cmp	r3, ip
 800a034:	d031      	beq.n	800a09a <fn_08009FE4+0xb6>
 800a036:	4c36      	ldr	r4, [pc, #216]	@ (800a110 <fn_08009FE4+0x12c>)
 800a038:	e002      	b.n	800a040 <fn_08009FE4+0x5c>
 800a03a:	685b      	ldr	r3, [r3, #4]
 800a03c:	4563      	cmp	r3, ip
 800a03e:	d02c      	beq.n	800a09a <fn_08009FE4+0xb6>
 800a040:	689a      	ldr	r2, [r3, #8]
 800a042:	42a2      	cmp	r2, r4
 800a044:	d1f9      	bne.n	800a03a <fn_08009FE4+0x56>
 800a046:	4298      	cmp	r0, r3
 800a048:	d0f7      	beq.n	800a03a <fn_08009FE4+0x56>
 800a04a:	225a      	movs	r2, #90	@ 0x5a
 800a04c:	5c9f      	ldrb	r7, [r3, r2]
 800a04e:	5c82      	ldrb	r2, [r0, r2]
 800a050:	4297      	cmp	r7, r2
 800a052:	d1f2      	bne.n	800a03a <fn_08009FE4+0x56>
 800a054:	2254      	movs	r2, #84	@ 0x54
 800a056:	5e9a      	ldrsh	r2, [r3, r2]
 800a058:	2a00      	cmp	r2, #0
 800a05a:	ddee      	ble.n	800a03a <fn_08009FE4+0x56>
 800a05c:	b009      	add	sp, #36	@ 0x24
 800a05e:	bcf0      	pop	{r4, r5, r6, r7}
 800a060:	bc01      	pop	{r0}
 800a062:	4700      	bx	r0
 800a064:	2d07      	cmp	r5, #7
 800a066:	d1f9      	bne.n	800a05c <fn_08009FE4+0x78>
 800a068:	3b82      	subs	r3, #130	@ 0x82
 800a06a:	5cc3      	ldrb	r3, [r0, r3]
 800a06c:	2b08      	cmp	r3, #8
 800a06e:	d0d2      	beq.n	800a016 <fn_08009FE4+0x32>
 800a070:	2b14      	cmp	r3, #20
 800a072:	d1f3      	bne.n	800a05c <fn_08009FE4+0x78>
 800a074:	e7cf      	b.n	800a016 <fn_08009FE4+0x32>
 800a076:	2b04      	cmp	r3, #4
 800a078:	d126      	bne.n	800a0c8 <fn_08009FE4+0xe4>
 800a07a:	2d06      	cmp	r5, #6
 800a07c:	d0c7      	beq.n	800a00e <fn_08009FE4+0x2a>
 800a07e:	2d08      	cmp	r5, #8
 800a080:	d1ec      	bne.n	800a05c <fn_08009FE4+0x78>
 800a082:	235a      	movs	r3, #90	@ 0x5a
 800a084:	5cc3      	ldrb	r3, [r0, r3]
 800a086:	2b13      	cmp	r3, #19
 800a088:	d1e8      	bne.n	800a05c <fn_08009FE4+0x78>
 800a08a:	e7c4      	b.n	800a016 <fn_08009FE4+0x32>
 800a08c:	2d08      	cmp	r5, #8
 800a08e:	d1e5      	bne.n	800a05c <fn_08009FE4+0x78>
 800a090:	235a      	movs	r3, #90	@ 0x5a
 800a092:	5cc3      	ldrb	r3, [r0, r3]
 800a094:	2b0f      	cmp	r3, #15
 800a096:	d1e1      	bne.n	800a05c <fn_08009FE4+0x78>
 800a098:	e7bd      	b.n	800a016 <fn_08009FE4+0x32>
 800a09a:	2e02      	cmp	r6, #2
 800a09c:	d017      	beq.n	800a0ce <fn_08009FE4+0xea>
 800a09e:	23d8      	movs	r3, #216	@ 0xd8
 800a0a0:	58cb      	ldr	r3, [r1, r3]
 800a0a2:	2b01      	cmp	r3, #1
 800a0a4:	d005      	beq.n	800a0b2 <fn_08009FE4+0xce>
 800a0a6:	2b04      	cmp	r3, #4
 800a0a8:	d10b      	bne.n	800a0c2 <fn_08009FE4+0xde>
 800a0aa:	2d06      	cmp	r5, #6
 800a0ac:	d01f      	beq.n	800a0ee <fn_08009FE4+0x10a>
 800a0ae:	2d08      	cmp	r5, #8
 800a0b0:	d107      	bne.n	800a0c2 <fn_08009FE4+0xde>
 800a0b2:	466a      	mov	r2, sp
 800a0b4:	4b17      	ldr	r3, [pc, #92]	@ (800a114 <fn_08009FE4+0x130>)
 800a0b6:	2101      	movs	r1, #1
 800a0b8:	4668      	mov	r0, sp
 800a0ba:	8393      	strh	r3, [r2, #28]
 800a0bc:	f000 fc52 	bl	800a964 <fn_0800A964>
 800a0c0:	e7cc      	b.n	800a05c <fn_08009FE4+0x78>
 800a0c2:	f7f9 f901 	bl	80032c8 <fn_080032C8>
 800a0c6:	e7c9      	b.n	800a05c <fn_08009FE4+0x78>
 800a0c8:	2d08      	cmp	r5, #8
 800a0ca:	d1c7      	bne.n	800a05c <fn_08009FE4+0x78>
 800a0cc:	e7a3      	b.n	800a016 <fn_08009FE4+0x32>
 800a0ce:	2d07      	cmp	r5, #7
 800a0d0:	d1f7      	bne.n	800a0c2 <fn_08009FE4+0xde>
 800a0d2:	235a      	movs	r3, #90	@ 0x5a
 800a0d4:	5cc3      	ldrb	r3, [r0, r3]
 800a0d6:	2b08      	cmp	r3, #8
 800a0d8:	d0eb      	beq.n	800a0b2 <fn_08009FE4+0xce>
 800a0da:	2b14      	cmp	r3, #20
 800a0dc:	d1f1      	bne.n	800a0c2 <fn_08009FE4+0xde>
 800a0de:	466a      	mov	r2, sp
 800a0e0:	4b0d      	ldr	r3, [pc, #52]	@ (800a118 <fn_08009FE4+0x134>)
 800a0e2:	2108      	movs	r1, #8
 800a0e4:	4668      	mov	r0, sp
 800a0e6:	8393      	strh	r3, [r2, #28]
 800a0e8:	f000 fc3c 	bl	800a964 <fn_0800A964>
 800a0ec:	e7b6      	b.n	800a05c <fn_08009FE4+0x78>
 800a0ee:	466a      	mov	r2, sp
 800a0f0:	4b08      	ldr	r3, [pc, #32]	@ (800a114 <fn_08009FE4+0x130>)
 800a0f2:	2106      	movs	r1, #6
 800a0f4:	4668      	mov	r0, sp
 800a0f6:	8393      	strh	r3, [r2, #28]
 800a0f8:	f7fd f8c6 	bl	8007288 <fn_08007288>
 800a0fc:	e7ae      	b.n	800a05c <fn_08009FE4+0x78>
 800a0fe:	46c0      	nop			@ (mov r8, r8)
 800a100:	030064c4 	.word	0x030064c4
 800a104:	0000025d 	.word	0x0000025d
 800a108:	000010f0 	.word	0x000010f0
 800a10c:	000010f4 	.word	0x000010f4
 800a110:	03001618 	.word	0x03001618
 800a114:	0000029a 	.word	0x0000029a
 800a118:	0000029b 	.word	0x0000029b
