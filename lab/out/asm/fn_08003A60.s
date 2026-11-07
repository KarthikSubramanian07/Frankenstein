fn_08003A60:
 8003a60:	b510      	push	{r4, lr}
 8003a62:	4825      	ldr	r0, [pc, #148]	@ (8003af8 <fn_08003A60+0x98>)
 8003a64:	b086      	sub	sp, #24
 8003a66:	4b25      	ldr	r3, [pc, #148]	@ (8003afc <fn_08003A60+0x9c>)
 8003a68:	4925      	ldr	r1, [pc, #148]	@ (8003b00 <fn_08003A60+0xa0>)
 8003a6a:	4468      	add	r0, sp
 8003a6c:	001a      	movs	r2, r3
 8003a6e:	7812      	ldrb	r2, [r2, #0]
 8003a70:	3301      	adds	r3, #1
 8003a72:	541a      	strb	r2, [r3, r0]
 8003a74:	428b      	cmp	r3, r1
 8003a76:	d1f9      	bne.n	8003a6c <fn_08003A60+0xc>
 8003a78:	4b22      	ldr	r3, [pc, #136]	@ (8003b04 <fn_08003A60+0xa4>)
 8003a7a:	9a00      	ldr	r2, [sp, #0]
 8003a7c:	429a      	cmp	r2, r3
 8003a7e:	d003      	beq.n	8003a88 <fn_08003A60+0x28>
 8003a80:	b006      	add	sp, #24
 8003a82:	bc10      	pop	{r4}
 8003a84:	bc01      	pop	{r0}
 8003a86:	4700      	bx	r0
 8003a88:	4b1f      	ldr	r3, [pc, #124]	@ (8003b08 <fn_08003A60+0xa8>)
 8003a8a:	9802      	ldr	r0, [sp, #8]
 8003a8c:	001c      	movs	r4, r3
 8003a8e:	681b      	ldr	r3, [r3, #0]
 8003a90:	2804      	cmp	r0, #4
 8003a92:	d82f      	bhi.n	8003af4 <fn_08003A60+0x94>
 8003a94:	2284      	movs	r2, #132	@ 0x84
 8003a96:	5098      	str	r0, [r3, r2]
 8003a98:	9a01      	ldr	r2, [sp, #4]
 8003a9a:	1e51      	subs	r1, r2, #1
 8003a9c:	418a      	sbcs	r2, r1
 8003a9e:	491b      	ldr	r1, [pc, #108]	@ (8003b0c <fn_08003A60+0xac>)
 8003aa0:	505a      	str	r2, [r3, r1]
 8003aa2:	9a03      	ldr	r2, [sp, #12]
 8003aa4:	1e51      	subs	r1, r2, #1
 8003aa6:	418a      	sbcs	r2, r1
 8003aa8:	21ed      	movs	r1, #237	@ 0xed
 8003aaa:	00c9      	lsls	r1, r1, #3
 8003aac:	505a      	str	r2, [r3, r1]
 8003aae:	9a05      	ldr	r2, [sp, #20]
 8003ab0:	2a0f      	cmp	r2, #15
 8003ab2:	d818      	bhi.n	8003ae6 <fn_08003A60+0x86>
 8003ab4:	4916      	ldr	r1, [pc, #88]	@ (8003b10 <fn_08003A60+0xb0>)
 8003ab6:	505a      	str	r2, [r3, r1]
 8003ab8:	9a04      	ldr	r2, [sp, #16]
 8003aba:	2a0f      	cmp	r2, #15
 8003abc:	d811      	bhi.n	8003ae2 <fn_08003A60+0x82>
 8003abe:	4915      	ldr	r1, [pc, #84]	@ (8003b14 <fn_08003A60+0xb4>)
 8003ac0:	505a      	str	r2, [r3, r1]
 8003ac2:	f018 fc13 	bl	801c2ec <fn_0801C2EC>
 8003ac6:	2000      	movs	r0, #0
 8003ac8:	f018 fc0a 	bl	801c2e0 <fn_0801C2E0>
 8003acc:	6822      	ldr	r2, [r4, #0]
 8003ace:	4b10      	ldr	r3, [pc, #64]	@ (8003b10 <fn_08003A60+0xb0>)
 8003ad0:	58d0      	ldr	r0, [r2, r3]
 8003ad2:	f016 ffbd 	bl	801aa50 <fn_0801AA50>
 8003ad6:	6822      	ldr	r2, [r4, #0]
 8003ad8:	4b0e      	ldr	r3, [pc, #56]	@ (8003b14 <fn_08003A60+0xb4>)
 8003ada:	58d0      	ldr	r0, [r2, r3]
 8003adc:	f016 ff98 	bl	801aa10 <fn_0801AA10>
 8003ae0:	e7ce      	b.n	8003a80 <fn_08003A60+0x20>
 8003ae2:	220f      	movs	r2, #15
 8003ae4:	e7eb      	b.n	8003abe <fn_08003A60+0x5e>
 8003ae6:	220f      	movs	r2, #15
 8003ae8:	4909      	ldr	r1, [pc, #36]	@ (8003b10 <fn_08003A60+0xb0>)
 8003aea:	505a      	str	r2, [r3, r1]
 8003aec:	9a04      	ldr	r2, [sp, #16]
 8003aee:	2a0f      	cmp	r2, #15
 8003af0:	d9e5      	bls.n	8003abe <fn_08003A60+0x5e>
 8003af2:	e7f6      	b.n	8003ae2 <fn_08003A60+0x82>
 8003af4:	2004      	movs	r0, #4
 8003af6:	e7cd      	b.n	8003a94 <fn_08003A60+0x34>
 8003af8:	f1fffcff 	.word	0xf1fffcff
 8003afc:	0e000300 	.word	0x0e000300
 8003b00:	0e000318 	.word	0x0e000318
 8003b04:	baddead1 	.word	0xbaddead1
 8003b08:	030064c4 	.word	0x030064c4
 8003b0c:	0000076c 	.word	0x0000076c
 8003b10:	00005630 	.word	0x00005630
 8003b14:	00005634 	.word	0x00005634
