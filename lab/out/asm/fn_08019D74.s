fn_08019D74:
 8019d74:	4b1b      	ldr	r3, [pc, #108]	@ (8019de4 <fn_08019D74+0x70>)
 8019d76:	781a      	ldrb	r2, [r3, #0]
 8019d78:	2a00      	cmp	r2, #0
 8019d7a:	d131      	bne.n	8019de0 <fn_08019D74+0x6c>
 8019d7c:	4b1a      	ldr	r3, [pc, #104]	@ (8019de8 <fn_08019D74+0x74>)
 8019d7e:	491b      	ldr	r1, [pc, #108]	@ (8019dec <fn_08019D74+0x78>)
 8019d80:	681b      	ldr	r3, [r3, #0]
 8019d82:	5858      	ldr	r0, [r3, r1]
 8019d84:	2800      	cmp	r0, #0
 8019d86:	d000      	beq.n	8019d8a <fn_08019D74+0x16>
 8019d88:	505a      	str	r2, [r3, r1]
 8019d8a:	4a19      	ldr	r2, [pc, #100]	@ (8019df0 <fn_08019D74+0x7c>)
 8019d8c:	5899      	ldr	r1, [r3, r2]
 8019d8e:	2900      	cmp	r1, #0
 8019d90:	d001      	beq.n	8019d96 <fn_08019D74+0x22>
 8019d92:	2100      	movs	r1, #0
 8019d94:	5099      	str	r1, [r3, r2]
 8019d96:	4a17      	ldr	r2, [pc, #92]	@ (8019df4 <fn_08019D74+0x80>)
 8019d98:	5899      	ldr	r1, [r3, r2]
 8019d9a:	2900      	cmp	r1, #0
 8019d9c:	d001      	beq.n	8019da2 <fn_08019D74+0x2e>
 8019d9e:	2100      	movs	r1, #0
 8019da0:	5099      	str	r1, [r3, r2]
 8019da2:	4a15      	ldr	r2, [pc, #84]	@ (8019df8 <fn_08019D74+0x84>)
 8019da4:	5899      	ldr	r1, [r3, r2]
 8019da6:	2900      	cmp	r1, #0
 8019da8:	d001      	beq.n	8019dae <fn_08019D74+0x3a>
 8019daa:	2100      	movs	r1, #0
 8019dac:	5099      	str	r1, [r3, r2]
 8019dae:	22ac      	movs	r2, #172	@ 0xac
 8019db0:	01d2      	lsls	r2, r2, #7
 8019db2:	5899      	ldr	r1, [r3, r2]
 8019db4:	2900      	cmp	r1, #0
 8019db6:	d001      	beq.n	8019dbc <fn_08019D74+0x48>
 8019db8:	2100      	movs	r1, #0
 8019dba:	5099      	str	r1, [r3, r2]
 8019dbc:	4a0f      	ldr	r2, [pc, #60]	@ (8019dfc <fn_08019D74+0x88>)
 8019dbe:	5899      	ldr	r1, [r3, r2]
 8019dc0:	2900      	cmp	r1, #0
 8019dc2:	d001      	beq.n	8019dc8 <fn_08019D74+0x54>
 8019dc4:	2100      	movs	r1, #0
 8019dc6:	5099      	str	r1, [r3, r2]
 8019dc8:	4a0d      	ldr	r2, [pc, #52]	@ (8019e00 <fn_08019D74+0x8c>)
 8019dca:	5899      	ldr	r1, [r3, r2]
 8019dcc:	2900      	cmp	r1, #0
 8019dce:	d001      	beq.n	8019dd4 <fn_08019D74+0x60>
 8019dd0:	2100      	movs	r1, #0
 8019dd2:	5099      	str	r1, [r3, r2]
 8019dd4:	4a0b      	ldr	r2, [pc, #44]	@ (8019e04 <fn_08019D74+0x90>)
 8019dd6:	5899      	ldr	r1, [r3, r2]
 8019dd8:	2900      	cmp	r1, #0
 8019dda:	d001      	beq.n	8019de0 <fn_08019D74+0x6c>
 8019ddc:	2100      	movs	r1, #0
 8019dde:	5099      	str	r1, [r3, r2]
 8019de0:	4770      	bx	lr
 8019de2:	46c0      	nop			@ (mov r8, r8)
 8019de4:	080257f6 	.word	0x080257f6
 8019de8:	030064c4 	.word	0x030064c4
 8019dec:	000055d0 	.word	0x000055d0
 8019df0:	000055dc 	.word	0x000055dc
 8019df4:	000055e8 	.word	0x000055e8
 8019df8:	000055f4 	.word	0x000055f4
 8019dfc:	0000560c 	.word	0x0000560c
 8019e00:	00005618 	.word	0x00005618
 8019e04:	00005624 	.word	0x00005624
