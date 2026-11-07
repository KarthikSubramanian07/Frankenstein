fn_0800BE18:
 800be18:	b5f0      	push	{r4, r5, r6, r7, lr}
 800be1a:	4657      	mov	r7, sl
 800be1c:	464e      	mov	r6, r9
 800be1e:	4645      	mov	r5, r8
 800be20:	46de      	mov	lr, fp
 800be22:	b5e0      	push	{r5, r6, r7, lr}
 800be24:	4fcd      	ldr	r7, [pc, #820]	@ (800c15c <fn_0800BE18+0x344>)
 800be26:	4bce      	ldr	r3, [pc, #824]	@ (800c160 <fn_0800BE18+0x348>)
 800be28:	683a      	ldr	r2, [r7, #0]
 800be2a:	8bc1      	ldrh	r1, [r0, #30]
 800be2c:	58d3      	ldr	r3, [r2, r3]
 800be2e:	0089      	lsls	r1, r1, #2
 800be30:	185b      	adds	r3, r3, r1
 800be32:	78db      	ldrb	r3, [r3, #3]
 800be34:	0005      	movs	r5, r0
 800be36:	4681      	mov	r9, r0
 800be38:	b089      	sub	sp, #36	@ 0x24
 800be3a:	0659      	lsls	r1, r3, #25
 800be3c:	d571      	bpl.n	800bf22 <fn_0800BE18+0x10a>
 800be3e:	2300      	movs	r3, #0
 800be40:	469b      	mov	fp, r3
 800be42:	469a      	mov	sl, r3
 800be44:	9301      	str	r3, [sp, #4]
 800be46:	9302      	str	r3, [sp, #8]
 800be48:	4bc6      	ldr	r3, [pc, #792]	@ (800c164 <fn_0800BE18+0x34c>)
 800be4a:	9303      	str	r3, [sp, #12]
 800be4c:	2300      	movs	r3, #0
 800be4e:	2401      	movs	r4, #1
 800be50:	4698      	mov	r8, r3
 800be52:	4ec5      	ldr	r6, [pc, #788]	@ (800c168 <fn_0800BE18+0x350>)
 800be54:	4264      	negs	r4, r4
 800be56:	0021      	movs	r1, r4
 800be58:	4648      	mov	r0, r9
 800be5a:	f009 f913 	bl	8015084 <fn_08015084>
 800be5e:	1e04      	subs	r4, r0, #0
 800be60:	da00      	bge.n	800be64 <fn_0800BE18+0x4c>
 800be62:	e096      	b.n	800bf92 <fn_0800BE18+0x17a>
 800be64:	22df      	movs	r2, #223	@ 0xdf
 800be66:	6839      	ldr	r1, [r7, #0]
 800be68:	00a3      	lsls	r3, r4, #2
 800be6a:	0112      	lsls	r2, r2, #4
 800be6c:	588d      	ldr	r5, [r1, r2]
 800be6e:	191b      	adds	r3, r3, r4
 800be70:	00db      	lsls	r3, r3, #3
 800be72:	18ed      	adds	r5, r5, r3
 800be74:	0029      	movs	r1, r5
 800be76:	2001      	movs	r0, #1
 800be78:	f009 faa2 	bl	80153c0 <fn_080153C0>
 800be7c:	2800      	cmp	r0, #0
 800be7e:	d1ea      	bne.n	800be56 <fn_0800BE18+0x3e>
 800be80:	9005      	str	r0, [sp, #20]
 800be82:	2200      	movs	r2, #0
 800be84:	2103      	movs	r1, #3
 800be86:	2040      	movs	r0, #64	@ 0x40
 800be88:	f011 fbf8 	bl	801d67c <fn_0801D67C>
 800be8c:	4680      	mov	r8, r0
 800be8e:	2240      	movs	r2, #64	@ 0x40
 800be90:	2100      	movs	r1, #0
 800be92:	9004      	str	r0, [sp, #16]
 800be94:	f014 fd7c 	bl	8020990 <fn_08020990>
 800be98:	4640      	mov	r0, r8
 800be9a:	f00c fb3f 	bl	801851c <fn_0801851C>
 800be9e:	4641      	mov	r1, r8
 800bea0:	4bb2      	ldr	r3, [pc, #712]	@ (800c16c <fn_0800BE18+0x354>)
 800bea2:	6169      	str	r1, [r5, #20]
 800bea4:	608b      	str	r3, [r1, #8]
 800bea6:	2301      	movs	r3, #1
 800bea8:	9a03      	ldr	r2, [sp, #12]
 800beaa:	4013      	ands	r3, r2
 800beac:	2224      	movs	r2, #36	@ 0x24
 800beae:	548b      	strb	r3, [r1, r2]
 800beb0:	4653      	mov	r3, sl
 800beb2:	2b00      	cmp	r3, #0
 800beb4:	d100      	bne.n	800beb8 <fn_0800BE18+0xa0>
 800beb6:	e084      	b.n	800bfc2 <fn_0800BE18+0x1aa>
 800beb8:	2380      	movs	r3, #128	@ 0x80
 800beba:	039b      	lsls	r3, r3, #14
 800bebc:	9306      	str	r3, [sp, #24]
 800bebe:	2301      	movs	r3, #1
 800bec0:	20c0      	movs	r0, #192	@ 0xc0
 800bec2:	4698      	mov	r8, r3
 800bec4:	0340      	lsls	r0, r0, #13
 800bec6:	4643      	mov	r3, r8
 800bec8:	9904      	ldr	r1, [sp, #16]
 800beca:	634b      	str	r3, [r1, #52]	@ 0x34
 800becc:	2325      	movs	r3, #37	@ 0x25
 800bece:	610d      	str	r5, [r1, #16]
 800bed0:	5ceb      	ldrb	r3, [r5, r3]
 800bed2:	860b      	strh	r3, [r1, #48]	@ 0x30
 800bed4:	2220      	movs	r2, #32
 800bed6:	5eab      	ldrsh	r3, [r5, r2]
 800bed8:	628b      	str	r3, [r1, #40]	@ 0x28
 800beda:	2327      	movs	r3, #39	@ 0x27
 800bedc:	5ceb      	ldrb	r3, [r5, r3]
 800bede:	075b      	lsls	r3, r3, #29
 800bee0:	0fdb      	lsrs	r3, r3, #31
 800bee2:	62cb      	str	r3, [r1, #44]	@ 0x2c
 800bee4:	2322      	movs	r3, #34	@ 0x22
 800bee6:	5ee9      	ldrsh	r1, [r5, r3]
 800bee8:	9b02      	ldr	r3, [sp, #8]
 800beea:	2b02      	cmp	r3, #2
 800beec:	d100      	bne.n	800bef0 <fn_0800BE18+0xd8>
 800beee:	e0f5      	b.n	800c0dc <fn_0800BE18+0x2c4>
 800bef0:	2b03      	cmp	r3, #3
 800bef2:	d100      	bne.n	800bef6 <fn_0800BE18+0xde>
 800bef4:	e0ef      	b.n	800c0d6 <fn_0800BE18+0x2be>
 800bef6:	1e5a      	subs	r2, r3, #1
 800bef8:	4253      	negs	r3, r2
 800befa:	4153      	adcs	r3, r2
 800befc:	2280      	movs	r2, #128	@ 0x80
 800befe:	041b      	lsls	r3, r3, #16
 800bf00:	0252      	lsls	r2, r2, #9
 800bf02:	189b      	adds	r3, r3, r2
 800bf04:	9a04      	ldr	r2, [sp, #16]
 800bf06:	6391      	str	r1, [r2, #56]	@ 0x38
 800bf08:	2108      	movs	r1, #8
 800bf0a:	7311      	strb	r1, [r2, #12]
 800bf0c:	61d3      	str	r3, [r2, #28]
 800bf0e:	686b      	ldr	r3, [r5, #4]
 800bf10:	469c      	mov	ip, r3
 800bf12:	9b01      	ldr	r3, [sp, #4]
 800bf14:	2b07      	cmp	r3, #7
 800bf16:	d900      	bls.n	800bf1a <fn_0800BE18+0x102>
 800bf18:	e0e7      	b.n	800c0ea <fn_0800BE18+0x2d2>
 800bf1a:	4995      	ldr	r1, [pc, #596]	@ (800c170 <fn_0800BE18+0x358>)
 800bf1c:	009b      	lsls	r3, r3, #2
 800bf1e:	58cb      	ldr	r3, [r1, r3]
 800bf20:	469f      	mov	pc, r3
 800bf22:	201a      	movs	r0, #26
 800bf24:	5e29      	ldrsh	r1, [r5, r0]
 800bf26:	2003      	movs	r0, #3
 800bf28:	09db      	lsrs	r3, r3, #7
 800bf2a:	021b      	lsls	r3, r3, #8
 800bf2c:	404b      	eors	r3, r1
 800bf2e:	498e      	ldr	r1, [pc, #568]	@ (800c168 <fn_0800BE18+0x350>)
 800bf30:	185e      	adds	r6, r3, r1
 800bf32:	0b31      	lsrs	r1, r6, #12
 800bf34:	9103      	str	r1, [sp, #12]
 800bf36:	0ab1      	lsrs	r1, r6, #10
 800bf38:	4001      	ands	r1, r0
 800bf3a:	468b      	mov	fp, r1
 800bf3c:	2107      	movs	r1, #7
 800bf3e:	09f4      	lsrs	r4, r6, #7
 800bf40:	400c      	ands	r4, r1
 800bf42:	9401      	str	r4, [sp, #4]
 800bf44:	0674      	lsls	r4, r6, #25
 800bf46:	0fe4      	lsrs	r4, r4, #31
 800bf48:	46a2      	mov	sl, r4
 800bf4a:	4019      	ands	r1, r3
 800bf4c:	08f4      	lsrs	r4, r6, #3
 800bf4e:	4020      	ands	r0, r4
 800bf50:	3906      	subs	r1, #6
 800bf52:	9002      	str	r0, [sp, #8]
 800bf54:	2901      	cmp	r1, #1
 800bf56:	d900      	bls.n	800bf5a <fn_0800BE18+0x142>
 800bf58:	e0fa      	b.n	800c150 <fn_0800BE18+0x338>
 800bf5a:	8ae8      	ldrh	r0, [r5, #22]
 800bf5c:	4b85      	ldr	r3, [pc, #532]	@ (800c174 <fn_0800BE18+0x35c>)
 800bf5e:	4298      	cmp	r0, r3
 800bf60:	d015      	beq.n	800bf8e <fn_0800BE18+0x176>
 800bf62:	4b85      	ldr	r3, [pc, #532]	@ (800c178 <fn_0800BE18+0x360>)
 800bf64:	58d1      	ldr	r1, [r2, r3]
 800bf66:	0043      	lsls	r3, r0, #1
 800bf68:	181b      	adds	r3, r3, r0
 800bf6a:	009b      	lsls	r3, r3, #2
 800bf6c:	18c9      	adds	r1, r1, r3
 800bf6e:	894b      	ldrh	r3, [r1, #10]
 800bf70:	009c      	lsls	r4, r3, #2
 800bf72:	18e4      	adds	r4, r4, r3
 800bf74:	23df      	movs	r3, #223	@ 0xdf
 800bf76:	011b      	lsls	r3, r3, #4
 800bf78:	58d5      	ldr	r5, [r2, r3]
 800bf7a:	00e4      	lsls	r4, r4, #3
 800bf7c:	192d      	adds	r5, r5, r4
 800bf7e:	2d00      	cmp	r5, #0
 800bf80:	d005      	beq.n	800bf8e <fn_0800BE18+0x176>
 800bf82:	0029      	movs	r1, r5
 800bf84:	2001      	movs	r0, #1
 800bf86:	f009 fa1b 	bl	80153c0 <fn_080153C0>
 800bf8a:	2800      	cmp	r0, #0
 800bf8c:	d00b      	beq.n	800bfa6 <fn_0800BE18+0x18e>
 800bf8e:	2300      	movs	r3, #0
 800bf90:	4698      	mov	r8, r3
 800bf92:	4640      	mov	r0, r8
 800bf94:	b009      	add	sp, #36	@ 0x24
 800bf96:	bcf0      	pop	{r4, r5, r6, r7}
 800bf98:	46bb      	mov	fp, r7
 800bf9a:	46b2      	mov	sl, r6
 800bf9c:	46a9      	mov	r9, r5
 800bf9e:	46a0      	mov	r8, r4
 800bfa0:	bcf0      	pop	{r4, r5, r6, r7}
 800bfa2:	bc02      	pop	{r1}
 800bfa4:	4708      	bx	r1
 800bfa6:	10e3      	asrs	r3, r4, #3
 800bfa8:	08a4      	lsrs	r4, r4, #2
 800bfaa:	18e4      	adds	r4, r4, r3
 800bfac:	0122      	lsls	r2, r4, #4
 800bfae:	18a4      	adds	r4, r4, r2
 800bfb0:	0222      	lsls	r2, r4, #8
 800bfb2:	18a4      	adds	r4, r4, r2
 800bfb4:	0422      	lsls	r2, r4, #16
 800bfb6:	18a4      	adds	r4, r4, r2
 800bfb8:	00a4      	lsls	r4, r4, #2
 800bfba:	18e4      	adds	r4, r4, r3
 800bfbc:	2301      	movs	r3, #1
 800bfbe:	9305      	str	r3, [sp, #20]
 800bfc0:	e75f      	b.n	800be82 <fn_0800BE18+0x6a>
 800bfc2:	4b6e      	ldr	r3, [pc, #440]	@ (800c17c <fn_0800BE18+0x364>)
 800bfc4:	9306      	str	r3, [sp, #24]
 800bfc6:	2301      	movs	r3, #1
 800bfc8:	425b      	negs	r3, r3
 800bfca:	4698      	mov	r8, r3
 800bfcc:	486c      	ldr	r0, [pc, #432]	@ (800c180 <fn_0800BE18+0x368>)
 800bfce:	e77a      	b.n	800bec6 <fn_0800BE18+0xae>
 800bfd0:	9a06      	ldr	r2, [sp, #24]
 800bfd2:	4462      	add	r2, ip
 800bfd4:	0010      	movs	r0, r2
 800bfd6:	4653      	mov	r3, sl
 800bfd8:	2b00      	cmp	r3, #0
 800bfda:	d076      	beq.n	800c0ca <fn_0800BE18+0x2b2>
 800bfdc:	9b04      	ldr	r3, [sp, #16]
 800bfde:	6198      	str	r0, [r3, #24]
 800bfe0:	465b      	mov	r3, fp
 800bfe2:	2b00      	cmp	r3, #0
 800bfe4:	d01a      	beq.n	800c01c <fn_0800BE18+0x204>
 800bfe6:	06b3      	lsls	r3, r6, #26
 800bfe8:	d547      	bpl.n	800c07a <fn_0800BE18+0x262>
 800bfea:	9b01      	ldr	r3, [sp, #4]
 800bfec:	3b03      	subs	r3, #3
 800bfee:	2b01      	cmp	r3, #1
 800bff0:	d800      	bhi.n	800bff4 <fn_0800BE18+0x1dc>
 800bff2:	e07e      	b.n	800c0f2 <fn_0800BE18+0x2da>
 800bff4:	0021      	movs	r1, r4
 800bff6:	f008 ffdf 	bl	8014fb8 <fn_08014FB8>
 800bffa:	2800      	cmp	r0, #0
 800bffc:	d00e      	beq.n	800c01c <fn_0800BE18+0x204>
 800bffe:	2325      	movs	r3, #37	@ 0x25
 800c000:	9a04      	ldr	r2, [sp, #16]
 800c002:	5cc3      	ldrb	r3, [r0, r3]
 800c004:	8613      	strh	r3, [r2, #48]	@ 0x30
 800c006:	465b      	mov	r3, fp
 800c008:	2b02      	cmp	r3, #2
 800c00a:	d06b      	beq.n	800c0e4 <fn_0800BE18+0x2cc>
 800c00c:	2b03      	cmp	r3, #3
 800c00e:	d100      	bne.n	800c012 <fn_0800BE18+0x1fa>
 800c010:	e092      	b.n	800c138 <fn_0800BE18+0x320>
 800c012:	2300      	movs	r3, #0
 800c014:	6293      	str	r3, [r2, #40]	@ 0x28
 800c016:	62d3      	str	r3, [r2, #44]	@ 0x2c
 800c018:	330a      	adds	r3, #10
 800c01a:	7313      	strb	r3, [r2, #12]
 800c01c:	9804      	ldr	r0, [sp, #16]
 800c01e:	f7fa ffcf 	bl	8006fc0 <fn_08006FC0>
 800c022:	9b05      	ldr	r3, [sp, #20]
 800c024:	2b00      	cmp	r3, #0
 800c026:	d153      	bne.n	800c0d0 <fn_0800BE18+0x2b8>
 800c028:	3301      	adds	r3, #1
 800c02a:	4698      	mov	r8, r3
 800c02c:	e713      	b.n	800be56 <fn_0800BE18+0x3e>
 800c02e:	4460      	add	r0, ip
 800c030:	e7d1      	b.n	800bfd6 <fn_0800BE18+0x1be>
 800c032:	4663      	mov	r3, ip
 800c034:	0020      	movs	r0, r4
 800c036:	141d      	asrs	r5, r3, #16
 800c038:	f008 fee6 	bl	8014e08 <fn_08014E08>
 800c03c:	1400      	asrs	r0, r0, #16
 800c03e:	4643      	mov	r3, r8
 800c040:	4343      	muls	r3, r0
 800c042:	1958      	adds	r0, r3, r5
 800c044:	4b4f      	ldr	r3, [pc, #316]	@ (800c184 <fn_0800BE18+0x36c>)
 800c046:	4298      	cmp	r0, r3
 800c048:	da00      	bge.n	800c04c <fn_0800BE18+0x234>
 800c04a:	0018      	movs	r0, r3
 800c04c:	23fa      	movs	r3, #250	@ 0xfa
 800c04e:	01db      	lsls	r3, r3, #7
 800c050:	4298      	cmp	r0, r3
 800c052:	dd00      	ble.n	800c056 <fn_0800BE18+0x23e>
 800c054:	0018      	movs	r0, r3
 800c056:	0400      	lsls	r0, r0, #16
 800c058:	e7bd      	b.n	800bfd6 <fn_0800BE18+0x1be>
 800c05a:	6828      	ldr	r0, [r5, #0]
 800c05c:	e7bb      	b.n	800bfd6 <fn_0800BE18+0x1be>
 800c05e:	4653      	mov	r3, sl
 800c060:	4661      	mov	r1, ip
 800c062:	0028      	movs	r0, r5
 800c064:	2b00      	cmp	r3, #0
 800c066:	d05f      	beq.n	800c128 <fn_0800BE18+0x310>
 800c068:	f008 fd24 	bl	8014ab4 <fn_08014AB4>
 800c06c:	9b04      	ldr	r3, [sp, #16]
 800c06e:	6198      	str	r0, [r3, #24]
 800c070:	465b      	mov	r3, fp
 800c072:	2b00      	cmp	r3, #0
 800c074:	d0d2      	beq.n	800c01c <fn_0800BE18+0x204>
 800c076:	06b3      	lsls	r3, r6, #26
 800c078:	d4bc      	bmi.n	800bff4 <fn_0800BE18+0x1dc>
 800c07a:	22df      	movs	r2, #223	@ 0xdf
 800c07c:	683b      	ldr	r3, [r7, #0]
 800c07e:	493e      	ldr	r1, [pc, #248]	@ (800c178 <fn_0800BE18+0x360>)
 800c080:	0112      	lsls	r2, r2, #4
 800c082:	589a      	ldr	r2, [r3, r2]
 800c084:	5859      	ldr	r1, [r3, r1]
 800c086:	464b      	mov	r3, r9
 800c088:	8a98      	ldrh	r0, [r3, #20]
 800c08a:	0043      	lsls	r3, r0, #1
 800c08c:	181b      	adds	r3, r3, r0
 800c08e:	009b      	lsls	r3, r3, #2
 800c090:	18cb      	adds	r3, r1, r3
 800c092:	8958      	ldrh	r0, [r3, #10]
 800c094:	0083      	lsls	r3, r0, #2
 800c096:	181b      	adds	r3, r3, r0
 800c098:	00db      	lsls	r3, r3, #3
 800c09a:	18d3      	adds	r3, r2, r3
 800c09c:	3325      	adds	r3, #37	@ 0x25
 800c09e:	781b      	ldrb	r3, [r3, #0]
 800c0a0:	9804      	ldr	r0, [sp, #16]
 800c0a2:	8603      	strh	r3, [r0, #48]	@ 0x30
 800c0a4:	465b      	mov	r3, fp
 800c0a6:	2b02      	cmp	r3, #2
 800c0a8:	d01b      	beq.n	800c0e2 <fn_0800BE18+0x2ca>
 800c0aa:	2b03      	cmp	r3, #3
 800c0ac:	d025      	beq.n	800c0fa <fn_0800BE18+0x2e2>
 800c0ae:	2300      	movs	r3, #0
 800c0b0:	6283      	str	r3, [r0, #40]	@ 0x28
 800c0b2:	62c3      	str	r3, [r0, #44]	@ 0x2c
 800c0b4:	330a      	adds	r3, #10
 800c0b6:	7303      	strb	r3, [r0, #12]
 800c0b8:	e7b0      	b.n	800c01c <fn_0800BE18+0x204>
 800c0ba:	0028      	movs	r0, r5
 800c0bc:	f008 fd8a 	bl	8014bd4 <fn_08014BD4>
 800c0c0:	e789      	b.n	800bfd6 <fn_0800BE18+0x1be>
 800c0c2:	0028      	movs	r0, r5
 800c0c4:	f008 faf2 	bl	80146ac <fn_080146AC>
 800c0c8:	e785      	b.n	800bfd6 <fn_0800BE18+0x1be>
 800c0ca:	9b04      	ldr	r3, [sp, #16]
 800c0cc:	6158      	str	r0, [r3, #20]
 800c0ce:	e787      	b.n	800bfe0 <fn_0800BE18+0x1c8>
 800c0d0:	2301      	movs	r3, #1
 800c0d2:	4698      	mov	r8, r3
 800c0d4:	e75d      	b.n	800bf92 <fn_0800BE18+0x17a>
 800c0d6:	2380      	movs	r3, #128	@ 0x80
 800c0d8:	031b      	lsls	r3, r3, #12
 800c0da:	e713      	b.n	800bf04 <fn_0800BE18+0xec>
 800c0dc:	2380      	movs	r3, #128	@ 0x80
 800c0de:	02db      	lsls	r3, r3, #11
 800c0e0:	e710      	b.n	800bf04 <fn_0800BE18+0xec>
 800c0e2:	0002      	movs	r2, r0
 800c0e4:	2309      	movs	r3, #9
 800c0e6:	7313      	strb	r3, [r2, #12]
 800c0e8:	e798      	b.n	800c01c <fn_0800BE18+0x204>
 800c0ea:	0028      	movs	r0, r5
 800c0ec:	f008 fdc6 	bl	8014c7c <fn_08014C7C>
 800c0f0:	e771      	b.n	800bfd6 <fn_0800BE18+0x1be>
 800c0f2:	0021      	movs	r1, r4
 800c0f4:	f008 fefa 	bl	8014eec <fn_08014EEC>
 800c0f8:	e77f      	b.n	800bffa <fn_0800BE18+0x1e2>
 800c0fa:	464b      	mov	r3, r9
 800c0fc:	8a98      	ldrh	r0, [r3, #20]
 800c0fe:	0043      	lsls	r3, r0, #1
 800c100:	181b      	adds	r3, r3, r0
 800c102:	009b      	lsls	r3, r3, #2
 800c104:	18c9      	adds	r1, r1, r3
 800c106:	8949      	ldrh	r1, [r1, #10]
 800c108:	008b      	lsls	r3, r1, #2
 800c10a:	185b      	adds	r3, r3, r1
 800c10c:	00db      	lsls	r3, r3, #3
 800c10e:	18d2      	adds	r2, r2, r3
 800c110:	2120      	movs	r1, #32
 800c112:	5e53      	ldrsh	r3, [r2, r1]
 800c114:	9904      	ldr	r1, [sp, #16]
 800c116:	628b      	str	r3, [r1, #40]	@ 0x28
 800c118:	2327      	movs	r3, #39	@ 0x27
 800c11a:	5cd3      	ldrb	r3, [r2, r3]
 800c11c:	075b      	lsls	r3, r3, #29
 800c11e:	0fdb      	lsrs	r3, r3, #31
 800c120:	62cb      	str	r3, [r1, #44]	@ 0x2c
 800c122:	230b      	movs	r3, #11
 800c124:	730b      	strb	r3, [r1, #12]
 800c126:	e779      	b.n	800c01c <fn_0800BE18+0x204>
 800c128:	f008 fc34 	bl	8014994 <fn_08014994>
 800c12c:	9b04      	ldr	r3, [sp, #16]
 800c12e:	6158      	str	r0, [r3, #20]
 800c130:	465b      	mov	r3, fp
 800c132:	2b00      	cmp	r3, #0
 800c134:	d19f      	bne.n	800c076 <fn_0800BE18+0x25e>
 800c136:	e771      	b.n	800c01c <fn_0800BE18+0x204>
 800c138:	2220      	movs	r2, #32
 800c13a:	5e83      	ldrsh	r3, [r0, r2]
 800c13c:	9a04      	ldr	r2, [sp, #16]
 800c13e:	6293      	str	r3, [r2, #40]	@ 0x28
 800c140:	2327      	movs	r3, #39	@ 0x27
 800c142:	5cc3      	ldrb	r3, [r0, r3]
 800c144:	075b      	lsls	r3, r3, #29
 800c146:	0fdb      	lsrs	r3, r3, #31
 800c148:	62d3      	str	r3, [r2, #44]	@ 0x2c
 800c14a:	230b      	movs	r3, #11
 800c14c:	7313      	strb	r3, [r2, #12]
 800c14e:	e765      	b.n	800c01c <fn_0800BE18+0x204>
 800c150:	2300      	movs	r3, #0
 800c152:	2401      	movs	r4, #1
 800c154:	4698      	mov	r8, r3
 800c156:	4264      	negs	r4, r4
 800c158:	e67d      	b.n	800be56 <fn_0800BE18+0x3e>
 800c15a:	46c0      	nop			@ (mov r8, r8)
 800c15c:	030064c4 	.word	0x030064c4	@ data_030064C4
 800c160:	00000e04 	.word	0x00000e04
 800c164:	000ffffc 	.word	0x000ffffc
 800c168:	ffffc000 	.word	0xffffc000
 800c16c:	08006b61 	.word	0x08006b61	@ fn_08006B60
 800c170:	0812e5c0 	.word	0x0812e5c0
 800c174:	0000ffff 	.word	0x0000ffff
 800c178:	00000e0c 	.word	0x00000e0c
 800c17c:	ffe00000 	.word	0xffe00000
 800c180:	ffe80000 	.word	0xffe80000
 800c184:	ffff8300 	.word	0xffff8300
