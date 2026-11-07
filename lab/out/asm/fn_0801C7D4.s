fn_0801C7D4:
 801c7d4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 801c7d6:	4647      	mov	r7, r8
 801c7d8:	4680      	mov	r8, r0
 801c7da:	46ce      	mov	lr, r9
 801c7dc:	000c      	movs	r4, r1
 801c7de:	4b36      	ldr	r3, [pc, #216]	@ (801c8b8 <fn_0801C7D4+0xe4>)
 801c7e0:	681a      	ldr	r2, [r3, #0]
 801c7e2:	4b36      	ldr	r3, [pc, #216]	@ (801c8bc <fn_0801C7D4+0xe8>)
 801c7e4:	58d3      	ldr	r3, [r2, r3]
 801c7e6:	6819      	ldr	r1, [r3, #0]
 801c7e8:	00cb      	lsls	r3, r1, #3
 801c7ea:	185b      	adds	r3, r3, r1
 801c7ec:	4a34      	ldr	r2, [pc, #208]	@ (801c8c0 <fn_0801C7D4+0xec>)
 801c7ee:	4443      	add	r3, r8
 801c7f0:	00db      	lsls	r3, r3, #3
 801c7f2:	589e      	ldr	r6, [r3, r2]
 801c7f4:	b580      	push	{r7, lr}
 801c7f6:	18d2      	adds	r2, r2, r3
 801c7f8:	6820      	ldr	r0, [r4, #0]
 801c7fa:	6857      	ldr	r7, [r2, #4]
 801c7fc:	f000 fe40 	bl	801d480 <fn_0801D480>
 801c800:	f000 feb2 	bl	801d568 <fn_0801D568>
 801c804:	2204      	movs	r2, #4
 801c806:	5e83      	ldrsh	r3, [r0, r2]
 801c808:	2100      	movs	r1, #0
 801c80a:	5e42      	ldrsh	r2, [r0, r1]
 801c80c:	2140      	movs	r1, #64	@ 0x40
 801c80e:	1af3      	subs	r3, r6, r3
 801c810:	18d2      	adds	r2, r2, r3
 801c812:	31ff      	adds	r1, #255	@ 0xff
 801c814:	428a      	cmp	r2, r1
 801c816:	dc1f      	bgt.n	801c858 <fn_0801C7D4+0x84>
 801c818:	2106      	movs	r1, #6
 801c81a:	5e42      	ldrsh	r2, [r0, r1]
 801c81c:	1aba      	subs	r2, r7, r2
 801c81e:	4691      	mov	r9, r2
 801c820:	2202      	movs	r2, #2
 801c822:	5e81      	ldrsh	r1, [r0, r2]
 801c824:	468c      	mov	ip, r1
 801c826:	44cc      	add	ip, r9
 801c828:	4661      	mov	r1, ip
 801c82a:	2000      	movs	r0, #0
 801c82c:	22c7      	movs	r2, #199	@ 0xc7
 801c82e:	4665      	mov	r5, ip
 801c830:	0fc9      	lsrs	r1, r1, #31
 801c832:	42aa      	cmp	r2, r5
 801c834:	4141      	adcs	r1, r0
 801c836:	0609      	lsls	r1, r1, #24
 801c838:	d00e      	beq.n	801c858 <fn_0801C7D4+0x84>
 801c83a:	464a      	mov	r2, r9
 801c83c:	431a      	orrs	r2, r3
 801c83e:	2300      	movs	r3, #0
 801c840:	2a00      	cmp	r2, #0
 801c842:	db09      	blt.n	801c858 <fn_0801C7D4+0x84>
 801c844:	58e0      	ldr	r0, [r4, r3]
 801c846:	f000 fe1b 	bl	801d480 <fn_0801D480>
 801c84a:	2200      	movs	r2, #0
 801c84c:	0003      	movs	r3, r0
 801c84e:	0039      	movs	r1, r7
 801c850:	0030      	movs	r0, r6
 801c852:	f7ff fc6d 	bl	801c130 <fn_0801C130>
 801c856:	e029      	b.n	801c8ac <fn_0801C7D4+0xd8>
 801c858:	6860      	ldr	r0, [r4, #4]
 801c85a:	f000 fe11 	bl	801d480 <fn_0801D480>
 801c85e:	f000 fe83 	bl	801d568 <fn_0801D568>
 801c862:	2204      	movs	r2, #4
 801c864:	5e83      	ldrsh	r3, [r0, r2]
 801c866:	2100      	movs	r1, #0
 801c868:	5e42      	ldrsh	r2, [r0, r1]
 801c86a:	2140      	movs	r1, #64	@ 0x40
 801c86c:	1af3      	subs	r3, r6, r3
 801c86e:	18d2      	adds	r2, r2, r3
 801c870:	31ff      	adds	r1, #255	@ 0xff
 801c872:	428a      	cmp	r2, r1
 801c874:	dc15      	bgt.n	801c8a2 <fn_0801C7D4+0xce>
 801c876:	2106      	movs	r1, #6
 801c878:	5e42      	ldrsh	r2, [r0, r1]
 801c87a:	1aba      	subs	r2, r7, r2
 801c87c:	4691      	mov	r9, r2
 801c87e:	2202      	movs	r2, #2
 801c880:	5e81      	ldrsh	r1, [r0, r2]
 801c882:	468c      	mov	ip, r1
 801c884:	44cc      	add	ip, r9
 801c886:	4661      	mov	r1, ip
 801c888:	2000      	movs	r0, #0
 801c88a:	25c7      	movs	r5, #199	@ 0xc7
 801c88c:	4662      	mov	r2, ip
 801c88e:	0fc9      	lsrs	r1, r1, #31
 801c890:	4295      	cmp	r5, r2
 801c892:	4141      	adcs	r1, r0
 801c894:	0609      	lsls	r1, r1, #24
 801c896:	d004      	beq.n	801c8a2 <fn_0801C7D4+0xce>
 801c898:	464a      	mov	r2, r9
 801c89a:	431a      	orrs	r2, r3
 801c89c:	d401      	bmi.n	801c8a2 <fn_0801C7D4+0xce>
 801c89e:	2304      	movs	r3, #4
 801c8a0:	e7d0      	b.n	801c844 <fn_0801C7D4+0x70>
 801c8a2:	4641      	mov	r1, r8
 801c8a4:	4807      	ldr	r0, [pc, #28]	@ (801c8c4 <fn_0801C7D4+0xf0>)
 801c8a6:	3101      	adds	r1, #1
 801c8a8:	f7e8 fdbc 	bl	8005424 <fn_08005424>
 801c8ac:	bcc0      	pop	{r6, r7}
 801c8ae:	46b9      	mov	r9, r7
 801c8b0:	46b0      	mov	r8, r6
 801c8b2:	bcf8      	pop	{r3, r4, r5, r6, r7}
 801c8b4:	bc01      	pop	{r0}
 801c8b6:	4700      	bx	r0
 801c8b8:	030064c4 	.word	0x030064c4
 801c8bc:	00005a40 	.word	0x00005a40
 801c8c0:	08147864 	.word	0x08147864
 801c8c4:	0814a938 	.word	0x0814a938
