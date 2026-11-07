fn_0800FC90:
 800fc90:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800fc92:	46ce      	mov	lr, r9
 800fc94:	4647      	mov	r7, r8
 800fc96:	4689      	mov	r9, r1
 800fc98:	4c1c      	ldr	r4, [pc, #112]	@ (800fd0c <fn_0800FC90+0x7c>)
 800fc9a:	491d      	ldr	r1, [pc, #116]	@ (800fd10 <fn_0800FC90+0x80>)
 800fc9c:	6826      	ldr	r6, [r4, #0]
 800fc9e:	4c1d      	ldr	r4, [pc, #116]	@ (800fd14 <fn_0800FC90+0x84>)
 800fca0:	5871      	ldr	r1, [r6, r1]
 800fca2:	6905      	ldr	r5, [r0, #16]
 800fca4:	5933      	ldr	r3, [r6, r4]
 800fca6:	b580      	push	{r7, lr}
 800fca8:	468c      	mov	ip, r1
 800fcaa:	0417      	lsls	r7, r2, #16
 800fcac:	491a      	ldr	r1, [pc, #104]	@ (800fd18 <fn_0800FC90+0x88>)
 800fcae:	19ec      	adds	r4, r5, r7
 800fcb0:	1bed      	subs	r5, r5, r7
 800fcb2:	1ae4      	subs	r4, r4, r3
 800fcb4:	1aed      	subs	r5, r5, r3
 800fcb6:	68c3      	ldr	r3, [r0, #12]
 800fcb8:	5070      	str	r0, [r6, r1]
 800fcba:	4649      	mov	r1, r9
 800fcbc:	4817      	ldr	r0, [pc, #92]	@ (800fd1c <fn_0800FC90+0x8c>)
 800fcbe:	5031      	str	r1, [r6, r0]
 800fcc0:	4917      	ldr	r1, [pc, #92]	@ (800fd20 <fn_0800FC90+0x90>)
 800fcc2:	15e4      	asrs	r4, r4, #23
 800fcc4:	5072      	str	r2, [r6, r1]
 800fcc6:	15ed      	asrs	r5, r5, #23
 800fcc8:	42ac      	cmp	r4, r5
 800fcca:	db19      	blt.n	800fd00 <fn_0800FC90+0x70>
 800fccc:	4662      	mov	r2, ip
 800fcce:	19de      	adds	r6, r3, r7
 800fcd0:	1bdb      	subs	r3, r3, r7
 800fcd2:	1a9b      	subs	r3, r3, r2
 800fcd4:	1ab6      	subs	r6, r6, r2
 800fcd6:	15db      	asrs	r3, r3, #23
 800fcd8:	4698      	mov	r8, r3
 800fcda:	15f6      	asrs	r6, r6, #23
 800fcdc:	429e      	cmp	r6, r3
 800fcde:	db0f      	blt.n	800fd00 <fn_0800FC90+0x70>
 800fce0:	1c63      	adds	r3, r4, #1
 800fce2:	4699      	mov	r9, r3
 800fce4:	4f0f      	ldr	r7, [pc, #60]	@ (800fd24 <fn_0800FC90+0x94>)
 800fce6:	3601      	adds	r6, #1
 800fce8:	4644      	mov	r4, r8
 800fcea:	0020      	movs	r0, r4
 800fcec:	003a      	movs	r2, r7
 800fcee:	0029      	movs	r1, r5
 800fcf0:	3401      	adds	r4, #1
 800fcf2:	f000 fb47 	bl	8010384 <fn_08010384>
 800fcf6:	42a6      	cmp	r6, r4
 800fcf8:	d1f7      	bne.n	800fcea <fn_0800FC90+0x5a>
 800fcfa:	3501      	adds	r5, #1
 800fcfc:	454d      	cmp	r5, r9
 800fcfe:	d1f3      	bne.n	800fce8 <fn_0800FC90+0x58>
 800fd00:	bcc0      	pop	{r6, r7}
 800fd02:	46b9      	mov	r9, r7
 800fd04:	46b0      	mov	r8, r6
 800fd06:	bcf8      	pop	{r3, r4, r5, r6, r7}
 800fd08:	bc01      	pop	{r0}
 800fd0a:	4700      	bx	r0
 800fd0c:	030064c4 	.word	0x030064c4	@ data_030064C4
 800fd10:	00000e28 	.word	0x00000e28
 800fd14:	00000e2c 	.word	0x00000e2c
 800fd18:	00000918 	.word	0x00000918
 800fd1c:	00000914 	.word	0x00000914
 800fd20:	0000091c 	.word	0x0000091c
 800fd24:	0800e939 	.word	0x0800e939	@ fn_0800E938
