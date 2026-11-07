fn_0800FE1C:
 800fe1c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800fe1e:	8813      	ldrh	r3, [r2, #0]
 800fe20:	041d      	lsls	r5, r3, #16
 800fe22:	2408      	movs	r4, #8
 800fe24:	5f13      	ldrsh	r3, [r2, r4]
 800fe26:	4684      	mov	ip, r0
 800fe28:	0007      	movs	r7, r0
 800fe2a:	002e      	movs	r6, r5
 800fe2c:	200a      	movs	r0, #10
 800fe2e:	5e14      	ldrsh	r4, [r2, r0]
 800fe30:	2b00      	cmp	r3, #0
 800fe32:	d108      	bne.n	800fe46 <fn_0800FE1C+0x2a>
 800fe34:	0fe0      	lsrs	r0, r4, #31
 800fe36:	4565      	cmp	r5, ip
 800fe38:	db02      	blt.n	800fe40 <fn_0800FE1C+0x24>
 800fe3a:	17e0      	asrs	r0, r4, #31
 800fe3c:	1b00      	subs	r0, r0, r4
 800fe3e:	0fc0      	lsrs	r0, r0, #31
 800fe40:	bcf8      	pop	{r3, r4, r5, r6, r7}
 800fe42:	bc02      	pop	{r1}
 800fe44:	4708      	bx	r1
 800fe46:	8852      	ldrh	r2, [r2, #2]
 800fe48:	0412      	lsls	r2, r2, #16
 800fe4a:	2c00      	cmp	r4, #0
 800fe4c:	d106      	bne.n	800fe5c <fn_0800FE1C+0x40>
 800fe4e:	0fd8      	lsrs	r0, r3, #31
 800fe50:	428a      	cmp	r2, r1
 800fe52:	daf5      	bge.n	800fe40 <fn_0800FE1C+0x24>
 800fe54:	17d8      	asrs	r0, r3, #31
 800fe56:	1ac0      	subs	r0, r0, r3
 800fe58:	0fc0      	lsrs	r0, r0, #31
 800fe5a:	e7f1      	b.n	800fe40 <fn_0800FE1C+0x24>
 800fe5c:	1a88      	subs	r0, r1, r2
 800fe5e:	0019      	movs	r1, r3
 800fe60:	f015 fc14 	bl	802568c <fn_0802568C>
 800fe64:	1bb9      	subs	r1, r7, r6
 800fe66:	0005      	movs	r5, r0
 800fe68:	0020      	movs	r0, r4
 800fe6a:	f015 fc0f 	bl	802568c <fn_0802568C>
 800fe6e:	0003      	movs	r3, r0
 800fe70:	17e8      	asrs	r0, r5, #31
 800fe72:	0fda      	lsrs	r2, r3, #31
 800fe74:	429d      	cmp	r5, r3
 800fe76:	4150      	adcs	r0, r2
 800fe78:	e7e2      	b.n	800fe40 <fn_0800FE1C+0x24>
 800fe7a:	46c0      	nop			@ (mov r8, r8)
