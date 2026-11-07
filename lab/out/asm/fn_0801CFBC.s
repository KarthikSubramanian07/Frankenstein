fn_0801CFBC:
 801cfbc:	b510      	push	{r4, lr}
 801cfbe:	4b1b      	ldr	r3, [pc, #108]	@ (801d02c <fn_0801CFBC+0x70>)
 801cfc0:	4a1b      	ldr	r2, [pc, #108]	@ (801d030 <fn_0801CFBC+0x74>)
 801cfc2:	681b      	ldr	r3, [r3, #0]
 801cfc4:	5c9a      	ldrb	r2, [r3, r2]
 801cfc6:	2a00      	cmp	r2, #0
 801cfc8:	d01a      	beq.n	801d000 <fn_0801CFBC+0x44>
 801cfca:	001a      	movs	r2, r3
 801cfcc:	2001      	movs	r0, #1
 801cfce:	32e0      	adds	r2, #224	@ 0xe0
 801cfd0:	7b52      	ldrb	r2, [r2, #13]
 801cfd2:	4210      	tst	r0, r2
 801cfd4:	d117      	bne.n	801d006 <fn_0801CFBC+0x4a>
 801cfd6:	0019      	movs	r1, r3
 801cfd8:	2000      	movs	r0, #0
 801cfda:	317d      	adds	r1, #125	@ 0x7d
 801cfdc:	31ff      	adds	r1, #255	@ 0xff
 801cfde:	6008      	str	r0, [r1, #0]
 801cfe0:	2102      	movs	r1, #2
 801cfe2:	0008      	movs	r0, r1
 801cfe4:	4010      	ands	r0, r2
 801cfe6:	4211      	tst	r1, r2
 801cfe8:	d01c      	beq.n	801d024 <fn_0801CFBC+0x68>
 801cfea:	001a      	movs	r2, r3
 801cfec:	3281      	adds	r2, #129	@ 0x81
 801cfee:	32ff      	adds	r2, #255	@ 0xff
 801cff0:	6811      	ldr	r1, [r2, #0]
 801cff2:	2900      	cmp	r1, #0
 801cff4:	d102      	bne.n	801cffc <fn_0801CFBC+0x40>
 801cff6:	2001      	movs	r0, #1
 801cff8:	490e      	ldr	r1, [pc, #56]	@ (801d034 <fn_0801CFBC+0x78>)
 801cffa:	5058      	str	r0, [r3, r1]
 801cffc:	2301      	movs	r3, #1
 801cffe:	6013      	str	r3, [r2, #0]
 801d000:	bc10      	pop	{r4}
 801d002:	bc01      	pop	{r0}
 801d004:	4700      	bx	r0
 801d006:	0019      	movs	r1, r3
 801d008:	317d      	adds	r1, #125	@ 0x7d
 801d00a:	31ff      	adds	r1, #255	@ 0xff
 801d00c:	680c      	ldr	r4, [r1, #0]
 801d00e:	2c00      	cmp	r4, #0
 801d010:	d101      	bne.n	801d016 <fn_0801CFBC+0x5a>
 801d012:	4c08      	ldr	r4, [pc, #32]	@ (801d034 <fn_0801CFBC+0x78>)
 801d014:	5118      	str	r0, [r3, r4]
 801d016:	2001      	movs	r0, #1
 801d018:	6008      	str	r0, [r1, #0]
 801d01a:	2102      	movs	r1, #2
 801d01c:	0008      	movs	r0, r1
 801d01e:	4010      	ands	r0, r2
 801d020:	4211      	tst	r1, r2
 801d022:	d1e2      	bne.n	801cfea <fn_0801CFBC+0x2e>
 801d024:	3381      	adds	r3, #129	@ 0x81
 801d026:	33ff      	adds	r3, #255	@ 0xff
 801d028:	6018      	str	r0, [r3, #0]
 801d02a:	e7e9      	b.n	801d000 <fn_0801CFBC+0x44>
 801d02c:	030064c4 	.word	0x030064c4	@ data_030064C4
 801d030:	0000025d 	.word	0x0000025d
 801d034:	00005a38 	.word	0x00005a38
