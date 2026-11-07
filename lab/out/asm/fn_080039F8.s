fn_080039F8:
 80039f8:	2284      	movs	r2, #132	@ 0x84
 80039fa:	b510      	push	{r4, lr}
 80039fc:	4b10      	ldr	r3, [pc, #64]	@ (8003a40 <fn_080039F8+0x48>)
 80039fe:	b086      	sub	sp, #24
 8003a00:	9300      	str	r3, [sp, #0]
 8003a02:	4b10      	ldr	r3, [pc, #64]	@ (8003a44 <fn_080039F8+0x4c>)
 8003a04:	681b      	ldr	r3, [r3, #0]
 8003a06:	589a      	ldr	r2, [r3, r2]
 8003a08:	9202      	str	r2, [sp, #8]
 8003a0a:	4a0f      	ldr	r2, [pc, #60]	@ (8003a48 <fn_080039F8+0x50>)
 8003a0c:	589a      	ldr	r2, [r3, r2]
 8003a0e:	9201      	str	r2, [sp, #4]
 8003a10:	22ed      	movs	r2, #237	@ 0xed
 8003a12:	00d2      	lsls	r2, r2, #3
 8003a14:	589a      	ldr	r2, [r3, r2]
 8003a16:	9203      	str	r2, [sp, #12]
 8003a18:	4a0c      	ldr	r2, [pc, #48]	@ (8003a4c <fn_080039F8+0x54>)
 8003a1a:	589a      	ldr	r2, [r3, r2]
 8003a1c:	9204      	str	r2, [sp, #16]
 8003a1e:	4a0c      	ldr	r2, [pc, #48]	@ (8003a50 <fn_080039F8+0x58>)
 8003a20:	589b      	ldr	r3, [r3, r2]
 8003a22:	4c0c      	ldr	r4, [pc, #48]	@ (8003a54 <fn_080039F8+0x5c>)
 8003a24:	9305      	str	r3, [sp, #20]
 8003a26:	480c      	ldr	r0, [pc, #48]	@ (8003a58 <fn_080039F8+0x60>)
 8003a28:	4b0c      	ldr	r3, [pc, #48]	@ (8003a5c <fn_080039F8+0x64>)
 8003a2a:	446c      	add	r4, sp
 8003a2c:	001a      	movs	r2, r3
 8003a2e:	3301      	adds	r3, #1
 8003a30:	5d19      	ldrb	r1, [r3, r4]
 8003a32:	7011      	strb	r1, [r2, #0]
 8003a34:	4283      	cmp	r3, r0
 8003a36:	d1f9      	bne.n	8003a2c <fn_080039F8+0x34>
 8003a38:	b006      	add	sp, #24
 8003a3a:	bc10      	pop	{r4}
 8003a3c:	bc01      	pop	{r0}
 8003a3e:	4700      	bx	r0
 8003a40:	baddead1 	.word	0xbaddead1
 8003a44:	030064c4 	.word	0x030064c4
 8003a48:	0000076c 	.word	0x0000076c
 8003a4c:	00005634 	.word	0x00005634
 8003a50:	00005630 	.word	0x00005630
 8003a54:	f1fffcff 	.word	0xf1fffcff
 8003a58:	0e000318 	.word	0x0e000318
 8003a5c:	0e000300 	.word	0x0e000300
