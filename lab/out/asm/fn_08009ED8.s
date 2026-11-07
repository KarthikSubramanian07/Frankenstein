fn_08009ED8:
 8009ed8:	2202      	movs	r2, #2
 8009eda:	6cc3      	ldr	r3, [r0, #76]	@ 0x4c
 8009edc:	4393      	bics	r3, r2
 8009ede:	b510      	push	{r4, lr}
 8009ee0:	64c3      	str	r3, [r0, #76]	@ 0x4c
 8009ee2:	2380      	movs	r3, #128	@ 0x80
 8009ee4:	6a01      	ldr	r1, [r0, #32]
 8009ee6:	05db      	lsls	r3, r3, #23
 8009ee8:	0004      	movs	r4, r0
 8009eea:	18c9      	adds	r1, r1, r3
 8009eec:	f7ff ff5a 	bl	8009da4 <fn_08009DA4>
 8009ef0:	2380      	movs	r3, #128	@ 0x80
 8009ef2:	6a21      	ldr	r1, [r4, #32]
 8009ef4:	061b      	lsls	r3, r3, #24
 8009ef6:	0020      	movs	r0, r4
 8009ef8:	18c9      	adds	r1, r1, r3
 8009efa:	f7ff ff53 	bl	8009da4 <fn_08009DA4>
 8009efe:	23c0      	movs	r3, #192	@ 0xc0
 8009f00:	6a21      	ldr	r1, [r4, #32]
 8009f02:	061b      	lsls	r3, r3, #24
 8009f04:	0020      	movs	r0, r4
 8009f06:	18c9      	adds	r1, r1, r3
 8009f08:	f7ff ff4c 	bl	8009da4 <fn_08009DA4>
 8009f0c:	bc10      	pop	{r4}
 8009f0e:	bc01      	pop	{r0}
 8009f10:	4700      	bx	r0
 8009f12:	46c0      	nop			@ (mov r8, r8)
