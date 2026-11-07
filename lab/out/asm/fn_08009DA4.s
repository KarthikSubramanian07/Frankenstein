fn_08009DA4:
 8009da4:	4b36      	ldr	r3, [pc, #216]	@ (8009e80 <fn_08009DA4+0xdc>)
 8009da6:	681a      	ldr	r2, [r3, #0]
 8009da8:	23ea      	movs	r3, #234	@ 0xea
 8009daa:	b5f0      	push	{r4, r5, r6, r7, lr}
 8009dac:	46c6      	mov	lr, r8
 8009dae:	00db      	lsls	r3, r3, #3
 8009db0:	58d2      	ldr	r2, [r2, r3]
 8009db2:	235a      	movs	r3, #90	@ 0x5a
 8009db4:	b500      	push	{lr}
 8009db6:	0ccd      	lsrs	r5, r1, #19
 8009db8:	5cc1      	ldrb	r1, [r0, r3]
 8009dba:	3302      	adds	r3, #2
 8009dbc:	434b      	muls	r3, r1
 8009dbe:	21cf      	movs	r1, #207	@ 0xcf
 8009dc0:	00c9      	lsls	r1, r1, #3
 8009dc2:	1851      	adds	r1, r2, r1
 8009dc4:	18d3      	adds	r3, r2, r3
 8009dc6:	6c1a      	ldr	r2, [r3, #64]	@ 0x40
 8009dc8:	6c0b      	ldr	r3, [r1, #64]	@ 0x40
 8009dca:	18d2      	adds	r2, r2, r3
 8009dcc:	0053      	lsls	r3, r2, #1
 8009dce:	189b      	adds	r3, r3, r2
 8009dd0:	0fdc      	lsrs	r4, r3, #31
 8009dd2:	18e4      	adds	r4, r4, r3
 8009dd4:	2380      	movs	r3, #128	@ 0x80
 8009dd6:	1062      	asrs	r2, r4, #1
 8009dd8:	02db      	lsls	r3, r3, #11
 8009dda:	18d2      	adds	r2, r2, r3
 8009ddc:	2380      	movs	r3, #128	@ 0x80
 8009dde:	011b      	lsls	r3, r3, #4
 8009de0:	4c28      	ldr	r4, [pc, #160]	@ (8009e84 <fn_08009DA4+0xe0>)
 8009de2:	18eb      	adds	r3, r5, r3
 8009de4:	009b      	lsls	r3, r3, #2
 8009de6:	b082      	sub	sp, #8
 8009de8:	0006      	movs	r6, r0
 8009dea:	58e1      	ldr	r1, [r4, r3]
 8009dec:	68c7      	ldr	r7, [r0, #12]
 8009dee:	0010      	movs	r0, r2
 8009df0:	4690      	mov	r8, r2
 8009df2:	f01b fc4b 	bl	802568c <fn_0802568C>
 8009df6:	00ad      	lsls	r5, r5, #2
 8009df8:	6933      	ldr	r3, [r6, #16]
 8009dfa:	5929      	ldr	r1, [r5, r4]
 8009dfc:	183f      	adds	r7, r7, r0
 8009dfe:	4640      	mov	r0, r8
 8009e00:	9301      	str	r3, [sp, #4]
 8009e02:	f01b fc43 	bl	802568c <fn_0802568C>
 8009e06:	9b01      	ldr	r3, [sp, #4]
 8009e08:	181c      	adds	r4, r3, r0
 8009e0a:	0022      	movs	r2, r4
 8009e0c:	0039      	movs	r1, r7
 8009e0e:	0030      	movs	r0, r6
 8009e10:	6975      	ldr	r5, [r6, #20]
 8009e12:	f005 fa71 	bl	800f2f8 <fn_0800F2F8>
 8009e16:	2800      	cmp	r0, #0
 8009e18:	d005      	beq.n	8009e26 <fn_08009DA4+0x82>
 8009e1a:	b002      	add	sp, #8
 8009e1c:	bc80      	pop	{r7}
 8009e1e:	46b8      	mov	r8, r7
 8009e20:	bcf0      	pop	{r4, r5, r6, r7}
 8009e22:	bc01      	pop	{r0}
 8009e24:	4700      	bx	r0
 8009e26:	2380      	movs	r3, #128	@ 0x80
 8009e28:	031b      	lsls	r3, r3, #12
 8009e2a:	0021      	movs	r1, r4
 8009e2c:	18ea      	adds	r2, r5, r3
 8009e2e:	0038      	movs	r0, r7
 8009e30:	2312      	movs	r3, #18
 8009e32:	f006 ffdb 	bl	8010dec <fn_08010DEC>
 8009e36:	6ac1      	ldr	r1, [r0, #44]	@ 0x2c
 8009e38:	0004      	movs	r4, r0
 8009e3a:	6942      	ldr	r2, [r0, #20]
 8009e3c:	684b      	ldr	r3, [r1, #4]
 8009e3e:	6b80      	ldr	r0, [r0, #56]	@ 0x38
 8009e40:	1a1b      	subs	r3, r3, r0
 8009e42:	429a      	cmp	r2, r3
 8009e44:	dc02      	bgt.n	8009e4c <fn_08009DA4+0xa8>
 8009e46:	680b      	ldr	r3, [r1, #0]
 8009e48:	429a      	cmp	r2, r3
 8009e4a:	da06      	bge.n	8009e5a <fn_08009DA4+0xb6>
 8009e4c:	0032      	movs	r2, r6
 8009e4e:	0031      	movs	r1, r6
 8009e50:	0020      	movs	r0, r4
 8009e52:	4b0d      	ldr	r3, [pc, #52]	@ (8009e88 <fn_08009DA4+0xe4>)
 8009e54:	f003 fdb2 	bl	800d9bc <fn_0800D9BC>
 8009e58:	e7df      	b.n	8009e1a <fn_08009DA4+0x76>
 8009e5a:	2300      	movs	r3, #0
 8009e5c:	0020      	movs	r0, r4
 8009e5e:	6922      	ldr	r2, [r4, #16]
 8009e60:	68e1      	ldr	r1, [r4, #12]
 8009e62:	f005 fc15 	bl	800f690 <fn_0800F690>
 8009e66:	2800      	cmp	r0, #0
 8009e68:	d0f0      	beq.n	8009e4c <fn_08009DA4+0xa8>
 8009e6a:	0020      	movs	r0, r4
 8009e6c:	6d31      	ldr	r1, [r6, #80]	@ 0x50
 8009e6e:	3050      	adds	r0, #80	@ 0x50
 8009e70:	f00e fbf8 	bl	8018664 <fn_08018664>
 8009e74:	2100      	movs	r1, #0
 8009e76:	0020      	movs	r0, r4
 8009e78:	f7ff ff24 	bl	8009cc4 <fn_08009CC4>
 8009e7c:	e7cd      	b.n	8009e1a <fn_08009DA4+0x76>
 8009e7e:	46c0      	nop			@ (mov r8, r8)
 8009e80:	030064c4 	.word	0x030064c4
 8009e84:	081398a0 	.word	0x081398a0
 8009e88:	00002710 	.word	0x00002710
