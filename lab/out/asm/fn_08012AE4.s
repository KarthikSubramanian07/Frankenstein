fn_08012AE4:
 8012ae4:	2808      	cmp	r0, #8
 8012ae6:	d851      	bhi.n	8012b8c <fn_08012AE4+0xa8>
 8012ae8:	4b29      	ldr	r3, [pc, #164]	@ (8012b90 <fn_08012AE4+0xac>)
 8012aea:	0080      	lsls	r0, r0, #2
 8012aec:	581b      	ldr	r3, [r3, r0]
 8012aee:	469f      	mov	pc, r3
 8012af0:	2007      	movs	r0, #7
 8012af2:	4770      	bx	lr
 8012af4:	2000      	movs	r0, #0
 8012af6:	e7fc      	b.n	8012af2 <fn_08012AE4+0xe>
 8012af8:	2384      	movs	r3, #132	@ 0x84
 8012afa:	58cb      	ldr	r3, [r1, r3]
 8012afc:	2b27      	cmp	r3, #39	@ 0x27
 8012afe:	dd45      	ble.n	8012b8c <fn_08012AE4+0xa8>
 8012b00:	4b24      	ldr	r3, [pc, #144]	@ (8012b94 <fn_08012AE4+0xb0>)
 8012b02:	681a      	ldr	r2, [r3, #0]
 8012b04:	2394      	movs	r3, #148	@ 0x94
 8012b06:	5cd0      	ldrb	r0, [r2, r3]
 8012b08:	1e43      	subs	r3, r0, #1
 8012b0a:	4198      	sbcs	r0, r3
 8012b0c:	2303      	movs	r3, #3
 8012b0e:	4240      	negs	r0, r0
 8012b10:	4398      	bics	r0, r3
 8012b12:	300a      	adds	r0, #10
 8012b14:	e7ed      	b.n	8012af2 <fn_08012AE4+0xe>
 8012b16:	2380      	movs	r3, #128	@ 0x80
 8012b18:	58cb      	ldr	r3, [r1, r3]
 8012b1a:	2b01      	cmp	r3, #1
 8012b1c:	dd36      	ble.n	8012b8c <fn_08012AE4+0xa8>
 8012b1e:	4b1d      	ldr	r3, [pc, #116]	@ (8012b94 <fn_08012AE4+0xb0>)
 8012b20:	681a      	ldr	r2, [r3, #0]
 8012b22:	2394      	movs	r3, #148	@ 0x94
 8012b24:	5cd0      	ldrb	r0, [r2, r3]
 8012b26:	3802      	subs	r0, #2
 8012b28:	4243      	negs	r3, r0
 8012b2a:	4158      	adcs	r0, r3
 8012b2c:	2301      	movs	r3, #1
 8012b2e:	4240      	negs	r0, r0
 8012b30:	4398      	bics	r0, r3
 8012b32:	300a      	adds	r0, #10
 8012b34:	e7dd      	b.n	8012af2 <fn_08012AE4+0xe>
 8012b36:	6fc8      	ldr	r0, [r1, #124]	@ 0x7c
 8012b38:	1e43      	subs	r3, r0, #1
 8012b3a:	4198      	sbcs	r0, r3
 8012b3c:	2308      	movs	r3, #8
 8012b3e:	4240      	negs	r0, r0
 8012b40:	4398      	bics	r0, r3
 8012b42:	300a      	adds	r0, #10
 8012b44:	e7d5      	b.n	8012af2 <fn_08012AE4+0xe>
 8012b46:	2380      	movs	r3, #128	@ 0x80
 8012b48:	58c8      	ldr	r0, [r1, r3]
 8012b4a:	1e43      	subs	r3, r0, #1
 8012b4c:	4198      	sbcs	r0, r3
 8012b4e:	2307      	movs	r3, #7
 8012b50:	4240      	negs	r0, r0
 8012b52:	4398      	bics	r0, r3
 8012b54:	300a      	adds	r0, #10
 8012b56:	e7cc      	b.n	8012af2 <fn_08012AE4+0xe>
 8012b58:	6fc8      	ldr	r0, [r1, #124]	@ 0x7c
 8012b5a:	1e43      	subs	r3, r0, #1
 8012b5c:	4198      	sbcs	r0, r3
 8012b5e:	2306      	movs	r3, #6
 8012b60:	4240      	negs	r0, r0
 8012b62:	4398      	bics	r0, r3
 8012b64:	300a      	adds	r0, #10
 8012b66:	e7c4      	b.n	8012af2 <fn_08012AE4+0xe>
 8012b68:	2388      	movs	r3, #136	@ 0x88
 8012b6a:	58c8      	ldr	r0, [r1, r3]
 8012b6c:	1e43      	subs	r3, r0, #1
 8012b6e:	4198      	sbcs	r0, r3
 8012b70:	2305      	movs	r3, #5
 8012b72:	4240      	negs	r0, r0
 8012b74:	4398      	bics	r0, r3
 8012b76:	300a      	adds	r0, #10
 8012b78:	e7bb      	b.n	8012af2 <fn_08012AE4+0xe>
 8012b7a:	2384      	movs	r3, #132	@ 0x84
 8012b7c:	58c8      	ldr	r0, [r1, r3]
 8012b7e:	1e43      	subs	r3, r0, #1
 8012b80:	4198      	sbcs	r0, r3
 8012b82:	2304      	movs	r3, #4
 8012b84:	4240      	negs	r0, r0
 8012b86:	4398      	bics	r0, r3
 8012b88:	300a      	adds	r0, #10
 8012b8a:	e7b2      	b.n	8012af2 <fn_08012AE4+0xe>
 8012b8c:	200a      	movs	r0, #10
 8012b8e:	e7b0      	b.n	8012af2 <fn_08012AE4+0xe>
 8012b90:	0812e78c 	.word	0x0812e78c
 8012b94:	030064c4 	.word	0x030064c4
