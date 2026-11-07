fn_0801CC18:
 801cc18:	b5f0      	push	{r4, r5, r6, r7, lr}
 801cc1a:	46c6      	mov	lr, r8
 801cc1c:	4d9e      	ldr	r5, [pc, #632]	@ (801ce98 <fn_0801CC18+0x280>)
 801cc1e:	b500      	push	{lr}
 801cc20:	682c      	ldr	r4, [r5, #0]
 801cc22:	4a9e      	ldr	r2, [pc, #632]	@ (801ce9c <fn_0801CC18+0x284>)
 801cc24:	4b9e      	ldr	r3, [pc, #632]	@ (801cea0 <fn_0801CC18+0x288>)
 801cc26:	58a1      	ldr	r1, [r4, r2]
 801cc28:	58e3      	ldr	r3, [r4, r3]
 801cc2a:	b082      	sub	sp, #8
 801cc2c:	2900      	cmp	r1, #0
 801cc2e:	d047      	beq.n	801ccc0 <fn_0801CC18+0xa8>
 801cc30:	2b0a      	cmp	r3, #10
 801cc32:	d059      	beq.n	801cce8 <fn_0801CC18+0xd0>
 801cc34:	2300      	movs	r3, #0
 801cc36:	50a3      	str	r3, [r4, r2]
 801cc38:	4b9a      	ldr	r3, [pc, #616]	@ (801cea4 <fn_0801CC18+0x28c>)
 801cc3a:	58e7      	ldr	r7, [r4, r3]
 801cc3c:	4b9a      	ldr	r3, [pc, #616]	@ (801cea8 <fn_0801CC18+0x290>)
 801cc3e:	58e6      	ldr	r6, [r4, r3]
 801cc40:	2364      	movs	r3, #100	@ 0x64
 801cc42:	6878      	ldr	r0, [r7, #4]
 801cc44:	4343      	muls	r3, r0
 801cc46:	6931      	ldr	r1, [r6, #16]
 801cc48:	0018      	movs	r0, r3
 801cc4a:	f008 fcf9 	bl	8025640 <fn_08025640>
 801cc4e:	4b97      	ldr	r3, [pc, #604]	@ (801ceac <fn_0801CC18+0x294>)
 801cc50:	50e0      	str	r0, [r4, r3]
 801cc52:	2364      	movs	r3, #100	@ 0x64
 801cc54:	68b8      	ldr	r0, [r7, #8]
 801cc56:	4343      	muls	r3, r0
 801cc58:	6971      	ldr	r1, [r6, #20]
 801cc5a:	0018      	movs	r0, r3
 801cc5c:	f008 fcf0 	bl	8025640 <fn_08025640>
 801cc60:	4b93      	ldr	r3, [pc, #588]	@ (801ceb0 <fn_0801CC18+0x298>)
 801cc62:	50e0      	str	r0, [r4, r3]
 801cc64:	69b1      	ldr	r1, [r6, #24]
 801cc66:	2064      	movs	r0, #100	@ 0x64
 801cc68:	2900      	cmp	r1, #0
 801cc6a:	d003      	beq.n	801cc74 <fn_0801CC18+0x5c>
 801cc6c:	68fb      	ldr	r3, [r7, #12]
 801cc6e:	4358      	muls	r0, r3
 801cc70:	f008 fce6 	bl	8025640 <fn_08025640>
 801cc74:	4b8f      	ldr	r3, [pc, #572]	@ (801ceb4 <fn_0801CC18+0x29c>)
 801cc76:	50e0      	str	r0, [r4, r3]
 801cc78:	2123      	movs	r1, #35	@ 0x23
 801cc7a:	6bb0      	ldr	r0, [r6, #56]	@ 0x38
 801cc7c:	f008 fce0 	bl	8025640 <fn_08025640>
 801cc80:	4b8d      	ldr	r3, [pc, #564]	@ (801ceb8 <fn_0801CC18+0x2a0>)
 801cc82:	50e0      	str	r0, [r4, r3]
 801cc84:	6938      	ldr	r0, [r7, #16]
 801cc86:	2123      	movs	r1, #35	@ 0x23
 801cc88:	f008 fcda 	bl	8025640 <fn_08025640>
 801cc8c:	4b8b      	ldr	r3, [pc, #556]	@ (801cebc <fn_0801CC18+0x2a4>)
 801cc8e:	50e0      	str	r0, [r4, r3]
 801cc90:	2123      	movs	r1, #35	@ 0x23
 801cc92:	69f0      	ldr	r0, [r6, #28]
 801cc94:	f008 fcd4 	bl	8025640 <fn_08025640>
 801cc98:	4b89      	ldr	r3, [pc, #548]	@ (801cec0 <fn_0801CC18+0x2a8>)
 801cc9a:	2152      	movs	r1, #82	@ 0x52
 801cc9c:	50e0      	str	r0, [r4, r3]
 801cc9e:	2000      	movs	r0, #0
 801cca0:	f7fd fb6c 	bl	801a37c <fn_0801A37C>
 801cca4:	210a      	movs	r1, #10
 801cca6:	682b      	ldr	r3, [r5, #0]
 801cca8:	4a7d      	ldr	r2, [pc, #500]	@ (801cea0 <fn_0801CC18+0x288>)
 801ccaa:	5099      	str	r1, [r3, r2]
 801ccac:	4a7b      	ldr	r2, [pc, #492]	@ (801ce9c <fn_0801CC18+0x284>)
 801ccae:	589b      	ldr	r3, [r3, r2]
 801ccb0:	2b00      	cmp	r3, #0
 801ccb2:	d119      	bne.n	801cce8 <fn_0801CC18+0xd0>
 801ccb4:	b002      	add	sp, #8
 801ccb6:	bc80      	pop	{r7}
 801ccb8:	46b8      	mov	r8, r7
 801ccba:	bcf0      	pop	{r4, r5, r6, r7}
 801ccbc:	bc01      	pop	{r0}
 801ccbe:	4700      	bx	r0
 801ccc0:	2b0a      	cmp	r3, #10
 801ccc2:	d803      	bhi.n	801cccc <fn_0801CC18+0xb4>
 801ccc4:	497f      	ldr	r1, [pc, #508]	@ (801cec4 <fn_0801CC18+0x2ac>)
 801ccc6:	009a      	lsls	r2, r3, #2
 801ccc8:	588a      	ldr	r2, [r1, r2]
 801ccca:	4697      	mov	pc, r2
 801cccc:	07da      	lsls	r2, r3, #31
 801ccce:	d5f1      	bpl.n	801ccb4 <fn_0801CC18+0x9c>
 801ccd0:	497d      	ldr	r1, [pc, #500]	@ (801cec8 <fn_0801CC18+0x2b0>)
 801ccd2:	5862      	ldr	r2, [r4, r1]
 801ccd4:	3a01      	subs	r2, #1
 801ccd6:	5062      	str	r2, [r4, r1]
 801ccd8:	2a00      	cmp	r2, #0
 801ccda:	d1eb      	bne.n	801ccb4 <fn_0801CC18+0x9c>
 801ccdc:	4a70      	ldr	r2, [pc, #448]	@ (801cea0 <fn_0801CC18+0x288>)
 801ccde:	3301      	adds	r3, #1
 801cce0:	50a3      	str	r3, [r4, r2]
 801cce2:	2323      	movs	r3, #35	@ 0x23
 801cce4:	5063      	str	r3, [r4, r1]
 801cce6:	e7e5      	b.n	801ccb4 <fn_0801CC18+0x9c>
 801cce8:	2103      	movs	r1, #3
 801ccea:	2000      	movs	r0, #0
 801ccec:	f7fd fb46 	bl	801a37c <fn_0801A37C>
 801ccf0:	2294      	movs	r2, #148	@ 0x94
 801ccf2:	682b      	ldr	r3, [r5, #0]
 801ccf4:	5c9a      	ldrb	r2, [r3, r2]
 801ccf6:	2a02      	cmp	r2, #2
 801ccf8:	d000      	beq.n	801ccfc <fn_0801CC18+0xe4>
 801ccfa:	e0bc      	b.n	801ce76 <fn_0801CC18+0x25e>
 801ccfc:	21ff      	movs	r1, #255	@ 0xff
 801ccfe:	4a73      	ldr	r2, [pc, #460]	@ (801cecc <fn_0801CC18+0x2b4>)
 801cd00:	5499      	strb	r1, [r3, r2]
 801cd02:	2100      	movs	r1, #0
 801cd04:	4a65      	ldr	r2, [pc, #404]	@ (801ce9c <fn_0801CC18+0x284>)
 801cd06:	5099      	str	r1, [r3, r2]
 801cd08:	4a71      	ldr	r2, [pc, #452]	@ (801ced0 <fn_0801CC18+0x2b8>)
 801cd0a:	310a      	adds	r1, #10
 801cd0c:	5099      	str	r1, [r3, r2]
 801cd0e:	e7d1      	b.n	801ccb4 <fn_0801CC18+0x9c>
 801cd10:	4b70      	ldr	r3, [pc, #448]	@ (801ced4 <fn_0801CC18+0x2bc>)
 801cd12:	58e3      	ldr	r3, [r4, r3]
 801cd14:	079b      	lsls	r3, r3, #30
 801cd16:	d100      	bne.n	801cd1a <fn_0801CC18+0x102>
 801cd18:	e0a0      	b.n	801ce5c <fn_0801CC18+0x244>
 801cd1a:	4b68      	ldr	r3, [pc, #416]	@ (801cebc <fn_0801CC18+0x2a4>)
 801cd1c:	58e7      	ldr	r7, [r4, r3]
 801cd1e:	3703      	adds	r7, #3
 801cd20:	50e7      	str	r7, [r4, r3]
 801cd22:	4b60      	ldr	r3, [pc, #384]	@ (801cea4 <fn_0801CC18+0x28c>)
 801cd24:	58e3      	ldr	r3, [r4, r3]
 801cd26:	2123      	movs	r1, #35	@ 0x23
 801cd28:	6918      	ldr	r0, [r3, #16]
 801cd2a:	4698      	mov	r8, r3
 801cd2c:	f008 fc88 	bl	8025640 <fn_08025640>
 801cd30:	0006      	movs	r6, r0
 801cd32:	42b8      	cmp	r0, r7
 801cd34:	dd00      	ble.n	801cd38 <fn_0801CC18+0x120>
 801cd36:	003e      	movs	r6, r7
 801cd38:	4b60      	ldr	r3, [pc, #384]	@ (801cebc <fn_0801CC18+0x2a4>)
 801cd3a:	50e6      	str	r6, [r4, r3]
 801cd3c:	4b5e      	ldr	r3, [pc, #376]	@ (801ceb8 <fn_0801CC18+0x2a0>)
 801cd3e:	58e2      	ldr	r2, [r4, r3]
 801cd40:	3203      	adds	r2, #3
 801cd42:	50e2      	str	r2, [r4, r3]
 801cd44:	4b58      	ldr	r3, [pc, #352]	@ (801cea8 <fn_0801CC18+0x290>)
 801cd46:	58e7      	ldr	r7, [r4, r3]
 801cd48:	2123      	movs	r1, #35	@ 0x23
 801cd4a:	6bb8      	ldr	r0, [r7, #56]	@ 0x38
 801cd4c:	9200      	str	r2, [sp, #0]
 801cd4e:	f008 fc77 	bl	8025640 <fn_08025640>
 801cd52:	9a00      	ldr	r2, [sp, #0]
 801cd54:	9001      	str	r0, [sp, #4]
 801cd56:	4290      	cmp	r0, r2
 801cd58:	dd00      	ble.n	801cd5c <fn_0801CC18+0x144>
 801cd5a:	9201      	str	r2, [sp, #4]
 801cd5c:	4b56      	ldr	r3, [pc, #344]	@ (801ceb8 <fn_0801CC18+0x2a0>)
 801cd5e:	9a01      	ldr	r2, [sp, #4]
 801cd60:	50e2      	str	r2, [r4, r3]
 801cd62:	4a57      	ldr	r2, [pc, #348]	@ (801cec0 <fn_0801CC18+0x2a8>)
 801cd64:	58a3      	ldr	r3, [r4, r2]
 801cd66:	3303      	adds	r3, #3
 801cd68:	50a3      	str	r3, [r4, r2]
 801cd6a:	2123      	movs	r1, #35	@ 0x23
 801cd6c:	69f8      	ldr	r0, [r7, #28]
 801cd6e:	9300      	str	r3, [sp, #0]
 801cd70:	f008 fc66 	bl	8025640 <fn_08025640>
 801cd74:	9b00      	ldr	r3, [sp, #0]
 801cd76:	4283      	cmp	r3, r0
 801cd78:	db9c      	blt.n	801ccb4 <fn_0801CC18+0x9c>
 801cd7a:	4643      	mov	r3, r8
 801cd7c:	4a50      	ldr	r2, [pc, #320]	@ (801cec0 <fn_0801CC18+0x2a8>)
 801cd7e:	50a0      	str	r0, [r4, r2]
 801cd80:	2123      	movs	r1, #35	@ 0x23
 801cd82:	6918      	ldr	r0, [r3, #16]
 801cd84:	f008 fc5c 	bl	8025640 <fn_08025640>
 801cd88:	42b0      	cmp	r0, r6
 801cd8a:	dc93      	bgt.n	801ccb4 <fn_0801CC18+0x9c>
 801cd8c:	2123      	movs	r1, #35	@ 0x23
 801cd8e:	6bb8      	ldr	r0, [r7, #56]	@ 0x38
 801cd90:	f008 fc56 	bl	8025640 <fn_08025640>
 801cd94:	9a01      	ldr	r2, [sp, #4]
 801cd96:	4290      	cmp	r0, r2
 801cd98:	dd00      	ble.n	801cd9c <fn_0801CC18+0x184>
 801cd9a:	e78b      	b.n	801ccb4 <fn_0801CC18+0x9c>
 801cd9c:	e016      	b.n	801cdcc <fn_0801CC18+0x1b4>
 801cd9e:	4f43      	ldr	r7, [pc, #268]	@ (801ceac <fn_0801CC18+0x294>)
 801cda0:	59e6      	ldr	r6, [r4, r7]
 801cda2:	3602      	adds	r6, #2
 801cda4:	51e6      	str	r6, [r4, r7]
 801cda6:	4b4b      	ldr	r3, [pc, #300]	@ (801ced4 <fn_0801CC18+0x2bc>)
 801cda8:	58e3      	ldr	r3, [r4, r3]
 801cdaa:	079b      	lsls	r3, r3, #30
 801cdac:	d04f      	beq.n	801ce4e <fn_0801CC18+0x236>
 801cdae:	4b3d      	ldr	r3, [pc, #244]	@ (801cea4 <fn_0801CC18+0x28c>)
 801cdb0:	58e3      	ldr	r3, [r4, r3]
 801cdb2:	6858      	ldr	r0, [r3, #4]
 801cdb4:	2364      	movs	r3, #100	@ 0x64
 801cdb6:	4358      	muls	r0, r3
 801cdb8:	4b3b      	ldr	r3, [pc, #236]	@ (801cea8 <fn_0801CC18+0x290>)
 801cdba:	58e3      	ldr	r3, [r4, r3]
 801cdbc:	6919      	ldr	r1, [r3, #16]
 801cdbe:	f008 fc3f 	bl	8025640 <fn_08025640>
 801cdc2:	42b0      	cmp	r0, r6
 801cdc4:	dd00      	ble.n	801cdc8 <fn_0801CC18+0x1b0>
 801cdc6:	e775      	b.n	801ccb4 <fn_0801CC18+0x9c>
 801cdc8:	4b38      	ldr	r3, [pc, #224]	@ (801ceac <fn_0801CC18+0x294>)
 801cdca:	50e0      	str	r0, [r4, r3]
 801cdcc:	2152      	movs	r1, #82	@ 0x52
 801cdce:	2000      	movs	r0, #0
 801cdd0:	f7fd fad4 	bl	801a37c <fn_0801A37C>
 801cdd4:	6829      	ldr	r1, [r5, #0]
 801cdd6:	4a32      	ldr	r2, [pc, #200]	@ (801cea0 <fn_0801CC18+0x288>)
 801cdd8:	588b      	ldr	r3, [r1, r2]
 801cdda:	3301      	adds	r3, #1
 801cddc:	508b      	str	r3, [r1, r2]
 801cdde:	e769      	b.n	801ccb4 <fn_0801CC18+0x9c>
 801cde0:	4f33      	ldr	r7, [pc, #204]	@ (801ceb0 <fn_0801CC18+0x298>)
 801cde2:	59e6      	ldr	r6, [r4, r7]
 801cde4:	3602      	adds	r6, #2
 801cde6:	51e6      	str	r6, [r4, r7]
 801cde8:	4b3a      	ldr	r3, [pc, #232]	@ (801ced4 <fn_0801CC18+0x2bc>)
 801cdea:	58e3      	ldr	r3, [r4, r3]
 801cdec:	079b      	lsls	r3, r3, #30
 801cdee:	d03b      	beq.n	801ce68 <fn_0801CC18+0x250>
 801cdf0:	4b2c      	ldr	r3, [pc, #176]	@ (801cea4 <fn_0801CC18+0x28c>)
 801cdf2:	58e3      	ldr	r3, [r4, r3]
 801cdf4:	6898      	ldr	r0, [r3, #8]
 801cdf6:	2364      	movs	r3, #100	@ 0x64
 801cdf8:	4358      	muls	r0, r3
 801cdfa:	4b2b      	ldr	r3, [pc, #172]	@ (801cea8 <fn_0801CC18+0x290>)
 801cdfc:	58e3      	ldr	r3, [r4, r3]
 801cdfe:	6959      	ldr	r1, [r3, #20]
 801ce00:	f008 fc1e 	bl	8025640 <fn_08025640>
 801ce04:	42b0      	cmp	r0, r6
 801ce06:	dd00      	ble.n	801ce0a <fn_0801CC18+0x1f2>
 801ce08:	e754      	b.n	801ccb4 <fn_0801CC18+0x9c>
 801ce0a:	4b29      	ldr	r3, [pc, #164]	@ (801ceb0 <fn_0801CC18+0x298>)
 801ce0c:	e7dd      	b.n	801cdca <fn_0801CC18+0x1b2>
 801ce0e:	4f29      	ldr	r7, [pc, #164]	@ (801ceb4 <fn_0801CC18+0x29c>)
 801ce10:	59e6      	ldr	r6, [r4, r7]
 801ce12:	3602      	adds	r6, #2
 801ce14:	51e6      	str	r6, [r4, r7]
 801ce16:	4b2f      	ldr	r3, [pc, #188]	@ (801ced4 <fn_0801CC18+0x2bc>)
 801ce18:	58e3      	ldr	r3, [r4, r3]
 801ce1a:	079b      	lsls	r3, r3, #30
 801ce1c:	d010      	beq.n	801ce40 <fn_0801CC18+0x228>
 801ce1e:	4b22      	ldr	r3, [pc, #136]	@ (801cea8 <fn_0801CC18+0x290>)
 801ce20:	58e3      	ldr	r3, [r4, r3]
 801ce22:	6999      	ldr	r1, [r3, #24]
 801ce24:	2064      	movs	r0, #100	@ 0x64
 801ce26:	2900      	cmp	r1, #0
 801ce28:	d005      	beq.n	801ce36 <fn_0801CC18+0x21e>
 801ce2a:	4b1e      	ldr	r3, [pc, #120]	@ (801cea4 <fn_0801CC18+0x28c>)
 801ce2c:	58e3      	ldr	r3, [r4, r3]
 801ce2e:	68db      	ldr	r3, [r3, #12]
 801ce30:	4358      	muls	r0, r3
 801ce32:	f008 fc05 	bl	8025640 <fn_08025640>
 801ce36:	42b0      	cmp	r0, r6
 801ce38:	dd00      	ble.n	801ce3c <fn_0801CC18+0x224>
 801ce3a:	e73b      	b.n	801ccb4 <fn_0801CC18+0x9c>
 801ce3c:	4b1d      	ldr	r3, [pc, #116]	@ (801ceb4 <fn_0801CC18+0x29c>)
 801ce3e:	e7c4      	b.n	801cdca <fn_0801CC18+0x1b2>
 801ce40:	2101      	movs	r1, #1
 801ce42:	2000      	movs	r0, #0
 801ce44:	f7fd fa9a 	bl	801a37c <fn_0801A37C>
 801ce48:	682c      	ldr	r4, [r5, #0]
 801ce4a:	59e6      	ldr	r6, [r4, r7]
 801ce4c:	e7e7      	b.n	801ce1e <fn_0801CC18+0x206>
 801ce4e:	2101      	movs	r1, #1
 801ce50:	2000      	movs	r0, #0
 801ce52:	f7fd fa93 	bl	801a37c <fn_0801A37C>
 801ce56:	682c      	ldr	r4, [r5, #0]
 801ce58:	59e6      	ldr	r6, [r4, r7]
 801ce5a:	e7a8      	b.n	801cdae <fn_0801CC18+0x196>
 801ce5c:	2101      	movs	r1, #1
 801ce5e:	2000      	movs	r0, #0
 801ce60:	f7fd fa8c 	bl	801a37c <fn_0801A37C>
 801ce64:	682c      	ldr	r4, [r5, #0]
 801ce66:	e758      	b.n	801cd1a <fn_0801CC18+0x102>
 801ce68:	2101      	movs	r1, #1
 801ce6a:	2000      	movs	r0, #0
 801ce6c:	f7fd fa86 	bl	801a37c <fn_0801A37C>
 801ce70:	682c      	ldr	r4, [r5, #0]
 801ce72:	59e6      	ldr	r6, [r4, r7]
 801ce74:	e7bc      	b.n	801cdf0 <fn_0801CC18+0x1d8>
 801ce76:	22dc      	movs	r2, #220	@ 0xdc
 801ce78:	589a      	ldr	r2, [r3, r2]
 801ce7a:	2a08      	cmp	r2, #8
 801ce7c:	d009      	beq.n	801ce92 <fn_0801CC18+0x27a>
 801ce7e:	2101      	movs	r1, #1
 801ce80:	4a12      	ldr	r2, [pc, #72]	@ (801cecc <fn_0801CC18+0x2b4>)
 801ce82:	5499      	strb	r1, [r3, r2]
 801ce84:	2100      	movs	r1, #0
 801ce86:	4a05      	ldr	r2, [pc, #20]	@ (801ce9c <fn_0801CC18+0x284>)
 801ce88:	5099      	str	r1, [r3, r2]
 801ce8a:	4a11      	ldr	r2, [pc, #68]	@ (801ced0 <fn_0801CC18+0x2b8>)
 801ce8c:	318c      	adds	r1, #140	@ 0x8c
 801ce8e:	5099      	str	r1, [r3, r2]
 801ce90:	e710      	b.n	801ccb4 <fn_0801CC18+0x9c>
 801ce92:	f7e6 fb67 	bl	8003564 <fn_08003564>
 801ce96:	e70d      	b.n	801ccb4 <fn_0801CC18+0x9c>
 801ce98:	030064c4 	.word	0x030064c4
 801ce9c:	00005a38 	.word	0x00005a38
 801cea0:	00005a88 	.word	0x00005a88
 801cea4:	00005a44 	.word	0x00005a44
 801cea8:	00005a40 	.word	0x00005a40
 801ceac:	00005a8c 	.word	0x00005a8c
 801ceb0:	00005a90 	.word	0x00005a90
 801ceb4:	00005a94 	.word	0x00005a94
 801ceb8:	00005a54 	.word	0x00005a54
 801cebc:	00005a50 	.word	0x00005a50
 801cec0:	00005a58 	.word	0x00005a58
 801cec4:	081478ac 	.word	0x081478ac
 801cec8:	00005a5c 	.word	0x00005a5c
 801cecc:	00005a3c 	.word	0x00005a3c
 801ced0:	00005a48 	.word	0x00005a48
 801ced4:	00005a4c 	.word	0x00005a4c
