fn_08009F14:
 8009f14:	4a1c      	ldr	r2, [pc, #112]	@ (8009f88 <fn_08009F14+0x74>)
 8009f16:	6811      	ldr	r1, [r2, #0]
 8009f18:	22ea      	movs	r2, #234	@ 0xea
 8009f1a:	b570      	push	{r4, r5, r6, lr}
 8009f1c:	255a      	movs	r5, #90	@ 0x5a
 8009f1e:	00d2      	lsls	r2, r2, #3
 8009f20:	588a      	ldr	r2, [r1, r2]
 8009f22:	215c      	movs	r1, #92	@ 0x5c
 8009f24:	5d43      	ldrb	r3, [r0, r5]
 8009f26:	4359      	muls	r1, r3
 8009f28:	1852      	adds	r2, r2, r1
 8009f2a:	6b91      	ldr	r1, [r2, #56]	@ 0x38
 8009f2c:	0004      	movs	r4, r0
 8009f2e:	293d      	cmp	r1, #61	@ 0x3d
 8009f30:	dc15      	bgt.n	8009f5e <fn_08009F14+0x4a>
 8009f32:	293a      	cmp	r1, #58	@ 0x3a
 8009f34:	dc04      	bgt.n	8009f40 <fn_08009F14+0x2c>
 8009f36:	2900      	cmp	r1, #0
 8009f38:	d109      	bne.n	8009f4e <fn_08009F14+0x3a>
 8009f3a:	bc70      	pop	{r4, r5, r6}
 8009f3c:	bc01      	pop	{r0}
 8009f3e:	4700      	bx	r0
 8009f40:	f7fc fdde 	bl	8006b00 <fn_08006B00>
 8009f44:	2103      	movs	r1, #3
 8009f46:	f01b facf 	bl	80254e8 <fn_080254E8>
 8009f4a:	5d63      	ldrb	r3, [r4, r5]
 8009f4c:	313b      	adds	r1, #59	@ 0x3b
 8009f4e:	22fd      	movs	r2, #253	@ 0xfd
 8009f50:	3b13      	subs	r3, #19
 8009f52:	4213      	tst	r3, r2
 8009f54:	d114      	bne.n	8009f80 <fn_08009F14+0x6c>
 8009f56:	2000      	movs	r0, #0
 8009f58:	f010 f9b6 	bl	801a2c8 <fn_0801A2C8>
 8009f5c:	e7ed      	b.n	8009f3a <fn_08009F14+0x26>
 8009f5e:	000a      	movs	r2, r1
 8009f60:	3a3e      	subs	r2, #62	@ 0x3e
 8009f62:	2a01      	cmp	r2, #1
 8009f64:	d8f3      	bhi.n	8009f4e <fn_08009F14+0x3a>
 8009f66:	f7fc fdcb 	bl	8006b00 <fn_08006B00>
 8009f6a:	2101      	movs	r1, #1
 8009f6c:	22fd      	movs	r2, #253	@ 0xfd
 8009f6e:	0fc3      	lsrs	r3, r0, #31
 8009f70:	18c0      	adds	r0, r0, r3
 8009f72:	4001      	ands	r1, r0
 8009f74:	1ac9      	subs	r1, r1, r3
 8009f76:	5d63      	ldrb	r3, [r4, r5]
 8009f78:	3b13      	subs	r3, #19
 8009f7a:	313e      	adds	r1, #62	@ 0x3e
 8009f7c:	4213      	tst	r3, r2
 8009f7e:	d0ea      	beq.n	8009f56 <fn_08009F14+0x42>
 8009f80:	0020      	movs	r0, r4
 8009f82:	f010 f9a1 	bl	801a2c8 <fn_0801A2C8>
 8009f86:	e7d8      	b.n	8009f3a <fn_08009F14+0x26>
 8009f88:	030064c4 	.word	0x030064c4
