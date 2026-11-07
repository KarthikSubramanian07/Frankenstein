fn_08012DA0:
 8012da0:	2353      	movs	r3, #83	@ 0x53
 8012da2:	b570      	push	{r4, r5, r6, lr}
 8012da4:	5cc4      	ldrb	r4, [r0, r3]
 8012da6:	0001      	movs	r1, r0
 8012da8:	2209      	movs	r2, #9
 8012daa:	1e63      	subs	r3, r4, #1
 8012dac:	d228      	bcs.n	8012e00 <fn_08012DA0+0x60>
 8012dae:	6f0b      	ldr	r3, [r1, #112]	@ 0x70
 8012db0:	2b00      	cmp	r3, #0
 8012db2:	d02b      	beq.n	8012e0c <fn_08012DA0+0x6c>
 8012db4:	4b7e      	ldr	r3, [pc, #504]	@ (8012fb0 <fn_08012DA0+0x210>)
 8012db6:	6818      	ldr	r0, [r3, #0]
 8012db8:	2394      	movs	r3, #148	@ 0x94
 8012dba:	5cc3      	ldrb	r3, [r0, r3]
 8012dbc:	2b00      	cmp	r3, #0
 8012dbe:	d025      	beq.n	8012e0c <fn_08012DA0+0x6c>
 8012dc0:	2384      	movs	r3, #132	@ 0x84
 8012dc2:	58cb      	ldr	r3, [r1, r3]
 8012dc4:	2b27      	cmp	r3, #39	@ 0x27
 8012dc6:	dd00      	ble.n	8012dca <fn_08012DA0+0x2a>
 8012dc8:	e07a      	b.n	8012ec0 <fn_08012DA0+0x120>
 8012dca:	1e50      	subs	r0, r2, #1
 8012dcc:	2a01      	cmp	r2, #1
 8012dce:	d046      	beq.n	8012e5e <fn_08012DA0+0xbe>
 8012dd0:	6ecd      	ldr	r5, [r1, #108]	@ 0x6c
 8012dd2:	2d00      	cmp	r5, #0
 8012dd4:	d067      	beq.n	8012ea6 <fn_08012DA0+0x106>
 8012dd6:	2b00      	cmp	r3, #0
 8012dd8:	d000      	beq.n	8012ddc <fn_08012DA0+0x3c>
 8012dda:	e073      	b.n	8012ec4 <fn_08012DA0+0x124>
 8012ddc:	2304      	movs	r3, #4
 8012dde:	1e90      	subs	r0, r2, #2
 8012de0:	2a02      	cmp	r2, #2
 8012de2:	d03c      	beq.n	8012e5e <fn_08012DA0+0xbe>
 8012de4:	001a      	movs	r2, r3
 8012de6:	3216      	adds	r2, #22
 8012de8:	0092      	lsls	r2, r2, #2
 8012dea:	588a      	ldr	r2, [r1, r2]
 8012dec:	2a00      	cmp	r2, #0
 8012dee:	d003      	beq.n	8012df8 <fn_08012DA0+0x58>
 8012df0:	2288      	movs	r2, #136	@ 0x88
 8012df2:	588a      	ldr	r2, [r1, r2]
 8012df4:	2a00      	cmp	r2, #0
 8012df6:	d131      	bne.n	8012e5c <fn_08012DA0+0xbc>
 8012df8:	1e42      	subs	r2, r0, #1
 8012dfa:	2801      	cmp	r0, #1
 8012dfc:	d02f      	beq.n	8012e5e <fn_08012DA0+0xbe>
 8012dfe:	3b01      	subs	r3, #1
 8012e00:	2b08      	cmp	r3, #8
 8012e02:	d83d      	bhi.n	8012e80 <fn_08012DA0+0xe0>
 8012e04:	4d6b      	ldr	r5, [pc, #428]	@ (8012fb4 <fn_08012DA0+0x214>)
 8012e06:	0098      	lsls	r0, r3, #2
 8012e08:	5828      	ldr	r0, [r5, r0]
 8012e0a:	4687      	mov	pc, r0
 8012e0c:	1e50      	subs	r0, r2, #1
 8012e0e:	2a01      	cmp	r2, #1
 8012e10:	d025      	beq.n	8012e5e <fn_08012DA0+0xbe>
 8012e12:	6ecb      	ldr	r3, [r1, #108]	@ 0x6c
 8012e14:	2b00      	cmp	r3, #0
 8012e16:	d046      	beq.n	8012ea6 <fn_08012DA0+0x106>
 8012e18:	2384      	movs	r3, #132	@ 0x84
 8012e1a:	58cb      	ldr	r3, [r1, r3]
 8012e1c:	2b00      	cmp	r3, #0
 8012e1e:	d0dd      	beq.n	8012ddc <fn_08012DA0+0x3c>
 8012e20:	e050      	b.n	8012ec4 <fn_08012DA0+0x124>
 8012e22:	6f8b      	ldr	r3, [r1, #120]	@ 0x78
 8012e24:	2b00      	cmp	r3, #0
 8012e26:	d005      	beq.n	8012e34 <fn_08012DA0+0x94>
 8012e28:	4b61      	ldr	r3, [pc, #388]	@ (8012fb0 <fn_08012DA0+0x210>)
 8012e2a:	6818      	ldr	r0, [r3, #0]
 8012e2c:	2394      	movs	r3, #148	@ 0x94
 8012e2e:	5cc3      	ldrb	r3, [r0, r3]
 8012e30:	2b02      	cmp	r3, #2
 8012e32:	d03d      	beq.n	8012eb0 <fn_08012DA0+0x110>
 8012e34:	3a01      	subs	r2, #1
 8012e36:	2a00      	cmp	r2, #0
 8012e38:	d011      	beq.n	8012e5e <fn_08012DA0+0xbe>
 8012e3a:	6e0b      	ldr	r3, [r1, #96]	@ 0x60
 8012e3c:	2b00      	cmp	r3, #0
 8012e3e:	d003      	beq.n	8012e48 <fn_08012DA0+0xa8>
 8012e40:	2380      	movs	r3, #128	@ 0x80
 8012e42:	58cb      	ldr	r3, [r1, r3]
 8012e44:	2b00      	cmp	r3, #0
 8012e46:	d139      	bne.n	8012ebc <fn_08012DA0+0x11c>
 8012e48:	1e50      	subs	r0, r2, #1
 8012e4a:	2a01      	cmp	r2, #1
 8012e4c:	d007      	beq.n	8012e5e <fn_08012DA0+0xbe>
 8012e4e:	6dca      	ldr	r2, [r1, #92]	@ 0x5c
 8012e50:	3301      	adds	r3, #1
 8012e52:	2a00      	cmp	r2, #0
 8012e54:	d0d0      	beq.n	8012df8 <fn_08012DA0+0x58>
 8012e56:	6fca      	ldr	r2, [r1, #124]	@ 0x7c
 8012e58:	2a00      	cmp	r2, #0
 8012e5a:	d0cd      	beq.n	8012df8 <fn_08012DA0+0x58>
 8012e5c:	001c      	movs	r4, r3
 8012e5e:	0020      	movs	r0, r4
 8012e60:	bc70      	pop	{r4, r5, r6}
 8012e62:	bc02      	pop	{r1}
 8012e64:	4708      	bx	r1
 8012e66:	6f4b      	ldr	r3, [r1, #116]	@ 0x74
 8012e68:	2b00      	cmp	r3, #0
 8012e6a:	d001      	beq.n	8012e70 <fn_08012DA0+0xd0>
 8012e6c:	2407      	movs	r4, #7
 8012e6e:	e7f6      	b.n	8012e5e <fn_08012DA0+0xbe>
 8012e70:	3a01      	subs	r2, #1
 8012e72:	2a00      	cmp	r2, #0
 8012e74:	d0f3      	beq.n	8012e5e <fn_08012DA0+0xbe>
 8012e76:	6d8b      	ldr	r3, [r1, #88]	@ 0x58
 8012e78:	2b00      	cmp	r3, #0
 8012e7a:	d00f      	beq.n	8012e9c <fn_08012DA0+0xfc>
 8012e7c:	2400      	movs	r4, #0
 8012e7e:	e7ee      	b.n	8012e5e <fn_08012DA0+0xbe>
 8012e80:	0018      	movs	r0, r3
 8012e82:	3016      	adds	r0, #22
 8012e84:	0080      	lsls	r0, r0, #2
 8012e86:	5808      	ldr	r0, [r1, r0]
 8012e88:	2800      	cmp	r0, #0
 8012e8a:	d033      	beq.n	8012ef4 <fn_08012DA0+0x154>
 8012e8c:	0618      	lsls	r0, r3, #24
 8012e8e:	0e00      	lsrs	r0, r0, #24
 8012e90:	2808      	cmp	r0, #8
 8012e92:	d82f      	bhi.n	8012ef4 <fn_08012DA0+0x154>
 8012e94:	4d48      	ldr	r5, [pc, #288]	@ (8012fb8 <fn_08012DA0+0x218>)
 8012e96:	0080      	lsls	r0, r0, #2
 8012e98:	5828      	ldr	r0, [r5, r0]
 8012e9a:	4687      	mov	pc, r0
 8012e9c:	3a01      	subs	r2, #1
 8012e9e:	2a00      	cmp	r2, #0
 8012ea0:	d000      	beq.n	8012ea4 <fn_08012DA0+0x104>
 8012ea2:	e784      	b.n	8012dae <fn_08012DA0+0xe>
 8012ea4:	e7db      	b.n	8012e5e <fn_08012DA0+0xbe>
 8012ea6:	2305      	movs	r3, #5
 8012ea8:	1e42      	subs	r2, r0, #1
 8012eaa:	2801      	cmp	r0, #1
 8012eac:	d1a7      	bne.n	8012dfe <fn_08012DA0+0x5e>
 8012eae:	e7d6      	b.n	8012e5e <fn_08012DA0+0xbe>
 8012eb0:	337e      	adds	r3, #126	@ 0x7e
 8012eb2:	58cb      	ldr	r3, [r1, r3]
 8012eb4:	2b01      	cmp	r3, #1
 8012eb6:	ddbd      	ble.n	8012e34 <fn_08012DA0+0x94>
 8012eb8:	2408      	movs	r4, #8
 8012eba:	e7d0      	b.n	8012e5e <fn_08012DA0+0xbe>
 8012ebc:	2402      	movs	r4, #2
 8012ebe:	e7ce      	b.n	8012e5e <fn_08012DA0+0xbe>
 8012ec0:	2406      	movs	r4, #6
 8012ec2:	e7cc      	b.n	8012e5e <fn_08012DA0+0xbe>
 8012ec4:	2405      	movs	r4, #5
 8012ec6:	e7ca      	b.n	8012e5e <fn_08012DA0+0xbe>
 8012ec8:	4839      	ldr	r0, [pc, #228]	@ (8012fb0 <fn_08012DA0+0x210>)
 8012eca:	6805      	ldr	r5, [r0, #0]
 8012ecc:	2094      	movs	r0, #148	@ 0x94
 8012ece:	5c28      	ldrb	r0, [r5, r0]
 8012ed0:	2802      	cmp	r0, #2
 8012ed2:	d041      	beq.n	8012f58 <fn_08012DA0+0x1b8>
 8012ed4:	1e50      	subs	r0, r2, #1
 8012ed6:	2a01      	cmp	r2, #1
 8012ed8:	d0c1      	beq.n	8012e5e <fn_08012DA0+0xbe>
 8012eda:	3b01      	subs	r3, #1
 8012edc:	001a      	movs	r2, r3
 8012ede:	3216      	adds	r2, #22
 8012ee0:	0092      	lsls	r2, r2, #2
 8012ee2:	588a      	ldr	r2, [r1, r2]
 8012ee4:	2a00      	cmp	r2, #0
 8012ee6:	d100      	bne.n	8012eea <fn_08012DA0+0x14a>
 8012ee8:	e786      	b.n	8012df8 <fn_08012DA0+0x58>
 8012eea:	001c      	movs	r4, r3
 8012eec:	e7b7      	b.n	8012e5e <fn_08012DA0+0xbe>
 8012eee:	6fc8      	ldr	r0, [r1, #124]	@ 0x7c
 8012ef0:	2800      	cmp	r0, #0
 8012ef2:	d1b3      	bne.n	8012e5c <fn_08012DA0+0xbc>
 8012ef4:	3a01      	subs	r2, #1
 8012ef6:	2a00      	cmp	r2, #0
 8012ef8:	d0b1      	beq.n	8012e5e <fn_08012DA0+0xbe>
 8012efa:	3b01      	subs	r3, #1
 8012efc:	e780      	b.n	8012e00 <fn_08012DA0+0x60>
 8012efe:	482c      	ldr	r0, [pc, #176]	@ (8012fb0 <fn_08012DA0+0x210>)
 8012f00:	6805      	ldr	r5, [r0, #0]
 8012f02:	2094      	movs	r0, #148	@ 0x94
 8012f04:	5c28      	ldrb	r0, [r5, r0]
 8012f06:	2800      	cmp	r0, #0
 8012f08:	d03e      	beq.n	8012f88 <fn_08012DA0+0x1e8>
 8012f0a:	2084      	movs	r0, #132	@ 0x84
 8012f0c:	580e      	ldr	r6, [r1, r0]
 8012f0e:	2e27      	cmp	r6, #39	@ 0x27
 8012f10:	dca4      	bgt.n	8012e5c <fn_08012DA0+0xbc>
 8012f12:	1e50      	subs	r0, r2, #1
 8012f14:	2a01      	cmp	r2, #1
 8012f16:	d0a2      	beq.n	8012e5e <fn_08012DA0+0xbe>
 8012f18:	1e5d      	subs	r5, r3, #1
 8012f1a:	46ac      	mov	ip, r5
 8012f1c:	3516      	adds	r5, #22
 8012f1e:	00ad      	lsls	r5, r5, #2
 8012f20:	594d      	ldr	r5, [r1, r5]
 8012f22:	2d00      	cmp	r5, #0
 8012f24:	d041      	beq.n	8012faa <fn_08012DA0+0x20a>
 8012f26:	2e00      	cmp	r6, #0
 8012f28:	d13d      	bne.n	8012fa6 <fn_08012DA0+0x206>
 8012f2a:	1e90      	subs	r0, r2, #2
 8012f2c:	2a02      	cmp	r2, #2
 8012f2e:	d096      	beq.n	8012e5e <fn_08012DA0+0xbe>
 8012f30:	3b02      	subs	r3, #2
 8012f32:	e757      	b.n	8012de4 <fn_08012DA0+0x44>
 8012f34:	2080      	movs	r0, #128	@ 0x80
 8012f36:	5808      	ldr	r0, [r1, r0]
 8012f38:	2800      	cmp	r0, #0
 8012f3a:	d000      	beq.n	8012f3e <fn_08012DA0+0x19e>
 8012f3c:	e78e      	b.n	8012e5c <fn_08012DA0+0xbc>
 8012f3e:	1e50      	subs	r0, r2, #1
 8012f40:	2a01      	cmp	r2, #1
 8012f42:	d100      	bne.n	8012f46 <fn_08012DA0+0x1a6>
 8012f44:	e78b      	b.n	8012e5e <fn_08012DA0+0xbe>
 8012f46:	3b01      	subs	r3, #1
 8012f48:	001a      	movs	r2, r3
 8012f4a:	3216      	adds	r2, #22
 8012f4c:	0092      	lsls	r2, r2, #2
 8012f4e:	588a      	ldr	r2, [r1, r2]
 8012f50:	2a00      	cmp	r2, #0
 8012f52:	d000      	beq.n	8012f56 <fn_08012DA0+0x1b6>
 8012f54:	e77f      	b.n	8012e56 <fn_08012DA0+0xb6>
 8012f56:	e74f      	b.n	8012df8 <fn_08012DA0+0x58>
 8012f58:	2080      	movs	r0, #128	@ 0x80
 8012f5a:	5808      	ldr	r0, [r1, r0]
 8012f5c:	2801      	cmp	r0, #1
 8012f5e:	ddb9      	ble.n	8012ed4 <fn_08012DA0+0x134>
 8012f60:	001c      	movs	r4, r3
 8012f62:	e77c      	b.n	8012e5e <fn_08012DA0+0xbe>
 8012f64:	2088      	movs	r0, #136	@ 0x88
 8012f66:	5808      	ldr	r0, [r1, r0]
 8012f68:	2800      	cmp	r0, #0
 8012f6a:	d0c3      	beq.n	8012ef4 <fn_08012DA0+0x154>
 8012f6c:	e776      	b.n	8012e5c <fn_08012DA0+0xbc>
 8012f6e:	0010      	movs	r0, r2
 8012f70:	e771      	b.n	8012e56 <fn_08012DA0+0xb6>
 8012f72:	2084      	movs	r0, #132	@ 0x84
 8012f74:	5808      	ldr	r0, [r1, r0]
 8012f76:	2800      	cmp	r0, #0
 8012f78:	d000      	beq.n	8012f7c <fn_08012DA0+0x1dc>
 8012f7a:	e76f      	b.n	8012e5c <fn_08012DA0+0xbc>
 8012f7c:	1e50      	subs	r0, r2, #1
 8012f7e:	2a01      	cmp	r2, #1
 8012f80:	d100      	bne.n	8012f84 <fn_08012DA0+0x1e4>
 8012f82:	e76c      	b.n	8012e5e <fn_08012DA0+0xbe>
 8012f84:	3b01      	subs	r3, #1
 8012f86:	e72d      	b.n	8012de4 <fn_08012DA0+0x44>
 8012f88:	1e50      	subs	r0, r2, #1
 8012f8a:	2a01      	cmp	r2, #1
 8012f8c:	d100      	bne.n	8012f90 <fn_08012DA0+0x1f0>
 8012f8e:	e766      	b.n	8012e5e <fn_08012DA0+0xbe>
 8012f90:	1e5d      	subs	r5, r3, #1
 8012f92:	46ac      	mov	ip, r5
 8012f94:	3516      	adds	r5, #22
 8012f96:	00ad      	lsls	r5, r5, #2
 8012f98:	594d      	ldr	r5, [r1, r5]
 8012f9a:	2d00      	cmp	r5, #0
 8012f9c:	d005      	beq.n	8012faa <fn_08012DA0+0x20a>
 8012f9e:	2084      	movs	r0, #132	@ 0x84
 8012fa0:	5808      	ldr	r0, [r1, r0]
 8012fa2:	2800      	cmp	r0, #0
 8012fa4:	d0c1      	beq.n	8012f2a <fn_08012DA0+0x18a>
 8012fa6:	4664      	mov	r4, ip
 8012fa8:	e759      	b.n	8012e5e <fn_08012DA0+0xbe>
 8012faa:	4663      	mov	r3, ip
 8012fac:	e724      	b.n	8012df8 <fn_08012DA0+0x58>
 8012fae:	46c0      	nop			@ (mov r8, r8)
 8012fb0:	030064c4 	.word	0x030064c4
 8012fb4:	0812e748 	.word	0x0812e748
 8012fb8:	0812e76c 	.word	0x0812e76c
