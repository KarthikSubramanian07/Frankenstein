fn_08007D00:
 8007d00:	b570      	push	{r4, r5, r6, lr}
 8007d02:	6d04      	ldr	r4, [r0, #80]	@ 0x50
 8007d04:	231d      	movs	r3, #29
 8007d06:	6962      	ldr	r2, [r4, #20]
 8007d08:	6921      	ldr	r1, [r4, #16]
 8007d0a:	0005      	movs	r5, r0
 8007d0c:	68e0      	ldr	r0, [r4, #12]
 8007d0e:	f009 f86d 	bl	8010dec <fn_08010DEC>
 8007d12:	2123      	movs	r1, #35	@ 0x23
 8007d14:	f012 fb32 	bl	801a37c <fn_0801A37C>
 8007d18:	f7fe fef2 	bl	8006b00 <fn_08006B00>
 8007d1c:	230b      	movs	r3, #11
 8007d1e:	2831      	cmp	r0, #49	@ 0x31
 8007d20:	dd02      	ble.n	8007d28 <fn_08007D00+0x28>
 8007d22:	3301      	adds	r3, #1
 8007d24:	2859      	cmp	r0, #89	@ 0x59
 8007d26:	dc15      	bgt.n	8007d54 <fn_08007D00+0x54>
 8007d28:	340c      	adds	r4, #12
 8007d2a:	cc07      	ldmia	r4!, {r0, r1, r2}
 8007d2c:	f009 f85e 	bl	8010dec <fn_08010DEC>
 8007d30:	2101      	movs	r1, #1
 8007d32:	0004      	movs	r4, r0
 8007d34:	f7ff fe56 	bl	80079e4 <fn_080079E4>
 8007d38:	2800      	cmp	r0, #0
 8007d3a:	d125      	bne.n	8007d88 <fn_08007D00+0x88>
 8007d3c:	2301      	movs	r3, #1
 8007d3e:	6922      	ldr	r2, [r4, #16]
 8007d40:	68e1      	ldr	r1, [r4, #12]
 8007d42:	0020      	movs	r0, r4
 8007d44:	f007 fa24 	bl	800f190 <fn_0800F190>
 8007d48:	0028      	movs	r0, r5
 8007d4a:	f009 f9b5 	bl	80110b8 <fn_080110B8>
 8007d4e:	bc70      	pop	{r4, r5, r6}
 8007d50:	bc01      	pop	{r0}
 8007d52:	4700      	bx	r0
 8007d54:	3301      	adds	r3, #1
 8007d56:	2877      	cmp	r0, #119	@ 0x77
 8007d58:	dde6      	ble.n	8007d28 <fn_08007D00+0x28>
 8007d5a:	3309      	adds	r3, #9
 8007d5c:	2881      	cmp	r0, #129	@ 0x81
 8007d5e:	dde3      	ble.n	8007d28 <fn_08007D00+0x28>
 8007d60:	3b08      	subs	r3, #8
 8007d62:	289f      	cmp	r0, #159	@ 0x9f
 8007d64:	dde0      	ble.n	8007d28 <fn_08007D00+0x28>
 8007d66:	3b0b      	subs	r3, #11
 8007d68:	28a1      	cmp	r0, #161	@ 0xa1
 8007d6a:	dddd      	ble.n	8007d28 <fn_08007D00+0x28>
 8007d6c:	3302      	adds	r3, #2
 8007d6e:	28ab      	cmp	r0, #171	@ 0xab
 8007d70:	ddda      	ble.n	8007d28 <fn_08007D00+0x28>
 8007d72:	330f      	adds	r3, #15
 8007d74:	28bf      	cmp	r0, #191	@ 0xbf
 8007d76:	ddd7      	ble.n	8007d28 <fn_08007D00+0x28>
 8007d78:	3b0c      	subs	r3, #12
 8007d7a:	28dd      	cmp	r0, #221	@ 0xdd
 8007d7c:	ddd4      	ble.n	8007d28 <fn_08007D00+0x28>
 8007d7e:	3307      	adds	r3, #7
 8007d80:	28f5      	cmp	r0, #245	@ 0xf5
 8007d82:	dcd1      	bgt.n	8007d28 <fn_08007D00+0x28>
 8007d84:	3302      	adds	r3, #2
 8007d86:	e7cf      	b.n	8007d28 <fn_08007D00+0x28>
 8007d88:	4b07      	ldr	r3, [pc, #28]	@ (8007da8 <fn_08007D00+0xa8>)
 8007d8a:	681a      	ldr	r2, [r3, #0]
 8007d8c:	235a      	movs	r3, #90	@ 0x5a
 8007d8e:	5ce1      	ldrb	r1, [r4, r3]
 8007d90:	23ea      	movs	r3, #234	@ 0xea
 8007d92:	00db      	lsls	r3, r3, #3
 8007d94:	58d3      	ldr	r3, [r2, r3]
 8007d96:	225c      	movs	r2, #92	@ 0x5c
 8007d98:	434a      	muls	r2, r1
 8007d9a:	189b      	adds	r3, r3, r2
 8007d9c:	0020      	movs	r0, r4
 8007d9e:	8999      	ldrh	r1, [r3, #12]
 8007da0:	f009 fa34 	bl	801120c <fn_0801120C>
 8007da4:	e7ca      	b.n	8007d3c <fn_08007D00+0x3c>
 8007da6:	46c0      	nop			@ (mov r8, r8)
 8007da8:	030064c4 	.word	0x030064c4
