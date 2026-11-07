fn_08019BB0:
 8019bb0:	4b03      	ldr	r3, [pc, #12]	@ (8019bc0 <fn_08019BB0+0x10>)
 8019bb2:	681a      	ldr	r2, [r3, #0]
 8019bb4:	1e43      	subs	r3, r0, #1
 8019bb6:	4198      	sbcs	r0, r3
 8019bb8:	23ab      	movs	r3, #171	@ 0xab
 8019bba:	00db      	lsls	r3, r3, #3
 8019bbc:	54d0      	strb	r0, [r2, r3]
 8019bbe:	4770      	bx	lr
 8019bc0:	030064c4 	.word	0x030064c4	@ data_030064C4
