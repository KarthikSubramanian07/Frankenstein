fn_08011958:
 8011958:	b5f0      	push	{r4, r5, r6, r7, lr}
 801195a:	46d6      	mov	lr, sl
 801195c:	464f      	mov	r7, r9
 801195e:	4646      	mov	r6, r8
 8011960:	4b75      	ldr	r3, [pc, #468]	@ (8011b38 <fn_08011958+0x1e0>)
 8011962:	681a      	ldr	r2, [r3, #0]
 8011964:	4699      	mov	r9, r3
 8011966:	23e0      	movs	r3, #224	@ 0xe0
 8011968:	b5c0      	push	{r6, r7, lr}
 801196a:	58d3      	ldr	r3, [r2, r3]
 801196c:	0004      	movs	r4, r0
 801196e:	4690      	mov	r8, r2
 8011970:	469a      	mov	sl, r3
 8011972:	b082      	sub	sp, #8
 8011974:	4298      	cmp	r0, r3
 8011976:	d100      	bne.n	801197a <fn_08011958+0x22>
 8011978:	e07f      	b.n	8011a7a <fn_08011958+0x122>
 801197a:	2380      	movs	r3, #128	@ 0x80
 801197c:	6965      	ldr	r5, [r4, #20]
 801197e:	6c67      	ldr	r7, [r4, #68]	@ 0x44
 8011980:	6ce6      	ldr	r6, [r4, #76]	@ 0x4c
 8011982:	197d      	adds	r5, r7, r5
 8011984:	01db      	lsls	r3, r3, #7
 8011986:	6165      	str	r5, [r4, #20]
 8011988:	421e      	tst	r6, r3
 801198a:	d026      	beq.n	80119da <fn_08011958+0x82>
 801198c:	6d20      	ldr	r0, [r4, #80]	@ 0x50
 801198e:	2800      	cmp	r0, #0
 8011990:	d023      	beq.n	80119da <fn_08011958+0x82>
 8011992:	4a6a      	ldr	r2, [pc, #424]	@ (8011b3c <fn_08011958+0x1e4>)
 8011994:	4073      	eors	r3, r6
 8011996:	4213      	tst	r3, r2
 8011998:	d11f      	bne.n	80119da <fn_08011958+0x82>
 801199a:	0002      	movs	r2, r0
 801199c:	6903      	ldr	r3, [r0, #16]
 801199e:	6921      	ldr	r1, [r4, #16]
 80119a0:	68e0      	ldr	r0, [r4, #12]
 80119a2:	1ac9      	subs	r1, r1, r3
 80119a4:	68d3      	ldr	r3, [r2, #12]
 80119a6:	1ac0      	subs	r0, r0, r3
 80119a8:	9201      	str	r2, [sp, #4]
 80119aa:	f7fe fa27 	bl	800fdfc <fn_0800FDFC>
 80119ae:	9a01      	ldr	r2, [sp, #4]
 80119b0:	6ba3      	ldr	r3, [r4, #56]	@ 0x38
 80119b2:	6952      	ldr	r2, [r2, #20]
 80119b4:	105b      	asrs	r3, r3, #1
 80119b6:	189b      	adds	r3, r3, r2
 80119b8:	1b5b      	subs	r3, r3, r5
 80119ba:	17da      	asrs	r2, r3, #31
 80119bc:	1899      	adds	r1, r3, r2
 80119be:	4051      	eors	r1, r2
 80119c0:	004a      	lsls	r2, r1, #1
 80119c2:	1852      	adds	r2, r2, r1
 80119c4:	4290      	cmp	r0, r2
 80119c6:	da08      	bge.n	80119da <fn_08011958+0x82>
 80119c8:	43db      	mvns	r3, r3
 80119ca:	2280      	movs	r2, #128	@ 0x80
 80119cc:	17db      	asrs	r3, r3, #31
 80119ce:	0312      	lsls	r2, r2, #12
 80119d0:	4013      	ands	r3, r2
 80119d2:	4a5b      	ldr	r2, [pc, #364]	@ (8011b40 <fn_08011958+0x1e8>)
 80119d4:	189b      	adds	r3, r3, r2
 80119d6:	18ed      	adds	r5, r5, r3
 80119d8:	6165      	str	r5, [r4, #20]
 80119da:	6b23      	ldr	r3, [r4, #48]	@ 0x30
 80119dc:	42ab      	cmp	r3, r5
 80119de:	db2c      	blt.n	8011a3a <fn_08011958+0xe2>
 80119e0:	01f2      	lsls	r2, r6, #7
 80119e2:	d501      	bpl.n	80119e8 <fn_08011958+0x90>
 80119e4:	427f      	negs	r7, r7
 80119e6:	6467      	str	r7, [r4, #68]	@ 0x44
 80119e8:	2f00      	cmp	r7, #0
 80119ea:	db33      	blt.n	8011a54 <fn_08011958+0xfc>
 80119ec:	2288      	movs	r2, #136	@ 0x88
 80119ee:	2180      	movs	r1, #128	@ 0x80
 80119f0:	0252      	lsls	r2, r2, #9
 80119f2:	6163      	str	r3, [r4, #20]
 80119f4:	4032      	ands	r2, r6
 80119f6:	0249      	lsls	r1, r1, #9
 80119f8:	428a      	cmp	r2, r1
 80119fa:	d057      	beq.n	8011aac <fn_08011958+0x154>
 80119fc:	6ba1      	ldr	r1, [r4, #56]	@ 0x38
 80119fe:	6b62      	ldr	r2, [r4, #52]	@ 0x34
 8011a00:	18cb      	adds	r3, r1, r3
 8011a02:	4293      	cmp	r3, r2
 8011a04:	dd11      	ble.n	8011a2a <fn_08011958+0xd2>
 8011a06:	6c63      	ldr	r3, [r4, #68]	@ 0x44
 8011a08:	01f0      	lsls	r0, r6, #7
 8011a0a:	d501      	bpl.n	8011a10 <fn_08011958+0xb8>
 8011a0c:	425b      	negs	r3, r3
 8011a0e:	6463      	str	r3, [r4, #68]	@ 0x44
 8011a10:	2b00      	cmp	r3, #0
 8011a12:	dd01      	ble.n	8011a18 <fn_08011958+0xc0>
 8011a14:	2300      	movs	r3, #0
 8011a16:	6463      	str	r3, [r4, #68]	@ 0x44
 8011a18:	2388      	movs	r3, #136	@ 0x88
 8011a1a:	025b      	lsls	r3, r3, #9
 8011a1c:	401e      	ands	r6, r3
 8011a1e:	2380      	movs	r3, #128	@ 0x80
 8011a20:	1a52      	subs	r2, r2, r1
 8011a22:	6162      	str	r2, [r4, #20]
 8011a24:	025b      	lsls	r3, r3, #9
 8011a26:	429e      	cmp	r6, r3
 8011a28:	d040      	beq.n	8011aac <fn_08011958+0x154>
 8011a2a:	b002      	add	sp, #8
 8011a2c:	bce0      	pop	{r5, r6, r7}
 8011a2e:	46ba      	mov	sl, r7
 8011a30:	46b1      	mov	r9, r6
 8011a32:	46a8      	mov	r8, r5
 8011a34:	bcf0      	pop	{r4, r5, r6, r7}
 8011a36:	bc01      	pop	{r0}
 8011a38:	4700      	bx	r0
 8011a3a:	05b3      	lsls	r3, r6, #22
 8011a3c:	d403      	bmi.n	8011a46 <fn_08011958+0xee>
 8011a3e:	2f00      	cmp	r7, #0
 8011a40:	d12c      	bne.n	8011a9c <fn_08011958+0x144>
 8011a42:	4f40      	ldr	r7, [pc, #256]	@ (8011b44 <fn_08011958+0x1ec>)
 8011a44:	6467      	str	r7, [r4, #68]	@ 0x44
 8011a46:	002b      	movs	r3, r5
 8011a48:	6ba1      	ldr	r1, [r4, #56]	@ 0x38
 8011a4a:	6b62      	ldr	r2, [r4, #52]	@ 0x34
 8011a4c:	18cb      	adds	r3, r1, r3
 8011a4e:	4293      	cmp	r3, r2
 8011a50:	ddeb      	ble.n	8011a2a <fn_08011958+0xd2>
 8011a52:	e7d8      	b.n	8011a06 <fn_08011958+0xae>
 8011a54:	493c      	ldr	r1, [pc, #240]	@ (8011b48 <fn_08011958+0x1f0>)
 8011a56:	2201      	movs	r2, #1
 8011a58:	428f      	cmp	r7, r1
 8011a5a:	da23      	bge.n	8011aa4 <fn_08011958+0x14c>
 8011a5c:	0612      	lsls	r2, r2, #24
 8011a5e:	d001      	beq.n	8011a64 <fn_08011958+0x10c>
 8011a60:	4554      	cmp	r4, sl
 8011a62:	d05a      	beq.n	8011b1a <fn_08011958+0x1c2>
 8011a64:	2200      	movs	r2, #0
 8011a66:	6462      	str	r2, [r4, #68]	@ 0x44
 8011a68:	2288      	movs	r2, #136	@ 0x88
 8011a6a:	2180      	movs	r1, #128	@ 0x80
 8011a6c:	0252      	lsls	r2, r2, #9
 8011a6e:	6163      	str	r3, [r4, #20]
 8011a70:	4032      	ands	r2, r6
 8011a72:	0249      	lsls	r1, r1, #9
 8011a74:	428a      	cmp	r2, r1
 8011a76:	d1c1      	bne.n	80119fc <fn_08011958+0xa4>
 8011a78:	e018      	b.n	8011aac <fn_08011958+0x154>
 8011a7a:	6942      	ldr	r2, [r0, #20]
 8011a7c:	6b03      	ldr	r3, [r0, #48]	@ 0x30
 8011a7e:	429a      	cmp	r2, r3
 8011a80:	db00      	blt.n	8011a84 <fn_08011958+0x12c>
 8011a82:	e77a      	b.n	801197a <fn_08011958+0x22>
 8011a84:	4641      	mov	r1, r8
 8011a86:	31e0      	adds	r1, #224	@ 0xe0
 8011a88:	1a9b      	subs	r3, r3, r2
 8011a8a:	694a      	ldr	r2, [r1, #20]
 8011a8c:	1ad2      	subs	r2, r2, r3
 8011a8e:	23a4      	movs	r3, #164	@ 0xa4
 8011a90:	039b      	lsls	r3, r3, #14
 8011a92:	1a9b      	subs	r3, r3, r2
 8011a94:	10db      	asrs	r3, r3, #3
 8011a96:	614a      	str	r2, [r1, #20]
 8011a98:	618b      	str	r3, [r1, #24]
 8011a9a:	e76e      	b.n	801197a <fn_08011958+0x22>
 8011a9c:	4b2b      	ldr	r3, [pc, #172]	@ (8011b4c <fn_08011958+0x1f4>)
 8011a9e:	18ff      	adds	r7, r7, r3
 8011aa0:	6467      	str	r7, [r4, #68]	@ 0x44
 8011aa2:	e7d0      	b.n	8011a46 <fn_08011958+0xee>
 8011aa4:	2200      	movs	r2, #0
 8011aa6:	0612      	lsls	r2, r2, #24
 8011aa8:	d1da      	bne.n	8011a60 <fn_08011958+0x108>
 8011aaa:	e7db      	b.n	8011a64 <fn_08011958+0x10c>
 8011aac:	2300      	movs	r3, #0
 8011aae:	6463      	str	r3, [r4, #68]	@ 0x44
 8011ab0:	6423      	str	r3, [r4, #64]	@ 0x40
 8011ab2:	63e3      	str	r3, [r4, #60]	@ 0x3c
 8011ab4:	464b      	mov	r3, r9
 8011ab6:	681a      	ldr	r2, [r3, #0]
 8011ab8:	235a      	movs	r3, #90	@ 0x5a
 8011aba:	5ce1      	ldrb	r1, [r4, r3]
 8011abc:	23ea      	movs	r3, #234	@ 0xea
 8011abe:	00db      	lsls	r3, r3, #3
 8011ac0:	58d3      	ldr	r3, [r2, r3]
 8011ac2:	225c      	movs	r2, #92	@ 0x5c
 8011ac4:	434a      	muls	r2, r1
 8011ac6:	189b      	adds	r3, r3, r2
 8011ac8:	8e19      	ldrh	r1, [r3, #48]	@ 0x30
 8011aca:	0020      	movs	r0, r4
 8011acc:	f7ff fb9e 	bl	801120c <fn_0801120C>
 8011ad0:	f7f5 f816 	bl	8006b00 <fn_08006B00>
 8011ad4:	2303      	movs	r3, #3
 8011ad6:	2256      	movs	r2, #86	@ 0x56
 8011ad8:	4003      	ands	r3, r0
 8011ada:	5aa0      	ldrh	r0, [r4, r2]
 8011adc:	1ac0      	subs	r0, r0, r3
 8011ade:	1c03      	adds	r3, r0, #0
 8011ae0:	0400      	lsls	r0, r0, #16
 8011ae2:	1400      	asrs	r0, r0, #16
 8011ae4:	2800      	cmp	r0, #0
 8011ae6:	dc00      	bgt.n	8011aea <fn_08011958+0x192>
 8011ae8:	2301      	movs	r3, #1
 8011aea:	2256      	movs	r2, #86	@ 0x56
 8011aec:	52a3      	strh	r3, [r4, r2]
 8011aee:	4a18      	ldr	r2, [pc, #96]	@ (8011b50 <fn_08011958+0x1f8>)
 8011af0:	6ce3      	ldr	r3, [r4, #76]	@ 0x4c
 8011af2:	4013      	ands	r3, r2
 8011af4:	64e3      	str	r3, [r4, #76]	@ 0x4c
 8011af6:	464b      	mov	r3, r9
 8011af8:	681a      	ldr	r2, [r3, #0]
 8011afa:	235a      	movs	r3, #90	@ 0x5a
 8011afc:	5ce1      	ldrb	r1, [r4, r3]
 8011afe:	23ea      	movs	r3, #234	@ 0xea
 8011b00:	00db      	lsls	r3, r3, #3
 8011b02:	58d3      	ldr	r3, [r2, r3]
 8011b04:	225c      	movs	r2, #92	@ 0x5c
 8011b06:	434a      	muls	r2, r1
 8011b08:	189b      	adds	r3, r3, r2
 8011b0a:	6b99      	ldr	r1, [r3, #56]	@ 0x38
 8011b0c:	2900      	cmp	r1, #0
 8011b0e:	d100      	bne.n	8011b12 <fn_08011958+0x1ba>
 8011b10:	e78b      	b.n	8011a2a <fn_08011958+0xd2>
 8011b12:	0020      	movs	r0, r4
 8011b14:	f008 fbd8 	bl	801a2c8 <fn_0801A2C8>
 8011b18:	e787      	b.n	8011a2a <fn_08011958+0xd2>
 8011b1a:	4642      	mov	r2, r8
 8011b1c:	10ff      	asrs	r7, r7, #3
 8011b1e:	32e0      	adds	r2, #224	@ 0xe0
 8011b20:	6197      	str	r7, [r2, #24]
 8011b22:	2254      	movs	r2, #84	@ 0x54
 8011b24:	5ea2      	ldrsh	r2, [r4, r2]
 8011b26:	2a00      	cmp	r2, #0
 8011b28:	dd9c      	ble.n	8011a64 <fn_08011958+0x10c>
 8011b2a:	2122      	movs	r1, #34	@ 0x22
 8011b2c:	0020      	movs	r0, r4
 8011b2e:	f008 fbcb 	bl	801a2c8 <fn_0801A2C8>
 8011b32:	6b23      	ldr	r3, [r4, #48]	@ 0x30
 8011b34:	6ce6      	ldr	r6, [r4, #76]	@ 0x4c
 8011b36:	e795      	b.n	8011a64 <fn_08011958+0x10c>
 8011b38:	030064c4 	.word	0x030064c4
 8011b3c:	01204000 	.word	0x01204000
 8011b40:	fffc0000 	.word	0xfffc0000
 8011b44:	fffe0000 	.word	0xfffe0000
 8011b48:	fff80000 	.word	0xfff80000
 8011b4c:	ffff0000 	.word	0xffff0000
 8011b50:	fffeffff 	.word	0xfffeffff
