fn_08018624:
 8018624:	2380      	movs	r3, #128	@ 0x80
 8018626:	b5f0      	push	{r4, r5, r6, r7, lr}
 8018628:	46c6      	mov	lr, r8
 801862a:	0ccc      	lsrs	r4, r1, #19
 801862c:	011b      	lsls	r3, r3, #4
 801862e:	4f0d      	ldr	r7, [pc, #52]	@ (8018664 <fn_08018624+0x40>)
 8018630:	18e3      	adds	r3, r4, r3
 8018632:	009b      	lsls	r3, r3, #2
 8018634:	b500      	push	{lr}
 8018636:	6805      	ldr	r5, [r0, #0]
 8018638:	58f9      	ldr	r1, [r7, r3]
 801863a:	0010      	movs	r0, r2
 801863c:	4690      	mov	r8, r2
 801863e:	f00c ffcd 	bl	80255dc <fn_080255DC>
 8018642:	6bee      	ldr	r6, [r5, #60]	@ 0x3c
 8018644:	00a4      	lsls	r4, r4, #2
 8018646:	1836      	adds	r6, r6, r0
 8018648:	63ee      	str	r6, [r5, #60]	@ 0x3c
 801864a:	4640      	mov	r0, r8
 801864c:	59e1      	ldr	r1, [r4, r7]
 801864e:	f00c ffc5 	bl	80255dc <fn_080255DC>
 8018652:	6c2e      	ldr	r6, [r5, #64]	@ 0x40
 8018654:	1836      	adds	r6, r6, r0
 8018656:	642e      	str	r6, [r5, #64]	@ 0x40
 8018658:	bc80      	pop	{r7}
 801865a:	46b8      	mov	r8, r7
 801865c:	bcf0      	pop	{r4, r5, r6, r7}
 801865e:	bc01      	pop	{r0}
 8018660:	4700      	bx	r0
 8018662:	46c0      	nop			@ (mov r8, r8)
 8018664:	081397cc 	.word	0x081397cc	@ data_081397CC
