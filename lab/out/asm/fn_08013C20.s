fn_08013C20:
 8013c20:	2300      	movs	r3, #0
 8013c22:	22d4      	movs	r2, #212	@ 0xd4
 8013c24:	b570      	push	{r4, r5, r6, lr}
 8013c26:	2554      	movs	r5, #84	@ 0x54
 8013c28:	5083      	str	r3, [r0, r2]
 8013c2a:	3210      	adds	r2, #16
 8013c2c:	5083      	str	r3, [r0, r2]
 8013c2e:	3353      	adds	r3, #83	@ 0x53
 8013c30:	5cc2      	ldrb	r2, [r0, r3]
 8013c32:	0004      	movs	r4, r0
 8013c34:	5542      	strb	r2, [r0, r5]
 8013c36:	2a07      	cmp	r2, #7
 8013c38:	d015      	beq.n	8013c66 <fn_08013C20+0x46>
 8013c3a:	4b0e      	ldr	r3, [pc, #56]	@ (8013c74 <fn_08013C20+0x54>)
 8013c3c:	6819      	ldr	r1, [r3, #0]
 8013c3e:	4b0e      	ldr	r3, [pc, #56]	@ (8013c78 <fn_08013C20+0x58>)
 8013c40:	58c9      	ldr	r1, [r1, r3]
 8013c42:	0053      	lsls	r3, r2, #1
 8013c44:	189b      	adds	r3, r3, r2
 8013c46:	00db      	lsls	r3, r3, #3
 8013c48:	18cb      	adds	r3, r1, r3
 8013c4a:	8899      	ldrh	r1, [r3, #4]
 8013c4c:	220a      	movs	r2, #10
 8013c4e:	2354      	movs	r3, #84	@ 0x54
 8013c50:	54e2      	strb	r2, [r4, r3]
 8013c52:	2282      	movs	r2, #130	@ 0x82
 8013c54:	338c      	adds	r3, #140	@ 0x8c
 8013c56:	0412      	lsls	r2, r2, #16
 8013c58:	0020      	movs	r0, r4
 8013c5a:	50e2      	str	r2, [r4, r3]
 8013c5c:	f7fe fde0 	bl	8012820 <fn_08012820>
 8013c60:	bc70      	pop	{r4, r5, r6}
 8013c62:	bc01      	pop	{r0}
 8013c64:	4700      	bx	r0
 8013c66:	210a      	movs	r1, #10
 8013c68:	6800      	ldr	r0, [r0, #0]
 8013c6a:	f006 fb87 	bl	801a37c <fn_0801A37C>
 8013c6e:	5d62      	ldrb	r2, [r4, r5]
 8013c70:	e7e3      	b.n	8013c3a <fn_08013C20+0x1a>
 8013c72:	46c0      	nop			@ (mov r8, r8)
 8013c74:	030064c4 	.word	0x030064c4
 8013c78:	00000754 	.word	0x00000754
