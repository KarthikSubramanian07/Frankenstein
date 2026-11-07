fn_08019B44:
 8019b44:	2807      	cmp	r0, #7
 8019b46:	d809      	bhi.n	8019b5c <fn_08019B44+0x18>
 8019b48:	229b      	movs	r2, #155	@ 0x9b
 8019b4a:	4b05      	ldr	r3, [pc, #20]	@ (8019b60 <fn_08019B44+0x1c>)
 8019b4c:	681b      	ldr	r3, [r3, #0]
 8019b4e:	0100      	lsls	r0, r0, #4
 8019b50:	181b      	adds	r3, r3, r0
 8019b52:	00d2      	lsls	r2, r2, #3
 8019b54:	5898      	ldr	r0, [r3, r2]
 8019b56:	1e43      	subs	r3, r0, #1
 8019b58:	4198      	sbcs	r0, r3
 8019b5a:	4770      	bx	lr
 8019b5c:	2000      	movs	r0, #0
 8019b5e:	e7fc      	b.n	8019b5a <fn_08019B44+0x16>
 8019b60:	030064c4 	.word	0x030064c4
