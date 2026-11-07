fn_080098C0:
 80098c0:	6d02      	ldr	r2, [r0, #80]	@ 0x50
 80098c2:	b570      	push	{r4, r5, r6, lr}
 80098c4:	0004      	movs	r4, r0
 80098c6:	2a00      	cmp	r2, #0
 80098c8:	d027      	beq.n	800991a <fn_080098C0+0x5a>
 80098ca:	2120      	movs	r1, #32
 80098cc:	6cc3      	ldr	r3, [r0, #76]	@ 0x4c
 80098ce:	320c      	adds	r2, #12
 80098d0:	438b      	bics	r3, r1
 80098d2:	64c3      	str	r3, [r0, #76]	@ 0x4c
 80098d4:	6901      	ldr	r1, [r0, #16]
 80098d6:	ca0c      	ldmia	r2, {r2, r3}
 80098d8:	68c0      	ldr	r0, [r0, #12]
 80098da:	f01b fe41 	bl	8025560 <fn_08025560>
 80098de:	6d23      	ldr	r3, [r4, #80]	@ 0x50
 80098e0:	6cda      	ldr	r2, [r3, #76]	@ 0x4c
 80098e2:	6220      	str	r0, [r4, #32]
 80098e4:	0352      	lsls	r2, r2, #13
 80098e6:	d41b      	bmi.n	8009920 <fn_080098C0+0x60>
 80098e8:	330c      	adds	r3, #12
 80098ea:	cb07      	ldmia	r3!, {r0, r1, r2}
 80098ec:	2304      	movs	r3, #4
 80098ee:	f007 fa7d 	bl	8010dec <fn_08010DEC>
 80098f2:	0005      	movs	r5, r0
 80098f4:	0020      	movs	r0, r4
 80098f6:	0029      	movs	r1, r5
 80098f8:	3060      	adds	r0, #96	@ 0x60
 80098fa:	f00e fe59 	bl	80185b0 <fn_080185B0>
 80098fe:	0028      	movs	r0, r5
 8009900:	0021      	movs	r1, r4
 8009902:	3050      	adds	r0, #80	@ 0x50
 8009904:	f00e fe54 	bl	80185b0 <fn_080185B0>
 8009908:	0028      	movs	r0, r5
 800990a:	6d21      	ldr	r1, [r4, #80]	@ 0x50
 800990c:	3060      	adds	r0, #96	@ 0x60
 800990e:	f00e fe4f 	bl	80185b0 <fn_080185B0>
 8009912:	2100      	movs	r1, #0
 8009914:	0028      	movs	r0, r5
 8009916:	f7ff ff9b 	bl	8009850 <fn_08009850>
 800991a:	bc70      	pop	{r4, r5, r6}
 800991c:	bc01      	pop	{r0}
 800991e:	4700      	bx	r0
 8009920:	f7fd f8ee 	bl	8006b00 <fn_08006B00>
 8009924:	0005      	movs	r5, r0
 8009926:	f7fd f8eb 	bl	8006b00 <fn_08006B00>
 800992a:	6a23      	ldr	r3, [r4, #32]
 800992c:	1a2d      	subs	r5, r5, r0
 800992e:	056d      	lsls	r5, r5, #21
 8009930:	195b      	adds	r3, r3, r5
 8009932:	6223      	str	r3, [r4, #32]
 8009934:	6d23      	ldr	r3, [r4, #80]	@ 0x50
 8009936:	e7d7      	b.n	80098e8 <fn_080098C0+0x28>
