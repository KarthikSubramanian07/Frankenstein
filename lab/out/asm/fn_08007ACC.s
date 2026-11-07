fn_08007ACC:
 8007acc:	b5f0      	push	{r4, r5, r6, r7, lr}
 8007ace:	46c6      	mov	lr, r8
 8007ad0:	235a      	movs	r3, #90	@ 0x5a
 8007ad2:	b500      	push	{lr}
 8007ad4:	5cc1      	ldrb	r1, [r0, r3]
 8007ad6:	23ea      	movs	r3, #234	@ 0xea
 8007ad8:	4f49      	ldr	r7, [pc, #292]	@ (8007c00 <fn_08007ACC+0x134>)
 8007ada:	683a      	ldr	r2, [r7, #0]
 8007adc:	00db      	lsls	r3, r3, #3
 8007ade:	58d3      	ldr	r3, [r2, r3]
 8007ae0:	225c      	movs	r2, #92	@ 0x5c
 8007ae2:	434a      	muls	r2, r1
 8007ae4:	189b      	adds	r3, r3, r2
 8007ae6:	6bdd      	ldr	r5, [r3, #60]	@ 0x3c
 8007ae8:	235e      	movs	r3, #94	@ 0x5e
 8007aea:	0004      	movs	r4, r0
 8007aec:	5cc0      	ldrb	r0, [r0, r3]
 8007aee:	4b45      	ldr	r3, [pc, #276]	@ (8007c04 <fn_08007ACC+0x138>)
 8007af0:	0700      	lsls	r0, r0, #28
 8007af2:	0e80      	lsrs	r0, r0, #26
 8007af4:	58c2      	ldr	r2, [r0, r3]
 8007af6:	436a      	muls	r2, r5
 8007af8:	6921      	ldr	r1, [r4, #16]
 8007afa:	181b      	adds	r3, r3, r0
 8007afc:	1852      	adds	r2, r2, r1
 8007afe:	6a19      	ldr	r1, [r3, #32]
 8007b00:	4369      	muls	r1, r5
 8007b02:	68e3      	ldr	r3, [r4, #12]
 8007b04:	0020      	movs	r0, r4
 8007b06:	18c9      	adds	r1, r1, r3
 8007b08:	2300      	movs	r3, #0
 8007b0a:	f007 fdc1 	bl	800f690 <fn_0800F690>
 8007b0e:	2380      	movs	r3, #128	@ 0x80
 8007b10:	6ce1      	ldr	r1, [r4, #76]	@ 0x4c
 8007b12:	01db      	lsls	r3, r3, #7
 8007b14:	0005      	movs	r5, r0
 8007b16:	400b      	ands	r3, r1
 8007b18:	2800      	cmp	r0, #0
 8007b1a:	d13d      	bne.n	8007b98 <fn_08007ACC+0xcc>
 8007b1c:	683a      	ldr	r2, [r7, #0]
 8007b1e:	2b00      	cmp	r3, #0
 8007b20:	d147      	bne.n	8007bb2 <fn_08007ACC+0xe6>
 8007b22:	4e39      	ldr	r6, [pc, #228]	@ (8007c08 <fn_08007ACC+0x13c>)
 8007b24:	5993      	ldr	r3, [r2, r6]
 8007b26:	2b00      	cmp	r3, #0
 8007b28:	d030      	beq.n	8007b8c <fn_08007ACC+0xc0>
 8007b2a:	215e      	movs	r1, #94	@ 0x5e
 8007b2c:	200f      	movs	r0, #15
 8007b2e:	5c63      	ldrb	r3, [r4, r1]
 8007b30:	4383      	bics	r3, r0
 8007b32:	2008      	movs	r0, #8
 8007b34:	4303      	orrs	r3, r0
 8007b36:	2000      	movs	r0, #0
 8007b38:	5463      	strb	r3, [r4, r1]
 8007b3a:	5991      	ldr	r1, [r2, r6]
 8007b3c:	1e4b      	subs	r3, r1, #1
 8007b3e:	4680      	mov	r8, r0
 8007b40:	5193      	str	r3, [r2, r6]
 8007b42:	2900      	cmp	r1, #0
 8007b44:	d022      	beq.n	8007b8c <fn_08007ACC+0xc0>
 8007b46:	4931      	ldr	r1, [pc, #196]	@ (8007c0c <fn_08007ACC+0x140>)
 8007b48:	185b      	adds	r3, r3, r1
 8007b4a:	009b      	lsls	r3, r3, #2
 8007b4c:	18d3      	adds	r3, r2, r3
 8007b4e:	6859      	ldr	r1, [r3, #4]
 8007b50:	2200      	movs	r2, #0
 8007b52:	0020      	movs	r0, r4
 8007b54:	f00f fabc 	bl	80170d0 <fn_080170D0>
 8007b58:	683a      	ldr	r2, [r7, #0]
 8007b5a:	5991      	ldr	r1, [r2, r6]
 8007b5c:	2800      	cmp	r0, #0
 8007b5e:	d00e      	beq.n	8007b7e <fn_08007ACC+0xb2>
 8007b60:	208c      	movs	r0, #140	@ 0x8c
 8007b62:	4b2a      	ldr	r3, [pc, #168]	@ (8007c0c <fn_08007ACC+0x140>)
 8007b64:	18cb      	adds	r3, r1, r3
 8007b66:	009b      	lsls	r3, r3, #2
 8007b68:	18d3      	adds	r3, r2, r3
 8007b6a:	0100      	lsls	r0, r0, #4
 8007b6c:	5810      	ldr	r0, [r2, r0]
 8007b6e:	685b      	ldr	r3, [r3, #4]
 8007b70:	1a1b      	subs	r3, r3, r0
 8007b72:	1e58      	subs	r0, r3, #1
 8007b74:	4183      	sbcs	r3, r0
 8007b76:	4640      	mov	r0, r8
 8007b78:	3301      	adds	r3, #1
 8007b7a:	4318      	orrs	r0, r3
 8007b7c:	4680      	mov	r8, r0
 8007b7e:	1e4b      	subs	r3, r1, #1
 8007b80:	5193      	str	r3, [r2, r6]
 8007b82:	2900      	cmp	r1, #0
 8007b84:	d1df      	bne.n	8007b46 <fn_08007ACC+0x7a>
 8007b86:	4643      	mov	r3, r8
 8007b88:	2b00      	cmp	r3, #0
 8007b8a:	d12a      	bne.n	8007be2 <fn_08007ACC+0x116>
 8007b8c:	0028      	movs	r0, r5
 8007b8e:	bc80      	pop	{r7}
 8007b90:	46b8      	mov	r8, r7
 8007b92:	bcf0      	pop	{r4, r5, r6, r7}
 8007b94:	bc02      	pop	{r1}
 8007b96:	4708      	bx	r1
 8007b98:	4a1d      	ldr	r2, [pc, #116]	@ (8007c10 <fn_08007ACC+0x144>)
 8007b9a:	4011      	ands	r1, r2
 8007b9c:	64e1      	str	r1, [r4, #76]	@ 0x4c
 8007b9e:	2b00      	cmp	r3, #0
 8007ba0:	d1f4      	bne.n	8007b8c <fn_08007ACC+0xc0>
 8007ba2:	683a      	ldr	r2, [r7, #0]
 8007ba4:	4b1b      	ldr	r3, [pc, #108]	@ (8007c14 <fn_08007ACC+0x148>)
 8007ba6:	5cd3      	ldrb	r3, [r2, r3]
 8007ba8:	2b00      	cmp	r3, #0
 8007baa:	d118      	bne.n	8007bde <fn_08007ACC+0x112>
 8007bac:	6b23      	ldr	r3, [r4, #48]	@ 0x30
 8007bae:	6163      	str	r3, [r4, #20]
 8007bb0:	e7ec      	b.n	8007b8c <fn_08007ACC+0xc0>
 8007bb2:	4b19      	ldr	r3, [pc, #100]	@ (8007c18 <fn_08007ACC+0x14c>)
 8007bb4:	5cd3      	ldrb	r3, [r2, r3]
 8007bb6:	2b00      	cmp	r3, #0
 8007bb8:	d0b3      	beq.n	8007b22 <fn_08007ACC+0x56>
 8007bba:	258b      	movs	r5, #139	@ 0x8b
 8007bbc:	012d      	lsls	r5, r5, #4
 8007bbe:	6960      	ldr	r0, [r4, #20]
 8007bc0:	5955      	ldr	r5, [r2, r5]
 8007bc2:	4a16      	ldr	r2, [pc, #88]	@ (8007c1c <fn_08007ACC+0x150>)
 8007bc4:	1882      	adds	r2, r0, r2
 8007bc6:	42a8      	cmp	r0, r5
 8007bc8:	da02      	bge.n	8007bd0 <fn_08007ACC+0x104>
 8007bca:	2280      	movs	r2, #128	@ 0x80
 8007bcc:	02d2      	lsls	r2, r2, #11
 8007bce:	1882      	adds	r2, r0, r2
 8007bd0:	6162      	str	r2, [r4, #20]
 8007bd2:	2280      	movs	r2, #128	@ 0x80
 8007bd4:	0392      	lsls	r2, r2, #14
 8007bd6:	430a      	orrs	r2, r1
 8007bd8:	001d      	movs	r5, r3
 8007bda:	64e2      	str	r2, [r4, #76]	@ 0x4c
 8007bdc:	e7d6      	b.n	8007b8c <fn_08007ACC+0xc0>
 8007bde:	001d      	movs	r5, r3
 8007be0:	e7d4      	b.n	8007b8c <fn_08007ACC+0xc0>
 8007be2:	f7fe ff8d 	bl	8006b00 <fn_08006B00>
 8007be6:	2301      	movs	r3, #1
 8007be8:	28e5      	cmp	r0, #229	@ 0xe5
 8007bea:	dd06      	ble.n	8007bfa <fn_08007ACC+0x12e>
 8007bec:	2501      	movs	r5, #1
 8007bee:	4642      	mov	r2, r8
 8007bf0:	4015      	ands	r5, r2
 8007bf2:	405d      	eors	r5, r3
 8007bf4:	062d      	lsls	r5, r5, #24
 8007bf6:	0e2d      	lsrs	r5, r5, #24
 8007bf8:	e7c8      	b.n	8007b8c <fn_08007ACC+0xc0>
 8007bfa:	2300      	movs	r3, #0
 8007bfc:	e7f6      	b.n	8007bec <fn_08007ACC+0x120>
 8007bfe:	46c0      	nop			@ (mov r8, r8)
 8007c00:	030064c4 	.word	0x030064c4
 8007c04:	0812e51c 	.word	0x0812e51c
 8007c08:	000008dc 	.word	0x000008dc
 8007c0c:	00000232 	.word	0x00000232
 8007c10:	ffdfffff 	.word	0xffdfffff
 8007c14:	00000925 	.word	0x00000925
 8007c18:	00000924 	.word	0x00000924
 8007c1c:	fffc0000 	.word	0xfffc0000
