fn_08013074:
 8013074:	4b18      	ldr	r3, [pc, #96]	@ (80130d8 <fn_08013074+0x64>)
 8013076:	681b      	ldr	r3, [r3, #0]
 8013078:	469c      	mov	ip, r3
 801307a:	2353      	movs	r3, #83	@ 0x53
 801307c:	4661      	mov	r1, ip
 801307e:	b510      	push	{r4, lr}
 8013080:	4a16      	ldr	r2, [pc, #88]	@ (80130dc <fn_08013074+0x68>)
 8013082:	5cc3      	ldrb	r3, [r0, r3]
 8013084:	5889      	ldr	r1, [r1, r2]
 8013086:	005a      	lsls	r2, r3, #1
 8013088:	18d2      	adds	r2, r2, r3
 801308a:	00d2      	lsls	r2, r2, #3
 801308c:	5851      	ldr	r1, [r2, r1]
 801308e:	060a      	lsls	r2, r1, #24
 8013090:	b082      	sub	sp, #8
 8013092:	0e12      	lsrs	r2, r2, #24
 8013094:	2b06      	cmp	r3, #6
 8013096:	d015      	beq.n	80130c4 <fn_08013074+0x50>
 8013098:	3b08      	subs	r3, #8
 801309a:	001c      	movs	r4, r3
 801309c:	4263      	negs	r3, r4
 801309e:	4163      	adcs	r3, r4
 80130a0:	3301      	adds	r3, #1
 80130a2:	2a05      	cmp	r2, #5
 80130a4:	d015      	beq.n	80130d2 <fn_08013074+0x5e>
 80130a6:	22ff      	movs	r2, #255	@ 0xff
 80130a8:	400a      	ands	r2, r1
 80130aa:	0092      	lsls	r2, r2, #2
 80130ac:	1880      	adds	r0, r0, r2
 80130ae:	6fc2      	ldr	r2, [r0, #124]	@ 0x7c
 80130b0:	0fd9      	lsrs	r1, r3, #31
 80130b2:	17d0      	asrs	r0, r2, #31
 80130b4:	429a      	cmp	r2, r3
 80130b6:	4148      	adcs	r0, r1
 80130b8:	0600      	lsls	r0, r0, #24
 80130ba:	0e00      	lsrs	r0, r0, #24
 80130bc:	b002      	add	sp, #8
 80130be:	bc10      	pop	{r4}
 80130c0:	bc02      	pop	{r1}
 80130c2:	4708      	bx	r1
 80130c4:	23eb      	movs	r3, #235	@ 0xeb
 80130c6:	4664      	mov	r4, ip
 80130c8:	00db      	lsls	r3, r3, #3
 80130ca:	58e3      	ldr	r3, [r4, r3]
 80130cc:	6b1b      	ldr	r3, [r3, #48]	@ 0x30
 80130ce:	2a05      	cmp	r2, #5
 80130d0:	d1e9      	bne.n	80130a6 <fn_08013074+0x32>
 80130d2:	2001      	movs	r0, #1
 80130d4:	e7f2      	b.n	80130bc <fn_08013074+0x48>
 80130d6:	46c0      	nop			@ (mov r8, r8)
 80130d8:	030064c4 	.word	0x030064c4
 80130dc:	00000754 	.word	0x00000754
