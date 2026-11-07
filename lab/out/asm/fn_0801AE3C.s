fn_0801AE3C:
 801ae3c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 801ae3e:	46ce      	mov	lr, r9
 801ae40:	4647      	mov	r7, r8
 801ae42:	68c3      	ldr	r3, [r0, #12]
 801ae44:	681b      	ldr	r3, [r3, #0]
 801ae46:	001a      	movs	r2, r3
 801ae48:	4699      	mov	r9, r3
 801ae4a:	6883      	ldr	r3, [r0, #8]
 801ae4c:	0005      	movs	r5, r0
 801ae4e:	b580      	push	{r7, lr}
 801ae50:	4293      	cmp	r3, r2
 801ae52:	d137      	bne.n	801aec4 <fn_0801AE3C+0x88>
 801ae54:	2900      	cmp	r1, #0
 801ae56:	d165      	bne.n	801af24 <fn_0801AE3C+0xe8>
 801ae58:	7f03      	ldrb	r3, [r0, #28]
 801ae5a:	2b00      	cmp	r3, #0
 801ae5c:	d105      	bne.n	801ae6a <fn_0801AE3C+0x2e>
 801ae5e:	bcc0      	pop	{r6, r7}
 801ae60:	46b9      	mov	r9, r7
 801ae62:	46b0      	mov	r8, r6
 801ae64:	bcf8      	pop	{r3, r4, r5, r6, r7}
 801ae66:	bc01      	pop	{r0}
 801ae68:	4700      	bx	r0
 801ae6a:	f7e5 fb09 	bl	8000480 <fn_08000480>
 801ae6e:	231a      	movs	r3, #26
 801ae70:	5eea      	ldrsh	r2, [r5, r3]
 801ae72:	2a00      	cmp	r2, #0
 801ae74:	d023      	beq.n	801aebe <fn_0801AE3C+0x82>
 801ae76:	2316      	movs	r3, #22
 801ae78:	5eec      	ldrsh	r4, [r5, r3]
 801ae7a:	2314      	movs	r3, #20
 801ae7c:	5eee      	ldrsh	r6, [r5, r3]
 801ae7e:	4b54      	ldr	r3, [pc, #336]	@ (801afd0 <fn_0801AE3C+0x194>)
 801ae80:	01e1      	lsls	r1, r4, #7
 801ae82:	681f      	ldr	r7, [r3, #0]
 801ae84:	00e3      	lsls	r3, r4, #3
 801ae86:	1ac9      	subs	r1, r1, r3
 801ae88:	4b52      	ldr	r3, [pc, #328]	@ (801afd4 <fn_0801AE3C+0x198>)
 801ae8a:	0049      	lsls	r1, r1, #1
 801ae8c:	58fb      	ldr	r3, [r7, r3]
 801ae8e:	1989      	adds	r1, r1, r6
 801ae90:	185b      	adds	r3, r3, r1
 801ae92:	0121      	lsls	r1, r4, #4
 801ae94:	1b09      	subs	r1, r1, r4
 801ae96:	0109      	lsls	r1, r1, #4
 801ae98:	1989      	adds	r1, r1, r6
 801ae9a:	1840      	adds	r0, r0, r1
 801ae9c:	2118      	movs	r1, #24
 801ae9e:	5e6c      	ldrsh	r4, [r5, r1]
 801aea0:	2180      	movs	r1, #128	@ 0x80
 801aea2:	0864      	lsrs	r4, r4, #1
 801aea4:	0609      	lsls	r1, r1, #24
 801aea6:	4321      	orrs	r1, r4
 801aea8:	4f4b      	ldr	r7, [pc, #300]	@ (801afd8 <fn_0801AE3C+0x19c>)
 801aeaa:	4e4c      	ldr	r6, [pc, #304]	@ (801afdc <fn_0801AE3C+0x1a0>)
 801aeac:	4c4c      	ldr	r4, [pc, #304]	@ (801afe0 <fn_0801AE3C+0x1a4>)
 801aeae:	3a01      	subs	r2, #1
 801aeb0:	6038      	str	r0, [r7, #0]
 801aeb2:	6033      	str	r3, [r6, #0]
 801aeb4:	30f0      	adds	r0, #240	@ 0xf0
 801aeb6:	6021      	str	r1, [r4, #0]
 801aeb8:	33f0      	adds	r3, #240	@ 0xf0
 801aeba:	2a00      	cmp	r2, #0
 801aebc:	d1f7      	bne.n	801aeae <fn_0801AE3C+0x72>
 801aebe:	2300      	movs	r3, #0
 801aec0:	772b      	strb	r3, [r5, #28]
 801aec2:	e7cc      	b.n	801ae5e <fn_0801AE3C+0x22>
 801aec4:	2900      	cmp	r1, #0
 801aec6:	d12d      	bne.n	801af24 <fn_0801AE3C+0xe8>
 801aec8:	231a      	movs	r3, #26
 801aeca:	5ec0      	ldrsh	r0, [r0, r3]
 801aecc:	2800      	cmp	r0, #0
 801aece:	d029      	beq.n	801af24 <fn_0801AE3C+0xe8>
 801aed0:	2314      	movs	r3, #20
 801aed2:	5eec      	ldrsh	r4, [r5, r3]
 801aed4:	2316      	movs	r3, #22
 801aed6:	5eee      	ldrsh	r6, [r5, r3]
 801aed8:	4b3d      	ldr	r3, [pc, #244]	@ (801afd0 <fn_0801AE3C+0x194>)
 801aeda:	00f2      	lsls	r2, r6, #3
 801aedc:	681f      	ldr	r7, [r3, #0]
 801aede:	01f3      	lsls	r3, r6, #7
 801aee0:	1a9b      	subs	r3, r3, r2
 801aee2:	4a3c      	ldr	r2, [pc, #240]	@ (801afd4 <fn_0801AE3C+0x198>)
 801aee4:	005b      	lsls	r3, r3, #1
 801aee6:	58ba      	ldr	r2, [r7, r2]
 801aee8:	191b      	adds	r3, r3, r4
 801aeea:	3e80      	subs	r6, #128	@ 0x80
 801aeec:	18d2      	adds	r2, r2, r3
 801aeee:	0133      	lsls	r3, r6, #4
 801aef0:	1b9b      	subs	r3, r3, r6
 801aef2:	011b      	lsls	r3, r3, #4
 801aef4:	191b      	adds	r3, r3, r4
 801aef6:	4c3b      	ldr	r4, [pc, #236]	@ (801afe4 <fn_0801AE3C+0x1a8>)
 801aef8:	191b      	adds	r3, r3, r4
 801aefa:	2418      	movs	r4, #24
 801aefc:	5f2e      	ldrsh	r6, [r5, r4]
 801aefe:	2480      	movs	r4, #128	@ 0x80
 801af00:	0876      	lsrs	r6, r6, #1
 801af02:	0624      	lsls	r4, r4, #24
 801af04:	4334      	orrs	r4, r6
 801af06:	4e34      	ldr	r6, [pc, #208]	@ (801afd8 <fn_0801AE3C+0x19c>)
 801af08:	46b4      	mov	ip, r6
 801af0a:	4e35      	ldr	r6, [pc, #212]	@ (801afe0 <fn_0801AE3C+0x1a4>)
 801af0c:	46b0      	mov	r8, r6
 801af0e:	4f33      	ldr	r7, [pc, #204]	@ (801afdc <fn_0801AE3C+0x1a0>)
 801af10:	4666      	mov	r6, ip
 801af12:	6033      	str	r3, [r6, #0]
 801af14:	4646      	mov	r6, r8
 801af16:	3801      	subs	r0, #1
 801af18:	603a      	str	r2, [r7, #0]
 801af1a:	33f0      	adds	r3, #240	@ 0xf0
 801af1c:	6034      	str	r4, [r6, #0]
 801af1e:	32f0      	adds	r2, #240	@ 0xf0
 801af20:	2800      	cmp	r0, #0
 801af22:	d1f5      	bne.n	801af10 <fn_0801AE3C+0xd4>
 801af24:	2301      	movs	r3, #1
 801af26:	4059      	eors	r1, r3
 801af28:	2304      	movs	r3, #4
 801af2a:	5eee      	ldrsh	r6, [r5, r3]
 801af2c:	692b      	ldr	r3, [r5, #16]
 801af2e:	681a      	ldr	r2, [r3, #0]
 801af30:	7729      	strb	r1, [r5, #28]
 801af32:	2100      	movs	r1, #0
 801af34:	5e53      	ldrsh	r3, [r2, r1]
 801af36:	4698      	mov	r8, r3
 801af38:	2300      	movs	r3, #0
 801af3a:	5eef      	ldrsh	r7, [r5, r3]
 801af3c:	464b      	mov	r3, r9
 801af3e:	2b00      	cmp	r3, #0
 801af40:	db2a      	blt.n	801af98 <fn_0801AE3C+0x15c>
 801af42:	4649      	mov	r1, r9
 801af44:	4b28      	ldr	r3, [pc, #160]	@ (801afe8 <fn_0801AE3C+0x1ac>)
 801af46:	4299      	cmp	r1, r3
 801af48:	d007      	beq.n	801af5a <fn_0801AE3C+0x11e>
 801af4a:	2900      	cmp	r1, #0
 801af4c:	d108      	bne.n	801af60 <fn_0801AE3C+0x124>
 801af4e:	2302      	movs	r3, #2
 801af50:	5ee9      	ldrsh	r1, [r5, r3]
 801af52:	4643      	mov	r3, r8
 801af54:	1af8      	subs	r0, r7, r3
 801af56:	f00a fae7 	bl	8025528 <fn_08025528>
 801af5a:	464b      	mov	r3, r9
 801af5c:	60ab      	str	r3, [r5, #8]
 801af5e:	e77e      	b.n	801ae5e <fn_0801AE3C+0x22>
 801af60:	464c      	mov	r4, r9
 801af62:	e014      	b.n	801af8e <fn_0801AE3C+0x152>
 801af64:	4643      	mov	r3, r8
 801af66:	0020      	movs	r0, r4
 801af68:	210a      	movs	r1, #10
 801af6a:	1aff      	subs	r7, r7, r3
 801af6c:	f00a fabc 	bl	80254e8 <fn_080254E8>
 801af70:	692b      	ldr	r3, [r5, #16]
 801af72:	0089      	lsls	r1, r1, #2
 801af74:	58ca      	ldr	r2, [r1, r3]
 801af76:	0038      	movs	r0, r7
 801af78:	2302      	movs	r3, #2
 801af7a:	5ee9      	ldrsh	r1, [r5, r3]
 801af7c:	f00a fad4 	bl	8025528 <fn_08025528>
 801af80:	0020      	movs	r0, r4
 801af82:	210a      	movs	r1, #10
 801af84:	f00a fb04 	bl	8025590 <fn_08025590>
 801af88:	3e01      	subs	r6, #1
 801af8a:	1e04      	subs	r4, r0, #0
 801af8c:	d0e5      	beq.n	801af5a <fn_0801AE3C+0x11e>
 801af8e:	2e00      	cmp	r6, #0
 801af90:	d1e8      	bne.n	801af64 <fn_0801AE3C+0x128>
 801af92:	464b      	mov	r3, r9
 801af94:	60ab      	str	r3, [r5, #8]
 801af96:	e762      	b.n	801ae5e <fn_0801AE3C+0x22>
 801af98:	2e02      	cmp	r6, #2
 801af9a:	d107      	bne.n	801afac <fn_0801AE3C+0x170>
 801af9c:	464a      	mov	r2, r9
 801af9e:	2301      	movs	r3, #1
 801afa0:	3209      	adds	r2, #9
 801afa2:	db00      	blt.n	801afa6 <fn_0801AE3C+0x16a>
 801afa4:	2300      	movs	r3, #0
 801afa6:	2409      	movs	r4, #9
 801afa8:	061b      	lsls	r3, r3, #24
 801afaa:	d1f0      	bne.n	801af8e <fn_0801AE3C+0x152>
 801afac:	2e03      	cmp	r6, #3
 801afae:	d106      	bne.n	801afbe <fn_0801AE3C+0x182>
 801afb0:	464a      	mov	r2, r9
 801afb2:	2301      	movs	r3, #1
 801afb4:	3263      	adds	r2, #99	@ 0x63
 801afb6:	da08      	bge.n	801afca <fn_0801AE3C+0x18e>
 801afb8:	2463      	movs	r4, #99	@ 0x63
 801afba:	061b      	lsls	r3, r3, #24
 801afbc:	d1e7      	bne.n	801af8e <fn_0801AE3C+0x152>
 801afbe:	464a      	mov	r2, r9
 801afc0:	4b0a      	ldr	r3, [pc, #40]	@ (801afec <fn_0801AE3C+0x1b0>)
 801afc2:	429a      	cmp	r2, r3
 801afc4:	d0c9      	beq.n	801af5a <fn_0801AE3C+0x11e>
 801afc6:	4254      	negs	r4, r2
 801afc8:	e7e1      	b.n	801af8e <fn_0801AE3C+0x152>
 801afca:	2300      	movs	r3, #0
 801afcc:	e7f4      	b.n	801afb8 <fn_0801AE3C+0x17c>
 801afce:	46c0      	nop			@ (mov r8, r8)
 801afd0:	030064c4 	.word	0x030064c4
 801afd4:	00005a30 	.word	0x00005a30
 801afd8:	040000d4 	.word	0x040000d4
 801afdc:	040000d8 	.word	0x040000d8
 801afe0:	040000dc 	.word	0x040000dc
 801afe4:	08130000 	.word	0x08130000
 801afe8:	000007ca 	.word	0x000007ca
 801afec:	fffff836 	.word	0xfffff836
