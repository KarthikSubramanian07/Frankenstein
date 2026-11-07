fn_0800E9C8:
 800e9c8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800e9ca:	4657      	mov	r7, sl
 800e9cc:	4645      	mov	r5, r8
 800e9ce:	46de      	mov	lr, fp
 800e9d0:	464e      	mov	r6, r9
 800e9d2:	b5e0      	push	{r5, r6, r7, lr}
 800e9d4:	000f      	movs	r7, r1
 800e9d6:	6cc1      	ldr	r1, [r0, #76]	@ 0x4c
 800e9d8:	0004      	movs	r4, r0
 800e9da:	0015      	movs	r5, r2
 800e9dc:	469a      	mov	sl, r3
 800e9de:	04cb      	lsls	r3, r1, #19
 800e9e0:	d44d      	bmi.n	800ea7e <fn_0800E9C8+0xb6>
 800e9e2:	4b65      	ldr	r3, [pc, #404]	@ (800eb78 <fn_0800E9C8+0x1b0>)
 800e9e4:	681a      	ldr	r2, [r3, #0]
 800e9e6:	4698      	mov	r8, r3
 800e9e8:	4b64      	ldr	r3, [pc, #400]	@ (800eb7c <fn_0800E9C8+0x1b4>)
 800e9ea:	58d0      	ldr	r0, [r2, r3]
 800e9ec:	3b04      	subs	r3, #4
 800e9ee:	58d3      	ldr	r3, [r2, r3]
 800e9f0:	469c      	mov	ip, r3
 800e9f2:	4666      	mov	r6, ip
 800e9f4:	6ba3      	ldr	r3, [r4, #56]	@ 0x38
 800e9f6:	1b86      	subs	r6, r0, r6
 800e9f8:	4699      	mov	r9, r3
 800e9fa:	429e      	cmp	r6, r3
 800e9fc:	db27      	blt.n	800ea4e <fn_0800E9C8+0x86>
 800e9fe:	2301      	movs	r3, #1
 800ea00:	4e5f      	ldr	r6, [pc, #380]	@ (800eb80 <fn_0800E9C8+0x1b8>)
 800ea02:	5593      	strb	r3, [r2, r6]
 800ea04:	040b      	lsls	r3, r1, #16
 800ea06:	d409      	bmi.n	800ea1c <fn_0800E9C8+0x54>
 800ea08:	6963      	ldr	r3, [r4, #20]
 800ea0a:	1ac0      	subs	r0, r0, r3
 800ea0c:	4581      	cmp	r9, r0
 800ea0e:	dc1e      	bgt.n	800ea4e <fn_0800E9C8+0x86>
 800ea10:	4660      	mov	r0, ip
 800ea12:	1ac3      	subs	r3, r0, r3
 800ea14:	20c0      	movs	r0, #192	@ 0xc0
 800ea16:	0340      	lsls	r0, r0, #13
 800ea18:	4283      	cmp	r3, r0
 800ea1a:	dc18      	bgt.n	800ea4e <fn_0800E9C8+0x86>
 800ea1c:	2388      	movs	r3, #136	@ 0x88
 800ea1e:	01db      	lsls	r3, r3, #7
 800ea20:	4219      	tst	r1, r3
 800ea22:	d12e      	bne.n	800ea82 <fn_0800E9C8+0xba>
 800ea24:	4653      	mov	r3, sl
 800ea26:	2b00      	cmp	r3, #0
 800ea28:	d000      	beq.n	800ea2c <fn_0800E9C8+0x64>
 800ea2a:	e093      	b.n	800eb54 <fn_0800E9C8+0x18c>
 800ea2c:	4b55      	ldr	r3, [pc, #340]	@ (800eb84 <fn_0800E9C8+0x1bc>)
 800ea2e:	58d3      	ldr	r3, [r2, r3]
 800ea30:	4662      	mov	r2, ip
 800ea32:	1ad3      	subs	r3, r2, r3
 800ea34:	22c0      	movs	r2, #192	@ 0xc0
 800ea36:	0352      	lsls	r2, r2, #13
 800ea38:	4293      	cmp	r3, r2
 800ea3a:	dd22      	ble.n	800ea82 <fn_0800E9C8+0xba>
 800ea3c:	2000      	movs	r0, #0
 800ea3e:	bcf0      	pop	{r4, r5, r6, r7}
 800ea40:	46bb      	mov	fp, r7
 800ea42:	46b2      	mov	sl, r6
 800ea44:	46a9      	mov	r9, r5
 800ea46:	46a0      	mov	r8, r4
 800ea48:	bcf8      	pop	{r3, r4, r5, r6, r7}
 800ea4a:	bc02      	pop	{r1}
 800ea4c:	4708      	bx	r1
 800ea4e:	4b4e      	ldr	r3, [pc, #312]	@ (800eb88 <fn_0800E9C8+0x1c0>)
 800ea50:	58d3      	ldr	r3, [r2, r3]
 800ea52:	2b00      	cmp	r3, #0
 800ea54:	d0f2      	beq.n	800ea3c <fn_0800E9C8+0x74>
 800ea56:	4b4d      	ldr	r3, [pc, #308]	@ (800eb8c <fn_0800E9C8+0x1c4>)
 800ea58:	58d0      	ldr	r0, [r2, r3]
 800ea5a:	2800      	cmp	r0, #0
 800ea5c:	d005      	beq.n	800ea6a <fn_0800E9C8+0xa2>
 800ea5e:	f7ff fd95 	bl	800e58c <fn_0800E58C>
 800ea62:	2800      	cmp	r0, #0
 800ea64:	d1ea      	bne.n	800ea3c <fn_0800E9C8+0x74>
 800ea66:	4643      	mov	r3, r8
 800ea68:	681a      	ldr	r2, [r3, #0]
 800ea6a:	4b49      	ldr	r3, [pc, #292]	@ (800eb90 <fn_0800E9C8+0x1c8>)
 800ea6c:	58d0      	ldr	r0, [r2, r3]
 800ea6e:	2800      	cmp	r0, #0
 800ea70:	d06e      	beq.n	800eb50 <fn_0800E9C8+0x188>
 800ea72:	f7ff fd8b 	bl	800e58c <fn_0800E58C>
 800ea76:	2301      	movs	r3, #1
 800ea78:	4383      	bics	r3, r0
 800ea7a:	0018      	movs	r0, r3
 800ea7c:	e7df      	b.n	800ea3e <fn_0800E9C8+0x76>
 800ea7e:	4b3e      	ldr	r3, [pc, #248]	@ (800eb78 <fn_0800E9C8+0x1b0>)
 800ea80:	4698      	mov	r8, r3
 800ea82:	0020      	movs	r0, r4
 800ea84:	f001 fb2e 	bl	80100e4 <fn_080100E4>
 800ea88:	68e3      	ldr	r3, [r4, #12]
 800ea8a:	469a      	mov	sl, r3
 800ea8c:	6923      	ldr	r3, [r4, #16]
 800ea8e:	469b      	mov	fp, r3
 800ea90:	4643      	mov	r3, r8
 800ea92:	228b      	movs	r2, #139	@ 0x8b
 800ea94:	681b      	ldr	r3, [r3, #0]
 800ea96:	0112      	lsls	r2, r2, #4
 800ea98:	589a      	ldr	r2, [r3, r2]
 800ea9a:	6322      	str	r2, [r4, #48]	@ 0x30
 800ea9c:	4a37      	ldr	r2, [pc, #220]	@ (800eb7c <fn_0800E9C8+0x1b4>)
 800ea9e:	589a      	ldr	r2, [r3, r2]
 800eaa0:	6362      	str	r2, [r4, #52]	@ 0x34
 800eaa2:	4a3c      	ldr	r2, [pc, #240]	@ (800eb94 <fn_0800E9C8+0x1cc>)
 800eaa4:	0020      	movs	r0, r4
 800eaa6:	5899      	ldr	r1, [r3, r2]
 800eaa8:	60e7      	str	r7, [r4, #12]
 800eaaa:	6125      	str	r5, [r4, #16]
 800eaac:	f001 fb88 	bl	80101c0 <fn_080101C0>
 800eab0:	2390      	movs	r3, #144	@ 0x90
 800eab2:	6ce2      	ldr	r2, [r4, #76]	@ 0x4c
 800eab4:	021b      	lsls	r3, r3, #8
 800eab6:	421a      	tst	r2, r3
 800eab8:	d14a      	bne.n	800eb50 <fn_0800E9C8+0x188>
 800eaba:	4643      	mov	r3, r8
 800eabc:	4d36      	ldr	r5, [pc, #216]	@ (800eb98 <fn_0800E9C8+0x1d0>)
 800eabe:	6819      	ldr	r1, [r3, #0]
 800eac0:	594b      	ldr	r3, [r1, r5]
 800eac2:	1e58      	subs	r0, r3, #1
 800eac4:	5148      	str	r0, [r1, r5]
 800eac6:	2b00      	cmp	r3, #0
 800eac8:	d042      	beq.n	800eb50 <fn_0800E9C8+0x188>
 800eaca:	2340      	movs	r3, #64	@ 0x40
 800eacc:	4699      	mov	r9, r3
 800eace:	e02b      	b.n	800eb28 <fn_0800E9C8+0x160>
 800ead0:	271a      	movs	r7, #26
 800ead2:	5fd6      	ldrsh	r6, [r2, r7]
 800ead4:	09db      	lsrs	r3, r3, #7
 800ead6:	021b      	lsls	r3, r3, #8
 800ead8:	429e      	cmp	r6, r3
 800eada:	d034      	beq.n	800eb46 <fn_0800E9C8+0x17e>
 800eadc:	4659      	mov	r1, fp
 800eade:	4650      	mov	r0, sl
 800eae0:	f001 f99c 	bl	800fe1c <fn_0800FE1C>
 800eae4:	4643      	mov	r3, r8
 800eae6:	681a      	ldr	r2, [r3, #0]
 800eae8:	492c      	ldr	r1, [pc, #176]	@ (800eb9c <fn_0800E9C8+0x1d4>)
 800eaea:	5953      	ldr	r3, [r2, r5]
 800eaec:	185b      	adds	r3, r3, r1
 800eaee:	009b      	lsls	r3, r3, #2
 800eaf0:	18d2      	adds	r2, r2, r3
 800eaf2:	6921      	ldr	r1, [r4, #16]
 800eaf4:	0006      	movs	r6, r0
 800eaf6:	6852      	ldr	r2, [r2, #4]
 800eaf8:	68e0      	ldr	r0, [r4, #12]
 800eafa:	f001 f98f 	bl	800fe1c <fn_0800FE1C>
 800eafe:	4643      	mov	r3, r8
 800eb00:	6819      	ldr	r1, [r3, #0]
 800eb02:	594b      	ldr	r3, [r1, r5]
 800eb04:	4286      	cmp	r6, r0
 800eb06:	d00b      	beq.n	800eb20 <fn_0800E9C8+0x158>
 800eb08:	4a24      	ldr	r2, [pc, #144]	@ (800eb9c <fn_0800E9C8+0x1d4>)
 800eb0a:	189b      	adds	r3, r3, r2
 800eb0c:	009b      	lsls	r3, r3, #2
 800eb0e:	18cb      	adds	r3, r1, r3
 800eb10:	6858      	ldr	r0, [r3, #4]
 800eb12:	0031      	movs	r1, r6
 800eb14:	0022      	movs	r2, r4
 800eb16:	f006 fcfb 	bl	8015510 <fn_08015510>
 800eb1a:	4643      	mov	r3, r8
 800eb1c:	6819      	ldr	r1, [r3, #0]
 800eb1e:	594b      	ldr	r3, [r1, r5]
 800eb20:	1e58      	subs	r0, r3, #1
 800eb22:	5148      	str	r0, [r1, r5]
 800eb24:	2b00      	cmp	r3, #0
 800eb26:	d013      	beq.n	800eb50 <fn_0800E9C8+0x188>
 800eb28:	4b1c      	ldr	r3, [pc, #112]	@ (800eb9c <fn_0800E9C8+0x1d4>)
 800eb2a:	18c3      	adds	r3, r0, r3
 800eb2c:	009b      	lsls	r3, r3, #2
 800eb2e:	18cb      	adds	r3, r1, r3
 800eb30:	685a      	ldr	r2, [r3, #4]
 800eb32:	8bd3      	ldrh	r3, [r2, #30]
 800eb34:	009b      	lsls	r3, r3, #2
 800eb36:	469c      	mov	ip, r3
 800eb38:	464e      	mov	r6, r9
 800eb3a:	4b19      	ldr	r3, [pc, #100]	@ (800eba0 <fn_0800E9C8+0x1d8>)
 800eb3c:	58cb      	ldr	r3, [r1, r3]
 800eb3e:	4463      	add	r3, ip
 800eb40:	78db      	ldrb	r3, [r3, #3]
 800eb42:	421e      	tst	r6, r3
 800eb44:	d0c4      	beq.n	800ead0 <fn_0800E9C8+0x108>
 800eb46:	0003      	movs	r3, r0
 800eb48:	1e58      	subs	r0, r3, #1
 800eb4a:	5148      	str	r0, [r1, r5]
 800eb4c:	2b00      	cmp	r3, #0
 800eb4e:	d1eb      	bne.n	800eb28 <fn_0800E9C8+0x160>
 800eb50:	2001      	movs	r0, #1
 800eb52:	e774      	b.n	800ea3e <fn_0800E9C8+0x76>
 800eb54:	2300      	movs	r3, #0
 800eb56:	0589      	lsls	r1, r1, #22
 800eb58:	d40a      	bmi.n	800eb70 <fn_0800E9C8+0x1a8>
 800eb5a:	4663      	mov	r3, ip
 800eb5c:	20c0      	movs	r0, #192	@ 0xc0
 800eb5e:	6961      	ldr	r1, [r4, #20]
 800eb60:	0340      	lsls	r0, r0, #13
 800eb62:	1ac9      	subs	r1, r1, r3
 800eb64:	2301      	movs	r3, #1
 800eb66:	4281      	cmp	r1, r0
 800eb68:	dc00      	bgt.n	800eb6c <fn_0800E9C8+0x1a4>
 800eb6a:	2300      	movs	r3, #0
 800eb6c:	061b      	lsls	r3, r3, #24
 800eb6e:	0e1b      	lsrs	r3, r3, #24
 800eb70:	490c      	ldr	r1, [pc, #48]	@ (800eba4 <fn_0800E9C8+0x1dc>)
 800eb72:	5453      	strb	r3, [r2, r1]
 800eb74:	e785      	b.n	800ea82 <fn_0800E9C8+0xba>
 800eb76:	46c0      	nop			@ (mov r8, r8)
 800eb78:	030064c4 	.word	0x030064c4
 800eb7c:	000008b4 	.word	0x000008b4
 800eb80:	00000924 	.word	0x00000924
 800eb84:	000008b8 	.word	0x000008b8
 800eb88:	000008c8 	.word	0x000008c8
 800eb8c:	000008bc 	.word	0x000008bc
 800eb90:	000008c4 	.word	0x000008c4
 800eb94:	000008ac 	.word	0x000008ac
 800eb98:	000008dc 	.word	0x000008dc
 800eb9c:	00000232 	.word	0x00000232
 800eba0:	00000e04 	.word	0x00000e04
 800eba4:	00000925 	.word	0x00000925
