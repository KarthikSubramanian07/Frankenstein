fn_08001B3C:
 8001b3c:	2200      	movs	r2, #0
 8001b3e:	21e4      	movs	r1, #228	@ 0xe4
 8001b40:	4b14      	ldr	r3, [pc, #80]	@ (8001b94 <fn_08001B3C+0x58>)
 8001b42:	681b      	ldr	r3, [r3, #0]
 8001b44:	b570      	push	{r4, r5, r6, lr}
 8001b46:	545a      	strb	r2, [r3, r1]
 8001b48:	4913      	ldr	r1, [pc, #76]	@ (8001b98 <fn_08001B3C+0x5c>)
 8001b4a:	545a      	strb	r2, [r3, r1]
 8001b4c:	39db      	subs	r1, #219	@ 0xdb
 8001b4e:	39ff      	subs	r1, #255	@ 0xff
 8001b50:	545a      	strb	r2, [r3, r1]
 8001b52:	2282      	movs	r2, #130	@ 0x82
 8001b54:	21c0      	movs	r1, #192	@ 0xc0
 8001b56:	32ff      	adds	r2, #255	@ 0xff
 8001b58:	679a      	str	r2, [r3, #120]	@ 0x78
 8001b5a:	0089      	lsls	r1, r1, #2
 8001b5c:	3aad      	subs	r2, #173	@ 0xad
 8001b5e:	5299      	strh	r1, [r3, r2]
 8001b60:	6f58      	ldr	r0, [r3, #116]	@ 0x74
 8001b62:	3a40      	subs	r2, #64	@ 0x40
 8001b64:	5c9d      	ldrb	r5, [r3, r2]
 8001b66:	3001      	adds	r0, #1
 8001b68:	0082      	lsls	r2, r0, #2
 8001b6a:	490c      	ldr	r1, [pc, #48]	@ (8001b9c <fn_08001B3C+0x60>)
 8001b6c:	1954      	adds	r4, r2, r5
 8001b6e:	00e4      	lsls	r4, r4, #3
 8001b70:	590c      	ldr	r4, [r1, r4]
 8001b72:	2c00      	cmp	r4, #0
 8001b74:	d009      	beq.n	8001b8a <fn_08001B3C+0x4e>
 8001b76:	1952      	adds	r2, r2, r5
 8001b78:	00d2      	lsls	r2, r2, #3
 8001b7a:	1889      	adds	r1, r1, r2
 8001b7c:	6758      	str	r0, [r3, #116]	@ 0x74
 8001b7e:	6848      	ldr	r0, [r1, #4]
 8001b80:	f000 fb6f 	bl	8002262 <fn_08002190+0xd2>
 8001b84:	bc70      	pop	{r4, r5, r6}
 8001b86:	bc01      	pop	{r0}
 8001b88:	4700      	bx	r0
 8001b8a:	00ea      	lsls	r2, r5, #3
 8001b8c:	588c      	ldr	r4, [r1, r2]
 8001b8e:	2000      	movs	r0, #0
 8001b90:	2200      	movs	r2, #0
 8001b92:	e7f0      	b.n	8001b76 <fn_08001B3C+0x3a>
 8001b94:	030064c4 	.word	0x030064c4
 8001b98:	0000025b 	.word	0x0000025b
 8001b9c:	08025708 	.word	0x08025708
