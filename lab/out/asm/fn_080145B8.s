fn_080145B8:
 80145b8:	4b14      	ldr	r3, [pc, #80]	@ (801460c <fn_080145B8+0x54>)
 80145ba:	468c      	mov	ip, r1
 80145bc:	6819      	ldr	r1, [r3, #0]
 80145be:	23df      	movs	r3, #223	@ 0xdf
 80145c0:	b510      	push	{r4, lr}
 80145c2:	0004      	movs	r4, r0
 80145c4:	011b      	lsls	r3, r3, #4
 80145c6:	58c8      	ldr	r0, [r1, r3]
 80145c8:	00a3      	lsls	r3, r4, #2
 80145ca:	191b      	adds	r3, r3, r4
 80145cc:	00db      	lsls	r3, r3, #3
 80145ce:	18c0      	adds	r0, r0, r3
 80145d0:	4663      	mov	r3, ip
 80145d2:	6980      	ldr	r0, [r0, #24]
 80145d4:	005b      	lsls	r3, r3, #1
 80145d6:	5a18      	ldrh	r0, [r3, r0]
 80145d8:	23e0      	movs	r3, #224	@ 0xe0
 80145da:	011b      	lsls	r3, r3, #4
 80145dc:	58cb      	ldr	r3, [r1, r3]
 80145de:	0140      	lsls	r0, r0, #5
 80145e0:	181b      	adds	r3, r3, r0
 80145e2:	0052      	lsls	r2, r2, #1
 80145e4:	189b      	adds	r3, r3, r2
 80145e6:	22e1      	movs	r2, #225	@ 0xe1
 80145e8:	8a9b      	ldrh	r3, [r3, #20]
 80145ea:	0112      	lsls	r2, r2, #4
 80145ec:	0058      	lsls	r0, r3, #1
 80145ee:	588a      	ldr	r2, [r1, r2]
 80145f0:	18c0      	adds	r0, r0, r3
 80145f2:	0080      	lsls	r0, r0, #2
 80145f4:	4293      	cmp	r3, r2
 80145f6:	d205      	bcs.n	8014604 <fn_080145B8+0x4c>
 80145f8:	4b05      	ldr	r3, [pc, #20]	@ (8014610 <fn_080145B8+0x58>)
 80145fa:	58cb      	ldr	r3, [r1, r3]
 80145fc:	1818      	adds	r0, r3, r0
 80145fe:	bc10      	pop	{r4}
 8014600:	bc02      	pop	{r1}
 8014602:	4708      	bx	r1
 8014604:	4b03      	ldr	r3, [pc, #12]	@ (8014614 <fn_080145B8+0x5c>)
 8014606:	58cb      	ldr	r3, [r1, r3]
 8014608:	1818      	adds	r0, r3, r0
 801460a:	e7f8      	b.n	80145fe <fn_080145B8+0x46>
 801460c:	030064c4 	.word	0x030064c4
 8014610:	00000e14 	.word	0x00000e14
 8014614:	00000e0c 	.word	0x00000e0c
