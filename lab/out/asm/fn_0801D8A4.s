fn_0801D8A4:
 801d8a4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 801d8a6:	4657      	mov	r7, sl
 801d8a8:	4645      	mov	r5, r8
 801d8aa:	46de      	mov	lr, fp
 801d8ac:	464e      	mov	r6, r9
 801d8ae:	4b1a      	ldr	r3, [pc, #104]	@ (801d918 <fn_0801D8A4+0x74>)
 801d8b0:	b5e0      	push	{r5, r6, r7, lr}
 801d8b2:	000d      	movs	r5, r1
 801d8b4:	6819      	ldr	r1, [r3, #0]
 801d8b6:	688c      	ldr	r4, [r1, #8]
 801d8b8:	0007      	movs	r7, r0
 801d8ba:	469a      	mov	sl, r3
 801d8bc:	428c      	cmp	r4, r1
 801d8be:	d023      	beq.n	801d908 <fn_0801D8A4+0x64>
 801d8c0:	2300      	movs	r3, #0
 801d8c2:	4698      	mov	r8, r3
 801d8c4:	17eb      	asrs	r3, r5, #31
 801d8c6:	4699      	mov	r9, r3
 801d8c8:	0fc3      	lsrs	r3, r0, #31
 801d8ca:	469b      	mov	fp, r3
 801d8cc:	e001      	b.n	801d8d2 <fn_0801D8A4+0x2e>
 801d8ce:	428c      	cmp	r4, r1
 801d8d0:	d01a      	beq.n	801d908 <fn_0801D8A4+0x64>
 801d8d2:	0020      	movs	r0, r4
 801d8d4:	6843      	ldr	r3, [r0, #4]
 801d8d6:	68a4      	ldr	r4, [r4, #8]
 801d8d8:	2b00      	cmp	r3, #0
 801d8da:	d0f8      	beq.n	801d8ce <fn_0801D8A4+0x2a>
 801d8dc:	4642      	mov	r2, r8
 801d8de:	464e      	mov	r6, r9
 801d8e0:	78c3      	ldrb	r3, [r0, #3]
 801d8e2:	071b      	lsls	r3, r3, #28
 801d8e4:	0f1b      	lsrs	r3, r3, #28
 801d8e6:	429d      	cmp	r5, r3
 801d8e8:	4172      	adcs	r2, r6
 801d8ea:	0612      	lsls	r2, r2, #24
 801d8ec:	d0ef      	beq.n	801d8ce <fn_0801D8A4+0x2a>
 801d8ee:	465e      	mov	r6, fp
 801d8f0:	17da      	asrs	r2, r3, #31
 801d8f2:	42bb      	cmp	r3, r7
 801d8f4:	4172      	adcs	r2, r6
 801d8f6:	0613      	lsls	r3, r2, #24
 801d8f8:	d0e9      	beq.n	801d8ce <fn_0801D8A4+0x2a>
 801d8fa:	3010      	adds	r0, #16
 801d8fc:	f7ff fe74 	bl	801d5e8 <fn_0801D5E8>
 801d900:	4653      	mov	r3, sl
 801d902:	6819      	ldr	r1, [r3, #0]
 801d904:	428c      	cmp	r4, r1
 801d906:	d1e4      	bne.n	801d8d2 <fn_0801D8A4+0x2e>
 801d908:	bcf0      	pop	{r4, r5, r6, r7}
 801d90a:	46bb      	mov	fp, r7
 801d90c:	46b2      	mov	sl, r6
 801d90e:	46a9      	mov	r9, r5
 801d910:	46a0      	mov	r8, r4
 801d912:	bcf8      	pop	{r3, r4, r5, r6, r7}
 801d914:	bc01      	pop	{r0}
 801d916:	4700      	bx	r0
 801d918:	03006780 	.word	0x03006780
