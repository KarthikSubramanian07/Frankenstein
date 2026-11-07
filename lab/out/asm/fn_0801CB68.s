fn_0801CB68:
 801cb68:	b5f0      	push	{r4, r5, r6, r7, lr}
 801cb6a:	46c6      	mov	lr, r8
 801cb6c:	4d9e      	ldr	r5, [pc, #632]	@ (801cde8 <fn_0801CB68+0x280>)
 801cb6e:	b500      	push	{lr}
 801cb70:	682c      	ldr	r4, [r5, #0]
 801cb72:	4a9e      	ldr	r2, [pc, #632]	@ (801cdec <fn_0801CB68+0x284>)
 801cb74:	4b9e      	ldr	r3, [pc, #632]	@ (801cdf0 <fn_0801CB68+0x288>)
 801cb76:	58a1      	ldr	r1, [r4, r2]
 801cb78:	58e3      	ldr	r3, [r4, r3]
 801cb7a:	b082      	sub	sp, #8
 801cb7c:	2900      	cmp	r1, #0
 801cb7e:	d047      	beq.n	801cc10 <fn_0801CB68+0xa8>
 801cb80:	2b0a      	cmp	r3, #10
 801cb82:	d059      	beq.n	801cc38 <fn_0801CB68+0xd0>
 801cb84:	2300      	movs	r3, #0
 801cb86:	50a3      	str	r3, [r4, r2]
 801cb88:	4b9a      	ldr	r3, [pc, #616]	@ (801cdf4 <fn_0801CB68+0x28c>)
 801cb8a:	58e7      	ldr	r7, [r4, r3]
 801cb8c:	4b9a      	ldr	r3, [pc, #616]	@ (801cdf8 <fn_0801CB68+0x290>)
 801cb8e:	58e6      	ldr	r6, [r4, r3]
 801cb90:	2364      	movs	r3, #100	@ 0x64
 801cb92:	6878      	ldr	r0, [r7, #4]
 801cb94:	4343      	muls	r3, r0
 801cb96:	6931      	ldr	r1, [r6, #16]
 801cb98:	0018      	movs	r0, r3
 801cb9a:	f008 fcf9 	bl	8025590 <fn_08025590>
 801cb9e:	4b97      	ldr	r3, [pc, #604]	@ (801cdfc <fn_0801CB68+0x294>)
 801cba0:	50e0      	str	r0, [r4, r3]
 801cba2:	2364      	movs	r3, #100	@ 0x64
 801cba4:	68b8      	ldr	r0, [r7, #8]
 801cba6:	4343      	muls	r3, r0
 801cba8:	6971      	ldr	r1, [r6, #20]
 801cbaa:	0018      	movs	r0, r3
 801cbac:	f008 fcf0 	bl	8025590 <fn_08025590>
 801cbb0:	4b93      	ldr	r3, [pc, #588]	@ (801ce00 <fn_0801CB68+0x298>)
 801cbb2:	50e0      	str	r0, [r4, r3]
 801cbb4:	69b1      	ldr	r1, [r6, #24]
 801cbb6:	2064      	movs	r0, #100	@ 0x64
 801cbb8:	2900      	cmp	r1, #0
 801cbba:	d003      	beq.n	801cbc4 <fn_0801CB68+0x5c>
 801cbbc:	68fb      	ldr	r3, [r7, #12]
 801cbbe:	4358      	muls	r0, r3
 801cbc0:	f008 fce6 	bl	8025590 <fn_08025590>
 801cbc4:	4b8f      	ldr	r3, [pc, #572]	@ (801ce04 <fn_0801CB68+0x29c>)
 801cbc6:	50e0      	str	r0, [r4, r3]
 801cbc8:	2123      	movs	r1, #35	@ 0x23
 801cbca:	6bb0      	ldr	r0, [r6, #56]	@ 0x38
 801cbcc:	f008 fce0 	bl	8025590 <fn_08025590>
 801cbd0:	4b8d      	ldr	r3, [pc, #564]	@ (801ce08 <fn_0801CB68+0x2a0>)
 801cbd2:	50e0      	str	r0, [r4, r3]
 801cbd4:	6938      	ldr	r0, [r7, #16]
 801cbd6:	2123      	movs	r1, #35	@ 0x23
 801cbd8:	f008 fcda 	bl	8025590 <fn_08025590>
 801cbdc:	4b8b      	ldr	r3, [pc, #556]	@ (801ce0c <fn_0801CB68+0x2a4>)
 801cbde:	50e0      	str	r0, [r4, r3]
 801cbe0:	2123      	movs	r1, #35	@ 0x23
 801cbe2:	69f0      	ldr	r0, [r6, #28]
 801cbe4:	f008 fcd4 	bl	8025590 <fn_08025590>
 801cbe8:	4b89      	ldr	r3, [pc, #548]	@ (801ce10 <fn_0801CB68+0x2a8>)
 801cbea:	2152      	movs	r1, #82	@ 0x52
 801cbec:	50e0      	str	r0, [r4, r3]
 801cbee:	2000      	movs	r0, #0
 801cbf0:	f7fd fb6a 	bl	801a2c8 <fn_0801A2C8>
 801cbf4:	210a      	movs	r1, #10
 801cbf6:	682b      	ldr	r3, [r5, #0]
 801cbf8:	4a7d      	ldr	r2, [pc, #500]	@ (801cdf0 <fn_0801CB68+0x288>)
 801cbfa:	5099      	str	r1, [r3, r2]
 801cbfc:	4a7b      	ldr	r2, [pc, #492]	@ (801cdec <fn_0801CB68+0x284>)
 801cbfe:	589b      	ldr	r3, [r3, r2]
 801cc00:	2b00      	cmp	r3, #0
 801cc02:	d119      	bne.n	801cc38 <fn_0801CB68+0xd0>
 801cc04:	b002      	add	sp, #8
 801cc06:	bc80      	pop	{r7}
 801cc08:	46b8      	mov	r8, r7
 801cc0a:	bcf0      	pop	{r4, r5, r6, r7}
 801cc0c:	bc01      	pop	{r0}
 801cc0e:	4700      	bx	r0
 801cc10:	2b0a      	cmp	r3, #10
 801cc12:	d803      	bhi.n	801cc1c <fn_0801CB68+0xb4>
 801cc14:	497f      	ldr	r1, [pc, #508]	@ (801ce14 <fn_0801CB68+0x2ac>)
 801cc16:	009a      	lsls	r2, r3, #2
 801cc18:	588a      	ldr	r2, [r1, r2]
 801cc1a:	4697      	mov	pc, r2
 801cc1c:	07da      	lsls	r2, r3, #31
 801cc1e:	d5f1      	bpl.n	801cc04 <fn_0801CB68+0x9c>
 801cc20:	497d      	ldr	r1, [pc, #500]	@ (801ce18 <fn_0801CB68+0x2b0>)
 801cc22:	5862      	ldr	r2, [r4, r1]
 801cc24:	3a01      	subs	r2, #1
 801cc26:	5062      	str	r2, [r4, r1]
 801cc28:	2a00      	cmp	r2, #0
 801cc2a:	d1eb      	bne.n	801cc04 <fn_0801CB68+0x9c>
 801cc2c:	4a70      	ldr	r2, [pc, #448]	@ (801cdf0 <fn_0801CB68+0x288>)
 801cc2e:	3301      	adds	r3, #1
 801cc30:	50a3      	str	r3, [r4, r2]
 801cc32:	2323      	movs	r3, #35	@ 0x23
 801cc34:	5063      	str	r3, [r4, r1]
 801cc36:	e7e5      	b.n	801cc04 <fn_0801CB68+0x9c>
 801cc38:	2103      	movs	r1, #3
 801cc3a:	2000      	movs	r0, #0
 801cc3c:	f7fd fb44 	bl	801a2c8 <fn_0801A2C8>
 801cc40:	2294      	movs	r2, #148	@ 0x94
 801cc42:	682b      	ldr	r3, [r5, #0]
 801cc44:	5c9a      	ldrb	r2, [r3, r2]
 801cc46:	2a02      	cmp	r2, #2
 801cc48:	d000      	beq.n	801cc4c <fn_0801CB68+0xe4>
 801cc4a:	e0bc      	b.n	801cdc6 <fn_0801CB68+0x25e>
 801cc4c:	21ff      	movs	r1, #255	@ 0xff
 801cc4e:	4a73      	ldr	r2, [pc, #460]	@ (801ce1c <fn_0801CB68+0x2b4>)
 801cc50:	5499      	strb	r1, [r3, r2]
 801cc52:	2100      	movs	r1, #0
 801cc54:	4a65      	ldr	r2, [pc, #404]	@ (801cdec <fn_0801CB68+0x284>)
 801cc56:	5099      	str	r1, [r3, r2]
 801cc58:	4a71      	ldr	r2, [pc, #452]	@ (801ce20 <fn_0801CB68+0x2b8>)
 801cc5a:	310a      	adds	r1, #10
 801cc5c:	5099      	str	r1, [r3, r2]
 801cc5e:	e7d1      	b.n	801cc04 <fn_0801CB68+0x9c>
 801cc60:	4b70      	ldr	r3, [pc, #448]	@ (801ce24 <fn_0801CB68+0x2bc>)
 801cc62:	58e3      	ldr	r3, [r4, r3]
 801cc64:	079b      	lsls	r3, r3, #30
 801cc66:	d100      	bne.n	801cc6a <fn_0801CB68+0x102>
 801cc68:	e0a0      	b.n	801cdac <fn_0801CB68+0x244>
 801cc6a:	4b68      	ldr	r3, [pc, #416]	@ (801ce0c <fn_0801CB68+0x2a4>)
 801cc6c:	58e7      	ldr	r7, [r4, r3]
 801cc6e:	3703      	adds	r7, #3
 801cc70:	50e7      	str	r7, [r4, r3]
 801cc72:	4b60      	ldr	r3, [pc, #384]	@ (801cdf4 <fn_0801CB68+0x28c>)
 801cc74:	58e3      	ldr	r3, [r4, r3]
 801cc76:	2123      	movs	r1, #35	@ 0x23
 801cc78:	6918      	ldr	r0, [r3, #16]
 801cc7a:	4698      	mov	r8, r3
 801cc7c:	f008 fc88 	bl	8025590 <fn_08025590>
 801cc80:	0006      	movs	r6, r0
 801cc82:	42b8      	cmp	r0, r7
 801cc84:	dd00      	ble.n	801cc88 <fn_0801CB68+0x120>
 801cc86:	003e      	movs	r6, r7
 801cc88:	4b60      	ldr	r3, [pc, #384]	@ (801ce0c <fn_0801CB68+0x2a4>)
 801cc8a:	50e6      	str	r6, [r4, r3]
 801cc8c:	4b5e      	ldr	r3, [pc, #376]	@ (801ce08 <fn_0801CB68+0x2a0>)
 801cc8e:	58e2      	ldr	r2, [r4, r3]
 801cc90:	3203      	adds	r2, #3
 801cc92:	50e2      	str	r2, [r4, r3]
 801cc94:	4b58      	ldr	r3, [pc, #352]	@ (801cdf8 <fn_0801CB68+0x290>)
 801cc96:	58e7      	ldr	r7, [r4, r3]
 801cc98:	2123      	movs	r1, #35	@ 0x23
 801cc9a:	6bb8      	ldr	r0, [r7, #56]	@ 0x38
 801cc9c:	9200      	str	r2, [sp, #0]
 801cc9e:	f008 fc77 	bl	8025590 <fn_08025590>
 801cca2:	9a00      	ldr	r2, [sp, #0]
 801cca4:	9001      	str	r0, [sp, #4]
 801cca6:	4290      	cmp	r0, r2
 801cca8:	dd00      	ble.n	801ccac <fn_0801CB68+0x144>
 801ccaa:	9201      	str	r2, [sp, #4]
 801ccac:	4b56      	ldr	r3, [pc, #344]	@ (801ce08 <fn_0801CB68+0x2a0>)
 801ccae:	9a01      	ldr	r2, [sp, #4]
 801ccb0:	50e2      	str	r2, [r4, r3]
 801ccb2:	4a57      	ldr	r2, [pc, #348]	@ (801ce10 <fn_0801CB68+0x2a8>)
 801ccb4:	58a3      	ldr	r3, [r4, r2]
 801ccb6:	3303      	adds	r3, #3
 801ccb8:	50a3      	str	r3, [r4, r2]
 801ccba:	2123      	movs	r1, #35	@ 0x23
 801ccbc:	69f8      	ldr	r0, [r7, #28]
 801ccbe:	9300      	str	r3, [sp, #0]
 801ccc0:	f008 fc66 	bl	8025590 <fn_08025590>
 801ccc4:	9b00      	ldr	r3, [sp, #0]
 801ccc6:	4283      	cmp	r3, r0
 801ccc8:	db9c      	blt.n	801cc04 <fn_0801CB68+0x9c>
 801ccca:	4643      	mov	r3, r8
 801cccc:	4a50      	ldr	r2, [pc, #320]	@ (801ce10 <fn_0801CB68+0x2a8>)
 801ccce:	50a0      	str	r0, [r4, r2]
 801ccd0:	2123      	movs	r1, #35	@ 0x23
 801ccd2:	6918      	ldr	r0, [r3, #16]
 801ccd4:	f008 fc5c 	bl	8025590 <fn_08025590>
 801ccd8:	42b0      	cmp	r0, r6
 801ccda:	dc93      	bgt.n	801cc04 <fn_0801CB68+0x9c>
 801ccdc:	2123      	movs	r1, #35	@ 0x23
 801ccde:	6bb8      	ldr	r0, [r7, #56]	@ 0x38
 801cce0:	f008 fc56 	bl	8025590 <fn_08025590>
 801cce4:	9a01      	ldr	r2, [sp, #4]
 801cce6:	4290      	cmp	r0, r2
 801cce8:	dd00      	ble.n	801ccec <fn_0801CB68+0x184>
 801ccea:	e78b      	b.n	801cc04 <fn_0801CB68+0x9c>
 801ccec:	e016      	b.n	801cd1c <fn_0801CB68+0x1b4>
 801ccee:	4f43      	ldr	r7, [pc, #268]	@ (801cdfc <fn_0801CB68+0x294>)
 801ccf0:	59e6      	ldr	r6, [r4, r7]
 801ccf2:	3602      	adds	r6, #2
 801ccf4:	51e6      	str	r6, [r4, r7]
 801ccf6:	4b4b      	ldr	r3, [pc, #300]	@ (801ce24 <fn_0801CB68+0x2bc>)
 801ccf8:	58e3      	ldr	r3, [r4, r3]
 801ccfa:	079b      	lsls	r3, r3, #30
 801ccfc:	d04f      	beq.n	801cd9e <fn_0801CB68+0x236>
 801ccfe:	4b3d      	ldr	r3, [pc, #244]	@ (801cdf4 <fn_0801CB68+0x28c>)
 801cd00:	58e3      	ldr	r3, [r4, r3]
 801cd02:	6858      	ldr	r0, [r3, #4]
 801cd04:	2364      	movs	r3, #100	@ 0x64
 801cd06:	4358      	muls	r0, r3
 801cd08:	4b3b      	ldr	r3, [pc, #236]	@ (801cdf8 <fn_0801CB68+0x290>)
 801cd0a:	58e3      	ldr	r3, [r4, r3]
 801cd0c:	6919      	ldr	r1, [r3, #16]
 801cd0e:	f008 fc3f 	bl	8025590 <fn_08025590>
 801cd12:	42b0      	cmp	r0, r6
 801cd14:	dd00      	ble.n	801cd18 <fn_0801CB68+0x1b0>
 801cd16:	e775      	b.n	801cc04 <fn_0801CB68+0x9c>
 801cd18:	4b38      	ldr	r3, [pc, #224]	@ (801cdfc <fn_0801CB68+0x294>)
 801cd1a:	50e0      	str	r0, [r4, r3]
 801cd1c:	2152      	movs	r1, #82	@ 0x52
 801cd1e:	2000      	movs	r0, #0
 801cd20:	f7fd fad2 	bl	801a2c8 <fn_0801A2C8>
 801cd24:	6829      	ldr	r1, [r5, #0]
 801cd26:	4a32      	ldr	r2, [pc, #200]	@ (801cdf0 <fn_0801CB68+0x288>)
 801cd28:	588b      	ldr	r3, [r1, r2]
 801cd2a:	3301      	adds	r3, #1
 801cd2c:	508b      	str	r3, [r1, r2]
 801cd2e:	e769      	b.n	801cc04 <fn_0801CB68+0x9c>
 801cd30:	4f33      	ldr	r7, [pc, #204]	@ (801ce00 <fn_0801CB68+0x298>)
 801cd32:	59e6      	ldr	r6, [r4, r7]
 801cd34:	3602      	adds	r6, #2
 801cd36:	51e6      	str	r6, [r4, r7]
 801cd38:	4b3a      	ldr	r3, [pc, #232]	@ (801ce24 <fn_0801CB68+0x2bc>)
 801cd3a:	58e3      	ldr	r3, [r4, r3]
 801cd3c:	079b      	lsls	r3, r3, #30
 801cd3e:	d03b      	beq.n	801cdb8 <fn_0801CB68+0x250>
 801cd40:	4b2c      	ldr	r3, [pc, #176]	@ (801cdf4 <fn_0801CB68+0x28c>)
 801cd42:	58e3      	ldr	r3, [r4, r3]
 801cd44:	6898      	ldr	r0, [r3, #8]
 801cd46:	2364      	movs	r3, #100	@ 0x64
 801cd48:	4358      	muls	r0, r3
 801cd4a:	4b2b      	ldr	r3, [pc, #172]	@ (801cdf8 <fn_0801CB68+0x290>)
 801cd4c:	58e3      	ldr	r3, [r4, r3]
 801cd4e:	6959      	ldr	r1, [r3, #20]
 801cd50:	f008 fc1e 	bl	8025590 <fn_08025590>
 801cd54:	42b0      	cmp	r0, r6
 801cd56:	dd00      	ble.n	801cd5a <fn_0801CB68+0x1f2>
 801cd58:	e754      	b.n	801cc04 <fn_0801CB68+0x9c>
 801cd5a:	4b29      	ldr	r3, [pc, #164]	@ (801ce00 <fn_0801CB68+0x298>)
 801cd5c:	e7dd      	b.n	801cd1a <fn_0801CB68+0x1b2>
 801cd5e:	4f29      	ldr	r7, [pc, #164]	@ (801ce04 <fn_0801CB68+0x29c>)
 801cd60:	59e6      	ldr	r6, [r4, r7]
 801cd62:	3602      	adds	r6, #2
 801cd64:	51e6      	str	r6, [r4, r7]
 801cd66:	4b2f      	ldr	r3, [pc, #188]	@ (801ce24 <fn_0801CB68+0x2bc>)
 801cd68:	58e3      	ldr	r3, [r4, r3]
 801cd6a:	079b      	lsls	r3, r3, #30
 801cd6c:	d010      	beq.n	801cd90 <fn_0801CB68+0x228>
 801cd6e:	4b22      	ldr	r3, [pc, #136]	@ (801cdf8 <fn_0801CB68+0x290>)
 801cd70:	58e3      	ldr	r3, [r4, r3]
 801cd72:	6999      	ldr	r1, [r3, #24]
 801cd74:	2064      	movs	r0, #100	@ 0x64
 801cd76:	2900      	cmp	r1, #0
 801cd78:	d005      	beq.n	801cd86 <fn_0801CB68+0x21e>
 801cd7a:	4b1e      	ldr	r3, [pc, #120]	@ (801cdf4 <fn_0801CB68+0x28c>)
 801cd7c:	58e3      	ldr	r3, [r4, r3]
 801cd7e:	68db      	ldr	r3, [r3, #12]
 801cd80:	4358      	muls	r0, r3
 801cd82:	f008 fc05 	bl	8025590 <fn_08025590>
 801cd86:	42b0      	cmp	r0, r6
 801cd88:	dd00      	ble.n	801cd8c <fn_0801CB68+0x224>
 801cd8a:	e73b      	b.n	801cc04 <fn_0801CB68+0x9c>
 801cd8c:	4b1d      	ldr	r3, [pc, #116]	@ (801ce04 <fn_0801CB68+0x29c>)
 801cd8e:	e7c4      	b.n	801cd1a <fn_0801CB68+0x1b2>
 801cd90:	2101      	movs	r1, #1
 801cd92:	2000      	movs	r0, #0
 801cd94:	f7fd fa98 	bl	801a2c8 <fn_0801A2C8>
 801cd98:	682c      	ldr	r4, [r5, #0]
 801cd9a:	59e6      	ldr	r6, [r4, r7]
 801cd9c:	e7e7      	b.n	801cd6e <fn_0801CB68+0x206>
 801cd9e:	2101      	movs	r1, #1
 801cda0:	2000      	movs	r0, #0
 801cda2:	f7fd fa91 	bl	801a2c8 <fn_0801A2C8>
 801cda6:	682c      	ldr	r4, [r5, #0]
 801cda8:	59e6      	ldr	r6, [r4, r7]
 801cdaa:	e7a8      	b.n	801ccfe <fn_0801CB68+0x196>
 801cdac:	2101      	movs	r1, #1
 801cdae:	2000      	movs	r0, #0
 801cdb0:	f7fd fa8a 	bl	801a2c8 <fn_0801A2C8>
 801cdb4:	682c      	ldr	r4, [r5, #0]
 801cdb6:	e758      	b.n	801cc6a <fn_0801CB68+0x102>
 801cdb8:	2101      	movs	r1, #1
 801cdba:	2000      	movs	r0, #0
 801cdbc:	f7fd fa84 	bl	801a2c8 <fn_0801A2C8>
 801cdc0:	682c      	ldr	r4, [r5, #0]
 801cdc2:	59e6      	ldr	r6, [r4, r7]
 801cdc4:	e7bc      	b.n	801cd40 <fn_0801CB68+0x1d8>
 801cdc6:	22dc      	movs	r2, #220	@ 0xdc
 801cdc8:	589a      	ldr	r2, [r3, r2]
 801cdca:	2a08      	cmp	r2, #8
 801cdcc:	d009      	beq.n	801cde2 <fn_0801CB68+0x27a>
 801cdce:	2101      	movs	r1, #1
 801cdd0:	4a12      	ldr	r2, [pc, #72]	@ (801ce1c <fn_0801CB68+0x2b4>)
 801cdd2:	5499      	strb	r1, [r3, r2]
 801cdd4:	2100      	movs	r1, #0
 801cdd6:	4a05      	ldr	r2, [pc, #20]	@ (801cdec <fn_0801CB68+0x284>)
 801cdd8:	5099      	str	r1, [r3, r2]
 801cdda:	4a11      	ldr	r2, [pc, #68]	@ (801ce20 <fn_0801CB68+0x2b8>)
 801cddc:	318c      	adds	r1, #140	@ 0x8c
 801cdde:	5099      	str	r1, [r3, r2]
 801cde0:	e710      	b.n	801cc04 <fn_0801CB68+0x9c>
 801cde2:	f7e6 fbbf 	bl	8003564 <fn_08003564>
 801cde6:	e70d      	b.n	801cc04 <fn_0801CB68+0x9c>
 801cde8:	030064c4 	.word	0x030064c4	@ data_030064C4
 801cdec:	00005a38 	.word	0x00005a38
 801cdf0:	00005a88 	.word	0x00005a88
 801cdf4:	00005a44 	.word	0x00005a44
 801cdf8:	00005a40 	.word	0x00005a40
 801cdfc:	00005a8c 	.word	0x00005a8c
 801ce00:	00005a90 	.word	0x00005a90
 801ce04:	00005a94 	.word	0x00005a94
 801ce08:	00005a54 	.word	0x00005a54
 801ce0c:	00005a50 	.word	0x00005a50
 801ce10:	00005a58 	.word	0x00005a58
 801ce14:	081477d8 	.word	0x081477d8
 801ce18:	00005a5c 	.word	0x00005a5c
 801ce1c:	00005a3c 	.word	0x00005a3c
 801ce20:	00005a48 	.word	0x00005a48
 801ce24:	00005a4c 	.word	0x00005a4c
