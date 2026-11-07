fn_08005E6C:
 8005e6c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8005e6e:	0005      	movs	r5, r0
 8005e70:	4816      	ldr	r0, [pc, #88]	@ (8005ecc <fn_08005E6C+0x60>)
 8005e72:	000f      	movs	r7, r1
 8005e74:	f017 fb04 	bl	801d480 <fn_0801D480>
 8005e78:	0006      	movs	r6, r0
 8005e7a:	4815      	ldr	r0, [pc, #84]	@ (8005ed0 <fn_08005E6C+0x64>)
 8005e7c:	f017 fb00 	bl	801d480 <fn_0801D480>
 8005e80:	2200      	movs	r2, #0
 8005e82:	0003      	movs	r3, r0
 8005e84:	0029      	movs	r1, r5
 8005e86:	2050      	movs	r0, #80	@ 0x50
 8005e88:	f016 f952 	bl	801c130 <fn_0801C130>
 8005e8c:	2458      	movs	r4, #88	@ 0x58
 8005e8e:	0020      	movs	r0, r4
 8005e90:	0033      	movs	r3, r6
 8005e92:	2200      	movs	r2, #0
 8005e94:	0029      	movs	r1, r5
 8005e96:	3408      	adds	r4, #8
 8005e98:	f016 f94a 	bl	801c130 <fn_0801C130>
 8005e9c:	2cd8      	cmp	r4, #216	@ 0xd8
 8005e9e:	d1f6      	bne.n	8005e8e <fn_08005E6C+0x22>
 8005ea0:	480c      	ldr	r0, [pc, #48]	@ (8005ed4 <fn_08005E6C+0x68>)
 8005ea2:	f017 faed 	bl	801d480 <fn_0801D480>
 8005ea6:	0029      	movs	r1, r5
 8005ea8:	0003      	movs	r3, r0
 8005eaa:	2200      	movs	r2, #0
 8005eac:	20d8      	movs	r0, #216	@ 0xd8
 8005eae:	f016 f93f 	bl	801c130 <fn_0801C130>
 8005eb2:	4809      	ldr	r0, [pc, #36]	@ (8005ed8 <fn_08005E6C+0x6c>)
 8005eb4:	f017 fae4 	bl	801d480 <fn_0801D480>
 8005eb8:	0003      	movs	r3, r0
 8005eba:	00f8      	lsls	r0, r7, #3
 8005ebc:	0029      	movs	r1, r5
 8005ebe:	2200      	movs	r2, #0
 8005ec0:	3058      	adds	r0, #88	@ 0x58
 8005ec2:	f016 f935 	bl	801c130 <fn_0801C130>
 8005ec6:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8005ec8:	bc01      	pop	{r0}
 8005eca:	4700      	bx	r0
 8005ecc:	08149e64 	.word	0x08149e64
 8005ed0:	08149e70 	.word	0x08149e70
 8005ed4:	08149e7c 	.word	0x08149e7c
 8005ed8:	08149e88 	.word	0x08149e88
