fn_08004B58:
 8004b58:	b530      	push	{r4, r5, lr}
 8004b5a:	2300      	movs	r3, #0
 8004b5c:	46c6      	mov	lr, r8
 8004b5e:	4c11      	ldr	r4, [pc, #68]	@ (8004ba4 <fn_08004B58+0x4c>)
 8004b60:	46a0      	mov	r8, r4
 8004b62:	4911      	ldr	r1, [pc, #68]	@ (8004ba8 <fn_08004B58+0x50>)
 8004b64:	b500      	push	{lr}
 8004b66:	600b      	str	r3, [r1, #0]
 8004b68:	4b10      	ldr	r3, [pc, #64]	@ (8004bac <fn_08004B58+0x54>)
 8004b6a:	6818      	ldr	r0, [r3, #0]
 8004b6c:	4b10      	ldr	r3, [pc, #64]	@ (8004bb0 <fn_08004B58+0x58>)
 8004b6e:	58c2      	ldr	r2, [r0, r3]
 8004b70:	469c      	mov	ip, r3
 8004b72:	0113      	lsls	r3, r2, #4
 8004b74:	1a9b      	subs	r3, r3, r2
 8004b76:	011b      	lsls	r3, r3, #4
 8004b78:	4443      	add	r3, r8
 8004b7a:	4c0e      	ldr	r4, [pc, #56]	@ (8004bb4 <fn_08004B58+0x5c>)
 8004b7c:	18c3      	adds	r3, r0, r3
 8004b7e:	6023      	str	r3, [r4, #0]
 8004b80:	4b0d      	ldr	r3, [pc, #52]	@ (8004bb8 <fn_08004B58+0x60>)
 8004b82:	600b      	str	r3, [r1, #0]
 8004b84:	2301      	movs	r3, #1
 8004b86:	405a      	eors	r2, r3
 8004b88:	4663      	mov	r3, ip
 8004b8a:	50c2      	str	r2, [r0, r3]
 8004b8c:	0113      	lsls	r3, r2, #4
 8004b8e:	1a9b      	subs	r3, r3, r2
 8004b90:	011b      	lsls	r3, r3, #4
 8004b92:	4443      	add	r3, r8
 8004b94:	18c0      	adds	r0, r0, r3
 8004b96:	f014 ff29 	bl	80199ec <fn_080199EC>
 8004b9a:	bc20      	pop	{r5}
 8004b9c:	46a8      	mov	r8, r5
 8004b9e:	bc30      	pop	{r4, r5}
 8004ba0:	bc01      	pop	{r0}
 8004ba2:	4700      	bx	r0
 8004ba4:	0000055c 	.word	0x0000055c
 8004ba8:	040000c4 	.word	0x040000c4
 8004bac:	030064c4 	.word	0x030064c4	@ data_030064C4
 8004bb0:	0000073c 	.word	0x0000073c
 8004bb4:	040000bc 	.word	0x040000bc
 8004bb8:	b6400000 	.word	0xb6400000
