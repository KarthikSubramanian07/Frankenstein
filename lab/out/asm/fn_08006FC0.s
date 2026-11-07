fn_08006FC0:
 8006fc0:	4b0a      	ldr	r3, [pc, #40]	@ (8006fec <fn_08006FC0+0x2c>)
 8006fc2:	4684      	mov	ip, r0
 8006fc4:	6818      	ldr	r0, [r3, #0]
 8006fc6:	4b0a      	ldr	r3, [pc, #40]	@ (8006ff0 <fn_08006FC0+0x30>)
 8006fc8:	18c2      	adds	r2, r0, r3
 8006fca:	2300      	movs	r3, #0
 8006fcc:	e003      	b.n	8006fd6 <fn_08006FC0+0x16>
 8006fce:	3301      	adds	r3, #1
 8006fd0:	3204      	adds	r2, #4
 8006fd2:	2b20      	cmp	r3, #32
 8006fd4:	d008      	beq.n	8006fe8 <fn_08006FC0+0x28>
 8006fd6:	6811      	ldr	r1, [r2, #0]
 8006fd8:	2900      	cmp	r1, #0
 8006fda:	d1f8      	bne.n	8006fce <fn_08006FC0+0xe>
 8006fdc:	4662      	mov	r2, ip
 8006fde:	33f7      	adds	r3, #247	@ 0xf7
 8006fe0:	33ff      	adds	r3, #255	@ 0xff
 8006fe2:	009b      	lsls	r3, r3, #2
 8006fe4:	18c3      	adds	r3, r0, r3
 8006fe6:	605a      	str	r2, [r3, #4]
 8006fe8:	4770      	bx	lr
 8006fea:	46c0      	nop			@ (mov r8, r8)
 8006fec:	030064c4 	.word	0x030064c4	@ data_030064C4
 8006ff0:	000007dc 	.word	0x000007dc
