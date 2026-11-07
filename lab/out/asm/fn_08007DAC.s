fn_08007DAC:
 8007dac:	b5f0      	push	{r4, r5, r6, r7, lr}
 8007dae:	4645      	mov	r5, r8
 8007db0:	46de      	mov	lr, fp
 8007db2:	4657      	mov	r7, sl
 8007db4:	464e      	mov	r6, r9
 8007db6:	235e      	movs	r3, #94	@ 0x5e
 8007db8:	b5e0      	push	{r5, r6, r7, lr}
 8007dba:	5cc5      	ldrb	r5, [r0, r3]
 8007dbc:	072d      	lsls	r5, r5, #28
 8007dbe:	0004      	movs	r4, r0
 8007dc0:	b083      	sub	sp, #12
 8007dc2:	0f2d      	lsrs	r5, r5, #28
 8007dc4:	2d08      	cmp	r5, #8
 8007dc6:	d100      	bne.n	8007dca <fn_08007DAC+0x1e>
 8007dc8:	e07b      	b.n	8007ec2 <fn_08007DAC+0x116>
 8007dca:	2604      	movs	r6, #4
 8007dcc:	406e      	eors	r6, r5
 8007dce:	225e      	movs	r2, #94	@ 0x5e
 8007dd0:	5ca3      	ldrb	r3, [r4, r2]
 8007dd2:	2b0f      	cmp	r3, #15
 8007dd4:	d86a      	bhi.n	8007eac <fn_08007DAC+0x100>
 8007dd6:	6d23      	ldr	r3, [r4, #80]	@ 0x50
 8007dd8:	68e2      	ldr	r2, [r4, #12]
 8007dda:	68d9      	ldr	r1, [r3, #12]
 8007ddc:	1a89      	subs	r1, r1, r2
 8007dde:	691a      	ldr	r2, [r3, #16]
 8007de0:	6923      	ldr	r3, [r4, #16]
 8007de2:	1ad0      	subs	r0, r2, r3
 8007de4:	23a0      	movs	r3, #160	@ 0xa0
 8007de6:	468b      	mov	fp, r1
 8007de8:	4681      	mov	r9, r0
 8007dea:	4abf      	ldr	r2, [pc, #764]	@ (80080e8 <fn_08007DAC+0x33c>)
 8007dec:	031b      	lsls	r3, r3, #12
 8007dee:	4299      	cmp	r1, r3
 8007df0:	dc10      	bgt.n	8007e14 <fn_08007DAC+0x68>
 8007df2:	4291      	cmp	r1, r2
 8007df4:	da67      	bge.n	8007ec6 <fn_08007DAC+0x11a>
 8007df6:	4290      	cmp	r0, r2
 8007df8:	da00      	bge.n	8007dfc <fn_08007DAC+0x50>
 8007dfa:	e16b      	b.n	80080d4 <fn_08007DAC+0x328>
 8007dfc:	4298      	cmp	r0, r3
 8007dfe:	dc00      	bgt.n	8007e02 <fn_08007DAC+0x56>
 8007e00:	e181      	b.n	8008106 <fn_08007DAC+0x35a>
 8007e02:	2303      	movs	r3, #3
 8007e04:	469c      	mov	ip, r3
 8007e06:	3301      	adds	r3, #1
 8007e08:	4698      	mov	r8, r3
 8007e0a:	3b02      	subs	r3, #2
 8007e0c:	2708      	movs	r7, #8
 8007e0e:	469a      	mov	sl, r3
 8007e10:	2103      	movs	r1, #3
 8007e12:	e009      	b.n	8007e28 <fn_08007DAC+0x7c>
 8007e14:	4290      	cmp	r0, r2
 8007e16:	da66      	bge.n	8007ee6 <fn_08007DAC+0x13a>
 8007e18:	2307      	movs	r3, #7
 8007e1a:	469c      	mov	ip, r3
 8007e1c:	2300      	movs	r3, #0
 8007e1e:	4698      	mov	r8, r3
 8007e20:	3306      	adds	r3, #6
 8007e22:	2780      	movs	r7, #128	@ 0x80
 8007e24:	469a      	mov	sl, r3
 8007e26:	2107      	movs	r1, #7
 8007e28:	205e      	movs	r0, #94	@ 0x5e
 8007e2a:	220f      	movs	r2, #15
 8007e2c:	5c23      	ldrb	r3, [r4, r0]
 8007e2e:	4393      	bics	r3, r2
 8007e30:	430b      	orrs	r3, r1
 8007e32:	5423      	strb	r3, [r4, r0]
 8007e34:	4566      	cmp	r6, ip
 8007e36:	d100      	bne.n	8007e3a <fn_08007DAC+0x8e>
 8007e38:	e0f0      	b.n	800801c <fn_08007DAC+0x270>
 8007e3a:	061b      	lsls	r3, r3, #24
 8007e3c:	0e1b      	lsrs	r3, r3, #24
 8007e3e:	4013      	ands	r3, r2
 8007e40:	2b08      	cmp	r3, #8
 8007e42:	d00b      	beq.n	8007e5c <fn_08007DAC+0xb0>
 8007e44:	0020      	movs	r0, r4
 8007e46:	f7ff fe41 	bl	8007acc <fn_08007ACC>
 8007e4a:	2800      	cmp	r0, #0
 8007e4c:	d000      	beq.n	8007e50 <fn_08007DAC+0xa4>
 8007e4e:	e10e      	b.n	800806e <fn_08007DAC+0x2c2>
 8007e50:	2701      	movs	r7, #1
 8007e52:	305e      	adds	r0, #94	@ 0x5e
 8007e54:	5c23      	ldrb	r3, [r4, r0]
 8007e56:	071b      	lsls	r3, r3, #28
 8007e58:	0f1b      	lsrs	r3, r3, #28
 8007e5a:	409f      	lsls	r7, r3
 8007e5c:	f7fe fe50 	bl	8006b00 <fn_08006B00>
 8007e60:	2301      	movs	r3, #1
 8007e62:	9301      	str	r3, [sp, #4]
 8007e64:	28c8      	cmp	r0, #200	@ 0xc8
 8007e66:	dc00      	bgt.n	8007e6a <fn_08007DAC+0xbe>
 8007e68:	e154      	b.n	8008114 <fn_08007DAC+0x368>
 8007e6a:	4556      	cmp	r6, sl
 8007e6c:	d000      	beq.n	8007e70 <fn_08007DAC+0xc4>
 8007e6e:	e0e8      	b.n	8008042 <fn_08007DAC+0x296>
 8007e70:	4643      	mov	r3, r8
 8007e72:	4546      	cmp	r6, r8
 8007e74:	d003      	beq.n	8007e7e <fn_08007DAC+0xd2>
 8007e76:	9a01      	ldr	r2, [sp, #4]
 8007e78:	2a00      	cmp	r2, #0
 8007e7a:	d000      	beq.n	8007e7e <fn_08007DAC+0xd2>
 8007e7c:	e10b      	b.n	8008096 <fn_08007DAC+0x2ea>
 8007e7e:	2d08      	cmp	r5, #8
 8007e80:	d049      	beq.n	8007f16 <fn_08007DAC+0x16a>
 8007e82:	225e      	movs	r2, #94	@ 0x5e
 8007e84:	210f      	movs	r1, #15
 8007e86:	5ca3      	ldrb	r3, [r4, r2]
 8007e88:	438b      	bics	r3, r1
 8007e8a:	432b      	orrs	r3, r5
 8007e8c:	54a3      	strb	r3, [r4, r2]
 8007e8e:	400b      	ands	r3, r1
 8007e90:	2b08      	cmp	r3, #8
 8007e92:	d03d      	beq.n	8007f10 <fn_08007DAC+0x164>
 8007e94:	0020      	movs	r0, r4
 8007e96:	f7ff fe19 	bl	8007acc <fn_08007ACC>
 8007e9a:	2800      	cmp	r0, #0
 8007e9c:	d038      	beq.n	8007f10 <fn_08007DAC+0x164>
 8007e9e:	f7fe fe2f 	bl	8006b00 <fn_08006B00>
 8007ea2:	210f      	movs	r1, #15
 8007ea4:	2358      	movs	r3, #88	@ 0x58
 8007ea6:	4008      	ands	r0, r1
 8007ea8:	52e0      	strh	r0, [r4, r3]
 8007eaa:	e001      	b.n	8007eb0 <fn_08007DAC+0x104>
 8007eac:	33f0      	adds	r3, #240	@ 0xf0
 8007eae:	54a3      	strb	r3, [r4, r2]
 8007eb0:	b003      	add	sp, #12
 8007eb2:	bcf0      	pop	{r4, r5, r6, r7}
 8007eb4:	46bb      	mov	fp, r7
 8007eb6:	46b2      	mov	sl, r6
 8007eb8:	46a9      	mov	r9, r5
 8007eba:	46a0      	mov	r8, r4
 8007ebc:	bcf0      	pop	{r4, r5, r6, r7}
 8007ebe:	bc01      	pop	{r0}
 8007ec0:	4700      	bx	r0
 8007ec2:	2608      	movs	r6, #8
 8007ec4:	e783      	b.n	8007dce <fn_08007DAC+0x22>
 8007ec6:	4290      	cmp	r0, r2
 8007ec8:	da00      	bge.n	8007ecc <fn_08007DAC+0x120>
 8007eca:	e0f9      	b.n	80080c0 <fn_08007DAC+0x314>
 8007ecc:	4298      	cmp	r0, r3
 8007ece:	dc00      	bgt.n	8007ed2 <fn_08007DAC+0x126>
 8007ed0:	e11c      	b.n	800810c <fn_08007DAC+0x360>
 8007ed2:	f7fe fe15 	bl	8006b00 <fn_08006B00>
 8007ed6:	2300      	movs	r3, #0
 8007ed8:	9301      	str	r3, [sp, #4]
 8007eda:	3308      	adds	r3, #8
 8007edc:	4698      	mov	r8, r3
 8007ede:	3b06      	subs	r3, #6
 8007ee0:	2700      	movs	r7, #0
 8007ee2:	469a      	mov	sl, r3
 8007ee4:	e7c1      	b.n	8007e6a <fn_08007DAC+0xbe>
 8007ee6:	4298      	cmp	r0, r3
 8007ee8:	dd00      	ble.n	8007eec <fn_08007DAC+0x140>
 8007eea:	e0ff      	b.n	80080ec <fn_08007DAC+0x340>
 8007eec:	2300      	movs	r3, #0
 8007eee:	4698      	mov	r8, r3
 8007ef0:	f7fe fe06 	bl	8006b00 <fn_08006B00>
 8007ef4:	28c8      	cmp	r0, #200	@ 0xc8
 8007ef6:	dd00      	ble.n	8007efa <fn_08007DAC+0x14e>
 8007ef8:	e101      	b.n	80080fe <fn_08007DAC+0x352>
 8007efa:	4546      	cmp	r6, r8
 8007efc:	d000      	beq.n	8007f00 <fn_08007DAC+0x154>
 8007efe:	e174      	b.n	80081ea <fn_08007DAC+0x43e>
 8007f00:	2700      	movs	r7, #0
 8007f02:	2d08      	cmp	r5, #8
 8007f04:	d1bd      	bne.n	8007e82 <fn_08007DAC+0xd6>
 8007f06:	f7fe fdfb 	bl	8006b00 <fn_08006B00>
 8007f0a:	07c0      	lsls	r0, r0, #31
 8007f0c:	d407      	bmi.n	8007f1e <fn_08007DAC+0x172>
 8007f0e:	e049      	b.n	8007fa4 <fn_08007DAC+0x1f8>
 8007f10:	2301      	movs	r3, #1
 8007f12:	40ab      	lsls	r3, r5
 8007f14:	431f      	orrs	r7, r3
 8007f16:	f7fe fdf3 	bl	8006b00 <fn_08006B00>
 8007f1a:	07c0      	lsls	r0, r0, #31
 8007f1c:	d53f      	bpl.n	8007f9e <fn_08007DAC+0x1f2>
 8007f1e:	2e00      	cmp	r6, #0
 8007f20:	d100      	bne.n	8007f24 <fn_08007DAC+0x178>
 8007f22:	e169      	b.n	80081f8 <fn_08007DAC+0x44c>
 8007f24:	07fb      	lsls	r3, r7, #31
 8007f26:	d400      	bmi.n	8007f2a <fn_08007DAC+0x17e>
 8007f28:	e234      	b.n	8008394 <fn_08007DAC+0x5e8>
 8007f2a:	2e01      	cmp	r6, #1
 8007f2c:	d100      	bne.n	8007f30 <fn_08007DAC+0x184>
 8007f2e:	e1a8      	b.n	8008282 <fn_08007DAC+0x4d6>
 8007f30:	07bb      	lsls	r3, r7, #30
 8007f32:	d400      	bmi.n	8007f36 <fn_08007DAC+0x18a>
 8007f34:	e23a      	b.n	80083ac <fn_08007DAC+0x600>
 8007f36:	2e02      	cmp	r6, #2
 8007f38:	d100      	bne.n	8007f3c <fn_08007DAC+0x190>
 8007f3a:	e1d0      	b.n	80082de <fn_08007DAC+0x532>
 8007f3c:	077b      	lsls	r3, r7, #29
 8007f3e:	d400      	bmi.n	8007f42 <fn_08007DAC+0x196>
 8007f40:	e27e      	b.n	8008440 <fn_08007DAC+0x694>
 8007f42:	2e03      	cmp	r6, #3
 8007f44:	d100      	bne.n	8007f48 <fn_08007DAC+0x19c>
 8007f46:	e200      	b.n	800834a <fn_08007DAC+0x59e>
 8007f48:	073b      	lsls	r3, r7, #28
 8007f4a:	d400      	bmi.n	8007f4e <fn_08007DAC+0x1a2>
 8007f4c:	e15d      	b.n	800820a <fn_08007DAC+0x45e>
 8007f4e:	2e04      	cmp	r6, #4
 8007f50:	d100      	bne.n	8007f54 <fn_08007DAC+0x1a8>
 8007f52:	e0ee      	b.n	8008132 <fn_08007DAC+0x386>
 8007f54:	06fb      	lsls	r3, r7, #27
 8007f56:	d400      	bmi.n	8007f5a <fn_08007DAC+0x1ae>
 8007f58:	e19c      	b.n	8008294 <fn_08007DAC+0x4e8>
 8007f5a:	2e05      	cmp	r6, #5
 8007f5c:	d100      	bne.n	8007f60 <fn_08007DAC+0x1b4>
 8007f5e:	e11a      	b.n	8008196 <fn_08007DAC+0x3ea>
 8007f60:	06bb      	lsls	r3, r7, #26
 8007f62:	d400      	bmi.n	8007f66 <fn_08007DAC+0x1ba>
 8007f64:	e1c4      	b.n	80082f0 <fn_08007DAC+0x544>
 8007f66:	2e06      	cmp	r6, #6
 8007f68:	d100      	bne.n	8007f6c <fn_08007DAC+0x1c0>
 8007f6a:	e117      	b.n	800819c <fn_08007DAC+0x3f0>
 8007f6c:	067b      	lsls	r3, r7, #25
 8007f6e:	d400      	bmi.n	8007f72 <fn_08007DAC+0x1c6>
 8007f70:	e1f4      	b.n	800835c <fn_08007DAC+0x5b0>
 8007f72:	2e07      	cmp	r6, #7
 8007f74:	d03e      	beq.n	8007ff4 <fn_08007DAC+0x248>
 8007f76:	063f      	lsls	r7, r7, #24
 8007f78:	d400      	bmi.n	8007f7c <fn_08007DAC+0x1d0>
 8007f7a:	e0e3      	b.n	8008144 <fn_08007DAC+0x398>
 8007f7c:	2e08      	cmp	r6, #8
 8007f7e:	d139      	bne.n	8007ff4 <fn_08007DAC+0x248>
 8007f80:	265e      	movs	r6, #94	@ 0x5e
 8007f82:	250f      	movs	r5, #15
 8007f84:	2208      	movs	r2, #8
 8007f86:	5da3      	ldrb	r3, [r4, r6]
 8007f88:	43ab      	bics	r3, r5
 8007f8a:	4313      	orrs	r3, r2
 8007f8c:	55a3      	strb	r3, [r4, r6]
 8007f8e:	f7fe fdb7 	bl	8006b00 <fn_08006B00>
 8007f92:	5da3      	ldrb	r3, [r4, r6]
 8007f94:	0100      	lsls	r0, r0, #4
 8007f96:	401d      	ands	r5, r3
 8007f98:	4305      	orrs	r5, r0
 8007f9a:	55a5      	strb	r5, [r4, r6]
 8007f9c:	e788      	b.n	8007eb0 <fn_08007DAC+0x104>
 8007f9e:	2e07      	cmp	r6, #7
 8007fa0:	d100      	bne.n	8007fa4 <fn_08007DAC+0x1f8>
 8007fa2:	e140      	b.n	8008226 <fn_08007DAC+0x47a>
 8007fa4:	063b      	lsls	r3, r7, #24
 8007fa6:	d400      	bmi.n	8007faa <fn_08007DAC+0x1fe>
 8007fa8:	e1e6      	b.n	8008378 <fn_08007DAC+0x5cc>
 8007faa:	2e06      	cmp	r6, #6
 8007fac:	d100      	bne.n	8007fb0 <fn_08007DAC+0x204>
 8007fae:	e151      	b.n	8008254 <fn_08007DAC+0x4a8>
 8007fb0:	067b      	lsls	r3, r7, #25
 8007fb2:	d400      	bmi.n	8007fb6 <fn_08007DAC+0x20a>
 8007fb4:	e208      	b.n	80083c8 <fn_08007DAC+0x61c>
 8007fb6:	2e05      	cmp	r6, #5
 8007fb8:	d100      	bne.n	8007fbc <fn_08007DAC+0x210>
 8007fba:	e179      	b.n	80082b0 <fn_08007DAC+0x504>
 8007fbc:	06bb      	lsls	r3, r7, #26
 8007fbe:	d400      	bmi.n	8007fc2 <fn_08007DAC+0x216>
 8007fc0:	e220      	b.n	8008404 <fn_08007DAC+0x658>
 8007fc2:	2e04      	cmp	r6, #4
 8007fc4:	d05a      	beq.n	800807c <fn_08007DAC+0x2d0>
 8007fc6:	06fb      	lsls	r3, r7, #27
 8007fc8:	d400      	bmi.n	8007fcc <fn_08007DAC+0x220>
 8007fca:	e135      	b.n	8008238 <fn_08007DAC+0x48c>
 8007fcc:	2e03      	cmp	r6, #3
 8007fce:	d100      	bne.n	8007fd2 <fn_08007DAC+0x226>
 8007fd0:	e0cc      	b.n	800816c <fn_08007DAC+0x3c0>
 8007fd2:	073b      	lsls	r3, r7, #28
 8007fd4:	d400      	bmi.n	8007fd8 <fn_08007DAC+0x22c>
 8007fd6:	e146      	b.n	8008266 <fn_08007DAC+0x4ba>
 8007fd8:	2e02      	cmp	r6, #2
 8007fda:	d100      	bne.n	8007fde <fn_08007DAC+0x232>
 8007fdc:	e0ef      	b.n	80081be <fn_08007DAC+0x412>
 8007fde:	077b      	lsls	r3, r7, #29
 8007fe0:	d400      	bmi.n	8007fe4 <fn_08007DAC+0x238>
 8007fe2:	e16e      	b.n	80082c2 <fn_08007DAC+0x516>
 8007fe4:	2e01      	cmp	r6, #1
 8007fe6:	d100      	bne.n	8007fea <fn_08007DAC+0x23e>
 8007fe8:	e0fb      	b.n	80081e2 <fn_08007DAC+0x436>
 8007fea:	07bb      	lsls	r3, r7, #30
 8007fec:	d400      	bmi.n	8007ff0 <fn_08007DAC+0x244>
 8007fee:	e19e      	b.n	800832e <fn_08007DAC+0x582>
 8007ff0:	2e00      	cmp	r6, #0
 8007ff2:	d14c      	bne.n	800808e <fn_08007DAC+0x2e2>
 8007ff4:	225e      	movs	r2, #94	@ 0x5e
 8007ff6:	250f      	movs	r5, #15
 8007ff8:	5ca3      	ldrb	r3, [r4, r2]
 8007ffa:	43ab      	bics	r3, r5
 8007ffc:	4333      	orrs	r3, r6
 8007ffe:	54a3      	strb	r3, [r4, r2]
 8008000:	402b      	ands	r3, r5
 8008002:	2b08      	cmp	r3, #8
 8008004:	d0bc      	beq.n	8007f80 <fn_08007DAC+0x1d4>
 8008006:	0020      	movs	r0, r4
 8008008:	f7ff fd60 	bl	8007acc <fn_08007ACC>
 800800c:	2800      	cmp	r0, #0
 800800e:	d0b7      	beq.n	8007f80 <fn_08007DAC+0x1d4>
 8008010:	f7fe fd76 	bl	8006b00 <fn_08006B00>
 8008014:	2358      	movs	r3, #88	@ 0x58
 8008016:	4005      	ands	r5, r0
 8008018:	52e5      	strh	r5, [r4, r3]
 800801a:	e749      	b.n	8007eb0 <fn_08007DAC+0x104>
 800801c:	f7fe fd70 	bl	8006b00 <fn_08006B00>
 8008020:	2301      	movs	r3, #1
 8008022:	9301      	str	r3, [sp, #4]
 8008024:	28c8      	cmp	r0, #200	@ 0xc8
 8008026:	dc0c      	bgt.n	8008042 <fn_08007DAC+0x296>
 8008028:	464a      	mov	r2, r9
 800802a:	17d3      	asrs	r3, r2, #31
 800802c:	18d2      	adds	r2, r2, r3
 800802e:	405a      	eors	r2, r3
 8008030:	465b      	mov	r3, fp
 8008032:	17d9      	asrs	r1, r3, #31
 8008034:	185b      	adds	r3, r3, r1
 8008036:	404b      	eors	r3, r1
 8008038:	429a      	cmp	r2, r3
 800803a:	dc02      	bgt.n	8008042 <fn_08007DAC+0x296>
 800803c:	4642      	mov	r2, r8
 800803e:	46d0      	mov	r8, sl
 8008040:	4692      	mov	sl, r2
 8008042:	225e      	movs	r2, #94	@ 0x5e
 8008044:	4653      	mov	r3, sl
 8008046:	210f      	movs	r1, #15
 8008048:	200f      	movs	r0, #15
 800804a:	4019      	ands	r1, r3
 800804c:	5ca3      	ldrb	r3, [r4, r2]
 800804e:	4383      	bics	r3, r0
 8008050:	430b      	orrs	r3, r1
 8008052:	54a3      	strb	r3, [r4, r2]
 8008054:	4003      	ands	r3, r0
 8008056:	2b08      	cmp	r3, #8
 8008058:	d004      	beq.n	8008064 <fn_08007DAC+0x2b8>
 800805a:	0020      	movs	r0, r4
 800805c:	f7ff fd36 	bl	8007acc <fn_08007ACC>
 8008060:	2800      	cmp	r0, #0
 8008062:	d104      	bne.n	800806e <fn_08007DAC+0x2c2>
 8008064:	2301      	movs	r3, #1
 8008066:	4652      	mov	r2, sl
 8008068:	4093      	lsls	r3, r2
 800806a:	431f      	orrs	r7, r3
 800806c:	e700      	b.n	8007e70 <fn_08007DAC+0xc4>
 800806e:	f7fe fd47 	bl	8006b00 <fn_08006B00>
 8008072:	230f      	movs	r3, #15
 8008074:	4018      	ands	r0, r3
 8008076:	3349      	adds	r3, #73	@ 0x49
 8008078:	52e0      	strh	r0, [r4, r3]
 800807a:	e719      	b.n	8007eb0 <fn_08007DAC+0x104>
 800807c:	073b      	lsls	r3, r7, #28
 800807e:	d400      	bmi.n	8008082 <fn_08007DAC+0x2d6>
 8008080:	e224      	b.n	80084cc <fn_08007DAC+0x720>
 8008082:	423e      	tst	r6, r7
 8008084:	d100      	bne.n	8008088 <fn_08007DAC+0x2dc>
 8008086:	e2c2      	b.n	800860e <fn_08007DAC+0x862>
 8008088:	07bb      	lsls	r3, r7, #30
 800808a:	d400      	bmi.n	800808e <fn_08007DAC+0x2e2>
 800808c:	e14f      	b.n	800832e <fn_08007DAC+0x582>
 800808e:	07ff      	lsls	r7, r7, #31
 8008090:	d500      	bpl.n	8008094 <fn_08007DAC+0x2e8>
 8008092:	e773      	b.n	8007f7c <fn_08007DAC+0x1d0>
 8008094:	e073      	b.n	800817e <fn_08007DAC+0x3d2>
 8008096:	225e      	movs	r2, #94	@ 0x5e
 8008098:	210f      	movs	r1, #15
 800809a:	200f      	movs	r0, #15
 800809c:	4019      	ands	r1, r3
 800809e:	5ca3      	ldrb	r3, [r4, r2]
 80080a0:	4383      	bics	r3, r0
 80080a2:	430b      	orrs	r3, r1
 80080a4:	54a3      	strb	r3, [r4, r2]
 80080a6:	4003      	ands	r3, r0
 80080a8:	2b08      	cmp	r3, #8
 80080aa:	d004      	beq.n	80080b6 <fn_08007DAC+0x30a>
 80080ac:	0020      	movs	r0, r4
 80080ae:	f7ff fd0d 	bl	8007acc <fn_08007ACC>
 80080b2:	2800      	cmp	r0, #0
 80080b4:	d1db      	bne.n	800806e <fn_08007DAC+0x2c2>
 80080b6:	2301      	movs	r3, #1
 80080b8:	4642      	mov	r2, r8
 80080ba:	4093      	lsls	r3, r2
 80080bc:	431f      	orrs	r7, r3
 80080be:	e6de      	b.n	8007e7e <fn_08007DAC+0xd2>
 80080c0:	f7fe fd1e 	bl	8006b00 <fn_08006B00>
 80080c4:	2300      	movs	r3, #0
 80080c6:	9301      	str	r3, [sp, #4]
 80080c8:	3308      	adds	r3, #8
 80080ca:	4698      	mov	r8, r3
 80080cc:	3b02      	subs	r3, #2
 80080ce:	2700      	movs	r7, #0
 80080d0:	469a      	mov	sl, r3
 80080d2:	e6ca      	b.n	8007e6a <fn_08007DAC+0xbe>
 80080d4:	2305      	movs	r3, #5
 80080d6:	469c      	mov	ip, r3
 80080d8:	3b01      	subs	r3, #1
 80080da:	4698      	mov	r8, r3
 80080dc:	3302      	adds	r3, #2
 80080de:	2720      	movs	r7, #32
 80080e0:	469a      	mov	sl, r3
 80080e2:	2105      	movs	r1, #5
 80080e4:	e6a0      	b.n	8007e28 <fn_08007DAC+0x7c>
 80080e6:	46c0      	nop			@ (mov r8, r8)
 80080e8:	fff60000 	.word	0xfff60000
 80080ec:	2301      	movs	r3, #1
 80080ee:	469c      	mov	ip, r3
 80080f0:	2300      	movs	r3, #0
 80080f2:	4698      	mov	r8, r3
 80080f4:	3302      	adds	r3, #2
 80080f6:	2702      	movs	r7, #2
 80080f8:	469a      	mov	sl, r3
 80080fa:	2101      	movs	r1, #1
 80080fc:	e694      	b.n	8007e28 <fn_08007DAC+0x7c>
 80080fe:	2301      	movs	r3, #1
 8008100:	2700      	movs	r7, #0
 8008102:	9301      	str	r3, [sp, #4]
 8008104:	e6b4      	b.n	8007e70 <fn_08007DAC+0xc4>
 8008106:	2304      	movs	r3, #4
 8008108:	4698      	mov	r8, r3
 800810a:	e6f1      	b.n	8007ef0 <fn_08007DAC+0x144>
 800810c:	f7fe fcf8 	bl	8006b00 <fn_08006B00>
 8008110:	2700      	movs	r7, #0
 8008112:	e6b4      	b.n	8007e7e <fn_08007DAC+0xd2>
 8008114:	465a      	mov	r2, fp
 8008116:	17d3      	asrs	r3, r2, #31
 8008118:	18d2      	adds	r2, r2, r3
 800811a:	405a      	eors	r2, r3
 800811c:	464b      	mov	r3, r9
 800811e:	17d9      	asrs	r1, r3, #31
 8008120:	185b      	adds	r3, r3, r1
 8008122:	404b      	eors	r3, r1
 8008124:	429a      	cmp	r2, r3
 8008126:	da00      	bge.n	800812a <fn_08007DAC+0x37e>
 8008128:	e69f      	b.n	8007e6a <fn_08007DAC+0xbe>
 800812a:	4642      	mov	r2, r8
 800812c:	46d0      	mov	r8, sl
 800812e:	4692      	mov	sl, r2
 8008130:	e69b      	b.n	8007e6a <fn_08007DAC+0xbe>
 8008132:	06bb      	lsls	r3, r7, #26
 8008134:	d400      	bmi.n	8008138 <fn_08007DAC+0x38c>
 8008136:	e1e8      	b.n	800850a <fn_08007DAC+0x75e>
 8008138:	067b      	lsls	r3, r7, #25
 800813a:	d400      	bmi.n	800813e <fn_08007DAC+0x392>
 800813c:	e283      	b.n	8008646 <fn_08007DAC+0x89a>
 800813e:	063f      	lsls	r7, r7, #24
 8008140:	d500      	bpl.n	8008144 <fn_08007DAC+0x398>
 8008142:	e757      	b.n	8007ff4 <fn_08007DAC+0x248>
 8008144:	225e      	movs	r2, #94	@ 0x5e
 8008146:	210f      	movs	r1, #15
 8008148:	5ca3      	ldrb	r3, [r4, r2]
 800814a:	438b      	bics	r3, r1
 800814c:	2107      	movs	r1, #7
 800814e:	430b      	orrs	r3, r1
 8008150:	0020      	movs	r0, r4
 8008152:	54a3      	strb	r3, [r4, r2]
 8008154:	f7ff fcba 	bl	8007acc <fn_08007ACC>
 8008158:	2800      	cmp	r0, #0
 800815a:	d100      	bne.n	800815e <fn_08007DAC+0x3b2>
 800815c:	e70e      	b.n	8007f7c <fn_08007DAC+0x1d0>
 800815e:	f7fe fccf 	bl	8006b00 <fn_08006B00>
 8008162:	230f      	movs	r3, #15
 8008164:	2258      	movs	r2, #88	@ 0x58
 8008166:	4003      	ands	r3, r0
 8008168:	52a3      	strh	r3, [r4, r2]
 800816a:	e6a1      	b.n	8007eb0 <fn_08007DAC+0x104>
 800816c:	077b      	lsls	r3, r7, #29
 800816e:	d400      	bmi.n	8008172 <fn_08007DAC+0x3c6>
 8008170:	e0cc      	b.n	800830c <fn_08007DAC+0x560>
 8008172:	07bb      	lsls	r3, r7, #30
 8008174:	d400      	bmi.n	8008178 <fn_08007DAC+0x3cc>
 8008176:	e274      	b.n	8008662 <fn_08007DAC+0x8b6>
 8008178:	07ff      	lsls	r7, r7, #31
 800817a:	d500      	bpl.n	800817e <fn_08007DAC+0x3d2>
 800817c:	e73a      	b.n	8007ff4 <fn_08007DAC+0x248>
 800817e:	225e      	movs	r2, #94	@ 0x5e
 8008180:	210f      	movs	r1, #15
 8008182:	5ca3      	ldrb	r3, [r4, r2]
 8008184:	438b      	bics	r3, r1
 8008186:	0020      	movs	r0, r4
 8008188:	54a3      	strb	r3, [r4, r2]
 800818a:	f7ff fc9f 	bl	8007acc <fn_08007ACC>
 800818e:	2800      	cmp	r0, #0
 8008190:	d100      	bne.n	8008194 <fn_08007DAC+0x3e8>
 8008192:	e6f3      	b.n	8007f7c <fn_08007DAC+0x1d0>
 8008194:	e7e3      	b.n	800815e <fn_08007DAC+0x3b2>
 8008196:	067b      	lsls	r3, r7, #25
 8008198:	d400      	bmi.n	800819c <fn_08007DAC+0x3f0>
 800819a:	e1c4      	b.n	8008526 <fn_08007DAC+0x77a>
 800819c:	063f      	lsls	r7, r7, #24
 800819e:	d500      	bpl.n	80081a2 <fn_08007DAC+0x3f6>
 80081a0:	e728      	b.n	8007ff4 <fn_08007DAC+0x248>
 80081a2:	225e      	movs	r2, #94	@ 0x5e
 80081a4:	210f      	movs	r1, #15
 80081a6:	5ca3      	ldrb	r3, [r4, r2]
 80081a8:	438b      	bics	r3, r1
 80081aa:	2107      	movs	r1, #7
 80081ac:	430b      	orrs	r3, r1
 80081ae:	0020      	movs	r0, r4
 80081b0:	54a3      	strb	r3, [r4, r2]
 80081b2:	f7ff fc8b 	bl	8007acc <fn_08007ACC>
 80081b6:	2800      	cmp	r0, #0
 80081b8:	d100      	bne.n	80081bc <fn_08007DAC+0x410>
 80081ba:	e71b      	b.n	8007ff4 <fn_08007DAC+0x248>
 80081bc:	e7cf      	b.n	800815e <fn_08007DAC+0x3b2>
 80081be:	423e      	tst	r6, r7
 80081c0:	d100      	bne.n	80081c4 <fn_08007DAC+0x418>
 80081c2:	e1be      	b.n	8008542 <fn_08007DAC+0x796>
 80081c4:	07ff      	lsls	r7, r7, #31
 80081c6:	d500      	bpl.n	80081ca <fn_08007DAC+0x41e>
 80081c8:	e714      	b.n	8007ff4 <fn_08007DAC+0x248>
 80081ca:	225e      	movs	r2, #94	@ 0x5e
 80081cc:	210f      	movs	r1, #15
 80081ce:	5ca3      	ldrb	r3, [r4, r2]
 80081d0:	438b      	bics	r3, r1
 80081d2:	0020      	movs	r0, r4
 80081d4:	54a3      	strb	r3, [r4, r2]
 80081d6:	f7ff fc79 	bl	8007acc <fn_08007ACC>
 80081da:	2800      	cmp	r0, #0
 80081dc:	d100      	bne.n	80081e0 <fn_08007DAC+0x434>
 80081de:	e709      	b.n	8007ff4 <fn_08007DAC+0x248>
 80081e0:	e7bd      	b.n	800815e <fn_08007DAC+0x3b2>
 80081e2:	423e      	tst	r6, r7
 80081e4:	d000      	beq.n	80081e8 <fn_08007DAC+0x43c>
 80081e6:	e705      	b.n	8007ff4 <fn_08007DAC+0x248>
 80081e8:	e7ef      	b.n	80081ca <fn_08007DAC+0x41e>
 80081ea:	2300      	movs	r3, #0
 80081ec:	9301      	str	r3, [sp, #4]
 80081ee:	3308      	adds	r3, #8
 80081f0:	46c2      	mov	sl, r8
 80081f2:	2700      	movs	r7, #0
 80081f4:	4698      	mov	r8, r3
 80081f6:	e724      	b.n	8008042 <fn_08007DAC+0x296>
 80081f8:	07bb      	lsls	r3, r7, #30
 80081fa:	d400      	bmi.n	80081fe <fn_08007DAC+0x452>
 80081fc:	e110      	b.n	8008420 <fn_08007DAC+0x674>
 80081fe:	077b      	lsls	r3, r7, #29
 8008200:	d400      	bmi.n	8008204 <fn_08007DAC+0x458>
 8008202:	e1be      	b.n	8008582 <fn_08007DAC+0x7d6>
 8008204:	073b      	lsls	r3, r7, #28
 8008206:	d500      	bpl.n	800820a <fn_08007DAC+0x45e>
 8008208:	e6a4      	b.n	8007f54 <fn_08007DAC+0x1a8>
 800820a:	225e      	movs	r2, #94	@ 0x5e
 800820c:	210f      	movs	r1, #15
 800820e:	5ca3      	ldrb	r3, [r4, r2]
 8008210:	438b      	bics	r3, r1
 8008212:	2103      	movs	r1, #3
 8008214:	430b      	orrs	r3, r1
 8008216:	0020      	movs	r0, r4
 8008218:	54a3      	strb	r3, [r4, r2]
 800821a:	f7ff fc57 	bl	8007acc <fn_08007ACC>
 800821e:	2800      	cmp	r0, #0
 8008220:	d100      	bne.n	8008224 <fn_08007DAC+0x478>
 8008222:	e694      	b.n	8007f4e <fn_08007DAC+0x1a2>
 8008224:	e79b      	b.n	800815e <fn_08007DAC+0x3b2>
 8008226:	067b      	lsls	r3, r7, #25
 8008228:	d400      	bmi.n	800822c <fn_08007DAC+0x480>
 800822a:	e0db      	b.n	80083e4 <fn_08007DAC+0x638>
 800822c:	06bb      	lsls	r3, r7, #26
 800822e:	d400      	bmi.n	8008232 <fn_08007DAC+0x486>
 8008230:	e199      	b.n	8008566 <fn_08007DAC+0x7ba>
 8008232:	06fb      	lsls	r3, r7, #27
 8008234:	d500      	bpl.n	8008238 <fn_08007DAC+0x48c>
 8008236:	e6cc      	b.n	8007fd2 <fn_08007DAC+0x226>
 8008238:	225e      	movs	r2, #94	@ 0x5e
 800823a:	210f      	movs	r1, #15
 800823c:	5ca3      	ldrb	r3, [r4, r2]
 800823e:	438b      	bics	r3, r1
 8008240:	2104      	movs	r1, #4
 8008242:	430b      	orrs	r3, r1
 8008244:	0020      	movs	r0, r4
 8008246:	54a3      	strb	r3, [r4, r2]
 8008248:	f7ff fc40 	bl	8007acc <fn_08007ACC>
 800824c:	2800      	cmp	r0, #0
 800824e:	d100      	bne.n	8008252 <fn_08007DAC+0x4a6>
 8008250:	e6bc      	b.n	8007fcc <fn_08007DAC+0x220>
 8008252:	e784      	b.n	800815e <fn_08007DAC+0x3b2>
 8008254:	06bb      	lsls	r3, r7, #26
 8008256:	d400      	bmi.n	800825a <fn_08007DAC+0x4ae>
 8008258:	e100      	b.n	800845c <fn_08007DAC+0x6b0>
 800825a:	06fb      	lsls	r3, r7, #27
 800825c:	d400      	bmi.n	8008260 <fn_08007DAC+0x4b4>
 800825e:	e19e      	b.n	800859e <fn_08007DAC+0x7f2>
 8008260:	073b      	lsls	r3, r7, #28
 8008262:	d500      	bpl.n	8008266 <fn_08007DAC+0x4ba>
 8008264:	e6bb      	b.n	8007fde <fn_08007DAC+0x232>
 8008266:	225e      	movs	r2, #94	@ 0x5e
 8008268:	210f      	movs	r1, #15
 800826a:	5ca3      	ldrb	r3, [r4, r2]
 800826c:	438b      	bics	r3, r1
 800826e:	2103      	movs	r1, #3
 8008270:	430b      	orrs	r3, r1
 8008272:	0020      	movs	r0, r4
 8008274:	54a3      	strb	r3, [r4, r2]
 8008276:	f7ff fc29 	bl	8007acc <fn_08007ACC>
 800827a:	2800      	cmp	r0, #0
 800827c:	d100      	bne.n	8008280 <fn_08007DAC+0x4d4>
 800827e:	e6ab      	b.n	8007fd8 <fn_08007DAC+0x22c>
 8008280:	e76d      	b.n	800815e <fn_08007DAC+0x3b2>
 8008282:	077b      	lsls	r3, r7, #29
 8008284:	d400      	bmi.n	8008288 <fn_08007DAC+0x4dc>
 8008286:	e0f7      	b.n	8008478 <fn_08007DAC+0x6cc>
 8008288:	073b      	lsls	r3, r7, #28
 800828a:	d400      	bmi.n	800828e <fn_08007DAC+0x4e2>
 800828c:	e195      	b.n	80085ba <fn_08007DAC+0x80e>
 800828e:	06fb      	lsls	r3, r7, #27
 8008290:	d500      	bpl.n	8008294 <fn_08007DAC+0x4e8>
 8008292:	e665      	b.n	8007f60 <fn_08007DAC+0x1b4>
 8008294:	225e      	movs	r2, #94	@ 0x5e
 8008296:	210f      	movs	r1, #15
 8008298:	5ca3      	ldrb	r3, [r4, r2]
 800829a:	438b      	bics	r3, r1
 800829c:	2104      	movs	r1, #4
 800829e:	430b      	orrs	r3, r1
 80082a0:	0020      	movs	r0, r4
 80082a2:	54a3      	strb	r3, [r4, r2]
 80082a4:	f7ff fc12 	bl	8007acc <fn_08007ACC>
 80082a8:	2800      	cmp	r0, #0
 80082aa:	d100      	bne.n	80082ae <fn_08007DAC+0x502>
 80082ac:	e655      	b.n	8007f5a <fn_08007DAC+0x1ae>
 80082ae:	e756      	b.n	800815e <fn_08007DAC+0x3b2>
 80082b0:	06fb      	lsls	r3, r7, #27
 80082b2:	d400      	bmi.n	80082b6 <fn_08007DAC+0x50a>
 80082b4:	e0ee      	b.n	8008494 <fn_08007DAC+0x6e8>
 80082b6:	073b      	lsls	r3, r7, #28
 80082b8:	d400      	bmi.n	80082bc <fn_08007DAC+0x510>
 80082ba:	e18c      	b.n	80085d6 <fn_08007DAC+0x82a>
 80082bc:	077b      	lsls	r3, r7, #29
 80082be:	d500      	bpl.n	80082c2 <fn_08007DAC+0x516>
 80082c0:	e693      	b.n	8007fea <fn_08007DAC+0x23e>
 80082c2:	225e      	movs	r2, #94	@ 0x5e
 80082c4:	210f      	movs	r1, #15
 80082c6:	5ca3      	ldrb	r3, [r4, r2]
 80082c8:	438b      	bics	r3, r1
 80082ca:	2102      	movs	r1, #2
 80082cc:	430b      	orrs	r3, r1
 80082ce:	0020      	movs	r0, r4
 80082d0:	54a3      	strb	r3, [r4, r2]
 80082d2:	f7ff fbfb 	bl	8007acc <fn_08007ACC>
 80082d6:	2800      	cmp	r0, #0
 80082d8:	d100      	bne.n	80082dc <fn_08007DAC+0x530>
 80082da:	e683      	b.n	8007fe4 <fn_08007DAC+0x238>
 80082dc:	e73f      	b.n	800815e <fn_08007DAC+0x3b2>
 80082de:	073b      	lsls	r3, r7, #28
 80082e0:	d400      	bmi.n	80082e4 <fn_08007DAC+0x538>
 80082e2:	e0e5      	b.n	80084b0 <fn_08007DAC+0x704>
 80082e4:	06fb      	lsls	r3, r7, #27
 80082e6:	d400      	bmi.n	80082ea <fn_08007DAC+0x53e>
 80082e8:	e183      	b.n	80085f2 <fn_08007DAC+0x846>
 80082ea:	06bb      	lsls	r3, r7, #26
 80082ec:	d500      	bpl.n	80082f0 <fn_08007DAC+0x544>
 80082ee:	e63d      	b.n	8007f6c <fn_08007DAC+0x1c0>
 80082f0:	225e      	movs	r2, #94	@ 0x5e
 80082f2:	210f      	movs	r1, #15
 80082f4:	5ca3      	ldrb	r3, [r4, r2]
 80082f6:	438b      	bics	r3, r1
 80082f8:	2105      	movs	r1, #5
 80082fa:	430b      	orrs	r3, r1
 80082fc:	0020      	movs	r0, r4
 80082fe:	54a3      	strb	r3, [r4, r2]
 8008300:	f7ff fbe4 	bl	8007acc <fn_08007ACC>
 8008304:	2800      	cmp	r0, #0
 8008306:	d100      	bne.n	800830a <fn_08007DAC+0x55e>
 8008308:	e62d      	b.n	8007f66 <fn_08007DAC+0x1ba>
 800830a:	e728      	b.n	800815e <fn_08007DAC+0x3b2>
 800830c:	225e      	movs	r2, #94	@ 0x5e
 800830e:	210f      	movs	r1, #15
 8008310:	5ca3      	ldrb	r3, [r4, r2]
 8008312:	438b      	bics	r3, r1
 8008314:	2102      	movs	r1, #2
 8008316:	430b      	orrs	r3, r1
 8008318:	0020      	movs	r0, r4
 800831a:	54a3      	strb	r3, [r4, r2]
 800831c:	2502      	movs	r5, #2
 800831e:	f7ff fbd5 	bl	8007acc <fn_08007ACC>
 8008322:	2800      	cmp	r0, #0
 8008324:	d000      	beq.n	8008328 <fn_08007DAC+0x57c>
 8008326:	e71a      	b.n	800815e <fn_08007DAC+0x3b2>
 8008328:	423d      	tst	r5, r7
 800832a:	d000      	beq.n	800832e <fn_08007DAC+0x582>
 800832c:	e6af      	b.n	800808e <fn_08007DAC+0x2e2>
 800832e:	225e      	movs	r2, #94	@ 0x5e
 8008330:	210f      	movs	r1, #15
 8008332:	5ca3      	ldrb	r3, [r4, r2]
 8008334:	438b      	bics	r3, r1
 8008336:	2101      	movs	r1, #1
 8008338:	430b      	orrs	r3, r1
 800833a:	0020      	movs	r0, r4
 800833c:	54a3      	strb	r3, [r4, r2]
 800833e:	f7ff fbc5 	bl	8007acc <fn_08007ACC>
 8008342:	2800      	cmp	r0, #0
 8008344:	d100      	bne.n	8008348 <fn_08007DAC+0x59c>
 8008346:	e653      	b.n	8007ff0 <fn_08007DAC+0x244>
 8008348:	e709      	b.n	800815e <fn_08007DAC+0x3b2>
 800834a:	06fb      	lsls	r3, r7, #27
 800834c:	d400      	bmi.n	8008350 <fn_08007DAC+0x5a4>
 800834e:	e0ce      	b.n	80084ee <fn_08007DAC+0x742>
 8008350:	06bb      	lsls	r3, r7, #26
 8008352:	d400      	bmi.n	8008356 <fn_08007DAC+0x5aa>
 8008354:	e169      	b.n	800862a <fn_08007DAC+0x87e>
 8008356:	067b      	lsls	r3, r7, #25
 8008358:	d500      	bpl.n	800835c <fn_08007DAC+0x5b0>
 800835a:	e60c      	b.n	8007f76 <fn_08007DAC+0x1ca>
 800835c:	225e      	movs	r2, #94	@ 0x5e
 800835e:	210f      	movs	r1, #15
 8008360:	5ca3      	ldrb	r3, [r4, r2]
 8008362:	438b      	bics	r3, r1
 8008364:	2106      	movs	r1, #6
 8008366:	430b      	orrs	r3, r1
 8008368:	0020      	movs	r0, r4
 800836a:	54a3      	strb	r3, [r4, r2]
 800836c:	f7ff fbae 	bl	8007acc <fn_08007ACC>
 8008370:	2800      	cmp	r0, #0
 8008372:	d100      	bne.n	8008376 <fn_08007DAC+0x5ca>
 8008374:	e5fd      	b.n	8007f72 <fn_08007DAC+0x1c6>
 8008376:	e6f2      	b.n	800815e <fn_08007DAC+0x3b2>
 8008378:	225e      	movs	r2, #94	@ 0x5e
 800837a:	210f      	movs	r1, #15
 800837c:	5ca3      	ldrb	r3, [r4, r2]
 800837e:	438b      	bics	r3, r1
 8008380:	2107      	movs	r1, #7
 8008382:	430b      	orrs	r3, r1
 8008384:	0020      	movs	r0, r4
 8008386:	54a3      	strb	r3, [r4, r2]
 8008388:	f7ff fba0 	bl	8007acc <fn_08007ACC>
 800838c:	2800      	cmp	r0, #0
 800838e:	d100      	bne.n	8008392 <fn_08007DAC+0x5e6>
 8008390:	e60b      	b.n	8007faa <fn_08007DAC+0x1fe>
 8008392:	e6e4      	b.n	800815e <fn_08007DAC+0x3b2>
 8008394:	225e      	movs	r2, #94	@ 0x5e
 8008396:	210f      	movs	r1, #15
 8008398:	5ca3      	ldrb	r3, [r4, r2]
 800839a:	438b      	bics	r3, r1
 800839c:	0020      	movs	r0, r4
 800839e:	54a3      	strb	r3, [r4, r2]
 80083a0:	f7ff fb94 	bl	8007acc <fn_08007ACC>
 80083a4:	2800      	cmp	r0, #0
 80083a6:	d100      	bne.n	80083aa <fn_08007DAC+0x5fe>
 80083a8:	e5bf      	b.n	8007f2a <fn_08007DAC+0x17e>
 80083aa:	e6d8      	b.n	800815e <fn_08007DAC+0x3b2>
 80083ac:	225e      	movs	r2, #94	@ 0x5e
 80083ae:	210f      	movs	r1, #15
 80083b0:	5ca3      	ldrb	r3, [r4, r2]
 80083b2:	438b      	bics	r3, r1
 80083b4:	2101      	movs	r1, #1
 80083b6:	430b      	orrs	r3, r1
 80083b8:	0020      	movs	r0, r4
 80083ba:	54a3      	strb	r3, [r4, r2]
 80083bc:	f7ff fb86 	bl	8007acc <fn_08007ACC>
 80083c0:	2800      	cmp	r0, #0
 80083c2:	d100      	bne.n	80083c6 <fn_08007DAC+0x61a>
 80083c4:	e5b7      	b.n	8007f36 <fn_08007DAC+0x18a>
 80083c6:	e6ca      	b.n	800815e <fn_08007DAC+0x3b2>
 80083c8:	225e      	movs	r2, #94	@ 0x5e
 80083ca:	210f      	movs	r1, #15
 80083cc:	5ca3      	ldrb	r3, [r4, r2]
 80083ce:	438b      	bics	r3, r1
 80083d0:	2106      	movs	r1, #6
 80083d2:	430b      	orrs	r3, r1
 80083d4:	0020      	movs	r0, r4
 80083d6:	54a3      	strb	r3, [r4, r2]
 80083d8:	f7ff fb78 	bl	8007acc <fn_08007ACC>
 80083dc:	2800      	cmp	r0, #0
 80083de:	d100      	bne.n	80083e2 <fn_08007DAC+0x636>
 80083e0:	e5e9      	b.n	8007fb6 <fn_08007DAC+0x20a>
 80083e2:	e6bc      	b.n	800815e <fn_08007DAC+0x3b2>
 80083e4:	225e      	movs	r2, #94	@ 0x5e
 80083e6:	210f      	movs	r1, #15
 80083e8:	5ca3      	ldrb	r3, [r4, r2]
 80083ea:	438b      	bics	r3, r1
 80083ec:	2106      	movs	r1, #6
 80083ee:	430b      	orrs	r3, r1
 80083f0:	0020      	movs	r0, r4
 80083f2:	54a3      	strb	r3, [r4, r2]
 80083f4:	f7ff fb6a 	bl	8007acc <fn_08007ACC>
 80083f8:	2800      	cmp	r0, #0
 80083fa:	d000      	beq.n	80083fe <fn_08007DAC+0x652>
 80083fc:	e6af      	b.n	800815e <fn_08007DAC+0x3b2>
 80083fe:	06bb      	lsls	r3, r7, #26
 8008400:	d500      	bpl.n	8008404 <fn_08007DAC+0x658>
 8008402:	e5e0      	b.n	8007fc6 <fn_08007DAC+0x21a>
 8008404:	225e      	movs	r2, #94	@ 0x5e
 8008406:	210f      	movs	r1, #15
 8008408:	5ca3      	ldrb	r3, [r4, r2]
 800840a:	438b      	bics	r3, r1
 800840c:	2105      	movs	r1, #5
 800840e:	430b      	orrs	r3, r1
 8008410:	0020      	movs	r0, r4
 8008412:	54a3      	strb	r3, [r4, r2]
 8008414:	f7ff fb5a 	bl	8007acc <fn_08007ACC>
 8008418:	2800      	cmp	r0, #0
 800841a:	d100      	bne.n	800841e <fn_08007DAC+0x672>
 800841c:	e5d1      	b.n	8007fc2 <fn_08007DAC+0x216>
 800841e:	e69e      	b.n	800815e <fn_08007DAC+0x3b2>
 8008420:	225e      	movs	r2, #94	@ 0x5e
 8008422:	210f      	movs	r1, #15
 8008424:	5ca3      	ldrb	r3, [r4, r2]
 8008426:	438b      	bics	r3, r1
 8008428:	2101      	movs	r1, #1
 800842a:	430b      	orrs	r3, r1
 800842c:	0020      	movs	r0, r4
 800842e:	54a3      	strb	r3, [r4, r2]
 8008430:	f7ff fb4c 	bl	8007acc <fn_08007ACC>
 8008434:	2800      	cmp	r0, #0
 8008436:	d000      	beq.n	800843a <fn_08007DAC+0x68e>
 8008438:	e691      	b.n	800815e <fn_08007DAC+0x3b2>
 800843a:	077b      	lsls	r3, r7, #29
 800843c:	d500      	bpl.n	8008440 <fn_08007DAC+0x694>
 800843e:	e583      	b.n	8007f48 <fn_08007DAC+0x19c>
 8008440:	225e      	movs	r2, #94	@ 0x5e
 8008442:	210f      	movs	r1, #15
 8008444:	5ca3      	ldrb	r3, [r4, r2]
 8008446:	438b      	bics	r3, r1
 8008448:	2102      	movs	r1, #2
 800844a:	430b      	orrs	r3, r1
 800844c:	0020      	movs	r0, r4
 800844e:	54a3      	strb	r3, [r4, r2]
 8008450:	f7ff fb3c 	bl	8007acc <fn_08007ACC>
 8008454:	2800      	cmp	r0, #0
 8008456:	d100      	bne.n	800845a <fn_08007DAC+0x6ae>
 8008458:	e573      	b.n	8007f42 <fn_08007DAC+0x196>
 800845a:	e680      	b.n	800815e <fn_08007DAC+0x3b2>
 800845c:	225e      	movs	r2, #94	@ 0x5e
 800845e:	210f      	movs	r1, #15
 8008460:	5ca3      	ldrb	r3, [r4, r2]
 8008462:	438b      	bics	r3, r1
 8008464:	2105      	movs	r1, #5
 8008466:	430b      	orrs	r3, r1
 8008468:	0020      	movs	r0, r4
 800846a:	54a3      	strb	r3, [r4, r2]
 800846c:	f7ff fb2e 	bl	8007acc <fn_08007ACC>
 8008470:	2800      	cmp	r0, #0
 8008472:	d100      	bne.n	8008476 <fn_08007DAC+0x6ca>
 8008474:	e6dd      	b.n	8008232 <fn_08007DAC+0x486>
 8008476:	e672      	b.n	800815e <fn_08007DAC+0x3b2>
 8008478:	225e      	movs	r2, #94	@ 0x5e
 800847a:	210f      	movs	r1, #15
 800847c:	5ca3      	ldrb	r3, [r4, r2]
 800847e:	438b      	bics	r3, r1
 8008480:	2102      	movs	r1, #2
 8008482:	430b      	orrs	r3, r1
 8008484:	0020      	movs	r0, r4
 8008486:	54a3      	strb	r3, [r4, r2]
 8008488:	f7ff fb20 	bl	8007acc <fn_08007ACC>
 800848c:	2800      	cmp	r0, #0
 800848e:	d100      	bne.n	8008492 <fn_08007DAC+0x6e6>
 8008490:	e6b8      	b.n	8008204 <fn_08007DAC+0x458>
 8008492:	e664      	b.n	800815e <fn_08007DAC+0x3b2>
 8008494:	225e      	movs	r2, #94	@ 0x5e
 8008496:	210f      	movs	r1, #15
 8008498:	5ca3      	ldrb	r3, [r4, r2]
 800849a:	438b      	bics	r3, r1
 800849c:	2104      	movs	r1, #4
 800849e:	430b      	orrs	r3, r1
 80084a0:	0020      	movs	r0, r4
 80084a2:	54a3      	strb	r3, [r4, r2]
 80084a4:	f7ff fb12 	bl	8007acc <fn_08007ACC>
 80084a8:	2800      	cmp	r0, #0
 80084aa:	d100      	bne.n	80084ae <fn_08007DAC+0x702>
 80084ac:	e6d8      	b.n	8008260 <fn_08007DAC+0x4b4>
 80084ae:	e656      	b.n	800815e <fn_08007DAC+0x3b2>
 80084b0:	225e      	movs	r2, #94	@ 0x5e
 80084b2:	210f      	movs	r1, #15
 80084b4:	5ca3      	ldrb	r3, [r4, r2]
 80084b6:	438b      	bics	r3, r1
 80084b8:	2103      	movs	r1, #3
 80084ba:	430b      	orrs	r3, r1
 80084bc:	0020      	movs	r0, r4
 80084be:	54a3      	strb	r3, [r4, r2]
 80084c0:	f7ff fb04 	bl	8007acc <fn_08007ACC>
 80084c4:	2800      	cmp	r0, #0
 80084c6:	d100      	bne.n	80084ca <fn_08007DAC+0x71e>
 80084c8:	e6e1      	b.n	800828e <fn_08007DAC+0x4e2>
 80084ca:	e648      	b.n	800815e <fn_08007DAC+0x3b2>
 80084cc:	225e      	movs	r2, #94	@ 0x5e
 80084ce:	210f      	movs	r1, #15
 80084d0:	5ca3      	ldrb	r3, [r4, r2]
 80084d2:	438b      	bics	r3, r1
 80084d4:	2103      	movs	r1, #3
 80084d6:	430b      	orrs	r3, r1
 80084d8:	0020      	movs	r0, r4
 80084da:	54a3      	strb	r3, [r4, r2]
 80084dc:	f7ff faf6 	bl	8007acc <fn_08007ACC>
 80084e0:	2800      	cmp	r0, #0
 80084e2:	d000      	beq.n	80084e6 <fn_08007DAC+0x73a>
 80084e4:	e63b      	b.n	800815e <fn_08007DAC+0x3b2>
 80084e6:	423e      	tst	r6, r7
 80084e8:	d000      	beq.n	80084ec <fn_08007DAC+0x740>
 80084ea:	e57e      	b.n	8007fea <fn_08007DAC+0x23e>
 80084ec:	e6e9      	b.n	80082c2 <fn_08007DAC+0x516>
 80084ee:	225e      	movs	r2, #94	@ 0x5e
 80084f0:	210f      	movs	r1, #15
 80084f2:	5ca3      	ldrb	r3, [r4, r2]
 80084f4:	438b      	bics	r3, r1
 80084f6:	2104      	movs	r1, #4
 80084f8:	430b      	orrs	r3, r1
 80084fa:	0020      	movs	r0, r4
 80084fc:	54a3      	strb	r3, [r4, r2]
 80084fe:	f7ff fae5 	bl	8007acc <fn_08007ACC>
 8008502:	2800      	cmp	r0, #0
 8008504:	d100      	bne.n	8008508 <fn_08007DAC+0x75c>
 8008506:	e6f0      	b.n	80082ea <fn_08007DAC+0x53e>
 8008508:	e629      	b.n	800815e <fn_08007DAC+0x3b2>
 800850a:	225e      	movs	r2, #94	@ 0x5e
 800850c:	210f      	movs	r1, #15
 800850e:	5ca3      	ldrb	r3, [r4, r2]
 8008510:	438b      	bics	r3, r1
 8008512:	2105      	movs	r1, #5
 8008514:	430b      	orrs	r3, r1
 8008516:	0020      	movs	r0, r4
 8008518:	54a3      	strb	r3, [r4, r2]
 800851a:	f7ff fad7 	bl	8007acc <fn_08007ACC>
 800851e:	2800      	cmp	r0, #0
 8008520:	d100      	bne.n	8008524 <fn_08007DAC+0x778>
 8008522:	e718      	b.n	8008356 <fn_08007DAC+0x5aa>
 8008524:	e61b      	b.n	800815e <fn_08007DAC+0x3b2>
 8008526:	225e      	movs	r2, #94	@ 0x5e
 8008528:	210f      	movs	r1, #15
 800852a:	5ca3      	ldrb	r3, [r4, r2]
 800852c:	438b      	bics	r3, r1
 800852e:	2106      	movs	r1, #6
 8008530:	430b      	orrs	r3, r1
 8008532:	0020      	movs	r0, r4
 8008534:	54a3      	strb	r3, [r4, r2]
 8008536:	f7ff fac9 	bl	8007acc <fn_08007ACC>
 800853a:	2800      	cmp	r0, #0
 800853c:	d100      	bne.n	8008540 <fn_08007DAC+0x794>
 800853e:	e5fe      	b.n	800813e <fn_08007DAC+0x392>
 8008540:	e60d      	b.n	800815e <fn_08007DAC+0x3b2>
 8008542:	225e      	movs	r2, #94	@ 0x5e
 8008544:	210f      	movs	r1, #15
 8008546:	5ca3      	ldrb	r3, [r4, r2]
 8008548:	438b      	bics	r3, r1
 800854a:	2101      	movs	r1, #1
 800854c:	430b      	orrs	r3, r1
 800854e:	0020      	movs	r0, r4
 8008550:	54a3      	strb	r3, [r4, r2]
 8008552:	2501      	movs	r5, #1
 8008554:	f7ff faba 	bl	8007acc <fn_08007ACC>
 8008558:	2800      	cmp	r0, #0
 800855a:	d000      	beq.n	800855e <fn_08007DAC+0x7b2>
 800855c:	e5ff      	b.n	800815e <fn_08007DAC+0x3b2>
 800855e:	423d      	tst	r5, r7
 8008560:	d000      	beq.n	8008564 <fn_08007DAC+0x7b8>
 8008562:	e547      	b.n	8007ff4 <fn_08007DAC+0x248>
 8008564:	e60b      	b.n	800817e <fn_08007DAC+0x3d2>
 8008566:	225e      	movs	r2, #94	@ 0x5e
 8008568:	210f      	movs	r1, #15
 800856a:	5ca3      	ldrb	r3, [r4, r2]
 800856c:	438b      	bics	r3, r1
 800856e:	2105      	movs	r1, #5
 8008570:	430b      	orrs	r3, r1
 8008572:	0020      	movs	r0, r4
 8008574:	54a3      	strb	r3, [r4, r2]
 8008576:	f7ff faa9 	bl	8007acc <fn_08007ACC>
 800857a:	2800      	cmp	r0, #0
 800857c:	d100      	bne.n	8008580 <fn_08007DAC+0x7d4>
 800857e:	e522      	b.n	8007fc6 <fn_08007DAC+0x21a>
 8008580:	e5ed      	b.n	800815e <fn_08007DAC+0x3b2>
 8008582:	225e      	movs	r2, #94	@ 0x5e
 8008584:	210f      	movs	r1, #15
 8008586:	5ca3      	ldrb	r3, [r4, r2]
 8008588:	438b      	bics	r3, r1
 800858a:	2102      	movs	r1, #2
 800858c:	430b      	orrs	r3, r1
 800858e:	0020      	movs	r0, r4
 8008590:	54a3      	strb	r3, [r4, r2]
 8008592:	f7ff fa9b 	bl	8007acc <fn_08007ACC>
 8008596:	2800      	cmp	r0, #0
 8008598:	d100      	bne.n	800859c <fn_08007DAC+0x7f0>
 800859a:	e4d5      	b.n	8007f48 <fn_08007DAC+0x19c>
 800859c:	e5df      	b.n	800815e <fn_08007DAC+0x3b2>
 800859e:	225e      	movs	r2, #94	@ 0x5e
 80085a0:	210f      	movs	r1, #15
 80085a2:	5ca3      	ldrb	r3, [r4, r2]
 80085a4:	438b      	bics	r3, r1
 80085a6:	2104      	movs	r1, #4
 80085a8:	430b      	orrs	r3, r1
 80085aa:	0020      	movs	r0, r4
 80085ac:	54a3      	strb	r3, [r4, r2]
 80085ae:	f7ff fa8d 	bl	8007acc <fn_08007ACC>
 80085b2:	2800      	cmp	r0, #0
 80085b4:	d100      	bne.n	80085b8 <fn_08007DAC+0x80c>
 80085b6:	e50c      	b.n	8007fd2 <fn_08007DAC+0x226>
 80085b8:	e5d1      	b.n	800815e <fn_08007DAC+0x3b2>
 80085ba:	225e      	movs	r2, #94	@ 0x5e
 80085bc:	210f      	movs	r1, #15
 80085be:	5ca3      	ldrb	r3, [r4, r2]
 80085c0:	438b      	bics	r3, r1
 80085c2:	2103      	movs	r1, #3
 80085c4:	430b      	orrs	r3, r1
 80085c6:	0020      	movs	r0, r4
 80085c8:	54a3      	strb	r3, [r4, r2]
 80085ca:	f7ff fa7f 	bl	8007acc <fn_08007ACC>
 80085ce:	2800      	cmp	r0, #0
 80085d0:	d100      	bne.n	80085d4 <fn_08007DAC+0x828>
 80085d2:	e4bf      	b.n	8007f54 <fn_08007DAC+0x1a8>
 80085d4:	e5c3      	b.n	800815e <fn_08007DAC+0x3b2>
 80085d6:	225e      	movs	r2, #94	@ 0x5e
 80085d8:	210f      	movs	r1, #15
 80085da:	5ca3      	ldrb	r3, [r4, r2]
 80085dc:	438b      	bics	r3, r1
 80085de:	2103      	movs	r1, #3
 80085e0:	430b      	orrs	r3, r1
 80085e2:	0020      	movs	r0, r4
 80085e4:	54a3      	strb	r3, [r4, r2]
 80085e6:	f7ff fa71 	bl	8007acc <fn_08007ACC>
 80085ea:	2800      	cmp	r0, #0
 80085ec:	d100      	bne.n	80085f0 <fn_08007DAC+0x844>
 80085ee:	e4f6      	b.n	8007fde <fn_08007DAC+0x232>
 80085f0:	e5b5      	b.n	800815e <fn_08007DAC+0x3b2>
 80085f2:	225e      	movs	r2, #94	@ 0x5e
 80085f4:	210f      	movs	r1, #15
 80085f6:	5ca3      	ldrb	r3, [r4, r2]
 80085f8:	438b      	bics	r3, r1
 80085fa:	2104      	movs	r1, #4
 80085fc:	430b      	orrs	r3, r1
 80085fe:	0020      	movs	r0, r4
 8008600:	54a3      	strb	r3, [r4, r2]
 8008602:	f7ff fa63 	bl	8007acc <fn_08007ACC>
 8008606:	2800      	cmp	r0, #0
 8008608:	d100      	bne.n	800860c <fn_08007DAC+0x860>
 800860a:	e4a9      	b.n	8007f60 <fn_08007DAC+0x1b4>
 800860c:	e5a7      	b.n	800815e <fn_08007DAC+0x3b2>
 800860e:	225e      	movs	r2, #94	@ 0x5e
 8008610:	210f      	movs	r1, #15
 8008612:	5ca3      	ldrb	r3, [r4, r2]
 8008614:	438b      	bics	r3, r1
 8008616:	2102      	movs	r1, #2
 8008618:	430b      	orrs	r3, r1
 800861a:	0020      	movs	r0, r4
 800861c:	54a3      	strb	r3, [r4, r2]
 800861e:	f7ff fa55 	bl	8007acc <fn_08007ACC>
 8008622:	2800      	cmp	r0, #0
 8008624:	d100      	bne.n	8008628 <fn_08007DAC+0x87c>
 8008626:	e4e0      	b.n	8007fea <fn_08007DAC+0x23e>
 8008628:	e599      	b.n	800815e <fn_08007DAC+0x3b2>
 800862a:	225e      	movs	r2, #94	@ 0x5e
 800862c:	210f      	movs	r1, #15
 800862e:	5ca3      	ldrb	r3, [r4, r2]
 8008630:	438b      	bics	r3, r1
 8008632:	2105      	movs	r1, #5
 8008634:	430b      	orrs	r3, r1
 8008636:	0020      	movs	r0, r4
 8008638:	54a3      	strb	r3, [r4, r2]
 800863a:	f7ff fa47 	bl	8007acc <fn_08007ACC>
 800863e:	2800      	cmp	r0, #0
 8008640:	d100      	bne.n	8008644 <fn_08007DAC+0x898>
 8008642:	e493      	b.n	8007f6c <fn_08007DAC+0x1c0>
 8008644:	e58b      	b.n	800815e <fn_08007DAC+0x3b2>
 8008646:	225e      	movs	r2, #94	@ 0x5e
 8008648:	210f      	movs	r1, #15
 800864a:	5ca3      	ldrb	r3, [r4, r2]
 800864c:	438b      	bics	r3, r1
 800864e:	2106      	movs	r1, #6
 8008650:	430b      	orrs	r3, r1
 8008652:	0020      	movs	r0, r4
 8008654:	54a3      	strb	r3, [r4, r2]
 8008656:	f7ff fa39 	bl	8007acc <fn_08007ACC>
 800865a:	2800      	cmp	r0, #0
 800865c:	d100      	bne.n	8008660 <fn_08007DAC+0x8b4>
 800865e:	e48a      	b.n	8007f76 <fn_08007DAC+0x1ca>
 8008660:	e57d      	b.n	800815e <fn_08007DAC+0x3b2>
 8008662:	225e      	movs	r2, #94	@ 0x5e
 8008664:	210f      	movs	r1, #15
 8008666:	5ca3      	ldrb	r3, [r4, r2]
 8008668:	438b      	bics	r3, r1
 800866a:	2101      	movs	r1, #1
 800866c:	430b      	orrs	r3, r1
 800866e:	0020      	movs	r0, r4
 8008670:	54a3      	strb	r3, [r4, r2]
 8008672:	f7ff fa2b 	bl	8007acc <fn_08007ACC>
 8008676:	2800      	cmp	r0, #0
 8008678:	d100      	bne.n	800867c <fn_08007DAC+0x8d0>
 800867a:	e508      	b.n	800808e <fn_08007DAC+0x2e2>
 800867c:	e56f      	b.n	800815e <fn_08007DAC+0x3b2>
 800867e:	46c0      	nop			@ (mov r8, r8)
