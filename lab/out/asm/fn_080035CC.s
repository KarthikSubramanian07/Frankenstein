fn_080035CC:
 80035cc:	2101      	movs	r1, #1
 80035ce:	b570      	push	{r4, r5, r6, lr}
 80035d0:	4d0a      	ldr	r5, [pc, #40]	@ (80035fc <fn_080035CC+0x30>)
 80035d2:	682b      	ldr	r3, [r5, #0]
 80035d4:	4a0a      	ldr	r2, [pc, #40]	@ (8003600 <fn_080035CC+0x34>)
 80035d6:	4249      	negs	r1, r1
 80035d8:	5099      	str	r1, [r3, r2]
 80035da:	2400      	movs	r4, #0
 80035dc:	22d5      	movs	r2, #213	@ 0xd5
 80035de:	549c      	strb	r4, [r3, r2]
 80035e0:	322c      	adds	r2, #44	@ 0x2c
 80035e2:	32ff      	adds	r2, #255	@ 0xff
 80035e4:	589a      	ldr	r2, [r3, r2]
 80035e6:	31dd      	adds	r1, #221	@ 0xdd
 80035e8:	3201      	adds	r2, #1
 80035ea:	505a      	str	r2, [r3, r1]
 80035ec:	f7ff fd3a 	bl	8003064 <fn_08003064>
 80035f0:	23d4      	movs	r3, #212	@ 0xd4
 80035f2:	682a      	ldr	r2, [r5, #0]
 80035f4:	54d4      	strb	r4, [r2, r3]
 80035f6:	bc70      	pop	{r4, r5, r6}
 80035f8:	bc01      	pop	{r0}
 80035fa:	4700      	bx	r0
 80035fc:	030064c4 	.word	0x030064c4	@ data_030064C4
 8003600:	0000563c 	.word	0x0000563c
