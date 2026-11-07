fn_0801D954:
 801d954:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 801d956:	4657      	mov	r7, sl
 801d958:	4645      	mov	r5, r8
 801d95a:	46de      	mov	lr, fp
 801d95c:	464e      	mov	r6, r9
 801d95e:	4b1a      	ldr	r3, [pc, #104]	@ (801d9c8 <fn_0801D954+0x74>)
 801d960:	b5e0      	push	{r5, r6, r7, lr}
 801d962:	000d      	movs	r5, r1
 801d964:	6819      	ldr	r1, [r3, #0]
 801d966:	688c      	ldr	r4, [r1, #8]
 801d968:	0007      	movs	r7, r0
 801d96a:	469a      	mov	sl, r3
 801d96c:	428c      	cmp	r4, r1
 801d96e:	d023      	beq.n	801d9b8 <fn_0801D954+0x64>
 801d970:	2300      	movs	r3, #0
 801d972:	4698      	mov	r8, r3
 801d974:	17eb      	asrs	r3, r5, #31
 801d976:	4699      	mov	r9, r3
 801d978:	0fc3      	lsrs	r3, r0, #31
 801d97a:	469b      	mov	fp, r3
 801d97c:	e001      	b.n	801d982 <fn_0801D954+0x2e>
 801d97e:	428c      	cmp	r4, r1
 801d980:	d01a      	beq.n	801d9b8 <fn_0801D954+0x64>
 801d982:	0020      	movs	r0, r4
 801d984:	6843      	ldr	r3, [r0, #4]
 801d986:	68a4      	ldr	r4, [r4, #8]
 801d988:	2b00      	cmp	r3, #0
 801d98a:	d0f8      	beq.n	801d97e <fn_0801D954+0x2a>
 801d98c:	4642      	mov	r2, r8
 801d98e:	464e      	mov	r6, r9
 801d990:	78c3      	ldrb	r3, [r0, #3]
 801d992:	071b      	lsls	r3, r3, #28
 801d994:	0f1b      	lsrs	r3, r3, #28
 801d996:	429d      	cmp	r5, r3
 801d998:	4172      	adcs	r2, r6
 801d99a:	0612      	lsls	r2, r2, #24
 801d99c:	d0ef      	beq.n	801d97e <fn_0801D954+0x2a>
 801d99e:	465e      	mov	r6, fp
 801d9a0:	17da      	asrs	r2, r3, #31
 801d9a2:	42bb      	cmp	r3, r7
 801d9a4:	4172      	adcs	r2, r6
 801d9a6:	0613      	lsls	r3, r2, #24
 801d9a8:	d0e9      	beq.n	801d97e <fn_0801D954+0x2a>
 801d9aa:	3010      	adds	r0, #16
 801d9ac:	f7ff fe74 	bl	801d698 <fn_0801D698>
 801d9b0:	4653      	mov	r3, sl
 801d9b2:	6819      	ldr	r1, [r3, #0]
 801d9b4:	428c      	cmp	r4, r1
 801d9b6:	d1e4      	bne.n	801d982 <fn_0801D954+0x2e>
 801d9b8:	bcf0      	pop	{r4, r5, r6, r7}
 801d9ba:	46bb      	mov	fp, r7
 801d9bc:	46b2      	mov	sl, r6
 801d9be:	46a9      	mov	r9, r5
 801d9c0:	46a0      	mov	r8, r4
 801d9c2:	bcf8      	pop	{r3, r4, r5, r6, r7}
 801d9c4:	bc01      	pop	{r0}
 801d9c6:	4700      	bx	r0
 801d9c8:	03006780 	.word	0x03006780
