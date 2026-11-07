fn_080091C8:
 80091c8:	6d02      	ldr	r2, [r0, #80]	@ 0x50
 80091ca:	b570      	push	{r4, r5, r6, lr}
 80091cc:	0004      	movs	r4, r0
 80091ce:	2a00      	cmp	r2, #0
 80091d0:	d017      	beq.n	8009202 <fn_080091C8+0x3a>
 80091d2:	2120      	movs	r1, #32
 80091d4:	6cc3      	ldr	r3, [r0, #76]	@ 0x4c
 80091d6:	320c      	adds	r2, #12
 80091d8:	438b      	bics	r3, r1
 80091da:	64c3      	str	r3, [r0, #76]	@ 0x4c
 80091dc:	6901      	ldr	r1, [r0, #16]
 80091de:	ca0c      	ldmia	r2, {r2, r3}
 80091e0:	68c0      	ldr	r0, [r0, #12]
 80091e2:	f01c f9bd 	bl	8025560 <fn_08025560>
 80091e6:	6d23      	ldr	r3, [r4, #80]	@ 0x50
 80091e8:	6cdb      	ldr	r3, [r3, #76]	@ 0x4c
 80091ea:	6220      	str	r0, [r4, #32]
 80091ec:	035b      	lsls	r3, r3, #13
 80091ee:	d40b      	bmi.n	8009208 <fn_080091C8+0x40>
 80091f0:	210e      	movs	r1, #14
 80091f2:	0020      	movs	r0, r4
 80091f4:	f011 f868 	bl	801a2c8 <fn_0801A2C8>
 80091f8:	2221      	movs	r2, #33	@ 0x21
 80091fa:	0020      	movs	r0, r4
 80091fc:	6d21      	ldr	r1, [r4, #80]	@ 0x50
 80091fe:	f008 ff0d 	bl	801201c <fn_0801201C>
 8009202:	bc70      	pop	{r4, r5, r6}
 8009204:	bc01      	pop	{r0}
 8009206:	4700      	bx	r0
 8009208:	f7fd fc7a 	bl	8006b00 <fn_08006B00>
 800920c:	0005      	movs	r5, r0
 800920e:	f7fd fc77 	bl	8006b00 <fn_08006B00>
 8009212:	6a23      	ldr	r3, [r4, #32]
 8009214:	1a28      	subs	r0, r5, r0
 8009216:	0540      	lsls	r0, r0, #21
 8009218:	181b      	adds	r3, r3, r0
 800921a:	6223      	str	r3, [r4, #32]
 800921c:	e7e8      	b.n	80091f0 <fn_080091C8+0x28>
 800921e:	46c0      	nop			@ (mov r8, r8)
