fn_08005DF4:
 8005df4:	b510      	push	{r4, lr}
 8005df6:	4c15      	ldr	r4, [pc, #84]	@ (8005e4c <fn_08005DF4+0x58>)
 8005df8:	6823      	ldr	r3, [r4, #0]
 8005dfa:	2804      	cmp	r0, #4
 8005dfc:	d116      	bne.n	8005e2c <fn_08005DF4+0x38>
 8005dfe:	4914      	ldr	r1, [pc, #80]	@ (8005e50 <fn_08005DF4+0x5c>)
 8005e00:	4a14      	ldr	r2, [pc, #80]	@ (8005e54 <fn_08005DF4+0x60>)
 8005e02:	5c58      	ldrb	r0, [r3, r1]
 8005e04:	5098      	str	r0, [r3, r2]
 8005e06:	2001      	movs	r0, #1
 8005e08:	4a13      	ldr	r2, [pc, #76]	@ (8005e58 <fn_08005DF4+0x64>)
 8005e0a:	5098      	str	r0, [r3, r2]
 8005e0c:	20ef      	movs	r0, #239	@ 0xef
 8005e0e:	4a13      	ldr	r2, [pc, #76]	@ (8005e5c <fn_08005DF4+0x68>)
 8005e10:	00c0      	lsls	r0, r0, #3
 8005e12:	501a      	str	r2, [r3, r0]
 8005e14:	4a12      	ldr	r2, [pc, #72]	@ (8005e60 <fn_08005DF4+0x6c>)
 8005e16:	4813      	ldr	r0, [pc, #76]	@ (8005e64 <fn_08005DF4+0x70>)
 8005e18:	6010      	str	r0, [r2, #0]
 8005e1a:	2202      	movs	r2, #2
 8005e1c:	32ff      	adds	r2, #255	@ 0xff
 8005e1e:	525a      	strh	r2, [r3, r1]
 8005e20:	2100      	movs	r1, #0
 8005e22:	4a11      	ldr	r2, [pc, #68]	@ (8005e68 <fn_08005DF4+0x74>)
 8005e24:	5299      	strh	r1, [r3, r2]
 8005e26:	bc10      	pop	{r4}
 8005e28:	bc01      	pop	{r0}
 8005e2a:	4700      	bx	r0
 8005e2c:	22f1      	movs	r2, #241	@ 0xf1
 8005e2e:	00d2      	lsls	r2, r2, #3
 8005e30:	5899      	ldr	r1, [r3, r2]
 8005e32:	0600      	lsls	r0, r0, #24
 8005e34:	2201      	movs	r2, #1
 8005e36:	3101      	adds	r1, #1
 8005e38:	1600      	asrs	r0, r0, #24
 8005e3a:	f7fd fe6d 	bl	8003b18 <fn_08003B18>
 8005e3e:	2200      	movs	r2, #0
 8005e40:	6823      	ldr	r3, [r4, #0]
 8005e42:	4903      	ldr	r1, [pc, #12]	@ (8005e50 <fn_08005DF4+0x5c>)
 8005e44:	545a      	strb	r2, [r3, r1]
 8005e46:	4908      	ldr	r1, [pc, #32]	@ (8005e68 <fn_08005DF4+0x74>)
 8005e48:	525a      	strh	r2, [r3, r1]
 8005e4a:	e7ec      	b.n	8005e26 <fn_08005DF4+0x32>
 8005e4c:	030064c4 	.word	0x030064c4	@ data_030064C4
 8005e50:	00000792 	.word	0x00000792
 8005e54:	0000077c 	.word	0x0000077c
 8005e58:	00000774 	.word	0x00000774
 8005e5c:	08149e1c 	.word	0x08149e1c
 8005e60:	030064c8 	.word	0x030064c8	@ data_030064C8
 8005e64:	08005d7d 	.word	0x08005d7d	@ fn_08005D7C
 8005e68:	0000078c 	.word	0x0000078c
