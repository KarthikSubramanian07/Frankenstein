fn_08004AC4:
 8004ac4:	23e7      	movs	r3, #231	@ 0xe7
 8004ac6:	b510      	push	{r4, lr}
 8004ac8:	4c07      	ldr	r4, [pc, #28]	@ (8004ae8 <fn_08004AC4+0x24>)
 8004aca:	6820      	ldr	r0, [r4, #0]
 8004acc:	009b      	lsls	r3, r3, #2
 8004ace:	18c0      	adds	r0, r0, r3
 8004ad0:	f7ff ff10 	bl	80048f4 <fn_080048F4>
 8004ad4:	23d8      	movs	r3, #216	@ 0xd8
 8004ad6:	6820      	ldr	r0, [r4, #0]
 8004ad8:	009b      	lsls	r3, r3, #2
 8004ada:	18c0      	adds	r0, r0, r3
 8004adc:	f7ff fe56 	bl	800478c <fn_0800478C>
 8004ae0:	bc10      	pop	{r4}
 8004ae2:	bc01      	pop	{r0}
 8004ae4:	4700      	bx	r0
 8004ae6:	46c0      	nop			@ (mov r8, r8)
 8004ae8:	030064c4 	.word	0x030064c4	@ data_030064C4
