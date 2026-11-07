fn_08015188:
 8015188:	4b10      	ldr	r3, [pc, #64]	@ (80151cc <fn_08015188+0x44>)
 801518a:	b530      	push	{r4, r5, lr}
 801518c:	681b      	ldr	r3, [r3, #0]
 801518e:	4c10      	ldr	r4, [pc, #64]	@ (80151d0 <fn_08015188+0x48>)
 8015190:	4684      	mov	ip, r0
 8015192:	5918      	ldr	r0, [r3, r4]
 8015194:	1c4a      	adds	r2, r1, #1
 8015196:	4282      	cmp	r2, r0
 8015198:	da15      	bge.n	80151c6 <fn_08015188+0x3e>
 801519a:	4664      	mov	r4, ip
 801519c:	251c      	movs	r5, #28
 801519e:	5f64      	ldrsh	r4, [r4, r5]
 80151a0:	25e0      	movs	r5, #224	@ 0xe0
 80151a2:	012d      	lsls	r5, r5, #4
 80151a4:	595b      	ldr	r3, [r3, r5]
 80151a6:	0149      	lsls	r1, r1, #5
 80151a8:	333c      	adds	r3, #60	@ 0x3c
 80151aa:	185b      	adds	r3, r3, r1
 80151ac:	e003      	b.n	80151b6 <fn_08015188+0x2e>
 80151ae:	3201      	adds	r2, #1
 80151b0:	3320      	adds	r3, #32
 80151b2:	4282      	cmp	r2, r0
 80151b4:	d007      	beq.n	80151c6 <fn_08015188+0x3e>
 80151b6:	2500      	movs	r5, #0
 80151b8:	5f59      	ldrsh	r1, [r3, r5]
 80151ba:	42a1      	cmp	r1, r4
 80151bc:	d1f7      	bne.n	80151ae <fn_08015188+0x26>
 80151be:	0010      	movs	r0, r2
 80151c0:	bc30      	pop	{r4, r5}
 80151c2:	bc02      	pop	{r1}
 80151c4:	4708      	bx	r1
 80151c6:	2201      	movs	r2, #1
 80151c8:	4252      	negs	r2, r2
 80151ca:	e7f8      	b.n	80151be <fn_08015188+0x36>
 80151cc:	030064c4 	.word	0x030064c4
 80151d0:	00000dfc 	.word	0x00000dfc
