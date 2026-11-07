fn_080145A0:
 80145a0:	22df      	movs	r2, #223	@ 0xdf
 80145a2:	4684      	mov	ip, r0
 80145a4:	4b16      	ldr	r3, [pc, #88]	@ (8014600 <fn_080145A0+0x60>)
 80145a6:	4817      	ldr	r0, [pc, #92]	@ (8014604 <fn_080145A0+0x64>)
 80145a8:	681b      	ldr	r3, [r3, #0]
 80145aa:	0112      	lsls	r2, r2, #4
 80145ac:	b510      	push	{r4, lr}
 80145ae:	589a      	ldr	r2, [r3, r2]
 80145b0:	581c      	ldr	r4, [r3, r0]
 80145b2:	4663      	mov	r3, ip
 80145b4:	8a98      	ldrh	r0, [r3, #20]
 80145b6:	0043      	lsls	r3, r0, #1
 80145b8:	181b      	adds	r3, r3, r0
 80145ba:	009b      	lsls	r3, r3, #2
 80145bc:	18e3      	adds	r3, r4, r3
 80145be:	8958      	ldrh	r0, [r3, #10]
 80145c0:	0083      	lsls	r3, r0, #2
 80145c2:	181b      	adds	r3, r3, r0
 80145c4:	00db      	lsls	r3, r3, #3
 80145c6:	18d0      	adds	r0, r2, r3
 80145c8:	4288      	cmp	r0, r1
 80145ca:	d002      	beq.n	80145d2 <fn_080145A0+0x32>
 80145cc:	bc10      	pop	{r4}
 80145ce:	bc02      	pop	{r1}
 80145d0:	4708      	bx	r1
 80145d2:	4663      	mov	r3, ip
 80145d4:	8ad8      	ldrh	r0, [r3, #22]
 80145d6:	4b0c      	ldr	r3, [pc, #48]	@ (8014608 <fn_080145A0+0x68>)
 80145d8:	4298      	cmp	r0, r3
 80145da:	d00e      	beq.n	80145fa <fn_080145A0+0x5a>
 80145dc:	0043      	lsls	r3, r0, #1
 80145de:	181b      	adds	r3, r3, r0
 80145e0:	009b      	lsls	r3, r3, #2
 80145e2:	18e4      	adds	r4, r4, r3
 80145e4:	8963      	ldrh	r3, [r4, #10]
 80145e6:	0098      	lsls	r0, r3, #2
 80145e8:	18c0      	adds	r0, r0, r3
 80145ea:	00c0      	lsls	r0, r0, #3
 80145ec:	1810      	adds	r0, r2, r0
 80145ee:	1a41      	subs	r1, r0, r1
 80145f0:	1e4b      	subs	r3, r1, #1
 80145f2:	4199      	sbcs	r1, r3
 80145f4:	4249      	negs	r1, r1
 80145f6:	4008      	ands	r0, r1
 80145f8:	e7e8      	b.n	80145cc <fn_080145A0+0x2c>
 80145fa:	2000      	movs	r0, #0
 80145fc:	e7f7      	b.n	80145ee <fn_080145A0+0x4e>
 80145fe:	46c0      	nop			@ (mov r8, r8)
 8014600:	030064c4 	.word	0x030064c4
 8014604:	00000e0c 	.word	0x00000e0c
 8014608:	0000ffff 	.word	0x0000ffff
