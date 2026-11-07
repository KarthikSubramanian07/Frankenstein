fn_0800EBA8:
 800eba8:	b5f0      	push	{r4, r5, r6, r7, lr}
 800ebaa:	4657      	mov	r7, sl
 800ebac:	4645      	mov	r5, r8
 800ebae:	46de      	mov	lr, fp
 800ebb0:	464e      	mov	r6, r9
 800ebb2:	b5e0      	push	{r5, r6, r7, lr}
 800ebb4:	7904      	ldrb	r4, [r0, #4]
 800ebb6:	0007      	movs	r7, r0
 800ebb8:	6885      	ldr	r5, [r0, #8]
 800ebba:	b083      	sub	sp, #12
 800ebbc:	2c00      	cmp	r4, #0
 800ebbe:	d00d      	beq.n	800ebdc <fn_0800EBA8+0x34>
 800ebc0:	8b2b      	ldrh	r3, [r5, #24]
 800ebc2:	075b      	lsls	r3, r3, #29
 800ebc4:	d465      	bmi.n	800ec92 <fn_0800EBA8+0xea>
 800ebc6:	2400      	movs	r4, #0
 800ebc8:	0020      	movs	r0, r4
 800ebca:	b003      	add	sp, #12
 800ebcc:	bcf0      	pop	{r4, r5, r6, r7}
 800ebce:	46bb      	mov	fp, r7
 800ebd0:	46b2      	mov	sl, r6
 800ebd2:	46a9      	mov	r9, r5
 800ebd4:	46a0      	mov	r8, r4
 800ebd6:	bcf0      	pop	{r4, r5, r6, r7}
 800ebd8:	bc02      	pop	{r1}
 800ebda:	4708      	bx	r1
 800ebdc:	4b71      	ldr	r3, [pc, #452]	@ (800eda4 <fn_0800EBA8+0x1fc>)
 800ebde:	681e      	ldr	r6, [r3, #0]
 800ebe0:	4b71      	ldr	r3, [pc, #452]	@ (800eda8 <fn_0800EBA8+0x200>)
 800ebe2:	58f3      	ldr	r3, [r6, r3]
 800ebe4:	42ab      	cmp	r3, r5
 800ebe6:	d100      	bne.n	800ebea <fn_0800EBA8+0x42>
 800ebe8:	e0ca      	b.n	800ed80 <fn_0800EBA8+0x1d8>
 800ebea:	6ceb      	ldr	r3, [r5, #76]	@ 0x4c
 800ebec:	075b      	lsls	r3, r3, #29
 800ebee:	d400      	bmi.n	800ebf2 <fn_0800EBA8+0x4a>
 800ebf0:	e0c6      	b.n	800ed80 <fn_0800EBA8+0x1d8>
 800ebf2:	4b6e      	ldr	r3, [pc, #440]	@ (800edac <fn_0800EBA8+0x204>)
 800ebf4:	6801      	ldr	r1, [r0, #0]
 800ebf6:	58f0      	ldr	r0, [r6, r3]
 800ebf8:	f016 fd48 	bl	802568c <fn_0802568C>
 800ebfc:	0002      	movs	r2, r0
 800ebfe:	4b6c      	ldr	r3, [pc, #432]	@ (800edb0 <fn_0800EBA8+0x208>)
 800ec00:	6969      	ldr	r1, [r5, #20]
 800ec02:	4683      	mov	fp, r0
 800ec04:	6ba8      	ldr	r0, [r5, #56]	@ 0x38
 800ec06:	58f3      	ldr	r3, [r6, r3]
 800ec08:	1840      	adds	r0, r0, r1
 800ec0a:	1ac0      	subs	r0, r0, r3
 800ec0c:	4699      	mov	r9, r3
 800ec0e:	0013      	movs	r3, r2
 800ec10:	4043      	eors	r3, r0
 800ec12:	9300      	str	r3, [sp, #0]
 800ec14:	17c3      	asrs	r3, r0, #31
 800ec16:	18c0      	adds	r0, r0, r3
 800ec18:	4058      	eors	r0, r3
 800ec1a:	17d3      	asrs	r3, r2, #31
 800ec1c:	18d2      	adds	r2, r2, r3
 800ec1e:	405a      	eors	r2, r3
 800ec20:	4688      	mov	r8, r1
 800ec22:	0401      	lsls	r1, r0, #16
 800ec24:	1400      	asrs	r0, r0, #16
 800ec26:	4692      	mov	sl, r2
 800ec28:	f016 fcfe 	bl	8025628 <fn_08025628>
 800ec2c:	9b00      	ldr	r3, [sp, #0]
 800ec2e:	0007      	movs	r7, r0
 800ec30:	2b00      	cmp	r3, #0
 800ec32:	da00      	bge.n	800ec36 <fn_0800EBA8+0x8e>
 800ec34:	e0a6      	b.n	800ed84 <fn_0800EBA8+0x1dc>
 800ec36:	2391      	movs	r3, #145	@ 0x91
 800ec38:	011b      	lsls	r3, r3, #4
 800ec3a:	58f3      	ldr	r3, [r6, r3]
 800ec3c:	9300      	str	r3, [sp, #0]
 800ec3e:	42bb      	cmp	r3, r7
 800ec40:	dd00      	ble.n	800ec44 <fn_0800EBA8+0x9c>
 800ec42:	e09d      	b.n	800ed80 <fn_0800EBA8+0x1d8>
 800ec44:	4643      	mov	r3, r8
 800ec46:	464a      	mov	r2, r9
 800ec48:	1a98      	subs	r0, r3, r2
 800ec4a:	465b      	mov	r3, fp
 800ec4c:	4043      	eors	r3, r0
 800ec4e:	9301      	str	r3, [sp, #4]
 800ec50:	17c3      	asrs	r3, r0, #31
 800ec52:	18c0      	adds	r0, r0, r3
 800ec54:	4058      	eors	r0, r3
 800ec56:	0401      	lsls	r1, r0, #16
 800ec58:	4652      	mov	r2, sl
 800ec5a:	1400      	asrs	r0, r0, #16
 800ec5c:	f016 fce4 	bl	8025628 <fn_08025628>
 800ec60:	9b01      	ldr	r3, [sp, #4]
 800ec62:	2b00      	cmp	r3, #0
 800ec64:	da00      	bge.n	800ec68 <fn_0800EBA8+0xc0>
 800ec66:	4240      	negs	r0, r0
 800ec68:	4b52      	ldr	r3, [pc, #328]	@ (800edb4 <fn_0800EBA8+0x20c>)
 800ec6a:	58f3      	ldr	r3, [r6, r3]
 800ec6c:	4283      	cmp	r3, r0
 800ec6e:	da00      	bge.n	800ec72 <fn_0800EBA8+0xca>
 800ec70:	e086      	b.n	800ed80 <fn_0800EBA8+0x1d8>
 800ec72:	42bb      	cmp	r3, r7
 800ec74:	dd00      	ble.n	800ec78 <fn_0800EBA8+0xd0>
 800ec76:	003b      	movs	r3, r7
 800ec78:	9a00      	ldr	r2, [sp, #0]
 800ec7a:	4282      	cmp	r2, r0
 800ec7c:	da00      	bge.n	800ec80 <fn_0800EBA8+0xd8>
 800ec7e:	0002      	movs	r2, r0
 800ec80:	189b      	adds	r3, r3, r2
 800ec82:	0fda      	lsrs	r2, r3, #31
 800ec84:	18d3      	adds	r3, r2, r3
 800ec86:	4a4c      	ldr	r2, [pc, #304]	@ (800edb8 <fn_0800EBA8+0x210>)
 800ec88:	105b      	asrs	r3, r3, #1
 800ec8a:	50b3      	str	r3, [r6, r2]
 800ec8c:	4b4b      	ldr	r3, [pc, #300]	@ (800edbc <fn_0800EBA8+0x214>)
 800ec8e:	50f5      	str	r5, [r6, r3]
 800ec90:	e79a      	b.n	800ebc8 <fn_0800EBA8+0x20>
 800ec92:	0028      	movs	r0, r5
 800ec94:	f001 f9cc 	bl	8010030 <fn_08010030>
 800ec98:	4b42      	ldr	r3, [pc, #264]	@ (800eda4 <fn_0800EBA8+0x1fc>)
 800ec9a:	681e      	ldr	r6, [r3, #0]
 800ec9c:	2393      	movs	r3, #147	@ 0x93
 800ec9e:	011b      	lsls	r3, r3, #4
 800eca0:	58f2      	ldr	r2, [r6, r3]
 800eca2:	4b47      	ldr	r3, [pc, #284]	@ (800edc0 <fn_0800EBA8+0x218>)
 800eca4:	58f3      	ldr	r3, [r6, r3]
 800eca6:	4690      	mov	r8, r2
 800eca8:	4699      	mov	r9, r3
 800ecaa:	429a      	cmp	r2, r3
 800ecac:	db00      	blt.n	800ecb0 <fn_0800EBA8+0x108>
 800ecae:	e78a      	b.n	800ebc6 <fn_0800EBA8+0x1e>
 800ecb0:	4b3e      	ldr	r3, [pc, #248]	@ (800edac <fn_0800EBA8+0x204>)
 800ecb2:	6839      	ldr	r1, [r7, #0]
 800ecb4:	58f0      	ldr	r0, [r6, r3]
 800ecb6:	f016 fce9 	bl	802568c <fn_0802568C>
 800ecba:	23df      	movs	r3, #223	@ 0xdf
 800ecbc:	011b      	lsls	r3, r3, #4
 800ecbe:	58f1      	ldr	r1, [r6, r3]
 800ecc0:	0007      	movs	r7, r0
 800ecc2:	4b40      	ldr	r3, [pc, #256]	@ (800edc4 <fn_0800EBA8+0x21c>)
 800ecc4:	8aa8      	ldrh	r0, [r5, #20]
 800ecc6:	58f2      	ldr	r2, [r6, r3]
 800ecc8:	0043      	lsls	r3, r0, #1
 800ecca:	181b      	adds	r3, r3, r0
 800eccc:	009b      	lsls	r3, r3, #2
 800ecce:	18d3      	adds	r3, r2, r3
 800ecd0:	895b      	ldrh	r3, [r3, #10]
 800ecd2:	009c      	lsls	r4, r3, #2
 800ecd4:	18e4      	adds	r4, r4, r3
 800ecd6:	00e4      	lsls	r4, r4, #3
 800ecd8:	8aed      	ldrh	r5, [r5, #22]
 800ecda:	4b3b      	ldr	r3, [pc, #236]	@ (800edc8 <fn_0800EBA8+0x220>)
 800ecdc:	190c      	adds	r4, r1, r4
 800ecde:	6820      	ldr	r0, [r4, #0]
 800ece0:	429d      	cmp	r5, r3
 800ece2:	d05b      	beq.n	800ed9c <fn_0800EBA8+0x1f4>
 800ece4:	006b      	lsls	r3, r5, #1
 800ece6:	195b      	adds	r3, r3, r5
 800ece8:	009b      	lsls	r3, r3, #2
 800ecea:	18d2      	adds	r2, r2, r3
 800ecec:	8952      	ldrh	r2, [r2, #10]
 800ecee:	0093      	lsls	r3, r2, #2
 800ecf0:	189b      	adds	r3, r3, r2
 800ecf2:	00db      	lsls	r3, r3, #3
 800ecf4:	18cd      	adds	r5, r1, r3
 800ecf6:	682b      	ldr	r3, [r5, #0]
 800ecf8:	4298      	cmp	r0, r3
 800ecfa:	d01a      	beq.n	800ed32 <fn_0800EBA8+0x18a>
 800ecfc:	4b2c      	ldr	r3, [pc, #176]	@ (800edb0 <fn_0800EBA8+0x208>)
 800ecfe:	58f0      	ldr	r0, [r6, r3]
 800ed00:	4643      	mov	r3, r8
 800ed02:	1a18      	subs	r0, r3, r0
 800ed04:	0003      	movs	r3, r0
 800ed06:	407b      	eors	r3, r7
 800ed08:	9300      	str	r3, [sp, #0]
 800ed0a:	17c3      	asrs	r3, r0, #31
 800ed0c:	18c0      	adds	r0, r0, r3
 800ed0e:	4058      	eors	r0, r3
 800ed10:	17fb      	asrs	r3, r7, #31
 800ed12:	18fa      	adds	r2, r7, r3
 800ed14:	405a      	eors	r2, r3
 800ed16:	0401      	lsls	r1, r0, #16
 800ed18:	1400      	asrs	r0, r0, #16
 800ed1a:	f016 fc85 	bl	8025628 <fn_08025628>
 800ed1e:	9b00      	ldr	r3, [sp, #0]
 800ed20:	2b00      	cmp	r3, #0
 800ed22:	da00      	bge.n	800ed26 <fn_0800EBA8+0x17e>
 800ed24:	4240      	negs	r0, r0
 800ed26:	2391      	movs	r3, #145	@ 0x91
 800ed28:	011b      	lsls	r3, r3, #4
 800ed2a:	58f2      	ldr	r2, [r6, r3]
 800ed2c:	4282      	cmp	r2, r0
 800ed2e:	da00      	bge.n	800ed32 <fn_0800EBA8+0x18a>
 800ed30:	50f0      	str	r0, [r6, r3]
 800ed32:	6862      	ldr	r2, [r4, #4]
 800ed34:	686b      	ldr	r3, [r5, #4]
 800ed36:	429a      	cmp	r2, r3
 800ed38:	d02d      	beq.n	800ed96 <fn_0800EBA8+0x1ee>
 800ed3a:	4b1d      	ldr	r3, [pc, #116]	@ (800edb0 <fn_0800EBA8+0x208>)
 800ed3c:	58f0      	ldr	r0, [r6, r3]
 800ed3e:	464b      	mov	r3, r9
 800ed40:	1a18      	subs	r0, r3, r0
 800ed42:	0004      	movs	r4, r0
 800ed44:	17c3      	asrs	r3, r0, #31
 800ed46:	18c0      	adds	r0, r0, r3
 800ed48:	4058      	eors	r0, r3
 800ed4a:	17fb      	asrs	r3, r7, #31
 800ed4c:	18fa      	adds	r2, r7, r3
 800ed4e:	0401      	lsls	r1, r0, #16
 800ed50:	405a      	eors	r2, r3
 800ed52:	1400      	asrs	r0, r0, #16
 800ed54:	407c      	eors	r4, r7
 800ed56:	f016 fc67 	bl	8025628 <fn_08025628>
 800ed5a:	2c00      	cmp	r4, #0
 800ed5c:	da00      	bge.n	800ed60 <fn_0800EBA8+0x1b8>
 800ed5e:	4240      	negs	r0, r0
 800ed60:	4a14      	ldr	r2, [pc, #80]	@ (800edb4 <fn_0800EBA8+0x20c>)
 800ed62:	58b3      	ldr	r3, [r6, r2]
 800ed64:	4283      	cmp	r3, r0
 800ed66:	dd01      	ble.n	800ed6c <fn_0800EBA8+0x1c4>
 800ed68:	0003      	movs	r3, r0
 800ed6a:	50b0      	str	r0, [r6, r2]
 800ed6c:	2291      	movs	r2, #145	@ 0x91
 800ed6e:	0112      	lsls	r2, r2, #4
 800ed70:	58b2      	ldr	r2, [r6, r2]
 800ed72:	2401      	movs	r4, #1
 800ed74:	429a      	cmp	r2, r3
 800ed76:	db00      	blt.n	800ed7a <fn_0800EBA8+0x1d2>
 800ed78:	2400      	movs	r4, #0
 800ed7a:	0624      	lsls	r4, r4, #24
 800ed7c:	0e24      	lsrs	r4, r4, #24
 800ed7e:	e723      	b.n	800ebc8 <fn_0800EBA8+0x20>
 800ed80:	2401      	movs	r4, #1
 800ed82:	e721      	b.n	800ebc8 <fn_0800EBA8+0x20>
 800ed84:	2391      	movs	r3, #145	@ 0x91
 800ed86:	011b      	lsls	r3, r3, #4
 800ed88:	58f3      	ldr	r3, [r6, r3]
 800ed8a:	4247      	negs	r7, r0
 800ed8c:	9300      	str	r3, [sp, #0]
 800ed8e:	42bb      	cmp	r3, r7
 800ed90:	dc00      	bgt.n	800ed94 <fn_0800EBA8+0x1ec>
 800ed92:	e757      	b.n	800ec44 <fn_0800EBA8+0x9c>
 800ed94:	e7f4      	b.n	800ed80 <fn_0800EBA8+0x1d8>
 800ed96:	4b07      	ldr	r3, [pc, #28]	@ (800edb4 <fn_0800EBA8+0x20c>)
 800ed98:	58f3      	ldr	r3, [r6, r3]
 800ed9a:	e7e7      	b.n	800ed6c <fn_0800EBA8+0x1c4>
 800ed9c:	2300      	movs	r3, #0
 800ed9e:	681b      	ldr	r3, [r3, #0]
 800eda0:	deff      	udf	#255	@ 0xff
 800eda2:	46c0      	nop			@ (mov r8, r8)
 800eda4:	030064c4 	.word	0x030064c4
 800eda8:	000008f8 	.word	0x000008f8
 800edac:	00000904 	.word	0x00000904
 800edb0:	000008fc 	.word	0x000008fc
 800edb4:	0000090c 	.word	0x0000090c
 800edb8:	00000908 	.word	0x00000908
 800edbc:	000008f4 	.word	0x000008f4
 800edc0:	0000092c 	.word	0x0000092c
 800edc4:	00000e0c 	.word	0x00000e0c
 800edc8:	0000ffff 	.word	0x0000ffff
