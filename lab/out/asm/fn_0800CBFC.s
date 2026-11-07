fn_0800CBFC:
 800cbfc:	b5f0      	push	{r4, r5, r6, r7, lr}
 800cbfe:	4657      	mov	r7, sl
 800cc00:	4645      	mov	r5, r8
 800cc02:	46de      	mov	lr, fp
 800cc04:	464e      	mov	r6, r9
 800cc06:	b5e0      	push	{r5, r6, r7, lr}
 800cc08:	4fae      	ldr	r7, [pc, #696]	@ (800cec4 <fn_0800CBFC+0x2c8>)
 800cc0a:	4baf      	ldr	r3, [pc, #700]	@ (800cec8 <fn_0800CBFC+0x2cc>)
 800cc0c:	683a      	ldr	r2, [r7, #0]
 800cc0e:	8bc1      	ldrh	r1, [r0, #30]
 800cc10:	58d3      	ldr	r3, [r2, r3]
 800cc12:	0089      	lsls	r1, r1, #2
 800cc14:	185b      	adds	r3, r3, r1
 800cc16:	78db      	ldrb	r3, [r3, #3]
 800cc18:	0005      	movs	r5, r0
 800cc1a:	b085      	sub	sp, #20
 800cc1c:	0659      	lsls	r1, r3, #25
 800cc1e:	d571      	bpl.n	800cd04 <fn_0800CBFC+0x108>
 800cc20:	2300      	movs	r3, #0
 800cc22:	4699      	mov	r9, r3
 800cc24:	469a      	mov	sl, r3
 800cc26:	469b      	mov	fp, r3
 800cc28:	4ba8      	ldr	r3, [pc, #672]	@ (800cecc <fn_0800CBFC+0x2d0>)
 800cc2a:	9301      	str	r3, [sp, #4]
 800cc2c:	4ba8      	ldr	r3, [pc, #672]	@ (800ced0 <fn_0800CBFC+0x2d4>)
 800cc2e:	9300      	str	r3, [sp, #0]
 800cc30:	2300      	movs	r3, #0
 800cc32:	2401      	movs	r4, #1
 800cc34:	4698      	mov	r8, r3
 800cc36:	4264      	negs	r4, r4
 800cc38:	0021      	movs	r1, r4
 800cc3a:	0028      	movs	r0, r5
 800cc3c:	f008 fa7c 	bl	8015138 <fn_08015138>
 800cc40:	1e04      	subs	r4, r0, #0
 800cc42:	da00      	bge.n	800cc46 <fn_0800CBFC+0x4a>
 800cc44:	e095      	b.n	800cd72 <fn_0800CBFC+0x176>
 800cc46:	22df      	movs	r2, #223	@ 0xdf
 800cc48:	6839      	ldr	r1, [r7, #0]
 800cc4a:	00a3      	lsls	r3, r4, #2
 800cc4c:	0112      	lsls	r2, r2, #4
 800cc4e:	588e      	ldr	r6, [r1, r2]
 800cc50:	191b      	adds	r3, r3, r4
 800cc52:	00db      	lsls	r3, r3, #3
 800cc54:	18f6      	adds	r6, r6, r3
 800cc56:	0031      	movs	r1, r6
 800cc58:	2001      	movs	r0, #1
 800cc5a:	f008 fc0b 	bl	8015474 <fn_08015474>
 800cc5e:	2800      	cmp	r0, #0
 800cc60:	d1ea      	bne.n	800cc38 <fn_0800CBFC+0x3c>
 800cc62:	9003      	str	r0, [sp, #12]
 800cc64:	2200      	movs	r2, #0
 800cc66:	2103      	movs	r1, #3
 800cc68:	2030      	movs	r0, #48	@ 0x30
 800cc6a:	f010 fd5f 	bl	801d72c <fn_0801D72C>
 800cc6e:	4680      	mov	r8, r0
 800cc70:	2230      	movs	r2, #48	@ 0x30
 800cc72:	2100      	movs	r1, #0
 800cc74:	9002      	str	r0, [sp, #8]
 800cc76:	f013 fee3 	bl	8020a40 <fn_08020A40>
 800cc7a:	4640      	mov	r0, r8
 800cc7c:	f00b fca8 	bl	80185d0 <fn_080185D0>
 800cc80:	465b      	mov	r3, fp
 800cc82:	2b02      	cmp	r3, #2
 800cc84:	d100      	bne.n	800cc88 <fn_0800CBFC+0x8c>
 800cc86:	e0f6      	b.n	800ce76 <fn_0800CBFC+0x27a>
 800cc88:	2b03      	cmp	r3, #3
 800cc8a:	d100      	bne.n	800cc8e <fn_0800CBFC+0x92>
 800cc8c:	e0f6      	b.n	800ce7c <fn_0800CBFC+0x280>
 800cc8e:	1e5a      	subs	r2, r3, #1
 800cc90:	4253      	negs	r3, r2
 800cc92:	415a      	adcs	r2, r3
 800cc94:	2373      	movs	r3, #115	@ 0x73
 800cc96:	4252      	negs	r2, r2
 800cc98:	4013      	ands	r3, r2
 800cc9a:	3323      	adds	r3, #35	@ 0x23
 800cc9c:	9902      	ldr	r1, [sp, #8]
 800cc9e:	6171      	str	r1, [r6, #20]
 800cca0:	620b      	str	r3, [r1, #32]
 800cca2:	4653      	mov	r3, sl
 800cca4:	4a8b      	ldr	r2, [pc, #556]	@ (800ced4 <fn_0800CBFC+0x2d8>)
 800cca6:	610e      	str	r6, [r1, #16]
 800cca8:	608a      	str	r2, [r1, #8]
 800ccaa:	2b02      	cmp	r3, #2
 800ccac:	d100      	bne.n	800ccb0 <fn_0800CBFC+0xb4>
 800ccae:	e0de      	b.n	800ce6e <fn_0800CBFC+0x272>
 800ccb0:	2b03      	cmp	r3, #3
 800ccb2:	d100      	bne.n	800ccb6 <fn_0800CBFC+0xba>
 800ccb4:	e0b6      	b.n	800ce24 <fn_0800CBFC+0x228>
 800ccb6:	3b01      	subs	r3, #1
 800ccb8:	425a      	negs	r2, r3
 800ccba:	4153      	adcs	r3, r2
 800ccbc:	2280      	movs	r2, #128	@ 0x80
 800ccbe:	045b      	lsls	r3, r3, #17
 800ccc0:	0292      	lsls	r2, r2, #10
 800ccc2:	189b      	adds	r3, r3, r2
 800ccc4:	000a      	movs	r2, r1
 800ccc6:	6193      	str	r3, [r2, #24]
 800ccc8:	6295      	str	r5, [r2, #40]	@ 0x28
 800ccca:	6839      	ldr	r1, [r7, #0]
 800cccc:	4b7e      	ldr	r3, [pc, #504]	@ (800cec8 <fn_0800CBFC+0x2cc>)
 800ccce:	8bea      	ldrh	r2, [r5, #30]
 800ccd0:	58cb      	ldr	r3, [r1, r3]
 800ccd2:	0092      	lsls	r2, r2, #2
 800ccd4:	189b      	adds	r3, r3, r2
 800ccd6:	78db      	ldrb	r3, [r3, #3]
 800ccd8:	065a      	lsls	r2, r3, #25
 800ccda:	d454      	bmi.n	800cd86 <fn_0800CBFC+0x18a>
 800ccdc:	211a      	movs	r1, #26
 800ccde:	5e6a      	ldrsh	r2, [r5, r1]
 800cce0:	09db      	lsrs	r3, r3, #7
 800cce2:	021b      	lsls	r3, r3, #8
 800cce4:	4053      	eors	r3, r2
 800cce6:	2206      	movs	r2, #6
 800cce8:	401a      	ands	r2, r3
 800ccea:	2a06      	cmp	r2, #6
 800ccec:	d14b      	bne.n	800cd86 <fn_0800CBFC+0x18a>
 800ccee:	21e0      	movs	r1, #224	@ 0xe0
 800ccf0:	2201      	movs	r2, #1
 800ccf2:	0189      	lsls	r1, r1, #6
 800ccf4:	428b      	cmp	r3, r1
 800ccf6:	dc00      	bgt.n	800ccfa <fn_0800CBFC+0xfe>
 800ccf8:	2200      	movs	r2, #0
 800ccfa:	0612      	lsls	r2, r2, #24
 800ccfc:	d043      	beq.n	800cd86 <fn_0800CBFC+0x18a>
 800ccfe:	221c      	movs	r2, #28
 800cd00:	5eab      	ldrsh	r3, [r5, r2]
 800cd02:	e041      	b.n	800cd88 <fn_0800CBFC+0x18c>
 800cd04:	201a      	movs	r0, #26
 800cd06:	5e29      	ldrsh	r1, [r5, r0]
 800cd08:	09db      	lsrs	r3, r3, #7
 800cd0a:	021b      	lsls	r3, r3, #8
 800cd0c:	404b      	eors	r3, r1
 800cd0e:	496f      	ldr	r1, [pc, #444]	@ (800cecc <fn_0800CBFC+0x2d0>)
 800cd10:	468c      	mov	ip, r1
 800cd12:	449c      	add	ip, r3
 800cd14:	4664      	mov	r4, ip
 800cd16:	2103      	movs	r1, #3
 800cd18:	0a20      	lsrs	r0, r4, #8
 800cd1a:	4008      	ands	r0, r1
 800cd1c:	4683      	mov	fp, r0
 800cd1e:	0960      	lsrs	r0, r4, #5
 800cd20:	4008      	ands	r0, r1
 800cd22:	4681      	mov	r9, r0
 800cd24:	08e0      	lsrs	r0, r4, #3
 800cd26:	9000      	str	r0, [sp, #0]
 800cd28:	4008      	ands	r0, r1
 800cd2a:	3104      	adds	r1, #4
 800cd2c:	400b      	ands	r3, r1
 800cd2e:	3b06      	subs	r3, #6
 800cd30:	4682      	mov	sl, r0
 800cd32:	9401      	str	r4, [sp, #4]
 800cd34:	2b01      	cmp	r3, #1
 800cd36:	d900      	bls.n	800cd3a <fn_0800CBFC+0x13e>
 800cd38:	e0bf      	b.n	800ceba <fn_0800CBFC+0x2be>
 800cd3a:	8ae9      	ldrh	r1, [r5, #22]
 800cd3c:	4b66      	ldr	r3, [pc, #408]	@ (800ced8 <fn_0800CBFC+0x2dc>)
 800cd3e:	4299      	cmp	r1, r3
 800cd40:	d015      	beq.n	800cd6e <fn_0800CBFC+0x172>
 800cd42:	4b66      	ldr	r3, [pc, #408]	@ (800cedc <fn_0800CBFC+0x2e0>)
 800cd44:	58d0      	ldr	r0, [r2, r3]
 800cd46:	004b      	lsls	r3, r1, #1
 800cd48:	185b      	adds	r3, r3, r1
 800cd4a:	009b      	lsls	r3, r3, #2
 800cd4c:	18c3      	adds	r3, r0, r3
 800cd4e:	895b      	ldrh	r3, [r3, #10]
 800cd50:	009c      	lsls	r4, r3, #2
 800cd52:	18e4      	adds	r4, r4, r3
 800cd54:	23df      	movs	r3, #223	@ 0xdf
 800cd56:	011b      	lsls	r3, r3, #4
 800cd58:	58d6      	ldr	r6, [r2, r3]
 800cd5a:	00e4      	lsls	r4, r4, #3
 800cd5c:	1936      	adds	r6, r6, r4
 800cd5e:	2e00      	cmp	r6, #0
 800cd60:	d005      	beq.n	800cd6e <fn_0800CBFC+0x172>
 800cd62:	0031      	movs	r1, r6
 800cd64:	2001      	movs	r0, #1
 800cd66:	f008 fb85 	bl	8015474 <fn_08015474>
 800cd6a:	2800      	cmp	r0, #0
 800cd6c:	d032      	beq.n	800cdd4 <fn_0800CBFC+0x1d8>
 800cd6e:	2300      	movs	r3, #0
 800cd70:	4698      	mov	r8, r3
 800cd72:	4640      	mov	r0, r8
 800cd74:	b005      	add	sp, #20
 800cd76:	bcf0      	pop	{r4, r5, r6, r7}
 800cd78:	46bb      	mov	fp, r7
 800cd7a:	46b2      	mov	sl, r6
 800cd7c:	46a9      	mov	r9, r5
 800cd7e:	46a0      	mov	r8, r4
 800cd80:	bcf0      	pop	{r4, r5, r6, r7}
 800cd82:	bc02      	pop	{r1}
 800cd84:	4708      	bx	r1
 800cd86:	2300      	movs	r3, #0
 800cd88:	9902      	ldr	r1, [sp, #8]
 800cd8a:	62cb      	str	r3, [r1, #44]	@ 0x2c
 800cd8c:	464b      	mov	r3, r9
 800cd8e:	2b02      	cmp	r3, #2
 800cd90:	d05f      	beq.n	800ce52 <fn_0800CBFC+0x256>
 800cd92:	2b03      	cmp	r3, #3
 800cd94:	d04a      	beq.n	800ce2c <fn_0800CBFC+0x230>
 800cd96:	2b01      	cmp	r3, #1
 800cd98:	d12a      	bne.n	800cdf0 <fn_0800CBFC+0x1f4>
 800cd9a:	61cb      	str	r3, [r1, #28]
 800cd9c:	0030      	movs	r0, r6
 800cd9e:	f007 ff73 	bl	8014c88 <fn_08014C88>
 800cda2:	4b4f      	ldr	r3, [pc, #316]	@ (800cee0 <fn_0800CBFC+0x2e4>)
 800cda4:	18c0      	adds	r0, r0, r3
 800cda6:	2302      	movs	r3, #2
 800cda8:	9a00      	ldr	r2, [sp, #0]
 800cdaa:	9902      	ldr	r1, [sp, #8]
 800cdac:	4013      	ands	r3, r2
 800cdae:	6872      	ldr	r2, [r6, #4]
 800cdb0:	6148      	str	r0, [r1, #20]
 800cdb2:	4290      	cmp	r0, r2
 800cdb4:	d06f      	beq.n	800ce96 <fn_0800CBFC+0x29a>
 800cdb6:	6908      	ldr	r0, [r1, #16]
 800cdb8:	2b00      	cmp	r3, #0
 800cdba:	d079      	beq.n	800ceb0 <fn_0800CBFC+0x2b4>
 800cdbc:	2158      	movs	r1, #88	@ 0x58
 800cdbe:	f008 fbcf 	bl	8015560 <fn_08015560>
 800cdc2:	230b      	movs	r3, #11
 800cdc4:	9a02      	ldr	r2, [sp, #8]
 800cdc6:	7313      	strb	r3, [r2, #12]
 800cdc8:	9b03      	ldr	r3, [sp, #12]
 800cdca:	2b00      	cmp	r3, #0
 800cdcc:	d127      	bne.n	800ce1e <fn_0800CBFC+0x222>
 800cdce:	3301      	adds	r3, #1
 800cdd0:	4698      	mov	r8, r3
 800cdd2:	e731      	b.n	800cc38 <fn_0800CBFC+0x3c>
 800cdd4:	10e3      	asrs	r3, r4, #3
 800cdd6:	08a4      	lsrs	r4, r4, #2
 800cdd8:	18e4      	adds	r4, r4, r3
 800cdda:	0122      	lsls	r2, r4, #4
 800cddc:	18a4      	adds	r4, r4, r2
 800cdde:	0222      	lsls	r2, r4, #8
 800cde0:	18a4      	adds	r4, r4, r2
 800cde2:	0422      	lsls	r2, r4, #16
 800cde4:	18a4      	adds	r4, r4, r2
 800cde6:	00a4      	lsls	r4, r4, #2
 800cde8:	18e4      	adds	r4, r4, r3
 800cdea:	2301      	movs	r3, #1
 800cdec:	9303      	str	r3, [sp, #12]
 800cdee:	e739      	b.n	800cc64 <fn_0800CBFC+0x68>
 800cdf0:	2301      	movs	r3, #1
 800cdf2:	0030      	movs	r0, r6
 800cdf4:	61cb      	str	r3, [r1, #28]
 800cdf6:	f007 ff47 	bl	8014c88 <fn_08014C88>
 800cdfa:	4b39      	ldr	r3, [pc, #228]	@ (800cee0 <fn_0800CBFC+0x2e4>)
 800cdfc:	18c0      	adds	r0, r0, r3
 800cdfe:	2302      	movs	r3, #2
 800ce00:	9a00      	ldr	r2, [sp, #0]
 800ce02:	9902      	ldr	r1, [sp, #8]
 800ce04:	4013      	ands	r3, r2
 800ce06:	6872      	ldr	r2, [r6, #4]
 800ce08:	6148      	str	r0, [r1, #20]
 800ce0a:	4290      	cmp	r0, r2
 800ce0c:	d047      	beq.n	800ce9e <fn_0800CBFC+0x2a2>
 800ce0e:	6908      	ldr	r0, [r1, #16]
 800ce10:	2b00      	cmp	r3, #0
 800ce12:	d048      	beq.n	800cea6 <fn_0800CBFC+0x2aa>
 800ce14:	2158      	movs	r1, #88	@ 0x58
 800ce16:	f008 fba3 	bl	8015560 <fn_08015560>
 800ce1a:	2309      	movs	r3, #9
 800ce1c:	e7d2      	b.n	800cdc4 <fn_0800CBFC+0x1c8>
 800ce1e:	2301      	movs	r3, #1
 800ce20:	4698      	mov	r8, r3
 800ce22:	e7a6      	b.n	800cd72 <fn_0800CBFC+0x176>
 800ce24:	2380      	movs	r3, #128	@ 0x80
 800ce26:	000a      	movs	r2, r1
 800ce28:	035b      	lsls	r3, r3, #13
 800ce2a:	e74c      	b.n	800ccc6 <fn_0800CBFC+0xca>
 800ce2c:	0030      	movs	r0, r6
 800ce2e:	f007 ff2b 	bl	8014c88 <fn_08014C88>
 800ce32:	4b2b      	ldr	r3, [pc, #172]	@ (800cee0 <fn_0800CBFC+0x2e4>)
 800ce34:	18c0      	adds	r0, r0, r3
 800ce36:	2301      	movs	r3, #1
 800ce38:	9a02      	ldr	r2, [sp, #8]
 800ce3a:	425b      	negs	r3, r3
 800ce3c:	61d3      	str	r3, [r2, #28]
 800ce3e:	9b00      	ldr	r3, [sp, #0]
 800ce40:	6150      	str	r0, [r2, #20]
 800ce42:	6910      	ldr	r0, [r2, #16]
 800ce44:	079b      	lsls	r3, r3, #30
 800ce46:	d521      	bpl.n	800ce8c <fn_0800CBFC+0x290>
 800ce48:	2159      	movs	r1, #89	@ 0x59
 800ce4a:	f008 fb89 	bl	8015560 <fn_08015560>
 800ce4e:	230d      	movs	r3, #13
 800ce50:	e7b8      	b.n	800cdc4 <fn_0800CBFC+0x1c8>
 800ce52:	6873      	ldr	r3, [r6, #4]
 800ce54:	614b      	str	r3, [r1, #20]
 800ce56:	2301      	movs	r3, #1
 800ce58:	425b      	negs	r3, r3
 800ce5a:	61cb      	str	r3, [r1, #28]
 800ce5c:	9b01      	ldr	r3, [sp, #4]
 800ce5e:	06db      	lsls	r3, r3, #27
 800ce60:	d50e      	bpl.n	800ce80 <fn_0800CBFC+0x284>
 800ce62:	2159      	movs	r1, #89	@ 0x59
 800ce64:	0030      	movs	r0, r6
 800ce66:	f008 fb7b 	bl	8015560 <fn_08015560>
 800ce6a:	230f      	movs	r3, #15
 800ce6c:	e7aa      	b.n	800cdc4 <fn_0800CBFC+0x1c8>
 800ce6e:	2380      	movs	r3, #128	@ 0x80
 800ce70:	000a      	movs	r2, r1
 800ce72:	031b      	lsls	r3, r3, #12
 800ce74:	e727      	b.n	800ccc6 <fn_0800CBFC+0xca>
 800ce76:	2396      	movs	r3, #150	@ 0x96
 800ce78:	005b      	lsls	r3, r3, #1
 800ce7a:	e70f      	b.n	800cc9c <fn_0800CBFC+0xa0>
 800ce7c:	4b19      	ldr	r3, [pc, #100]	@ (800cee4 <fn_0800CBFC+0x2e8>)
 800ce7e:	e70d      	b.n	800cc9c <fn_0800CBFC+0xa0>
 800ce80:	2115      	movs	r1, #21
 800ce82:	0030      	movs	r0, r6
 800ce84:	f008 fb6c 	bl	8015560 <fn_08015560>
 800ce88:	230e      	movs	r3, #14
 800ce8a:	e79b      	b.n	800cdc4 <fn_0800CBFC+0x1c8>
 800ce8c:	2115      	movs	r1, #21
 800ce8e:	f008 fb67 	bl	8015560 <fn_08015560>
 800ce92:	230c      	movs	r3, #12
 800ce94:	e796      	b.n	800cdc4 <fn_0800CBFC+0x1c8>
 800ce96:	1e5a      	subs	r2, r3, #1
 800ce98:	4193      	sbcs	r3, r2
 800ce9a:	330a      	adds	r3, #10
 800ce9c:	e792      	b.n	800cdc4 <fn_0800CBFC+0x1c8>
 800ce9e:	1e5a      	subs	r2, r3, #1
 800cea0:	4193      	sbcs	r3, r2
 800cea2:	3308      	adds	r3, #8
 800cea4:	e78e      	b.n	800cdc4 <fn_0800CBFC+0x1c8>
 800cea6:	2114      	movs	r1, #20
 800cea8:	f008 fb5a 	bl	8015560 <fn_08015560>
 800ceac:	2308      	movs	r3, #8
 800ceae:	e789      	b.n	800cdc4 <fn_0800CBFC+0x1c8>
 800ceb0:	2114      	movs	r1, #20
 800ceb2:	f008 fb55 	bl	8015560 <fn_08015560>
 800ceb6:	230a      	movs	r3, #10
 800ceb8:	e784      	b.n	800cdc4 <fn_0800CBFC+0x1c8>
 800ceba:	2300      	movs	r3, #0
 800cebc:	2401      	movs	r4, #1
 800cebe:	4698      	mov	r8, r3
 800cec0:	4264      	negs	r4, r4
 800cec2:	e6b9      	b.n	800cc38 <fn_0800CBFC+0x3c>
 800cec4:	030064c4 	.word	0x030064c4
 800cec8:	00000e04 	.word	0x00000e04
 800cecc:	ffffc400 	.word	0xffffc400
 800ced0:	1ffff880 	.word	0x1ffff880
 800ced4:	0800704d 	.word	0x0800704d
 800ced8:	0000ffff 	.word	0x0000ffff
 800cedc:	00000e0c 	.word	0x00000e0c
 800cee0:	fffc0000 	.word	0xfffc0000
 800cee4:	0000041a 	.word	0x0000041a
