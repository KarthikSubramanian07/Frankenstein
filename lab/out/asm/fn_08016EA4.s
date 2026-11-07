fn_08016EA4:
 8016ea4:	b5f0      	push	{r4, r5, r6, r7, lr}
 8016ea6:	4657      	mov	r7, sl
 8016ea8:	464e      	mov	r6, r9
 8016eaa:	46de      	mov	lr, fp
 8016eac:	4645      	mov	r5, r8
 8016eae:	b5e0      	push	{r5, r6, r7, lr}
 8016eb0:	4b77      	ldr	r3, [pc, #476]	@ (8017090 <fn_08016EA4+0x1ec>)
 8016eb2:	b083      	sub	sp, #12
 8016eb4:	9301      	str	r3, [sp, #4]
 8016eb6:	681b      	ldr	r3, [r3, #0]
 8016eb8:	4699      	mov	r9, r3
 8016eba:	464a      	mov	r2, r9
 8016ebc:	4b75      	ldr	r3, [pc, #468]	@ (8017094 <fn_08016EA4+0x1f0>)
 8016ebe:	58d4      	ldr	r4, [r2, r3]
 8016ec0:	46a4      	mov	ip, r4
 8016ec2:	8a82      	ldrh	r2, [r0, #20]
 8016ec4:	0053      	lsls	r3, r2, #1
 8016ec6:	189b      	adds	r3, r3, r2
 8016ec8:	009b      	lsls	r3, r3, #2
 8016eca:	4463      	add	r3, ip
 8016ecc:	0006      	movs	r6, r0
 8016ece:	4682      	mov	sl, r0
 8016ed0:	000f      	movs	r7, r1
 8016ed2:	468b      	mov	fp, r1
 8016ed4:	8918      	ldrh	r0, [r3, #8]
 8016ed6:	8899      	ldrh	r1, [r3, #4]
 8016ed8:	88dd      	ldrh	r5, [r3, #6]
 8016eda:	2f00      	cmp	r7, #0
 8016edc:	d109      	bne.n	8016ef2 <fn_08016EA4+0x4e>
 8016ede:	464b      	mov	r3, r9
 8016ee0:	4a6d      	ldr	r2, [pc, #436]	@ (8017098 <fn_08016EA4+0x1f4>)
 8016ee2:	589a      	ldr	r2, [r3, r2]
 8016ee4:	2340      	movs	r3, #64	@ 0x40
 8016ee6:	8bf4      	ldrh	r4, [r6, #30]
 8016ee8:	00a4      	lsls	r4, r4, #2
 8016eea:	1912      	adds	r2, r2, r4
 8016eec:	78d4      	ldrb	r4, [r2, #3]
 8016eee:	431c      	orrs	r4, r3
 8016ef0:	70d4      	strb	r4, [r2, #3]
 8016ef2:	464b      	mov	r3, r9
 8016ef4:	4a69      	ldr	r2, [pc, #420]	@ (801709c <fn_08016EA4+0x1f8>)
 8016ef6:	589f      	ldr	r7, [r3, r2]
 8016ef8:	2f00      	cmp	r7, #0
 8016efa:	dc00      	bgt.n	8016efe <fn_08016EA4+0x5a>
 8016efc:	e095      	b.n	801702a <fn_08016EA4+0x186>
 8016efe:	22fd      	movs	r2, #253	@ 0xfd
 8016f00:	0409      	lsls	r1, r1, #16
 8016f02:	0400      	lsls	r0, r0, #16
 8016f04:	042d      	lsls	r5, r5, #16
 8016f06:	0112      	lsls	r2, r2, #4
 8016f08:	2400      	movs	r4, #0
 8016f0a:	1409      	asrs	r1, r1, #16
 8016f0c:	1400      	asrs	r0, r0, #16
 8016f0e:	142d      	asrs	r5, r5, #16
 8016f10:	444a      	add	r2, r9
 8016f12:	007f      	lsls	r7, r7, #1
 8016f14:	e00a      	b.n	8016f2c <fn_08016EA4+0x88>
 8016f16:	4298      	cmp	r0, r3
 8016f18:	d100      	bne.n	8016f1c <fn_08016EA4+0x78>
 8016f1a:	e093      	b.n	8017044 <fn_08016EA4+0x1a0>
 8016f1c:	429d      	cmp	r5, r3
 8016f1e:	d100      	bne.n	8016f22 <fn_08016EA4+0x7e>
 8016f20:	e093      	b.n	801704a <fn_08016EA4+0x1a6>
 8016f22:	3401      	adds	r4, #1
 8016f24:	3202      	adds	r2, #2
 8016f26:	42bc      	cmp	r4, r7
 8016f28:	d100      	bne.n	8016f2c <fn_08016EA4+0x88>
 8016f2a:	e07e      	b.n	801702a <fn_08016EA4+0x186>
 8016f2c:	2600      	movs	r6, #0
 8016f2e:	5f93      	ldrsh	r3, [r2, r6]
 8016f30:	4299      	cmp	r1, r3
 8016f32:	d1f0      	bne.n	8016f16 <fn_08016EA4+0x72>
 8016f34:	2300      	movs	r3, #0
 8016f36:	4698      	mov	r8, r3
 8016f38:	4653      	mov	r3, sl
 8016f3a:	8a9a      	ldrh	r2, [r3, #20]
 8016f3c:	0053      	lsls	r3, r2, #1
 8016f3e:	189b      	adds	r3, r3, r2
 8016f40:	4662      	mov	r2, ip
 8016f42:	009b      	lsls	r3, r3, #2
 8016f44:	21fd      	movs	r1, #253	@ 0xfd
 8016f46:	18d2      	adds	r2, r2, r3
 8016f48:	2301      	movs	r3, #1
 8016f4a:	00c9      	lsls	r1, r1, #3
 8016f4c:	4063      	eors	r3, r4
 8016f4e:	185b      	adds	r3, r3, r1
 8016f50:	4649      	mov	r1, r9
 8016f52:	005b      	lsls	r3, r3, #1
 8016f54:	5a5b      	ldrh	r3, [r3, r1]
 8016f56:	4641      	mov	r1, r8
 8016f58:	2901      	cmp	r1, #1
 8016f5a:	d100      	bne.n	8016f5e <fn_08016EA4+0xba>
 8016f5c:	e070      	b.n	8017040 <fn_08016EA4+0x19c>
 8016f5e:	4641      	mov	r1, r8
 8016f60:	2902      	cmp	r1, #2
 8016f62:	d06b      	beq.n	801703c <fn_08016EA4+0x198>
 8016f64:	8093      	strh	r3, [r2, #4]
 8016f66:	4653      	mov	r3, sl
 8016f68:	464a      	mov	r2, r9
 8016f6a:	8a99      	ldrh	r1, [r3, #20]
 8016f6c:	4b4c      	ldr	r3, [pc, #304]	@ (80170a0 <fn_08016EA4+0x1fc>)
 8016f6e:	58d2      	ldr	r2, [r2, r3]
 8016f70:	004b      	lsls	r3, r1, #1
 8016f72:	185b      	adds	r3, r3, r1
 8016f74:	009b      	lsls	r3, r3, #2
 8016f76:	18d3      	adds	r3, r2, r3
 8016f78:	895a      	ldrh	r2, [r3, #10]
 8016f7a:	0093      	lsls	r3, r2, #2
 8016f7c:	189b      	adds	r3, r3, r2
 8016f7e:	22df      	movs	r2, #223	@ 0xdf
 8016f80:	4649      	mov	r1, r9
 8016f82:	0112      	lsls	r2, r2, #4
 8016f84:	5888      	ldr	r0, [r1, r2]
 8016f86:	00db      	lsls	r3, r3, #3
 8016f88:	18c0      	adds	r0, r0, r3
 8016f8a:	2117      	movs	r1, #23
 8016f8c:	f7fe fa8e 	bl	80154ac <fn_080154AC>
 8016f90:	465b      	mov	r3, fp
 8016f92:	2b00      	cmp	r3, #0
 8016f94:	d049      	beq.n	801702a <fn_08016EA4+0x186>
 8016f96:	9b01      	ldr	r3, [sp, #4]
 8016f98:	4a42      	ldr	r2, [pc, #264]	@ (80170a4 <fn_08016EA4+0x200>)
 8016f9a:	681b      	ldr	r3, [r3, #0]
 8016f9c:	5899      	ldr	r1, [r3, r2]
 8016f9e:	2900      	cmp	r1, #0
 8016fa0:	d003      	beq.n	8016faa <fn_08016EA4+0x106>
 8016fa2:	4a41      	ldr	r2, [pc, #260]	@ (80170a8 <fn_08016EA4+0x204>)
 8016fa4:	589a      	ldr	r2, [r3, r2]
 8016fa6:	4592      	cmp	sl, r2
 8016fa8:	d03f      	beq.n	801702a <fn_08016EA4+0x186>
 8016faa:	4a40      	ldr	r2, [pc, #256]	@ (80170ac <fn_08016EA4+0x208>)
 8016fac:	589a      	ldr	r2, [r3, r2]
 8016fae:	2a00      	cmp	r2, #0
 8016fb0:	d003      	beq.n	8016fba <fn_08016EA4+0x116>
 8016fb2:	483f      	ldr	r0, [pc, #252]	@ (80170b0 <fn_08016EA4+0x20c>)
 8016fb4:	5818      	ldr	r0, [r3, r0]
 8016fb6:	4582      	cmp	sl, r0
 8016fb8:	d037      	beq.n	801702a <fn_08016EA4+0x186>
 8016fba:	483e      	ldr	r0, [pc, #248]	@ (80170b4 <fn_08016EA4+0x210>)
 8016fbc:	5818      	ldr	r0, [r3, r0]
 8016fbe:	2800      	cmp	r0, #0
 8016fc0:	d146      	bne.n	8017050 <fn_08016EA4+0x1ac>
 8016fc2:	483d      	ldr	r0, [pc, #244]	@ (80170b8 <fn_08016EA4+0x214>)
 8016fc4:	5818      	ldr	r0, [r3, r0]
 8016fc6:	2800      	cmp	r0, #0
 8016fc8:	d003      	beq.n	8016fd2 <fn_08016EA4+0x12e>
 8016fca:	483c      	ldr	r0, [pc, #240]	@ (80170bc <fn_08016EA4+0x218>)
 8016fcc:	5818      	ldr	r0, [r3, r0]
 8016fce:	4582      	cmp	sl, r0
 8016fd0:	d02b      	beq.n	801702a <fn_08016EA4+0x186>
 8016fd2:	2900      	cmp	r1, #0
 8016fd4:	d002      	beq.n	8016fdc <fn_08016EA4+0x138>
 8016fd6:	1e51      	subs	r1, r2, #1
 8016fd8:	418a      	sbcs	r2, r1
 8016fda:	1c51      	adds	r1, r2, #1
 8016fdc:	22fd      	movs	r2, #253	@ 0xfd
 8016fde:	00d2      	lsls	r2, r2, #3
 8016fe0:	18a4      	adds	r4, r4, r2
 8016fe2:	0064      	lsls	r4, r4, #1
 8016fe4:	5ee0      	ldrsh	r0, [r4, r3]
 8016fe6:	4654      	mov	r4, sl
 8016fe8:	008a      	lsls	r2, r1, #2
 8016fea:	1852      	adds	r2, r2, r1
 8016fec:	0092      	lsls	r2, r2, #2
 8016fee:	492e      	ldr	r1, [pc, #184]	@ (80170a8 <fn_08016EA4+0x204>)
 8016ff0:	189a      	adds	r2, r3, r2
 8016ff2:	5054      	str	r4, [r2, r1]
 8016ff4:	2185      	movs	r1, #133	@ 0x85
 8016ff6:	4645      	mov	r5, r8
 8016ff8:	0149      	lsls	r1, r1, #5
 8016ffa:	5455      	strb	r5, [r2, r1]
 8016ffc:	4930      	ldr	r1, [pc, #192]	@ (80170c0 <fn_08016EA4+0x21c>)
 8016ffe:	5050      	str	r0, [r2, r1]
 8017000:	2023      	movs	r0, #35	@ 0x23
 8017002:	4928      	ldr	r1, [pc, #160]	@ (80170a4 <fn_08016EA4+0x200>)
 8017004:	5050      	str	r0, [r2, r1]
 8017006:	492f      	ldr	r1, [pc, #188]	@ (80170c4 <fn_08016EA4+0x220>)
 8017008:	8aa4      	ldrh	r4, [r4, #20]
 801700a:	1852      	adds	r2, r2, r1
 801700c:	4924      	ldr	r1, [pc, #144]	@ (80170a0 <fn_08016EA4+0x1fc>)
 801700e:	5858      	ldr	r0, [r3, r1]
 8017010:	0061      	lsls	r1, r4, #1
 8017012:	1909      	adds	r1, r1, r4
 8017014:	0089      	lsls	r1, r1, #2
 8017016:	1841      	adds	r1, r0, r1
 8017018:	8948      	ldrh	r0, [r1, #10]
 801701a:	0081      	lsls	r1, r0, #2
 801701c:	1809      	adds	r1, r1, r0
 801701e:	20df      	movs	r0, #223	@ 0xdf
 8017020:	0100      	lsls	r0, r0, #4
 8017022:	581b      	ldr	r3, [r3, r0]
 8017024:	00c9      	lsls	r1, r1, #3
 8017026:	185b      	adds	r3, r3, r1
 8017028:	6013      	str	r3, [r2, #0]
 801702a:	b003      	add	sp, #12
 801702c:	bcf0      	pop	{r4, r5, r6, r7}
 801702e:	46bb      	mov	fp, r7
 8017030:	46b2      	mov	sl, r6
 8017032:	46a9      	mov	r9, r5
 8017034:	46a0      	mov	r8, r4
 8017036:	bcf0      	pop	{r4, r5, r6, r7}
 8017038:	bc01      	pop	{r0}
 801703a:	4700      	bx	r0
 801703c:	80d3      	strh	r3, [r2, #6]
 801703e:	e792      	b.n	8016f66 <fn_08016EA4+0xc2>
 8017040:	8113      	strh	r3, [r2, #8]
 8017042:	e790      	b.n	8016f66 <fn_08016EA4+0xc2>
 8017044:	2301      	movs	r3, #1
 8017046:	4698      	mov	r8, r3
 8017048:	e776      	b.n	8016f38 <fn_08016EA4+0x94>
 801704a:	2302      	movs	r3, #2
 801704c:	4698      	mov	r8, r3
 801704e:	e773      	b.n	8016f38 <fn_08016EA4+0x94>
 8017050:	481d      	ldr	r0, [pc, #116]	@ (80170c8 <fn_08016EA4+0x224>)
 8017052:	5818      	ldr	r0, [r3, r0]
 8017054:	4582      	cmp	sl, r0
 8017056:	d0e8      	beq.n	801702a <fn_08016EA4+0x186>
 8017058:	4817      	ldr	r0, [pc, #92]	@ (80170b8 <fn_08016EA4+0x214>)
 801705a:	5818      	ldr	r0, [r3, r0]
 801705c:	2800      	cmp	r0, #0
 801705e:	d108      	bne.n	8017072 <fn_08016EA4+0x1ce>
 8017060:	2900      	cmp	r1, #0
 8017062:	d0bb      	beq.n	8016fdc <fn_08016EA4+0x138>
 8017064:	4251      	negs	r1, r2
 8017066:	414a      	adcs	r2, r1
 8017068:	2101      	movs	r1, #1
 801706a:	4252      	negs	r2, r2
 801706c:	438a      	bics	r2, r1
 801706e:	1cd1      	adds	r1, r2, #3
 8017070:	e7b4      	b.n	8016fdc <fn_08016EA4+0x138>
 8017072:	4812      	ldr	r0, [pc, #72]	@ (80170bc <fn_08016EA4+0x218>)
 8017074:	5818      	ldr	r0, [r3, r0]
 8017076:	4582      	cmp	sl, r0
 8017078:	d0d7      	beq.n	801702a <fn_08016EA4+0x186>
 801707a:	2900      	cmp	r1, #0
 801707c:	d0ae      	beq.n	8016fdc <fn_08016EA4+0x138>
 801707e:	2a00      	cmp	r2, #0
 8017080:	d003      	beq.n	801708a <fn_08016EA4+0x1e6>
 8017082:	4812      	ldr	r0, [pc, #72]	@ (80170cc <fn_08016EA4+0x228>)
 8017084:	f7e9 fa90 	bl	80005a8 <fn_080005A8>
 8017088:	e7cf      	b.n	801702a <fn_08016EA4+0x186>
 801708a:	2101      	movs	r1, #1
 801708c:	e7a6      	b.n	8016fdc <fn_08016EA4+0x138>
 801708e:	46c0      	nop			@ (mov r8, r8)
 8017090:	030064c4 	.word	0x030064c4	@ data_030064C4
 8017094:	00000e14 	.word	0x00000e14
 8017098:	00000e04 	.word	0x00000e04
 801709c:	00001098 	.word	0x00001098
 80170a0:	00000e0c 	.word	0x00000e0c
 80170a4:	000010a8 	.word	0x000010a8
 80170a8:	0000109c 	.word	0x0000109c
 80170ac:	000010bc 	.word	0x000010bc
 80170b0:	000010b0 	.word	0x000010b0
 80170b4:	000010d0 	.word	0x000010d0
 80170b8:	000010e4 	.word	0x000010e4
 80170bc:	000010d8 	.word	0x000010d8
 80170c0:	000010a4 	.word	0x000010a4
 80170c4:	000010ac 	.word	0x000010ac
 80170c8:	000010c4 	.word	0x000010c4
 80170cc:	0814a1fc 	.word	0x0814a1fc
