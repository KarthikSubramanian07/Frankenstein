fn_08012AE4:
 8012ae4:	2808      	cmp	r0, #8
 8012ae6:	d811      	bhi.n	8012b0c <fn_08012AE4+0x28>
 8012ae8:	4b26      	ldr	r3, [pc, #152]	@ (8012b84 <fn_08012AE4+0xa0>)
 8012aea:	0080      	lsls	r0, r0, #2
 8012aec:	581b      	ldr	r3, [r3, r0]
 8012aee:	469f      	mov	pc, r3
 8012af0:	2007      	movs	r0, #7
 8012af2:	4770      	bx	lr
 8012af4:	2000      	movs	r0, #0
 8012af6:	e7fc      	b.n	8012af2 <fn_08012AE4+0xe>
 8012af8:	4b23      	ldr	r3, [pc, #140]	@ (8012b88 <fn_08012AE4+0xa4>)
 8012afa:	681a      	ldr	r2, [r3, #0]
 8012afc:	2394      	movs	r3, #148	@ 0x94
 8012afe:	5cd3      	ldrb	r3, [r2, r3]
 8012b00:	2b00      	cmp	r3, #0
 8012b02:	d003      	beq.n	8012b0c <fn_08012AE4+0x28>
 8012b04:	2384      	movs	r3, #132	@ 0x84
 8012b06:	58cb      	ldr	r3, [r1, r3]
 8012b08:	2b27      	cmp	r3, #39	@ 0x27
 8012b0a:	dc39      	bgt.n	8012b80 <fn_08012AE4+0x9c>
 8012b0c:	200a      	movs	r0, #10
 8012b0e:	e7f0      	b.n	8012af2 <fn_08012AE4+0xe>
 8012b10:	4b1d      	ldr	r3, [pc, #116]	@ (8012b88 <fn_08012AE4+0xa4>)
 8012b12:	681a      	ldr	r2, [r3, #0]
 8012b14:	2394      	movs	r3, #148	@ 0x94
 8012b16:	5cd3      	ldrb	r3, [r2, r3]
 8012b18:	2b02      	cmp	r3, #2
 8012b1a:	d1f7      	bne.n	8012b0c <fn_08012AE4+0x28>
 8012b1c:	337e      	adds	r3, #126	@ 0x7e
 8012b1e:	58cb      	ldr	r3, [r1, r3]
 8012b20:	2008      	movs	r0, #8
 8012b22:	2b01      	cmp	r3, #1
 8012b24:	dce5      	bgt.n	8012af2 <fn_08012AE4+0xe>
 8012b26:	3002      	adds	r0, #2
 8012b28:	e7e3      	b.n	8012af2 <fn_08012AE4+0xe>
 8012b2a:	6fc8      	ldr	r0, [r1, #124]	@ 0x7c
 8012b2c:	1e43      	subs	r3, r0, #1
 8012b2e:	4198      	sbcs	r0, r3
 8012b30:	2308      	movs	r3, #8
 8012b32:	4240      	negs	r0, r0
 8012b34:	4398      	bics	r0, r3
 8012b36:	300a      	adds	r0, #10
 8012b38:	e7db      	b.n	8012af2 <fn_08012AE4+0xe>
 8012b3a:	2380      	movs	r3, #128	@ 0x80
 8012b3c:	58c8      	ldr	r0, [r1, r3]
 8012b3e:	1e43      	subs	r3, r0, #1
 8012b40:	4198      	sbcs	r0, r3
 8012b42:	2307      	movs	r3, #7
 8012b44:	4240      	negs	r0, r0
 8012b46:	4398      	bics	r0, r3
 8012b48:	300a      	adds	r0, #10
 8012b4a:	e7d2      	b.n	8012af2 <fn_08012AE4+0xe>
 8012b4c:	6fc8      	ldr	r0, [r1, #124]	@ 0x7c
 8012b4e:	1e43      	subs	r3, r0, #1
 8012b50:	4198      	sbcs	r0, r3
 8012b52:	2306      	movs	r3, #6
 8012b54:	4240      	negs	r0, r0
 8012b56:	4398      	bics	r0, r3
 8012b58:	300a      	adds	r0, #10
 8012b5a:	e7ca      	b.n	8012af2 <fn_08012AE4+0xe>
 8012b5c:	2388      	movs	r3, #136	@ 0x88
 8012b5e:	58c8      	ldr	r0, [r1, r3]
 8012b60:	1e43      	subs	r3, r0, #1
 8012b62:	4198      	sbcs	r0, r3
 8012b64:	2305      	movs	r3, #5
 8012b66:	4240      	negs	r0, r0
 8012b68:	4398      	bics	r0, r3
 8012b6a:	300a      	adds	r0, #10
 8012b6c:	e7c1      	b.n	8012af2 <fn_08012AE4+0xe>
 8012b6e:	2384      	movs	r3, #132	@ 0x84
 8012b70:	58c8      	ldr	r0, [r1, r3]
 8012b72:	1e43      	subs	r3, r0, #1
 8012b74:	4198      	sbcs	r0, r3
 8012b76:	2304      	movs	r3, #4
 8012b78:	4240      	negs	r0, r0
 8012b7a:	4398      	bics	r0, r3
 8012b7c:	300a      	adds	r0, #10
 8012b7e:	e7b8      	b.n	8012af2 <fn_08012AE4+0xe>
 8012b80:	2006      	movs	r0, #6
 8012b82:	e7b6      	b.n	8012af2 <fn_08012AE4+0xe>
 8012b84:	0812e6dc 	.word	0x0812e6dc
 8012b88:	030064c4 	.word	0x030064c4	@ data_030064C4
