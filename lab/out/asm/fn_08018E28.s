fn_08018E28:
 8018e28:	b570      	push	{r4, r5, r6, lr}
 8018e2a:	485d      	ldr	r0, [pc, #372]	@ (8018fa0 <fn_08018E28+0x178>)
 8018e2c:	f7ec fafa 	bl	8005424 <fn_08005424>
 8018e30:	485c      	ldr	r0, [pc, #368]	@ (8018fa4 <fn_08018E28+0x17c>)
 8018e32:	f004 fb25 	bl	801d480 <fn_0801D480>
 8018e36:	f004 fb97 	bl	801d568 <fn_0801D568>
 8018e3a:	6805      	ldr	r5, [r0, #0]
 8018e3c:	485a      	ldr	r0, [pc, #360]	@ (8018fa8 <fn_08018E28+0x180>)
 8018e3e:	f004 faf9 	bl	801d434 <fn_0801D434>
 8018e42:	3001      	adds	r0, #1
 8018e44:	d006      	beq.n	8018e54 <fn_08018E28+0x2c>
 8018e46:	4858      	ldr	r0, [pc, #352]	@ (8018fa8 <fn_08018E28+0x180>)
 8018e48:	f004 fb1a 	bl	801d480 <fn_0801D480>
 8018e4c:	f004 fb8c 	bl	801d568 <fn_0801D568>
 8018e50:	6803      	ldr	r3, [r0, #0]
 8018e52:	18ed      	adds	r5, r5, r3
 8018e54:	4c55      	ldr	r4, [pc, #340]	@ (8018fac <fn_08018E28+0x184>)
 8018e56:	4b56      	ldr	r3, [pc, #344]	@ (8018fb0 <fn_08018E28+0x188>)
 8018e58:	6822      	ldr	r2, [r4, #0]
 8018e5a:	4e56      	ldr	r6, [pc, #344]	@ (8018fb4 <fn_08018E28+0x18c>)
 8018e5c:	50d5      	str	r5, [r2, r3]
 8018e5e:	0030      	movs	r0, r6
 8018e60:	f004 fae8 	bl	801d434 <fn_0801D434>
 8018e64:	3001      	adds	r0, #1
 8018e66:	d007      	beq.n	8018e78 <fn_08018E28+0x50>
 8018e68:	0030      	movs	r0, r6
 8018e6a:	f004 fb09 	bl	801d480 <fn_0801D480>
 8018e6e:	f004 fb7b 	bl	801d568 <fn_0801D568>
 8018e72:	6803      	ldr	r3, [r0, #0]
 8018e74:	42ab      	cmp	r3, r5
 8018e76:	d005      	beq.n	8018e84 <fn_08018E28+0x5c>
 8018e78:	484f      	ldr	r0, [pc, #316]	@ (8018fb8 <fn_08018E28+0x190>)
 8018e7a:	f7e7 fb95 	bl	80005a8 <fn_080005A8>
 8018e7e:	6822      	ldr	r2, [r4, #0]
 8018e80:	4b4b      	ldr	r3, [pc, #300]	@ (8018fb0 <fn_08018E28+0x188>)
 8018e82:	58d5      	ldr	r5, [r2, r3]
 8018e84:	484d      	ldr	r0, [pc, #308]	@ (8018fbc <fn_08018E28+0x194>)
 8018e86:	f004 fafb 	bl	801d480 <fn_0801D480>
 8018e8a:	f004 fb6d 	bl	801d568 <fn_0801D568>
 8018e8e:	4b4c      	ldr	r3, [pc, #304]	@ (8018fc0 <fn_08018E28+0x198>)
 8018e90:	6018      	str	r0, [r3, #0]
 8018e92:	484c      	ldr	r0, [pc, #304]	@ (8018fc4 <fn_08018E28+0x19c>)
 8018e94:	f004 faf4 	bl	801d480 <fn_0801D480>
 8018e98:	f004 fb66 	bl	801d568 <fn_0801D568>
 8018e9c:	4b4a      	ldr	r3, [pc, #296]	@ (8018fc8 <fn_08018E28+0x1a0>)
 8018e9e:	2200      	movs	r2, #0
 8018ea0:	6018      	str	r0, [r3, #0]
 8018ea2:	2101      	movs	r1, #1
 8018ea4:	00a8      	lsls	r0, r5, #2
 8018ea6:	f004 fbe9 	bl	801d67c <fn_0801D67C>
 8018eaa:	4b48      	ldr	r3, [pc, #288]	@ (8018fcc <fn_08018E28+0x1a4>)
 8018eac:	4d40      	ldr	r5, [pc, #256]	@ (8018fb0 <fn_08018E28+0x188>)
 8018eae:	6018      	str	r0, [r3, #0]
 8018eb0:	6823      	ldr	r3, [r4, #0]
 8018eb2:	595a      	ldr	r2, [r3, r5]
 8018eb4:	2100      	movs	r1, #0
 8018eb6:	0092      	lsls	r2, r2, #2
 8018eb8:	f007 fd6a 	bl	8020990 <fn_08020990>
 8018ebc:	6823      	ldr	r3, [r4, #0]
 8018ebe:	5958      	ldr	r0, [r3, r5]
 8018ec0:	2200      	movs	r2, #0
 8018ec2:	2101      	movs	r1, #1
 8018ec4:	0080      	lsls	r0, r0, #2
 8018ec6:	f004 fbd9 	bl	801d67c <fn_0801D67C>
 8018eca:	4b41      	ldr	r3, [pc, #260]	@ (8018fd0 <fn_08018E28+0x1a8>)
 8018ecc:	6018      	str	r0, [r3, #0]
 8018ece:	6823      	ldr	r3, [r4, #0]
 8018ed0:	595a      	ldr	r2, [r3, r5]
 8018ed2:	2100      	movs	r1, #0
 8018ed4:	0092      	lsls	r2, r2, #2
 8018ed6:	f007 fd5b 	bl	8020990 <fn_08020990>
 8018eda:	6823      	ldr	r3, [r4, #0]
 8018edc:	5958      	ldr	r0, [r3, r5]
 8018ede:	3001      	adds	r0, #1
 8018ee0:	2101      	movs	r1, #1
 8018ee2:	2200      	movs	r2, #0
 8018ee4:	0040      	lsls	r0, r0, #1
 8018ee6:	f004 fbc9 	bl	801d67c <fn_0801D67C>
 8018eea:	4b3a      	ldr	r3, [pc, #232]	@ (8018fd4 <fn_08018E28+0x1ac>)
 8018eec:	6018      	str	r0, [r3, #0]
 8018eee:	6823      	ldr	r3, [r4, #0]
 8018ef0:	5959      	ldr	r1, [r3, r5]
 8018ef2:	2900      	cmp	r1, #0
 8018ef4:	dd05      	ble.n	8018f02 <fn_08018E28+0xda>
 8018ef6:	2300      	movs	r3, #0
 8018ef8:	005a      	lsls	r2, r3, #1
 8018efa:	5283      	strh	r3, [r0, r2]
 8018efc:	3301      	adds	r3, #1
 8018efe:	428b      	cmp	r3, r1
 8018f00:	d1fa      	bne.n	8018ef8 <fn_08018E28+0xd0>
 8018f02:	4835      	ldr	r0, [pc, #212]	@ (8018fd8 <fn_08018E28+0x1b0>)
 8018f04:	f7ec fa8e 	bl	8005424 <fn_08005424>
 8018f08:	4834      	ldr	r0, [pc, #208]	@ (8018fdc <fn_08018E28+0x1b4>)
 8018f0a:	f004 fab9 	bl	801d480 <fn_0801D480>
 8018f0e:	2388      	movs	r3, #136	@ 0x88
 8018f10:	6826      	ldr	r6, [r4, #0]
 8018f12:	1c45      	adds	r5, r0, #1
 8018f14:	015b      	lsls	r3, r3, #5
 8018f16:	50f5      	str	r5, [r6, r3]
 8018f18:	4831      	ldr	r0, [pc, #196]	@ (8018fe0 <fn_08018E28+0x1b8>)
 8018f1a:	f004 fab1 	bl	801d480 <fn_0801D480>
 8018f1e:	2380      	movs	r3, #128	@ 0x80
 8018f20:	1b41      	subs	r1, r0, r5
 8018f22:	4d30      	ldr	r5, [pc, #192]	@ (8018fe4 <fn_08018E28+0x1bc>)
 8018f24:	00db      	lsls	r3, r3, #3
 8018f26:	5171      	str	r1, [r6, r5]
 8018f28:	4299      	cmp	r1, r3
 8018f2a:	dc33      	bgt.n	8018f94 <fn_08018E28+0x16c>
 8018f2c:	3101      	adds	r1, #1
 8018f2e:	2200      	movs	r2, #0
 8018f30:	0048      	lsls	r0, r1, #1
 8018f32:	2101      	movs	r1, #1
 8018f34:	f004 fba2 	bl	801d67c <fn_0801D67C>
 8018f38:	4b2b      	ldr	r3, [pc, #172]	@ (8018fe8 <fn_08018E28+0x1c0>)
 8018f3a:	6822      	ldr	r2, [r4, #0]
 8018f3c:	6018      	str	r0, [r3, #0]
 8018f3e:	4b29      	ldr	r3, [pc, #164]	@ (8018fe4 <fn_08018E28+0x1bc>)
 8018f40:	58d1      	ldr	r1, [r2, r3]
 8018f42:	2900      	cmp	r1, #0
 8018f44:	dd05      	ble.n	8018f52 <fn_08018E28+0x12a>
 8018f46:	2300      	movs	r3, #0
 8018f48:	005a      	lsls	r2, r3, #1
 8018f4a:	5283      	strh	r3, [r0, r2]
 8018f4c:	3301      	adds	r3, #1
 8018f4e:	4299      	cmp	r1, r3
 8018f50:	d1fa      	bne.n	8018f48 <fn_08018E28+0x120>
 8018f52:	4826      	ldr	r0, [pc, #152]	@ (8018fec <fn_08018E28+0x1c4>)
 8018f54:	f7ec fa66 	bl	8005424 <fn_08005424>
 8018f58:	4825      	ldr	r0, [pc, #148]	@ (8018ff0 <fn_08018E28+0x1c8>)
 8018f5a:	f004 fa91 	bl	801d480 <fn_0801D480>
 8018f5e:	6825      	ldr	r5, [r4, #0]
 8018f60:	4b24      	ldr	r3, [pc, #144]	@ (8018ff4 <fn_08018E28+0x1cc>)
 8018f62:	1c44      	adds	r4, r0, #1
 8018f64:	50ec      	str	r4, [r5, r3]
 8018f66:	4824      	ldr	r0, [pc, #144]	@ (8018ff8 <fn_08018E28+0x1d0>)
 8018f68:	f004 fa8a 	bl	801d480 <fn_0801D480>
 8018f6c:	4b23      	ldr	r3, [pc, #140]	@ (8018ffc <fn_08018E28+0x1d4>)
 8018f6e:	3801      	subs	r0, #1
 8018f70:	50e8      	str	r0, [r5, r3]
 8018f72:	4b23      	ldr	r3, [pc, #140]	@ (8019000 <fn_08018E28+0x1d8>)
 8018f74:	1b00      	subs	r0, r0, r4
 8018f76:	3001      	adds	r0, #1
 8018f78:	50e8      	str	r0, [r5, r3]
 8018f7a:	4822      	ldr	r0, [pc, #136]	@ (8019004 <fn_08018E28+0x1dc>)
 8018f7c:	f7ec fa52 	bl	8005424 <fn_08005424>
 8018f80:	4821      	ldr	r0, [pc, #132]	@ (8019008 <fn_08018E28+0x1e0>)
 8018f82:	f004 fa7d 	bl	801d480 <fn_0801D480>
 8018f86:	f004 faef 	bl	801d568 <fn_0801D568>
 8018f8a:	4b20      	ldr	r3, [pc, #128]	@ (801900c <fn_08018E28+0x1e4>)
 8018f8c:	6018      	str	r0, [r3, #0]
 8018f8e:	bc70      	pop	{r4, r5, r6}
 8018f90:	bc01      	pop	{r0}
 8018f92:	4700      	bx	r0
 8018f94:	481e      	ldr	r0, [pc, #120]	@ (8019010 <fn_08018E28+0x1e8>)
 8018f96:	f7e7 fb07 	bl	80005a8 <fn_080005A8>
 8018f9a:	6823      	ldr	r3, [r4, #0]
 8018f9c:	5959      	ldr	r1, [r3, r5]
 8018f9e:	e7c5      	b.n	8018f2c <fn_08018E28+0x104>
 8018fa0:	0814a278 	.word	0x0814a278
 8018fa4:	0814a230 	.word	0x0814a230
 8018fa8:	0814a224 	.word	0x0814a224
 8018fac:	030064c4 	.word	0x030064c4	@ data_030064C4
 8018fb0:	00001114 	.word	0x00001114
 8018fb4:	0814a264 	.word	0x0814a264
 8018fb8:	0814a284 	.word	0x0814a284
 8018fbc:	0814a2d0 	.word	0x0814a2d0
 8018fc0:	03006590 	.word	0x03006590	@ data_03006590
 8018fc4:	0814a2d8 	.word	0x0814a2d8
 8018fc8:	030065d4 	.word	0x030065d4	@ data_030065D4
 8018fcc:	0300658c 	.word	0x0300658c	@ data_0300658C
 8018fd0:	030065c4 	.word	0x030065c4	@ data_030065C4
 8018fd4:	030065a4 	.word	0x030065a4	@ data_030065A4
 8018fd8:	0814a2e0 	.word	0x0814a2e0
 8018fdc:	0814a2e8 	.word	0x0814a2e8
 8018fe0:	0814a2f0 	.word	0x0814a2f0
 8018fe4:	00001104 	.word	0x00001104
 8018fe8:	030066ec 	.word	0x030066ec	@ data_030066EC
 8018fec:	0814a31c 	.word	0x0814a31c
 8018ff0:	0814a324 	.word	0x0814a324
 8018ff4:	00001108 	.word	0x00001108
 8018ff8:	0814a32c 	.word	0x0814a32c
 8018ffc:	0000110c 	.word	0x0000110c
 8019000:	00001110 	.word	0x00001110
 8019004:	0814a334 	.word	0x0814a334
 8019008:	0814a26c 	.word	0x0814a26c
 801900c:	03006594 	.word	0x03006594	@ data_03006594
 8019010:	0814a2f8 	.word	0x0814a2f8
