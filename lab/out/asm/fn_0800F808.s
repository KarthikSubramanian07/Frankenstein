fn_0800F808:
 800f808:	b5f0      	push	{r4, r5, r6, r7, lr}
 800f80a:	4645      	mov	r5, r8
 800f80c:	46de      	mov	lr, fp
 800f80e:	4657      	mov	r7, sl
 800f810:	464e      	mov	r6, r9
 800f812:	b5e0      	push	{r5, r6, r7, lr}
 800f814:	4b9f      	ldr	r3, [pc, #636]	@ (800fa94 <fn_0800F808+0x28c>)
 800f816:	681d      	ldr	r5, [r3, #0]
 800f818:	4698      	mov	r8, r3
 800f81a:	4b9f      	ldr	r3, [pc, #636]	@ (800fa98 <fn_0800F808+0x290>)
 800f81c:	b085      	sub	sp, #20
 800f81e:	50e8      	str	r0, [r5, r3]
 800f820:	2302      	movs	r3, #2
 800f822:	0004      	movs	r4, r0
 800f824:	469b      	mov	fp, r3
 800f826:	4b9d      	ldr	r3, [pc, #628]	@ (800fa9c <fn_0800F808+0x294>)
 800f828:	9303      	str	r3, [sp, #12]
 800f82a:	235b      	movs	r3, #91	@ 0x5b
 800f82c:	5ce3      	ldrb	r3, [r4, r3]
 800f82e:	68e6      	ldr	r6, [r4, #12]
 800f830:	041b      	lsls	r3, r3, #16
 800f832:	6be2      	ldr	r2, [r4, #60]	@ 0x3c
 800f834:	1af1      	subs	r1, r6, r3
 800f836:	4689      	mov	r9, r1
 800f838:	18f6      	adds	r6, r6, r3
 800f83a:	2a00      	cmp	r2, #0
 800f83c:	dc01      	bgt.n	800f842 <fn_0800F808+0x3a>
 800f83e:	46b1      	mov	r9, r6
 800f840:	000e      	movs	r6, r1
 800f842:	6927      	ldr	r7, [r4, #16]
 800f844:	1afa      	subs	r2, r7, r3
 800f846:	18ff      	adds	r7, r7, r3
 800f848:	6c23      	ldr	r3, [r4, #64]	@ 0x40
 800f84a:	4692      	mov	sl, r2
 800f84c:	2b00      	cmp	r3, #0
 800f84e:	dc01      	bgt.n	800f854 <fn_0800F808+0x4c>
 800f850:	46ba      	mov	sl, r7
 800f852:	0017      	movs	r7, r2
 800f854:	238e      	movs	r3, #142	@ 0x8e
 800f856:	4a92      	ldr	r2, [pc, #584]	@ (800faa0 <fn_0800F808+0x298>)
 800f858:	011b      	lsls	r3, r3, #4
 800f85a:	50ea      	str	r2, [r5, r3]
 800f85c:	2501      	movs	r5, #1
 800f85e:	6c23      	ldr	r3, [r4, #64]	@ 0x40
 800f860:	6be2      	ldr	r2, [r4, #60]	@ 0x3c
 800f862:	9903      	ldr	r1, [sp, #12]
 800f864:	18fb      	adds	r3, r7, r3
 800f866:	18b2      	adds	r2, r6, r2
 800f868:	0030      	movs	r0, r6
 800f86a:	9101      	str	r1, [sp, #4]
 800f86c:	9500      	str	r5, [sp, #0]
 800f86e:	0039      	movs	r1, r7
 800f870:	f001 f810 	bl	8010894 <fn_08010894>
 800f874:	4648      	mov	r0, r9
 800f876:	6c23      	ldr	r3, [r4, #64]	@ 0x40
 800f878:	9903      	ldr	r1, [sp, #12]
 800f87a:	6be2      	ldr	r2, [r4, #60]	@ 0x3c
 800f87c:	18fb      	adds	r3, r7, r3
 800f87e:	9101      	str	r1, [sp, #4]
 800f880:	0039      	movs	r1, r7
 800f882:	4657      	mov	r7, sl
 800f884:	9500      	str	r5, [sp, #0]
 800f886:	1812      	adds	r2, r2, r0
 800f888:	f001 f804 	bl	8010894 <fn_08010894>
 800f88c:	6c23      	ldr	r3, [r4, #64]	@ 0x40
 800f88e:	6be2      	ldr	r2, [r4, #60]	@ 0x3c
 800f890:	9803      	ldr	r0, [sp, #12]
 800f892:	18b2      	adds	r2, r6, r2
 800f894:	0039      	movs	r1, r7
 800f896:	9001      	str	r0, [sp, #4]
 800f898:	9500      	str	r5, [sp, #0]
 800f89a:	0030      	movs	r0, r6
 800f89c:	19db      	adds	r3, r3, r7
 800f89e:	f000 fff9 	bl	8010894 <fn_08010894>
 800f8a2:	4641      	mov	r1, r8
 800f8a4:	238e      	movs	r3, #142	@ 0x8e
 800f8a6:	680d      	ldr	r5, [r1, #0]
 800f8a8:	011b      	lsls	r3, r3, #4
 800f8aa:	58ee      	ldr	r6, [r5, r3]
 800f8ac:	4a7c      	ldr	r2, [pc, #496]	@ (800faa0 <fn_0800F808+0x298>)
 800f8ae:	4296      	cmp	r6, r2
 800f8b0:	d051      	beq.n	800f956 <fn_0800F808+0x14e>
 800f8b2:	228e      	movs	r2, #142	@ 0x8e
 800f8b4:	4b7b      	ldr	r3, [pc, #492]	@ (800faa4 <fn_0800F808+0x29c>)
 800f8b6:	0112      	lsls	r2, r2, #4
 800f8b8:	18f6      	adds	r6, r6, r3
 800f8ba:	50ae      	str	r6, [r5, r2]
 800f8bc:	2e00      	cmp	r6, #0
 800f8be:	dc6c      	bgt.n	800f99a <fn_0800F808+0x192>
 800f8c0:	429e      	cmp	r6, r3
 800f8c2:	db00      	blt.n	800f8c6 <fn_0800F808+0xbe>
 800f8c4:	e09a      	b.n	800f9fc <fn_0800F808+0x1f4>
 800f8c6:	2680      	movs	r6, #128	@ 0x80
 800f8c8:	238e      	movs	r3, #142	@ 0x8e
 800f8ca:	0276      	lsls	r6, r6, #9
 800f8cc:	011b      	lsls	r3, r3, #4
 800f8ce:	50ee      	str	r6, [r5, r3]
 800f8d0:	6be0      	ldr	r0, [r4, #60]	@ 0x3c
 800f8d2:	0031      	movs	r1, r6
 800f8d4:	f015 fe82 	bl	80255dc <fn_080255DC>
 800f8d8:	4f73      	ldr	r7, [pc, #460]	@ (800faa8 <fn_0800F808+0x2a0>)
 800f8da:	51e8      	str	r0, [r5, r7]
 800f8dc:	0031      	movs	r1, r6
 800f8de:	6c20      	ldr	r0, [r4, #64]	@ 0x40
 800f8e0:	268f      	movs	r6, #143	@ 0x8f
 800f8e2:	f015 fe7b 	bl	80255dc <fn_080255DC>
 800f8e6:	4b71      	ldr	r3, [pc, #452]	@ (800faac <fn_0800F808+0x2a4>)
 800f8e8:	0136      	lsls	r6, r6, #4
 800f8ea:	51a8      	str	r0, [r5, r6]
 800f8ec:	58e8      	ldr	r0, [r5, r3]
 800f8ee:	f7ff ff17 	bl	800f720 <fn_0800F720>
 800f8f2:	4643      	mov	r3, r8
 800f8f4:	681b      	ldr	r3, [r3, #0]
 800f8f6:	59da      	ldr	r2, [r3, r7]
 800f8f8:	63e2      	str	r2, [r4, #60]	@ 0x3c
 800f8fa:	599b      	ldr	r3, [r3, r6]
 800f8fc:	0020      	movs	r0, r4
 800f8fe:	6423      	str	r3, [r4, #64]	@ 0x40
 800f900:	f002 fc98 	bl	8012234 <fn_08012234>
 800f904:	2800      	cmp	r0, #0
 800f906:	d006      	beq.n	800f916 <fn_0800F808+0x10e>
 800f908:	0020      	movs	r0, r4
 800f90a:	f002 fc93 	bl	8012234 <fn_08012234>
 800f90e:	6803      	ldr	r3, [r0, #0]
 800f910:	42a3      	cmp	r3, r4
 800f912:	d100      	bne.n	800f916 <fn_0800F808+0x10e>
 800f914:	e091      	b.n	800fa3a <fn_0800F808+0x232>
 800f916:	4643      	mov	r3, r8
 800f918:	681f      	ldr	r7, [r3, #0]
 800f91a:	59bd      	ldr	r5, [r7, r6]
 800f91c:	2200      	movs	r2, #0
 800f91e:	4b62      	ldr	r3, [pc, #392]	@ (800faa8 <fn_0800F808+0x2a0>)
 800f920:	68e6      	ldr	r6, [r4, #12]
 800f922:	58fb      	ldr	r3, [r7, r3]
 800f924:	18f6      	adds	r6, r6, r3
 800f926:	6923      	ldr	r3, [r4, #16]
 800f928:	18ed      	adds	r5, r5, r3
 800f92a:	4b61      	ldr	r3, [pc, #388]	@ (800fab0 <fn_0800F808+0x2a8>)
 800f92c:	0031      	movs	r1, r6
 800f92e:	52fa      	strh	r2, [r7, r3]
 800f930:	0020      	movs	r0, r4
 800f932:	002a      	movs	r2, r5
 800f934:	f7ff fd4e 	bl	800f3d4 <fn_0800F3D4>
 800f938:	2800      	cmp	r0, #0
 800f93a:	d007      	beq.n	800f94c <fn_0800F808+0x144>
 800f93c:	2301      	movs	r3, #1
 800f93e:	002a      	movs	r2, r5
 800f940:	0031      	movs	r1, r6
 800f942:	0020      	movs	r0, r4
 800f944:	f7ff f840 	bl	800e9c8 <fn_0800E9C8>
 800f948:	2800      	cmp	r0, #0
 800f94a:	d11a      	bne.n	800f982 <fn_0800F808+0x17a>
 800f94c:	4643      	mov	r3, r8
 800f94e:	681d      	ldr	r5, [r3, #0]
 800f950:	465b      	mov	r3, fp
 800f952:	2b01      	cmp	r3, #1
 800f954:	d11e      	bne.n	800f994 <fn_0800F808+0x18c>
 800f956:	2200      	movs	r2, #0
 800f958:	6c23      	ldr	r3, [r4, #64]	@ 0x40
 800f95a:	6926      	ldr	r6, [r4, #16]
 800f95c:	68e7      	ldr	r7, [r4, #12]
 800f95e:	18f6      	adds	r6, r6, r3
 800f960:	4b53      	ldr	r3, [pc, #332]	@ (800fab0 <fn_0800F808+0x2a8>)
 800f962:	0039      	movs	r1, r7
 800f964:	52ea      	strh	r2, [r5, r3]
 800f966:	0020      	movs	r0, r4
 800f968:	0032      	movs	r2, r6
 800f96a:	f7ff fd33 	bl	800f3d4 <fn_0800F3D4>
 800f96e:	2800      	cmp	r0, #0
 800f970:	d04c      	beq.n	800fa0c <fn_0800F808+0x204>
 800f972:	2301      	movs	r3, #1
 800f974:	0032      	movs	r2, r6
 800f976:	0039      	movs	r1, r7
 800f978:	0020      	movs	r0, r4
 800f97a:	f7ff f825 	bl	800e9c8 <fn_0800E9C8>
 800f97e:	2800      	cmp	r0, #0
 800f980:	d044      	beq.n	800fa0c <fn_0800F808+0x204>
 800f982:	b005      	add	sp, #20
 800f984:	bcf0      	pop	{r4, r5, r6, r7}
 800f986:	46bb      	mov	fp, r7
 800f988:	46b2      	mov	sl, r6
 800f98a:	46a9      	mov	r9, r5
 800f98c:	46a0      	mov	r8, r4
 800f98e:	bcf0      	pop	{r4, r5, r6, r7}
 800f990:	bc01      	pop	{r0}
 800f992:	4700      	bx	r0
 800f994:	2301      	movs	r3, #1
 800f996:	469b      	mov	fp, r3
 800f998:	e747      	b.n	800f82a <fn_0800F808+0x22>
 800f99a:	0031      	movs	r1, r6
 800f99c:	6be0      	ldr	r0, [r4, #60]	@ 0x3c
 800f99e:	f015 fe1d 	bl	80255dc <fn_080255DC>
 800f9a2:	0007      	movs	r7, r0
 800f9a4:	0031      	movs	r1, r6
 800f9a6:	6c20      	ldr	r0, [r4, #64]	@ 0x40
 800f9a8:	f015 fe18 	bl	80255dc <fn_080255DC>
 800f9ac:	2200      	movs	r2, #0
 800f9ae:	68e6      	ldr	r6, [r4, #12]
 800f9b0:	19be      	adds	r6, r7, r6
 800f9b2:	6927      	ldr	r7, [r4, #16]
 800f9b4:	4b3e      	ldr	r3, [pc, #248]	@ (800fab0 <fn_0800F808+0x2a8>)
 800f9b6:	19c7      	adds	r7, r0, r7
 800f9b8:	52ea      	strh	r2, [r5, r3]
 800f9ba:	0031      	movs	r1, r6
 800f9bc:	003a      	movs	r2, r7
 800f9be:	0020      	movs	r0, r4
 800f9c0:	f7ff fd08 	bl	800f3d4 <fn_0800F3D4>
 800f9c4:	2800      	cmp	r0, #0
 800f9c6:	d01e      	beq.n	800fa06 <fn_0800F808+0x1fe>
 800f9c8:	2301      	movs	r3, #1
 800f9ca:	003a      	movs	r2, r7
 800f9cc:	0031      	movs	r1, r6
 800f9ce:	0020      	movs	r0, r4
 800f9d0:	f7fe fffa 	bl	800e9c8 <fn_0800E9C8>
 800f9d4:	4643      	mov	r3, r8
 800f9d6:	681d      	ldr	r5, [r3, #0]
 800f9d8:	2800      	cmp	r0, #0
 800f9da:	d0bc      	beq.n	800f956 <fn_0800F808+0x14e>
 800f9dc:	218e      	movs	r1, #142	@ 0x8e
 800f9de:	0109      	lsls	r1, r1, #4
 800f9e0:	586b      	ldr	r3, [r5, r1]
 800f9e2:	4a30      	ldr	r2, [pc, #192]	@ (800faa4 <fn_0800F808+0x29c>)
 800f9e4:	4293      	cmp	r3, r2
 800f9e6:	da00      	bge.n	800f9ea <fn_0800F808+0x1e2>
 800f9e8:	e76d      	b.n	800f8c6 <fn_0800F808+0xbe>
 800f9ea:	26f8      	movs	r6, #248	@ 0xf8
 800f9ec:	4a31      	ldr	r2, [pc, #196]	@ (800fab4 <fn_0800F808+0x2ac>)
 800f9ee:	0236      	lsls	r6, r6, #8
 800f9f0:	1af6      	subs	r6, r6, r3
 800f9f2:	506e      	str	r6, [r5, r1]
 800f9f4:	4293      	cmp	r3, r2
 800f9f6:	dc00      	bgt.n	800f9fa <fn_0800F808+0x1f2>
 800f9f8:	e76a      	b.n	800f8d0 <fn_0800F808+0xc8>
 800f9fa:	e7c2      	b.n	800f982 <fn_0800F808+0x17a>
 800f9fc:	23f8      	movs	r3, #248	@ 0xf8
 800f9fe:	021b      	lsls	r3, r3, #8
 800fa00:	1b9e      	subs	r6, r3, r6
 800fa02:	50ae      	str	r6, [r5, r2]
 800fa04:	e764      	b.n	800f8d0 <fn_0800F808+0xc8>
 800fa06:	4643      	mov	r3, r8
 800fa08:	681d      	ldr	r5, [r3, #0]
 800fa0a:	e7a4      	b.n	800f956 <fn_0800F808+0x14e>
 800fa0c:	6be3      	ldr	r3, [r4, #60]	@ 0x3c
 800fa0e:	68e5      	ldr	r5, [r4, #12]
 800fa10:	18ed      	adds	r5, r5, r3
 800fa12:	4643      	mov	r3, r8
 800fa14:	2100      	movs	r1, #0
 800fa16:	681a      	ldr	r2, [r3, #0]
 800fa18:	6926      	ldr	r6, [r4, #16]
 800fa1a:	4b25      	ldr	r3, [pc, #148]	@ (800fab0 <fn_0800F808+0x2a8>)
 800fa1c:	0020      	movs	r0, r4
 800fa1e:	52d1      	strh	r1, [r2, r3]
 800fa20:	0032      	movs	r2, r6
 800fa22:	0029      	movs	r1, r5
 800fa24:	f7ff fcd6 	bl	800f3d4 <fn_0800F3D4>
 800fa28:	2800      	cmp	r0, #0
 800fa2a:	d0aa      	beq.n	800f982 <fn_0800F808+0x17a>
 800fa2c:	2301      	movs	r3, #1
 800fa2e:	0032      	movs	r2, r6
 800fa30:	0029      	movs	r1, r5
 800fa32:	0020      	movs	r0, r4
 800fa34:	f7fe ffc8 	bl	800e9c8 <fn_0800E9C8>
 800fa38:	e7a3      	b.n	800f982 <fn_0800F808+0x17a>
 800fa3a:	0020      	movs	r0, r4
 800fa3c:	f002 fbfa 	bl	8012234 <fn_08012234>
 800fa40:	4643      	mov	r3, r8
 800fa42:	681d      	ldr	r5, [r3, #0]
 800fa44:	59ea      	ldr	r2, [r5, r7]
 800fa46:	17d3      	asrs	r3, r2, #31
 800fa48:	18d2      	adds	r2, r2, r3
 800fa4a:	405a      	eors	r2, r3
 800fa4c:	6a03      	ldr	r3, [r0, #32]
 800fa4e:	17d9      	asrs	r1, r3, #31
 800fa50:	185b      	adds	r3, r3, r1
 800fa52:	404b      	eors	r3, r1
 800fa54:	429a      	cmp	r2, r3
 800fa56:	db17      	blt.n	800fa88 <fn_0800F808+0x280>
 800fa58:	0020      	movs	r0, r4
 800fa5a:	f002 fbeb 	bl	8012234 <fn_08012234>
 800fa5e:	4643      	mov	r3, r8
 800fa60:	268f      	movs	r6, #143	@ 0x8f
 800fa62:	681f      	ldr	r7, [r3, #0]
 800fa64:	0136      	lsls	r6, r6, #4
 800fa66:	59bd      	ldr	r5, [r7, r6]
 800fa68:	17eb      	asrs	r3, r5, #31
 800fa6a:	18ea      	adds	r2, r5, r3
 800fa6c:	405a      	eors	r2, r3
 800fa6e:	6a43      	ldr	r3, [r0, #36]	@ 0x24
 800fa70:	17d9      	asrs	r1, r3, #31
 800fa72:	185b      	adds	r3, r3, r1
 800fa74:	404b      	eors	r3, r1
 800fa76:	429a      	cmp	r2, r3
 800fa78:	db00      	blt.n	800fa7c <fn_0800F808+0x274>
 800fa7a:	e74f      	b.n	800f91c <fn_0800F808+0x114>
 800fa7c:	0020      	movs	r0, r4
 800fa7e:	f002 fbd9 	bl	8012234 <fn_08012234>
 800fa82:	59bb      	ldr	r3, [r7, r6]
 800fa84:	6243      	str	r3, [r0, #36]	@ 0x24
 800fa86:	e746      	b.n	800f916 <fn_0800F808+0x10e>
 800fa88:	0020      	movs	r0, r4
 800fa8a:	f002 fbd3 	bl	8012234 <fn_08012234>
 800fa8e:	59eb      	ldr	r3, [r5, r7]
 800fa90:	6203      	str	r3, [r0, #32]
 800fa92:	e7e1      	b.n	800fa58 <fn_0800F808+0x250>
 800fa94:	030064c4 	.word	0x030064c4
 800fa98:	000008e8 	.word	0x000008e8
 800fa9c:	0800e67d 	.word	0x0800e67d
 800faa0:	00010001 	.word	0x00010001
 800faa4:	fffff800 	.word	0xfffff800
 800faa8:	000008ec 	.word	0x000008ec
 800faac:	000008e4 	.word	0x000008e4
 800fab0:	00000924 	.word	0x00000924
 800fab4:	0000f7ff 	.word	0x0000f7ff
