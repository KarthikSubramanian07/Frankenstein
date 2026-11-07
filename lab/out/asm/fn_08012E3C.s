fn_08012E3C:
 8012e3c:	2353      	movs	r3, #83	@ 0x53
 8012e3e:	b570      	push	{r4, r5, r6, lr}
 8012e40:	5cc4      	ldrb	r4, [r0, r3]
 8012e42:	0001      	movs	r1, r0
 8012e44:	2209      	movs	r2, #9
 8012e46:	1e63      	subs	r3, r4, #1
 8012e48:	d23f      	bcs.n	8012eca <fn_08012E3C+0x8e>
 8012e4a:	6f0b      	ldr	r3, [r1, #112]	@ 0x70
 8012e4c:	2b00      	cmp	r3, #0
 8012e4e:	d016      	beq.n	8012e7e <fn_08012E3C+0x42>
 8012e50:	2384      	movs	r3, #132	@ 0x84
 8012e52:	58cb      	ldr	r3, [r1, r3]
 8012e54:	2b27      	cmp	r3, #39	@ 0x27
 8012e56:	dd12      	ble.n	8012e7e <fn_08012E3C+0x42>
 8012e58:	4b83      	ldr	r3, [pc, #524]	@ (8013068 <fn_08012E3C+0x22c>)
 8012e5a:	6818      	ldr	r0, [r3, #0]
 8012e5c:	2394      	movs	r3, #148	@ 0x94
 8012e5e:	5cc3      	ldrb	r3, [r0, r3]
 8012e60:	2b00      	cmp	r3, #0
 8012e62:	d000      	beq.n	8012e66 <fn_08012E3C+0x2a>
 8012e64:	e0a4      	b.n	8012fb0 <fn_08012E3C+0x174>
 8012e66:	1e50      	subs	r0, r2, #1
 8012e68:	2a01      	cmp	r2, #1
 8012e6a:	d004      	beq.n	8012e76 <fn_08012E3C+0x3a>
 8012e6c:	6ecb      	ldr	r3, [r1, #108]	@ 0x6c
 8012e6e:	2b00      	cmp	r3, #0
 8012e70:	d100      	bne.n	8012e74 <fn_08012E3C+0x38>
 8012e72:	e09f      	b.n	8012fb4 <fn_08012E3C+0x178>
 8012e74:	2405      	movs	r4, #5
 8012e76:	0020      	movs	r0, r4
 8012e78:	bc70      	pop	{r4, r5, r6}
 8012e7a:	bc02      	pop	{r1}
 8012e7c:	4708      	bx	r1
 8012e7e:	1e50      	subs	r0, r2, #1
 8012e80:	2a01      	cmp	r2, #1
 8012e82:	d0f8      	beq.n	8012e76 <fn_08012E3C+0x3a>
 8012e84:	6ecb      	ldr	r3, [r1, #108]	@ 0x6c
 8012e86:	2b00      	cmp	r3, #0
 8012e88:	d100      	bne.n	8012e8c <fn_08012E3C+0x50>
 8012e8a:	e093      	b.n	8012fb4 <fn_08012E3C+0x178>
 8012e8c:	2384      	movs	r3, #132	@ 0x84
 8012e8e:	58cb      	ldr	r3, [r1, r3]
 8012e90:	2b00      	cmp	r3, #0
 8012e92:	d1ef      	bne.n	8012e74 <fn_08012E3C+0x38>
 8012e94:	3801      	subs	r0, #1
 8012e96:	2304      	movs	r3, #4
 8012e98:	2800      	cmp	r0, #0
 8012e9a:	d108      	bne.n	8012eae <fn_08012E3C+0x72>
 8012e9c:	e7eb      	b.n	8012e76 <fn_08012E3C+0x3a>
 8012e9e:	2084      	movs	r0, #132	@ 0x84
 8012ea0:	5808      	ldr	r0, [r1, r0]
 8012ea2:	2800      	cmp	r0, #0
 8012ea4:	d179      	bne.n	8012f9a <fn_08012E3C+0x15e>
 8012ea6:	1e50      	subs	r0, r2, #1
 8012ea8:	2a01      	cmp	r2, #1
 8012eaa:	d0e4      	beq.n	8012e76 <fn_08012E3C+0x3a>
 8012eac:	3b01      	subs	r3, #1
 8012eae:	001a      	movs	r2, r3
 8012eb0:	3216      	adds	r2, #22
 8012eb2:	0092      	lsls	r2, r2, #2
 8012eb4:	588a      	ldr	r2, [r1, r2]
 8012eb6:	2a00      	cmp	r2, #0
 8012eb8:	d003      	beq.n	8012ec2 <fn_08012E3C+0x86>
 8012eba:	2288      	movs	r2, #136	@ 0x88
 8012ebc:	588a      	ldr	r2, [r1, r2]
 8012ebe:	2a00      	cmp	r2, #0
 8012ec0:	d16b      	bne.n	8012f9a <fn_08012E3C+0x15e>
 8012ec2:	1e42      	subs	r2, r0, #1
 8012ec4:	2801      	cmp	r0, #1
 8012ec6:	d0d6      	beq.n	8012e76 <fn_08012E3C+0x3a>
 8012ec8:	3b01      	subs	r3, #1
 8012eca:	2b08      	cmp	r3, #8
 8012ecc:	d810      	bhi.n	8012ef0 <fn_08012E3C+0xb4>
 8012ece:	4d67      	ldr	r5, [pc, #412]	@ (801306c <fn_08012E3C+0x230>)
 8012ed0:	0098      	lsls	r0, r3, #2
 8012ed2:	5828      	ldr	r0, [r5, r0]
 8012ed4:	4687      	mov	pc, r0
 8012ed6:	6f8b      	ldr	r3, [r1, #120]	@ 0x78
 8012ed8:	2b00      	cmp	r3, #0
 8012eda:	d137      	bne.n	8012f4c <fn_08012E3C+0x110>
 8012edc:	3a01      	subs	r2, #1
 8012ede:	2a00      	cmp	r2, #0
 8012ee0:	d0c9      	beq.n	8012e76 <fn_08012E3C+0x3a>
 8012ee2:	6e0b      	ldr	r3, [r1, #96]	@ 0x60
 8012ee4:	2b00      	cmp	r3, #0
 8012ee6:	d111      	bne.n	8012f0c <fn_08012E3C+0xd0>
 8012ee8:	3a01      	subs	r2, #1
 8012eea:	3301      	adds	r3, #1
 8012eec:	2a00      	cmp	r2, #0
 8012eee:	d0c2      	beq.n	8012e76 <fn_08012E3C+0x3a>
 8012ef0:	0018      	movs	r0, r3
 8012ef2:	3016      	adds	r0, #22
 8012ef4:	0080      	lsls	r0, r0, #2
 8012ef6:	5808      	ldr	r0, [r1, r0]
 8012ef8:	2800      	cmp	r0, #0
 8012efa:	d053      	beq.n	8012fa4 <fn_08012E3C+0x168>
 8012efc:	0618      	lsls	r0, r3, #24
 8012efe:	0e00      	lsrs	r0, r0, #24
 8012f00:	2808      	cmp	r0, #8
 8012f02:	d84f      	bhi.n	8012fa4 <fn_08012E3C+0x168>
 8012f04:	4d5a      	ldr	r5, [pc, #360]	@ (8013070 <fn_08012E3C+0x234>)
 8012f06:	0080      	lsls	r0, r0, #2
 8012f08:	5828      	ldr	r0, [r5, r0]
 8012f0a:	4687      	mov	pc, r0
 8012f0c:	2380      	movs	r3, #128	@ 0x80
 8012f0e:	58cb      	ldr	r3, [r1, r3]
 8012f10:	2b00      	cmp	r3, #0
 8012f12:	d000      	beq.n	8012f16 <fn_08012E3C+0xda>
 8012f14:	e082      	b.n	801301c <fn_08012E3C+0x1e0>
 8012f16:	1e50      	subs	r0, r2, #1
 8012f18:	2a01      	cmp	r2, #1
 8012f1a:	d0ac      	beq.n	8012e76 <fn_08012E3C+0x3a>
 8012f1c:	6dcd      	ldr	r5, [r1, #92]	@ 0x5c
 8012f1e:	3301      	adds	r3, #1
 8012f20:	2d00      	cmp	r5, #0
 8012f22:	d0ce      	beq.n	8012ec2 <fn_08012E3C+0x86>
 8012f24:	6fcb      	ldr	r3, [r1, #124]	@ 0x7c
 8012f26:	2b00      	cmp	r3, #0
 8012f28:	d000      	beq.n	8012f2c <fn_08012E3C+0xf0>
 8012f2a:	e083      	b.n	8013034 <fn_08012E3C+0x1f8>
 8012f2c:	3a02      	subs	r2, #2
 8012f2e:	2a00      	cmp	r2, #0
 8012f30:	d0a1      	beq.n	8012e76 <fn_08012E3C+0x3a>
 8012f32:	6f4b      	ldr	r3, [r1, #116]	@ 0x74
 8012f34:	2b00      	cmp	r3, #0
 8012f36:	d001      	beq.n	8012f3c <fn_08012E3C+0x100>
 8012f38:	2407      	movs	r4, #7
 8012f3a:	e79c      	b.n	8012e76 <fn_08012E3C+0x3a>
 8012f3c:	3a01      	subs	r2, #1
 8012f3e:	2a00      	cmp	r2, #0
 8012f40:	d099      	beq.n	8012e76 <fn_08012E3C+0x3a>
 8012f42:	6d8b      	ldr	r3, [r1, #88]	@ 0x58
 8012f44:	2b00      	cmp	r3, #0
 8012f46:	d00d      	beq.n	8012f64 <fn_08012E3C+0x128>
 8012f48:	2400      	movs	r4, #0
 8012f4a:	e794      	b.n	8012e76 <fn_08012E3C+0x3a>
 8012f4c:	2380      	movs	r3, #128	@ 0x80
 8012f4e:	58cb      	ldr	r3, [r1, r3]
 8012f50:	2b01      	cmp	r3, #1
 8012f52:	ddc3      	ble.n	8012edc <fn_08012E3C+0xa0>
 8012f54:	4b44      	ldr	r3, [pc, #272]	@ (8013068 <fn_08012E3C+0x22c>)
 8012f56:	6818      	ldr	r0, [r3, #0]
 8012f58:	2394      	movs	r3, #148	@ 0x94
 8012f5a:	5cc3      	ldrb	r3, [r0, r3]
 8012f5c:	2b02      	cmp	r3, #2
 8012f5e:	d1bd      	bne.n	8012edc <fn_08012E3C+0xa0>
 8012f60:	2408      	movs	r4, #8
 8012f62:	e788      	b.n	8012e76 <fn_08012E3C+0x3a>
 8012f64:	3a01      	subs	r2, #1
 8012f66:	2a00      	cmp	r2, #0
 8012f68:	d000      	beq.n	8012f6c <fn_08012E3C+0x130>
 8012f6a:	e76e      	b.n	8012e4a <fn_08012E3C+0xe>
 8012f6c:	e783      	b.n	8012e76 <fn_08012E3C+0x3a>
 8012f6e:	2084      	movs	r0, #132	@ 0x84
 8012f70:	5808      	ldr	r0, [r1, r0]
 8012f72:	0006      	movs	r6, r0
 8012f74:	2827      	cmp	r0, #39	@ 0x27
 8012f76:	dd5f      	ble.n	8013038 <fn_08012E3C+0x1fc>
 8012f78:	483b      	ldr	r0, [pc, #236]	@ (8013068 <fn_08012E3C+0x22c>)
 8012f7a:	6805      	ldr	r5, [r0, #0]
 8012f7c:	2094      	movs	r0, #148	@ 0x94
 8012f7e:	5c28      	ldrb	r0, [r5, r0]
 8012f80:	2800      	cmp	r0, #0
 8012f82:	d10a      	bne.n	8012f9a <fn_08012E3C+0x15e>
 8012f84:	1e50      	subs	r0, r2, #1
 8012f86:	2a01      	cmp	r2, #1
 8012f88:	d100      	bne.n	8012f8c <fn_08012E3C+0x150>
 8012f8a:	e774      	b.n	8012e76 <fn_08012E3C+0x3a>
 8012f8c:	3b01      	subs	r3, #1
 8012f8e:	001a      	movs	r2, r3
 8012f90:	3216      	adds	r2, #22
 8012f92:	0092      	lsls	r2, r2, #2
 8012f94:	588a      	ldr	r2, [r1, r2]
 8012f96:	2a00      	cmp	r2, #0
 8012f98:	d093      	beq.n	8012ec2 <fn_08012E3C+0x86>
 8012f9a:	001c      	movs	r4, r3
 8012f9c:	e76b      	b.n	8012e76 <fn_08012E3C+0x3a>
 8012f9e:	6fc8      	ldr	r0, [r1, #124]	@ 0x7c
 8012fa0:	2800      	cmp	r0, #0
 8012fa2:	d1fa      	bne.n	8012f9a <fn_08012E3C+0x15e>
 8012fa4:	3a01      	subs	r2, #1
 8012fa6:	2a00      	cmp	r2, #0
 8012fa8:	d100      	bne.n	8012fac <fn_08012E3C+0x170>
 8012faa:	e764      	b.n	8012e76 <fn_08012E3C+0x3a>
 8012fac:	3b01      	subs	r3, #1
 8012fae:	e78c      	b.n	8012eca <fn_08012E3C+0x8e>
 8012fb0:	2406      	movs	r4, #6
 8012fb2:	e760      	b.n	8012e76 <fn_08012E3C+0x3a>
 8012fb4:	2305      	movs	r3, #5
 8012fb6:	e784      	b.n	8012ec2 <fn_08012E3C+0x86>
 8012fb8:	2080      	movs	r0, #128	@ 0x80
 8012fba:	5808      	ldr	r0, [r1, r0]
 8012fbc:	2801      	cmp	r0, #1
 8012fbe:	dde1      	ble.n	8012f84 <fn_08012E3C+0x148>
 8012fc0:	4829      	ldr	r0, [pc, #164]	@ (8013068 <fn_08012E3C+0x22c>)
 8012fc2:	6805      	ldr	r5, [r0, #0]
 8012fc4:	2094      	movs	r0, #148	@ 0x94
 8012fc6:	5c28      	ldrb	r0, [r5, r0]
 8012fc8:	2802      	cmp	r0, #2
 8012fca:	d1db      	bne.n	8012f84 <fn_08012E3C+0x148>
 8012fcc:	001c      	movs	r4, r3
 8012fce:	e752      	b.n	8012e76 <fn_08012E3C+0x3a>
 8012fd0:	2088      	movs	r0, #136	@ 0x88
 8012fd2:	5808      	ldr	r0, [r1, r0]
 8012fd4:	2800      	cmp	r0, #0
 8012fd6:	d1e0      	bne.n	8012f9a <fn_08012E3C+0x15e>
 8012fd8:	3a01      	subs	r2, #1
 8012fda:	2a00      	cmp	r2, #0
 8012fdc:	d100      	bne.n	8012fe0 <fn_08012E3C+0x1a4>
 8012fde:	e74a      	b.n	8012e76 <fn_08012E3C+0x3a>
 8012fe0:	3b01      	subs	r3, #1
 8012fe2:	0018      	movs	r0, r3
 8012fe4:	3016      	adds	r0, #22
 8012fe6:	0080      	lsls	r0, r0, #2
 8012fe8:	5808      	ldr	r0, [r1, r0]
 8012fea:	2800      	cmp	r0, #0
 8012fec:	d014      	beq.n	8013018 <fn_08012E3C+0x1dc>
 8012fee:	6fc8      	ldr	r0, [r1, #124]	@ 0x7c
 8012ff0:	2800      	cmp	r0, #0
 8012ff2:	d1d2      	bne.n	8012f9a <fn_08012E3C+0x15e>
 8012ff4:	3a01      	subs	r2, #1
 8012ff6:	2a00      	cmp	r2, #0
 8012ff8:	d100      	bne.n	8012ffc <fn_08012E3C+0x1c0>
 8012ffa:	e73c      	b.n	8012e76 <fn_08012E3C+0x3a>
 8012ffc:	3b01      	subs	r3, #1
 8012ffe:	2b02      	cmp	r3, #2
 8013000:	d100      	bne.n	8013004 <fn_08012E3C+0x1c8>
 8013002:	e768      	b.n	8012ed6 <fn_08012E3C+0x9a>
 8013004:	0018      	movs	r0, r3
 8013006:	3016      	adds	r0, #22
 8013008:	0080      	lsls	r0, r0, #2
 801300a:	5808      	ldr	r0, [r1, r0]
 801300c:	2800      	cmp	r0, #0
 801300e:	d003      	beq.n	8013018 <fn_08012E3C+0x1dc>
 8013010:	2080      	movs	r0, #128	@ 0x80
 8013012:	5808      	ldr	r0, [r1, r0]
 8013014:	2800      	cmp	r0, #0
 8013016:	d1c0      	bne.n	8012f9a <fn_08012E3C+0x15e>
 8013018:	0010      	movs	r0, r2
 801301a:	e752      	b.n	8012ec2 <fn_08012E3C+0x86>
 801301c:	2402      	movs	r4, #2
 801301e:	e72a      	b.n	8012e76 <fn_08012E3C+0x3a>
 8013020:	2080      	movs	r0, #128	@ 0x80
 8013022:	5808      	ldr	r0, [r1, r0]
 8013024:	2800      	cmp	r0, #0
 8013026:	d1b8      	bne.n	8012f9a <fn_08012E3C+0x15e>
 8013028:	3a01      	subs	r2, #1
 801302a:	4282      	cmp	r2, r0
 801302c:	d100      	bne.n	8013030 <fn_08012E3C+0x1f4>
 801302e:	e722      	b.n	8012e76 <fn_08012E3C+0x3a>
 8013030:	3b01      	subs	r3, #1
 8013032:	e75d      	b.n	8012ef0 <fn_08012E3C+0xb4>
 8013034:	2401      	movs	r4, #1
 8013036:	e71e      	b.n	8012e76 <fn_08012E3C+0x3a>
 8013038:	1e50      	subs	r0, r2, #1
 801303a:	2a01      	cmp	r2, #1
 801303c:	d100      	bne.n	8013040 <fn_08012E3C+0x204>
 801303e:	e71a      	b.n	8012e76 <fn_08012E3C+0x3a>
 8013040:	1e5d      	subs	r5, r3, #1
 8013042:	46ac      	mov	ip, r5
 8013044:	3516      	adds	r5, #22
 8013046:	00ad      	lsls	r5, r5, #2
 8013048:	594d      	ldr	r5, [r1, r5]
 801304a:	2d00      	cmp	r5, #0
 801304c:	d009      	beq.n	8013062 <fn_08012E3C+0x226>
 801304e:	2e00      	cmp	r6, #0
 8013050:	d105      	bne.n	801305e <fn_08012E3C+0x222>
 8013052:	1e90      	subs	r0, r2, #2
 8013054:	2a02      	cmp	r2, #2
 8013056:	d100      	bne.n	801305a <fn_08012E3C+0x21e>
 8013058:	e70d      	b.n	8012e76 <fn_08012E3C+0x3a>
 801305a:	3b02      	subs	r3, #2
 801305c:	e727      	b.n	8012eae <fn_08012E3C+0x72>
 801305e:	4664      	mov	r4, ip
 8013060:	e709      	b.n	8012e76 <fn_08012E3C+0x3a>
 8013062:	4663      	mov	r3, ip
 8013064:	e72d      	b.n	8012ec2 <fn_08012E3C+0x86>
 8013066:	46c0      	nop			@ (mov r8, r8)
 8013068:	030064c4 	.word	0x030064c4
 801306c:	0812e81c 	.word	0x0812e81c
 8013070:	0812e840 	.word	0x0812e840
