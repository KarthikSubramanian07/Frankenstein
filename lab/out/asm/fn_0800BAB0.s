fn_0800BAB0:
 800bab0:	b5f0      	push	{r4, r5, r6, r7, lr}
 800bab2:	4657      	mov	r7, sl
 800bab4:	464e      	mov	r6, r9
 800bab6:	4645      	mov	r5, r8
 800bab8:	46de      	mov	lr, fp
 800baba:	b5e0      	push	{r5, r6, r7, lr}
 800babc:	4fcb      	ldr	r7, [pc, #812]	@ (800bdec <fn_0800BAB0+0x33c>)
 800babe:	4bcc      	ldr	r3, [pc, #816]	@ (800bdf0 <fn_0800BAB0+0x340>)
 800bac0:	683a      	ldr	r2, [r7, #0]
 800bac2:	8bc1      	ldrh	r1, [r0, #30]
 800bac4:	58d3      	ldr	r3, [r2, r3]
 800bac6:	0089      	lsls	r1, r1, #2
 800bac8:	185b      	adds	r3, r3, r1
 800baca:	78db      	ldrb	r3, [r3, #3]
 800bacc:	0005      	movs	r5, r0
 800bace:	4681      	mov	r9, r0
 800bad0:	b089      	sub	sp, #36	@ 0x24
 800bad2:	0659      	lsls	r1, r3, #25
 800bad4:	d56b      	bpl.n	800bbae <fn_0800BAB0+0xfe>
 800bad6:	2300      	movs	r3, #0
 800bad8:	469a      	mov	sl, r3
 800bada:	469b      	mov	fp, r3
 800badc:	9301      	str	r3, [sp, #4]
 800bade:	9302      	str	r3, [sp, #8]
 800bae0:	4bc4      	ldr	r3, [pc, #784]	@ (800bdf4 <fn_0800BAB0+0x344>)
 800bae2:	9303      	str	r3, [sp, #12]
 800bae4:	2300      	movs	r3, #0
 800bae6:	2401      	movs	r4, #1
 800bae8:	4698      	mov	r8, r3
 800baea:	4ec3      	ldr	r6, [pc, #780]	@ (800bdf8 <fn_0800BAB0+0x348>)
 800baec:	4264      	negs	r4, r4
 800baee:	0021      	movs	r1, r4
 800baf0:	4648      	mov	r0, r9
 800baf2:	f009 fb21 	bl	8015138 <fn_08015138>
 800baf6:	1e04      	subs	r4, r0, #0
 800baf8:	da00      	bge.n	800bafc <fn_0800BAB0+0x4c>
 800bafa:	e090      	b.n	800bc1e <fn_0800BAB0+0x16e>
 800bafc:	22df      	movs	r2, #223	@ 0xdf
 800bafe:	6839      	ldr	r1, [r7, #0]
 800bb00:	00a3      	lsls	r3, r4, #2
 800bb02:	0112      	lsls	r2, r2, #4
 800bb04:	588d      	ldr	r5, [r1, r2]
 800bb06:	191b      	adds	r3, r3, r4
 800bb08:	00db      	lsls	r3, r3, #3
 800bb0a:	18ed      	adds	r5, r5, r3
 800bb0c:	0029      	movs	r1, r5
 800bb0e:	2000      	movs	r0, #0
 800bb10:	f009 fcb0 	bl	8015474 <fn_08015474>
 800bb14:	2800      	cmp	r0, #0
 800bb16:	d1ea      	bne.n	800baee <fn_0800BAB0+0x3e>
 800bb18:	9005      	str	r0, [sp, #20]
 800bb1a:	2200      	movs	r2, #0
 800bb1c:	2103      	movs	r1, #3
 800bb1e:	202c      	movs	r0, #44	@ 0x2c
 800bb20:	f011 fe04 	bl	801d72c <fn_0801D72C>
 800bb24:	4680      	mov	r8, r0
 800bb26:	222c      	movs	r2, #44	@ 0x2c
 800bb28:	2100      	movs	r1, #0
 800bb2a:	9004      	str	r0, [sp, #16]
 800bb2c:	f014 ff88 	bl	8020a40 <fn_08020A40>
 800bb30:	4640      	mov	r0, r8
 800bb32:	f00c fd4d 	bl	80185d0 <fn_080185D0>
 800bb36:	4642      	mov	r2, r8
 800bb38:	4bb0      	ldr	r3, [pc, #704]	@ (800bdfc <fn_0800BAB0+0x34c>)
 800bb3a:	612a      	str	r2, [r5, #16]
 800bb3c:	6093      	str	r3, [r2, #8]
 800bb3e:	2301      	movs	r3, #1
 800bb40:	9903      	ldr	r1, [sp, #12]
 800bb42:	400b      	ands	r3, r1
 800bb44:	7353      	strb	r3, [r2, #13]
 800bb46:	465b      	mov	r3, fp
 800bb48:	2b00      	cmp	r3, #0
 800bb4a:	d100      	bne.n	800bb4e <fn_0800BAB0+0x9e>
 800bb4c:	e07f      	b.n	800bc4e <fn_0800BAB0+0x19e>
 800bb4e:	2380      	movs	r3, #128	@ 0x80
 800bb50:	039b      	lsls	r3, r3, #14
 800bb52:	9306      	str	r3, [sp, #24]
 800bb54:	2301      	movs	r3, #1
 800bb56:	20c0      	movs	r0, #192	@ 0xc0
 800bb58:	4698      	mov	r8, r3
 800bb5a:	0340      	lsls	r0, r0, #13
 800bb5c:	4643      	mov	r3, r8
 800bb5e:	9a04      	ldr	r2, [sp, #16]
 800bb60:	6153      	str	r3, [r2, #20]
 800bb62:	2324      	movs	r3, #36	@ 0x24
 800bb64:	6115      	str	r5, [r2, #16]
 800bb66:	5ceb      	ldrb	r3, [r5, r3]
 800bb68:	8413      	strh	r3, [r2, #32]
 800bb6a:	2120      	movs	r1, #32
 800bb6c:	5e6b      	ldrsh	r3, [r5, r1]
 800bb6e:	6193      	str	r3, [r2, #24]
 800bb70:	2327      	movs	r3, #39	@ 0x27
 800bb72:	5ceb      	ldrb	r3, [r5, r3]
 800bb74:	9a02      	ldr	r2, [sp, #8]
 800bb76:	075b      	lsls	r3, r3, #29
 800bb78:	0fdb      	lsrs	r3, r3, #31
 800bb7a:	2a02      	cmp	r2, #2
 800bb7c:	d100      	bne.n	800bb80 <fn_0800BAB0+0xd0>
 800bb7e:	e0f5      	b.n	800bd6c <fn_0800BAB0+0x2bc>
 800bb80:	2a03      	cmp	r2, #3
 800bb82:	d100      	bne.n	800bb86 <fn_0800BAB0+0xd6>
 800bb84:	e0ef      	b.n	800bd66 <fn_0800BAB0+0x2b6>
 800bb86:	1e51      	subs	r1, r2, #1
 800bb88:	424a      	negs	r2, r1
 800bb8a:	414a      	adcs	r2, r1
 800bb8c:	2180      	movs	r1, #128	@ 0x80
 800bb8e:	0412      	lsls	r2, r2, #16
 800bb90:	0249      	lsls	r1, r1, #9
 800bb92:	1852      	adds	r2, r2, r1
 800bb94:	9904      	ldr	r1, [sp, #16]
 800bb96:	61cb      	str	r3, [r1, #28]
 800bb98:	2311      	movs	r3, #17
 800bb9a:	730b      	strb	r3, [r1, #12]
 800bb9c:	9b01      	ldr	r3, [sp, #4]
 800bb9e:	628a      	str	r2, [r1, #40]	@ 0x28
 800bba0:	2b07      	cmp	r3, #7
 800bba2:	d900      	bls.n	800bba6 <fn_0800BAB0+0xf6>
 800bba4:	e0e9      	b.n	800bd7a <fn_0800BAB0+0x2ca>
 800bba6:	4a96      	ldr	r2, [pc, #600]	@ (800be00 <fn_0800BAB0+0x350>)
 800bba8:	009b      	lsls	r3, r3, #2
 800bbaa:	58d3      	ldr	r3, [r2, r3]
 800bbac:	469f      	mov	pc, r3
 800bbae:	201a      	movs	r0, #26
 800bbb0:	5e29      	ldrsh	r1, [r5, r0]
 800bbb2:	2003      	movs	r0, #3
 800bbb4:	09db      	lsrs	r3, r3, #7
 800bbb6:	021b      	lsls	r3, r3, #8
 800bbb8:	404b      	eors	r3, r1
 800bbba:	498f      	ldr	r1, [pc, #572]	@ (800bdf8 <fn_0800BAB0+0x348>)
 800bbbc:	185e      	adds	r6, r3, r1
 800bbbe:	0b31      	lsrs	r1, r6, #12
 800bbc0:	9103      	str	r1, [sp, #12]
 800bbc2:	0ab1      	lsrs	r1, r6, #10
 800bbc4:	4001      	ands	r1, r0
 800bbc6:	468a      	mov	sl, r1
 800bbc8:	2107      	movs	r1, #7
 800bbca:	09f4      	lsrs	r4, r6, #7
 800bbcc:	400c      	ands	r4, r1
 800bbce:	9401      	str	r4, [sp, #4]
 800bbd0:	0674      	lsls	r4, r6, #25
 800bbd2:	0fe4      	lsrs	r4, r4, #31
 800bbd4:	46a3      	mov	fp, r4
 800bbd6:	4019      	ands	r1, r3
 800bbd8:	08f4      	lsrs	r4, r6, #3
 800bbda:	4020      	ands	r0, r4
 800bbdc:	3906      	subs	r1, #6
 800bbde:	9002      	str	r0, [sp, #8]
 800bbe0:	2901      	cmp	r1, #1
 800bbe2:	d900      	bls.n	800bbe6 <fn_0800BAB0+0x136>
 800bbe4:	e0fd      	b.n	800bde2 <fn_0800BAB0+0x332>
 800bbe6:	8ae8      	ldrh	r0, [r5, #22]
 800bbe8:	4b86      	ldr	r3, [pc, #536]	@ (800be04 <fn_0800BAB0+0x354>)
 800bbea:	4298      	cmp	r0, r3
 800bbec:	d015      	beq.n	800bc1a <fn_0800BAB0+0x16a>
 800bbee:	4b86      	ldr	r3, [pc, #536]	@ (800be08 <fn_0800BAB0+0x358>)
 800bbf0:	58d1      	ldr	r1, [r2, r3]
 800bbf2:	0043      	lsls	r3, r0, #1
 800bbf4:	181b      	adds	r3, r3, r0
 800bbf6:	009b      	lsls	r3, r3, #2
 800bbf8:	18c9      	adds	r1, r1, r3
 800bbfa:	894b      	ldrh	r3, [r1, #10]
 800bbfc:	009c      	lsls	r4, r3, #2
 800bbfe:	18e4      	adds	r4, r4, r3
 800bc00:	23df      	movs	r3, #223	@ 0xdf
 800bc02:	011b      	lsls	r3, r3, #4
 800bc04:	58d5      	ldr	r5, [r2, r3]
 800bc06:	00e4      	lsls	r4, r4, #3
 800bc08:	192d      	adds	r5, r5, r4
 800bc0a:	2d00      	cmp	r5, #0
 800bc0c:	d005      	beq.n	800bc1a <fn_0800BAB0+0x16a>
 800bc0e:	0029      	movs	r1, r5
 800bc10:	2000      	movs	r0, #0
 800bc12:	f009 fc2f 	bl	8015474 <fn_08015474>
 800bc16:	2800      	cmp	r0, #0
 800bc18:	d00b      	beq.n	800bc32 <fn_0800BAB0+0x182>
 800bc1a:	2300      	movs	r3, #0
 800bc1c:	4698      	mov	r8, r3
 800bc1e:	4640      	mov	r0, r8
 800bc20:	b009      	add	sp, #36	@ 0x24
 800bc22:	bcf0      	pop	{r4, r5, r6, r7}
 800bc24:	46bb      	mov	fp, r7
 800bc26:	46b2      	mov	sl, r6
 800bc28:	46a9      	mov	r9, r5
 800bc2a:	46a0      	mov	r8, r4
 800bc2c:	bcf0      	pop	{r4, r5, r6, r7}
 800bc2e:	bc02      	pop	{r1}
 800bc30:	4708      	bx	r1
 800bc32:	10e3      	asrs	r3, r4, #3
 800bc34:	08a4      	lsrs	r4, r4, #2
 800bc36:	18e4      	adds	r4, r4, r3
 800bc38:	0122      	lsls	r2, r4, #4
 800bc3a:	18a4      	adds	r4, r4, r2
 800bc3c:	0222      	lsls	r2, r4, #8
 800bc3e:	18a4      	adds	r4, r4, r2
 800bc40:	0422      	lsls	r2, r4, #16
 800bc42:	18a4      	adds	r4, r4, r2
 800bc44:	00a4      	lsls	r4, r4, #2
 800bc46:	18e4      	adds	r4, r4, r3
 800bc48:	2301      	movs	r3, #1
 800bc4a:	9305      	str	r3, [sp, #20]
 800bc4c:	e765      	b.n	800bb1a <fn_0800BAB0+0x6a>
 800bc4e:	4b6f      	ldr	r3, [pc, #444]	@ (800be0c <fn_0800BAB0+0x35c>)
 800bc50:	9306      	str	r3, [sp, #24]
 800bc52:	2301      	movs	r3, #1
 800bc54:	425b      	negs	r3, r3
 800bc56:	4698      	mov	r8, r3
 800bc58:	486d      	ldr	r0, [pc, #436]	@ (800be10 <fn_0800BAB0+0x360>)
 800bc5a:	e77f      	b.n	800bb5c <fn_0800BAB0+0xac>
 800bc5c:	6828      	ldr	r0, [r5, #0]
 800bc5e:	9b06      	ldr	r3, [sp, #24]
 800bc60:	18c0      	adds	r0, r0, r3
 800bc62:	e016      	b.n	800bc92 <fn_0800BAB0+0x1e2>
 800bc64:	682b      	ldr	r3, [r5, #0]
 800bc66:	18c0      	adds	r0, r0, r3
 800bc68:	e013      	b.n	800bc92 <fn_0800BAB0+0x1e2>
 800bc6a:	0020      	movs	r0, r4
 800bc6c:	2302      	movs	r3, #2
 800bc6e:	5eed      	ldrsh	r5, [r5, r3]
 800bc70:	f009 f8b2 	bl	8014dd8 <fn_08014DD8>
 800bc74:	22fa      	movs	r2, #250	@ 0xfa
 800bc76:	1400      	asrs	r0, r0, #16
 800bc78:	4643      	mov	r3, r8
 800bc7a:	4343      	muls	r3, r0
 800bc7c:	195b      	adds	r3, r3, r5
 800bc7e:	01d2      	lsls	r2, r2, #7
 800bc80:	4293      	cmp	r3, r2
 800bc82:	dd00      	ble.n	800bc86 <fn_0800BAB0+0x1d6>
 800bc84:	e09c      	b.n	800bdc0 <fn_0800BAB0+0x310>
 800bc86:	2083      	movs	r0, #131	@ 0x83
 800bc88:	4a62      	ldr	r2, [pc, #392]	@ (800be14 <fn_0800BAB0+0x364>)
 800bc8a:	0600      	lsls	r0, r0, #24
 800bc8c:	4293      	cmp	r3, r2
 800bc8e:	db00      	blt.n	800bc92 <fn_0800BAB0+0x1e2>
 800bc90:	e0a5      	b.n	800bdde <fn_0800BAB0+0x32e>
 800bc92:	9b04      	ldr	r3, [sp, #16]
 800bc94:	6258      	str	r0, [r3, #36]	@ 0x24
 800bc96:	4653      	mov	r3, sl
 800bc98:	2b00      	cmp	r3, #0
 800bc9a:	d015      	beq.n	800bcc8 <fn_0800BAB0+0x218>
 800bc9c:	06b3      	lsls	r3, r6, #26
 800bc9e:	d542      	bpl.n	800bd26 <fn_0800BAB0+0x276>
 800bca0:	0021      	movs	r1, r4
 800bca2:	f009 f97d 	bl	8014fa0 <fn_08014FA0>
 800bca6:	2800      	cmp	r0, #0
 800bca8:	d00e      	beq.n	800bcc8 <fn_0800BAB0+0x218>
 800bcaa:	2324      	movs	r3, #36	@ 0x24
 800bcac:	9a04      	ldr	r2, [sp, #16]
 800bcae:	5cc3      	ldrb	r3, [r0, r3]
 800bcb0:	8413      	strh	r3, [r2, #32]
 800bcb2:	4653      	mov	r3, sl
 800bcb4:	2b02      	cmp	r3, #2
 800bcb6:	d05d      	beq.n	800bd74 <fn_0800BAB0+0x2c4>
 800bcb8:	2b03      	cmp	r3, #3
 800bcba:	d100      	bne.n	800bcbe <fn_0800BAB0+0x20e>
 800bcbc:	e083      	b.n	800bdc6 <fn_0800BAB0+0x316>
 800bcbe:	2300      	movs	r3, #0
 800bcc0:	6193      	str	r3, [r2, #24]
 800bcc2:	61d3      	str	r3, [r2, #28]
 800bcc4:	3313      	adds	r3, #19
 800bcc6:	7313      	strb	r3, [r2, #12]
 800bcc8:	9b05      	ldr	r3, [sp, #20]
 800bcca:	2b00      	cmp	r3, #0
 800bccc:	d128      	bne.n	800bd20 <fn_0800BAB0+0x270>
 800bcce:	3301      	adds	r3, #1
 800bcd0:	4698      	mov	r8, r3
 800bcd2:	e70c      	b.n	800baee <fn_0800BAB0+0x3e>
 800bcd4:	9b04      	ldr	r3, [sp, #16]
 800bcd6:	6868      	ldr	r0, [r5, #4]
 800bcd8:	6258      	str	r0, [r3, #36]	@ 0x24
 800bcda:	4653      	mov	r3, sl
 800bcdc:	2b00      	cmp	r3, #0
 800bcde:	d0f3      	beq.n	800bcc8 <fn_0800BAB0+0x218>
 800bce0:	06b3      	lsls	r3, r6, #26
 800bce2:	d520      	bpl.n	800bd26 <fn_0800BAB0+0x276>
 800bce4:	0021      	movs	r1, r4
 800bce6:	f009 f9c1 	bl	801506c <fn_0801506C>
 800bcea:	e7dc      	b.n	800bca6 <fn_0800BAB0+0x1f6>
 800bcec:	465b      	mov	r3, fp
 800bcee:	0028      	movs	r0, r5
 800bcf0:	6829      	ldr	r1, [r5, #0]
 800bcf2:	2b00      	cmp	r3, #0
 800bcf4:	d061      	beq.n	800bdba <fn_0800BAB0+0x30a>
 800bcf6:	f008 fd87 	bl	8014808 <fn_08014808>
 800bcfa:	e7ca      	b.n	800bc92 <fn_0800BAB0+0x1e2>
 800bcfc:	0028      	movs	r0, r5
 800bcfe:	f008 fcdf 	bl	80146c0 <fn_080146C0>
 800bd02:	9b04      	ldr	r3, [sp, #16]
 800bd04:	6258      	str	r0, [r3, #36]	@ 0x24
 800bd06:	4653      	mov	r3, sl
 800bd08:	2b00      	cmp	r3, #0
 800bd0a:	d1c7      	bne.n	800bc9c <fn_0800BAB0+0x1ec>
 800bd0c:	e7dc      	b.n	800bcc8 <fn_0800BAB0+0x218>
 800bd0e:	0028      	movs	r0, r5
 800bd10:	f008 ffba 	bl	8014c88 <fn_08014C88>
 800bd14:	9b04      	ldr	r3, [sp, #16]
 800bd16:	6258      	str	r0, [r3, #36]	@ 0x24
 800bd18:	4653      	mov	r3, sl
 800bd1a:	2b00      	cmp	r3, #0
 800bd1c:	d1e0      	bne.n	800bce0 <fn_0800BAB0+0x230>
 800bd1e:	e7d3      	b.n	800bcc8 <fn_0800BAB0+0x218>
 800bd20:	2301      	movs	r3, #1
 800bd22:	4698      	mov	r8, r3
 800bd24:	e77b      	b.n	800bc1e <fn_0800BAB0+0x16e>
 800bd26:	22df      	movs	r2, #223	@ 0xdf
 800bd28:	683b      	ldr	r3, [r7, #0]
 800bd2a:	4937      	ldr	r1, [pc, #220]	@ (800be08 <fn_0800BAB0+0x358>)
 800bd2c:	0112      	lsls	r2, r2, #4
 800bd2e:	589a      	ldr	r2, [r3, r2]
 800bd30:	5859      	ldr	r1, [r3, r1]
 800bd32:	464b      	mov	r3, r9
 800bd34:	8a98      	ldrh	r0, [r3, #20]
 800bd36:	0043      	lsls	r3, r0, #1
 800bd38:	181b      	adds	r3, r3, r0
 800bd3a:	009b      	lsls	r3, r3, #2
 800bd3c:	18cb      	adds	r3, r1, r3
 800bd3e:	8958      	ldrh	r0, [r3, #10]
 800bd40:	0083      	lsls	r3, r0, #2
 800bd42:	181b      	adds	r3, r3, r0
 800bd44:	00db      	lsls	r3, r3, #3
 800bd46:	18d3      	adds	r3, r2, r3
 800bd48:	3324      	adds	r3, #36	@ 0x24
 800bd4a:	781b      	ldrb	r3, [r3, #0]
 800bd4c:	9804      	ldr	r0, [sp, #16]
 800bd4e:	8403      	strh	r3, [r0, #32]
 800bd50:	4653      	mov	r3, sl
 800bd52:	2b02      	cmp	r3, #2
 800bd54:	d00d      	beq.n	800bd72 <fn_0800BAB0+0x2c2>
 800bd56:	2b03      	cmp	r3, #3
 800bd58:	d018      	beq.n	800bd8c <fn_0800BAB0+0x2dc>
 800bd5a:	2300      	movs	r3, #0
 800bd5c:	6183      	str	r3, [r0, #24]
 800bd5e:	61c3      	str	r3, [r0, #28]
 800bd60:	3313      	adds	r3, #19
 800bd62:	7303      	strb	r3, [r0, #12]
 800bd64:	e7b0      	b.n	800bcc8 <fn_0800BAB0+0x218>
 800bd66:	2280      	movs	r2, #128	@ 0x80
 800bd68:	0312      	lsls	r2, r2, #12
 800bd6a:	e713      	b.n	800bb94 <fn_0800BAB0+0xe4>
 800bd6c:	2280      	movs	r2, #128	@ 0x80
 800bd6e:	02d2      	lsls	r2, r2, #11
 800bd70:	e710      	b.n	800bb94 <fn_0800BAB0+0xe4>
 800bd72:	0002      	movs	r2, r0
 800bd74:	2312      	movs	r3, #18
 800bd76:	7313      	strb	r3, [r2, #12]
 800bd78:	e7a6      	b.n	800bcc8 <fn_0800BAB0+0x218>
 800bd7a:	0028      	movs	r0, r5
 800bd7c:	f008 fcf0 	bl	8014760 <fn_08014760>
 800bd80:	9b04      	ldr	r3, [sp, #16]
 800bd82:	6258      	str	r0, [r3, #36]	@ 0x24
 800bd84:	4653      	mov	r3, sl
 800bd86:	2b00      	cmp	r3, #0
 800bd88:	d188      	bne.n	800bc9c <fn_0800BAB0+0x1ec>
 800bd8a:	e79d      	b.n	800bcc8 <fn_0800BAB0+0x218>
 800bd8c:	464b      	mov	r3, r9
 800bd8e:	8a98      	ldrh	r0, [r3, #20]
 800bd90:	0043      	lsls	r3, r0, #1
 800bd92:	181b      	adds	r3, r3, r0
 800bd94:	009b      	lsls	r3, r3, #2
 800bd96:	18c9      	adds	r1, r1, r3
 800bd98:	8949      	ldrh	r1, [r1, #10]
 800bd9a:	008b      	lsls	r3, r1, #2
 800bd9c:	185b      	adds	r3, r3, r1
 800bd9e:	00db      	lsls	r3, r3, #3
 800bda0:	18d2      	adds	r2, r2, r3
 800bda2:	2120      	movs	r1, #32
 800bda4:	5e53      	ldrsh	r3, [r2, r1]
 800bda6:	9904      	ldr	r1, [sp, #16]
 800bda8:	618b      	str	r3, [r1, #24]
 800bdaa:	2327      	movs	r3, #39	@ 0x27
 800bdac:	5cd3      	ldrb	r3, [r2, r3]
 800bdae:	075b      	lsls	r3, r3, #29
 800bdb0:	0fdb      	lsrs	r3, r3, #31
 800bdb2:	61cb      	str	r3, [r1, #28]
 800bdb4:	2314      	movs	r3, #20
 800bdb6:	730b      	strb	r3, [r1, #12]
 800bdb8:	e786      	b.n	800bcc8 <fn_0800BAB0+0x218>
 800bdba:	f008 fdb5 	bl	8014928 <fn_08014928>
 800bdbe:	e768      	b.n	800bc92 <fn_0800BAB0+0x1e2>
 800bdc0:	20fa      	movs	r0, #250	@ 0xfa
 800bdc2:	05c0      	lsls	r0, r0, #23
 800bdc4:	e765      	b.n	800bc92 <fn_0800BAB0+0x1e2>
 800bdc6:	2220      	movs	r2, #32
 800bdc8:	5e83      	ldrsh	r3, [r0, r2]
 800bdca:	9a04      	ldr	r2, [sp, #16]
 800bdcc:	6193      	str	r3, [r2, #24]
 800bdce:	2327      	movs	r3, #39	@ 0x27
 800bdd0:	5cc3      	ldrb	r3, [r0, r3]
 800bdd2:	075b      	lsls	r3, r3, #29
 800bdd4:	0fdb      	lsrs	r3, r3, #31
 800bdd6:	61d3      	str	r3, [r2, #28]
 800bdd8:	2314      	movs	r3, #20
 800bdda:	7313      	strb	r3, [r2, #12]
 800bddc:	e774      	b.n	800bcc8 <fn_0800BAB0+0x218>
 800bdde:	0418      	lsls	r0, r3, #16
 800bde0:	e757      	b.n	800bc92 <fn_0800BAB0+0x1e2>
 800bde2:	2300      	movs	r3, #0
 800bde4:	2401      	movs	r4, #1
 800bde6:	4698      	mov	r8, r3
 800bde8:	4264      	negs	r4, r4
 800bdea:	e680      	b.n	800baee <fn_0800BAB0+0x3e>
 800bdec:	030064c4 	.word	0x030064c4
 800bdf0:	00000e04 	.word	0x00000e04
 800bdf4:	000ffffa 	.word	0x000ffffa
 800bdf8:	ffffa000 	.word	0xffffa000
 800bdfc:	0800a579 	.word	0x0800a579
 800be00:	0812e650 	.word	0x0812e650
 800be04:	0000ffff 	.word	0x0000ffff
 800be08:	00000e0c 	.word	0x00000e0c
 800be0c:	ffe00000 	.word	0xffe00000
 800be10:	ffe80000 	.word	0xffe80000
 800be14:	ffff8300 	.word	0xffff8300
