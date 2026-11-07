fn_08004DB4:
 8004db4:	b5f0      	push	{r4, r5, r6, r7, lr}
 8004db6:	1e43      	subs	r3, r0, #1
 8004db8:	000e      	movs	r6, r1
 8004dba:	b085      	sub	sp, #20
 8004dbc:	2b42      	cmp	r3, #66	@ 0x42
 8004dbe:	d903      	bls.n	8004dc8 <fn_08004DB4+0x14>
 8004dc0:	b005      	add	sp, #20
 8004dc2:	bcf0      	pop	{r4, r5, r6, r7}
 8004dc4:	bc01      	pop	{r0}
 8004dc6:	4700      	bx	r0
 8004dc8:	4b0f      	ldr	r3, [pc, #60]	@ (8004e08 <fn_08004DB4+0x54>)
 8004dca:	0080      	lsls	r0, r0, #2
 8004dcc:	58c3      	ldr	r3, [r0, r3]
 8004dce:	2109      	movs	r1, #9
 8004dd0:	4a0e      	ldr	r2, [pc, #56]	@ (8004e0c <fn_08004DB4+0x58>)
 8004dd2:	a801      	add	r0, sp, #4
 8004dd4:	f000 fb40 	bl	8005458 <fn_08005458>
 8004dd8:	a801      	add	r0, sp, #4
 8004dda:	f018 fb2b 	bl	801d434 <fn_0801D434>
 8004dde:	1e04      	subs	r4, r0, #0
 8004de0:	dbee      	blt.n	8004dc0 <fn_08004DB4+0xc>
 8004de2:	f018 fbc1 	bl	801d568 <fn_0801D568>
 8004de6:	0007      	movs	r7, r0
 8004de8:	0020      	movs	r0, r4
 8004dea:	f018 fba3 	bl	801d534 <fn_0801D534>
 8004dee:	4b08      	ldr	r3, [pc, #32]	@ (8004e10 <fn_08004DB4+0x5c>)
 8004df0:	001a      	movs	r2, r3
 8004df2:	881d      	ldrh	r5, [r3, #0]
 8004df4:	2300      	movs	r3, #0
 8004df6:	0014      	movs	r4, r2
 8004df8:	0001      	movs	r1, r0
 8004dfa:	8013      	strh	r3, [r2, #0]
 8004dfc:	0038      	movs	r0, r7
 8004dfe:	0032      	movs	r2, r6
 8004e00:	f014 feb0 	bl	8019b64 <fn_08019B64>
 8004e04:	8025      	strh	r5, [r4, #0]
 8004e06:	e7db      	b.n	8004dc0 <fn_08004DB4+0xc>
 8004e08:	08025a88 	.word	0x08025a88
 8004e0c:	0814942c 	.word	0x0814942c
 8004e10:	04000208 	.word	0x04000208
