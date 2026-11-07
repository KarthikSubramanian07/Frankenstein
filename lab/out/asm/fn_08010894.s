fn_08010894:
 8010894:	b5f0      	push	{r4, r5, r6, r7, lr}
 8010896:	46de      	mov	lr, fp
 8010898:	4657      	mov	r7, sl
 801089a:	464e      	mov	r6, r9
 801089c:	4645      	mov	r5, r8
 801089e:	b5e0      	push	{r5, r6, r7, lr}
 80108a0:	4cca      	ldr	r4, [pc, #808]	@ (8010bcc <fn_08010894+0x338>)
 80108a2:	4ecb      	ldr	r6, [pc, #812]	@ (8010bd0 <fn_08010894+0x33c>)
 80108a4:	46a3      	mov	fp, r4
 80108a6:	6824      	ldr	r4, [r4, #0]
 80108a8:	5ba5      	ldrh	r5, [r4, r6]
 80108aa:	3501      	adds	r5, #1
 80108ac:	b091      	sub	sp, #68	@ 0x44
 80108ae:	53a5      	strh	r5, [r4, r6]
 80108b0:	4dc8      	ldr	r5, [pc, #800]	@ (8010bd4 <fn_08010894+0x340>)
 80108b2:	1966      	adds	r6, r4, r5
 80108b4:	4dc8      	ldr	r5, [pc, #800]	@ (8010bd8 <fn_08010894+0x344>)
 80108b6:	5166      	str	r6, [r4, r5]
 80108b8:	4dc8      	ldr	r5, [pc, #800]	@ (8010bdc <fn_08010894+0x348>)
 80108ba:	5965      	ldr	r5, [r4, r5]
 80108bc:	1b46      	subs	r6, r0, r5
 80108be:	46ac      	mov	ip, r5
 80108c0:	469a      	mov	sl, r3
 80108c2:	0275      	lsls	r5, r6, #9
 80108c4:	d104      	bne.n	80108d0 <fn_08010894+0x3c>
 80108c6:	2380      	movs	r3, #128	@ 0x80
 80108c8:	025b      	lsls	r3, r3, #9
 80108ca:	18c0      	adds	r0, r0, r3
 80108cc:	4663      	mov	r3, ip
 80108ce:	1ac6      	subs	r6, r0, r3
 80108d0:	4dc3      	ldr	r5, [pc, #780]	@ (8010be0 <fn_08010894+0x34c>)
 80108d2:	5967      	ldr	r7, [r4, r5]
 80108d4:	1bcd      	subs	r5, r1, r7
 80108d6:	026b      	lsls	r3, r5, #9
 80108d8:	d103      	bne.n	80108e2 <fn_08010894+0x4e>
 80108da:	2380      	movs	r3, #128	@ 0x80
 80108dc:	025b      	lsls	r3, r3, #9
 80108de:	18c9      	adds	r1, r1, r3
 80108e0:	1bcd      	subs	r5, r1, r7
 80108e2:	4bc0      	ldr	r3, [pc, #768]	@ (8010be4 <fn_08010894+0x350>)
 80108e4:	50e0      	str	r0, [r4, r3]
 80108e6:	4bc0      	ldr	r3, [pc, #768]	@ (8010be8 <fn_08010894+0x354>)
 80108e8:	50e1      	str	r1, [r4, r3]
 80108ea:	1a13      	subs	r3, r2, r0
 80108ec:	48bf      	ldr	r0, [pc, #764]	@ (8010bec <fn_08010894+0x358>)
 80108ee:	4698      	mov	r8, r3
 80108f0:	5023      	str	r3, [r4, r0]
 80108f2:	4653      	mov	r3, sl
 80108f4:	1a59      	subs	r1, r3, r1
 80108f6:	15f3      	asrs	r3, r6, #23
 80108f8:	4699      	mov	r9, r3
 80108fa:	15eb      	asrs	r3, r5, #23
 80108fc:	9300      	str	r3, [sp, #0]
 80108fe:	4663      	mov	r3, ip
 8010900:	1ad2      	subs	r2, r2, r3
 8010902:	4653      	mov	r3, sl
 8010904:	3004      	adds	r0, #4
 8010906:	5021      	str	r1, [r4, r0]
 8010908:	4640      	mov	r0, r8
 801090a:	1bdb      	subs	r3, r3, r7
 801090c:	15db      	asrs	r3, r3, #23
 801090e:	9307      	str	r3, [sp, #28]
 8010910:	11f3      	asrs	r3, r6, #7
 8010912:	469a      	mov	sl, r3
 8010914:	17c3      	asrs	r3, r0, #31
 8010916:	18c7      	adds	r7, r0, r3
 8010918:	405f      	eors	r7, r3
 801091a:	17cb      	asrs	r3, r1, #31
 801091c:	15d2      	asrs	r2, r2, #23
 801091e:	18ce      	adds	r6, r1, r3
 8010920:	9205      	str	r2, [sp, #20]
 8010922:	405e      	eors	r6, r3
 8010924:	4591      	cmp	r9, r2
 8010926:	db00      	blt.n	801092a <fn_08010894+0x96>
 8010928:	e1d6      	b.n	8010cd8 <fn_08010894+0x444>
 801092a:	4653      	mov	r3, sl
 801092c:	2280      	movs	r2, #128	@ 0x80
 801092e:	041b      	lsls	r3, r3, #16
 8010930:	0252      	lsls	r2, r2, #9
 8010932:	4079      	eors	r1, r7
 8010934:	0c1b      	lsrs	r3, r3, #16
 8010936:	1ad3      	subs	r3, r2, r3
 8010938:	9101      	str	r1, [sp, #4]
 801093a:	003a      	movs	r2, r7
 801093c:	0431      	lsls	r1, r6, #16
 801093e:	1430      	asrs	r0, r6, #16
 8010940:	9302      	str	r3, [sp, #8]
 8010942:	f014 fe71 	bl	8025628 <fn_08025628>
 8010946:	2301      	movs	r3, #1
 8010948:	9901      	ldr	r1, [sp, #4]
 801094a:	9009      	str	r0, [sp, #36]	@ 0x24
 801094c:	930a      	str	r3, [sp, #40]	@ 0x28
 801094e:	2900      	cmp	r1, #0
 8010950:	da00      	bge.n	8010954 <fn_08010894+0xc0>
 8010952:	e1ea      	b.n	8010d2a <fn_08010894+0x496>
 8010954:	9909      	ldr	r1, [sp, #36]	@ 0x24
 8010956:	9802      	ldr	r0, [sp, #8]
 8010958:	f014 fe98 	bl	802568c <fn_0802568C>
 801095c:	11ed      	asrs	r5, r5, #7
 801095e:	182b      	adds	r3, r5, r0
 8010960:	9301      	str	r3, [sp, #4]
 8010962:	9a07      	ldr	r2, [sp, #28]
 8010964:	9b00      	ldr	r3, [sp, #0]
 8010966:	4293      	cmp	r3, r2
 8010968:	db00      	blt.n	801096c <fn_08010894+0xd8>
 801096a:	e1a1      	b.n	8010cb0 <fn_08010894+0x41c>
 801096c:	2380      	movs	r3, #128	@ 0x80
 801096e:	042d      	lsls	r5, r5, #16
 8010970:	025b      	lsls	r3, r3, #9
 8010972:	0c2d      	lsrs	r5, r5, #16
 8010974:	1b5d      	subs	r5, r3, r5
 8010976:	4643      	mov	r3, r8
 8010978:	0032      	movs	r2, r6
 801097a:	4073      	eors	r3, r6
 801097c:	0439      	lsls	r1, r7, #16
 801097e:	1438      	asrs	r0, r7, #16
 8010980:	4698      	mov	r8, r3
 8010982:	f014 fe51 	bl	8025628 <fn_08025628>
 8010986:	2301      	movs	r3, #1
 8010988:	930d      	str	r3, [sp, #52]	@ 0x34
 801098a:	4643      	mov	r3, r8
 801098c:	900c      	str	r0, [sp, #48]	@ 0x30
 801098e:	2b00      	cmp	r3, #0
 8010990:	da00      	bge.n	8010994 <fn_08010894+0x100>
 8010992:	e1c7      	b.n	8010d24 <fn_08010894+0x490>
 8010994:	0028      	movs	r0, r5
 8010996:	990c      	ldr	r1, [sp, #48]	@ 0x30
 8010998:	f014 fe78 	bl	802568c <fn_0802568C>
 801099c:	0003      	movs	r3, r0
 801099e:	4453      	add	r3, sl
 80109a0:	0ff2      	lsrs	r2, r6, #31
 80109a2:	9303      	str	r3, [sp, #12]
 80109a4:	17fb      	asrs	r3, r7, #31
 80109a6:	42b7      	cmp	r7, r6
 80109a8:	4153      	adcs	r3, r2
 80109aa:	061b      	lsls	r3, r3, #24
 80109ac:	0e1b      	lsrs	r3, r3, #24
 80109ae:	0032      	movs	r2, r6
 80109b0:	930b      	str	r3, [sp, #44]	@ 0x2c
 80109b2:	42b7      	cmp	r7, r6
 80109b4:	db01      	blt.n	80109ba <fn_08010894+0x126>
 80109b6:	003a      	movs	r2, r7
 80109b8:	9d02      	ldr	r5, [sp, #8]
 80109ba:	23ec      	movs	r3, #236	@ 0xec
 80109bc:	2180      	movs	r1, #128	@ 0x80
 80109be:	00db      	lsls	r3, r3, #3
 80109c0:	58e3      	ldr	r3, [r4, r3]
 80109c2:	0349      	lsls	r1, r1, #13
 80109c4:	185b      	adds	r3, r3, r1
 80109c6:	11db      	asrs	r3, r3, #7
 80109c8:	1aeb      	subs	r3, r5, r3
 80109ca:	9302      	str	r3, [sp, #8]
 80109cc:	2380      	movs	r3, #128	@ 0x80
 80109ce:	041b      	lsls	r3, r3, #16
 80109d0:	429a      	cmp	r2, r3
 80109d2:	dd00      	ble.n	80109d6 <fn_08010894+0x142>
 80109d4:	e1ac      	b.n	8010d30 <fn_08010894+0x49c>
 80109d6:	2300      	movs	r3, #0
 80109d8:	9308      	str	r3, [sp, #32]
 80109da:	930f      	str	r3, [sp, #60]	@ 0x3c
 80109dc:	2301      	movs	r3, #1
 80109de:	9a1a      	ldr	r2, [sp, #104]	@ 0x68
 80109e0:	401a      	ands	r2, r3
 80109e2:	9204      	str	r2, [sp, #16]
 80109e4:	9a1a      	ldr	r2, [sp, #104]	@ 0x68
 80109e6:	3301      	adds	r3, #1
 80109e8:	401a      	ands	r2, r3
 80109ea:	9206      	str	r2, [sp, #24]
 80109ec:	2301      	movs	r3, #1
 80109ee:	42b7      	cmp	r7, r6
 80109f0:	db00      	blt.n	80109f4 <fn_08010894+0x160>
 80109f2:	2300      	movs	r3, #0
 80109f4:	061b      	lsls	r3, r3, #24
 80109f6:	0e1b      	lsrs	r3, r3, #24
 80109f8:	930e      	str	r3, [sp, #56]	@ 0x38
 80109fa:	465b      	mov	r3, fp
 80109fc:	681d      	ldr	r5, [r3, #0]
 80109fe:	2340      	movs	r3, #64	@ 0x40
 8010a00:	46ca      	mov	sl, r9
 8010a02:	46a8      	mov	r8, r5
 8010a04:	4699      	mov	r9, r3
 8010a06:	e020      	b.n	8010a4a <fn_08010894+0x1b6>
 8010a08:	9b06      	ldr	r3, [sp, #24]
 8010a0a:	2b00      	cmp	r3, #0
 8010a0c:	d003      	beq.n	8010a16 <fn_08010894+0x182>
 8010a0e:	4653      	mov	r3, sl
 8010a10:	9a00      	ldr	r2, [sp, #0]
 8010a12:	4313      	orrs	r3, r2
 8010a14:	d55a      	bpl.n	8010acc <fn_08010894+0x238>
 8010a16:	9b05      	ldr	r3, [sp, #20]
 8010a18:	4553      	cmp	r3, sl
 8010a1a:	d104      	bne.n	8010a26 <fn_08010894+0x192>
 8010a1c:	9b07      	ldr	r3, [sp, #28]
 8010a1e:	9a00      	ldr	r2, [sp, #0]
 8010a20:	4293      	cmp	r3, r2
 8010a22:	d100      	bne.n	8010a26 <fn_08010894+0x192>
 8010a24:	e098      	b.n	8010b58 <fn_08010894+0x2c4>
 8010a26:	9b01      	ldr	r3, [sp, #4]
 8010a28:	9a00      	ldr	r2, [sp, #0]
 8010a2a:	141b      	asrs	r3, r3, #16
 8010a2c:	4293      	cmp	r3, r2
 8010a2e:	d100      	bne.n	8010a32 <fn_08010894+0x19e>
 8010a30:	e075      	b.n	8010b1e <fn_08010894+0x28a>
 8010a32:	9b03      	ldr	r3, [sp, #12]
 8010a34:	141b      	asrs	r3, r3, #16
 8010a36:	4553      	cmp	r3, sl
 8010a38:	d100      	bne.n	8010a3c <fn_08010894+0x1a8>
 8010a3a:	e0e5      	b.n	8010c08 <fn_08010894+0x374>
 8010a3c:	2301      	movs	r3, #1
 8010a3e:	425b      	negs	r3, r3
 8010a40:	4499      	add	r9, r3
 8010a42:	464b      	mov	r3, r9
 8010a44:	2b00      	cmp	r3, #0
 8010a46:	d100      	bne.n	8010a4a <fn_08010894+0x1b6>
 8010a48:	e086      	b.n	8010b58 <fn_08010894+0x2c4>
 8010a4a:	9b04      	ldr	r3, [sp, #16]
 8010a4c:	2b00      	cmp	r3, #0
 8010a4e:	d0db      	beq.n	8010a08 <fn_08010894+0x174>
 8010a50:	4653      	mov	r3, sl
 8010a52:	9900      	ldr	r1, [sp, #0]
 8010a54:	430b      	orrs	r3, r1
 8010a56:	d4de      	bmi.n	8010a16 <fn_08010894+0x182>
 8010a58:	4642      	mov	r2, r8
 8010a5a:	4b65      	ldr	r3, [pc, #404]	@ (8010bf0 <fn_08010894+0x35c>)
 8010a5c:	58d3      	ldr	r3, [r2, r3]
 8010a5e:	4553      	cmp	r3, sl
 8010a60:	dd31      	ble.n	8010ac6 <fn_08010894+0x232>
 8010a62:	4864      	ldr	r0, [pc, #400]	@ (8010bf4 <fn_08010894+0x360>)
 8010a64:	5812      	ldr	r2, [r2, r0]
 8010a66:	428a      	cmp	r2, r1
 8010a68:	dc00      	bgt.n	8010a6c <fn_08010894+0x1d8>
 8010a6a:	e115      	b.n	8010c98 <fn_08010894+0x404>
 8010a6c:	4359      	muls	r1, r3
 8010a6e:	22e2      	movs	r2, #226	@ 0xe2
 8010a70:	000b      	movs	r3, r1
 8010a72:	4641      	mov	r1, r8
 8010a74:	0112      	lsls	r2, r2, #4
 8010a76:	588a      	ldr	r2, [r1, r2]
 8010a78:	4453      	add	r3, sl
 8010a7a:	005b      	lsls	r3, r3, #1
 8010a7c:	5a9b      	ldrh	r3, [r3, r2]
 8010a7e:	4a5e      	ldr	r2, [pc, #376]	@ (8010bf8 <fn_08010894+0x364>)
 8010a80:	588a      	ldr	r2, [r1, r2]
 8010a82:	005b      	lsls	r3, r3, #1
 8010a84:	18d4      	adds	r4, r2, r3
 8010a86:	5ad3      	ldrh	r3, [r2, r3]
 8010a88:	4a5c      	ldr	r2, [pc, #368]	@ (8010bfc <fn_08010894+0x368>)
 8010a8a:	4293      	cmp	r3, r2
 8010a8c:	d100      	bne.n	8010a90 <fn_08010894+0x1fc>
 8010a8e:	e103      	b.n	8010c98 <fn_08010894+0x404>
 8010a90:	0018      	movs	r0, r3
 8010a92:	4a4f      	ldr	r2, [pc, #316]	@ (8010bd0 <fn_08010894+0x33c>)
 8010a94:	5a8e      	ldrh	r6, [r1, r2]
 8010a96:	4a5a      	ldr	r2, [pc, #360]	@ (8010c00 <fn_08010894+0x36c>)
 8010a98:	588d      	ldr	r5, [r1, r2]
 8010a9a:	3a04      	subs	r2, #4
 8010a9c:	588f      	ldr	r7, [r1, r2]
 8010a9e:	0082      	lsls	r2, r0, #2
 8010aa0:	18a9      	adds	r1, r5, r2
 8010aa2:	5aaa      	ldrh	r2, [r5, r2]
 8010aa4:	42b2      	cmp	r2, r6
 8010aa6:	d006      	beq.n	8010ab6 <fn_08010894+0x222>
 8010aa8:	0140      	lsls	r0, r0, #5
 8010aaa:	800e      	strh	r6, [r1, #0]
 8010aac:	1838      	adds	r0, r7, r0
 8010aae:	f7ff fc97 	bl	80103e0 <fn_080103E0>
 8010ab2:	2800      	cmp	r0, #0
 8010ab4:	d02a      	beq.n	8010b0c <fn_08010894+0x278>
 8010ab6:	4b51      	ldr	r3, [pc, #324]	@ (8010bfc <fn_08010894+0x368>)
 8010ab8:	8860      	ldrh	r0, [r4, #2]
 8010aba:	3402      	adds	r4, #2
 8010abc:	4298      	cmp	r0, r3
 8010abe:	d1ee      	bne.n	8010a9e <fn_08010894+0x20a>
 8010ac0:	465b      	mov	r3, fp
 8010ac2:	681b      	ldr	r3, [r3, #0]
 8010ac4:	4698      	mov	r8, r3
 8010ac6:	9b06      	ldr	r3, [sp, #24]
 8010ac8:	2b00      	cmp	r3, #0
 8010aca:	d0a4      	beq.n	8010a16 <fn_08010894+0x182>
 8010acc:	4642      	mov	r2, r8
 8010ace:	4b48      	ldr	r3, [pc, #288]	@ (8010bf0 <fn_08010894+0x35c>)
 8010ad0:	58d3      	ldr	r3, [r2, r3]
 8010ad2:	4553      	cmp	r3, sl
 8010ad4:	dd9f      	ble.n	8010a16 <fn_08010894+0x182>
 8010ad6:	4642      	mov	r2, r8
 8010ad8:	4946      	ldr	r1, [pc, #280]	@ (8010bf4 <fn_08010894+0x360>)
 8010ada:	5852      	ldr	r2, [r2, r1]
 8010adc:	9900      	ldr	r1, [sp, #0]
 8010ade:	428a      	cmp	r2, r1
 8010ae0:	dd99      	ble.n	8010a16 <fn_08010894+0x182>
 8010ae2:	4359      	muls	r1, r3
 8010ae4:	22e3      	movs	r2, #227	@ 0xe3
 8010ae6:	000b      	movs	r3, r1
 8010ae8:	4641      	mov	r1, r8
 8010aea:	0112      	lsls	r2, r2, #4
 8010aec:	588a      	ldr	r2, [r1, r2]
 8010aee:	4453      	add	r3, sl
 8010af0:	009b      	lsls	r3, r3, #2
 8010af2:	589c      	ldr	r4, [r3, r2]
 8010af4:	2c00      	cmp	r4, #0
 8010af6:	d104      	bne.n	8010b02 <fn_08010894+0x26e>
 8010af8:	e78d      	b.n	8010a16 <fn_08010894+0x182>
 8010afa:	6a64      	ldr	r4, [r4, #36]	@ 0x24
 8010afc:	2c00      	cmp	r4, #0
 8010afe:	d100      	bne.n	8010b02 <fn_08010894+0x26e>
 8010b00:	e0d2      	b.n	8010ca8 <fn_08010894+0x414>
 8010b02:	0020      	movs	r0, r4
 8010b04:	f7ff fdae 	bl	8010664 <fn_08010664>
 8010b08:	2800      	cmp	r0, #0
 8010b0a:	d1f6      	bne.n	8010afa <fn_08010894+0x266>
 8010b0c:	b011      	add	sp, #68	@ 0x44
 8010b0e:	bcf0      	pop	{r4, r5, r6, r7}
 8010b10:	46bb      	mov	fp, r7
 8010b12:	46b2      	mov	sl, r6
 8010b14:	46a9      	mov	r9, r5
 8010b16:	46a0      	mov	r8, r4
 8010b18:	bcf0      	pop	{r4, r5, r6, r7}
 8010b1a:	bc02      	pop	{r1}
 8010b1c:	4708      	bx	r1
 8010b1e:	9b01      	ldr	r3, [sp, #4]
 8010b20:	9a09      	ldr	r2, [sp, #36]	@ 0x24
 8010b22:	189b      	adds	r3, r3, r2
 8010b24:	9301      	str	r3, [sp, #4]
 8010b26:	9b0a      	ldr	r3, [sp, #40]	@ 0x28
 8010b28:	449a      	add	sl, r3
 8010b2a:	9b0b      	ldr	r3, [sp, #44]	@ 0x2c
 8010b2c:	2b00      	cmp	r3, #0
 8010b2e:	d100      	bne.n	8010b32 <fn_08010894+0x29e>
 8010b30:	e784      	b.n	8010a3c <fn_08010894+0x1a8>
 8010b32:	9b08      	ldr	r3, [sp, #32]
 8010b34:	2b00      	cmp	r3, #0
 8010b36:	d100      	bne.n	8010b3a <fn_08010894+0x2a6>
 8010b38:	e780      	b.n	8010a3c <fn_08010894+0x1a8>
 8010b3a:	9802      	ldr	r0, [sp, #8]
 8010b3c:	2800      	cmp	r0, #0
 8010b3e:	dc6d      	bgt.n	8010c1c <fn_08010894+0x388>
 8010b40:	2280      	movs	r2, #128	@ 0x80
 8010b42:	9b02      	ldr	r3, [sp, #8]
 8010b44:	0252      	lsls	r2, r2, #9
 8010b46:	189b      	adds	r3, r3, r2
 8010b48:	9302      	str	r3, [sp, #8]
 8010b4a:	2301      	movs	r3, #1
 8010b4c:	425b      	negs	r3, r3
 8010b4e:	4499      	add	r9, r3
 8010b50:	464b      	mov	r3, r9
 8010b52:	2b00      	cmp	r3, #0
 8010b54:	d000      	beq.n	8010b58 <fn_08010894+0x2c4>
 8010b56:	e778      	b.n	8010a4a <fn_08010894+0x1b6>
 8010b58:	4645      	mov	r5, r8
 8010b5a:	4f1f      	ldr	r7, [pc, #124]	@ (8010bd8 <fn_08010894+0x344>)
 8010b5c:	4b1d      	ldr	r3, [pc, #116]	@ (8010bd4 <fn_08010894+0x340>)
 8010b5e:	59e8      	ldr	r0, [r5, r7]
 8010b60:	18eb      	adds	r3, r5, r3
 8010b62:	4298      	cmp	r0, r3
 8010b64:	d030      	beq.n	8010bc8 <fn_08010894+0x334>
 8010b66:	1ac1      	subs	r1, r0, r3
 8010b68:	1089      	asrs	r1, r1, #2
 8010b6a:	008a      	lsls	r2, r1, #2
 8010b6c:	1852      	adds	r2, r2, r1
 8010b6e:	0114      	lsls	r4, r2, #4
 8010b70:	1912      	adds	r2, r2, r4
 8010b72:	0214      	lsls	r4, r2, #8
 8010b74:	1912      	adds	r2, r2, r4
 8010b76:	0416      	lsls	r6, r2, #16
 8010b78:	1996      	adds	r6, r2, r6
 8010b7a:	2280      	movs	r2, #128	@ 0x80
 8010b7c:	0252      	lsls	r2, r2, #9
 8010b7e:	4690      	mov	r8, r2
 8010b80:	0076      	lsls	r6, r6, #1
 8010b82:	9a1b      	ldr	r2, [sp, #108]	@ 0x6c
 8010b84:	1876      	adds	r6, r6, r1
 8010b86:	2400      	movs	r4, #0
 8010b88:	4691      	mov	r9, r2
 8010b8a:	4d1e      	ldr	r5, [pc, #120]	@ (8010c04 <fn_08010894+0x370>)
 8010b8c:	3e01      	subs	r6, #1
 8010b8e:	4283      	cmp	r3, r0
 8010b90:	d21a      	bcs.n	8010bc8 <fn_08010894+0x334>
 8010b92:	491c      	ldr	r1, [pc, #112]	@ (8010c04 <fn_08010894+0x370>)
 8010b94:	681a      	ldr	r2, [r3, #0]
 8010b96:	4291      	cmp	r1, r2
 8010b98:	dd01      	ble.n	8010b9e <fn_08010894+0x30a>
 8010b9a:	0011      	movs	r1, r2
 8010b9c:	001c      	movs	r4, r3
 8010b9e:	330c      	adds	r3, #12
 8010ba0:	4298      	cmp	r0, r3
 8010ba2:	d8f7      	bhi.n	8010b94 <fn_08010894+0x300>
 8010ba4:	4541      	cmp	r1, r8
 8010ba6:	dc0f      	bgt.n	8010bc8 <fn_08010894+0x334>
 8010ba8:	0020      	movs	r0, r4
 8010baa:	f000 f8e3 	bl	8010d74 <fn_08010894+0x4e0>
 8010bae:	2800      	cmp	r0, #0
 8010bb0:	d0ac      	beq.n	8010b0c <fn_08010894+0x278>
 8010bb2:	6025      	str	r5, [r4, #0]
 8010bb4:	2e00      	cmp	r6, #0
 8010bb6:	d0a9      	beq.n	8010b0c <fn_08010894+0x278>
 8010bb8:	465b      	mov	r3, fp
 8010bba:	681b      	ldr	r3, [r3, #0]
 8010bbc:	4a05      	ldr	r2, [pc, #20]	@ (8010bd4 <fn_08010894+0x340>)
 8010bbe:	59d8      	ldr	r0, [r3, r7]
 8010bc0:	189b      	adds	r3, r3, r2
 8010bc2:	3e01      	subs	r6, #1
 8010bc4:	4283      	cmp	r3, r0
 8010bc6:	d3e4      	bcc.n	8010b92 <fn_08010894+0x2fe>
 8010bc8:	2001      	movs	r0, #1
 8010bca:	e79f      	b.n	8010b0c <fn_08010894+0x278>
 8010bcc:	030064c4 	.word	0x030064c4
 8010bd0:	00001122 	.word	0x00001122
 8010bd4:	00000954 	.word	0x00000954
 8010bd8:	00000c54 	.word	0x00000c54
 8010bdc:	00000e28 	.word	0x00000e28
 8010be0:	00000e2c 	.word	0x00000e2c
 8010be4:	00000944 	.word	0x00000944
 8010be8:	00000948 	.word	0x00000948
 8010bec:	0000094c 	.word	0x0000094c
 8010bf0:	00000e18 	.word	0x00000e18
 8010bf4:	00000e1c 	.word	0x00000e1c
 8010bf8:	00000e24 	.word	0x00000e24
 8010bfc:	0000ffff 	.word	0x0000ffff
 8010c00:	00000e04 	.word	0x00000e04
 8010c04:	7fffffff 	.word	0x7fffffff
 8010c08:	9b03      	ldr	r3, [sp, #12]
 8010c0a:	9a0c      	ldr	r2, [sp, #48]	@ 0x30
 8010c0c:	189b      	adds	r3, r3, r2
 8010c0e:	9303      	str	r3, [sp, #12]
 8010c10:	9a0d      	ldr	r2, [sp, #52]	@ 0x34
 8010c12:	9b00      	ldr	r3, [sp, #0]
 8010c14:	189b      	adds	r3, r3, r2
 8010c16:	9300      	str	r3, [sp, #0]
 8010c18:	9b0e      	ldr	r3, [sp, #56]	@ 0x38
 8010c1a:	e787      	b.n	8010b2c <fn_08010894+0x298>
 8010c1c:	4643      	mov	r3, r8
 8010c1e:	4a50      	ldr	r2, [pc, #320]	@ (8010d60 <fn_08010894+0x4cc>)
 8010c20:	4c50      	ldr	r4, [pc, #320]	@ (8010d64 <fn_08010894+0x4d0>)
 8010c22:	589e      	ldr	r6, [r3, r2]
 8010c24:	4444      	add	r4, r8
 8010c26:	42a6      	cmp	r6, r4
 8010c28:	d08a      	beq.n	8010b40 <fn_08010894+0x2ac>
 8010c2a:	990f      	ldr	r1, [sp, #60]	@ 0x3c
 8010c2c:	f014 fd2e 	bl	802568c <fn_0802568C>
 8010c30:	1b32      	subs	r2, r6, r4
 8010c32:	1092      	asrs	r2, r2, #2
 8010c34:	0093      	lsls	r3, r2, #2
 8010c36:	189b      	adds	r3, r3, r2
 8010c38:	0119      	lsls	r1, r3, #4
 8010c3a:	185b      	adds	r3, r3, r1
 8010c3c:	0219      	lsls	r1, r3, #8
 8010c3e:	185b      	adds	r3, r3, r1
 8010c40:	041d      	lsls	r5, r3, #16
 8010c42:	195d      	adds	r5, r3, r5
 8010c44:	9b1b      	ldr	r3, [sp, #108]	@ 0x6c
 8010c46:	0031      	movs	r1, r6
 8010c48:	2700      	movs	r7, #0
 8010c4a:	0006      	movs	r6, r0
 8010c4c:	4640      	mov	r0, r8
 8010c4e:	4698      	mov	r8, r3
 8010c50:	006d      	lsls	r5, r5, #1
 8010c52:	18ad      	adds	r5, r5, r2
 8010c54:	3d01      	subs	r5, #1
 8010c56:	4a44      	ldr	r2, [pc, #272]	@ (8010d68 <fn_08010894+0x4d4>)
 8010c58:	428c      	cmp	r4, r1
 8010c5a:	d207      	bcs.n	8010c6c <fn_08010894+0x3d8>
 8010c5c:	6823      	ldr	r3, [r4, #0]
 8010c5e:	4293      	cmp	r3, r2
 8010c60:	da01      	bge.n	8010c66 <fn_08010894+0x3d2>
 8010c62:	001a      	movs	r2, r3
 8010c64:	0027      	movs	r7, r4
 8010c66:	340c      	adds	r4, #12
 8010c68:	42a1      	cmp	r1, r4
 8010c6a:	d8f7      	bhi.n	8010c5c <fn_08010894+0x3c8>
 8010c6c:	4296      	cmp	r6, r2
 8010c6e:	db11      	blt.n	8010c94 <fn_08010894+0x400>
 8010c70:	0038      	movs	r0, r7
 8010c72:	f000 f87e 	bl	8010d72 <fn_08010894+0x4de>
 8010c76:	2800      	cmp	r0, #0
 8010c78:	d100      	bne.n	8010c7c <fn_08010894+0x3e8>
 8010c7a:	e747      	b.n	8010b0c <fn_08010894+0x278>
 8010c7c:	4b3a      	ldr	r3, [pc, #232]	@ (8010d68 <fn_08010894+0x4d4>)
 8010c7e:	603b      	str	r3, [r7, #0]
 8010c80:	465b      	mov	r3, fp
 8010c82:	6818      	ldr	r0, [r3, #0]
 8010c84:	2d00      	cmp	r5, #0
 8010c86:	d005      	beq.n	8010c94 <fn_08010894+0x400>
 8010c88:	4b35      	ldr	r3, [pc, #212]	@ (8010d60 <fn_08010894+0x4cc>)
 8010c8a:	58c1      	ldr	r1, [r0, r3]
 8010c8c:	4b35      	ldr	r3, [pc, #212]	@ (8010d64 <fn_08010894+0x4d0>)
 8010c8e:	3d01      	subs	r5, #1
 8010c90:	18c4      	adds	r4, r0, r3
 8010c92:	e7e0      	b.n	8010c56 <fn_08010894+0x3c2>
 8010c94:	4680      	mov	r8, r0
 8010c96:	e753      	b.n	8010b40 <fn_08010894+0x2ac>
 8010c98:	9b06      	ldr	r3, [sp, #24]
 8010c9a:	2b00      	cmp	r3, #0
 8010c9c:	d100      	bne.n	8010ca0 <fn_08010894+0x40c>
 8010c9e:	e6ba      	b.n	8010a16 <fn_08010894+0x182>
 8010ca0:	4642      	mov	r2, r8
 8010ca2:	4b32      	ldr	r3, [pc, #200]	@ (8010d6c <fn_08010894+0x4d8>)
 8010ca4:	58d3      	ldr	r3, [r2, r3]
 8010ca6:	e716      	b.n	8010ad6 <fn_08010894+0x242>
 8010ca8:	465b      	mov	r3, fp
 8010caa:	681b      	ldr	r3, [r3, #0]
 8010cac:	4698      	mov	r8, r3
 8010cae:	e6b2      	b.n	8010a16 <fn_08010894+0x182>
 8010cb0:	4293      	cmp	r3, r2
 8010cb2:	dd2f      	ble.n	8010d14 <fn_08010894+0x480>
 8010cb4:	4643      	mov	r3, r8
 8010cb6:	4073      	eors	r3, r6
 8010cb8:	4698      	mov	r8, r3
 8010cba:	0032      	movs	r2, r6
 8010cbc:	0439      	lsls	r1, r7, #16
 8010cbe:	1438      	asrs	r0, r7, #16
 8010cc0:	f014 fcb2 	bl	8025628 <fn_08025628>
 8010cc4:	4643      	mov	r3, r8
 8010cc6:	042d      	lsls	r5, r5, #16
 8010cc8:	900c      	str	r0, [sp, #48]	@ 0x30
 8010cca:	0c2d      	lsrs	r5, r5, #16
 8010ccc:	2b00      	cmp	r3, #0
 8010cce:	db3a      	blt.n	8010d46 <fn_08010894+0x4b2>
 8010cd0:	2301      	movs	r3, #1
 8010cd2:	425b      	negs	r3, r3
 8010cd4:	930d      	str	r3, [sp, #52]	@ 0x34
 8010cd6:	e65d      	b.n	8010994 <fn_08010894+0x100>
 8010cd8:	4591      	cmp	r9, r2
 8010cda:	dd12      	ble.n	8010d02 <fn_08010894+0x46e>
 8010cdc:	4653      	mov	r3, sl
 8010cde:	4079      	eors	r1, r7
 8010ce0:	041b      	lsls	r3, r3, #16
 8010ce2:	9101      	str	r1, [sp, #4]
 8010ce4:	0c1b      	lsrs	r3, r3, #16
 8010ce6:	0431      	lsls	r1, r6, #16
 8010ce8:	003a      	movs	r2, r7
 8010cea:	1430      	asrs	r0, r6, #16
 8010cec:	9302      	str	r3, [sp, #8]
 8010cee:	f014 fc9b 	bl	8025628 <fn_08025628>
 8010cf2:	9901      	ldr	r1, [sp, #4]
 8010cf4:	9009      	str	r0, [sp, #36]	@ 0x24
 8010cf6:	2900      	cmp	r1, #0
 8010cf8:	db2b      	blt.n	8010d52 <fn_08010894+0x4be>
 8010cfa:	2301      	movs	r3, #1
 8010cfc:	425b      	negs	r3, r3
 8010cfe:	930a      	str	r3, [sp, #40]	@ 0x28
 8010d00:	e628      	b.n	8010954 <fn_08010894+0xc0>
 8010d02:	2300      	movs	r3, #0
 8010d04:	930a      	str	r3, [sp, #40]	@ 0x28
 8010d06:	2380      	movs	r3, #128	@ 0x80
 8010d08:	025b      	lsls	r3, r3, #9
 8010d0a:	9302      	str	r3, [sp, #8]
 8010d0c:	2380      	movs	r3, #128	@ 0x80
 8010d0e:	045b      	lsls	r3, r3, #17
 8010d10:	9309      	str	r3, [sp, #36]	@ 0x24
 8010d12:	e61f      	b.n	8010954 <fn_08010894+0xc0>
 8010d14:	2300      	movs	r3, #0
 8010d16:	930d      	str	r3, [sp, #52]	@ 0x34
 8010d18:	2380      	movs	r3, #128	@ 0x80
 8010d1a:	2580      	movs	r5, #128	@ 0x80
 8010d1c:	045b      	lsls	r3, r3, #17
 8010d1e:	930c      	str	r3, [sp, #48]	@ 0x30
 8010d20:	026d      	lsls	r5, r5, #9
 8010d22:	e637      	b.n	8010994 <fn_08010894+0x100>
 8010d24:	4243      	negs	r3, r0
 8010d26:	930c      	str	r3, [sp, #48]	@ 0x30
 8010d28:	e634      	b.n	8010994 <fn_08010894+0x100>
 8010d2a:	4243      	negs	r3, r0
 8010d2c:	9309      	str	r3, [sp, #36]	@ 0x24
 8010d2e:	e611      	b.n	8010954 <fn_08010894+0xc0>
 8010d30:	11d2      	asrs	r2, r2, #7
 8010d32:	2100      	movs	r1, #0
 8010d34:	2001      	movs	r0, #1
 8010d36:	f014 fc77 	bl	8025628 <fn_08025628>
 8010d3a:	0002      	movs	r2, r0
 8010d3c:	1e53      	subs	r3, r2, #1
 8010d3e:	419a      	sbcs	r2, r3
 8010d40:	900f      	str	r0, [sp, #60]	@ 0x3c
 8010d42:	9208      	str	r2, [sp, #32]
 8010d44:	e64a      	b.n	80109dc <fn_08010894+0x148>
 8010d46:	4243      	negs	r3, r0
 8010d48:	930c      	str	r3, [sp, #48]	@ 0x30
 8010d4a:	2301      	movs	r3, #1
 8010d4c:	425b      	negs	r3, r3
 8010d4e:	930d      	str	r3, [sp, #52]	@ 0x34
 8010d50:	e620      	b.n	8010994 <fn_08010894+0x100>
 8010d52:	4243      	negs	r3, r0
 8010d54:	9309      	str	r3, [sp, #36]	@ 0x24
 8010d56:	2301      	movs	r3, #1
 8010d58:	425b      	negs	r3, r3
 8010d5a:	930a      	str	r3, [sp, #40]	@ 0x28
 8010d5c:	e5fa      	b.n	8010954 <fn_08010894+0xc0>
 8010d5e:	46c0      	nop			@ (mov r8, r8)
 8010d60:	00000c54 	.word	0x00000c54
 8010d64:	00000954 	.word	0x00000954
 8010d68:	7fffffff 	.word	0x7fffffff
 8010d6c:	00000e18 	.word	0x00000e18
 8010d70:	4728      	bx	r5
 8010d72:	4740      	bx	r8
 8010d74:	4748      	bx	r9
 8010d76:	46c0      	nop			@ (mov r8, r8)
