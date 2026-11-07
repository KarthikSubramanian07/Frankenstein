fn_0801AEF0:
 801aef0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 801aef2:	46ce      	mov	lr, r9
 801aef4:	4647      	mov	r7, r8
 801aef6:	68c3      	ldr	r3, [r0, #12]
 801aef8:	681b      	ldr	r3, [r3, #0]
 801aefa:	001a      	movs	r2, r3
 801aefc:	4699      	mov	r9, r3
 801aefe:	6883      	ldr	r3, [r0, #8]
 801af00:	0005      	movs	r5, r0
 801af02:	b580      	push	{r7, lr}
 801af04:	4293      	cmp	r3, r2
 801af06:	d137      	bne.n	801af78 <fn_0801AEF0+0x88>
 801af08:	2900      	cmp	r1, #0
 801af0a:	d165      	bne.n	801afd8 <fn_0801AEF0+0xe8>
 801af0c:	7f03      	ldrb	r3, [r0, #28]
 801af0e:	2b00      	cmp	r3, #0
 801af10:	d105      	bne.n	801af1e <fn_0801AEF0+0x2e>
 801af12:	bcc0      	pop	{r6, r7}
 801af14:	46b9      	mov	r9, r7
 801af16:	46b0      	mov	r8, r6
 801af18:	bcf8      	pop	{r3, r4, r5, r6, r7}
 801af1a:	bc01      	pop	{r0}
 801af1c:	4700      	bx	r0
 801af1e:	f7e5 faaf 	bl	8000480 <fn_08000480>
 801af22:	231a      	movs	r3, #26
 801af24:	5eea      	ldrsh	r2, [r5, r3]
 801af26:	2a00      	cmp	r2, #0
 801af28:	d023      	beq.n	801af72 <fn_0801AEF0+0x82>
 801af2a:	2316      	movs	r3, #22
 801af2c:	5eec      	ldrsh	r4, [r5, r3]
 801af2e:	2314      	movs	r3, #20
 801af30:	5eee      	ldrsh	r6, [r5, r3]
 801af32:	4b54      	ldr	r3, [pc, #336]	@ (801b084 <fn_0801AEF0+0x194>)
 801af34:	01e1      	lsls	r1, r4, #7
 801af36:	681f      	ldr	r7, [r3, #0]
 801af38:	00e3      	lsls	r3, r4, #3
 801af3a:	1ac9      	subs	r1, r1, r3
 801af3c:	4b52      	ldr	r3, [pc, #328]	@ (801b088 <fn_0801AEF0+0x198>)
 801af3e:	0049      	lsls	r1, r1, #1
 801af40:	58fb      	ldr	r3, [r7, r3]
 801af42:	1989      	adds	r1, r1, r6
 801af44:	185b      	adds	r3, r3, r1
 801af46:	0121      	lsls	r1, r4, #4
 801af48:	1b09      	subs	r1, r1, r4
 801af4a:	0109      	lsls	r1, r1, #4
 801af4c:	1989      	adds	r1, r1, r6
 801af4e:	1840      	adds	r0, r0, r1
 801af50:	2118      	movs	r1, #24
 801af52:	5e6c      	ldrsh	r4, [r5, r1]
 801af54:	2180      	movs	r1, #128	@ 0x80
 801af56:	0864      	lsrs	r4, r4, #1
 801af58:	0609      	lsls	r1, r1, #24
 801af5a:	4321      	orrs	r1, r4
 801af5c:	4f4b      	ldr	r7, [pc, #300]	@ (801b08c <fn_0801AEF0+0x19c>)
 801af5e:	4e4c      	ldr	r6, [pc, #304]	@ (801b090 <fn_0801AEF0+0x1a0>)
 801af60:	4c4c      	ldr	r4, [pc, #304]	@ (801b094 <fn_0801AEF0+0x1a4>)
 801af62:	3a01      	subs	r2, #1
 801af64:	6038      	str	r0, [r7, #0]
 801af66:	6033      	str	r3, [r6, #0]
 801af68:	30f0      	adds	r0, #240	@ 0xf0
 801af6a:	6021      	str	r1, [r4, #0]
 801af6c:	33f0      	adds	r3, #240	@ 0xf0
 801af6e:	2a00      	cmp	r2, #0
 801af70:	d1f7      	bne.n	801af62 <fn_0801AEF0+0x72>
 801af72:	2300      	movs	r3, #0
 801af74:	772b      	strb	r3, [r5, #28]
 801af76:	e7cc      	b.n	801af12 <fn_0801AEF0+0x22>
 801af78:	2900      	cmp	r1, #0
 801af7a:	d12d      	bne.n	801afd8 <fn_0801AEF0+0xe8>
 801af7c:	231a      	movs	r3, #26
 801af7e:	5ec0      	ldrsh	r0, [r0, r3]
 801af80:	2800      	cmp	r0, #0
 801af82:	d029      	beq.n	801afd8 <fn_0801AEF0+0xe8>
 801af84:	2314      	movs	r3, #20
 801af86:	5eec      	ldrsh	r4, [r5, r3]
 801af88:	2316      	movs	r3, #22
 801af8a:	5eee      	ldrsh	r6, [r5, r3]
 801af8c:	4b3d      	ldr	r3, [pc, #244]	@ (801b084 <fn_0801AEF0+0x194>)
 801af8e:	00f2      	lsls	r2, r6, #3
 801af90:	681f      	ldr	r7, [r3, #0]
 801af92:	01f3      	lsls	r3, r6, #7
 801af94:	1a9b      	subs	r3, r3, r2
 801af96:	4a3c      	ldr	r2, [pc, #240]	@ (801b088 <fn_0801AEF0+0x198>)
 801af98:	005b      	lsls	r3, r3, #1
 801af9a:	58ba      	ldr	r2, [r7, r2]
 801af9c:	191b      	adds	r3, r3, r4
 801af9e:	3e80      	subs	r6, #128	@ 0x80
 801afa0:	18d2      	adds	r2, r2, r3
 801afa2:	0133      	lsls	r3, r6, #4
 801afa4:	1b9b      	subs	r3, r3, r6
 801afa6:	011b      	lsls	r3, r3, #4
 801afa8:	191b      	adds	r3, r3, r4
 801afaa:	4c3b      	ldr	r4, [pc, #236]	@ (801b098 <fn_0801AEF0+0x1a8>)
 801afac:	191b      	adds	r3, r3, r4
 801afae:	2418      	movs	r4, #24
 801afb0:	5f2e      	ldrsh	r6, [r5, r4]
 801afb2:	2480      	movs	r4, #128	@ 0x80
 801afb4:	0876      	lsrs	r6, r6, #1
 801afb6:	0624      	lsls	r4, r4, #24
 801afb8:	4334      	orrs	r4, r6
 801afba:	4e34      	ldr	r6, [pc, #208]	@ (801b08c <fn_0801AEF0+0x19c>)
 801afbc:	46b4      	mov	ip, r6
 801afbe:	4e35      	ldr	r6, [pc, #212]	@ (801b094 <fn_0801AEF0+0x1a4>)
 801afc0:	46b0      	mov	r8, r6
 801afc2:	4f33      	ldr	r7, [pc, #204]	@ (801b090 <fn_0801AEF0+0x1a0>)
 801afc4:	4666      	mov	r6, ip
 801afc6:	6033      	str	r3, [r6, #0]
 801afc8:	4646      	mov	r6, r8
 801afca:	3801      	subs	r0, #1
 801afcc:	603a      	str	r2, [r7, #0]
 801afce:	33f0      	adds	r3, #240	@ 0xf0
 801afd0:	6034      	str	r4, [r6, #0]
 801afd2:	32f0      	adds	r2, #240	@ 0xf0
 801afd4:	2800      	cmp	r0, #0
 801afd6:	d1f5      	bne.n	801afc4 <fn_0801AEF0+0xd4>
 801afd8:	2301      	movs	r3, #1
 801afda:	4059      	eors	r1, r3
 801afdc:	2304      	movs	r3, #4
 801afde:	5eee      	ldrsh	r6, [r5, r3]
 801afe0:	692b      	ldr	r3, [r5, #16]
 801afe2:	681a      	ldr	r2, [r3, #0]
 801afe4:	7729      	strb	r1, [r5, #28]
 801afe6:	2100      	movs	r1, #0
 801afe8:	5e53      	ldrsh	r3, [r2, r1]
 801afea:	4698      	mov	r8, r3
 801afec:	2300      	movs	r3, #0
 801afee:	5eef      	ldrsh	r7, [r5, r3]
 801aff0:	464b      	mov	r3, r9
 801aff2:	2b00      	cmp	r3, #0
 801aff4:	db2a      	blt.n	801b04c <fn_0801AEF0+0x15c>
 801aff6:	4649      	mov	r1, r9
 801aff8:	4b28      	ldr	r3, [pc, #160]	@ (801b09c <fn_0801AEF0+0x1ac>)
 801affa:	4299      	cmp	r1, r3
 801affc:	d007      	beq.n	801b00e <fn_0801AEF0+0x11e>
 801affe:	2900      	cmp	r1, #0
 801b000:	d108      	bne.n	801b014 <fn_0801AEF0+0x124>
 801b002:	2302      	movs	r3, #2
 801b004:	5ee9      	ldrsh	r1, [r5, r3]
 801b006:	4643      	mov	r3, r8
 801b008:	1af8      	subs	r0, r7, r3
 801b00a:	f00a fae5 	bl	80255d8 <fn_080255D8>
 801b00e:	464b      	mov	r3, r9
 801b010:	60ab      	str	r3, [r5, #8]
 801b012:	e77e      	b.n	801af12 <fn_0801AEF0+0x22>
 801b014:	464c      	mov	r4, r9
 801b016:	e014      	b.n	801b042 <fn_0801AEF0+0x152>
 801b018:	4643      	mov	r3, r8
 801b01a:	0020      	movs	r0, r4
 801b01c:	210a      	movs	r1, #10
 801b01e:	1aff      	subs	r7, r7, r3
 801b020:	f00a faba 	bl	8025598 <fn_08025598>
 801b024:	692b      	ldr	r3, [r5, #16]
 801b026:	0089      	lsls	r1, r1, #2
 801b028:	58ca      	ldr	r2, [r1, r3]
 801b02a:	0038      	movs	r0, r7
 801b02c:	2302      	movs	r3, #2
 801b02e:	5ee9      	ldrsh	r1, [r5, r3]
 801b030:	f00a fad2 	bl	80255d8 <fn_080255D8>
 801b034:	0020      	movs	r0, r4
 801b036:	210a      	movs	r1, #10
 801b038:	f00a fb02 	bl	8025640 <fn_08025640>
 801b03c:	3e01      	subs	r6, #1
 801b03e:	1e04      	subs	r4, r0, #0
 801b040:	d0e5      	beq.n	801b00e <fn_0801AEF0+0x11e>
 801b042:	2e00      	cmp	r6, #0
 801b044:	d1e8      	bne.n	801b018 <fn_0801AEF0+0x128>
 801b046:	464b      	mov	r3, r9
 801b048:	60ab      	str	r3, [r5, #8]
 801b04a:	e762      	b.n	801af12 <fn_0801AEF0+0x22>
 801b04c:	2e02      	cmp	r6, #2
 801b04e:	d107      	bne.n	801b060 <fn_0801AEF0+0x170>
 801b050:	464a      	mov	r2, r9
 801b052:	2301      	movs	r3, #1
 801b054:	3209      	adds	r2, #9
 801b056:	db00      	blt.n	801b05a <fn_0801AEF0+0x16a>
 801b058:	2300      	movs	r3, #0
 801b05a:	2409      	movs	r4, #9
 801b05c:	061b      	lsls	r3, r3, #24
 801b05e:	d1f0      	bne.n	801b042 <fn_0801AEF0+0x152>
 801b060:	2e03      	cmp	r6, #3
 801b062:	d106      	bne.n	801b072 <fn_0801AEF0+0x182>
 801b064:	464a      	mov	r2, r9
 801b066:	2301      	movs	r3, #1
 801b068:	3263      	adds	r2, #99	@ 0x63
 801b06a:	da08      	bge.n	801b07e <fn_0801AEF0+0x18e>
 801b06c:	2463      	movs	r4, #99	@ 0x63
 801b06e:	061b      	lsls	r3, r3, #24
 801b070:	d1e7      	bne.n	801b042 <fn_0801AEF0+0x152>
 801b072:	464a      	mov	r2, r9
 801b074:	4b0a      	ldr	r3, [pc, #40]	@ (801b0a0 <fn_0801AEF0+0x1b0>)
 801b076:	429a      	cmp	r2, r3
 801b078:	d0c9      	beq.n	801b00e <fn_0801AEF0+0x11e>
 801b07a:	4254      	negs	r4, r2
 801b07c:	e7e1      	b.n	801b042 <fn_0801AEF0+0x152>
 801b07e:	2300      	movs	r3, #0
 801b080:	e7f4      	b.n	801b06c <fn_0801AEF0+0x17c>
 801b082:	46c0      	nop			@ (mov r8, r8)
 801b084:	030064c4 	.word	0x030064c4
 801b088:	00005a30 	.word	0x00005a30
 801b08c:	040000d4 	.word	0x040000d4
 801b090:	040000d8 	.word	0x040000d8
 801b094:	040000dc 	.word	0x040000dc
 801b098:	081300d4 	.word	0x081300d4
 801b09c:	000007ca 	.word	0x000007ca
 801b0a0:	fffff836 	.word	0xfffff836
