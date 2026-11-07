fn_0800D0E0:
 800d0e0:	b510      	push	{r4, lr}
 800d0e2:	2902      	cmp	r1, #2
 800d0e4:	d025      	beq.n	800d132 <fn_0800D0E0+0x52>
 800d0e6:	2904      	cmp	r1, #4
 800d0e8:	d01e      	beq.n	800d128 <fn_0800D0E0+0x48>
 800d0ea:	2901      	cmp	r1, #1
 800d0ec:	d10b      	bne.n	800d106 <fn_0800D0E0+0x26>
 800d0ee:	6a83      	ldr	r3, [r0, #40]	@ 0x28
 800d0f0:	2b63      	cmp	r3, #99	@ 0x63
 800d0f2:	dc08      	bgt.n	800d106 <fn_0800D0E0+0x26>
 800d0f4:	3364      	adds	r3, #100	@ 0x64
 800d0f6:	2b64      	cmp	r3, #100	@ 0x64
 800d0f8:	dd00      	ble.n	800d0fc <fn_0800D0E0+0x1c>
 800d0fa:	2364      	movs	r3, #100	@ 0x64
 800d0fc:	6802      	ldr	r2, [r0, #0]
 800d0fe:	0014      	movs	r4, r2
 800d100:	2254      	movs	r2, #84	@ 0x54
 800d102:	6283      	str	r3, [r0, #40]	@ 0x28
 800d104:	52a3      	strh	r3, [r4, r2]
 800d106:	000b      	movs	r3, r1
 800d108:	330c      	adds	r3, #12
 800d10a:	009a      	lsls	r2, r3, #2
 800d10c:	1882      	adds	r2, r0, r2
 800d10e:	6852      	ldr	r2, [r2, #4]
 800d110:	2a00      	cmp	r2, #0
 800d112:	db05      	blt.n	800d120 <fn_0800D0E0+0x40>
 800d114:	4a0c      	ldr	r2, [pc, #48]	@ (800d148 <fn_0800D0E0+0x68>)
 800d116:	0089      	lsls	r1, r1, #2
 800d118:	588a      	ldr	r2, [r1, r2]
 800d11a:	009b      	lsls	r3, r3, #2
 800d11c:	18c3      	adds	r3, r0, r3
 800d11e:	605a      	str	r2, [r3, #4]
 800d120:	2001      	movs	r0, #1
 800d122:	bc10      	pop	{r4}
 800d124:	bc02      	pop	{r1}
 800d126:	4708      	bx	r1
 800d128:	6c43      	ldr	r3, [r0, #68]	@ 0x44
 800d12a:	2b00      	cmp	r3, #0
 800d12c:	d109      	bne.n	800d142 <fn_0800D0E0+0x62>
 800d12e:	3310      	adds	r3, #16
 800d130:	e7f0      	b.n	800d114 <fn_0800D0E0+0x34>
 800d132:	6802      	ldr	r2, [r0, #0]
 800d134:	6cd3      	ldr	r3, [r2, #76]	@ 0x4c
 800d136:	001c      	movs	r4, r3
 800d138:	2380      	movs	r3, #128	@ 0x80
 800d13a:	02db      	lsls	r3, r3, #11
 800d13c:	4323      	orrs	r3, r4
 800d13e:	64d3      	str	r3, [r2, #76]	@ 0x4c
 800d140:	e7e1      	b.n	800d106 <fn_0800D0E0+0x26>
 800d142:	2000      	movs	r0, #0
 800d144:	e7ed      	b.n	800d122 <fn_0800D0E0+0x42>
 800d146:	46c0      	nop			@ (mov r8, r8)
 800d148:	0812e67c 	.word	0x0812e67c	@ data_0812E67C
