fn_080150D4:
 80150d4:	4b10      	ldr	r3, [pc, #64]	@ (8015118 <fn_080150D4+0x44>)
 80150d6:	b530      	push	{r4, r5, lr}
 80150d8:	681b      	ldr	r3, [r3, #0]
 80150da:	4c10      	ldr	r4, [pc, #64]	@ (801511c <fn_080150D4+0x48>)
 80150dc:	4684      	mov	ip, r0
 80150de:	5918      	ldr	r0, [r3, r4]
 80150e0:	1c4a      	adds	r2, r1, #1
 80150e2:	4282      	cmp	r2, r0
 80150e4:	da15      	bge.n	8015112 <fn_080150D4+0x3e>
 80150e6:	4664      	mov	r4, ip
 80150e8:	251c      	movs	r5, #28
 80150ea:	5f64      	ldrsh	r4, [r4, r5]
 80150ec:	25e0      	movs	r5, #224	@ 0xe0
 80150ee:	012d      	lsls	r5, r5, #4
 80150f0:	595b      	ldr	r3, [r3, r5]
 80150f2:	0149      	lsls	r1, r1, #5
 80150f4:	333c      	adds	r3, #60	@ 0x3c
 80150f6:	185b      	adds	r3, r3, r1
 80150f8:	e003      	b.n	8015102 <fn_080150D4+0x2e>
 80150fa:	3201      	adds	r2, #1
 80150fc:	3320      	adds	r3, #32
 80150fe:	4282      	cmp	r2, r0
 8015100:	d007      	beq.n	8015112 <fn_080150D4+0x3e>
 8015102:	2500      	movs	r5, #0
 8015104:	5f59      	ldrsh	r1, [r3, r5]
 8015106:	42a1      	cmp	r1, r4
 8015108:	d1f7      	bne.n	80150fa <fn_080150D4+0x26>
 801510a:	0010      	movs	r0, r2
 801510c:	bc30      	pop	{r4, r5}
 801510e:	bc02      	pop	{r1}
 8015110:	4708      	bx	r1
 8015112:	2201      	movs	r2, #1
 8015114:	4252      	negs	r2, r2
 8015116:	e7f8      	b.n	801510a <fn_080150D4+0x36>
 8015118:	030064c4 	.word	0x030064c4	@ data_030064C4
 801511c:	00000dfc 	.word	0x00000dfc
