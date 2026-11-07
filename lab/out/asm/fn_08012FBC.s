fn_08012FBC:
 8012fbc:	4b18      	ldr	r3, [pc, #96]	@ (8013020 <fn_08012FBC+0x64>)
 8012fbe:	681b      	ldr	r3, [r3, #0]
 8012fc0:	469c      	mov	ip, r3
 8012fc2:	2353      	movs	r3, #83	@ 0x53
 8012fc4:	4661      	mov	r1, ip
 8012fc6:	b510      	push	{r4, lr}
 8012fc8:	4a16      	ldr	r2, [pc, #88]	@ (8013024 <fn_08012FBC+0x68>)
 8012fca:	5cc3      	ldrb	r3, [r0, r3]
 8012fcc:	5889      	ldr	r1, [r1, r2]
 8012fce:	005a      	lsls	r2, r3, #1
 8012fd0:	18d2      	adds	r2, r2, r3
 8012fd2:	00d2      	lsls	r2, r2, #3
 8012fd4:	5851      	ldr	r1, [r2, r1]
 8012fd6:	060a      	lsls	r2, r1, #24
 8012fd8:	b082      	sub	sp, #8
 8012fda:	0e12      	lsrs	r2, r2, #24
 8012fdc:	2b06      	cmp	r3, #6
 8012fde:	d015      	beq.n	801300c <fn_08012FBC+0x50>
 8012fe0:	3b08      	subs	r3, #8
 8012fe2:	001c      	movs	r4, r3
 8012fe4:	4263      	negs	r3, r4
 8012fe6:	4163      	adcs	r3, r4
 8012fe8:	3301      	adds	r3, #1
 8012fea:	2a05      	cmp	r2, #5
 8012fec:	d015      	beq.n	801301a <fn_08012FBC+0x5e>
 8012fee:	22ff      	movs	r2, #255	@ 0xff
 8012ff0:	400a      	ands	r2, r1
 8012ff2:	0092      	lsls	r2, r2, #2
 8012ff4:	1880      	adds	r0, r0, r2
 8012ff6:	6fc2      	ldr	r2, [r0, #124]	@ 0x7c
 8012ff8:	0fd9      	lsrs	r1, r3, #31
 8012ffa:	17d0      	asrs	r0, r2, #31
 8012ffc:	429a      	cmp	r2, r3
 8012ffe:	4148      	adcs	r0, r1
 8013000:	0600      	lsls	r0, r0, #24
 8013002:	0e00      	lsrs	r0, r0, #24
 8013004:	b002      	add	sp, #8
 8013006:	bc10      	pop	{r4}
 8013008:	bc02      	pop	{r1}
 801300a:	4708      	bx	r1
 801300c:	23eb      	movs	r3, #235	@ 0xeb
 801300e:	4664      	mov	r4, ip
 8013010:	00db      	lsls	r3, r3, #3
 8013012:	58e3      	ldr	r3, [r4, r3]
 8013014:	6b1b      	ldr	r3, [r3, #48]	@ 0x30
 8013016:	2a05      	cmp	r2, #5
 8013018:	d1e9      	bne.n	8012fee <fn_08012FBC+0x32>
 801301a:	2001      	movs	r0, #1
 801301c:	e7f2      	b.n	8013004 <fn_08012FBC+0x48>
 801301e:	46c0      	nop			@ (mov r8, r8)
 8013020:	030064c4 	.word	0x030064c4
 8013024:	00000754 	.word	0x00000754
