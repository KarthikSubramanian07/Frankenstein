fn_080186D8:
 80186d8:	2380      	movs	r3, #128	@ 0x80
 80186da:	b5f0      	push	{r4, r5, r6, r7, lr}
 80186dc:	46c6      	mov	lr, r8
 80186de:	0ccc      	lsrs	r4, r1, #19
 80186e0:	011b      	lsls	r3, r3, #4
 80186e2:	4f0d      	ldr	r7, [pc, #52]	@ (8018718 <fn_080186D8+0x40>)
 80186e4:	18e3      	adds	r3, r4, r3
 80186e6:	009b      	lsls	r3, r3, #2
 80186e8:	b500      	push	{lr}
 80186ea:	6805      	ldr	r5, [r0, #0]
 80186ec:	58f9      	ldr	r1, [r7, r3]
 80186ee:	0010      	movs	r0, r2
 80186f0:	4690      	mov	r8, r2
 80186f2:	f00c ffcb 	bl	802568c <fn_0802568C>
 80186f6:	6bee      	ldr	r6, [r5, #60]	@ 0x3c
 80186f8:	00a4      	lsls	r4, r4, #2
 80186fa:	1836      	adds	r6, r6, r0
 80186fc:	63ee      	str	r6, [r5, #60]	@ 0x3c
 80186fe:	4640      	mov	r0, r8
 8018700:	59e1      	ldr	r1, [r4, r7]
 8018702:	f00c ffc3 	bl	802568c <fn_0802568C>
 8018706:	6c2e      	ldr	r6, [r5, #64]	@ 0x40
 8018708:	1836      	adds	r6, r6, r0
 801870a:	642e      	str	r6, [r5, #64]	@ 0x40
 801870c:	bc80      	pop	{r7}
 801870e:	46b8      	mov	r8, r7
 8018710:	bcf0      	pop	{r4, r5, r6, r7}
 8018712:	bc01      	pop	{r0}
 8018714:	4700      	bx	r0
 8018716:	46c0      	nop			@ (mov r8, r8)
 8018718:	081398a0 	.word	0x081398a0
