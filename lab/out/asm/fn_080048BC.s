fn_080048BC:
 80048bc:	6c43      	ldr	r3, [r0, #68]	@ 0x44
 80048be:	781b      	ldrb	r3, [r3, #0]
 80048c0:	b570      	push	{r4, r5, r6, lr}
 80048c2:	0005      	movs	r5, r0
 80048c4:	2b00      	cmp	r3, #0
 80048c6:	d011      	beq.n	80048ec <fn_080048BC+0x30>
 80048c8:	6bc2      	ldr	r2, [r0, #60]	@ 0x3c
 80048ca:	2a00      	cmp	r2, #0
 80048cc:	dd0e      	ble.n	80048ec <fn_080048BC+0x30>
 80048ce:	2400      	movs	r4, #0
 80048d0:	6c2b      	ldr	r3, [r5, #64]	@ 0x40
 80048d2:	1b1b      	subs	r3, r3, r4
 80048d4:	d500      	bpl.n	80048d8 <fn_080048BC+0x1c>
 80048d6:	189b      	adds	r3, r3, r2
 80048d8:	0118      	lsls	r0, r3, #4
 80048da:	1ac0      	subs	r0, r0, r3
 80048dc:	0080      	lsls	r0, r0, #2
 80048de:	1828      	adds	r0, r5, r0
 80048e0:	f7ff fef2 	bl	80046c8 <fn_080046C8>
 80048e4:	6bea      	ldr	r2, [r5, #60]	@ 0x3c
 80048e6:	3401      	adds	r4, #1
 80048e8:	42a2      	cmp	r2, r4
 80048ea:	dcf1      	bgt.n	80048d0 <fn_080048BC+0x14>
 80048ec:	bc70      	pop	{r4, r5, r6}
 80048ee:	bc01      	pop	{r0}
 80048f0:	4700      	bx	r0
 80048f2:	46c0      	nop			@ (mov r8, r8)
