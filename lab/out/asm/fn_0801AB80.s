fn_0801AB80:
 801ab80:	4b2f      	ldr	r3, [pc, #188]	@ (801ac40 <fn_0801AB80+0xc0>)
 801ab82:	781a      	ldrb	r2, [r3, #0]
 801ab84:	b510      	push	{r4, lr}
 801ab86:	2a00      	cmp	r2, #0
 801ab88:	d131      	bne.n	801abee <fn_0801AB80+0x6e>
 801ab8a:	4b2e      	ldr	r3, [pc, #184]	@ (801ac44 <fn_0801AB80+0xc4>)
 801ab8c:	492e      	ldr	r1, [pc, #184]	@ (801ac48 <fn_0801AB80+0xc8>)
 801ab8e:	681b      	ldr	r3, [r3, #0]
 801ab90:	5858      	ldr	r0, [r3, r1]
 801ab92:	2800      	cmp	r0, #0
 801ab94:	d000      	beq.n	801ab98 <fn_0801AB80+0x18>
 801ab96:	505a      	str	r2, [r3, r1]
 801ab98:	4a2c      	ldr	r2, [pc, #176]	@ (801ac4c <fn_0801AB80+0xcc>)
 801ab9a:	5899      	ldr	r1, [r3, r2]
 801ab9c:	2900      	cmp	r1, #0
 801ab9e:	d001      	beq.n	801aba4 <fn_0801AB80+0x24>
 801aba0:	2100      	movs	r1, #0
 801aba2:	5099      	str	r1, [r3, r2]
 801aba4:	4a2a      	ldr	r2, [pc, #168]	@ (801ac50 <fn_0801AB80+0xd0>)
 801aba6:	5899      	ldr	r1, [r3, r2]
 801aba8:	2900      	cmp	r1, #0
 801abaa:	d001      	beq.n	801abb0 <fn_0801AB80+0x30>
 801abac:	2100      	movs	r1, #0
 801abae:	5099      	str	r1, [r3, r2]
 801abb0:	4a28      	ldr	r2, [pc, #160]	@ (801ac54 <fn_0801AB80+0xd4>)
 801abb2:	5899      	ldr	r1, [r3, r2]
 801abb4:	2900      	cmp	r1, #0
 801abb6:	d001      	beq.n	801abbc <fn_0801AB80+0x3c>
 801abb8:	2100      	movs	r1, #0
 801abba:	5099      	str	r1, [r3, r2]
 801abbc:	22ac      	movs	r2, #172	@ 0xac
 801abbe:	01d2      	lsls	r2, r2, #7
 801abc0:	5899      	ldr	r1, [r3, r2]
 801abc2:	2900      	cmp	r1, #0
 801abc4:	d001      	beq.n	801abca <fn_0801AB80+0x4a>
 801abc6:	2100      	movs	r1, #0
 801abc8:	5099      	str	r1, [r3, r2]
 801abca:	4a23      	ldr	r2, [pc, #140]	@ (801ac58 <fn_0801AB80+0xd8>)
 801abcc:	5899      	ldr	r1, [r3, r2]
 801abce:	2900      	cmp	r1, #0
 801abd0:	d001      	beq.n	801abd6 <fn_0801AB80+0x56>
 801abd2:	2100      	movs	r1, #0
 801abd4:	5099      	str	r1, [r3, r2]
 801abd6:	4a21      	ldr	r2, [pc, #132]	@ (801ac5c <fn_0801AB80+0xdc>)
 801abd8:	5899      	ldr	r1, [r3, r2]
 801abda:	2900      	cmp	r1, #0
 801abdc:	d001      	beq.n	801abe2 <fn_0801AB80+0x62>
 801abde:	2100      	movs	r1, #0
 801abe0:	5099      	str	r1, [r3, r2]
 801abe2:	4a1f      	ldr	r2, [pc, #124]	@ (801ac60 <fn_0801AB80+0xe0>)
 801abe4:	5899      	ldr	r1, [r3, r2]
 801abe6:	2900      	cmp	r1, #0
 801abe8:	d001      	beq.n	801abee <fn_0801AB80+0x6e>
 801abea:	2100      	movs	r1, #0
 801abec:	5099      	str	r1, [r3, r2]
 801abee:	4b1d      	ldr	r3, [pc, #116]	@ (801ac64 <fn_0801AB80+0xe4>)
 801abf0:	781b      	ldrb	r3, [r3, #0]
 801abf2:	2b00      	cmp	r3, #0
 801abf4:	d10a      	bne.n	801ac0c <fn_0801AB80+0x8c>
 801abf6:	4a13      	ldr	r2, [pc, #76]	@ (801ac44 <fn_0801AB80+0xc4>)
 801abf8:	491b      	ldr	r1, [pc, #108]	@ (801ac68 <fn_0801AB80+0xe8>)
 801abfa:	6812      	ldr	r2, [r2, #0]
 801abfc:	5453      	strb	r3, [r2, r1]
 801abfe:	4b1b      	ldr	r3, [pc, #108]	@ (801ac6c <fn_0801AB80+0xec>)
 801ac00:	58d0      	ldr	r0, [r2, r3]
 801ac02:	1c43      	adds	r3, r0, #1
 801ac04:	d005      	beq.n	801ac12 <fn_0801AB80+0x92>
 801ac06:	2101      	movs	r1, #1
 801ac08:	f7ff ff7a 	bl	801ab00 <fn_0801AB00>
 801ac0c:	bc10      	pop	{r4}
 801ac0e:	bc01      	pop	{r0}
 801ac10:	4700      	bx	r0
 801ac12:	23dc      	movs	r3, #220	@ 0xdc
 801ac14:	58d0      	ldr	r0, [r2, r3]
 801ac16:	3b48      	subs	r3, #72	@ 0x48
 801ac18:	5cd3      	ldrb	r3, [r2, r3]
 801ac1a:	2b02      	cmp	r3, #2
 801ac1c:	d008      	beq.n	801ac30 <fn_0801AB80+0xb0>
 801ac1e:	23d8      	movs	r3, #216	@ 0xd8
 801ac20:	58d3      	ldr	r3, [r2, r3]
 801ac22:	2b03      	cmp	r3, #3
 801ac24:	dc06      	bgt.n	801ac34 <fn_0801AB80+0xb4>
 801ac26:	3b01      	subs	r3, #1
 801ac28:	00da      	lsls	r2, r3, #3
 801ac2a:	18d3      	adds	r3, r2, r3
 801ac2c:	18c0      	adds	r0, r0, r3
 801ac2e:	e7ea      	b.n	801ac06 <fn_0801AB80+0x86>
 801ac30:	3020      	adds	r0, #32
 801ac32:	e7e8      	b.n	801ac06 <fn_0801AB80+0x86>
 801ac34:	4b0e      	ldr	r3, [pc, #56]	@ (801ac70 <fn_0801AB80+0xf0>)
 801ac36:	3801      	subs	r0, #1
 801ac38:	0080      	lsls	r0, r0, #2
 801ac3a:	58c0      	ldr	r0, [r0, r3]
 801ac3c:	e7e3      	b.n	801ac06 <fn_0801AB80+0x86>
 801ac3e:	46c0      	nop			@ (mov r8, r8)
 801ac40:	080258a6 	.word	0x080258a6
 801ac44:	030064c4 	.word	0x030064c4
 801ac48:	000055d0 	.word	0x000055d0
 801ac4c:	000055dc 	.word	0x000055dc
 801ac50:	000055e8 	.word	0x000055e8
 801ac54:	000055f4 	.word	0x000055f4
 801ac58:	0000560c 	.word	0x0000560c
 801ac5c:	00005618 	.word	0x00005618
 801ac60:	00005624 	.word	0x00005624
 801ac64:	080258a5 	.word	0x080258a5
 801ac68:	00005640 	.word	0x00005640
 801ac6c:	0000563c 	.word	0x0000563c
 801ac70:	081300ac 	.word	0x081300ac
