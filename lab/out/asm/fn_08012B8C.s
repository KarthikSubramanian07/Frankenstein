fn_08012B8C:
 8012b8c:	2353      	movs	r3, #83	@ 0x53
 8012b8e:	b530      	push	{r4, r5, lr}
 8012b90:	0001      	movs	r1, r0
 8012b92:	5cc4      	ldrb	r4, [r0, r3]
 8012b94:	487f      	ldr	r0, [pc, #508]	@ (8012d94 <fn_08012B8C+0x208>)
 8012b96:	0023      	movs	r3, r4
 8012b98:	2209      	movs	r2, #9
 8012b9a:	4684      	mov	ip, r0
 8012b9c:	3301      	adds	r3, #1
 8012b9e:	2b08      	cmp	r3, #8
 8012ba0:	dd1a      	ble.n	8012bd8 <fn_08012B8C+0x4c>
 8012ba2:	6e4b      	ldr	r3, [r1, #100]	@ 0x64
 8012ba4:	2b00      	cmp	r3, #0
 8012ba6:	d013      	beq.n	8012bd0 <fn_08012B8C+0x44>
 8012ba8:	6fcb      	ldr	r3, [r1, #124]	@ 0x7c
 8012baa:	2b00      	cmp	r3, #0
 8012bac:	d16c      	bne.n	8012c88 <fn_08012B8C+0xfc>
 8012bae:	1e50      	subs	r0, r2, #1
 8012bb0:	2a01      	cmp	r2, #1
 8012bb2:	d009      	beq.n	8012bc8 <fn_08012B8C+0x3c>
 8012bb4:	6e8b      	ldr	r3, [r1, #104]	@ 0x68
 8012bb6:	001d      	movs	r5, r3
 8012bb8:	2304      	movs	r3, #4
 8012bba:	2d00      	cmp	r5, #0
 8012bbc:	d066      	beq.n	8012c8c <fn_08012B8C+0x100>
 8012bbe:	2288      	movs	r2, #136	@ 0x88
 8012bc0:	588a      	ldr	r2, [r1, r2]
 8012bc2:	2a00      	cmp	r2, #0
 8012bc4:	d03e      	beq.n	8012c44 <fn_08012B8C+0xb8>
 8012bc6:	001c      	movs	r4, r3
 8012bc8:	0020      	movs	r0, r4
 8012bca:	bc30      	pop	{r4, r5}
 8012bcc:	bc02      	pop	{r1}
 8012bce:	4708      	bx	r1
 8012bd0:	3a01      	subs	r2, #1
 8012bd2:	2a00      	cmp	r2, #0
 8012bd4:	d0f8      	beq.n	8012bc8 <fn_08012B8C+0x3c>
 8012bd6:	2304      	movs	r3, #4
 8012bd8:	2b08      	cmp	r3, #8
 8012bda:	d839      	bhi.n	8012c50 <fn_08012B8C+0xc4>
 8012bdc:	4665      	mov	r5, ip
 8012bde:	0098      	lsls	r0, r3, #2
 8012be0:	5828      	ldr	r0, [r5, r0]
 8012be2:	4687      	mov	pc, r0
 8012be4:	6f8b      	ldr	r3, [r1, #120]	@ 0x78
 8012be6:	2b00      	cmp	r3, #0
 8012be8:	d009      	beq.n	8012bfe <fn_08012B8C+0x72>
 8012bea:	4b6b      	ldr	r3, [pc, #428]	@ (8012d98 <fn_08012B8C+0x20c>)
 8012bec:	6818      	ldr	r0, [r3, #0]
 8012bee:	2394      	movs	r3, #148	@ 0x94
 8012bf0:	5cc3      	ldrb	r3, [r0, r3]
 8012bf2:	2b02      	cmp	r3, #2
 8012bf4:	d103      	bne.n	8012bfe <fn_08012B8C+0x72>
 8012bf6:	337e      	adds	r3, #126	@ 0x7e
 8012bf8:	58cb      	ldr	r3, [r1, r3]
 8012bfa:	2b01      	cmp	r3, #1
 8012bfc:	dc4b      	bgt.n	8012c96 <fn_08012B8C+0x10a>
 8012bfe:	3a01      	subs	r2, #1
 8012c00:	2a00      	cmp	r2, #0
 8012c02:	d1ce      	bne.n	8012ba2 <fn_08012B8C+0x16>
 8012c04:	e7e0      	b.n	8012bc8 <fn_08012B8C+0x3c>
 8012c06:	6f4b      	ldr	r3, [r1, #116]	@ 0x74
 8012c08:	2b00      	cmp	r3, #0
 8012c0a:	d007      	beq.n	8012c1c <fn_08012B8C+0x90>
 8012c0c:	2407      	movs	r4, #7
 8012c0e:	e7db      	b.n	8012bc8 <fn_08012B8C+0x3c>
 8012c10:	0002      	movs	r2, r0
 8012c12:	6d8b      	ldr	r3, [r1, #88]	@ 0x58
 8012c14:	2b00      	cmp	r3, #0
 8012c16:	d030      	beq.n	8012c7a <fn_08012B8C+0xee>
 8012c18:	2400      	movs	r4, #0
 8012c1a:	e7d5      	b.n	8012bc8 <fn_08012B8C+0x3c>
 8012c1c:	3a01      	subs	r2, #1
 8012c1e:	2a00      	cmp	r2, #0
 8012c20:	d0d2      	beq.n	8012bc8 <fn_08012B8C+0x3c>
 8012c22:	6dcb      	ldr	r3, [r1, #92]	@ 0x5c
 8012c24:	2b00      	cmp	r3, #0
 8012c26:	d002      	beq.n	8012c2e <fn_08012B8C+0xa2>
 8012c28:	6fcb      	ldr	r3, [r1, #124]	@ 0x7c
 8012c2a:	2b00      	cmp	r3, #0
 8012c2c:	d12a      	bne.n	8012c84 <fn_08012B8C+0xf8>
 8012c2e:	1e50      	subs	r0, r2, #1
 8012c30:	2a01      	cmp	r2, #1
 8012c32:	d0c9      	beq.n	8012bc8 <fn_08012B8C+0x3c>
 8012c34:	6e0b      	ldr	r3, [r1, #96]	@ 0x60
 8012c36:	2b00      	cmp	r3, #0
 8012c38:	d02f      	beq.n	8012c9a <fn_08012B8C+0x10e>
 8012c3a:	2302      	movs	r3, #2
 8012c3c:	2280      	movs	r2, #128	@ 0x80
 8012c3e:	588a      	ldr	r2, [r1, r2]
 8012c40:	2a00      	cmp	r2, #0
 8012c42:	d1c0      	bne.n	8012bc6 <fn_08012B8C+0x3a>
 8012c44:	1e42      	subs	r2, r0, #1
 8012c46:	2801      	cmp	r0, #1
 8012c48:	d0be      	beq.n	8012bc8 <fn_08012B8C+0x3c>
 8012c4a:	3301      	adds	r3, #1
 8012c4c:	2b08      	cmp	r3, #8
 8012c4e:	d9c5      	bls.n	8012bdc <fn_08012B8C+0x50>
 8012c50:	0018      	movs	r0, r3
 8012c52:	3016      	adds	r0, #22
 8012c54:	0080      	lsls	r0, r0, #2
 8012c56:	5808      	ldr	r0, [r1, r0]
 8012c58:	2800      	cmp	r0, #0
 8012c5a:	d009      	beq.n	8012c70 <fn_08012B8C+0xe4>
 8012c5c:	0618      	lsls	r0, r3, #24
 8012c5e:	0e00      	lsrs	r0, r0, #24
 8012c60:	2808      	cmp	r0, #8
 8012c62:	d805      	bhi.n	8012c70 <fn_08012B8C+0xe4>
 8012c64:	4d4d      	ldr	r5, [pc, #308]	@ (8012d9c <fn_08012B8C+0x210>)
 8012c66:	0080      	lsls	r0, r0, #2
 8012c68:	5828      	ldr	r0, [r5, r0]
 8012c6a:	4687      	mov	pc, r0
 8012c6c:	002b      	movs	r3, r5
 8012c6e:	3a01      	subs	r2, #1
 8012c70:	3a01      	subs	r2, #1
 8012c72:	2a00      	cmp	r2, #0
 8012c74:	d000      	beq.n	8012c78 <fn_08012B8C+0xec>
 8012c76:	e791      	b.n	8012b9c <fn_08012B8C+0x10>
 8012c78:	e7a6      	b.n	8012bc8 <fn_08012B8C+0x3c>
 8012c7a:	3a01      	subs	r2, #1
 8012c7c:	3301      	adds	r3, #1
 8012c7e:	2a00      	cmp	r2, #0
 8012c80:	d1ac      	bne.n	8012bdc <fn_08012B8C+0x50>
 8012c82:	e7a1      	b.n	8012bc8 <fn_08012B8C+0x3c>
 8012c84:	2401      	movs	r4, #1
 8012c86:	e79f      	b.n	8012bc8 <fn_08012B8C+0x3c>
 8012c88:	2403      	movs	r4, #3
 8012c8a:	e79d      	b.n	8012bc8 <fn_08012B8C+0x3c>
 8012c8c:	3a02      	subs	r2, #2
 8012c8e:	2a00      	cmp	r2, #0
 8012c90:	d09a      	beq.n	8012bc8 <fn_08012B8C+0x3c>
 8012c92:	2305      	movs	r3, #5
 8012c94:	e7a0      	b.n	8012bd8 <fn_08012B8C+0x4c>
 8012c96:	2408      	movs	r4, #8
 8012c98:	e796      	b.n	8012bc8 <fn_08012B8C+0x3c>
 8012c9a:	3a02      	subs	r2, #2
 8012c9c:	2a00      	cmp	r2, #0
 8012c9e:	d093      	beq.n	8012bc8 <fn_08012B8C+0x3c>
 8012ca0:	2303      	movs	r3, #3
 8012ca2:	e79b      	b.n	8012bdc <fn_08012B8C+0x50>
 8012ca4:	483c      	ldr	r0, [pc, #240]	@ (8012d98 <fn_08012B8C+0x20c>)
 8012ca6:	6805      	ldr	r5, [r0, #0]
 8012ca8:	2094      	movs	r0, #148	@ 0x94
 8012caa:	5c28      	ldrb	r0, [r5, r0]
 8012cac:	2802      	cmp	r0, #2
 8012cae:	d058      	beq.n	8012d62 <fn_08012B8C+0x1d6>
 8012cb0:	2a01      	cmp	r2, #1
 8012cb2:	d100      	bne.n	8012cb6 <fn_08012B8C+0x12a>
 8012cb4:	e788      	b.n	8012bc8 <fn_08012B8C+0x3c>
 8012cb6:	3a02      	subs	r2, #2
 8012cb8:	2a00      	cmp	r2, #0
 8012cba:	d100      	bne.n	8012cbe <fn_08012B8C+0x132>
 8012cbc:	e784      	b.n	8012bc8 <fn_08012B8C+0x3c>
 8012cbe:	3302      	adds	r3, #2
 8012cc0:	e78a      	b.n	8012bd8 <fn_08012B8C+0x4c>
 8012cc2:	2084      	movs	r0, #132	@ 0x84
 8012cc4:	5808      	ldr	r0, [r1, r0]
 8012cc6:	2800      	cmp	r0, #0
 8012cc8:	d000      	beq.n	8012ccc <fn_08012B8C+0x140>
 8012cca:	e77c      	b.n	8012bc6 <fn_08012B8C+0x3a>
 8012ccc:	3a01      	subs	r2, #1
 8012cce:	2a00      	cmp	r2, #0
 8012cd0:	d100      	bne.n	8012cd4 <fn_08012B8C+0x148>
 8012cd2:	e779      	b.n	8012bc8 <fn_08012B8C+0x3c>
 8012cd4:	3301      	adds	r3, #1
 8012cd6:	0018      	movs	r0, r3
 8012cd8:	3016      	adds	r0, #22
 8012cda:	0080      	lsls	r0, r0, #2
 8012cdc:	5808      	ldr	r0, [r1, r0]
 8012cde:	2800      	cmp	r0, #0
 8012ce0:	d0c6      	beq.n	8012c70 <fn_08012B8C+0xe4>
 8012ce2:	1e50      	subs	r0, r2, #1
 8012ce4:	2a01      	cmp	r2, #1
 8012ce6:	d100      	bne.n	8012cea <fn_08012B8C+0x15e>
 8012ce8:	e76e      	b.n	8012bc8 <fn_08012B8C+0x3c>
 8012cea:	2b06      	cmp	r3, #6
 8012cec:	d090      	beq.n	8012c10 <fn_08012B8C+0x84>
 8012cee:	0018      	movs	r0, r3
 8012cf0:	3017      	adds	r0, #23
 8012cf2:	0080      	lsls	r0, r0, #2
 8012cf4:	5808      	ldr	r0, [r1, r0]
 8012cf6:	2800      	cmp	r0, #0
 8012cf8:	d047      	beq.n	8012d8a <fn_08012B8C+0x1fe>
 8012cfa:	1c5c      	adds	r4, r3, #1
 8012cfc:	e764      	b.n	8012bc8 <fn_08012B8C+0x3c>
 8012cfe:	6fc8      	ldr	r0, [r1, #124]	@ 0x7c
 8012d00:	2800      	cmp	r0, #0
 8012d02:	d000      	beq.n	8012d06 <fn_08012B8C+0x17a>
 8012d04:	e75f      	b.n	8012bc6 <fn_08012B8C+0x3a>
 8012d06:	2a01      	cmp	r2, #1
 8012d08:	d100      	bne.n	8012d0c <fn_08012B8C+0x180>
 8012d0a:	e75d      	b.n	8012bc8 <fn_08012B8C+0x3c>
 8012d0c:	1c58      	adds	r0, r3, #1
 8012d0e:	0005      	movs	r5, r0
 8012d10:	3016      	adds	r0, #22
 8012d12:	0080      	lsls	r0, r0, #2
 8012d14:	5808      	ldr	r0, [r1, r0]
 8012d16:	2800      	cmp	r0, #0
 8012d18:	d0a8      	beq.n	8012c6c <fn_08012B8C+0xe0>
 8012d1a:	2080      	movs	r0, #128	@ 0x80
 8012d1c:	5808      	ldr	r0, [r1, r0]
 8012d1e:	2800      	cmp	r0, #0
 8012d20:	d135      	bne.n	8012d8e <fn_08012B8C+0x202>
 8012d22:	3a02      	subs	r2, #2
 8012d24:	4282      	cmp	r2, r0
 8012d26:	d100      	bne.n	8012d2a <fn_08012B8C+0x19e>
 8012d28:	e74e      	b.n	8012bc8 <fn_08012B8C+0x3c>
 8012d2a:	3302      	adds	r3, #2
 8012d2c:	e790      	b.n	8012c50 <fn_08012B8C+0xc4>
 8012d2e:	6fc8      	ldr	r0, [r1, #124]	@ 0x7c
 8012d30:	2800      	cmp	r0, #0
 8012d32:	d000      	beq.n	8012d36 <fn_08012B8C+0x1aa>
 8012d34:	e747      	b.n	8012bc6 <fn_08012B8C+0x3a>
 8012d36:	3a01      	subs	r2, #1
 8012d38:	4282      	cmp	r2, r0
 8012d3a:	d100      	bne.n	8012d3e <fn_08012B8C+0x1b2>
 8012d3c:	e744      	b.n	8012bc8 <fn_08012B8C+0x3c>
 8012d3e:	3301      	adds	r3, #1
 8012d40:	e786      	b.n	8012c50 <fn_08012B8C+0xc4>
 8012d42:	4815      	ldr	r0, [pc, #84]	@ (8012d98 <fn_08012B8C+0x20c>)
 8012d44:	6805      	ldr	r5, [r0, #0]
 8012d46:	2094      	movs	r0, #148	@ 0x94
 8012d48:	5c28      	ldrb	r0, [r5, r0]
 8012d4a:	2800      	cmp	r0, #0
 8012d4c:	d0c9      	beq.n	8012ce2 <fn_08012B8C+0x156>
 8012d4e:	2084      	movs	r0, #132	@ 0x84
 8012d50:	5808      	ldr	r0, [r1, r0]
 8012d52:	2827      	cmp	r0, #39	@ 0x27
 8012d54:	ddc5      	ble.n	8012ce2 <fn_08012B8C+0x156>
 8012d56:	001c      	movs	r4, r3
 8012d58:	e736      	b.n	8012bc8 <fn_08012B8C+0x3c>
 8012d5a:	0010      	movs	r0, r2
 8012d5c:	e72f      	b.n	8012bbe <fn_08012B8C+0x32>
 8012d5e:	0010      	movs	r0, r2
 8012d60:	e76c      	b.n	8012c3c <fn_08012B8C+0xb0>
 8012d62:	2080      	movs	r0, #128	@ 0x80
 8012d64:	5808      	ldr	r0, [r1, r0]
 8012d66:	2801      	cmp	r0, #1
 8012d68:	dd00      	ble.n	8012d6c <fn_08012B8C+0x1e0>
 8012d6a:	e72c      	b.n	8012bc6 <fn_08012B8C+0x3a>
 8012d6c:	2a01      	cmp	r2, #1
 8012d6e:	d100      	bne.n	8012d72 <fn_08012B8C+0x1e6>
 8012d70:	e72a      	b.n	8012bc8 <fn_08012B8C+0x3c>
 8012d72:	0018      	movs	r0, r3
 8012d74:	3017      	adds	r0, #23
 8012d76:	0080      	lsls	r0, r0, #2
 8012d78:	5808      	ldr	r0, [r1, r0]
 8012d7a:	3a02      	subs	r2, #2
 8012d7c:	2800      	cmp	r0, #0
 8012d7e:	d19b      	bne.n	8012cb8 <fn_08012B8C+0x12c>
 8012d80:	4282      	cmp	r2, r0
 8012d82:	d100      	bne.n	8012d86 <fn_08012B8C+0x1fa>
 8012d84:	e720      	b.n	8012bc8 <fn_08012B8C+0x3c>
 8012d86:	3302      	adds	r3, #2
 8012d88:	e726      	b.n	8012bd8 <fn_08012B8C+0x4c>
 8012d8a:	3a02      	subs	r2, #2
 8012d8c:	e7f8      	b.n	8012d80 <fn_08012B8C+0x1f4>
 8012d8e:	002c      	movs	r4, r5
 8012d90:	e71a      	b.n	8012bc8 <fn_08012B8C+0x3c>
 8012d92:	46c0      	nop			@ (mov r8, r8)
 8012d94:	0812e700 	.word	0x0812e700
 8012d98:	030064c4 	.word	0x030064c4	@ data_030064C4
 8012d9c:	0812e724 	.word	0x0812e724
