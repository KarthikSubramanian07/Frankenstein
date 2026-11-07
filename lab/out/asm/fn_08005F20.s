fn_08005F20:
 8005f20:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8005f22:	4836      	ldr	r0, [pc, #216]	@ (8005ffc <fn_08005F20+0xdc>)
 8005f24:	f017 fb04 	bl	801d530 <fn_0801D530>
 8005f28:	210f      	movs	r1, #15
 8005f2a:	0003      	movs	r3, r0
 8005f2c:	2200      	movs	r2, #0
 8005f2e:	206c      	movs	r0, #108	@ 0x6c
 8005f30:	f016 f956 	bl	801c1e0 <fn_0801C1E0>
 8005f34:	23ed      	movs	r3, #237	@ 0xed
 8005f36:	4c32      	ldr	r4, [pc, #200]	@ (8006000 <fn_08005F20+0xe0>)
 8005f38:	0026      	movs	r6, r4
 8005f3a:	4d32      	ldr	r5, [pc, #200]	@ (8006004 <fn_08005F20+0xe4>)
 8005f3c:	682a      	ldr	r2, [r5, #0]
 8005f3e:	00db      	lsls	r3, r3, #3
 8005f40:	58d3      	ldr	r3, [r2, r3]
 8005f42:	00d8      	lsls	r0, r3, #3
 8005f44:	3628      	adds	r6, #40	@ 0x28
 8005f46:	18c0      	adds	r0, r0, r3
 8005f48:	1830      	adds	r0, r6, r0
 8005f4a:	f017 faf1 	bl	801d530 <fn_0801D530>
 8005f4e:	2135      	movs	r1, #53	@ 0x35
 8005f50:	0003      	movs	r3, r0
 8005f52:	2200      	movs	r2, #0
 8005f54:	20b4      	movs	r0, #180	@ 0xb4
 8005f56:	f016 f943 	bl	801c1e0 <fn_0801C1E0>
 8005f5a:	682a      	ldr	r2, [r5, #0]
 8005f5c:	4b2a      	ldr	r3, [pc, #168]	@ (8006008 <fn_08005F20+0xe8>)
 8005f5e:	58d2      	ldr	r2, [r2, r3]
 8005f60:	00d3      	lsls	r3, r2, #3
 8005f62:	189b      	adds	r3, r3, r2
 8005f64:	18f0      	adds	r0, r6, r3
 8005f66:	f017 fae3 	bl	801d530 <fn_0801D530>
 8005f6a:	2145      	movs	r1, #69	@ 0x45
 8005f6c:	0003      	movs	r3, r0
 8005f6e:	2200      	movs	r2, #0
 8005f70:	20ce      	movs	r0, #206	@ 0xce
 8005f72:	f016 f935 	bl	801c1e0 <fn_0801C1E0>
 8005f76:	23ee      	movs	r3, #238	@ 0xee
 8005f78:	682a      	ldr	r2, [r5, #0]
 8005f7a:	00db      	lsls	r3, r3, #3
 8005f7c:	58d2      	ldr	r2, [r2, r3]
 8005f7e:	00d3      	lsls	r3, r2, #3
 8005f80:	189b      	adds	r3, r3, r2
 8005f82:	343c      	adds	r4, #60	@ 0x3c
 8005f84:	18e0      	adds	r0, r4, r3
 8005f86:	f017 fad3 	bl	801d530 <fn_0801D530>
 8005f8a:	2155      	movs	r1, #85	@ 0x55
 8005f8c:	0003      	movs	r3, r0
 8005f8e:	2200      	movs	r2, #0
 8005f90:	20ec      	movs	r0, #236	@ 0xec
 8005f92:	f016 f925 	bl	801c1e0 <fn_0801C1E0>
 8005f96:	2384      	movs	r3, #132	@ 0x84
 8005f98:	682a      	ldr	r2, [r5, #0]
 8005f9a:	481c      	ldr	r0, [pc, #112]	@ (800600c <fn_08005F20+0xec>)
 8005f9c:	58d7      	ldr	r7, [r2, r3]
 8005f9e:	f017 fac7 	bl	801d530 <fn_0801D530>
 8005fa2:	0006      	movs	r6, r0
 8005fa4:	481a      	ldr	r0, [pc, #104]	@ (8006010 <fn_08005F20+0xf0>)
 8005fa6:	f017 fac3 	bl	801d530 <fn_0801D530>
 8005faa:	2585      	movs	r5, #133	@ 0x85
 8005fac:	0003      	movs	r3, r0
 8005fae:	2200      	movs	r2, #0
 8005fb0:	2167      	movs	r1, #103	@ 0x67
 8005fb2:	20da      	movs	r0, #218	@ 0xda
 8005fb4:	f016 f914 	bl	801c1e0 <fn_0801C1E0>
 8005fb8:	24e2      	movs	r4, #226	@ 0xe2
 8005fba:	006d      	lsls	r5, r5, #1
 8005fbc:	0020      	movs	r0, r4
 8005fbe:	0033      	movs	r3, r6
 8005fc0:	2200      	movs	r2, #0
 8005fc2:	2167      	movs	r1, #103	@ 0x67
 8005fc4:	3408      	adds	r4, #8
 8005fc6:	f016 f90b 	bl	801c1e0 <fn_0801C1E0>
 8005fca:	42ac      	cmp	r4, r5
 8005fcc:	d1f6      	bne.n	8005fbc <fn_08005F20+0x9c>
 8005fce:	4811      	ldr	r0, [pc, #68]	@ (8006014 <fn_08005F20+0xf4>)
 8005fd0:	f017 faae 	bl	801d530 <fn_0801D530>
 8005fd4:	2200      	movs	r2, #0
 8005fd6:	0003      	movs	r3, r0
 8005fd8:	2167      	movs	r1, #103	@ 0x67
 8005fda:	0020      	movs	r0, r4
 8005fdc:	f016 f900 	bl	801c1e0 <fn_0801C1E0>
 8005fe0:	480d      	ldr	r0, [pc, #52]	@ (8006018 <fn_08005F20+0xf8>)
 8005fe2:	f017 faa5 	bl	801d530 <fn_0801D530>
 8005fe6:	0003      	movs	r3, r0
 8005fe8:	00f8      	lsls	r0, r7, #3
 8005fea:	2200      	movs	r2, #0
 8005fec:	2167      	movs	r1, #103	@ 0x67
 8005fee:	30e2      	adds	r0, #226	@ 0xe2
 8005ff0:	f016 f8f6 	bl	801c1e0 <fn_0801C1E0>
 8005ff4:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8005ff6:	bc01      	pop	{r0}
 8005ff8:	4700      	bx	r0
 8005ffa:	46c0      	nop			@ (mov r8, r8)
 8005ffc:	08149f70 	.word	0x08149f70
 8006000:	08026120 	.word	0x08026120
 8006004:	030064c4 	.word	0x030064c4
 8006008:	0000076c 	.word	0x0000076c
 800600c:	08149f38 	.word	0x08149f38
 8006010:	08149f44 	.word	0x08149f44
 8006014:	08149f50 	.word	0x08149f50
 8006018:	08149f5c 	.word	0x08149f5c
