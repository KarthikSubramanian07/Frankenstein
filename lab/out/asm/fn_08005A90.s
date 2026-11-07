fn_08005A90:
 8005a90:	b510      	push	{r4, lr}
 8005a92:	4806      	ldr	r0, [pc, #24]	@ (8005aac <fn_08005A90+0x1c>)
 8005a94:	f017 fd4c 	bl	801d530 <fn_0801D530>
 8005a98:	2200      	movs	r2, #0
 8005a9a:	0003      	movs	r3, r0
 8005a9c:	2102      	movs	r1, #2
 8005a9e:	205e      	movs	r0, #94	@ 0x5e
 8005aa0:	f016 fb9e 	bl	801c1e0 <fn_0801C1E0>
 8005aa4:	bc10      	pop	{r4}
 8005aa6:	bc01      	pop	{r0}
 8005aa8:	4700      	bx	r0
 8005aaa:	46c0      	nop			@ (mov r8, r8)
 8005aac:	08149de4 	.word	0x08149de4
