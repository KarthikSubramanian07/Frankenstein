fn_08015084:
 8015084:	4b11      	ldr	r3, [pc, #68]	@ (80150cc <fn_08015084+0x48>)
 8015086:	b530      	push	{r4, r5, lr}
 8015088:	681b      	ldr	r3, [r3, #0]
 801508a:	4c11      	ldr	r4, [pc, #68]	@ (80150d0 <fn_08015084+0x4c>)
 801508c:	4684      	mov	ip, r0
 801508e:	5918      	ldr	r0, [r3, r4]
 8015090:	1c4a      	adds	r2, r1, #1
 8015092:	4282      	cmp	r2, r0
 8015094:	da17      	bge.n	80150c6 <fn_08015084+0x42>
 8015096:	4664      	mov	r4, ip
 8015098:	251c      	movs	r5, #28
 801509a:	5f64      	ldrsh	r4, [r4, r5]
 801509c:	25df      	movs	r5, #223	@ 0xdf
 801509e:	012d      	lsls	r5, r5, #4
 80150a0:	595b      	ldr	r3, [r3, r5]
 80150a2:	008d      	lsls	r5, r1, #2
 80150a4:	1949      	adds	r1, r1, r5
 80150a6:	334a      	adds	r3, #74	@ 0x4a
 80150a8:	00c9      	lsls	r1, r1, #3
 80150aa:	185b      	adds	r3, r3, r1
 80150ac:	e003      	b.n	80150b6 <fn_08015084+0x32>
 80150ae:	3201      	adds	r2, #1
 80150b0:	3328      	adds	r3, #40	@ 0x28
 80150b2:	4282      	cmp	r2, r0
 80150b4:	d007      	beq.n	80150c6 <fn_08015084+0x42>
 80150b6:	2500      	movs	r5, #0
 80150b8:	5f59      	ldrsh	r1, [r3, r5]
 80150ba:	42a1      	cmp	r1, r4
 80150bc:	d1f7      	bne.n	80150ae <fn_08015084+0x2a>
 80150be:	0010      	movs	r0, r2
 80150c0:	bc30      	pop	{r4, r5}
 80150c2:	bc02      	pop	{r1}
 80150c4:	4708      	bx	r1
 80150c6:	2201      	movs	r2, #1
 80150c8:	4252      	negs	r2, r2
 80150ca:	e7f8      	b.n	80150be <fn_08015084+0x3a>
 80150cc:	030064c4 	.word	0x030064c4	@ data_030064C4
 80150d0:	00000dec 	.word	0x00000dec
