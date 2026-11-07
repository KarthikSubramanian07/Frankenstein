fn_08013B6C:
 8013b6c:	2300      	movs	r3, #0
 8013b6e:	22d4      	movs	r2, #212	@ 0xd4
 8013b70:	b570      	push	{r4, r5, r6, lr}
 8013b72:	2554      	movs	r5, #84	@ 0x54
 8013b74:	5083      	str	r3, [r0, r2]
 8013b76:	3210      	adds	r2, #16
 8013b78:	5083      	str	r3, [r0, r2]
 8013b7a:	3353      	adds	r3, #83	@ 0x53
 8013b7c:	5cc2      	ldrb	r2, [r0, r3]
 8013b7e:	0004      	movs	r4, r0
 8013b80:	5542      	strb	r2, [r0, r5]
 8013b82:	2a07      	cmp	r2, #7
 8013b84:	d015      	beq.n	8013bb2 <fn_08013B6C+0x46>
 8013b86:	4b0e      	ldr	r3, [pc, #56]	@ (8013bc0 <fn_08013B6C+0x54>)
 8013b88:	6819      	ldr	r1, [r3, #0]
 8013b8a:	4b0e      	ldr	r3, [pc, #56]	@ (8013bc4 <fn_08013B6C+0x58>)
 8013b8c:	58c9      	ldr	r1, [r1, r3]
 8013b8e:	0053      	lsls	r3, r2, #1
 8013b90:	189b      	adds	r3, r3, r2
 8013b92:	00db      	lsls	r3, r3, #3
 8013b94:	18cb      	adds	r3, r1, r3
 8013b96:	8899      	ldrh	r1, [r3, #4]
 8013b98:	220a      	movs	r2, #10
 8013b9a:	2354      	movs	r3, #84	@ 0x54
 8013b9c:	54e2      	strb	r2, [r4, r3]
 8013b9e:	2282      	movs	r2, #130	@ 0x82
 8013ba0:	338c      	adds	r3, #140	@ 0x8c
 8013ba2:	0412      	lsls	r2, r2, #16
 8013ba4:	0020      	movs	r0, r4
 8013ba6:	50e2      	str	r2, [r4, r3]
 8013ba8:	f7fe fe3a 	bl	8012820 <fn_08012820>
 8013bac:	bc70      	pop	{r4, r5, r6}
 8013bae:	bc01      	pop	{r0}
 8013bb0:	4700      	bx	r0
 8013bb2:	210a      	movs	r1, #10
 8013bb4:	6800      	ldr	r0, [r0, #0]
 8013bb6:	f006 fb87 	bl	801a2c8 <fn_0801A2C8>
 8013bba:	5d62      	ldrb	r2, [r4, r5]
 8013bbc:	e7e3      	b.n	8013b86 <fn_08013B6C+0x1a>
 8013bbe:	46c0      	nop			@ (mov r8, r8)
 8013bc0:	030064c4 	.word	0x030064c4
 8013bc4:	00000754 	.word	0x00000754
