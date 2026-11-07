fn_0800FE7C:
 800fe7c:	b5f0      	push	{r4, r5, r6, r7, lr}
 800fe7e:	46d6      	mov	lr, sl
 800fe80:	464f      	mov	r7, r9
 800fe82:	4646      	mov	r6, r8
 800fe84:	b5c0      	push	{r6, r7, lr}
 800fe86:	2308      	movs	r3, #8
 800fe88:	5ecd      	ldrsh	r5, [r1, r3]
 800fe8a:	000c      	movs	r4, r1
 800fe8c:	b084      	sub	sp, #16
 800fe8e:	2d00      	cmp	r5, #0
 800fe90:	d051      	beq.n	800ff36 <fn_0800FE7C+0xba>
 800fe92:	230a      	movs	r3, #10
 800fe94:	5ecf      	ldrsh	r7, [r1, r3]
 800fe96:	884e      	ldrh	r6, [r1, #2]
 800fe98:	6843      	ldr	r3, [r0, #4]
 800fe9a:	6802      	ldr	r2, [r0, #0]
 800fe9c:	469a      	mov	sl, r3
 800fe9e:	0436      	lsls	r6, r6, #16
 800fea0:	2f00      	cmp	r7, #0
 800fea2:	d039      	beq.n	800ff18 <fn_0800FE7C+0x9c>
 800fea4:	002b      	movs	r3, r5
 800fea6:	6881      	ldr	r1, [r0, #8]
 800fea8:	68c0      	ldr	r0, [r0, #12]
 800feaa:	407b      	eors	r3, r7
 800feac:	9103      	str	r1, [sp, #12]
 800feae:	9002      	str	r0, [sp, #8]
 800feb0:	0029      	movs	r1, r5
 800feb2:	1b90      	subs	r0, r2, r6
 800feb4:	9301      	str	r3, [sp, #4]
 800feb6:	f015 fbe9 	bl	802568c <fn_0802568C>
 800feba:	8824      	ldrh	r4, [r4, #0]
 800febc:	4681      	mov	r9, r0
 800febe:	9802      	ldr	r0, [sp, #8]
 800fec0:	0424      	lsls	r4, r4, #16
 800fec2:	1b01      	subs	r1, r0, r4
 800fec4:	0038      	movs	r0, r7
 800fec6:	f015 fbe1 	bl	802568c <fn_0802568C>
 800feca:	4653      	mov	r3, sl
 800fecc:	0029      	movs	r1, r5
 800fece:	4680      	mov	r8, r0
 800fed0:	1b98      	subs	r0, r3, r6
 800fed2:	f015 fbdb 	bl	802568c <fn_0802568C>
 800fed6:	9903      	ldr	r1, [sp, #12]
 800fed8:	0005      	movs	r5, r0
 800feda:	1b09      	subs	r1, r1, r4
 800fedc:	0038      	movs	r0, r7
 800fede:	f015 fbd5 	bl	802568c <fn_0802568C>
 800fee2:	9a01      	ldr	r2, [sp, #4]
 800fee4:	0003      	movs	r3, r0
 800fee6:	2a00      	cmp	r2, #0
 800fee8:	da57      	bge.n	800ff9a <fn_0800FE7C+0x11e>
 800feea:	0fc1      	lsrs	r1, r0, #31
 800feec:	17ea      	asrs	r2, r5, #31
 800feee:	4285      	cmp	r5, r0
 800fef0:	414a      	adcs	r2, r1
 800fef2:	464c      	mov	r4, r9
 800fef4:	4641      	mov	r1, r8
 800fef6:	0613      	lsls	r3, r2, #24
 800fef8:	0fc8      	lsrs	r0, r1, #31
 800fefa:	17e2      	asrs	r2, r4, #31
 800fefc:	428c      	cmp	r4, r1
 800fefe:	4150      	adcs	r0, r2
 800ff00:	0600      	lsls	r0, r0, #24
 800ff02:	4298      	cmp	r0, r3
 800ff04:	d114      	bne.n	800ff30 <fn_0800FE7C+0xb4>
 800ff06:	0e00      	lsrs	r0, r0, #24
 800ff08:	b004      	add	sp, #16
 800ff0a:	bce0      	pop	{r5, r6, r7}
 800ff0c:	46ba      	mov	sl, r7
 800ff0e:	46b1      	mov	r9, r6
 800ff10:	46a8      	mov	r8, r5
 800ff12:	bcf0      	pop	{r4, r5, r6, r7}
 800ff14:	bc02      	pop	{r1}
 800ff16:	4708      	bx	r1
 800ff18:	2001      	movs	r0, #1
 800ff1a:	4296      	cmp	r6, r2
 800ff1c:	da33      	bge.n	800ff86 <fn_0800FE7C+0x10a>
 800ff1e:	0600      	lsls	r0, r0, #24
 800ff20:	2301      	movs	r3, #1
 800ff22:	0e00      	lsrs	r0, r0, #24
 800ff24:	4556      	cmp	r6, sl
 800ff26:	da28      	bge.n	800ff7a <fn_0800FE7C+0xfe>
 800ff28:	061b      	lsls	r3, r3, #24
 800ff2a:	0e1b      	lsrs	r3, r3, #24
 800ff2c:	4283      	cmp	r3, r0
 800ff2e:	d031      	beq.n	800ff94 <fn_0800FE7C+0x118>
 800ff30:	2001      	movs	r0, #1
 800ff32:	4240      	negs	r0, r0
 800ff34:	e7e8      	b.n	800ff08 <fn_0800FE7C+0x8c>
 800ff36:	8809      	ldrh	r1, [r1, #0]
 800ff38:	68c2      	ldr	r2, [r0, #12]
 800ff3a:	2301      	movs	r3, #1
 800ff3c:	0409      	lsls	r1, r1, #16
 800ff3e:	428a      	cmp	r2, r1
 800ff40:	da13      	bge.n	800ff6a <fn_0800FE7C+0xee>
 800ff42:	6880      	ldr	r0, [r0, #8]
 800ff44:	061b      	lsls	r3, r3, #24
 800ff46:	2201      	movs	r2, #1
 800ff48:	0e1b      	lsrs	r3, r3, #24
 800ff4a:	4288      	cmp	r0, r1
 800ff4c:	da07      	bge.n	800ff5e <fn_0800FE7C+0xe2>
 800ff4e:	0612      	lsls	r2, r2, #24
 800ff50:	0e12      	lsrs	r2, r2, #24
 800ff52:	429a      	cmp	r2, r3
 800ff54:	d1ec      	bne.n	800ff30 <fn_0800FE7C+0xb4>
 800ff56:	8960      	ldrh	r0, [r4, #10]
 800ff58:	0bc0      	lsrs	r0, r0, #15
 800ff5a:	4058      	eors	r0, r3
 800ff5c:	e7d4      	b.n	800ff08 <fn_0800FE7C+0x8c>
 800ff5e:	2200      	movs	r2, #0
 800ff60:	0612      	lsls	r2, r2, #24
 800ff62:	0e12      	lsrs	r2, r2, #24
 800ff64:	429a      	cmp	r2, r3
 800ff66:	d1e3      	bne.n	800ff30 <fn_0800FE7C+0xb4>
 800ff68:	e7f5      	b.n	800ff56 <fn_0800FE7C+0xda>
 800ff6a:	2300      	movs	r3, #0
 800ff6c:	6880      	ldr	r0, [r0, #8]
 800ff6e:	061b      	lsls	r3, r3, #24
 800ff70:	2201      	movs	r2, #1
 800ff72:	0e1b      	lsrs	r3, r3, #24
 800ff74:	4288      	cmp	r0, r1
 800ff76:	dbea      	blt.n	800ff4e <fn_0800FE7C+0xd2>
 800ff78:	e7f1      	b.n	800ff5e <fn_0800FE7C+0xe2>
 800ff7a:	2300      	movs	r3, #0
 800ff7c:	061b      	lsls	r3, r3, #24
 800ff7e:	0e1b      	lsrs	r3, r3, #24
 800ff80:	4283      	cmp	r3, r0
 800ff82:	d1d5      	bne.n	800ff30 <fn_0800FE7C+0xb4>
 800ff84:	e006      	b.n	800ff94 <fn_0800FE7C+0x118>
 800ff86:	2000      	movs	r0, #0
 800ff88:	0600      	lsls	r0, r0, #24
 800ff8a:	2301      	movs	r3, #1
 800ff8c:	0e00      	lsrs	r0, r0, #24
 800ff8e:	4556      	cmp	r6, sl
 800ff90:	dbca      	blt.n	800ff28 <fn_0800FE7C+0xac>
 800ff92:	e7f2      	b.n	800ff7a <fn_0800FE7C+0xfe>
 800ff94:	0fed      	lsrs	r5, r5, #31
 800ff96:	4068      	eors	r0, r5
 800ff98:	e7b6      	b.n	800ff08 <fn_0800FE7C+0x8c>
 800ff9a:	4644      	mov	r4, r8
 800ff9c:	17e9      	asrs	r1, r5, #31
 800ff9e:	0fe2      	lsrs	r2, r4, #31
 800ffa0:	42a5      	cmp	r5, r4
 800ffa2:	414a      	adcs	r2, r1
 800ffa4:	464c      	mov	r4, r9
 800ffa6:	0fd9      	lsrs	r1, r3, #31
 800ffa8:	17e0      	asrs	r0, r4, #31
 800ffaa:	429c      	cmp	r4, r3
 800ffac:	4148      	adcs	r0, r1
 800ffae:	0612      	lsls	r2, r2, #24
 800ffb0:	0600      	lsls	r0, r0, #24
 800ffb2:	4290      	cmp	r0, r2
 800ffb4:	d0a7      	beq.n	800ff06 <fn_0800FE7C+0x8a>
 800ffb6:	2001      	movs	r0, #1
 800ffb8:	4240      	negs	r0, r0
 800ffba:	e7a5      	b.n	800ff08 <fn_0800FE7C+0x8c>
