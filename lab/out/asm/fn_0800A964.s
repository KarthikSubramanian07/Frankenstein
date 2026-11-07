fn_0800A964:
 800a964:	008a      	lsls	r2, r1, #2
 800a966:	b5f0      	push	{r4, r5, r6, r7, lr}
 800a968:	4657      	mov	r7, sl
 800a96a:	46de      	mov	lr, fp
 800a96c:	464e      	mov	r6, r9
 800a96e:	4645      	mov	r5, r8
 800a970:	4693      	mov	fp, r2
 800a972:	4bd7      	ldr	r3, [pc, #860]	@ (800acd0 <fn_0800A964+0x36c>)
 800a974:	b5e0      	push	{r5, r6, r7, lr}
 800a976:	449b      	add	fp, r3
 800a978:	2501      	movs	r5, #1
 800a97a:	4681      	mov	r9, r0
 800a97c:	2700      	movs	r7, #0
 800a97e:	46da      	mov	sl, fp
 800a980:	b083      	sub	sp, #12
 800a982:	9100      	str	r1, [sp, #0]
 800a984:	426d      	negs	r5, r5
 800a986:	0029      	movs	r1, r5
 800a988:	4648      	mov	r0, r9
 800a98a:	f00a fb7b 	bl	8015084 <fn_08015084>
 800a98e:	1e05      	subs	r5, r0, #0
 800a990:	db2c      	blt.n	800a9ec <fn_0800A964+0x88>
 800a992:	22df      	movs	r2, #223	@ 0xdf
 800a994:	4bcf      	ldr	r3, [pc, #828]	@ (800acd4 <fn_0800A964+0x370>)
 800a996:	6819      	ldr	r1, [r3, #0]
 800a998:	0112      	lsls	r2, r2, #4
 800a99a:	469b      	mov	fp, r3
 800a99c:	00ab      	lsls	r3, r5, #2
 800a99e:	588e      	ldr	r6, [r1, r2]
 800a9a0:	195b      	adds	r3, r3, r5
 800a9a2:	00db      	lsls	r3, r3, #3
 800a9a4:	18f6      	adds	r6, r6, r3
 800a9a6:	0031      	movs	r1, r6
 800a9a8:	2000      	movs	r0, #0
 800a9aa:	f00a fd09 	bl	80153c0 <fn_080153C0>
 800a9ae:	4680      	mov	r8, r0
 800a9b0:	2800      	cmp	r0, #0
 800a9b2:	d1e8      	bne.n	800a986 <fn_0800A964+0x22>
 800a9b4:	2200      	movs	r2, #0
 800a9b6:	2103      	movs	r1, #3
 800a9b8:	202c      	movs	r0, #44	@ 0x2c
 800a9ba:	f012 fe5f 	bl	801d67c <fn_0801D67C>
 800a9be:	0004      	movs	r4, r0
 800a9c0:	222c      	movs	r2, #44	@ 0x2c
 800a9c2:	2100      	movs	r1, #0
 800a9c4:	f015 ffe4 	bl	8020990 <fn_08020990>
 800a9c8:	0020      	movs	r0, r4
 800a9ca:	f00d fda7 	bl	801851c <fn_0801851C>
 800a9ce:	4642      	mov	r2, r8
 800a9d0:	4bc1      	ldr	r3, [pc, #772]	@ (800acd8 <fn_0800A964+0x374>)
 800a9d2:	6134      	str	r4, [r6, #16]
 800a9d4:	9301      	str	r3, [sp, #4]
 800a9d6:	60a3      	str	r3, [r4, #8]
 800a9d8:	9b00      	ldr	r3, [sp, #0]
 800a9da:	7362      	strb	r2, [r4, #13]
 800a9dc:	7323      	strb	r3, [r4, #12]
 800a9de:	2b10      	cmp	r3, #16
 800a9e0:	d900      	bls.n	800a9e4 <fn_0800A964+0x80>
 800a9e2:	e3c7      	b.n	800b174 <fn_0800A964+0x810>
 800a9e4:	4653      	mov	r3, sl
 800a9e6:	681b      	ldr	r3, [r3, #0]
 800a9e8:	469f      	mov	pc, r3
 800a9ea:	2701      	movs	r7, #1
 800a9ec:	0038      	movs	r0, r7
 800a9ee:	b003      	add	sp, #12
 800a9f0:	bcf0      	pop	{r4, r5, r6, r7}
 800a9f2:	46bb      	mov	fp, r7
 800a9f4:	46b2      	mov	sl, r6
 800a9f6:	46a9      	mov	r9, r5
 800a9f8:	46a0      	mov	r8, r4
 800a9fa:	bcf0      	pop	{r4, r5, r6, r7}
 800a9fc:	bc02      	pop	{r1}
 800a9fe:	4708      	bx	r1
 800aa00:	2301      	movs	r3, #1
 800aa02:	7363      	strb	r3, [r4, #13]
 800aa04:	2301      	movs	r3, #1
 800aa06:	6163      	str	r3, [r4, #20]
 800aa08:	2380      	movs	r3, #128	@ 0x80
 800aa0a:	025b      	lsls	r3, r3, #9
 800aa0c:	0030      	movs	r0, r6
 800aa0e:	6126      	str	r6, [r4, #16]
 800aa10:	62a3      	str	r3, [r4, #40]	@ 0x28
 800aa12:	f00a f8df 	bl	8014bd4 <fn_08014BD4>
 800aa16:	6872      	ldr	r2, [r6, #4]
 800aa18:	4282      	cmp	r2, r0
 800aa1a:	dd00      	ble.n	800aa1e <fn_0800A964+0xba>
 800aa1c:	0002      	movs	r2, r0
 800aa1e:	9b00      	ldr	r3, [sp, #0]
 800aa20:	3b0d      	subs	r3, #13
 800aa22:	4259      	negs	r1, r3
 800aa24:	414b      	adcs	r3, r1
 800aa26:	04db      	lsls	r3, r3, #19
 800aa28:	1ad2      	subs	r2, r2, r3
 800aa2a:	2701      	movs	r7, #1
 800aa2c:	6262      	str	r2, [r4, #36]	@ 0x24
 800aa2e:	e7aa      	b.n	800a986 <fn_0800A964+0x22>
 800aa30:	2301      	movs	r3, #1
 800aa32:	6163      	str	r3, [r4, #20]
 800aa34:	2380      	movs	r3, #128	@ 0x80
 800aa36:	025b      	lsls	r3, r3, #9
 800aa38:	6126      	str	r6, [r4, #16]
 800aa3a:	62a3      	str	r3, [r4, #40]	@ 0x28
 800aa3c:	221e      	movs	r2, #30
 800aa3e:	5eb3      	ldrsh	r3, [r6, r2]
 800aa40:	2b00      	cmp	r3, #0
 800aa42:	dc01      	bgt.n	800aa48 <fn_0800A964+0xe4>
 800aa44:	f000 fcc7 	bl	800b3d6 <fn_0800A964+0xa72>
 800aa48:	23fa      	movs	r3, #250	@ 0xfa
 800aa4a:	05db      	lsls	r3, r3, #23
 800aa4c:	4698      	mov	r8, r3
 800aa4e:	4ba3      	ldr	r3, [pc, #652]	@ (800acdc <fn_0800A964+0x378>)
 800aa50:	469b      	mov	fp, r3
 800aa52:	0023      	movs	r3, r4
 800aa54:	2700      	movs	r7, #0
 800aa56:	4644      	mov	r4, r8
 800aa58:	4698      	mov	r8, r3
 800aa5a:	e004      	b.n	800aa66 <fn_0800A964+0x102>
 800aa5c:	221e      	movs	r2, #30
 800aa5e:	5eb3      	ldrsh	r3, [r6, r2]
 800aa60:	3701      	adds	r7, #1
 800aa62:	42bb      	cmp	r3, r7
 800aa64:	dd28      	ble.n	800aab8 <fn_0800A964+0x154>
 800aa66:	0039      	movs	r1, r7
 800aa68:	0028      	movs	r0, r5
 800aa6a:	f009 fd7b 	bl	8014564 <fn_08014564>
 800aa6e:	2800      	cmp	r0, #0
 800aa70:	d0f4      	beq.n	800aa5c <fn_0800A964+0xf8>
 800aa72:	2200      	movs	r2, #0
 800aa74:	0039      	movs	r1, r7
 800aa76:	0028      	movs	r0, r5
 800aa78:	f009 fd44 	bl	8014504 <fn_08014504>
 800aa7c:	88c3      	ldrh	r3, [r0, #6]
 800aa7e:	2b00      	cmp	r3, #0
 800aa80:	d006      	beq.n	800aa90 <fn_0800A964+0x12c>
 800aa82:	465a      	mov	r2, fp
 800aa84:	6812      	ldr	r2, [r2, #0]
 800aa86:	009b      	lsls	r3, r3, #2
 800aa88:	589b      	ldr	r3, [r3, r2]
 800aa8a:	429c      	cmp	r4, r3
 800aa8c:	dd00      	ble.n	800aa90 <fn_0800A964+0x12c>
 800aa8e:	e374      	b.n	800b17a <fn_0800A964+0x816>
 800aa90:	2201      	movs	r2, #1
 800aa92:	0039      	movs	r1, r7
 800aa94:	0028      	movs	r0, r5
 800aa96:	f009 fd35 	bl	8014504 <fn_08014504>
 800aa9a:	88c3      	ldrh	r3, [r0, #6]
 800aa9c:	2b00      	cmp	r3, #0
 800aa9e:	d0dd      	beq.n	800aa5c <fn_0800A964+0xf8>
 800aaa0:	465a      	mov	r2, fp
 800aaa2:	6812      	ldr	r2, [r2, #0]
 800aaa4:	009b      	lsls	r3, r3, #2
 800aaa6:	589b      	ldr	r3, [r3, r2]
 800aaa8:	429c      	cmp	r4, r3
 800aaaa:	ddd7      	ble.n	800aa5c <fn_0800A964+0xf8>
 800aaac:	001c      	movs	r4, r3
 800aaae:	221e      	movs	r2, #30
 800aab0:	5eb3      	ldrsh	r3, [r6, r2]
 800aab2:	3701      	adds	r7, #1
 800aab4:	42bb      	cmp	r3, r7
 800aab6:	dcd6      	bgt.n	800aa66 <fn_0800A964+0x102>
 800aab8:	4643      	mov	r3, r8
 800aaba:	46a0      	mov	r8, r4
 800aabc:	691e      	ldr	r6, [r3, #16]
 800aabe:	001c      	movs	r4, r3
 800aac0:	4643      	mov	r3, r8
 800aac2:	141b      	asrs	r3, r3, #16
 800aac4:	2102      	movs	r1, #2
 800aac6:	5e72      	ldrsh	r2, [r6, r1]
 800aac8:	18d3      	adds	r3, r2, r3
 800aaca:	22fa      	movs	r2, #250	@ 0xfa
 800aacc:	01d2      	lsls	r2, r2, #7
 800aace:	4293      	cmp	r3, r2
 800aad0:	dd01      	ble.n	800aad6 <fn_0800A964+0x172>
 800aad2:	f000 fc04 	bl	800b2de <fn_0800A964+0x97a>
 800aad6:	041b      	lsls	r3, r3, #16
 800aad8:	2701      	movs	r7, #1
 800aada:	6263      	str	r3, [r4, #36]	@ 0x24
 800aadc:	e753      	b.n	800a986 <fn_0800A964+0x22>
 800aade:	2301      	movs	r3, #1
 800aae0:	6163      	str	r3, [r4, #20]
 800aae2:	2380      	movs	r3, #128	@ 0x80
 800aae4:	2280      	movs	r2, #128	@ 0x80
 800aae6:	025b      	lsls	r3, r3, #9
 800aae8:	62a3      	str	r3, [r4, #40]	@ 0x28
 800aaea:	4698      	mov	r8, r3
 800aaec:	6833      	ldr	r3, [r6, #0]
 800aaee:	0492      	lsls	r2, r2, #18
 800aaf0:	189b      	adds	r3, r3, r2
 800aaf2:	0029      	movs	r1, r5
 800aaf4:	4648      	mov	r0, r9
 800aaf6:	6126      	str	r6, [r4, #16]
 800aaf8:	6263      	str	r3, [r4, #36]	@ 0x24
 800aafa:	f00a fac3 	bl	8015084 <fn_08015084>
 800aafe:	1e05      	subs	r5, r0, #0
 800ab00:	da00      	bge.n	800ab04 <fn_0800A964+0x1a0>
 800ab02:	e772      	b.n	800a9ea <fn_0800A964+0x86>
 800ab04:	465b      	mov	r3, fp
 800ab06:	22df      	movs	r2, #223	@ 0xdf
 800ab08:	6819      	ldr	r1, [r3, #0]
 800ab0a:	0112      	lsls	r2, r2, #4
 800ab0c:	0083      	lsls	r3, r0, #2
 800ab0e:	588c      	ldr	r4, [r1, r2]
 800ab10:	181b      	adds	r3, r3, r0
 800ab12:	00db      	lsls	r3, r3, #3
 800ab14:	18e4      	adds	r4, r4, r3
 800ab16:	0021      	movs	r1, r4
 800ab18:	2000      	movs	r0, #0
 800ab1a:	f00a fc51 	bl	80153c0 <fn_080153C0>
 800ab1e:	2701      	movs	r7, #1
 800ab20:	2800      	cmp	r0, #0
 800ab22:	d000      	beq.n	800ab26 <fn_0800A964+0x1c2>
 800ab24:	e72f      	b.n	800a986 <fn_0800A964+0x22>
 800ab26:	2200      	movs	r2, #0
 800ab28:	2103      	movs	r1, #3
 800ab2a:	302c      	adds	r0, #44	@ 0x2c
 800ab2c:	f012 fda6 	bl	801d67c <fn_0801D67C>
 800ab30:	0006      	movs	r6, r0
 800ab32:	222c      	movs	r2, #44	@ 0x2c
 800ab34:	2100      	movs	r1, #0
 800ab36:	f015 ff2b 	bl	8020990 <fn_08020990>
 800ab3a:	0030      	movs	r0, r6
 800ab3c:	f00d fcee 	bl	801851c <fn_0801851C>
 800ab40:	9b01      	ldr	r3, [sp, #4]
 800ab42:	6126      	str	r6, [r4, #16]
 800ab44:	60b3      	str	r3, [r6, #8]
 800ab46:	2310      	movs	r3, #16
 800ab48:	81b3      	strh	r3, [r6, #12]
 800ab4a:	4643      	mov	r3, r8
 800ab4c:	2280      	movs	r2, #128	@ 0x80
 800ab4e:	62b3      	str	r3, [r6, #40]	@ 0x28
 800ab50:	6823      	ldr	r3, [r4, #0]
 800ab52:	0492      	lsls	r2, r2, #18
 800ab54:	189b      	adds	r3, r3, r2
 800ab56:	6177      	str	r7, [r6, #20]
 800ab58:	6134      	str	r4, [r6, #16]
 800ab5a:	6273      	str	r3, [r6, #36]	@ 0x24
 800ab5c:	e713      	b.n	800a986 <fn_0800A964+0x22>
 800ab5e:	2301      	movs	r3, #1
 800ab60:	6163      	str	r3, [r4, #20]
 800ab62:	2380      	movs	r3, #128	@ 0x80
 800ab64:	02db      	lsls	r3, r3, #11
 800ab66:	62a3      	str	r3, [r4, #40]	@ 0x28
 800ab68:	6831      	ldr	r1, [r6, #0]
 800ab6a:	0030      	movs	r0, r6
 800ab6c:	6126      	str	r6, [r4, #16]
 800ab6e:	4698      	mov	r8, r3
 800ab70:	f009 fdf0 	bl	8014754 <fn_08014754>
 800ab74:	0029      	movs	r1, r5
 800ab76:	6260      	str	r0, [r4, #36]	@ 0x24
 800ab78:	4648      	mov	r0, r9
 800ab7a:	f00a fa83 	bl	8015084 <fn_08015084>
 800ab7e:	1e05      	subs	r5, r0, #0
 800ab80:	da00      	bge.n	800ab84 <fn_0800A964+0x220>
 800ab82:	e732      	b.n	800a9ea <fn_0800A964+0x86>
 800ab84:	465b      	mov	r3, fp
 800ab86:	22df      	movs	r2, #223	@ 0xdf
 800ab88:	6819      	ldr	r1, [r3, #0]
 800ab8a:	0112      	lsls	r2, r2, #4
 800ab8c:	0083      	lsls	r3, r0, #2
 800ab8e:	588c      	ldr	r4, [r1, r2]
 800ab90:	181b      	adds	r3, r3, r0
 800ab92:	00db      	lsls	r3, r3, #3
 800ab94:	18e4      	adds	r4, r4, r3
 800ab96:	0021      	movs	r1, r4
 800ab98:	2000      	movs	r0, #0
 800ab9a:	f00a fc11 	bl	80153c0 <fn_080153C0>
 800ab9e:	2701      	movs	r7, #1
 800aba0:	2800      	cmp	r0, #0
 800aba2:	d000      	beq.n	800aba6 <fn_0800A964+0x242>
 800aba4:	e6ef      	b.n	800a986 <fn_0800A964+0x22>
 800aba6:	2200      	movs	r2, #0
 800aba8:	2103      	movs	r1, #3
 800abaa:	302c      	adds	r0, #44	@ 0x2c
 800abac:	f012 fd66 	bl	801d67c <fn_0801D67C>
 800abb0:	0006      	movs	r6, r0
 800abb2:	222c      	movs	r2, #44	@ 0x2c
 800abb4:	2100      	movs	r1, #0
 800abb6:	f015 feeb 	bl	8020990 <fn_08020990>
 800abba:	0030      	movs	r0, r6
 800abbc:	f00d fcae 	bl	801851c <fn_0801851C>
 800abc0:	9b01      	ldr	r3, [sp, #4]
 800abc2:	6126      	str	r6, [r4, #16]
 800abc4:	60b3      	str	r3, [r6, #8]
 800abc6:	230e      	movs	r3, #14
 800abc8:	e2b1      	b.n	800b12e <fn_0800A964+0x7ca>
 800abca:	2301      	movs	r3, #1
 800abcc:	2280      	movs	r2, #128	@ 0x80
 800abce:	425b      	negs	r3, r3
 800abd0:	0252      	lsls	r2, r2, #9
 800abd2:	6163      	str	r3, [r4, #20]
 800abd4:	62a2      	str	r2, [r4, #40]	@ 0x28
 800abd6:	0030      	movs	r0, r6
 800abd8:	6126      	str	r6, [r4, #16]
 800abda:	4690      	mov	r8, r2
 800abdc:	f009 fd16 	bl	801460c <fn_0801460C>
 800abe0:	0029      	movs	r1, r5
 800abe2:	6260      	str	r0, [r4, #36]	@ 0x24
 800abe4:	4648      	mov	r0, r9
 800abe6:	f00a fa4d 	bl	8015084 <fn_08015084>
 800abea:	1e05      	subs	r5, r0, #0
 800abec:	da00      	bge.n	800abf0 <fn_0800A964+0x28c>
 800abee:	e6fc      	b.n	800a9ea <fn_0800A964+0x86>
 800abf0:	465a      	mov	r2, fp
 800abf2:	6811      	ldr	r1, [r2, #0]
 800abf4:	22df      	movs	r2, #223	@ 0xdf
 800abf6:	0083      	lsls	r3, r0, #2
 800abf8:	0112      	lsls	r2, r2, #4
 800abfa:	588c      	ldr	r4, [r1, r2]
 800abfc:	181b      	adds	r3, r3, r0
 800abfe:	00db      	lsls	r3, r3, #3
 800ac00:	18e4      	adds	r4, r4, r3
 800ac02:	0021      	movs	r1, r4
 800ac04:	2000      	movs	r0, #0
 800ac06:	f00a fbdb 	bl	80153c0 <fn_080153C0>
 800ac0a:	2701      	movs	r7, #1
 800ac0c:	2800      	cmp	r0, #0
 800ac0e:	d000      	beq.n	800ac12 <fn_0800A964+0x2ae>
 800ac10:	e6b9      	b.n	800a986 <fn_0800A964+0x22>
 800ac12:	2200      	movs	r2, #0
 800ac14:	2103      	movs	r1, #3
 800ac16:	302c      	adds	r0, #44	@ 0x2c
 800ac18:	f012 fd30 	bl	801d67c <fn_0801D67C>
 800ac1c:	0006      	movs	r6, r0
 800ac1e:	222c      	movs	r2, #44	@ 0x2c
 800ac20:	2100      	movs	r1, #0
 800ac22:	f015 feb5 	bl	8020990 <fn_08020990>
 800ac26:	0030      	movs	r0, r6
 800ac28:	f00d fc78 	bl	801851c <fn_0801851C>
 800ac2c:	2301      	movs	r3, #1
 800ac2e:	425b      	negs	r3, r3
 800ac30:	6126      	str	r6, [r4, #16]
 800ac32:	6173      	str	r3, [r6, #20]
 800ac34:	4643      	mov	r3, r8
 800ac36:	9a01      	ldr	r2, [sp, #4]
 800ac38:	0020      	movs	r0, r4
 800ac3a:	60b2      	str	r2, [r6, #8]
 800ac3c:	81b7      	strh	r7, [r6, #12]
 800ac3e:	6134      	str	r4, [r6, #16]
 800ac40:	62b3      	str	r3, [r6, #40]	@ 0x28
 800ac42:	f009 fce3 	bl	801460c <fn_0801460C>
 800ac46:	6270      	str	r0, [r6, #36]	@ 0x24
 800ac48:	e69d      	b.n	800a986 <fn_0800A964+0x22>
 800ac4a:	2301      	movs	r3, #1
 800ac4c:	425b      	negs	r3, r3
 800ac4e:	6163      	str	r3, [r4, #20]
 800ac50:	2380      	movs	r3, #128	@ 0x80
 800ac52:	025b      	lsls	r3, r3, #9
 800ac54:	62a3      	str	r3, [r4, #40]	@ 0x28
 800ac56:	0030      	movs	r0, r6
 800ac58:	6126      	str	r6, [r4, #16]
 800ac5a:	4698      	mov	r8, r3
 800ac5c:	f009 fd26 	bl	80146ac <fn_080146AC>
 800ac60:	0029      	movs	r1, r5
 800ac62:	6260      	str	r0, [r4, #36]	@ 0x24
 800ac64:	4648      	mov	r0, r9
 800ac66:	f00a fa0d 	bl	8015084 <fn_08015084>
 800ac6a:	1e05      	subs	r5, r0, #0
 800ac6c:	da00      	bge.n	800ac70 <fn_0800A964+0x30c>
 800ac6e:	e6bc      	b.n	800a9ea <fn_0800A964+0x86>
 800ac70:	465b      	mov	r3, fp
 800ac72:	22df      	movs	r2, #223	@ 0xdf
 800ac74:	6819      	ldr	r1, [r3, #0]
 800ac76:	0112      	lsls	r2, r2, #4
 800ac78:	0083      	lsls	r3, r0, #2
 800ac7a:	588c      	ldr	r4, [r1, r2]
 800ac7c:	181b      	adds	r3, r3, r0
 800ac7e:	00db      	lsls	r3, r3, #3
 800ac80:	18e4      	adds	r4, r4, r3
 800ac82:	0021      	movs	r1, r4
 800ac84:	2000      	movs	r0, #0
 800ac86:	f00a fb9b 	bl	80153c0 <fn_080153C0>
 800ac8a:	2701      	movs	r7, #1
 800ac8c:	4683      	mov	fp, r0
 800ac8e:	2800      	cmp	r0, #0
 800ac90:	d000      	beq.n	800ac94 <fn_0800A964+0x330>
 800ac92:	e678      	b.n	800a986 <fn_0800A964+0x22>
 800ac94:	2200      	movs	r2, #0
 800ac96:	2103      	movs	r1, #3
 800ac98:	202c      	movs	r0, #44	@ 0x2c
 800ac9a:	f012 fcef 	bl	801d67c <fn_0801D67C>
 800ac9e:	0006      	movs	r6, r0
 800aca0:	222c      	movs	r2, #44	@ 0x2c
 800aca2:	2100      	movs	r1, #0
 800aca4:	f015 fe74 	bl	8020990 <fn_08020990>
 800aca8:	0030      	movs	r0, r6
 800acaa:	f00d fc37 	bl	801851c <fn_0801851C>
 800acae:	9b01      	ldr	r3, [sp, #4]
 800acb0:	6126      	str	r6, [r4, #16]
 800acb2:	60b3      	str	r3, [r6, #8]
 800acb4:	465b      	mov	r3, fp
 800acb6:	81b3      	strh	r3, [r6, #12]
 800acb8:	2301      	movs	r3, #1
 800acba:	425b      	negs	r3, r3
 800acbc:	6173      	str	r3, [r6, #20]
 800acbe:	4643      	mov	r3, r8
 800acc0:	0020      	movs	r0, r4
 800acc2:	6134      	str	r4, [r6, #16]
 800acc4:	62b3      	str	r3, [r6, #40]	@ 0x28
 800acc6:	f009 fcf1 	bl	80146ac <fn_080146AC>
 800acca:	6270      	str	r0, [r6, #36]	@ 0x24
 800accc:	e65b      	b.n	800a986 <fn_0800A964+0x22>
 800acce:	46c0      	nop			@ (mov r8, r8)
 800acd0:	0812e55c 	.word	0x0812e55c
 800acd4:	030064c4 	.word	0x030064c4	@ data_030064C4
 800acd8:	0800a579 	.word	0x0800a579	@ fn_0800A578
 800acdc:	030065c4 	.word	0x030065c4	@ data_030065C4
 800ace0:	2380      	movs	r3, #128	@ 0x80
 800ace2:	21c0      	movs	r1, #192	@ 0xc0
 800ace4:	025b      	lsls	r3, r3, #9
 800ace6:	62a3      	str	r3, [r4, #40]	@ 0x28
 800ace8:	6833      	ldr	r3, [r6, #0]
 800acea:	0349      	lsls	r1, r1, #13
 800acec:	185b      	adds	r3, r3, r1
 800acee:	4659      	mov	r1, fp
 800acf0:	2201      	movs	r2, #1
 800acf2:	6808      	ldr	r0, [r1, #0]
 800acf4:	4649      	mov	r1, r9
 800acf6:	6162      	str	r2, [r4, #20]
 800acf8:	6126      	str	r6, [r4, #16]
 800acfa:	6263      	str	r3, [r4, #36]	@ 0x24
 800acfc:	8a8c      	ldrh	r4, [r1, #20]
 800acfe:	4fcf      	ldr	r7, [pc, #828]	@ (800b03c <fn_0800A964+0x6d8>)
 800ad00:	0063      	lsls	r3, r4, #1
 800ad02:	59c1      	ldr	r1, [r0, r7]
 800ad04:	191b      	adds	r3, r3, r4
 800ad06:	009b      	lsls	r3, r3, #2
 800ad08:	18c9      	adds	r1, r1, r3
 800ad0a:	894c      	ldrh	r4, [r1, #10]
 800ad0c:	21df      	movs	r1, #223	@ 0xdf
 800ad0e:	0109      	lsls	r1, r1, #4
 800ad10:	4688      	mov	r8, r1
 800ad12:	5843      	ldr	r3, [r0, r1]
 800ad14:	00a1      	lsls	r1, r4, #2
 800ad16:	1909      	adds	r1, r1, r4
 800ad18:	00c9      	lsls	r1, r1, #3
 800ad1a:	185b      	adds	r3, r3, r1
 800ad1c:	2124      	movs	r1, #36	@ 0x24
 800ad1e:	4644      	mov	r4, r8
 800ad20:	3324      	adds	r3, #36	@ 0x24
 800ad22:	781b      	ldrb	r3, [r3, #0]
 800ad24:	5473      	strb	r3, [r6, r1]
 800ad26:	5901      	ldr	r1, [r0, r4]
 800ad28:	464c      	mov	r4, r9
 800ad2a:	8aa4      	ldrh	r4, [r4, #20]
 800ad2c:	0063      	lsls	r3, r4, #1
 800ad2e:	59c0      	ldr	r0, [r0, r7]
 800ad30:	191b      	adds	r3, r3, r4
 800ad32:	009b      	lsls	r3, r3, #2
 800ad34:	18c3      	adds	r3, r0, r3
 800ad36:	895c      	ldrh	r4, [r3, #10]
 800ad38:	00a3      	lsls	r3, r4, #2
 800ad3a:	191b      	adds	r3, r3, r4
 800ad3c:	00db      	lsls	r3, r3, #3
 800ad3e:	18cb      	adds	r3, r1, r3
 800ad40:	2420      	movs	r4, #32
 800ad42:	5f1b      	ldrsh	r3, [r3, r4]
 800ad44:	464c      	mov	r4, r9
 800ad46:	8433      	strh	r3, [r6, #32]
 800ad48:	8aa4      	ldrh	r4, [r4, #20]
 800ad4a:	0063      	lsls	r3, r4, #1
 800ad4c:	191b      	adds	r3, r3, r4
 800ad4e:	009b      	lsls	r3, r3, #2
 800ad50:	18c0      	adds	r0, r0, r3
 800ad52:	8940      	ldrh	r0, [r0, #10]
 800ad54:	0083      	lsls	r3, r0, #2
 800ad56:	181b      	adds	r3, r3, r0
 800ad58:	00db      	lsls	r3, r3, #3
 800ad5a:	18c9      	adds	r1, r1, r3
 800ad5c:	3127      	adds	r1, #39	@ 0x27
 800ad5e:	780b      	ldrb	r3, [r1, #0]
 800ad60:	2127      	movs	r1, #39	@ 0x27
 800ad62:	2004      	movs	r0, #4
 800ad64:	089b      	lsrs	r3, r3, #2
 800ad66:	4013      	ands	r3, r2
 800ad68:	5c72      	ldrb	r2, [r6, r1]
 800ad6a:	009b      	lsls	r3, r3, #2
 800ad6c:	4382      	bics	r2, r0
 800ad6e:	4313      	orrs	r3, r2
 800ad70:	5473      	strb	r3, [r6, r1]
 800ad72:	4648      	mov	r0, r9
 800ad74:	0029      	movs	r1, r5
 800ad76:	f00a f985 	bl	8015084 <fn_08015084>
 800ad7a:	1e05      	subs	r5, r0, #0
 800ad7c:	da00      	bge.n	800ad80 <fn_0800A964+0x41c>
 800ad7e:	e634      	b.n	800a9ea <fn_0800A964+0x86>
 800ad80:	465c      	mov	r4, fp
 800ad82:	6822      	ldr	r2, [r4, #0]
 800ad84:	4644      	mov	r4, r8
 800ad86:	0083      	lsls	r3, r0, #2
 800ad88:	5914      	ldr	r4, [r2, r4]
 800ad8a:	181b      	adds	r3, r3, r0
 800ad8c:	00db      	lsls	r3, r3, #3
 800ad8e:	18e4      	adds	r4, r4, r3
 800ad90:	0021      	movs	r1, r4
 800ad92:	2000      	movs	r0, #0
 800ad94:	f00a fb14 	bl	80153c0 <fn_080153C0>
 800ad98:	2701      	movs	r7, #1
 800ad9a:	2800      	cmp	r0, #0
 800ad9c:	d000      	beq.n	800ada0 <fn_0800A964+0x43c>
 800ad9e:	e5f2      	b.n	800a986 <fn_0800A964+0x22>
 800ada0:	2200      	movs	r2, #0
 800ada2:	2103      	movs	r1, #3
 800ada4:	302c      	adds	r0, #44	@ 0x2c
 800ada6:	f012 fc69 	bl	801d67c <fn_0801D67C>
 800adaa:	0006      	movs	r6, r0
 800adac:	222c      	movs	r2, #44	@ 0x2c
 800adae:	2100      	movs	r1, #0
 800adb0:	f015 fdee 	bl	8020990 <fn_08020990>
 800adb4:	0030      	movs	r0, r6
 800adb6:	f00d fbb1 	bl	801851c <fn_0801851C>
 800adba:	230c      	movs	r3, #12
 800adbc:	6126      	str	r6, [r4, #16]
 800adbe:	9a01      	ldr	r2, [sp, #4]
 800adc0:	81b3      	strh	r3, [r6, #12]
 800adc2:	2380      	movs	r3, #128	@ 0x80
 800adc4:	60b2      	str	r2, [r6, #8]
 800adc6:	22c0      	movs	r2, #192	@ 0xc0
 800adc8:	025b      	lsls	r3, r3, #9
 800adca:	62b3      	str	r3, [r6, #40]	@ 0x28
 800adcc:	6823      	ldr	r3, [r4, #0]
 800adce:	0352      	lsls	r2, r2, #13
 800add0:	189b      	adds	r3, r3, r2
 800add2:	6273      	str	r3, [r6, #36]	@ 0x24
 800add4:	465b      	mov	r3, fp
 800add6:	6819      	ldr	r1, [r3, #0]
 800add8:	464b      	mov	r3, r9
 800adda:	6134      	str	r4, [r6, #16]
 800addc:	6177      	str	r7, [r6, #20]
 800adde:	8a98      	ldrh	r0, [r3, #20]
 800ade0:	4e96      	ldr	r6, [pc, #600]	@ (800b03c <fn_0800A964+0x6d8>)
 800ade2:	0043      	lsls	r3, r0, #1
 800ade4:	598a      	ldr	r2, [r1, r6]
 800ade6:	181b      	adds	r3, r3, r0
 800ade8:	009b      	lsls	r3, r3, #2
 800adea:	18d3      	adds	r3, r2, r3
 800adec:	8958      	ldrh	r0, [r3, #10]
 800adee:	4643      	mov	r3, r8
 800adf0:	0082      	lsls	r2, r0, #2
 800adf2:	58cb      	ldr	r3, [r1, r3]
 800adf4:	1812      	adds	r2, r2, r0
 800adf6:	00d2      	lsls	r2, r2, #3
 800adf8:	189b      	adds	r3, r3, r2
 800adfa:	2224      	movs	r2, #36	@ 0x24
 800adfc:	3324      	adds	r3, #36	@ 0x24
 800adfe:	781b      	ldrb	r3, [r3, #0]
 800ae00:	54a3      	strb	r3, [r4, r2]
 800ae02:	4643      	mov	r3, r8
 800ae04:	58ca      	ldr	r2, [r1, r3]
 800ae06:	464b      	mov	r3, r9
 800ae08:	8a98      	ldrh	r0, [r3, #20]
 800ae0a:	0043      	lsls	r3, r0, #1
 800ae0c:	5989      	ldr	r1, [r1, r6]
 800ae0e:	181b      	adds	r3, r3, r0
 800ae10:	009b      	lsls	r3, r3, #2
 800ae12:	18cb      	adds	r3, r1, r3
 800ae14:	8958      	ldrh	r0, [r3, #10]
 800ae16:	0083      	lsls	r3, r0, #2
 800ae18:	181b      	adds	r3, r3, r0
 800ae1a:	00db      	lsls	r3, r3, #3
 800ae1c:	18d3      	adds	r3, r2, r3
 800ae1e:	2620      	movs	r6, #32
 800ae20:	5f9b      	ldrsh	r3, [r3, r6]
 800ae22:	8423      	strh	r3, [r4, #32]
 800ae24:	464b      	mov	r3, r9
 800ae26:	8a98      	ldrh	r0, [r3, #20]
 800ae28:	0043      	lsls	r3, r0, #1
 800ae2a:	181b      	adds	r3, r3, r0
 800ae2c:	009b      	lsls	r3, r3, #2
 800ae2e:	18c9      	adds	r1, r1, r3
 800ae30:	8949      	ldrh	r1, [r1, #10]
 800ae32:	008b      	lsls	r3, r1, #2
 800ae34:	185b      	adds	r3, r3, r1
 800ae36:	2127      	movs	r1, #39	@ 0x27
 800ae38:	2004      	movs	r0, #4
 800ae3a:	00db      	lsls	r3, r3, #3
 800ae3c:	18d2      	adds	r2, r2, r3
 800ae3e:	3227      	adds	r2, #39	@ 0x27
 800ae40:	7813      	ldrb	r3, [r2, #0]
 800ae42:	5c62      	ldrb	r2, [r4, r1]
 800ae44:	089b      	lsrs	r3, r3, #2
 800ae46:	403b      	ands	r3, r7
 800ae48:	009b      	lsls	r3, r3, #2
 800ae4a:	4382      	bics	r2, r0
 800ae4c:	4313      	orrs	r3, r2
 800ae4e:	5463      	strb	r3, [r4, r1]
 800ae50:	e599      	b.n	800a986 <fn_0800A964+0x22>
 800ae52:	2301      	movs	r3, #1
 800ae54:	6163      	str	r3, [r4, #20]
 800ae56:	2380      	movs	r3, #128	@ 0x80
 800ae58:	2280      	movs	r2, #128	@ 0x80
 800ae5a:	02db      	lsls	r3, r3, #11
 800ae5c:	62a3      	str	r3, [r4, #40]	@ 0x28
 800ae5e:	4698      	mov	r8, r3
 800ae60:	6833      	ldr	r3, [r6, #0]
 800ae62:	0392      	lsls	r2, r2, #14
 800ae64:	189b      	adds	r3, r3, r2
 800ae66:	0029      	movs	r1, r5
 800ae68:	4648      	mov	r0, r9
 800ae6a:	6126      	str	r6, [r4, #16]
 800ae6c:	6263      	str	r3, [r4, #36]	@ 0x24
 800ae6e:	f00a f909 	bl	8015084 <fn_08015084>
 800ae72:	1e05      	subs	r5, r0, #0
 800ae74:	da00      	bge.n	800ae78 <fn_0800A964+0x514>
 800ae76:	e5b8      	b.n	800a9ea <fn_0800A964+0x86>
 800ae78:	465b      	mov	r3, fp
 800ae7a:	22df      	movs	r2, #223	@ 0xdf
 800ae7c:	6819      	ldr	r1, [r3, #0]
 800ae7e:	0112      	lsls	r2, r2, #4
 800ae80:	0083      	lsls	r3, r0, #2
 800ae82:	588c      	ldr	r4, [r1, r2]
 800ae84:	181b      	adds	r3, r3, r0
 800ae86:	00db      	lsls	r3, r3, #3
 800ae88:	18e4      	adds	r4, r4, r3
 800ae8a:	0021      	movs	r1, r4
 800ae8c:	2000      	movs	r0, #0
 800ae8e:	f00a fa97 	bl	80153c0 <fn_080153C0>
 800ae92:	2701      	movs	r7, #1
 800ae94:	2800      	cmp	r0, #0
 800ae96:	d000      	beq.n	800ae9a <fn_0800A964+0x536>
 800ae98:	e575      	b.n	800a986 <fn_0800A964+0x22>
 800ae9a:	2200      	movs	r2, #0
 800ae9c:	2103      	movs	r1, #3
 800ae9e:	302c      	adds	r0, #44	@ 0x2c
 800aea0:	f012 fbec 	bl	801d67c <fn_0801D67C>
 800aea4:	0006      	movs	r6, r0
 800aea6:	222c      	movs	r2, #44	@ 0x2c
 800aea8:	2100      	movs	r1, #0
 800aeaa:	f015 fd71 	bl	8020990 <fn_08020990>
 800aeae:	0030      	movs	r0, r6
 800aeb0:	f00d fb34 	bl	801851c <fn_0801851C>
 800aeb4:	9b01      	ldr	r3, [sp, #4]
 800aeb6:	6126      	str	r6, [r4, #16]
 800aeb8:	60b3      	str	r3, [r6, #8]
 800aeba:	230b      	movs	r3, #11
 800aebc:	6177      	str	r7, [r6, #20]
 800aebe:	81b3      	strh	r3, [r6, #12]
 800aec0:	e070      	b.n	800afa4 <fn_0800A964+0x640>
 800aec2:	2301      	movs	r3, #1
 800aec4:	6163      	str	r3, [r4, #20]
 800aec6:	2380      	movs	r3, #128	@ 0x80
 800aec8:	22c0      	movs	r2, #192	@ 0xc0
 800aeca:	025b      	lsls	r3, r3, #9
 800aecc:	62a3      	str	r3, [r4, #40]	@ 0x28
 800aece:	4698      	mov	r8, r3
 800aed0:	6833      	ldr	r3, [r6, #0]
 800aed2:	0352      	lsls	r2, r2, #13
 800aed4:	189b      	adds	r3, r3, r2
 800aed6:	0029      	movs	r1, r5
 800aed8:	4648      	mov	r0, r9
 800aeda:	6126      	str	r6, [r4, #16]
 800aedc:	6263      	str	r3, [r4, #36]	@ 0x24
 800aede:	f00a f8d1 	bl	8015084 <fn_08015084>
 800aee2:	1e05      	subs	r5, r0, #0
 800aee4:	da00      	bge.n	800aee8 <fn_0800A964+0x584>
 800aee6:	e580      	b.n	800a9ea <fn_0800A964+0x86>
 800aee8:	465b      	mov	r3, fp
 800aeea:	22df      	movs	r2, #223	@ 0xdf
 800aeec:	6819      	ldr	r1, [r3, #0]
 800aeee:	0112      	lsls	r2, r2, #4
 800aef0:	0083      	lsls	r3, r0, #2
 800aef2:	588c      	ldr	r4, [r1, r2]
 800aef4:	181b      	adds	r3, r3, r0
 800aef6:	00db      	lsls	r3, r3, #3
 800aef8:	18e4      	adds	r4, r4, r3
 800aefa:	0021      	movs	r1, r4
 800aefc:	2000      	movs	r0, #0
 800aefe:	f00a fa5f 	bl	80153c0 <fn_080153C0>
 800af02:	2701      	movs	r7, #1
 800af04:	2800      	cmp	r0, #0
 800af06:	d000      	beq.n	800af0a <fn_0800A964+0x5a6>
 800af08:	e53d      	b.n	800a986 <fn_0800A964+0x22>
 800af0a:	2200      	movs	r2, #0
 800af0c:	2103      	movs	r1, #3
 800af0e:	302c      	adds	r0, #44	@ 0x2c
 800af10:	f012 fbb4 	bl	801d67c <fn_0801D67C>
 800af14:	0006      	movs	r6, r0
 800af16:	222c      	movs	r2, #44	@ 0x2c
 800af18:	2100      	movs	r1, #0
 800af1a:	f015 fd39 	bl	8020990 <fn_08020990>
 800af1e:	0030      	movs	r0, r6
 800af20:	f00d fafc 	bl	801851c <fn_0801851C>
 800af24:	9b01      	ldr	r3, [sp, #4]
 800af26:	6126      	str	r6, [r4, #16]
 800af28:	60b3      	str	r3, [r6, #8]
 800af2a:	230a      	movs	r3, #10
 800af2c:	6177      	str	r7, [r6, #20]
 800af2e:	81b3      	strh	r3, [r6, #12]
 800af30:	e07a      	b.n	800b028 <fn_0800A964+0x6c4>
 800af32:	2280      	movs	r2, #128	@ 0x80
 800af34:	2301      	movs	r3, #1
 800af36:	02d2      	lsls	r2, r2, #11
 800af38:	62a2      	str	r2, [r4, #40]	@ 0x28
 800af3a:	4690      	mov	r8, r2
 800af3c:	2280      	movs	r2, #128	@ 0x80
 800af3e:	425b      	negs	r3, r3
 800af40:	6163      	str	r3, [r4, #20]
 800af42:	6833      	ldr	r3, [r6, #0]
 800af44:	0392      	lsls	r2, r2, #14
 800af46:	189b      	adds	r3, r3, r2
 800af48:	0029      	movs	r1, r5
 800af4a:	4648      	mov	r0, r9
 800af4c:	6126      	str	r6, [r4, #16]
 800af4e:	6263      	str	r3, [r4, #36]	@ 0x24
 800af50:	f00a f898 	bl	8015084 <fn_08015084>
 800af54:	1e05      	subs	r5, r0, #0
 800af56:	da00      	bge.n	800af5a <fn_0800A964+0x5f6>
 800af58:	e547      	b.n	800a9ea <fn_0800A964+0x86>
 800af5a:	465a      	mov	r2, fp
 800af5c:	6811      	ldr	r1, [r2, #0]
 800af5e:	22df      	movs	r2, #223	@ 0xdf
 800af60:	0083      	lsls	r3, r0, #2
 800af62:	0112      	lsls	r2, r2, #4
 800af64:	588c      	ldr	r4, [r1, r2]
 800af66:	181b      	adds	r3, r3, r0
 800af68:	00db      	lsls	r3, r3, #3
 800af6a:	18e4      	adds	r4, r4, r3
 800af6c:	0021      	movs	r1, r4
 800af6e:	2000      	movs	r0, #0
 800af70:	f00a fa26 	bl	80153c0 <fn_080153C0>
 800af74:	2701      	movs	r7, #1
 800af76:	2800      	cmp	r0, #0
 800af78:	d000      	beq.n	800af7c <fn_0800A964+0x618>
 800af7a:	e504      	b.n	800a986 <fn_0800A964+0x22>
 800af7c:	2200      	movs	r2, #0
 800af7e:	2103      	movs	r1, #3
 800af80:	302c      	adds	r0, #44	@ 0x2c
 800af82:	f012 fb7b 	bl	801d67c <fn_0801D67C>
 800af86:	0006      	movs	r6, r0
 800af88:	222c      	movs	r2, #44	@ 0x2c
 800af8a:	2100      	movs	r1, #0
 800af8c:	f015 fd00 	bl	8020990 <fn_08020990>
 800af90:	0030      	movs	r0, r6
 800af92:	f00d fac3 	bl	801851c <fn_0801851C>
 800af96:	2307      	movs	r3, #7
 800af98:	9a01      	ldr	r2, [sp, #4]
 800af9a:	6126      	str	r6, [r4, #16]
 800af9c:	81b3      	strh	r3, [r6, #12]
 800af9e:	3b08      	subs	r3, #8
 800afa0:	60b2      	str	r2, [r6, #8]
 800afa2:	6173      	str	r3, [r6, #20]
 800afa4:	4643      	mov	r3, r8
 800afa6:	2280      	movs	r2, #128	@ 0x80
 800afa8:	62b3      	str	r3, [r6, #40]	@ 0x28
 800afaa:	6823      	ldr	r3, [r4, #0]
 800afac:	0392      	lsls	r2, r2, #14
 800afae:	189b      	adds	r3, r3, r2
 800afb0:	6134      	str	r4, [r6, #16]
 800afb2:	6273      	str	r3, [r6, #36]	@ 0x24
 800afb4:	e4e7      	b.n	800a986 <fn_0800A964+0x22>
 800afb6:	2280      	movs	r2, #128	@ 0x80
 800afb8:	2301      	movs	r3, #1
 800afba:	0252      	lsls	r2, r2, #9
 800afbc:	62a2      	str	r2, [r4, #40]	@ 0x28
 800afbe:	4690      	mov	r8, r2
 800afc0:	22c0      	movs	r2, #192	@ 0xc0
 800afc2:	425b      	negs	r3, r3
 800afc4:	6163      	str	r3, [r4, #20]
 800afc6:	6833      	ldr	r3, [r6, #0]
 800afc8:	0352      	lsls	r2, r2, #13
 800afca:	189b      	adds	r3, r3, r2
 800afcc:	0029      	movs	r1, r5
 800afce:	4648      	mov	r0, r9
 800afd0:	6126      	str	r6, [r4, #16]
 800afd2:	6263      	str	r3, [r4, #36]	@ 0x24
 800afd4:	f00a f856 	bl	8015084 <fn_08015084>
 800afd8:	1e05      	subs	r5, r0, #0
 800afda:	da00      	bge.n	800afde <fn_0800A964+0x67a>
 800afdc:	e505      	b.n	800a9ea <fn_0800A964+0x86>
 800afde:	465a      	mov	r2, fp
 800afe0:	6811      	ldr	r1, [r2, #0]
 800afe2:	22df      	movs	r2, #223	@ 0xdf
 800afe4:	0083      	lsls	r3, r0, #2
 800afe6:	0112      	lsls	r2, r2, #4
 800afe8:	588c      	ldr	r4, [r1, r2]
 800afea:	181b      	adds	r3, r3, r0
 800afec:	00db      	lsls	r3, r3, #3
 800afee:	18e4      	adds	r4, r4, r3
 800aff0:	0021      	movs	r1, r4
 800aff2:	2000      	movs	r0, #0
 800aff4:	f00a f9e4 	bl	80153c0 <fn_080153C0>
 800aff8:	2701      	movs	r7, #1
 800affa:	2800      	cmp	r0, #0
 800affc:	d000      	beq.n	800b000 <fn_0800A964+0x69c>
 800affe:	e4c2      	b.n	800a986 <fn_0800A964+0x22>
 800b000:	2200      	movs	r2, #0
 800b002:	2103      	movs	r1, #3
 800b004:	302c      	adds	r0, #44	@ 0x2c
 800b006:	f012 fb39 	bl	801d67c <fn_0801D67C>
 800b00a:	0006      	movs	r6, r0
 800b00c:	222c      	movs	r2, #44	@ 0x2c
 800b00e:	2100      	movs	r1, #0
 800b010:	f015 fcbe 	bl	8020990 <fn_08020990>
 800b014:	0030      	movs	r0, r6
 800b016:	f00d fa81 	bl	801851c <fn_0801851C>
 800b01a:	2306      	movs	r3, #6
 800b01c:	9a01      	ldr	r2, [sp, #4]
 800b01e:	6126      	str	r6, [r4, #16]
 800b020:	81b3      	strh	r3, [r6, #12]
 800b022:	3b07      	subs	r3, #7
 800b024:	60b2      	str	r2, [r6, #8]
 800b026:	6173      	str	r3, [r6, #20]
 800b028:	4643      	mov	r3, r8
 800b02a:	22c0      	movs	r2, #192	@ 0xc0
 800b02c:	62b3      	str	r3, [r6, #40]	@ 0x28
 800b02e:	6823      	ldr	r3, [r4, #0]
 800b030:	0352      	lsls	r2, r2, #13
 800b032:	189b      	adds	r3, r3, r2
 800b034:	6134      	str	r4, [r6, #16]
 800b036:	6273      	str	r3, [r6, #36]	@ 0x24
 800b038:	e4a5      	b.n	800a986 <fn_0800A964+0x22>
 800b03a:	46c0      	nop			@ (mov r8, r8)
 800b03c:	00000e0c 	.word	0x00000e0c
 800b040:	2301      	movs	r3, #1
 800b042:	2280      	movs	r2, #128	@ 0x80
 800b044:	425b      	negs	r3, r3
 800b046:	0252      	lsls	r2, r2, #9
 800b048:	6163      	str	r3, [r4, #20]
 800b04a:	62a2      	str	r2, [r4, #40]	@ 0x28
 800b04c:	6831      	ldr	r1, [r6, #0]
 800b04e:	0030      	movs	r0, r6
 800b050:	6126      	str	r6, [r4, #16]
 800b052:	4690      	mov	r8, r2
 800b054:	f009 fc0e 	bl	8014874 <fn_08014874>
 800b058:	0029      	movs	r1, r5
 800b05a:	6260      	str	r0, [r4, #36]	@ 0x24
 800b05c:	4648      	mov	r0, r9
 800b05e:	f00a f811 	bl	8015084 <fn_08015084>
 800b062:	1e05      	subs	r5, r0, #0
 800b064:	da00      	bge.n	800b068 <fn_0800A964+0x704>
 800b066:	e4c0      	b.n	800a9ea <fn_0800A964+0x86>
 800b068:	465a      	mov	r2, fp
 800b06a:	6811      	ldr	r1, [r2, #0]
 800b06c:	22df      	movs	r2, #223	@ 0xdf
 800b06e:	0083      	lsls	r3, r0, #2
 800b070:	0112      	lsls	r2, r2, #4
 800b072:	588c      	ldr	r4, [r1, r2]
 800b074:	181b      	adds	r3, r3, r0
 800b076:	00db      	lsls	r3, r3, #3
 800b078:	18e4      	adds	r4, r4, r3
 800b07a:	0021      	movs	r1, r4
 800b07c:	2000      	movs	r0, #0
 800b07e:	f00a f99f 	bl	80153c0 <fn_080153C0>
 800b082:	2701      	movs	r7, #1
 800b084:	2800      	cmp	r0, #0
 800b086:	d000      	beq.n	800b08a <fn_0800A964+0x726>
 800b088:	e47d      	b.n	800a986 <fn_0800A964+0x22>
 800b08a:	2200      	movs	r2, #0
 800b08c:	2103      	movs	r1, #3
 800b08e:	302c      	adds	r0, #44	@ 0x2c
 800b090:	f012 faf4 	bl	801d67c <fn_0801D67C>
 800b094:	0006      	movs	r6, r0
 800b096:	222c      	movs	r2, #44	@ 0x2c
 800b098:	2100      	movs	r1, #0
 800b09a:	f015 fc79 	bl	8020990 <fn_08020990>
 800b09e:	0030      	movs	r0, r6
 800b0a0:	f00d fa3c 	bl	801851c <fn_0801851C>
 800b0a4:	2305      	movs	r3, #5
 800b0a6:	6126      	str	r6, [r4, #16]
 800b0a8:	81b3      	strh	r3, [r6, #12]
 800b0aa:	3b06      	subs	r3, #6
 800b0ac:	6173      	str	r3, [r6, #20]
 800b0ae:	4643      	mov	r3, r8
 800b0b0:	9a01      	ldr	r2, [sp, #4]
 800b0b2:	0020      	movs	r0, r4
 800b0b4:	60b2      	str	r2, [r6, #8]
 800b0b6:	6134      	str	r4, [r6, #16]
 800b0b8:	62b3      	str	r3, [r6, #40]	@ 0x28
 800b0ba:	6821      	ldr	r1, [r4, #0]
 800b0bc:	f009 fbda 	bl	8014874 <fn_08014874>
 800b0c0:	6270      	str	r0, [r6, #36]	@ 0x24
 800b0c2:	e460      	b.n	800a986 <fn_0800A964+0x22>
 800b0c4:	2301      	movs	r3, #1
 800b0c6:	6163      	str	r3, [r4, #20]
 800b0c8:	2380      	movs	r3, #128	@ 0x80
 800b0ca:	025b      	lsls	r3, r3, #9
 800b0cc:	62a3      	str	r3, [r4, #40]	@ 0x28
 800b0ce:	6831      	ldr	r1, [r6, #0]
 800b0d0:	0030      	movs	r0, r6
 800b0d2:	6126      	str	r6, [r4, #16]
 800b0d4:	4698      	mov	r8, r3
 800b0d6:	f009 fb3d 	bl	8014754 <fn_08014754>
 800b0da:	0029      	movs	r1, r5
 800b0dc:	6260      	str	r0, [r4, #36]	@ 0x24
 800b0de:	4648      	mov	r0, r9
 800b0e0:	f009 ffd0 	bl	8015084 <fn_08015084>
 800b0e4:	1e05      	subs	r5, r0, #0
 800b0e6:	da00      	bge.n	800b0ea <fn_0800A964+0x786>
 800b0e8:	e47f      	b.n	800a9ea <fn_0800A964+0x86>
 800b0ea:	465b      	mov	r3, fp
 800b0ec:	22df      	movs	r2, #223	@ 0xdf
 800b0ee:	6819      	ldr	r1, [r3, #0]
 800b0f0:	0112      	lsls	r2, r2, #4
 800b0f2:	0083      	lsls	r3, r0, #2
 800b0f4:	588c      	ldr	r4, [r1, r2]
 800b0f6:	181b      	adds	r3, r3, r0
 800b0f8:	00db      	lsls	r3, r3, #3
 800b0fa:	18e4      	adds	r4, r4, r3
 800b0fc:	0021      	movs	r1, r4
 800b0fe:	2000      	movs	r0, #0
 800b100:	f00a f95e 	bl	80153c0 <fn_080153C0>
 800b104:	2701      	movs	r7, #1
 800b106:	2800      	cmp	r0, #0
 800b108:	d000      	beq.n	800b10c <fn_0800A964+0x7a8>
 800b10a:	e43c      	b.n	800a986 <fn_0800A964+0x22>
 800b10c:	2200      	movs	r2, #0
 800b10e:	2103      	movs	r1, #3
 800b110:	302c      	adds	r0, #44	@ 0x2c
 800b112:	f012 fab3 	bl	801d67c <fn_0801D67C>
 800b116:	0006      	movs	r6, r0
 800b118:	222c      	movs	r2, #44	@ 0x2c
 800b11a:	2100      	movs	r1, #0
 800b11c:	f015 fc38 	bl	8020990 <fn_08020990>
 800b120:	0030      	movs	r0, r6
 800b122:	f00d f9fb 	bl	801851c <fn_0801851C>
 800b126:	9b01      	ldr	r3, [sp, #4]
 800b128:	6126      	str	r6, [r4, #16]
 800b12a:	60b3      	str	r3, [r6, #8]
 800b12c:	2304      	movs	r3, #4
 800b12e:	81b3      	strh	r3, [r6, #12]
 800b130:	4643      	mov	r3, r8
 800b132:	6177      	str	r7, [r6, #20]
 800b134:	62b3      	str	r3, [r6, #40]	@ 0x28
 800b136:	0020      	movs	r0, r4
 800b138:	6134      	str	r4, [r6, #16]
 800b13a:	6821      	ldr	r1, [r4, #0]
 800b13c:	f009 fb0a 	bl	8014754 <fn_08014754>
 800b140:	6270      	str	r0, [r6, #36]	@ 0x24
 800b142:	f7ff fc20 	bl	800a986 <fn_0800A964+0x22>
 800b146:	0029      	movs	r1, r5
 800b148:	6260      	str	r0, [r4, #36]	@ 0x24
 800b14a:	4648      	mov	r0, r9
 800b14c:	f009 ff9a 	bl	8015084 <fn_08015084>
 800b150:	1e05      	subs	r5, r0, #0
 800b152:	da00      	bge.n	800b156 <fn_0800A964+0x7f2>
 800b154:	e449      	b.n	800a9ea <fn_0800A964+0x86>
 800b156:	22df      	movs	r2, #223	@ 0xdf
 800b158:	6839      	ldr	r1, [r7, #0]
 800b15a:	0083      	lsls	r3, r0, #2
 800b15c:	0112      	lsls	r2, r2, #4
 800b15e:	588e      	ldr	r6, [r1, r2]
 800b160:	181b      	adds	r3, r3, r0
 800b162:	00db      	lsls	r3, r3, #3
 800b164:	18f6      	adds	r6, r6, r3
 800b166:	0031      	movs	r1, r6
 800b168:	2000      	movs	r0, #0
 800b16a:	f00a f929 	bl	80153c0 <fn_080153C0>
 800b16e:	2800      	cmp	r0, #0
 800b170:	d100      	bne.n	800b174 <fn_0800A964+0x810>
 800b172:	e11d      	b.n	800b3b0 <fn_0800A964+0xa4c>
 800b174:	2701      	movs	r7, #1
 800b176:	f7ff fc06 	bl	800a986 <fn_0800A964+0x22>
 800b17a:	001c      	movs	r4, r3
 800b17c:	e488      	b.n	800aa90 <fn_0800A964+0x12c>
 800b17e:	2380      	movs	r3, #128	@ 0x80
 800b180:	02db      	lsls	r3, r3, #11
 800b182:	4698      	mov	r8, r3
 800b184:	465f      	mov	r7, fp
 800b186:	2301      	movs	r3, #1
 800b188:	425b      	negs	r3, r3
 800b18a:	6163      	str	r3, [r4, #20]
 800b18c:	4643      	mov	r3, r8
 800b18e:	0030      	movs	r0, r6
 800b190:	62a3      	str	r3, [r4, #40]	@ 0x28
 800b192:	6126      	str	r6, [r4, #16]
 800b194:	f009 fa8a 	bl	80146ac <fn_080146AC>
 800b198:	6833      	ldr	r3, [r6, #0]
 800b19a:	4298      	cmp	r0, r3
 800b19c:	d0d3      	beq.n	800b146 <fn_0800A964+0x7e2>
 800b19e:	2380      	movs	r3, #128	@ 0x80
 800b1a0:	031b      	lsls	r3, r3, #12
 800b1a2:	18c0      	adds	r0, r0, r3
 800b1a4:	0029      	movs	r1, r5
 800b1a6:	6260      	str	r0, [r4, #36]	@ 0x24
 800b1a8:	4648      	mov	r0, r9
 800b1aa:	f009 ff6b 	bl	8015084 <fn_08015084>
 800b1ae:	1e05      	subs	r5, r0, #0
 800b1b0:	da01      	bge.n	800b1b6 <fn_0800A964+0x852>
 800b1b2:	f7ff fc1a 	bl	800a9ea <fn_0800A964+0x86>
 800b1b6:	22df      	movs	r2, #223	@ 0xdf
 800b1b8:	6839      	ldr	r1, [r7, #0]
 800b1ba:	0083      	lsls	r3, r0, #2
 800b1bc:	0112      	lsls	r2, r2, #4
 800b1be:	588c      	ldr	r4, [r1, r2]
 800b1c0:	181b      	adds	r3, r3, r0
 800b1c2:	00db      	lsls	r3, r3, #3
 800b1c4:	18e4      	adds	r4, r4, r3
 800b1c6:	0021      	movs	r1, r4
 800b1c8:	2000      	movs	r0, #0
 800b1ca:	f00a f8f9 	bl	80153c0 <fn_080153C0>
 800b1ce:	2701      	movs	r7, #1
 800b1d0:	2800      	cmp	r0, #0
 800b1d2:	d001      	beq.n	800b1d8 <fn_0800A964+0x874>
 800b1d4:	f7ff fbd7 	bl	800a986 <fn_0800A964+0x22>
 800b1d8:	2200      	movs	r2, #0
 800b1da:	2103      	movs	r1, #3
 800b1dc:	302c      	adds	r0, #44	@ 0x2c
 800b1de:	f012 fa4d 	bl	801d67c <fn_0801D67C>
 800b1e2:	0006      	movs	r6, r0
 800b1e4:	222c      	movs	r2, #44	@ 0x2c
 800b1e6:	2100      	movs	r1, #0
 800b1e8:	f015 fbd2 	bl	8020990 <fn_08020990>
 800b1ec:	0030      	movs	r0, r6
 800b1ee:	f00d f995 	bl	801851c <fn_0801851C>
 800b1f2:	9b01      	ldr	r3, [sp, #4]
 800b1f4:	6126      	str	r6, [r4, #16]
 800b1f6:	60b3      	str	r3, [r6, #8]
 800b1f8:	2302      	movs	r3, #2
 800b1fa:	81b3      	strh	r3, [r6, #12]
 800b1fc:	3b03      	subs	r3, #3
 800b1fe:	6173      	str	r3, [r6, #20]
 800b200:	4643      	mov	r3, r8
 800b202:	0020      	movs	r0, r4
 800b204:	62b3      	str	r3, [r6, #40]	@ 0x28
 800b206:	6134      	str	r4, [r6, #16]
 800b208:	f009 fa50 	bl	80146ac <fn_080146AC>
 800b20c:	6823      	ldr	r3, [r4, #0]
 800b20e:	4298      	cmp	r0, r3
 800b210:	d096      	beq.n	800b140 <fn_0800A964+0x7dc>
 800b212:	2380      	movs	r3, #128	@ 0x80
 800b214:	031b      	lsls	r3, r3, #12
 800b216:	18c0      	adds	r0, r0, r3
 800b218:	6270      	str	r0, [r6, #36]	@ 0x24
 800b21a:	f7ff fbb4 	bl	800a986 <fn_0800A964+0x22>
 800b21e:	465f      	mov	r7, fp
 800b220:	2301      	movs	r3, #1
 800b222:	425b      	negs	r3, r3
 800b224:	6163      	str	r3, [r4, #20]
 800b226:	2380      	movs	r3, #128	@ 0x80
 800b228:	025b      	lsls	r3, r3, #9
 800b22a:	62a3      	str	r3, [r4, #40]	@ 0x28
 800b22c:	0030      	movs	r0, r6
 800b22e:	6126      	str	r6, [r4, #16]
 800b230:	f009 f9ec 	bl	801460c <fn_0801460C>
 800b234:	2324      	movs	r3, #36	@ 0x24
 800b236:	6260      	str	r0, [r4, #36]	@ 0x24
 800b238:	5cf3      	ldrb	r3, [r6, r3]
 800b23a:	8423      	strh	r3, [r4, #32]
 800b23c:	2220      	movs	r2, #32
 800b23e:	5eb3      	ldrsh	r3, [r6, r2]
 800b240:	2227      	movs	r2, #39	@ 0x27
 800b242:	21df      	movs	r1, #223	@ 0xdf
 800b244:	61a3      	str	r3, [r4, #24]
 800b246:	5cb3      	ldrb	r3, [r6, r2]
 800b248:	075b      	lsls	r3, r3, #29
 800b24a:	0fdb      	lsrs	r3, r3, #31
 800b24c:	61e3      	str	r3, [r4, #28]
 800b24e:	683b      	ldr	r3, [r7, #0]
 800b250:	0109      	lsls	r1, r1, #4
 800b252:	585a      	ldr	r2, [r3, r1]
 800b254:	1ab2      	subs	r2, r6, r2
 800b256:	10d2      	asrs	r2, r2, #3
 800b258:	0053      	lsls	r3, r2, #1
 800b25a:	189b      	adds	r3, r3, r2
 800b25c:	4688      	mov	r8, r1
 800b25e:	0119      	lsls	r1, r3, #4
 800b260:	185b      	adds	r3, r3, r1
 800b262:	0219      	lsls	r1, r3, #8
 800b264:	185b      	adds	r3, r3, r1
 800b266:	0419      	lsls	r1, r3, #16
 800b268:	1859      	adds	r1, r3, r1
 800b26a:	0089      	lsls	r1, r1, #2
 800b26c:	1889      	adds	r1, r1, r2
 800b26e:	f009 fe3d 	bl	8014eec <fn_08014EEC>
 800b272:	2800      	cmp	r0, #0
 800b274:	d039      	beq.n	800b2ea <fn_0800A964+0x986>
 800b276:	2324      	movs	r3, #36	@ 0x24
 800b278:	2227      	movs	r2, #39	@ 0x27
 800b27a:	5cc3      	ldrb	r3, [r0, r3]
 800b27c:	8423      	strh	r3, [r4, #32]
 800b27e:	2120      	movs	r1, #32
 800b280:	5e43      	ldrsh	r3, [r0, r1]
 800b282:	61a3      	str	r3, [r4, #24]
 800b284:	5c83      	ldrb	r3, [r0, r2]
 800b286:	075b      	lsls	r3, r3, #29
 800b288:	0fdb      	lsrs	r3, r3, #31
 800b28a:	0029      	movs	r1, r5
 800b28c:	4648      	mov	r0, r9
 800b28e:	61e3      	str	r3, [r4, #28]
 800b290:	f009 fef8 	bl	8015084 <fn_08015084>
 800b294:	1e05      	subs	r5, r0, #0
 800b296:	da01      	bge.n	800b29c <fn_0800A964+0x938>
 800b298:	f7ff fba7 	bl	800a9ea <fn_0800A964+0x86>
 800b29c:	4641      	mov	r1, r8
 800b29e:	683a      	ldr	r2, [r7, #0]
 800b2a0:	0083      	lsls	r3, r0, #2
 800b2a2:	5856      	ldr	r6, [r2, r1]
 800b2a4:	181b      	adds	r3, r3, r0
 800b2a6:	00db      	lsls	r3, r3, #3
 800b2a8:	18f6      	adds	r6, r6, r3
 800b2aa:	0031      	movs	r1, r6
 800b2ac:	2000      	movs	r0, #0
 800b2ae:	f00a f887 	bl	80153c0 <fn_080153C0>
 800b2b2:	2800      	cmp	r0, #0
 800b2b4:	d000      	beq.n	800b2b8 <fn_0800A964+0x954>
 800b2b6:	e75d      	b.n	800b174 <fn_0800A964+0x810>
 800b2b8:	2200      	movs	r2, #0
 800b2ba:	2103      	movs	r1, #3
 800b2bc:	302c      	adds	r0, #44	@ 0x2c
 800b2be:	f012 f9dd 	bl	801d67c <fn_0801D67C>
 800b2c2:	0004      	movs	r4, r0
 800b2c4:	222c      	movs	r2, #44	@ 0x2c
 800b2c6:	2100      	movs	r1, #0
 800b2c8:	f015 fb62 	bl	8020990 <fn_08020990>
 800b2cc:	0020      	movs	r0, r4
 800b2ce:	f00d f925 	bl	801851c <fn_0801851C>
 800b2d2:	9b01      	ldr	r3, [sp, #4]
 800b2d4:	6134      	str	r4, [r6, #16]
 800b2d6:	60a3      	str	r3, [r4, #8]
 800b2d8:	2309      	movs	r3, #9
 800b2da:	81a3      	strh	r3, [r4, #12]
 800b2dc:	e7a0      	b.n	800b220 <fn_0800A964+0x8bc>
 800b2de:	0013      	movs	r3, r2
 800b2e0:	041b      	lsls	r3, r3, #16
 800b2e2:	2701      	movs	r7, #1
 800b2e4:	6263      	str	r3, [r4, #36]	@ 0x24
 800b2e6:	f7ff fb4e 	bl	800a986 <fn_0800A964+0x22>
 800b2ea:	0029      	movs	r1, r5
 800b2ec:	4648      	mov	r0, r9
 800b2ee:	f009 fec9 	bl	8015084 <fn_08015084>
 800b2f2:	46bb      	mov	fp, r7
 800b2f4:	1e05      	subs	r5, r0, #0
 800b2f6:	da01      	bge.n	800b2fc <fn_0800A964+0x998>
 800b2f8:	f7ff fb77 	bl	800a9ea <fn_0800A964+0x86>
 800b2fc:	4641      	mov	r1, r8
 800b2fe:	683a      	ldr	r2, [r7, #0]
 800b300:	0083      	lsls	r3, r0, #2
 800b302:	5856      	ldr	r6, [r2, r1]
 800b304:	181b      	adds	r3, r3, r0
 800b306:	00db      	lsls	r3, r3, #3
 800b308:	18f6      	adds	r6, r6, r3
 800b30a:	0031      	movs	r1, r6
 800b30c:	2000      	movs	r0, #0
 800b30e:	f00a f857 	bl	80153c0 <fn_080153C0>
 800b312:	2701      	movs	r7, #1
 800b314:	2800      	cmp	r0, #0
 800b316:	d001      	beq.n	800b31c <fn_0800A964+0x9b8>
 800b318:	f7ff fb35 	bl	800a986 <fn_0800A964+0x22>
 800b31c:	2200      	movs	r2, #0
 800b31e:	2103      	movs	r1, #3
 800b320:	302c      	adds	r0, #44	@ 0x2c
 800b322:	f012 f9ab 	bl	801d67c <fn_0801D67C>
 800b326:	0004      	movs	r4, r0
 800b328:	222c      	movs	r2, #44	@ 0x2c
 800b32a:	2100      	movs	r1, #0
 800b32c:	f015 fb30 	bl	8020990 <fn_08020990>
 800b330:	0020      	movs	r0, r4
 800b332:	f00d f8f3 	bl	801851c <fn_0801851C>
 800b336:	9b01      	ldr	r3, [sp, #4]
 800b338:	6134      	str	r4, [r6, #16]
 800b33a:	60a3      	str	r3, [r4, #8]
 800b33c:	2309      	movs	r3, #9
 800b33e:	81a3      	strh	r3, [r4, #12]
 800b340:	3b0a      	subs	r3, #10
 800b342:	6163      	str	r3, [r4, #20]
 800b344:	2380      	movs	r3, #128	@ 0x80
 800b346:	025b      	lsls	r3, r3, #9
 800b348:	0030      	movs	r0, r6
 800b34a:	6126      	str	r6, [r4, #16]
 800b34c:	62a3      	str	r3, [r4, #40]	@ 0x28
 800b34e:	f009 f95d 	bl	801460c <fn_0801460C>
 800b352:	2324      	movs	r3, #36	@ 0x24
 800b354:	6260      	str	r0, [r4, #36]	@ 0x24
 800b356:	5cf3      	ldrb	r3, [r6, r3]
 800b358:	8423      	strh	r3, [r4, #32]
 800b35a:	2220      	movs	r2, #32
 800b35c:	5eb3      	ldrsh	r3, [r6, r2]
 800b35e:	2227      	movs	r2, #39	@ 0x27
 800b360:	4659      	mov	r1, fp
 800b362:	61a3      	str	r3, [r4, #24]
 800b364:	5cb3      	ldrb	r3, [r6, r2]
 800b366:	075b      	lsls	r3, r3, #29
 800b368:	0fdb      	lsrs	r3, r3, #31
 800b36a:	61e3      	str	r3, [r4, #28]
 800b36c:	680b      	ldr	r3, [r1, #0]
 800b36e:	4641      	mov	r1, r8
 800b370:	585b      	ldr	r3, [r3, r1]
 800b372:	1af6      	subs	r6, r6, r3
 800b374:	10f6      	asrs	r6, r6, #3
 800b376:	0073      	lsls	r3, r6, #1
 800b378:	199b      	adds	r3, r3, r6
 800b37a:	011a      	lsls	r2, r3, #4
 800b37c:	189b      	adds	r3, r3, r2
 800b37e:	021a      	lsls	r2, r3, #8
 800b380:	189b      	adds	r3, r3, r2
 800b382:	0419      	lsls	r1, r3, #16
 800b384:	1859      	adds	r1, r3, r1
 800b386:	0089      	lsls	r1, r1, #2
 800b388:	1989      	adds	r1, r1, r6
 800b38a:	f009 fdaf 	bl	8014eec <fn_08014EEC>
 800b38e:	2800      	cmp	r0, #0
 800b390:	d101      	bne.n	800b396 <fn_0800A964+0xa32>
 800b392:	f7ff faf8 	bl	800a986 <fn_0800A964+0x22>
 800b396:	2324      	movs	r3, #36	@ 0x24
 800b398:	2227      	movs	r2, #39	@ 0x27
 800b39a:	5cc3      	ldrb	r3, [r0, r3]
 800b39c:	8423      	strh	r3, [r4, #32]
 800b39e:	2120      	movs	r1, #32
 800b3a0:	5e43      	ldrsh	r3, [r0, r1]
 800b3a2:	61a3      	str	r3, [r4, #24]
 800b3a4:	5c83      	ldrb	r3, [r0, r2]
 800b3a6:	075b      	lsls	r3, r3, #29
 800b3a8:	0fdb      	lsrs	r3, r3, #31
 800b3aa:	61e3      	str	r3, [r4, #28]
 800b3ac:	f7ff faeb 	bl	800a986 <fn_0800A964+0x22>
 800b3b0:	2200      	movs	r2, #0
 800b3b2:	2103      	movs	r1, #3
 800b3b4:	302c      	adds	r0, #44	@ 0x2c
 800b3b6:	f012 f961 	bl	801d67c <fn_0801D67C>
 800b3ba:	0004      	movs	r4, r0
 800b3bc:	222c      	movs	r2, #44	@ 0x2c
 800b3be:	2100      	movs	r1, #0
 800b3c0:	f015 fae6 	bl	8020990 <fn_08020990>
 800b3c4:	0020      	movs	r0, r4
 800b3c6:	f00d f8a9 	bl	801851c <fn_0801851C>
 800b3ca:	9b01      	ldr	r3, [sp, #4]
 800b3cc:	6134      	str	r4, [r6, #16]
 800b3ce:	60a3      	str	r3, [r4, #8]
 800b3d0:	2302      	movs	r3, #2
 800b3d2:	81a3      	strh	r3, [r4, #12]
 800b3d4:	e6d7      	b.n	800b186 <fn_0800A964+0x822>
 800b3d6:	23fa      	movs	r3, #250	@ 0xfa
 800b3d8:	01db      	lsls	r3, r3, #7
 800b3da:	f7ff fb73 	bl	800aac4 <fn_0800A964+0x160>
 800b3de:	46c0      	nop			@ (mov r8, r8)
