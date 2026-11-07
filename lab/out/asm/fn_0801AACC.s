fn_0801AACC:
 801aacc:	4b2f      	ldr	r3, [pc, #188]	@ (801ab8c <fn_0801AACC+0xc0>)
 801aace:	781a      	ldrb	r2, [r3, #0]
 801aad0:	b510      	push	{r4, lr}
 801aad2:	2a00      	cmp	r2, #0
 801aad4:	d131      	bne.n	801ab3a <fn_0801AACC+0x6e>
 801aad6:	4b2e      	ldr	r3, [pc, #184]	@ (801ab90 <fn_0801AACC+0xc4>)
 801aad8:	492e      	ldr	r1, [pc, #184]	@ (801ab94 <fn_0801AACC+0xc8>)
 801aada:	681b      	ldr	r3, [r3, #0]
 801aadc:	5858      	ldr	r0, [r3, r1]
 801aade:	2800      	cmp	r0, #0
 801aae0:	d000      	beq.n	801aae4 <fn_0801AACC+0x18>
 801aae2:	505a      	str	r2, [r3, r1]
 801aae4:	4a2c      	ldr	r2, [pc, #176]	@ (801ab98 <fn_0801AACC+0xcc>)
 801aae6:	5899      	ldr	r1, [r3, r2]
 801aae8:	2900      	cmp	r1, #0
 801aaea:	d001      	beq.n	801aaf0 <fn_0801AACC+0x24>
 801aaec:	2100      	movs	r1, #0
 801aaee:	5099      	str	r1, [r3, r2]
 801aaf0:	4a2a      	ldr	r2, [pc, #168]	@ (801ab9c <fn_0801AACC+0xd0>)
 801aaf2:	5899      	ldr	r1, [r3, r2]
 801aaf4:	2900      	cmp	r1, #0
 801aaf6:	d001      	beq.n	801aafc <fn_0801AACC+0x30>
 801aaf8:	2100      	movs	r1, #0
 801aafa:	5099      	str	r1, [r3, r2]
 801aafc:	4a28      	ldr	r2, [pc, #160]	@ (801aba0 <fn_0801AACC+0xd4>)
 801aafe:	5899      	ldr	r1, [r3, r2]
 801ab00:	2900      	cmp	r1, #0
 801ab02:	d001      	beq.n	801ab08 <fn_0801AACC+0x3c>
 801ab04:	2100      	movs	r1, #0
 801ab06:	5099      	str	r1, [r3, r2]
 801ab08:	22ac      	movs	r2, #172	@ 0xac
 801ab0a:	01d2      	lsls	r2, r2, #7
 801ab0c:	5899      	ldr	r1, [r3, r2]
 801ab0e:	2900      	cmp	r1, #0
 801ab10:	d001      	beq.n	801ab16 <fn_0801AACC+0x4a>
 801ab12:	2100      	movs	r1, #0
 801ab14:	5099      	str	r1, [r3, r2]
 801ab16:	4a23      	ldr	r2, [pc, #140]	@ (801aba4 <fn_0801AACC+0xd8>)
 801ab18:	5899      	ldr	r1, [r3, r2]
 801ab1a:	2900      	cmp	r1, #0
 801ab1c:	d001      	beq.n	801ab22 <fn_0801AACC+0x56>
 801ab1e:	2100      	movs	r1, #0
 801ab20:	5099      	str	r1, [r3, r2]
 801ab22:	4a21      	ldr	r2, [pc, #132]	@ (801aba8 <fn_0801AACC+0xdc>)
 801ab24:	5899      	ldr	r1, [r3, r2]
 801ab26:	2900      	cmp	r1, #0
 801ab28:	d001      	beq.n	801ab2e <fn_0801AACC+0x62>
 801ab2a:	2100      	movs	r1, #0
 801ab2c:	5099      	str	r1, [r3, r2]
 801ab2e:	4a1f      	ldr	r2, [pc, #124]	@ (801abac <fn_0801AACC+0xe0>)
 801ab30:	5899      	ldr	r1, [r3, r2]
 801ab32:	2900      	cmp	r1, #0
 801ab34:	d001      	beq.n	801ab3a <fn_0801AACC+0x6e>
 801ab36:	2100      	movs	r1, #0
 801ab38:	5099      	str	r1, [r3, r2]
 801ab3a:	4b1d      	ldr	r3, [pc, #116]	@ (801abb0 <fn_0801AACC+0xe4>)
 801ab3c:	781b      	ldrb	r3, [r3, #0]
 801ab3e:	2b00      	cmp	r3, #0
 801ab40:	d10a      	bne.n	801ab58 <fn_0801AACC+0x8c>
 801ab42:	4a13      	ldr	r2, [pc, #76]	@ (801ab90 <fn_0801AACC+0xc4>)
 801ab44:	491b      	ldr	r1, [pc, #108]	@ (801abb4 <fn_0801AACC+0xe8>)
 801ab46:	6812      	ldr	r2, [r2, #0]
 801ab48:	5453      	strb	r3, [r2, r1]
 801ab4a:	4b1b      	ldr	r3, [pc, #108]	@ (801abb8 <fn_0801AACC+0xec>)
 801ab4c:	58d0      	ldr	r0, [r2, r3]
 801ab4e:	1c43      	adds	r3, r0, #1
 801ab50:	d005      	beq.n	801ab5e <fn_0801AACC+0x92>
 801ab52:	2101      	movs	r1, #1
 801ab54:	f7ff ff7a 	bl	801aa4c <fn_0801AA4C>
 801ab58:	bc10      	pop	{r4}
 801ab5a:	bc01      	pop	{r0}
 801ab5c:	4700      	bx	r0
 801ab5e:	23dc      	movs	r3, #220	@ 0xdc
 801ab60:	58d0      	ldr	r0, [r2, r3]
 801ab62:	3b48      	subs	r3, #72	@ 0x48
 801ab64:	5cd3      	ldrb	r3, [r2, r3]
 801ab66:	2b02      	cmp	r3, #2
 801ab68:	d008      	beq.n	801ab7c <fn_0801AACC+0xb0>
 801ab6a:	23d8      	movs	r3, #216	@ 0xd8
 801ab6c:	58d3      	ldr	r3, [r2, r3]
 801ab6e:	2b03      	cmp	r3, #3
 801ab70:	dc06      	bgt.n	801ab80 <fn_0801AACC+0xb4>
 801ab72:	3b01      	subs	r3, #1
 801ab74:	00da      	lsls	r2, r3, #3
 801ab76:	18d3      	adds	r3, r2, r3
 801ab78:	18c0      	adds	r0, r0, r3
 801ab7a:	e7ea      	b.n	801ab52 <fn_0801AACC+0x86>
 801ab7c:	3020      	adds	r0, #32
 801ab7e:	e7e8      	b.n	801ab52 <fn_0801AACC+0x86>
 801ab80:	4b0e      	ldr	r3, [pc, #56]	@ (801abbc <fn_0801AACC+0xf0>)
 801ab82:	3801      	subs	r0, #1
 801ab84:	0080      	lsls	r0, r0, #2
 801ab86:	58c0      	ldr	r0, [r0, r3]
 801ab88:	e7e3      	b.n	801ab52 <fn_0801AACC+0x86>
 801ab8a:	46c0      	nop			@ (mov r8, r8)
 801ab8c:	080257f6 	.word	0x080257f6	@ data_080257F6
 801ab90:	030064c4 	.word	0x030064c4	@ data_030064C4
 801ab94:	000055d0 	.word	0x000055d0
 801ab98:	000055dc 	.word	0x000055dc
 801ab9c:	000055e8 	.word	0x000055e8
 801aba0:	000055f4 	.word	0x000055f4
 801aba4:	0000560c 	.word	0x0000560c
 801aba8:	00005618 	.word	0x00005618
 801abac:	00005624 	.word	0x00005624
 801abb0:	080257f5 	.word	0x080257f5	@ data_080257F5
 801abb4:	00005640 	.word	0x00005640
 801abb8:	0000563c 	.word	0x0000563c
 801abbc:	0812ffd8 	.word	0x0812ffd8	@ data_0812FFD8
