fn_08019BF8:
 8019bf8:	2807      	cmp	r0, #7
 8019bfa:	d809      	bhi.n	8019c10 <fn_08019BF8+0x18>
 8019bfc:	229b      	movs	r2, #155	@ 0x9b
 8019bfe:	4b05      	ldr	r3, [pc, #20]	@ (8019c14 <fn_08019BF8+0x1c>)
 8019c00:	681b      	ldr	r3, [r3, #0]
 8019c02:	0100      	lsls	r0, r0, #4
 8019c04:	181b      	adds	r3, r3, r0
 8019c06:	00d2      	lsls	r2, r2, #3
 8019c08:	5898      	ldr	r0, [r3, r2]
 8019c0a:	1e43      	subs	r3, r0, #1
 8019c0c:	4198      	sbcs	r0, r3
 8019c0e:	4770      	bx	lr
 8019c10:	2000      	movs	r0, #0
 8019c12:	e7fc      	b.n	8019c0e <fn_08019BF8+0x16>
 8019c14:	030064c4 	.word	0x030064c4
