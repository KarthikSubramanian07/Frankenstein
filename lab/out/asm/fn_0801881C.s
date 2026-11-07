fn_0801881C:
 801881c:	b5f0      	push	{r4, r5, r6, r7, lr}
 801881e:	4645      	mov	r5, r8
 8018820:	46de      	mov	lr, fp
 8018822:	4657      	mov	r7, sl
 8018824:	464e      	mov	r6, r9
 8018826:	22a4      	movs	r2, #164	@ 0xa4
 8018828:	b5e0      	push	{r5, r6, r7, lr}
 801882a:	5882      	ldr	r2, [r0, r2]
 801882c:	6805      	ldr	r5, [r0, #0]
 801882e:	0004      	movs	r4, r0
 8018830:	6ceb      	ldr	r3, [r5, #76]	@ 0x4c
 8018832:	b085      	sub	sp, #20
 8018834:	07d2      	lsls	r2, r2, #31
 8018836:	d400      	bmi.n	801883a <fn_0801881C+0x1e>
 8018838:	e083      	b.n	8018942 <fn_0801881C+0x126>
 801883a:	2280      	movs	r2, #128	@ 0x80
 801883c:	0152      	lsls	r2, r2, #5
 801883e:	4313      	orrs	r3, r2
 8018840:	2280      	movs	r2, #128	@ 0x80
 8018842:	64eb      	str	r3, [r5, #76]	@ 0x4c
 8018844:	421a      	tst	r2, r3
 8018846:	d005      	beq.n	8018854 <fn_0801881C+0x38>
 8018848:	2100      	movs	r1, #0
 801884a:	4393      	bics	r3, r2
 801884c:	8121      	strh	r1, [r4, #8]
 801884e:	3164      	adds	r1, #100	@ 0x64
 8018850:	80e1      	strh	r1, [r4, #6]
 8018852:	64eb      	str	r3, [r5, #76]	@ 0x4c
 8018854:	7923      	ldrb	r3, [r4, #4]
 8018856:	2b01      	cmp	r3, #1
 8018858:	d100      	bne.n	801885c <fn_0801881C+0x40>
 801885a:	e0ba      	b.n	80189d2 <fn_0801881C+0x1b6>
 801885c:	225c      	movs	r2, #92	@ 0x5c
 801885e:	5cab      	ldrb	r3, [r5, r2]
 8018860:	2b00      	cmp	r3, #0
 8018862:	d100      	bne.n	8018866 <fn_0801881C+0x4a>
 8018864:	e080      	b.n	8018968 <fn_0801881C+0x14c>
 8018866:	3b01      	subs	r3, #1
 8018868:	54ab      	strb	r3, [r5, r2]
 801886a:	1da3      	adds	r3, r4, #6
 801886c:	4699      	mov	r9, r3
 801886e:	0020      	movs	r0, r4
 8018870:	f7ff ff54 	bl	801871c <fn_0801871C>
 8018874:	6823      	ldr	r3, [r4, #0]
 8018876:	6adb      	ldr	r3, [r3, #44]	@ 0x2c
 8018878:	2220      	movs	r2, #32
 801887a:	5e9b      	ldrsh	r3, [r3, r2]
 801887c:	2b00      	cmp	r3, #0
 801887e:	d16f      	bne.n	8018960 <fn_0801881C+0x144>
 8018880:	464b      	mov	r3, r9
 8018882:	79db      	ldrb	r3, [r3, #7]
 8018884:	075a      	lsls	r2, r3, #29
 8018886:	d513      	bpl.n	80188b0 <fn_0801881C+0x94>
 8018888:	065a      	lsls	r2, r3, #25
 801888a:	0f12      	lsrs	r2, r2, #28
 801888c:	0011      	movs	r1, r2
 801888e:	3116      	adds	r1, #22
 8018890:	0089      	lsls	r1, r1, #2
 8018892:	5861      	ldr	r1, [r4, r1]
 8018894:	2900      	cmp	r1, #0
 8018896:	d00b      	beq.n	80188b0 <fn_0801881C+0x94>
 8018898:	2153      	movs	r1, #83	@ 0x53
 801889a:	5c61      	ldrb	r1, [r4, r1]
 801889c:	4291      	cmp	r1, r2
 801889e:	d007      	beq.n	80188b0 <fn_0801881C+0x94>
 80188a0:	1f51      	subs	r1, r2, #5
 80188a2:	0609      	lsls	r1, r1, #24
 80188a4:	0e09      	lsrs	r1, r1, #24
 80188a6:	2901      	cmp	r1, #1
 80188a8:	d800      	bhi.n	80188ac <fn_0801881C+0x90>
 80188aa:	e0db      	b.n	8018a64 <fn_0801881C+0x248>
 80188ac:	2154      	movs	r1, #84	@ 0x54
 80188ae:	5462      	strb	r2, [r4, r1]
 80188b0:	2202      	movs	r2, #2
 80188b2:	0011      	movs	r1, r2
 80188b4:	4019      	ands	r1, r3
 80188b6:	421a      	tst	r2, r3
 80188b8:	d146      	bne.n	8018948 <fn_0801881C+0x12c>
 80188ba:	23a0      	movs	r3, #160	@ 0xa0
 80188bc:	50e1      	str	r1, [r4, r3]
 80188be:	0020      	movs	r0, r4
 80188c0:	f7fb f9dc 	bl	8013c7c <fn_08013C7C>
 80188c4:	6ba3      	ldr	r3, [r4, #56]	@ 0x38
 80188c6:	2b00      	cmp	r3, #0
 80188c8:	d001      	beq.n	80188ce <fn_0801881C+0xb2>
 80188ca:	3301      	adds	r3, #1
 80188cc:	63a3      	str	r3, [r4, #56]	@ 0x38
 80188ce:	6b63      	ldr	r3, [r4, #52]	@ 0x34
 80188d0:	2b00      	cmp	r3, #0
 80188d2:	dd01      	ble.n	80188d8 <fn_0801881C+0xbc>
 80188d4:	3b01      	subs	r3, #1
 80188d6:	6363      	str	r3, [r4, #52]	@ 0x34
 80188d8:	6be2      	ldr	r2, [r4, #60]	@ 0x3c
 80188da:	2a00      	cmp	r2, #0
 80188dc:	dd08      	ble.n	80188f0 <fn_0801881C+0xd4>
 80188de:	3a01      	subs	r2, #1
 80188e0:	63e2      	str	r2, [r4, #60]	@ 0x3c
 80188e2:	2a00      	cmp	r2, #0
 80188e4:	d104      	bne.n	80188f0 <fn_0801881C+0xd4>
 80188e6:	6821      	ldr	r1, [r4, #0]
 80188e8:	4891      	ldr	r0, [pc, #580]	@ (8018b30 <fn_0801881C+0x314>)
 80188ea:	6cca      	ldr	r2, [r1, #76]	@ 0x4c
 80188ec:	4002      	ands	r2, r0
 80188ee:	64ca      	str	r2, [r1, #76]	@ 0x4c
 80188f0:	6ca2      	ldr	r2, [r4, #72]	@ 0x48
 80188f2:	2a00      	cmp	r2, #0
 80188f4:	dd01      	ble.n	80188fa <fn_0801881C+0xde>
 80188f6:	3a01      	subs	r2, #1
 80188f8:	64a2      	str	r2, [r4, #72]	@ 0x48
 80188fa:	6c22      	ldr	r2, [r4, #64]	@ 0x40
 80188fc:	2a00      	cmp	r2, #0
 80188fe:	dd01      	ble.n	8018904 <fn_0801881C+0xe8>
 8018900:	3a01      	subs	r2, #1
 8018902:	6422      	str	r2, [r4, #64]	@ 0x40
 8018904:	21bc      	movs	r1, #188	@ 0xbc
 8018906:	5862      	ldr	r2, [r4, r1]
 8018908:	2a00      	cmp	r2, #0
 801890a:	d001      	beq.n	8018910 <fn_0801881C+0xf4>
 801890c:	3a01      	subs	r2, #1
 801890e:	5062      	str	r2, [r4, r1]
 8018910:	21c0      	movs	r1, #192	@ 0xc0
 8018912:	5862      	ldr	r2, [r4, r1]
 8018914:	2a00      	cmp	r2, #0
 8018916:	d001      	beq.n	801891c <fn_0801881C+0x100>
 8018918:	3a01      	subs	r2, #1
 801891a:	5062      	str	r2, [r4, r1]
 801891c:	2b80      	cmp	r3, #128	@ 0x80
 801891e:	dc1d      	bgt.n	801895c <fn_0801881C+0x140>
 8018920:	071b      	lsls	r3, r3, #28
 8018922:	d41b      	bmi.n	801895c <fn_0801881C+0x140>
 8018924:	6ca2      	ldr	r2, [r4, #72]	@ 0x48
 8018926:	2301      	movs	r3, #1
 8018928:	2a80      	cmp	r2, #128	@ 0x80
 801892a:	dd4f      	ble.n	80189cc <fn_0801881C+0x1b0>
 801892c:	22cc      	movs	r2, #204	@ 0xcc
 801892e:	50a3      	str	r3, [r4, r2]
 8018930:	b005      	add	sp, #20
 8018932:	bcf0      	pop	{r4, r5, r6, r7}
 8018934:	46bb      	mov	fp, r7
 8018936:	46b2      	mov	sl, r6
 8018938:	46a9      	mov	r9, r5
 801893a:	46a0      	mov	r8, r4
 801893c:	bcf0      	pop	{r4, r5, r6, r7}
 801893e:	bc01      	pop	{r0}
 8018940:	4700      	bx	r0
 8018942:	4a7c      	ldr	r2, [pc, #496]	@ (8018b34 <fn_0801881C+0x318>)
 8018944:	4013      	ands	r3, r2
 8018946:	e77b      	b.n	8018840 <fn_0801881C+0x24>
 8018948:	25a0      	movs	r5, #160	@ 0xa0
 801894a:	5963      	ldr	r3, [r4, r5]
 801894c:	2b00      	cmp	r3, #0
 801894e:	d1b6      	bne.n	80188be <fn_0801881C+0xa2>
 8018950:	0020      	movs	r0, r4
 8018952:	f7f7 f953 	bl	800fbfc <fn_0800FBFC>
 8018956:	2301      	movs	r3, #1
 8018958:	5163      	str	r3, [r4, r5]
 801895a:	e7b0      	b.n	80188be <fn_0801881C+0xa2>
 801895c:	2320      	movs	r3, #32
 801895e:	e7e5      	b.n	801892c <fn_0801881C+0x110>
 8018960:	0020      	movs	r0, r4
 8018962:	f7fe f833 	bl	80169cc <fn_080169CC>
 8018966:	e78b      	b.n	8018880 <fn_0801881C+0x64>
 8018968:	1da3      	adds	r3, r4, #6
 801896a:	4699      	mov	r9, r3
 801896c:	2208      	movs	r2, #8
 801896e:	5ea3      	ldrsh	r3, [r4, r2]
 8018970:	6a2a      	ldr	r2, [r5, #32]
 8018972:	041b      	lsls	r3, r3, #16
 8018974:	189b      	adds	r3, r3, r2
 8018976:	622b      	str	r3, [r5, #32]
 8018978:	6969      	ldr	r1, [r5, #20]
 801897a:	6b2a      	ldr	r2, [r5, #48]	@ 0x30
 801897c:	9301      	str	r3, [sp, #4]
 801897e:	4b6e      	ldr	r3, [pc, #440]	@ (8018b38 <fn_0801881C+0x31c>)
 8018980:	17d0      	asrs	r0, r2, #31
 8018982:	681e      	ldr	r6, [r3, #0]
 8018984:	0fcb      	lsrs	r3, r1, #31
 8018986:	428a      	cmp	r2, r1
 8018988:	4143      	adcs	r3, r0
 801898a:	486c      	ldr	r0, [pc, #432]	@ (8018b3c <fn_0801881C+0x320>)
 801898c:	5433      	strb	r3, [r6, r0]
 801898e:	2306      	movs	r3, #6
 8018990:	2007      	movs	r0, #7
 8018992:	56e3      	ldrsb	r3, [r4, r3]
 8018994:	5620      	ldrsb	r0, [r4, r0]
 8018996:	46b2      	mov	sl, r6
 8018998:	4683      	mov	fp, r0
 801899a:	4318      	orrs	r0, r3
 801899c:	d100      	bne.n	80189a0 <fn_0801881C+0x184>
 801899e:	e766      	b.n	801886e <fn_0801881C+0x52>
 80189a0:	4291      	cmp	r1, r2
 80189a2:	dc05      	bgt.n	80189b0 <fn_0801881C+0x194>
 80189a4:	2b00      	cmp	r3, #0
 80189a6:	d000      	beq.n	80189aa <fn_0801881C+0x18e>
 80189a8:	e08f      	b.n	8018aca <fn_0801881C+0x2ae>
 80189aa:	465b      	mov	r3, fp
 80189ac:	2b00      	cmp	r3, #0
 80189ae:	d161      	bne.n	8018a74 <fn_0801881C+0x258>
 80189b0:	4652      	mov	r2, sl
 80189b2:	4b63      	ldr	r3, [pc, #396]	@ (8018b40 <fn_0801881C+0x324>)
 80189b4:	58d3      	ldr	r3, [r2, r3]
 80189b6:	4a63      	ldr	r2, [pc, #396]	@ (8018b44 <fn_0801881C+0x328>)
 80189b8:	189b      	adds	r3, r3, r2
 80189ba:	6caa      	ldr	r2, [r5, #72]	@ 0x48
 80189bc:	429a      	cmp	r2, r3
 80189be:	d000      	beq.n	80189c2 <fn_0801881C+0x1a6>
 80189c0:	e755      	b.n	801886e <fn_0801881C+0x52>
 80189c2:	2196      	movs	r1, #150	@ 0x96
 80189c4:	0028      	movs	r0, r5
 80189c6:	f7f8 fc21 	bl	801120c <fn_0801120C>
 80189ca:	e750      	b.n	801886e <fn_0801881C+0x52>
 80189cc:	0712      	lsls	r2, r2, #28
 80189ce:	0fd3      	lsrs	r3, r2, #31
 80189d0:	e7ac      	b.n	801892c <fn_0801881C+0x110>
 80189d2:	0020      	movs	r0, r4
 80189d4:	f7fb f952 	bl	8013c7c <fn_08013C7C>
 80189d8:	22c0      	movs	r2, #192	@ 0xc0
 80189da:	6963      	ldr	r3, [r4, #20]
 80189dc:	02d2      	lsls	r2, r2, #11
 80189de:	4293      	cmp	r3, r2
 80189e0:	dd02      	ble.n	80189e8 <fn_0801881C+0x1cc>
 80189e2:	4a59      	ldr	r2, [pc, #356]	@ (8018b48 <fn_0801881C+0x32c>)
 80189e4:	189b      	adds	r3, r3, r2
 80189e6:	6163      	str	r3, [r4, #20]
 80189e8:	4a58      	ldr	r2, [pc, #352]	@ (8018b4c <fn_0801881C+0x330>)
 80189ea:	4293      	cmp	r3, r2
 80189ec:	dc02      	bgt.n	80189f4 <fn_0801881C+0x1d8>
 80189ee:	23c0      	movs	r3, #192	@ 0xc0
 80189f0:	02db      	lsls	r3, r3, #11
 80189f2:	6163      	str	r3, [r4, #20]
 80189f4:	2300      	movs	r3, #0
 80189f6:	6825      	ldr	r5, [r4, #0]
 80189f8:	61a3      	str	r3, [r4, #24]
 80189fa:	696a      	ldr	r2, [r5, #20]
 80189fc:	6b29      	ldr	r1, [r5, #48]	@ 0x30
 80189fe:	4b4e      	ldr	r3, [pc, #312]	@ (8018b38 <fn_0801881C+0x31c>)
 8018a00:	17ce      	asrs	r6, r1, #31
 8018a02:	6818      	ldr	r0, [r3, #0]
 8018a04:	0fd3      	lsrs	r3, r2, #31
 8018a06:	4291      	cmp	r1, r2
 8018a08:	4173      	adcs	r3, r6
 8018a0a:	4a4c      	ldr	r2, [pc, #304]	@ (8018b3c <fn_0801881C+0x320>)
 8018a0c:	5483      	strb	r3, [r0, r2]
 8018a0e:	0020      	movs	r0, r4
 8018a10:	f7ff fe84 	bl	801871c <fn_0801871C>
 8018a14:	23c4      	movs	r3, #196	@ 0xc4
 8018a16:	58e2      	ldr	r2, [r4, r3]
 8018a18:	2a00      	cmp	r2, #0
 8018a1a:	d01e      	beq.n	8018a5a <fn_0801881C+0x23e>
 8018a1c:	4295      	cmp	r5, r2
 8018a1e:	d01c      	beq.n	8018a5a <fn_0801881C+0x23e>
 8018a20:	320c      	adds	r2, #12
 8018a22:	350c      	adds	r5, #12
 8018a24:	ca0c      	ldmia	r2, {r2, r3}
 8018a26:	cd03      	ldmia	r5!, {r0, r1}
 8018a28:	4d49      	ldr	r5, [pc, #292]	@ (8018b50 <fn_0801881C+0x334>)
 8018a2a:	f00c fdf1 	bl	8025610 <fn_08025610>
 8018a2e:	46ac      	mov	ip, r5
 8018a30:	6822      	ldr	r2, [r4, #0]
 8018a32:	6a13      	ldr	r3, [r2, #32]
 8018a34:	4d47      	ldr	r5, [pc, #284]	@ (8018b54 <fn_0801881C+0x338>)
 8018a36:	1ac1      	subs	r1, r0, r3
 8018a38:	448c      	add	ip, r1
 8018a3a:	45ac      	cmp	ip, r5
 8018a3c:	d96d      	bls.n	8018b1a <fn_0801881C+0x2fe>
 8018a3e:	6210      	str	r0, [r2, #32]
 8018a40:	22bc      	movs	r2, #188	@ 0xbc
 8018a42:	58a3      	ldr	r3, [r4, r2]
 8018a44:	2b00      	cmp	r3, #0
 8018a46:	d001      	beq.n	8018a4c <fn_0801881C+0x230>
 8018a48:	3b01      	subs	r3, #1
 8018a4a:	50a3      	str	r3, [r4, r2]
 8018a4c:	2302      	movs	r3, #2
 8018a4e:	7b62      	ldrb	r2, [r4, #13]
 8018a50:	4213      	tst	r3, r2
 8018a52:	d100      	bne.n	8018a56 <fn_0801881C+0x23a>
 8018a54:	e76c      	b.n	8018930 <fn_0801881C+0x114>
 8018a56:	7123      	strb	r3, [r4, #4]
 8018a58:	e76a      	b.n	8018930 <fn_0801881C+0x114>
 8018a5a:	22bc      	movs	r2, #188	@ 0xbc
 8018a5c:	58a3      	ldr	r3, [r4, r2]
 8018a5e:	2b00      	cmp	r3, #0
 8018a60:	d0f4      	beq.n	8018a4c <fn_0801881C+0x230>
 8018a62:	e7f1      	b.n	8018a48 <fn_0801881C+0x22c>
 8018a64:	4934      	ldr	r1, [pc, #208]	@ (8018b38 <fn_0801881C+0x31c>)
 8018a66:	6808      	ldr	r0, [r1, #0]
 8018a68:	2194      	movs	r1, #148	@ 0x94
 8018a6a:	5c41      	ldrb	r1, [r0, r1]
 8018a6c:	2900      	cmp	r1, #0
 8018a6e:	d100      	bne.n	8018a72 <fn_0801881C+0x256>
 8018a70:	e71e      	b.n	80188b0 <fn_0801881C+0x94>
 8018a72:	e71b      	b.n	80188ac <fn_0801881C+0x90>
 8018a74:	22c0      	movs	r2, #192	@ 0xc0
 8018a76:	02d8      	lsls	r0, r3, #11
 8018a78:	9b01      	ldr	r3, [sp, #4]
 8018a7a:	0612      	lsls	r2, r2, #24
 8018a7c:	189b      	adds	r3, r3, r2
 8018a7e:	0cde      	lsrs	r6, r3, #19
 8018a80:	2380      	movs	r3, #128	@ 0x80
 8018a82:	011b      	lsls	r3, r3, #4
 8018a84:	4f34      	ldr	r7, [pc, #208]	@ (8018b58 <fn_0801881C+0x33c>)
 8018a86:	199b      	adds	r3, r3, r6
 8018a88:	009b      	lsls	r3, r3, #2
 8018a8a:	18fb      	adds	r3, r7, r3
 8018a8c:	6819      	ldr	r1, [r3, #0]
 8018a8e:	4680      	mov	r8, r0
 8018a90:	9301      	str	r3, [sp, #4]
 8018a92:	f00c fdfb 	bl	802568c <fn_0802568C>
 8018a96:	6a23      	ldr	r3, [r4, #32]
 8018a98:	181b      	adds	r3, r3, r0
 8018a9a:	6a62      	ldr	r2, [r4, #36]	@ 0x24
 8018a9c:	6223      	str	r3, [r4, #32]
 8018a9e:	00b3      	lsls	r3, r6, #2
 8018aa0:	59d9      	ldr	r1, [r3, r7]
 8018aa2:	4640      	mov	r0, r8
 8018aa4:	9202      	str	r2, [sp, #8]
 8018aa6:	f00c fdf1 	bl	802568c <fn_0802568C>
 8018aaa:	9a02      	ldr	r2, [sp, #8]
 8018aac:	1813      	adds	r3, r2, r0
 8018aae:	6263      	str	r3, [r4, #36]	@ 0x24
 8018ab0:	9b01      	ldr	r3, [sp, #4]
 8018ab2:	0006      	movs	r6, r0
 8018ab4:	6819      	ldr	r1, [r3, #0]
 8018ab6:	4640      	mov	r0, r8
 8018ab8:	f00c fde8 	bl	802568c <fn_0802568C>
 8018abc:	6bef      	ldr	r7, [r5, #60]	@ 0x3c
 8018abe:	19c0      	adds	r0, r0, r7
 8018ac0:	63e8      	str	r0, [r5, #60]	@ 0x3c
 8018ac2:	6c28      	ldr	r0, [r5, #64]	@ 0x40
 8018ac4:	1980      	adds	r0, r0, r6
 8018ac6:	6428      	str	r0, [r5, #64]	@ 0x40
 8018ac8:	e772      	b.n	80189b0 <fn_0801881C+0x194>
 8018aca:	02d8      	lsls	r0, r3, #11
 8018acc:	9b01      	ldr	r3, [sp, #4]
 8018ace:	0cde      	lsrs	r6, r3, #19
 8018ad0:	2380      	movs	r3, #128	@ 0x80
 8018ad2:	011b      	lsls	r3, r3, #4
 8018ad4:	4f20      	ldr	r7, [pc, #128]	@ (8018b58 <fn_0801881C+0x33c>)
 8018ad6:	199b      	adds	r3, r3, r6
 8018ad8:	009b      	lsls	r3, r3, #2
 8018ada:	18fb      	adds	r3, r7, r3
 8018adc:	6819      	ldr	r1, [r3, #0]
 8018ade:	4680      	mov	r8, r0
 8018ae0:	9302      	str	r3, [sp, #8]
 8018ae2:	f00c fdd3 	bl	802568c <fn_0802568C>
 8018ae6:	6a23      	ldr	r3, [r4, #32]
 8018ae8:	181b      	adds	r3, r3, r0
 8018aea:	6a62      	ldr	r2, [r4, #36]	@ 0x24
 8018aec:	6223      	str	r3, [r4, #32]
 8018aee:	00b3      	lsls	r3, r6, #2
 8018af0:	59d9      	ldr	r1, [r3, r7]
 8018af2:	4640      	mov	r0, r8
 8018af4:	9203      	str	r2, [sp, #12]
 8018af6:	f00c fdc9 	bl	802568c <fn_0802568C>
 8018afa:	9a03      	ldr	r2, [sp, #12]
 8018afc:	1813      	adds	r3, r2, r0
 8018afe:	6263      	str	r3, [r4, #36]	@ 0x24
 8018b00:	9b02      	ldr	r3, [sp, #8]
 8018b02:	0006      	movs	r6, r0
 8018b04:	6819      	ldr	r1, [r3, #0]
 8018b06:	4640      	mov	r0, r8
 8018b08:	f00c fdc0 	bl	802568c <fn_0802568C>
 8018b0c:	6bef      	ldr	r7, [r5, #60]	@ 0x3c
 8018b0e:	6c2b      	ldr	r3, [r5, #64]	@ 0x40
 8018b10:	19c0      	adds	r0, r0, r7
 8018b12:	199b      	adds	r3, r3, r6
 8018b14:	63e8      	str	r0, [r5, #60]	@ 0x3c
 8018b16:	642b      	str	r3, [r5, #64]	@ 0x40
 8018b18:	e747      	b.n	80189aa <fn_0801881C+0x18e>
 8018b1a:	2900      	cmp	r1, #0
 8018b1c:	db03      	blt.n	8018b26 <fn_0801881C+0x30a>
 8018b1e:	490f      	ldr	r1, [pc, #60]	@ (8018b5c <fn_0801881C+0x340>)
 8018b20:	185b      	adds	r3, r3, r1
 8018b22:	6213      	str	r3, [r2, #32]
 8018b24:	e792      	b.n	8018a4c <fn_0801881C+0x230>
 8018b26:	490a      	ldr	r1, [pc, #40]	@ (8018b50 <fn_0801881C+0x334>)
 8018b28:	185b      	adds	r3, r3, r1
 8018b2a:	6213      	str	r3, [r2, #32]
 8018b2c:	e78e      	b.n	8018a4c <fn_0801881C+0x230>
 8018b2e:	46c0      	nop			@ (mov r8, r8)
 8018b30:	fffbffff 	.word	0xfffbffff
 8018b34:	ffffefff 	.word	0xffffefff
 8018b38:	030064c4 	.word	0x030064c4
 8018b3c:	000010fc 	.word	0x000010fc
 8018b40:	0000074c 	.word	0x0000074c
 8018b44:	000005d2 	.word	0x000005d2
 8018b48:	ffff0000 	.word	0xffff0000
 8018b4c:	0005ffff 	.word	0x0005ffff
 8018b50:	fc71c71d 	.word	0xfc71c71d
 8018b54:	f8e38e3a 	.word	0xf8e38e3a
 8018b58:	081398a0 	.word	0x081398a0
 8018b5c:	038e38e3 	.word	0x038e38e3
