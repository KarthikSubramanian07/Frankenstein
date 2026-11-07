fn_080009E8:
 80009e8:	b5f0      	push	{r4, r5, r6, r7, lr}
 80009ea:	46de      	mov	lr, fp
 80009ec:	4657      	mov	r7, sl
 80009ee:	464e      	mov	r6, r9
 80009f0:	4645      	mov	r5, r8
 80009f2:	4bd3      	ldr	r3, [pc, #844]	@ (8000d40 <fn_080009E8+0x358>)
 80009f4:	b5e0      	push	{r5, r6, r7, lr}
 80009f6:	681c      	ldr	r4, [r3, #0]
 80009f8:	49d2      	ldr	r1, [pc, #840]	@ (8000d44 <fn_080009E8+0x35c>)
 80009fa:	6ce2      	ldr	r2, [r4, #76]	@ 0x4c
 80009fc:	b097      	sub	sp, #92	@ 0x5c
 80009fe:	930f      	str	r3, [sp, #60]	@ 0x3c
 8000a00:	428a      	cmp	r2, r1
 8000a02:	dc00      	bgt.n	8000a06 <fn_080009E8+0x1e>
 8000a04:	e1e8      	b.n	8000dd8 <fn_080009E8+0x3f0>
 8000a06:	2300      	movs	r3, #0
 8000a08:	0015      	movs	r5, r2
 8000a0a:	3301      	adds	r3, #1
 8000a0c:	411d      	asrs	r5, r3
 8000a0e:	428d      	cmp	r5, r1
 8000a10:	dcfa      	bgt.n	8000a08 <fn_080009E8+0x20>
 8000a12:	2214      	movs	r2, #20
 8000a14:	1ad3      	subs	r3, r2, r3
 8000a16:	9310      	str	r3, [sp, #64]	@ 0x40
 8000a18:	23e0      	movs	r3, #224	@ 0xe0
 8000a1a:	58e2      	ldr	r2, [r4, r3]
 8000a1c:	7823      	ldrb	r3, [r4, #0]
 8000a1e:	075b      	lsls	r3, r3, #29
 8000a20:	d54b      	bpl.n	8000aba <fn_080009E8+0xd2>
 8000a22:	2380      	movs	r3, #128	@ 0x80
 8000a24:	6a11      	ldr	r1, [r2, #32]
 8000a26:	05db      	lsls	r3, r3, #23
 8000a28:	1a5b      	subs	r3, r3, r1
 8000a2a:	2180      	movs	r1, #128	@ 0x80
 8000a2c:	48c6      	ldr	r0, [pc, #792]	@ (8000d48 <fn_080009E8+0x360>)
 8000a2e:	0cdb      	lsrs	r3, r3, #19
 8000a30:	0109      	lsls	r1, r1, #4
 8000a32:	1859      	adds	r1, r3, r1
 8000a34:	009b      	lsls	r3, r3, #2
 8000a36:	581b      	ldr	r3, [r3, r0]
 8000a38:	4699      	mov	r9, r3
 8000a3a:	68d3      	ldr	r3, [r2, #12]
 8000a3c:	9308      	str	r3, [sp, #32]
 8000a3e:	111b      	asrs	r3, r3, #4
 8000a40:	4698      	mov	r8, r3
 8000a42:	6917      	ldr	r7, [r2, #16]
 8000a44:	6922      	ldr	r2, [r4, #16]
 8000a46:	9209      	str	r2, [sp, #36]	@ 0x24
 8000a48:	4642      	mov	r2, r8
 8000a4a:	0089      	lsls	r1, r1, #2
 8000a4c:	5841      	ldr	r1, [r0, r1]
 8000a4e:	113b      	asrs	r3, r7, #4
 8000a50:	468b      	mov	fp, r1
 8000a52:	469a      	mov	sl, r3
 8000a54:	6961      	ldr	r1, [r4, #20]
 8000a56:	68e3      	ldr	r3, [r4, #12]
 8000a58:	1a89      	subs	r1, r1, r2
 8000a5a:	930e      	str	r3, [sp, #56]	@ 0x38
 8000a5c:	1ad3      	subs	r3, r2, r3
 8000a5e:	4299      	cmp	r1, r3
 8000a60:	da00      	bge.n	8000a64 <fn_080009E8+0x7c>
 8000a62:	e17f      	b.n	8000d64 <fn_080009E8+0x37c>
 8000a64:	4653      	mov	r3, sl
 8000a66:	9809      	ldr	r0, [sp, #36]	@ 0x24
 8000a68:	1a1b      	subs	r3, r3, r0
 8000a6a:	4650      	mov	r0, sl
 8000a6c:	69a2      	ldr	r2, [r4, #24]
 8000a6e:	1a12      	subs	r2, r2, r0
 8000a70:	429a      	cmp	r2, r3
 8000a72:	da00      	bge.n	8000a76 <fn_080009E8+0x8e>
 8000a74:	e15f      	b.n	8000d36 <fn_080009E8+0x34e>
 8000a76:	4291      	cmp	r1, r2
 8000a78:	dd00      	ble.n	8000a7c <fn_080009E8+0x94>
 8000a7a:	e154      	b.n	8000d26 <fn_080009E8+0x33e>
 8000a7c:	0fcb      	lsrs	r3, r1, #31
 8000a7e:	185b      	adds	r3, r3, r1
 8000a80:	105b      	asrs	r3, r3, #1
 8000a82:	189b      	adds	r3, r3, r2
 8000a84:	2280      	movs	r2, #128	@ 0x80
 8000a86:	0152      	lsls	r2, r2, #5
 8000a88:	189b      	adds	r3, r3, r2
 8000a8a:	4642      	mov	r2, r8
 8000a8c:	1ad2      	subs	r2, r2, r3
 8000a8e:	920a      	str	r2, [sp, #40]	@ 0x28
 8000a90:	001a      	movs	r2, r3
 8000a92:	4442      	add	r2, r8
 8000a94:	920b      	str	r2, [sp, #44]	@ 0x2c
 8000a96:	4652      	mov	r2, sl
 8000a98:	1ad2      	subs	r2, r2, r3
 8000a9a:	4453      	add	r3, sl
 8000a9c:	930d      	str	r3, [sp, #52]	@ 0x34
 8000a9e:	4bab      	ldr	r3, [pc, #684]	@ (8000d4c <fn_080009E8+0x364>)
 8000aa0:	58e6      	ldr	r6, [r4, r3]
 8000aa2:	920c      	str	r2, [sp, #48]	@ 0x30
 8000aa4:	2e00      	cmp	r6, #0
 8000aa6:	dc22      	bgt.n	8000aee <fn_080009E8+0x106>
 8000aa8:	b017      	add	sp, #92	@ 0x5c
 8000aaa:	bcf0      	pop	{r4, r5, r6, r7}
 8000aac:	46bb      	mov	fp, r7
 8000aae:	46b2      	mov	sl, r6
 8000ab0:	46a9      	mov	r9, r5
 8000ab2:	46a0      	mov	r8, r4
 8000ab4:	bcf0      	pop	{r4, r5, r6, r7}
 8000ab6:	bc01      	pop	{r0}
 8000ab8:	4700      	bx	r0
 8000aba:	68d3      	ldr	r3, [r2, #12]
 8000abc:	6917      	ldr	r7, [r2, #16]
 8000abe:	9308      	str	r3, [sp, #32]
 8000ac0:	111b      	asrs	r3, r3, #4
 8000ac2:	4698      	mov	r8, r3
 8000ac4:	113b      	asrs	r3, r7, #4
 8000ac6:	469a      	mov	sl, r3
 8000ac8:	68e3      	ldr	r3, [r4, #12]
 8000aca:	930a      	str	r3, [sp, #40]	@ 0x28
 8000acc:	930e      	str	r3, [sp, #56]	@ 0x38
 8000ace:	2300      	movs	r3, #0
 8000ad0:	4699      	mov	r9, r3
 8000ad2:	2380      	movs	r3, #128	@ 0x80
 8000ad4:	025b      	lsls	r3, r3, #9
 8000ad6:	6961      	ldr	r1, [r4, #20]
 8000ad8:	469b      	mov	fp, r3
 8000ada:	4b9c      	ldr	r3, [pc, #624]	@ (8000d4c <fn_080009E8+0x364>)
 8000adc:	6922      	ldr	r2, [r4, #16]
 8000ade:	910b      	str	r1, [sp, #44]	@ 0x2c
 8000ae0:	58e6      	ldr	r6, [r4, r3]
 8000ae2:	69a1      	ldr	r1, [r4, #24]
 8000ae4:	920c      	str	r2, [sp, #48]	@ 0x30
 8000ae6:	910d      	str	r1, [sp, #52]	@ 0x34
 8000ae8:	9209      	str	r2, [sp, #36]	@ 0x24
 8000aea:	2e00      	cmp	r6, #0
 8000aec:	dddc      	ble.n	8000aa8 <fn_080009E8+0xc0>
 8000aee:	4659      	mov	r1, fp
 8000af0:	0028      	movs	r0, r5
 8000af2:	f024 fd73 	bl	80255dc <fn_080255DC>
 8000af6:	4649      	mov	r1, r9
 8000af8:	9014      	str	r0, [sp, #80]	@ 0x50
 8000afa:	0028      	movs	r0, r5
 8000afc:	f024 fd6e 	bl	80255dc <fn_080255DC>
 8000b00:	9b08      	ldr	r3, [sp, #32]
 8000b02:	141b      	asrs	r3, r3, #16
 8000b04:	9312      	str	r3, [sp, #72]	@ 0x48
 8000b06:	143b      	asrs	r3, r7, #16
 8000b08:	9313      	str	r3, [sp, #76]	@ 0x4c
 8000b0a:	4643      	mov	r3, r8
 8000b0c:	4652      	mov	r2, sl
 8000b0e:	051b      	lsls	r3, r3, #20
 8000b10:	0d1b      	lsrs	r3, r3, #20
 8000b12:	425b      	negs	r3, r3
 8000b14:	4659      	mov	r1, fp
 8000b16:	9015      	str	r0, [sp, #84]	@ 0x54
 8000b18:	0018      	movs	r0, r3
 8000b1a:	9308      	str	r3, [sp, #32]
 8000b1c:	0517      	lsls	r7, r2, #20
 8000b1e:	f024 fd5d 	bl	80255dc <fn_080255DC>
 8000b22:	0d3f      	lsrs	r7, r7, #20
 8000b24:	427f      	negs	r7, r7
 8000b26:	4649      	mov	r1, r9
 8000b28:	9011      	str	r0, [sp, #68]	@ 0x44
 8000b2a:	0038      	movs	r0, r7
 8000b2c:	f024 fd56 	bl	80255dc <fn_080255DC>
 8000b30:	9a11      	ldr	r2, [sp, #68]	@ 0x44
 8000b32:	1a10      	subs	r0, r2, r0
 8000b34:	9a0e      	ldr	r2, [sp, #56]	@ 0x38
 8000b36:	4440      	add	r0, r8
 8000b38:	1a82      	subs	r2, r0, r2
 8000b3a:	4649      	mov	r1, r9
 8000b3c:	9808      	ldr	r0, [sp, #32]
 8000b3e:	4690      	mov	r8, r2
 8000b40:	f024 fd4c 	bl	80255dc <fn_080255DC>
 8000b44:	4659      	mov	r1, fp
 8000b46:	4681      	mov	r9, r0
 8000b48:	0038      	movs	r0, r7
 8000b4a:	f024 fd47 	bl	80255dc <fn_080255DC>
 8000b4e:	4448      	add	r0, r9
 8000b50:	0007      	movs	r7, r0
 8000b52:	9b09      	ldr	r3, [sp, #36]	@ 0x24
 8000b54:	0029      	movs	r1, r5
 8000b56:	4640      	mov	r0, r8
 8000b58:	4457      	add	r7, sl
 8000b5a:	1aff      	subs	r7, r7, r3
 8000b5c:	f024 fd3e 	bl	80255dc <fn_080255DC>
 8000b60:	0029      	movs	r1, r5
 8000b62:	0103      	lsls	r3, r0, #4
 8000b64:	0038      	movs	r0, r7
 8000b66:	930e      	str	r3, [sp, #56]	@ 0x38
 8000b68:	f024 fd38 	bl	80255dc <fn_080255DC>
 8000b6c:	0103      	lsls	r3, r0, #4
 8000b6e:	9311      	str	r3, [sp, #68]	@ 0x44
 8000b70:	9b0a      	ldr	r3, [sp, #40]	@ 0x28
 8000b72:	131b      	asrs	r3, r3, #12
 8000b74:	9308      	str	r3, [sp, #32]
 8000b76:	9b0b      	ldr	r3, [sp, #44]	@ 0x2c
 8000b78:	131b      	asrs	r3, r3, #12
 8000b7a:	930a      	str	r3, [sp, #40]	@ 0x28
 8000b7c:	9b0c      	ldr	r3, [sp, #48]	@ 0x30
 8000b7e:	131b      	asrs	r3, r3, #12
 8000b80:	930b      	str	r3, [sp, #44]	@ 0x2c
 8000b82:	9b0d      	ldr	r3, [sp, #52]	@ 0x34
 8000b84:	131b      	asrs	r3, r3, #12
 8000b86:	930c      	str	r3, [sp, #48]	@ 0x30
 8000b88:	2392      	movs	r3, #146	@ 0x92
 8000b8a:	005b      	lsls	r3, r3, #1
 8000b8c:	58e3      	ldr	r3, [r4, r3]
 8000b8e:	9309      	str	r3, [sp, #36]	@ 0x24
 8000b90:	4b6f      	ldr	r3, [pc, #444]	@ (8000d50 <fn_080009E8+0x368>)
 8000b92:	469a      	mov	sl, r3
 8000b94:	2320      	movs	r3, #32
 8000b96:	4699      	mov	r9, r3
 8000b98:	2301      	movs	r3, #1
 8000b9a:	2700      	movs	r7, #0
 8000b9c:	4698      	mov	r8, r3
 8000b9e:	4653      	mov	r3, sl
 8000ba0:	4649      	mov	r1, r9
 8000ba2:	4640      	mov	r0, r8
 8000ba4:	58e2      	ldr	r2, [r4, r3]
 8000ba6:	00bb      	lsls	r3, r7, #2
 8000ba8:	18d3      	adds	r3, r2, r3
 8000baa:	78db      	ldrb	r3, [r3, #3]
 8000bac:	400b      	ands	r3, r1
 8000bae:	0699      	lsls	r1, r3, #26
 8000bb0:	0fc9      	lsrs	r1, r1, #31
 8000bb2:	4041      	eors	r1, r0
 8000bb4:	0609      	lsls	r1, r1, #24
 8000bb6:	d003      	beq.n	8000bc0 <fn_080009E8+0x1d8>
 8000bb8:	9909      	ldr	r1, [sp, #36]	@ 0x24
 8000bba:	2900      	cmp	r1, #0
 8000bbc:	d100      	bne.n	8000bc0 <fn_080009E8+0x1d8>
 8000bbe:	e082      	b.n	8000cc6 <fn_080009E8+0x2de>
 8000bc0:	20e0      	movs	r0, #224	@ 0xe0
 8000bc2:	0100      	lsls	r0, r0, #4
 8000bc4:	5825      	ldr	r5, [r4, r0]
 8000bc6:	0179      	lsls	r1, r7, #5
 8000bc8:	186d      	adds	r5, r5, r1
 8000bca:	2012      	movs	r0, #18
 8000bcc:	5e29      	ldrsh	r1, [r5, r0]
 8000bce:	9808      	ldr	r0, [sp, #32]
 8000bd0:	4281      	cmp	r1, r0
 8000bd2:	db78      	blt.n	8000cc6 <fn_080009E8+0x2de>
 8000bd4:	2010      	movs	r0, #16
 8000bd6:	5e29      	ldrsh	r1, [r5, r0]
 8000bd8:	980a      	ldr	r0, [sp, #40]	@ 0x28
 8000bda:	4281      	cmp	r1, r0
 8000bdc:	dc73      	bgt.n	8000cc6 <fn_080009E8+0x2de>
 8000bde:	200c      	movs	r0, #12
 8000be0:	5e29      	ldrsh	r1, [r5, r0]
 8000be2:	980b      	ldr	r0, [sp, #44]	@ 0x2c
 8000be4:	4281      	cmp	r1, r0
 8000be6:	db6e      	blt.n	8000cc6 <fn_080009E8+0x2de>
 8000be8:	200e      	movs	r0, #14
 8000bea:	5e29      	ldrsh	r1, [r5, r0]
 8000bec:	980c      	ldr	r0, [sp, #48]	@ 0x30
 8000bee:	4281      	cmp	r1, r0
 8000bf0:	dc69      	bgt.n	8000cc6 <fn_080009E8+0x2de>
 8000bf2:	8b29      	ldrh	r1, [r5, #24]
 8000bf4:	468c      	mov	ip, r1
 8000bf6:	0609      	lsls	r1, r1, #24
 8000bf8:	d465      	bmi.n	8000cc6 <fn_080009E8+0x2de>
 8000bfa:	20df      	movs	r0, #223	@ 0xdf
 8000bfc:	0100      	lsls	r0, r0, #4
 8000bfe:	5826      	ldr	r6, [r4, r0]
 8000c00:	4854      	ldr	r0, [pc, #336]	@ (8000d54 <fn_080009E8+0x36c>)
 8000c02:	8ae9      	ldrh	r1, [r5, #22]
 8000c04:	5820      	ldr	r0, [r4, r0]
 8000c06:	4c54      	ldr	r4, [pc, #336]	@ (8000d58 <fn_080009E8+0x370>)
 8000c08:	46b3      	mov	fp, r6
 8000c0a:	42a1      	cmp	r1, r4
 8000c0c:	d100      	bne.n	8000c10 <fn_080009E8+0x228>
 8000c0e:	e0c0      	b.n	8000d92 <fn_080009E8+0x3aa>
 8000c10:	004c      	lsls	r4, r1, #1
 8000c12:	1864      	adds	r4, r4, r1
 8000c14:	00a4      	lsls	r4, r4, #2
 8000c16:	1904      	adds	r4, r0, r4
 8000c18:	8961      	ldrh	r1, [r4, #10]
 8000c1a:	008c      	lsls	r4, r1, #2
 8000c1c:	1864      	adds	r4, r4, r1
 8000c1e:	00e4      	lsls	r4, r4, #3
 8000c20:	445c      	add	r4, fp
 8000c22:	8aae      	ldrh	r6, [r5, #20]
 8000c24:	0071      	lsls	r1, r6, #1
 8000c26:	1989      	adds	r1, r1, r6
 8000c28:	0089      	lsls	r1, r1, #2
 8000c2a:	1840      	adds	r0, r0, r1
 8000c2c:	8940      	ldrh	r0, [r0, #10]
 8000c2e:	0081      	lsls	r1, r0, #2
 8000c30:	1809      	adds	r1, r1, r0
 8000c32:	4658      	mov	r0, fp
 8000c34:	00c9      	lsls	r1, r1, #3
 8000c36:	1846      	adds	r6, r0, r1
 8000c38:	8be9      	ldrh	r1, [r5, #30]
 8000c3a:	0089      	lsls	r1, r1, #2
 8000c3c:	1852      	adds	r2, r2, r1
 8000c3e:	78d2      	ldrb	r2, [r2, #3]
 8000c40:	0651      	lsls	r1, r2, #25
 8000c42:	d445      	bmi.n	8000cd0 <fn_080009E8+0x2e8>
 8000c44:	2b00      	cmp	r3, #0
 8000c46:	d100      	bne.n	8000c4a <fn_080009E8+0x262>
 8000c48:	e0a5      	b.n	8000d96 <fn_080009E8+0x3ae>
 8000c4a:	4663      	mov	r3, ip
 8000c4c:	069b      	lsls	r3, r3, #26
 8000c4e:	d500      	bpl.n	8000c52 <fn_080009E8+0x26a>
 8000c50:	e093      	b.n	8000d7a <fn_080009E8+0x392>
 8000c52:	211a      	movs	r1, #26
 8000c54:	5e6b      	ldrsh	r3, [r5, r1]
 8000c56:	09d2      	lsrs	r2, r2, #7
 8000c58:	0212      	lsls	r2, r2, #8
 8000c5a:	405a      	eors	r2, r3
 8000c5c:	4b3f      	ldr	r3, [pc, #252]	@ (8000d5c <fn_080009E8+0x374>)
 8000c5e:	18d1      	adds	r1, r2, r3
 8000c60:	4b3f      	ldr	r3, [pc, #252]	@ (8000d60 <fn_080009E8+0x378>)
 8000c62:	4299      	cmp	r1, r3
 8000c64:	d900      	bls.n	8000c68 <fn_080009E8+0x280>
 8000c66:	e0da      	b.n	8000e1e <fn_080009E8+0x436>
 8000c68:	2381      	movs	r3, #129	@ 0x81
 8000c6a:	05d2      	lsls	r2, r2, #23
 8000c6c:	0f50      	lsrs	r0, r2, #29
 8000c6e:	40c3      	lsrs	r3, r0
 8000c70:	07db      	lsls	r3, r3, #31
 8000c72:	d500      	bpl.n	8000c76 <fn_080009E8+0x28e>
 8000c74:	e0a6      	b.n	8000dc4 <fn_080009E8+0x3dc>
 8000c76:	2103      	movs	r1, #3
 8000c78:	3801      	subs	r0, #1
 8000c7a:	f024 fc35 	bl	80254e8 <fn_080254E8>
 8000c7e:	2901      	cmp	r1, #1
 8000c80:	d100      	bne.n	8000c84 <fn_080009E8+0x29c>
 8000c82:	e0df      	b.n	8000e44 <fn_080009E8+0x45c>
 8000c84:	2902      	cmp	r1, #2
 8000c86:	d100      	bne.n	8000c8a <fn_080009E8+0x2a2>
 8000c88:	e092      	b.n	8000db0 <fn_080009E8+0x3c8>
 8000c8a:	2206      	movs	r2, #6
 8000c8c:	5eab      	ldrsh	r3, [r5, r2]
 8000c8e:	2104      	movs	r1, #4
 8000c90:	5e6a      	ldrsh	r2, [r5, r1]
 8000c92:	2002      	movs	r0, #2
 8000c94:	5e29      	ldrsh	r1, [r5, r0]
 8000c96:	2400      	movs	r4, #0
 8000c98:	5f28      	ldrsh	r0, [r5, r4]
 8000c9a:	24af      	movs	r4, #175	@ 0xaf
 8000c9c:	9407      	str	r4, [sp, #28]
 8000c9e:	9c10      	ldr	r4, [sp, #64]	@ 0x40
 8000ca0:	9406      	str	r4, [sp, #24]
 8000ca2:	9c11      	ldr	r4, [sp, #68]	@ 0x44
 8000ca4:	9405      	str	r4, [sp, #20]
 8000ca6:	9c0e      	ldr	r4, [sp, #56]	@ 0x38
 8000ca8:	9404      	str	r4, [sp, #16]
 8000caa:	9c13      	ldr	r4, [sp, #76]	@ 0x4c
 8000cac:	9403      	str	r4, [sp, #12]
 8000cae:	9c12      	ldr	r4, [sp, #72]	@ 0x48
 8000cb0:	9402      	str	r4, [sp, #8]
 8000cb2:	9c15      	ldr	r4, [sp, #84]	@ 0x54
 8000cb4:	9401      	str	r4, [sp, #4]
 8000cb6:	9c14      	ldr	r4, [sp, #80]	@ 0x50
 8000cb8:	9400      	str	r4, [sp, #0]
 8000cba:	f7ff fce9 	bl	8000690 <fn_08000690>
 8000cbe:	9b0f      	ldr	r3, [sp, #60]	@ 0x3c
 8000cc0:	681c      	ldr	r4, [r3, #0]
 8000cc2:	4b22      	ldr	r3, [pc, #136]	@ (8000d4c <fn_080009E8+0x364>)
 8000cc4:	58e6      	ldr	r6, [r4, r3]
 8000cc6:	3701      	adds	r7, #1
 8000cc8:	42b7      	cmp	r7, r6
 8000cca:	da00      	bge.n	8000cce <fn_080009E8+0x2e6>
 8000ccc:	e767      	b.n	8000b9e <fn_080009E8+0x1b6>
 8000cce:	e6eb      	b.n	8000aa8 <fn_080009E8+0xc0>
 8000cd0:	2b00      	cmp	r3, #0
 8000cd2:	d060      	beq.n	8000d96 <fn_080009E8+0x3ae>
 8000cd4:	4663      	mov	r3, ip
 8000cd6:	069b      	lsls	r3, r3, #26
 8000cd8:	d44f      	bmi.n	8000d7a <fn_080009E8+0x392>
 8000cda:	2c00      	cmp	r4, #0
 8000cdc:	d100      	bne.n	8000ce0 <fn_080009E8+0x2f8>
 8000cde:	e07f      	b.n	8000de0 <fn_080009E8+0x3f8>
 8000ce0:	6822      	ldr	r2, [r4, #0]
 8000ce2:	6863      	ldr	r3, [r4, #4]
 8000ce4:	429a      	cmp	r2, r3
 8000ce6:	d06d      	beq.n	8000dc4 <fn_080009E8+0x3dc>
 8000ce8:	6832      	ldr	r2, [r6, #0]
 8000cea:	6873      	ldr	r3, [r6, #4]
 8000cec:	429a      	cmp	r2, r3
 8000cee:	d069      	beq.n	8000dc4 <fn_080009E8+0x3dc>
 8000cf0:	0030      	movs	r0, r6
 8000cf2:	f014 fc07 	bl	8015504 <fn_08015504>
 8000cf6:	2800      	cmp	r0, #0
 8000cf8:	d000      	beq.n	8000cfc <fn_080009E8+0x314>
 8000cfa:	e0af      	b.n	8000e5c <fn_080009E8+0x474>
 8000cfc:	0020      	movs	r0, r4
 8000cfe:	f014 fc01 	bl	8015504 <fn_08015504>
 8000d02:	2800      	cmp	r0, #0
 8000d04:	d000      	beq.n	8000d08 <fn_080009E8+0x320>
 8000d06:	e0a9      	b.n	8000e5c <fn_080009E8+0x474>
 8000d08:	6822      	ldr	r2, [r4, #0]
 8000d0a:	6833      	ldr	r3, [r6, #0]
 8000d0c:	429a      	cmp	r2, r3
 8000d0e:	d100      	bne.n	8000d12 <fn_080009E8+0x32a>
 8000d10:	e0ae      	b.n	8000e70 <fn_080009E8+0x488>
 8000d12:	2206      	movs	r2, #6
 8000d14:	5eab      	ldrsh	r3, [r5, r2]
 8000d16:	2104      	movs	r1, #4
 8000d18:	5e6a      	ldrsh	r2, [r5, r1]
 8000d1a:	2002      	movs	r0, #2
 8000d1c:	5e29      	ldrsh	r1, [r5, r0]
 8000d1e:	2400      	movs	r4, #0
 8000d20:	5f28      	ldrsh	r0, [r5, r4]
 8000d22:	2437      	movs	r4, #55	@ 0x37
 8000d24:	e7ba      	b.n	8000c9c <fn_080009E8+0x2b4>
 8000d26:	0fd3      	lsrs	r3, r2, #31
 8000d28:	189b      	adds	r3, r3, r2
 8000d2a:	2280      	movs	r2, #128	@ 0x80
 8000d2c:	105b      	asrs	r3, r3, #1
 8000d2e:	185b      	adds	r3, r3, r1
 8000d30:	0152      	lsls	r2, r2, #5
 8000d32:	189b      	adds	r3, r3, r2
 8000d34:	e6a9      	b.n	8000a8a <fn_080009E8+0xa2>
 8000d36:	001a      	movs	r2, r3
 8000d38:	4291      	cmp	r1, r2
 8000d3a:	dc00      	bgt.n	8000d3e <fn_080009E8+0x356>
 8000d3c:	e69e      	b.n	8000a7c <fn_080009E8+0x94>
 8000d3e:	e7f2      	b.n	8000d26 <fn_080009E8+0x33e>
 8000d40:	030064c4 	.word	0x030064c4
 8000d44:	00003fff 	.word	0x00003fff
 8000d48:	081397cc 	.word	0x081397cc
 8000d4c:	00000dfc 	.word	0x00000dfc
 8000d50:	00000e04 	.word	0x00000e04
 8000d54:	00000e0c 	.word	0x00000e0c
 8000d58:	0000ffff 	.word	0x0000ffff
 8000d5c:	ffffc800 	.word	0xffffc800
 8000d60:	000003ff 	.word	0x000003ff
 8000d64:	0019      	movs	r1, r3
 8000d66:	4653      	mov	r3, sl
 8000d68:	9809      	ldr	r0, [sp, #36]	@ 0x24
 8000d6a:	1a1b      	subs	r3, r3, r0
 8000d6c:	4650      	mov	r0, sl
 8000d6e:	69a2      	ldr	r2, [r4, #24]
 8000d70:	1a12      	subs	r2, r2, r0
 8000d72:	429a      	cmp	r2, r3
 8000d74:	db00      	blt.n	8000d78 <fn_080009E8+0x390>
 8000d76:	e67e      	b.n	8000a76 <fn_080009E8+0x8e>
 8000d78:	e7dd      	b.n	8000d36 <fn_080009E8+0x34e>
 8000d7a:	2c00      	cmp	r4, #0
 8000d7c:	d030      	beq.n	8000de0 <fn_080009E8+0x3f8>
 8000d7e:	2206      	movs	r2, #6
 8000d80:	5eab      	ldrsh	r3, [r5, r2]
 8000d82:	2104      	movs	r1, #4
 8000d84:	5e6a      	ldrsh	r2, [r5, r1]
 8000d86:	2002      	movs	r0, #2
 8000d88:	5e29      	ldrsh	r1, [r5, r0]
 8000d8a:	2400      	movs	r4, #0
 8000d8c:	5f28      	ldrsh	r0, [r5, r4]
 8000d8e:	2417      	movs	r4, #23
 8000d90:	e784      	b.n	8000c9c <fn_080009E8+0x2b4>
 8000d92:	2400      	movs	r4, #0
 8000d94:	e745      	b.n	8000c22 <fn_080009E8+0x23a>
 8000d96:	2206      	movs	r2, #6
 8000d98:	5eab      	ldrsh	r3, [r5, r2]
 8000d9a:	2104      	movs	r1, #4
 8000d9c:	5e6a      	ldrsh	r2, [r5, r1]
 8000d9e:	2002      	movs	r0, #2
 8000da0:	5e29      	ldrsh	r1, [r5, r0]
 8000da2:	2400      	movs	r4, #0
 8000da4:	5f28      	ldrsh	r0, [r5, r4]
 8000da6:	2468      	movs	r4, #104	@ 0x68
 8000da8:	e778      	b.n	8000c9c <fn_080009E8+0x2b4>
 8000daa:	3a88      	subs	r2, #136	@ 0x88
 8000dac:	2a01      	cmp	r2, #1
 8000dae:	d894      	bhi.n	8000cda <fn_080009E8+0x2f2>
 8000db0:	2206      	movs	r2, #6
 8000db2:	5eab      	ldrsh	r3, [r5, r2]
 8000db4:	2104      	movs	r1, #4
 8000db6:	5e6a      	ldrsh	r2, [r5, r1]
 8000db8:	2002      	movs	r0, #2
 8000dba:	5e29      	ldrsh	r1, [r5, r0]
 8000dbc:	2400      	movs	r4, #0
 8000dbe:	5f28      	ldrsh	r0, [r5, r4]
 8000dc0:	24e7      	movs	r4, #231	@ 0xe7
 8000dc2:	e76b      	b.n	8000c9c <fn_080009E8+0x2b4>
 8000dc4:	2206      	movs	r2, #6
 8000dc6:	5eab      	ldrsh	r3, [r5, r2]
 8000dc8:	2104      	movs	r1, #4
 8000dca:	5e6a      	ldrsh	r2, [r5, r1]
 8000dcc:	2002      	movs	r0, #2
 8000dce:	5e29      	ldrsh	r1, [r5, r0]
 8000dd0:	2400      	movs	r4, #0
 8000dd2:	5f28      	ldrsh	r0, [r5, r4]
 8000dd4:	24d0      	movs	r4, #208	@ 0xd0
 8000dd6:	e761      	b.n	8000c9c <fn_080009E8+0x2b4>
 8000dd8:	2314      	movs	r3, #20
 8000dda:	0015      	movs	r5, r2
 8000ddc:	9310      	str	r3, [sp, #64]	@ 0x40
 8000dde:	e61b      	b.n	8000a18 <fn_080009E8+0x30>
 8000de0:	0030      	movs	r0, r6
 8000de2:	f014 fb8f 	bl	8015504 <fn_08015504>
 8000de6:	2300      	movs	r3, #0
 8000de8:	5eec      	ldrsh	r4, [r5, r3]
 8000dea:	2302      	movs	r3, #2
 8000dec:	5ee9      	ldrsh	r1, [r5, r3]
 8000dee:	2304      	movs	r3, #4
 8000df0:	5eea      	ldrsh	r2, [r5, r3]
 8000df2:	2306      	movs	r3, #6
 8000df4:	5eeb      	ldrsh	r3, [r5, r3]
 8000df6:	2800      	cmp	r0, #0
 8000df8:	d12e      	bne.n	8000e58 <fn_080009E8+0x470>
 8000dfa:	2017      	movs	r0, #23
 8000dfc:	9007      	str	r0, [sp, #28]
 8000dfe:	9810      	ldr	r0, [sp, #64]	@ 0x40
 8000e00:	9006      	str	r0, [sp, #24]
 8000e02:	9811      	ldr	r0, [sp, #68]	@ 0x44
 8000e04:	9005      	str	r0, [sp, #20]
 8000e06:	980e      	ldr	r0, [sp, #56]	@ 0x38
 8000e08:	9004      	str	r0, [sp, #16]
 8000e0a:	9813      	ldr	r0, [sp, #76]	@ 0x4c
 8000e0c:	9003      	str	r0, [sp, #12]
 8000e0e:	9812      	ldr	r0, [sp, #72]	@ 0x48
 8000e10:	9002      	str	r0, [sp, #8]
 8000e12:	9815      	ldr	r0, [sp, #84]	@ 0x54
 8000e14:	9001      	str	r0, [sp, #4]
 8000e16:	9814      	ldr	r0, [sp, #80]	@ 0x50
 8000e18:	9000      	str	r0, [sp, #0]
 8000e1a:	0020      	movs	r0, r4
 8000e1c:	e74d      	b.n	8000cba <fn_080009E8+0x2d2>
 8000e1e:	2a22      	cmp	r2, #34	@ 0x22
 8000e20:	dc35      	bgt.n	8000e8e <fn_080009E8+0x4a6>
 8000e22:	2a19      	cmp	r2, #25
 8000e24:	dc00      	bgt.n	8000e28 <fn_080009E8+0x440>
 8000e26:	e758      	b.n	8000cda <fn_080009E8+0x2f2>
 8000e28:	2301      	movs	r3, #1
 8000e2a:	3a1a      	subs	r2, #26
 8000e2c:	4093      	lsls	r3, r2
 8000e2e:	2284      	movs	r2, #132	@ 0x84
 8000e30:	4213      	tst	r3, r2
 8000e32:	d000      	beq.n	8000e36 <fn_080009E8+0x44e>
 8000e34:	e729      	b.n	8000c8a <fn_080009E8+0x2a2>
 8000e36:	327e      	adds	r2, #126	@ 0x7e
 8000e38:	4213      	tst	r3, r2
 8000e3a:	d1b9      	bne.n	8000db0 <fn_080009E8+0x3c8>
 8000e3c:	3ac1      	subs	r2, #193	@ 0xc1
 8000e3e:	4213      	tst	r3, r2
 8000e40:	d100      	bne.n	8000e44 <fn_080009E8+0x45c>
 8000e42:	e74a      	b.n	8000cda <fn_080009E8+0x2f2>
 8000e44:	2206      	movs	r2, #6
 8000e46:	5eab      	ldrsh	r3, [r5, r2]
 8000e48:	2104      	movs	r1, #4
 8000e4a:	5e6a      	ldrsh	r2, [r5, r1]
 8000e4c:	2002      	movs	r0, #2
 8000e4e:	5e29      	ldrsh	r1, [r5, r0]
 8000e50:	2400      	movs	r4, #0
 8000e52:	5f28      	ldrsh	r0, [r5, r4]
 8000e54:	24cc      	movs	r4, #204	@ 0xcc
 8000e56:	e721      	b.n	8000c9c <fn_080009E8+0x2b4>
 8000e58:	20fc      	movs	r0, #252	@ 0xfc
 8000e5a:	e7cf      	b.n	8000dfc <fn_080009E8+0x414>
 8000e5c:	2206      	movs	r2, #6
 8000e5e:	5eab      	ldrsh	r3, [r5, r2]
 8000e60:	2104      	movs	r1, #4
 8000e62:	5e6a      	ldrsh	r2, [r5, r1]
 8000e64:	2002      	movs	r0, #2
 8000e66:	5e29      	ldrsh	r1, [r5, r0]
 8000e68:	2400      	movs	r4, #0
 8000e6a:	5f28      	ldrsh	r0, [r5, r4]
 8000e6c:	24fc      	movs	r4, #252	@ 0xfc
 8000e6e:	e715      	b.n	8000c9c <fn_080009E8+0x2b4>
 8000e70:	6862      	ldr	r2, [r4, #4]
 8000e72:	6873      	ldr	r3, [r6, #4]
 8000e74:	429a      	cmp	r2, r3
 8000e76:	d100      	bne.n	8000e7a <fn_080009E8+0x492>
 8000e78:	e721      	b.n	8000cbe <fn_080009E8+0x2d6>
 8000e7a:	2206      	movs	r2, #6
 8000e7c:	5eab      	ldrsh	r3, [r5, r2]
 8000e7e:	2104      	movs	r1, #4
 8000e80:	5e6a      	ldrsh	r2, [r5, r1]
 8000e82:	2002      	movs	r0, #2
 8000e84:	5e29      	ldrsh	r1, [r5, r0]
 8000e86:	2400      	movs	r4, #0
 8000e88:	5f28      	ldrsh	r0, [r5, r4]
 8000e8a:	24d7      	movs	r4, #215	@ 0xd7
 8000e8c:	e706      	b.n	8000c9c <fn_080009E8+0x2b4>
 8000e8e:	2a87      	cmp	r2, #135	@ 0x87
 8000e90:	dc8b      	bgt.n	8000daa <fn_080009E8+0x3c2>
 8000e92:	2a85      	cmp	r2, #133	@ 0x85
 8000e94:	dd00      	ble.n	8000e98 <fn_080009E8+0x4b0>
 8000e96:	e6f8      	b.n	8000c8a <fn_080009E8+0x2a2>
 8000e98:	2a63      	cmp	r2, #99	@ 0x63
 8000e9a:	d0d3      	beq.n	8000e44 <fn_080009E8+0x45c>
 8000e9c:	2a85      	cmp	r2, #133	@ 0x85
 8000e9e:	d0d1      	beq.n	8000e44 <fn_080009E8+0x45c>
 8000ea0:	2c00      	cmp	r4, #0
 8000ea2:	d09d      	beq.n	8000de0 <fn_080009E8+0x3f8>
 8000ea4:	2a27      	cmp	r2, #39	@ 0x27
 8000ea6:	d005      	beq.n	8000eb4 <fn_080009E8+0x4cc>
 8000ea8:	2a61      	cmp	r2, #97	@ 0x61
 8000eaa:	d003      	beq.n	8000eb4 <fn_080009E8+0x4cc>
 8000eac:	3a7d      	subs	r2, #125	@ 0x7d
 8000eae:	2a01      	cmp	r2, #1
 8000eb0:	d900      	bls.n	8000eb4 <fn_080009E8+0x4cc>
 8000eb2:	e715      	b.n	8000ce0 <fn_080009E8+0x2f8>
 8000eb4:	2206      	movs	r2, #6
 8000eb6:	5eab      	ldrsh	r3, [r5, r2]
 8000eb8:	2104      	movs	r1, #4
 8000eba:	5e6a      	ldrsh	r2, [r5, r1]
 8000ebc:	2002      	movs	r0, #2
 8000ebe:	5e29      	ldrsh	r1, [r5, r0]
 8000ec0:	2400      	movs	r4, #0
 8000ec2:	5f28      	ldrsh	r0, [r5, r4]
 8000ec4:	2477      	movs	r4, #119	@ 0x77
 8000ec6:	e6e9      	b.n	8000c9c <fn_080009E8+0x2b4>
