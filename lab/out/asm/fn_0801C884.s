fn_0801C884:
 801c884:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 801c886:	4647      	mov	r7, r8
 801c888:	4680      	mov	r8, r0
 801c88a:	46ce      	mov	lr, r9
 801c88c:	000c      	movs	r4, r1
 801c88e:	4b36      	ldr	r3, [pc, #216]	@ (801c968 <fn_0801C884+0xe4>)
 801c890:	681a      	ldr	r2, [r3, #0]
 801c892:	4b36      	ldr	r3, [pc, #216]	@ (801c96c <fn_0801C884+0xe8>)
 801c894:	58d3      	ldr	r3, [r2, r3]
 801c896:	6819      	ldr	r1, [r3, #0]
 801c898:	00cb      	lsls	r3, r1, #3
 801c89a:	185b      	adds	r3, r3, r1
 801c89c:	4a34      	ldr	r2, [pc, #208]	@ (801c970 <fn_0801C884+0xec>)
 801c89e:	4443      	add	r3, r8
 801c8a0:	00db      	lsls	r3, r3, #3
 801c8a2:	589e      	ldr	r6, [r3, r2]
 801c8a4:	b580      	push	{r7, lr}
 801c8a6:	18d2      	adds	r2, r2, r3
 801c8a8:	6820      	ldr	r0, [r4, #0]
 801c8aa:	6857      	ldr	r7, [r2, #4]
 801c8ac:	f000 fe40 	bl	801d530 <fn_0801D530>
 801c8b0:	f000 feb2 	bl	801d618 <fn_0801D618>
 801c8b4:	2204      	movs	r2, #4
 801c8b6:	5e83      	ldrsh	r3, [r0, r2]
 801c8b8:	2100      	movs	r1, #0
 801c8ba:	5e42      	ldrsh	r2, [r0, r1]
 801c8bc:	2140      	movs	r1, #64	@ 0x40
 801c8be:	1af3      	subs	r3, r6, r3
 801c8c0:	18d2      	adds	r2, r2, r3
 801c8c2:	31ff      	adds	r1, #255	@ 0xff
 801c8c4:	428a      	cmp	r2, r1
 801c8c6:	dc1f      	bgt.n	801c908 <fn_0801C884+0x84>
 801c8c8:	2106      	movs	r1, #6
 801c8ca:	5e42      	ldrsh	r2, [r0, r1]
 801c8cc:	1aba      	subs	r2, r7, r2
 801c8ce:	4691      	mov	r9, r2
 801c8d0:	2202      	movs	r2, #2
 801c8d2:	5e81      	ldrsh	r1, [r0, r2]
 801c8d4:	468c      	mov	ip, r1
 801c8d6:	44cc      	add	ip, r9
 801c8d8:	4661      	mov	r1, ip
 801c8da:	2000      	movs	r0, #0
 801c8dc:	22c7      	movs	r2, #199	@ 0xc7
 801c8de:	4665      	mov	r5, ip
 801c8e0:	0fc9      	lsrs	r1, r1, #31
 801c8e2:	42aa      	cmp	r2, r5
 801c8e4:	4141      	adcs	r1, r0
 801c8e6:	0609      	lsls	r1, r1, #24
 801c8e8:	d00e      	beq.n	801c908 <fn_0801C884+0x84>
 801c8ea:	464a      	mov	r2, r9
 801c8ec:	431a      	orrs	r2, r3
 801c8ee:	2300      	movs	r3, #0
 801c8f0:	2a00      	cmp	r2, #0
 801c8f2:	db09      	blt.n	801c908 <fn_0801C884+0x84>
 801c8f4:	58e0      	ldr	r0, [r4, r3]
 801c8f6:	f000 fe1b 	bl	801d530 <fn_0801D530>
 801c8fa:	2200      	movs	r2, #0
 801c8fc:	0003      	movs	r3, r0
 801c8fe:	0039      	movs	r1, r7
 801c900:	0030      	movs	r0, r6
 801c902:	f7ff fc6d 	bl	801c1e0 <fn_0801C1E0>
 801c906:	e029      	b.n	801c95c <fn_0801C884+0xd8>
 801c908:	6860      	ldr	r0, [r4, #4]
 801c90a:	f000 fe11 	bl	801d530 <fn_0801D530>
 801c90e:	f000 fe83 	bl	801d618 <fn_0801D618>
 801c912:	2204      	movs	r2, #4
 801c914:	5e83      	ldrsh	r3, [r0, r2]
 801c916:	2100      	movs	r1, #0
 801c918:	5e42      	ldrsh	r2, [r0, r1]
 801c91a:	2140      	movs	r1, #64	@ 0x40
 801c91c:	1af3      	subs	r3, r6, r3
 801c91e:	18d2      	adds	r2, r2, r3
 801c920:	31ff      	adds	r1, #255	@ 0xff
 801c922:	428a      	cmp	r2, r1
 801c924:	dc15      	bgt.n	801c952 <fn_0801C884+0xce>
 801c926:	2106      	movs	r1, #6
 801c928:	5e42      	ldrsh	r2, [r0, r1]
 801c92a:	1aba      	subs	r2, r7, r2
 801c92c:	4691      	mov	r9, r2
 801c92e:	2202      	movs	r2, #2
 801c930:	5e81      	ldrsh	r1, [r0, r2]
 801c932:	468c      	mov	ip, r1
 801c934:	44cc      	add	ip, r9
 801c936:	4661      	mov	r1, ip
 801c938:	2000      	movs	r0, #0
 801c93a:	25c7      	movs	r5, #199	@ 0xc7
 801c93c:	4662      	mov	r2, ip
 801c93e:	0fc9      	lsrs	r1, r1, #31
 801c940:	4295      	cmp	r5, r2
 801c942:	4141      	adcs	r1, r0
 801c944:	0609      	lsls	r1, r1, #24
 801c946:	d004      	beq.n	801c952 <fn_0801C884+0xce>
 801c948:	464a      	mov	r2, r9
 801c94a:	431a      	orrs	r2, r3
 801c94c:	d401      	bmi.n	801c952 <fn_0801C884+0xce>
 801c94e:	2304      	movs	r3, #4
 801c950:	e7d0      	b.n	801c8f4 <fn_0801C884+0x70>
 801c952:	4641      	mov	r1, r8
 801c954:	4807      	ldr	r0, [pc, #28]	@ (801c974 <fn_0801C884+0xf0>)
 801c956:	3101      	adds	r1, #1
 801c958:	f7e8 fd64 	bl	8005424 <fn_08005424>
 801c95c:	bcc0      	pop	{r6, r7}
 801c95e:	46b9      	mov	r9, r7
 801c960:	46b0      	mov	r8, r6
 801c962:	bcf8      	pop	{r3, r4, r5, r6, r7}
 801c964:	bc01      	pop	{r0}
 801c966:	4700      	bx	r0
 801c968:	030064c4 	.word	0x030064c4
 801c96c:	00005a40 	.word	0x00005a40
 801c970:	08147938 	.word	0x08147938
 801c974:	0814aa0c 	.word	0x0814aa0c
