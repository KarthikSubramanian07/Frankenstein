fn_08012B98:
 8012b98:	2353      	movs	r3, #83	@ 0x53
 8012b9a:	b530      	push	{r4, r5, lr}
 8012b9c:	0001      	movs	r1, r0
 8012b9e:	5cc4      	ldrb	r4, [r0, r3]
 8012ba0:	48a2      	ldr	r0, [pc, #648]	@ (8012e2c <fn_08012B98+0x294>)
 8012ba2:	0023      	movs	r3, r4
 8012ba4:	2209      	movs	r2, #9
 8012ba6:	4684      	mov	ip, r0
 8012ba8:	3301      	adds	r3, #1
 8012baa:	2b08      	cmp	r3, #8
 8012bac:	dd35      	ble.n	8012c1a <fn_08012B98+0x82>
 8012bae:	6e4b      	ldr	r3, [r1, #100]	@ 0x64
 8012bb0:	2b00      	cmp	r3, #0
 8012bb2:	d015      	beq.n	8012be0 <fn_08012B98+0x48>
 8012bb4:	6fcb      	ldr	r3, [r1, #124]	@ 0x7c
 8012bb6:	2b00      	cmp	r3, #0
 8012bb8:	d000      	beq.n	8012bbc <fn_08012B98+0x24>
 8012bba:	e085      	b.n	8012cc8 <fn_08012B98+0x130>
 8012bbc:	1e50      	subs	r0, r2, #1
 8012bbe:	2a01      	cmp	r2, #1
 8012bc0:	d042      	beq.n	8012c48 <fn_08012B98+0xb0>
 8012bc2:	2304      	movs	r3, #4
 8012bc4:	001a      	movs	r2, r3
 8012bc6:	3216      	adds	r2, #22
 8012bc8:	0092      	lsls	r2, r2, #2
 8012bca:	588a      	ldr	r2, [r1, r2]
 8012bcc:	2a00      	cmp	r2, #0
 8012bce:	d061      	beq.n	8012c94 <fn_08012B98+0xfc>
 8012bd0:	061a      	lsls	r2, r3, #24
 8012bd2:	0e12      	lsrs	r2, r2, #24
 8012bd4:	2a08      	cmp	r2, #8
 8012bd6:	d85d      	bhi.n	8012c94 <fn_08012B98+0xfc>
 8012bd8:	4d95      	ldr	r5, [pc, #596]	@ (8012e30 <fn_08012B98+0x298>)
 8012bda:	0092      	lsls	r2, r2, #2
 8012bdc:	58aa      	ldr	r2, [r5, r2]
 8012bde:	4697      	mov	pc, r2
 8012be0:	1e50      	subs	r0, r2, #1
 8012be2:	2a01      	cmp	r2, #1
 8012be4:	d030      	beq.n	8012c48 <fn_08012B98+0xb0>
 8012be6:	6e8b      	ldr	r3, [r1, #104]	@ 0x68
 8012be8:	2b00      	cmp	r3, #0
 8012bea:	d05d      	beq.n	8012ca8 <fn_08012B98+0x110>
 8012bec:	2304      	movs	r3, #4
 8012bee:	2288      	movs	r2, #136	@ 0x88
 8012bf0:	588a      	ldr	r2, [r1, r2]
 8012bf2:	2a00      	cmp	r2, #0
 8012bf4:	d156      	bne.n	8012ca4 <fn_08012B98+0x10c>
 8012bf6:	1e42      	subs	r2, r0, #1
 8012bf8:	2801      	cmp	r0, #1
 8012bfa:	d025      	beq.n	8012c48 <fn_08012B98+0xb0>
 8012bfc:	3301      	adds	r3, #1
 8012bfe:	0018      	movs	r0, r3
 8012c00:	3016      	adds	r0, #22
 8012c02:	0080      	lsls	r0, r0, #2
 8012c04:	5808      	ldr	r0, [r1, r0]
 8012c06:	2800      	cmp	r0, #0
 8012c08:	d003      	beq.n	8012c12 <fn_08012B98+0x7a>
 8012c0a:	2084      	movs	r0, #132	@ 0x84
 8012c0c:	5808      	ldr	r0, [r1, r0]
 8012c0e:	2800      	cmp	r0, #0
 8012c10:	d148      	bne.n	8012ca4 <fn_08012B98+0x10c>
 8012c12:	3a01      	subs	r2, #1
 8012c14:	2a00      	cmp	r2, #0
 8012c16:	d017      	beq.n	8012c48 <fn_08012B98+0xb0>
 8012c18:	3301      	adds	r3, #1
 8012c1a:	2b08      	cmp	r3, #8
 8012c1c:	d900      	bls.n	8012c20 <fn_08012B98+0x88>
 8012c1e:	e071      	b.n	8012d04 <fn_08012B98+0x16c>
 8012c20:	4665      	mov	r5, ip
 8012c22:	0098      	lsls	r0, r3, #2
 8012c24:	5828      	ldr	r0, [r5, r0]
 8012c26:	4687      	mov	pc, r0
 8012c28:	6f8b      	ldr	r3, [r1, #120]	@ 0x78
 8012c2a:	2b00      	cmp	r3, #0
 8012c2c:	d009      	beq.n	8012c42 <fn_08012B98+0xaa>
 8012c2e:	2380      	movs	r3, #128	@ 0x80
 8012c30:	58cb      	ldr	r3, [r1, r3]
 8012c32:	2b01      	cmp	r3, #1
 8012c34:	dd05      	ble.n	8012c42 <fn_08012B98+0xaa>
 8012c36:	4b7f      	ldr	r3, [pc, #508]	@ (8012e34 <fn_08012B98+0x29c>)
 8012c38:	6818      	ldr	r0, [r3, #0]
 8012c3a:	2394      	movs	r3, #148	@ 0x94
 8012c3c:	5cc3      	ldrb	r3, [r0, r3]
 8012c3e:	2b02      	cmp	r3, #2
 8012c40:	d044      	beq.n	8012ccc <fn_08012B98+0x134>
 8012c42:	3a01      	subs	r2, #1
 8012c44:	2a00      	cmp	r2, #0
 8012c46:	d1b2      	bne.n	8012bae <fn_08012B98+0x16>
 8012c48:	0020      	movs	r0, r4
 8012c4a:	bc30      	pop	{r4, r5}
 8012c4c:	bc02      	pop	{r1}
 8012c4e:	4708      	bx	r1
 8012c50:	0002      	movs	r2, r0
 8012c52:	6d8b      	ldr	r3, [r1, #88]	@ 0x58
 8012c54:	2b00      	cmp	r3, #0
 8012c56:	d001      	beq.n	8012c5c <fn_08012B98+0xc4>
 8012c58:	2400      	movs	r4, #0
 8012c5a:	e7f5      	b.n	8012c48 <fn_08012B98+0xb0>
 8012c5c:	3a01      	subs	r2, #1
 8012c5e:	2a00      	cmp	r2, #0
 8012c60:	d0f2      	beq.n	8012c48 <fn_08012B98+0xb0>
 8012c62:	6f4b      	ldr	r3, [r1, #116]	@ 0x74
 8012c64:	2b00      	cmp	r3, #0
 8012c66:	d001      	beq.n	8012c6c <fn_08012B98+0xd4>
 8012c68:	2407      	movs	r4, #7
 8012c6a:	e7ed      	b.n	8012c48 <fn_08012B98+0xb0>
 8012c6c:	3a01      	subs	r2, #1
 8012c6e:	2a00      	cmp	r2, #0
 8012c70:	d0ea      	beq.n	8012c48 <fn_08012B98+0xb0>
 8012c72:	6dcb      	ldr	r3, [r1, #92]	@ 0x5c
 8012c74:	2b00      	cmp	r3, #0
 8012c76:	d01d      	beq.n	8012cb4 <fn_08012B98+0x11c>
 8012c78:	6fcb      	ldr	r3, [r1, #124]	@ 0x7c
 8012c7a:	2b00      	cmp	r3, #0
 8012c7c:	d122      	bne.n	8012cc4 <fn_08012B98+0x12c>
 8012c7e:	1e50      	subs	r0, r2, #1
 8012c80:	2a01      	cmp	r2, #1
 8012c82:	d0e1      	beq.n	8012c48 <fn_08012B98+0xb0>
 8012c84:	6e0b      	ldr	r3, [r1, #96]	@ 0x60
 8012c86:	2b00      	cmp	r3, #0
 8012c88:	d022      	beq.n	8012cd0 <fn_08012B98+0x138>
 8012c8a:	2302      	movs	r3, #2
 8012c8c:	2280      	movs	r2, #128	@ 0x80
 8012c8e:	588a      	ldr	r2, [r1, r2]
 8012c90:	2a00      	cmp	r2, #0
 8012c92:	d107      	bne.n	8012ca4 <fn_08012B98+0x10c>
 8012c94:	1e42      	subs	r2, r0, #1
 8012c96:	2801      	cmp	r0, #1
 8012c98:	d0d6      	beq.n	8012c48 <fn_08012B98+0xb0>
 8012c9a:	3301      	adds	r3, #1
 8012c9c:	e7bd      	b.n	8012c1a <fn_08012B98+0x82>
 8012c9e:	6fca      	ldr	r2, [r1, #124]	@ 0x7c
 8012ca0:	2a00      	cmp	r2, #0
 8012ca2:	d02b      	beq.n	8012cfc <fn_08012B98+0x164>
 8012ca4:	001c      	movs	r4, r3
 8012ca6:	e7cf      	b.n	8012c48 <fn_08012B98+0xb0>
 8012ca8:	2304      	movs	r3, #4
 8012caa:	1e42      	subs	r2, r0, #1
 8012cac:	2801      	cmp	r0, #1
 8012cae:	d000      	beq.n	8012cb2 <fn_08012B98+0x11a>
 8012cb0:	e77a      	b.n	8012ba8 <fn_08012B98+0x10>
 8012cb2:	e7c9      	b.n	8012c48 <fn_08012B98+0xb0>
 8012cb4:	1e50      	subs	r0, r2, #1
 8012cb6:	2a01      	cmp	r2, #1
 8012cb8:	d0c6      	beq.n	8012c48 <fn_08012B98+0xb0>
 8012cba:	6e0b      	ldr	r3, [r1, #96]	@ 0x60
 8012cbc:	2b00      	cmp	r3, #0
 8012cbe:	d1e4      	bne.n	8012c8a <fn_08012B98+0xf2>
 8012cc0:	2302      	movs	r3, #2
 8012cc2:	e7f2      	b.n	8012caa <fn_08012B98+0x112>
 8012cc4:	2401      	movs	r4, #1
 8012cc6:	e7bf      	b.n	8012c48 <fn_08012B98+0xb0>
 8012cc8:	2403      	movs	r4, #3
 8012cca:	e7bd      	b.n	8012c48 <fn_08012B98+0xb0>
 8012ccc:	2408      	movs	r4, #8
 8012cce:	e7bb      	b.n	8012c48 <fn_08012B98+0xb0>
 8012cd0:	3a02      	subs	r2, #2
 8012cd2:	2303      	movs	r3, #3
 8012cd4:	2a00      	cmp	r2, #0
 8012cd6:	d1a3      	bne.n	8012c20 <fn_08012B98+0x88>
 8012cd8:	e7b6      	b.n	8012c48 <fn_08012B98+0xb0>
 8012cda:	6fc8      	ldr	r0, [r1, #124]	@ 0x7c
 8012cdc:	2800      	cmp	r0, #0
 8012cde:	d1e1      	bne.n	8012ca4 <fn_08012B98+0x10c>
 8012ce0:	1e50      	subs	r0, r2, #1
 8012ce2:	2a01      	cmp	r2, #1
 8012ce4:	d0b0      	beq.n	8012c48 <fn_08012B98+0xb0>
 8012ce6:	3301      	adds	r3, #1
 8012ce8:	001a      	movs	r2, r3
 8012cea:	3216      	adds	r2, #22
 8012cec:	0092      	lsls	r2, r2, #2
 8012cee:	588a      	ldr	r2, [r1, r2]
 8012cf0:	2a00      	cmp	r2, #0
 8012cf2:	d0da      	beq.n	8012caa <fn_08012B98+0x112>
 8012cf4:	2280      	movs	r2, #128	@ 0x80
 8012cf6:	588a      	ldr	r2, [r1, r2]
 8012cf8:	2a00      	cmp	r2, #0
 8012cfa:	d1d3      	bne.n	8012ca4 <fn_08012B98+0x10c>
 8012cfc:	1e42      	subs	r2, r0, #1
 8012cfe:	2801      	cmp	r0, #1
 8012d00:	d0a2      	beq.n	8012c48 <fn_08012B98+0xb0>
 8012d02:	3301      	adds	r3, #1
 8012d04:	0018      	movs	r0, r3
 8012d06:	3016      	adds	r0, #22
 8012d08:	0080      	lsls	r0, r0, #2
 8012d0a:	5808      	ldr	r0, [r1, r0]
 8012d0c:	2800      	cmp	r0, #0
 8012d0e:	d056      	beq.n	8012dbe <fn_08012B98+0x226>
 8012d10:	0618      	lsls	r0, r3, #24
 8012d12:	0e00      	lsrs	r0, r0, #24
 8012d14:	2808      	cmp	r0, #8
 8012d16:	d900      	bls.n	8012d1a <fn_08012B98+0x182>
 8012d18:	e77b      	b.n	8012c12 <fn_08012B98+0x7a>
 8012d1a:	4d47      	ldr	r5, [pc, #284]	@ (8012e38 <fn_08012B98+0x2a0>)
 8012d1c:	0080      	lsls	r0, r0, #2
 8012d1e:	5828      	ldr	r0, [r5, r0]
 8012d20:	4687      	mov	pc, r0
 8012d22:	2084      	movs	r0, #132	@ 0x84
 8012d24:	5808      	ldr	r0, [r1, r0]
 8012d26:	2827      	cmp	r0, #39	@ 0x27
 8012d28:	dd13      	ble.n	8012d52 <fn_08012B98+0x1ba>
 8012d2a:	4842      	ldr	r0, [pc, #264]	@ (8012e34 <fn_08012B98+0x29c>)
 8012d2c:	6805      	ldr	r5, [r0, #0]
 8012d2e:	2094      	movs	r0, #148	@ 0x94
 8012d30:	5c28      	ldrb	r0, [r5, r0]
 8012d32:	2800      	cmp	r0, #0
 8012d34:	d1b6      	bne.n	8012ca4 <fn_08012B98+0x10c>
 8012d36:	1e50      	subs	r0, r2, #1
 8012d38:	2a01      	cmp	r2, #1
 8012d3a:	d100      	bne.n	8012d3e <fn_08012B98+0x1a6>
 8012d3c:	e784      	b.n	8012c48 <fn_08012B98+0xb0>
 8012d3e:	2b06      	cmp	r3, #6
 8012d40:	d086      	beq.n	8012c50 <fn_08012B98+0xb8>
 8012d42:	0018      	movs	r0, r3
 8012d44:	3017      	adds	r0, #23
 8012d46:	0080      	lsls	r0, r0, #2
 8012d48:	5808      	ldr	r0, [r1, r0]
 8012d4a:	2800      	cmp	r0, #0
 8012d4c:	d011      	beq.n	8012d72 <fn_08012B98+0x1da>
 8012d4e:	1c5c      	adds	r4, r3, #1
 8012d50:	e77a      	b.n	8012c48 <fn_08012B98+0xb0>
 8012d52:	3a01      	subs	r2, #1
 8012d54:	2a00      	cmp	r2, #0
 8012d56:	d100      	bne.n	8012d5a <fn_08012B98+0x1c2>
 8012d58:	e776      	b.n	8012c48 <fn_08012B98+0xb0>
 8012d5a:	1c58      	adds	r0, r3, #1
 8012d5c:	2b06      	cmp	r3, #6
 8012d5e:	d100      	bne.n	8012d62 <fn_08012B98+0x1ca>
 8012d60:	e777      	b.n	8012c52 <fn_08012B98+0xba>
 8012d62:	0003      	movs	r3, r0
 8012d64:	3316      	adds	r3, #22
 8012d66:	009b      	lsls	r3, r3, #2
 8012d68:	58cb      	ldr	r3, [r1, r3]
 8012d6a:	2b00      	cmp	r3, #0
 8012d6c:	d007      	beq.n	8012d7e <fn_08012B98+0x1e6>
 8012d6e:	0004      	movs	r4, r0
 8012d70:	e76a      	b.n	8012c48 <fn_08012B98+0xb0>
 8012d72:	3a02      	subs	r2, #2
 8012d74:	4282      	cmp	r2, r0
 8012d76:	d100      	bne.n	8012d7a <fn_08012B98+0x1e2>
 8012d78:	e766      	b.n	8012c48 <fn_08012B98+0xb0>
 8012d7a:	3302      	adds	r3, #2
 8012d7c:	e74d      	b.n	8012c1a <fn_08012B98+0x82>
 8012d7e:	3a01      	subs	r2, #1
 8012d80:	429a      	cmp	r2, r3
 8012d82:	d100      	bne.n	8012d86 <fn_08012B98+0x1ee>
 8012d84:	e760      	b.n	8012c48 <fn_08012B98+0xb0>
 8012d86:	1c43      	adds	r3, r0, #1
 8012d88:	e747      	b.n	8012c1a <fn_08012B98+0x82>
 8012d8a:	0010      	movs	r0, r2
 8012d8c:	2280      	movs	r2, #128	@ 0x80
 8012d8e:	588a      	ldr	r2, [r1, r2]
 8012d90:	2a01      	cmp	r2, #1
 8012d92:	dd0b      	ble.n	8012dac <fn_08012B98+0x214>
 8012d94:	4a27      	ldr	r2, [pc, #156]	@ (8012e34 <fn_08012B98+0x29c>)
 8012d96:	6815      	ldr	r5, [r2, #0]
 8012d98:	2294      	movs	r2, #148	@ 0x94
 8012d9a:	5caa      	ldrb	r2, [r5, r2]
 8012d9c:	2a02      	cmp	r2, #2
 8012d9e:	d081      	beq.n	8012ca4 <fn_08012B98+0x10c>
 8012da0:	3801      	subs	r0, #1
 8012da2:	2800      	cmp	r0, #0
 8012da4:	d100      	bne.n	8012da8 <fn_08012B98+0x210>
 8012da6:	e74f      	b.n	8012c48 <fn_08012B98+0xb0>
 8012da8:	3301      	adds	r3, #1
 8012daa:	e70b      	b.n	8012bc4 <fn_08012B98+0x2c>
 8012dac:	2801      	cmp	r0, #1
 8012dae:	d100      	bne.n	8012db2 <fn_08012B98+0x21a>
 8012db0:	e74a      	b.n	8012c48 <fn_08012B98+0xb0>
 8012db2:	1e82      	subs	r2, r0, #2
 8012db4:	2802      	cmp	r0, #2
 8012db6:	d100      	bne.n	8012dba <fn_08012B98+0x222>
 8012db8:	e746      	b.n	8012c48 <fn_08012B98+0xb0>
 8012dba:	3302      	adds	r3, #2
 8012dbc:	e72d      	b.n	8012c1a <fn_08012B98+0x82>
 8012dbe:	3a01      	subs	r2, #1
 8012dc0:	4282      	cmp	r2, r0
 8012dc2:	d100      	bne.n	8012dc6 <fn_08012B98+0x22e>
 8012dc4:	e740      	b.n	8012c48 <fn_08012B98+0xb0>
 8012dc6:	3301      	adds	r3, #1
 8012dc8:	e727      	b.n	8012c1a <fn_08012B98+0x82>
 8012dca:	0010      	movs	r0, r2
 8012dcc:	6fca      	ldr	r2, [r1, #124]	@ 0x7c
 8012dce:	2a00      	cmp	r2, #0
 8012dd0:	d000      	beq.n	8012dd4 <fn_08012B98+0x23c>
 8012dd2:	e767      	b.n	8012ca4 <fn_08012B98+0x10c>
 8012dd4:	2801      	cmp	r0, #1
 8012dd6:	d100      	bne.n	8012dda <fn_08012B98+0x242>
 8012dd8:	e736      	b.n	8012c48 <fn_08012B98+0xb0>
 8012dda:	1c5a      	adds	r2, r3, #1
 8012ddc:	0015      	movs	r5, r2
 8012dde:	3216      	adds	r2, #22
 8012de0:	0092      	lsls	r2, r2, #2
 8012de2:	588a      	ldr	r2, [r1, r2]
 8012de4:	2a00      	cmp	r2, #0
 8012de6:	d0e4      	beq.n	8012db2 <fn_08012B98+0x21a>
 8012de8:	2288      	movs	r2, #136	@ 0x88
 8012dea:	588a      	ldr	r2, [r1, r2]
 8012dec:	2a00      	cmp	r2, #0
 8012dee:	d105      	bne.n	8012dfc <fn_08012B98+0x264>
 8012df0:	1e82      	subs	r2, r0, #2
 8012df2:	2802      	cmp	r0, #2
 8012df4:	d100      	bne.n	8012df8 <fn_08012B98+0x260>
 8012df6:	e727      	b.n	8012c48 <fn_08012B98+0xb0>
 8012df8:	3302      	adds	r3, #2
 8012dfa:	e700      	b.n	8012bfe <fn_08012B98+0x66>
 8012dfc:	002c      	movs	r4, r5
 8012dfe:	e723      	b.n	8012c48 <fn_08012B98+0xb0>
 8012e00:	0010      	movs	r0, r2
 8012e02:	e6f4      	b.n	8012bee <fn_08012B98+0x56>
 8012e04:	0010      	movs	r0, r2
 8012e06:	e741      	b.n	8012c8c <fn_08012B98+0xf4>
 8012e08:	2284      	movs	r2, #132	@ 0x84
 8012e0a:	588d      	ldr	r5, [r1, r2]
 8012e0c:	0002      	movs	r2, r0
 8012e0e:	2d27      	cmp	r5, #39	@ 0x27
 8012e10:	dc8b      	bgt.n	8012d2a <fn_08012B98+0x192>
 8012e12:	3a01      	subs	r2, #1
 8012e14:	2a00      	cmp	r2, #0
 8012e16:	d100      	bne.n	8012e1a <fn_08012B98+0x282>
 8012e18:	e716      	b.n	8012c48 <fn_08012B98+0xb0>
 8012e1a:	1c58      	adds	r0, r3, #1
 8012e1c:	e7a1      	b.n	8012d62 <fn_08012B98+0x1ca>
 8012e1e:	2284      	movs	r2, #132	@ 0x84
 8012e20:	588a      	ldr	r2, [r1, r2]
 8012e22:	2a00      	cmp	r2, #0
 8012e24:	d100      	bne.n	8012e28 <fn_08012B98+0x290>
 8012e26:	e769      	b.n	8012cfc <fn_08012B98+0x164>
 8012e28:	001c      	movs	r4, r3
 8012e2a:	e70d      	b.n	8012c48 <fn_08012B98+0xb0>
 8012e2c:	0812e7d4 	.word	0x0812e7d4
 8012e30:	0812e7b0 	.word	0x0812e7b0
 8012e34:	030064c4 	.word	0x030064c4
 8012e38:	0812e7f8 	.word	0x0812e7f8
