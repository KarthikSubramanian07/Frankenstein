fn_0801D91C:
 801d91c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 801d91e:	4d16      	ldr	r5, [pc, #88]	@ (801d978 <fn_0801D91C+0x5c>)
 801d920:	682b      	ldr	r3, [r5, #0]
 801d922:	689c      	ldr	r4, [r3, #8]
 801d924:	68a2      	ldr	r2, [r4, #8]
 801d926:	429a      	cmp	r2, r3
 801d928:	d01a      	beq.n	801d960 <fn_0801D91C+0x44>
 801d92a:	4f14      	ldr	r7, [pc, #80]	@ (801d97c <fn_0801D91C+0x60>)
 801d92c:	4e14      	ldr	r6, [pc, #80]	@ (801d980 <fn_0801D91C+0x64>)
 801d92e:	6823      	ldr	r3, [r4, #0]
 801d930:	021b      	lsls	r3, r3, #8
 801d932:	0a1b      	lsrs	r3, r3, #8
 801d934:	18e3      	adds	r3, r4, r3
 801d936:	429a      	cmp	r2, r3
 801d938:	d003      	beq.n	801d942 <fn_0801D91C+0x26>
 801d93a:	0038      	movs	r0, r7
 801d93c:	f7e2 fe34 	bl	80005a8 <fn_080005A8>
 801d940:	68a2      	ldr	r2, [r4, #8]
 801d942:	68d3      	ldr	r3, [r2, #12]
 801d944:	42a3      	cmp	r3, r4
 801d946:	d003      	beq.n	801d950 <fn_0801D91C+0x34>
 801d948:	0030      	movs	r0, r6
 801d94a:	f7e2 fe2d 	bl	80005a8 <fn_080005A8>
 801d94e:	68a2      	ldr	r2, [r4, #8]
 801d950:	6863      	ldr	r3, [r4, #4]
 801d952:	2b00      	cmp	r3, #0
 801d954:	d007      	beq.n	801d966 <fn_0801D91C+0x4a>
 801d956:	0014      	movs	r4, r2
 801d958:	68a2      	ldr	r2, [r4, #8]
 801d95a:	682b      	ldr	r3, [r5, #0]
 801d95c:	429a      	cmp	r2, r3
 801d95e:	d1e6      	bne.n	801d92e <fn_0801D91C+0x12>
 801d960:	bcf8      	pop	{r3, r4, r5, r6, r7}
 801d962:	bc01      	pop	{r0}
 801d964:	4700      	bx	r0
 801d966:	6853      	ldr	r3, [r2, #4]
 801d968:	2b00      	cmp	r3, #0
 801d96a:	d1f4      	bne.n	801d956 <fn_0801D91C+0x3a>
 801d96c:	4805      	ldr	r0, [pc, #20]	@ (801d984 <fn_0801D91C+0x68>)
 801d96e:	f7e2 fe1b 	bl	80005a8 <fn_080005A8>
 801d972:	68a4      	ldr	r4, [r4, #8]
 801d974:	e7f0      	b.n	801d958 <fn_0801D91C+0x3c>
 801d976:	46c0      	nop			@ (mov r8, r8)
 801d978:	03006780 	.word	0x03006780	@ data_03006780
 801d97c:	0814aa7c 	.word	0x0814aa7c
 801d980:	0814aab4 	.word	0x0814aab4
 801d984:	0814aaec 	.word	0x0814aaec
