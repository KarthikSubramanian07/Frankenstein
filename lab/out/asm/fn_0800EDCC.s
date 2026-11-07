fn_0800EDCC:
 800edcc:	b5f0      	push	{r4, r5, r6, r7, lr}
 800edce:	464e      	mov	r6, r9
 800edd0:	4657      	mov	r7, sl
 800edd2:	4645      	mov	r5, r8
 800edd4:	46de      	mov	lr, fp
 800edd6:	b5e0      	push	{r5, r6, r7, lr}
 800edd8:	4fd6      	ldr	r7, [pc, #856]	@ (800f134 <fn_0800EDCC+0x368>)
 800edda:	7906      	ldrb	r6, [r0, #4]
 800eddc:	6839      	ldr	r1, [r7, #0]
 800edde:	6883      	ldr	r3, [r0, #8]
 800ede0:	b087      	sub	sp, #28
 800ede2:	0005      	movs	r5, r0
 800ede4:	4699      	mov	r9, r3
 800ede6:	9101      	str	r1, [sp, #4]
 800ede8:	2e00      	cmp	r6, #0
 800edea:	d100      	bne.n	800edee <fn_0800EDCC+0x22>
 800edec:	e0e3      	b.n	800efb6 <fn_0800EDCC+0x1ea>
 800edee:	8bda      	ldrh	r2, [r3, #30]
 800edf0:	4bd1      	ldr	r3, [pc, #836]	@ (800f138 <fn_0800EDCC+0x36c>)
 800edf2:	58cb      	ldr	r3, [r1, r3]
 800edf4:	0092      	lsls	r2, r2, #2
 800edf6:	189b      	adds	r3, r3, r2
 800edf8:	78db      	ldrb	r3, [r3, #3]
 800edfa:	065a      	lsls	r2, r3, #25
 800edfc:	d407      	bmi.n	800ee0e <fn_0800EDCC+0x42>
 800edfe:	464a      	mov	r2, r9
 800ee00:	201a      	movs	r0, #26
 800ee02:	5e12      	ldrsh	r2, [r2, r0]
 800ee04:	09db      	lsrs	r3, r3, #7
 800ee06:	021b      	lsls	r3, r3, #8
 800ee08:	429a      	cmp	r2, r3
 800ee0a:	d000      	beq.n	800ee0e <fn_0800EDCC+0x42>
 800ee0c:	e187      	b.n	800f11e <fn_0800EDCC+0x352>
 800ee0e:	464b      	mov	r3, r9
 800ee10:	8b1b      	ldrh	r3, [r3, #24]
 800ee12:	075b      	lsls	r3, r3, #29
 800ee14:	d56e      	bpl.n	800eef4 <fn_0800EDCC+0x128>
 800ee16:	4648      	mov	r0, r9
 800ee18:	f001 f90a 	bl	8010030 <fn_08010030>
 800ee1c:	683a      	ldr	r2, [r7, #0]
 800ee1e:	4bc7      	ldr	r3, [pc, #796]	@ (800f13c <fn_0800EDCC+0x370>)
 800ee20:	6829      	ldr	r1, [r5, #0]
 800ee22:	58d0      	ldr	r0, [r2, r3]
 800ee24:	9201      	str	r2, [sp, #4]
 800ee26:	f016 fbd9 	bl	80255dc <fn_080255DC>
 800ee2a:	23df      	movs	r3, #223	@ 0xdf
 800ee2c:	9a01      	ldr	r2, [sp, #4]
 800ee2e:	011b      	lsls	r3, r3, #4
 800ee30:	58d1      	ldr	r1, [r2, r3]
 800ee32:	4bc3      	ldr	r3, [pc, #780]	@ (800f140 <fn_0800EDCC+0x374>)
 800ee34:	58d2      	ldr	r2, [r2, r3]
 800ee36:	464b      	mov	r3, r9
 800ee38:	0004      	movs	r4, r0
 800ee3a:	4682      	mov	sl, r0
 800ee3c:	8a98      	ldrh	r0, [r3, #20]
 800ee3e:	0043      	lsls	r3, r0, #1
 800ee40:	181b      	adds	r3, r3, r0
 800ee42:	009b      	lsls	r3, r3, #2
 800ee44:	18d3      	adds	r3, r2, r3
 800ee46:	8958      	ldrh	r0, [r3, #10]
 800ee48:	0083      	lsls	r3, r0, #2
 800ee4a:	181b      	adds	r3, r3, r0
 800ee4c:	00db      	lsls	r3, r3, #3
 800ee4e:	18cb      	adds	r3, r1, r3
 800ee50:	4698      	mov	r8, r3
 800ee52:	6818      	ldr	r0, [r3, #0]
 800ee54:	464b      	mov	r3, r9
 800ee56:	8adb      	ldrh	r3, [r3, #22]
 800ee58:	469c      	mov	ip, r3
 800ee5a:	4bba      	ldr	r3, [pc, #744]	@ (800f144 <fn_0800EDCC+0x378>)
 800ee5c:	459c      	cmp	ip, r3
 800ee5e:	d100      	bne.n	800ee62 <fn_0800EDCC+0x96>
 800ee60:	e190      	b.n	800f184 <fn_0800EDCC+0x3b8>
 800ee62:	4663      	mov	r3, ip
 800ee64:	005b      	lsls	r3, r3, #1
 800ee66:	4463      	add	r3, ip
 800ee68:	009b      	lsls	r3, r3, #2
 800ee6a:	18d2      	adds	r2, r2, r3
 800ee6c:	8952      	ldrh	r2, [r2, #10]
 800ee6e:	0093      	lsls	r3, r2, #2
 800ee70:	189b      	adds	r3, r3, r2
 800ee72:	00db      	lsls	r3, r3, #3
 800ee74:	18cb      	adds	r3, r1, r3
 800ee76:	469b      	mov	fp, r3
 800ee78:	681b      	ldr	r3, [r3, #0]
 800ee7a:	4298      	cmp	r0, r3
 800ee7c:	d019      	beq.n	800eeb2 <fn_0800EDCC+0xe6>
 800ee7e:	2393      	movs	r3, #147	@ 0x93
 800ee80:	9a01      	ldr	r2, [sp, #4]
 800ee82:	011b      	lsls	r3, r3, #4
 800ee84:	58d0      	ldr	r0, [r2, r3]
 800ee86:	4bb0      	ldr	r3, [pc, #704]	@ (800f148 <fn_0800EDCC+0x37c>)
 800ee88:	58d3      	ldr	r3, [r2, r3]
 800ee8a:	1ac0      	subs	r0, r0, r3
 800ee8c:	17e3      	asrs	r3, r4, #31
 800ee8e:	18e2      	adds	r2, r4, r3
 800ee90:	405a      	eors	r2, r3
 800ee92:	17c3      	asrs	r3, r0, #31
 800ee94:	4044      	eors	r4, r0
 800ee96:	18c0      	adds	r0, r0, r3
 800ee98:	4058      	eors	r0, r3
 800ee9a:	0401      	lsls	r1, r0, #16
 800ee9c:	1400      	asrs	r0, r0, #16
 800ee9e:	f016 fb6b 	bl	8025578 <fn_08025578>
 800eea2:	2c00      	cmp	r4, #0
 800eea4:	da00      	bge.n	800eea8 <fn_0800EDCC+0xdc>
 800eea6:	4240      	negs	r0, r0
 800eea8:	4ba8      	ldr	r3, [pc, #672]	@ (800f14c <fn_0800EDCC+0x380>)
 800eeaa:	9a01      	ldr	r2, [sp, #4]
 800eeac:	58d3      	ldr	r3, [r2, r3]
 800eeae:	4283      	cmp	r3, r0
 800eeb0:	db20      	blt.n	800eef4 <fn_0800EDCC+0x128>
 800eeb2:	4643      	mov	r3, r8
 800eeb4:	685a      	ldr	r2, [r3, #4]
 800eeb6:	465b      	mov	r3, fp
 800eeb8:	685b      	ldr	r3, [r3, #4]
 800eeba:	429a      	cmp	r2, r3
 800eebc:	d071      	beq.n	800efa2 <fn_0800EDCC+0x1d6>
 800eebe:	9a01      	ldr	r2, [sp, #4]
 800eec0:	4ba3      	ldr	r3, [pc, #652]	@ (800f150 <fn_0800EDCC+0x384>)
 800eec2:	58d0      	ldr	r0, [r2, r3]
 800eec4:	4ba0      	ldr	r3, [pc, #640]	@ (800f148 <fn_0800EDCC+0x37c>)
 800eec6:	58d3      	ldr	r3, [r2, r3]
 800eec8:	4652      	mov	r2, sl
 800eeca:	0014      	movs	r4, r2
 800eecc:	1ac0      	subs	r0, r0, r3
 800eece:	17c3      	asrs	r3, r0, #31
 800eed0:	4044      	eors	r4, r0
 800eed2:	18c0      	adds	r0, r0, r3
 800eed4:	4058      	eors	r0, r3
 800eed6:	17d3      	asrs	r3, r2, #31
 800eed8:	18d2      	adds	r2, r2, r3
 800eeda:	0401      	lsls	r1, r0, #16
 800eedc:	405a      	eors	r2, r3
 800eede:	1400      	asrs	r0, r0, #16
 800eee0:	f016 fb4a 	bl	8025578 <fn_08025578>
 800eee4:	2c00      	cmp	r4, #0
 800eee6:	da00      	bge.n	800eeea <fn_0800EDCC+0x11e>
 800eee8:	4240      	negs	r0, r0
 800eeea:	4b98      	ldr	r3, [pc, #608]	@ (800f14c <fn_0800EDCC+0x380>)
 800eeec:	9a01      	ldr	r2, [sp, #4]
 800eeee:	58d3      	ldr	r3, [r2, r3]
 800eef0:	4283      	cmp	r3, r0
 800eef2:	dd56      	ble.n	800efa2 <fn_0800EDCC+0x1d6>
 800eef4:	683a      	ldr	r2, [r7, #0]
 800eef6:	4b91      	ldr	r3, [pc, #580]	@ (800f13c <fn_0800EDCC+0x370>)
 800eef8:	682e      	ldr	r6, [r5, #0]
 800eefa:	58d5      	ldr	r5, [r2, r3]
 800eefc:	17eb      	asrs	r3, r5, #31
 800eefe:	18ea      	adds	r2, r5, r3
 800ef00:	2100      	movs	r1, #0
 800ef02:	2004      	movs	r0, #4
 800ef04:	405a      	eors	r2, r3
 800ef06:	f016 fb37 	bl	8025578 <fn_08025578>
 800ef0a:	2d00      	cmp	r5, #0
 800ef0c:	da00      	bge.n	800ef10 <fn_0800EDCC+0x144>
 800ef0e:	4240      	negs	r0, r0
 800ef10:	683d      	ldr	r5, [r7, #0]
 800ef12:	4b8d      	ldr	r3, [pc, #564]	@ (800f148 <fn_0800EDCC+0x37c>)
 800ef14:	58ef      	ldr	r7, [r5, r3]
 800ef16:	4b8d      	ldr	r3, [pc, #564]	@ (800f14c <fn_0800EDCC+0x380>)
 800ef18:	58eb      	ldr	r3, [r5, r3]
 800ef1a:	001c      	movs	r4, r3
 800ef1c:	4b87      	ldr	r3, [pc, #540]	@ (800f13c <fn_0800EDCC+0x370>)
 800ef1e:	1a36      	subs	r6, r6, r0
 800ef20:	58e9      	ldr	r1, [r5, r3]
 800ef22:	0030      	movs	r0, r6
 800ef24:	f016 fb5a 	bl	80255dc <fn_080255DC>
 800ef28:	0001      	movs	r1, r0
 800ef2a:	0020      	movs	r0, r4
 800ef2c:	f016 fb56 	bl	80255dc <fn_080255DC>
 800ef30:	23df      	movs	r3, #223	@ 0xdf
 800ef32:	011b      	lsls	r3, r3, #4
 800ef34:	58ea      	ldr	r2, [r5, r3]
 800ef36:	4b82      	ldr	r3, [pc, #520]	@ (800f140 <fn_0800EDCC+0x374>)
 800ef38:	58e9      	ldr	r1, [r5, r3]
 800ef3a:	464b      	mov	r3, r9
 800ef3c:	183f      	adds	r7, r7, r0
 800ef3e:	8a98      	ldrh	r0, [r3, #20]
 800ef40:	0043      	lsls	r3, r0, #1
 800ef42:	181b      	adds	r3, r3, r0
 800ef44:	009b      	lsls	r3, r3, #2
 800ef46:	18cb      	adds	r3, r1, r3
 800ef48:	8958      	ldrh	r0, [r3, #10]
 800ef4a:	0083      	lsls	r3, r0, #2
 800ef4c:	181b      	adds	r3, r3, r0
 800ef4e:	4881      	ldr	r0, [pc, #516]	@ (800f154 <fn_0800EDCC+0x388>)
 800ef50:	5828      	ldr	r0, [r5, r0]
 800ef52:	0004      	movs	r4, r0
 800ef54:	2025      	movs	r0, #37	@ 0x25
 800ef56:	00db      	lsls	r3, r3, #3
 800ef58:	18d3      	adds	r3, r2, r3
 800ef5a:	4684      	mov	ip, r0
 800ef5c:	5c18      	ldrb	r0, [r3, r0]
 800ef5e:	42a0      	cmp	r0, r4
 800ef60:	d000      	beq.n	800ef64 <fn_0800EDCC+0x198>
 800ef62:	e0c6      	b.n	800f0f2 <fn_0800EDCC+0x326>
 800ef64:	685b      	ldr	r3, [r3, #4]
 800ef66:	42bb      	cmp	r3, r7
 800ef68:	db1a      	blt.n	800efa0 <fn_0800EDCC+0x1d4>
 800ef6a:	464b      	mov	r3, r9
 800ef6c:	8adc      	ldrh	r4, [r3, #22]
 800ef6e:	4b75      	ldr	r3, [pc, #468]	@ (800f144 <fn_0800EDCC+0x378>)
 800ef70:	429c      	cmp	r4, r3
 800ef72:	d100      	bne.n	800ef76 <fn_0800EDCC+0x1aa>
 800ef74:	e0bd      	b.n	800f0f2 <fn_0800EDCC+0x326>
 800ef76:	0063      	lsls	r3, r4, #1
 800ef78:	191b      	adds	r3, r3, r4
 800ef7a:	009b      	lsls	r3, r3, #2
 800ef7c:	18c9      	adds	r1, r1, r3
 800ef7e:	8949      	ldrh	r1, [r1, #10]
 800ef80:	008b      	lsls	r3, r1, #2
 800ef82:	185b      	adds	r3, r3, r1
 800ef84:	00db      	lsls	r3, r3, #3
 800ef86:	18d2      	adds	r2, r2, r3
 800ef88:	2a00      	cmp	r2, #0
 800ef8a:	d100      	bne.n	800ef8e <fn_0800EDCC+0x1c2>
 800ef8c:	e0b1      	b.n	800f0f2 <fn_0800EDCC+0x326>
 800ef8e:	4663      	mov	r3, ip
 800ef90:	5cd3      	ldrb	r3, [r2, r3]
 800ef92:	4298      	cmp	r0, r3
 800ef94:	d000      	beq.n	800ef98 <fn_0800EDCC+0x1cc>
 800ef96:	e0ac      	b.n	800f0f2 <fn_0800EDCC+0x326>
 800ef98:	6853      	ldr	r3, [r2, #4]
 800ef9a:	42bb      	cmp	r3, r7
 800ef9c:	db00      	blt.n	800efa0 <fn_0800EDCC+0x1d4>
 800ef9e:	e0a8      	b.n	800f0f2 <fn_0800EDCC+0x326>
 800efa0:	2600      	movs	r6, #0
 800efa2:	0030      	movs	r0, r6
 800efa4:	b007      	add	sp, #28
 800efa6:	bcf0      	pop	{r4, r5, r6, r7}
 800efa8:	46bb      	mov	fp, r7
 800efaa:	46b2      	mov	sl, r6
 800efac:	46a9      	mov	r9, r5
 800efae:	46a0      	mov	r8, r4
 800efb0:	bcf0      	pop	{r4, r5, r6, r7}
 800efb2:	bc02      	pop	{r1}
 800efb4:	4708      	bx	r1
 800efb6:	4b68      	ldr	r3, [pc, #416]	@ (800f158 <fn_0800EDCC+0x38c>)
 800efb8:	58cb      	ldr	r3, [r1, r3]
 800efba:	454b      	cmp	r3, r9
 800efbc:	d100      	bne.n	800efc0 <fn_0800EDCC+0x1f4>
 800efbe:	e096      	b.n	800f0ee <fn_0800EDCC+0x322>
 800efc0:	464b      	mov	r3, r9
 800efc2:	6cdb      	ldr	r3, [r3, #76]	@ 0x4c
 800efc4:	075b      	lsls	r3, r3, #29
 800efc6:	d400      	bmi.n	800efca <fn_0800EDCC+0x1fe>
 800efc8:	e091      	b.n	800f0ee <fn_0800EDCC+0x322>
 800efca:	4b5c      	ldr	r3, [pc, #368]	@ (800f13c <fn_0800EDCC+0x370>)
 800efcc:	58c8      	ldr	r0, [r1, r3]
 800efce:	682b      	ldr	r3, [r5, #0]
 800efd0:	0019      	movs	r1, r3
 800efd2:	9305      	str	r3, [sp, #20]
 800efd4:	9004      	str	r0, [sp, #16]
 800efd6:	f016 fb01 	bl	80255dc <fn_080255DC>
 800efda:	464b      	mov	r3, r9
 800efdc:	9a01      	ldr	r2, [sp, #4]
 800efde:	6959      	ldr	r1, [r3, #20]
 800efe0:	4b59      	ldr	r3, [pc, #356]	@ (800f148 <fn_0800EDCC+0x37c>)
 800efe2:	58d3      	ldr	r3, [r2, r3]
 800efe4:	464a      	mov	r2, r9
 800efe6:	0004      	movs	r4, r0
 800efe8:	6b90      	ldr	r0, [r2, #56]	@ 0x38
 800efea:	1840      	adds	r0, r0, r1
 800efec:	1ac0      	subs	r0, r0, r3
 800efee:	469a      	mov	sl, r3
 800eff0:	0023      	movs	r3, r4
 800eff2:	4043      	eors	r3, r0
 800eff4:	9302      	str	r3, [sp, #8]
 800eff6:	17c3      	asrs	r3, r0, #31
 800eff8:	18c0      	adds	r0, r0, r3
 800effa:	4058      	eors	r0, r3
 800effc:	17e3      	asrs	r3, r4, #31
 800effe:	18e2      	adds	r2, r4, r3
 800f000:	405a      	eors	r2, r3
 800f002:	4688      	mov	r8, r1
 800f004:	0401      	lsls	r1, r0, #16
 800f006:	1400      	asrs	r0, r0, #16
 800f008:	9203      	str	r2, [sp, #12]
 800f00a:	f016 fab5 	bl	8025578 <fn_08025578>
 800f00e:	9b02      	ldr	r3, [sp, #8]
 800f010:	2b00      	cmp	r3, #0
 800f012:	da00      	bge.n	800f016 <fn_0800EDCC+0x24a>
 800f014:	e0a8      	b.n	800f168 <fn_0800EDCC+0x39c>
 800f016:	4b4d      	ldr	r3, [pc, #308]	@ (800f14c <fn_0800EDCC+0x380>)
 800f018:	9a01      	ldr	r2, [sp, #4]
 800f01a:	58d3      	ldr	r3, [r2, r3]
 800f01c:	469b      	mov	fp, r3
 800f01e:	4283      	cmp	r3, r0
 800f020:	dc65      	bgt.n	800f0ee <fn_0800EDCC+0x322>
 800f022:	4643      	mov	r3, r8
 800f024:	4652      	mov	r2, sl
 800f026:	1a98      	subs	r0, r3, r2
 800f028:	17c3      	asrs	r3, r0, #31
 800f02a:	4044      	eors	r4, r0
 800f02c:	18c0      	adds	r0, r0, r3
 800f02e:	4058      	eors	r0, r3
 800f030:	0401      	lsls	r1, r0, #16
 800f032:	9a03      	ldr	r2, [sp, #12]
 800f034:	1400      	asrs	r0, r0, #16
 800f036:	f016 fa9f 	bl	8025578 <fn_08025578>
 800f03a:	2c00      	cmp	r4, #0
 800f03c:	da00      	bge.n	800f040 <fn_0800EDCC+0x274>
 800f03e:	4240      	negs	r0, r0
 800f040:	4583      	cmp	fp, r0
 800f042:	db54      	blt.n	800f0ee <fn_0800EDCC+0x322>
 800f044:	9c04      	ldr	r4, [sp, #16]
 800f046:	17e3      	asrs	r3, r4, #31
 800f048:	18e2      	adds	r2, r4, r3
 800f04a:	2100      	movs	r1, #0
 800f04c:	200a      	movs	r0, #10
 800f04e:	405a      	eors	r2, r3
 800f050:	f016 fa92 	bl	8025578 <fn_08025578>
 800f054:	2c00      	cmp	r4, #0
 800f056:	da00      	bge.n	800f05a <fn_0800EDCC+0x28e>
 800f058:	4240      	negs	r0, r0
 800f05a:	9b05      	ldr	r3, [sp, #20]
 800f05c:	683c      	ldr	r4, [r7, #0]
 800f05e:	1a1a      	subs	r2, r3, r0
 800f060:	4b3e      	ldr	r3, [pc, #248]	@ (800f15c <fn_0800EDCC+0x390>)
 800f062:	58e3      	ldr	r3, [r4, r3]
 800f064:	9301      	str	r3, [sp, #4]
 800f066:	4b3e      	ldr	r3, [pc, #248]	@ (800f160 <fn_0800EDCC+0x394>)
 800f068:	0011      	movs	r1, r2
 800f06a:	58e0      	ldr	r0, [r4, r3]
 800f06c:	4690      	mov	r8, r2
 800f06e:	f016 fab5 	bl	80255dc <fn_080255DC>
 800f072:	9b01      	ldr	r3, [sp, #4]
 800f074:	469c      	mov	ip, r3
 800f076:	4484      	add	ip, r0
 800f078:	4663      	mov	r3, ip
 800f07a:	9303      	str	r3, [sp, #12]
 800f07c:	4b39      	ldr	r3, [pc, #228]	@ (800f164 <fn_0800EDCC+0x398>)
 800f07e:	58e0      	ldr	r0, [r4, r3]
 800f080:	3308      	adds	r3, #8
 800f082:	4641      	mov	r1, r8
 800f084:	9001      	str	r0, [sp, #4]
 800f086:	58e0      	ldr	r0, [r4, r3]
 800f088:	f016 faa8 	bl	80255dc <fn_080255DC>
 800f08c:	9a01      	ldr	r2, [sp, #4]
 800f08e:	4694      	mov	ip, r2
 800f090:	4484      	add	ip, r0
 800f092:	4662      	mov	r2, ip
 800f094:	4b2c      	ldr	r3, [pc, #176]	@ (800f148 <fn_0800EDCC+0x37c>)
 800f096:	58e3      	ldr	r3, [r4, r3]
 800f098:	9301      	str	r3, [sp, #4]
 800f09a:	4b2c      	ldr	r3, [pc, #176]	@ (800f14c <fn_0800EDCC+0x380>)
 800f09c:	9204      	str	r2, [sp, #16]
 800f09e:	58e2      	ldr	r2, [r4, r3]
 800f0a0:	4b26      	ldr	r3, [pc, #152]	@ (800f13c <fn_0800EDCC+0x370>)
 800f0a2:	4640      	mov	r0, r8
 800f0a4:	58e1      	ldr	r1, [r4, r3]
 800f0a6:	9202      	str	r2, [sp, #8]
 800f0a8:	f016 fa98 	bl	80255dc <fn_080255DC>
 800f0ac:	0001      	movs	r1, r0
 800f0ae:	9802      	ldr	r0, [sp, #8]
 800f0b0:	f016 fa94 	bl	80255dc <fn_080255DC>
 800f0b4:	68ab      	ldr	r3, [r5, #8]
 800f0b6:	46a2      	mov	sl, r4
 800f0b8:	6cdb      	ldr	r3, [r3, #76]	@ 0x4c
 800f0ba:	9c01      	ldr	r4, [sp, #4]
 800f0bc:	1822      	adds	r2, r4, r0
 800f0be:	031b      	lsls	r3, r3, #12
 800f0c0:	d45b      	bmi.n	800f17a <fn_0800EDCC+0x3ae>
 800f0c2:	2390      	movs	r3, #144	@ 0x90
 800f0c4:	4651      	mov	r1, sl
 800f0c6:	011b      	lsls	r3, r3, #4
 800f0c8:	58cb      	ldr	r3, [r1, r3]
 800f0ca:	9803      	ldr	r0, [sp, #12]
 800f0cc:	9904      	ldr	r1, [sp, #16]
 800f0ce:	f002 ff05 	bl	8011edc <fn_08011EDC>
 800f0d2:	2390      	movs	r3, #144	@ 0x90
 800f0d4:	683a      	ldr	r2, [r7, #0]
 800f0d6:	011b      	lsls	r3, r3, #4
 800f0d8:	58d3      	ldr	r3, [r2, r3]
 800f0da:	2b00      	cmp	r3, #0
 800f0dc:	d100      	bne.n	800f0e0 <fn_0800EDCC+0x314>
 800f0de:	e760      	b.n	800efa2 <fn_0800EDCC+0x1d6>
 800f0e0:	491d      	ldr	r1, [pc, #116]	@ (800f158 <fn_0800EDCC+0x38c>)
 800f0e2:	5851      	ldr	r1, [r2, r1]
 800f0e4:	4648      	mov	r0, r9
 800f0e6:	000a      	movs	r2, r1
 800f0e8:	f7fe fc68 	bl	800d9bc <fn_0800D9BC>
 800f0ec:	e759      	b.n	800efa2 <fn_0800EDCC+0x1d6>
 800f0ee:	2601      	movs	r6, #1
 800f0f0:	e757      	b.n	800efa2 <fn_0800EDCC+0x1d6>
 800f0f2:	4b1a      	ldr	r3, [pc, #104]	@ (800f15c <fn_0800EDCC+0x390>)
 800f0f4:	58ec      	ldr	r4, [r5, r3]
 800f0f6:	4b1a      	ldr	r3, [pc, #104]	@ (800f160 <fn_0800EDCC+0x394>)
 800f0f8:	0031      	movs	r1, r6
 800f0fa:	58e8      	ldr	r0, [r5, r3]
 800f0fc:	f016 fa6e 	bl	80255dc <fn_080255DC>
 800f100:	1823      	adds	r3, r4, r0
 800f102:	9301      	str	r3, [sp, #4]
 800f104:	4b17      	ldr	r3, [pc, #92]	@ (800f164 <fn_0800EDCC+0x398>)
 800f106:	58ec      	ldr	r4, [r5, r3]
 800f108:	3308      	adds	r3, #8
 800f10a:	0031      	movs	r1, r6
 800f10c:	58e8      	ldr	r0, [r5, r3]
 800f10e:	f016 fa65 	bl	80255dc <fn_080255DC>
 800f112:	003a      	movs	r2, r7
 800f114:	1821      	adds	r1, r4, r0
 800f116:	9801      	ldr	r0, [sp, #4]
 800f118:	f002 fea8 	bl	8011e6c <fn_08011E6C>
 800f11c:	e740      	b.n	800efa0 <fn_0800EDCC+0x1d4>
 800f11e:	4b0e      	ldr	r3, [pc, #56]	@ (800f158 <fn_0800EDCC+0x38c>)
 800f120:	58c8      	ldr	r0, [r1, r3]
 800f122:	4649      	mov	r1, r9
 800f124:	f007 f9fa 	bl	801651c <fn_0801651C>
 800f128:	464b      	mov	r3, r9
 800f12a:	8b1b      	ldrh	r3, [r3, #24]
 800f12c:	075b      	lsls	r3, r3, #29
 800f12e:	d400      	bmi.n	800f132 <fn_0800EDCC+0x366>
 800f130:	e6e0      	b.n	800eef4 <fn_0800EDCC+0x128>
 800f132:	e670      	b.n	800ee16 <fn_0800EDCC+0x4a>
 800f134:	030064c4 	.word	0x030064c4
 800f138:	00000e04 	.word	0x00000e04
 800f13c:	00000904 	.word	0x00000904
 800f140:	00000e0c 	.word	0x00000e0c
 800f144:	0000ffff 	.word	0x0000ffff
 800f148:	000008fc 	.word	0x000008fc
 800f14c:	00000908 	.word	0x00000908
 800f150:	0000092c 	.word	0x0000092c
 800f154:	000041b0 	.word	0x000041b0
 800f158:	000008f8 	.word	0x000008f8
 800f15c:	00000944 	.word	0x00000944
 800f160:	0000094c 	.word	0x0000094c
 800f164:	00000948 	.word	0x00000948
 800f168:	4b08      	ldr	r3, [pc, #32]	@ (800f18c <fn_0800EDCC+0x3c0>)
 800f16a:	9a01      	ldr	r2, [sp, #4]
 800f16c:	58d3      	ldr	r3, [r2, r3]
 800f16e:	4240      	negs	r0, r0
 800f170:	469b      	mov	fp, r3
 800f172:	4283      	cmp	r3, r0
 800f174:	dc00      	bgt.n	800f178 <fn_0800EDCC+0x3ac>
 800f176:	e754      	b.n	800f022 <fn_0800EDCC+0x256>
 800f178:	e7b9      	b.n	800f0ee <fn_0800EDCC+0x322>
 800f17a:	9904      	ldr	r1, [sp, #16]
 800f17c:	9803      	ldr	r0, [sp, #12]
 800f17e:	f002 fe75 	bl	8011e6c <fn_08011E6C>
 800f182:	e7a6      	b.n	800f0d2 <fn_0800EDCC+0x306>
 800f184:	2300      	movs	r3, #0
 800f186:	681b      	ldr	r3, [r3, #0]
 800f188:	deff      	udf	#255	@ 0xff
 800f18a:	46c0      	nop			@ (mov r8, r8)
 800f18c:	00000908 	.word	0x00000908
