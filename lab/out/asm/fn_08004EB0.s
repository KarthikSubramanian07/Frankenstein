fn_08004EB0:
 8004eb0:	b5f0      	push	{r4, r5, r6, r7, lr}
 8004eb2:	46c6      	mov	lr, r8
 8004eb4:	4b45      	ldr	r3, [pc, #276]	@ (8004fcc <fn_08004EB0+0x11c>)
 8004eb6:	b500      	push	{lr}
 8004eb8:	0018      	movs	r0, r3
 8004eba:	4698      	mov	r8, r3
 8004ebc:	f018 fae0 	bl	801d480 <fn_0801D480>
 8004ec0:	0007      	movs	r7, r0
 8004ec2:	f018 fb37 	bl	801d534 <fn_0801D534>
 8004ec6:	4c42      	ldr	r4, [pc, #264]	@ (8004fd0 <fn_08004EB0+0x120>)
 8004ec8:	4b42      	ldr	r3, [pc, #264]	@ (8004fd4 <fn_08004EB0+0x124>)
 8004eca:	6825      	ldr	r5, [r4, #0]
 8004ecc:	002e      	movs	r6, r5
 8004ece:	4298      	cmp	r0, r3
 8004ed0:	d005      	beq.n	8004ede <fn_08004EB0+0x2e>
 8004ed2:	0002      	movs	r2, r0
 8004ed4:	4641      	mov	r1, r8
 8004ed6:	4840      	ldr	r0, [pc, #256]	@ (8004fd8 <fn_08004EB0+0x128>)
 8004ed8:	f7fb fb66 	bl	80005a8 <fn_080005A8>
 8004edc:	6826      	ldr	r6, [r4, #0]
 8004ede:	0038      	movs	r0, r7
 8004ee0:	f018 fb42 	bl	801d568 <fn_0801D568>
 8004ee4:	4b3d      	ldr	r3, [pc, #244]	@ (8004fdc <fn_08004EB0+0x12c>)
 8004ee6:	50e8      	str	r0, [r5, r3]
 8004ee8:	4b3d      	ldr	r3, [pc, #244]	@ (8004fe0 <fn_08004EB0+0x130>)
 8004eea:	0018      	movs	r0, r3
 8004eec:	4698      	mov	r8, r3
 8004eee:	f018 fac7 	bl	801d480 <fn_0801D480>
 8004ef2:	0007      	movs	r7, r0
 8004ef4:	f018 fb1e 	bl	801d534 <fn_0801D534>
 8004ef8:	4b3a      	ldr	r3, [pc, #232]	@ (8004fe4 <fn_08004EB0+0x134>)
 8004efa:	0035      	movs	r5, r6
 8004efc:	4298      	cmp	r0, r3
 8004efe:	d005      	beq.n	8004f0c <fn_08004EB0+0x5c>
 8004f00:	0002      	movs	r2, r0
 8004f02:	4641      	mov	r1, r8
 8004f04:	4834      	ldr	r0, [pc, #208]	@ (8004fd8 <fn_08004EB0+0x128>)
 8004f06:	f7fb fb4f 	bl	80005a8 <fn_080005A8>
 8004f0a:	6825      	ldr	r5, [r4, #0]
 8004f0c:	0038      	movs	r0, r7
 8004f0e:	f018 fb2b 	bl	801d568 <fn_0801D568>
 8004f12:	23ea      	movs	r3, #234	@ 0xea
 8004f14:	00db      	lsls	r3, r3, #3
 8004f16:	50f0      	str	r0, [r6, r3]
 8004f18:	4b33      	ldr	r3, [pc, #204]	@ (8004fe8 <fn_08004EB0+0x138>)
 8004f1a:	0018      	movs	r0, r3
 8004f1c:	4698      	mov	r8, r3
 8004f1e:	f018 faaf 	bl	801d480 <fn_0801D480>
 8004f22:	0006      	movs	r6, r0
 8004f24:	f018 fb06 	bl	801d534 <fn_0801D534>
 8004f28:	002f      	movs	r7, r5
 8004f2a:	28d8      	cmp	r0, #216	@ 0xd8
 8004f2c:	d007      	beq.n	8004f3e <fn_08004EB0+0x8e>
 8004f2e:	4f2a      	ldr	r7, [pc, #168]	@ (8004fd8 <fn_08004EB0+0x128>)
 8004f30:	0002      	movs	r2, r0
 8004f32:	23d8      	movs	r3, #216	@ 0xd8
 8004f34:	0038      	movs	r0, r7
 8004f36:	4641      	mov	r1, r8
 8004f38:	f7fb fb36 	bl	80005a8 <fn_080005A8>
 8004f3c:	6827      	ldr	r7, [r4, #0]
 8004f3e:	0030      	movs	r0, r6
 8004f40:	f018 fb12 	bl	801d568 <fn_0801D568>
 8004f44:	4b29      	ldr	r3, [pc, #164]	@ (8004fec <fn_08004EB0+0x13c>)
 8004f46:	50e8      	str	r0, [r5, r3]
 8004f48:	4829      	ldr	r0, [pc, #164]	@ (8004ff0 <fn_08004EB0+0x140>)
 8004f4a:	f018 fa99 	bl	801d480 <fn_0801D480>
 8004f4e:	0005      	movs	r5, r0
 8004f50:	f018 faf0 	bl	801d534 <fn_0801D534>
 8004f54:	2854      	cmp	r0, #84	@ 0x54
 8004f56:	d005      	beq.n	8004f64 <fn_08004EB0+0xb4>
 8004f58:	0002      	movs	r2, r0
 8004f5a:	2354      	movs	r3, #84	@ 0x54
 8004f5c:	4924      	ldr	r1, [pc, #144]	@ (8004ff0 <fn_08004EB0+0x140>)
 8004f5e:	481e      	ldr	r0, [pc, #120]	@ (8004fd8 <fn_08004EB0+0x128>)
 8004f60:	f7fb fb22 	bl	80005a8 <fn_080005A8>
 8004f64:	0028      	movs	r0, r5
 8004f66:	f018 faff 	bl	801d568 <fn_0801D568>
 8004f6a:	23eb      	movs	r3, #235	@ 0xeb
 8004f6c:	00db      	lsls	r3, r3, #3
 8004f6e:	50f8      	str	r0, [r7, r3]
 8004f70:	4820      	ldr	r0, [pc, #128]	@ (8004ff4 <fn_08004EB0+0x144>)
 8004f72:	f018 fa85 	bl	801d480 <fn_0801D480>
 8004f76:	0005      	movs	r5, r0
 8004f78:	f018 faf6 	bl	801d568 <fn_0801D568>
 8004f7c:	0006      	movs	r6, r0
 8004f7e:	0028      	movs	r0, r5
 8004f80:	f018 fad8 	bl	801d534 <fn_0801D534>
 8004f84:	4b1c      	ldr	r3, [pc, #112]	@ (8004ff8 <fn_08004EB0+0x148>)
 8004f86:	4298      	cmp	r0, r3
 8004f88:	dd03      	ble.n	8004f92 <fn_08004EB0+0xe2>
 8004f8a:	6832      	ldr	r2, [r6, #0]
 8004f8c:	3301      	adds	r3, #1
 8004f8e:	429a      	cmp	r2, r3
 8004f90:	d003      	beq.n	8004f9a <fn_08004EB0+0xea>
 8004f92:	21eb      	movs	r1, #235	@ 0xeb
 8004f94:	4819      	ldr	r0, [pc, #100]	@ (8004ffc <fn_08004EB0+0x14c>)
 8004f96:	f7fb fb07 	bl	80005a8 <fn_080005A8>
 8004f9a:	6824      	ldr	r4, [r4, #0]
 8004f9c:	4b18      	ldr	r3, [pc, #96]	@ (8005000 <fn_08004EB0+0x150>)
 8004f9e:	50e6      	str	r6, [r4, r3]
 8004fa0:	3b0c      	subs	r3, #12
 8004fa2:	58e0      	ldr	r0, [r4, r3]
 8004fa4:	25ec      	movs	r5, #236	@ 0xec
 8004fa6:	0003      	movs	r3, r0
 8004fa8:	4a16      	ldr	r2, [pc, #88]	@ (8005004 <fn_08004EB0+0x154>)
 8004faa:	00ed      	lsls	r5, r5, #3
 8004fac:	5961      	ldr	r1, [r4, r5]
 8004fae:	3340      	adds	r3, #64	@ 0x40
 8004fb0:	1880      	adds	r0, r0, r2
 8004fb2:	681a      	ldr	r2, [r3, #0]
 8004fb4:	428a      	cmp	r2, r1
 8004fb6:	dd01      	ble.n	8004fbc <fn_08004EB0+0x10c>
 8004fb8:	0011      	movs	r1, r2
 8004fba:	5162      	str	r2, [r4, r5]
 8004fbc:	335c      	adds	r3, #92	@ 0x5c
 8004fbe:	4298      	cmp	r0, r3
 8004fc0:	d1f7      	bne.n	8004fb2 <fn_08004EB0+0x102>
 8004fc2:	bc80      	pop	{r7}
 8004fc4:	46b8      	mov	r8, r7
 8004fc6:	bcf0      	pop	{r4, r5, r6, r7}
 8004fc8:	bc01      	pop	{r0}
 8004fca:	4700      	bx	r0
 8004fcc:	08149648 	.word	0x08149648
 8004fd0:	030064c4 	.word	0x030064c4
 8004fd4:	00002a08 	.word	0x00002a08
 8004fd8:	08149654 	.word	0x08149654
 8004fdc:	0000074c 	.word	0x0000074c
 8004fe0:	081496a4 	.word	0x081496a4
 8004fe4:	00003198 	.word	0x00003198
 8004fe8:	081496ac 	.word	0x081496ac
 8004fec:	00000754 	.word	0x00000754
 8004ff0:	081496b4 	.word	0x081496b4
 8004ff4:	081496bc 	.word	0x081496bc
 8004ff8:	000003ab 	.word	0x000003ab
 8004ffc:	081496c4 	.word	0x081496c4
 8005000:	0000075c 	.word	0x0000075c
 8005004:	000031d8 	.word	0x000031d8
