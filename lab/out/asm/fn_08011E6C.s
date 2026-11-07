fn_08011E6C:
 8011e6c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8011e6e:	0014      	movs	r4, r2
 8011e70:	000e      	movs	r6, r1
 8011e72:	0007      	movs	r7, r0
 8011e74:	f7f4 fe44 	bl	8006b00 <fn_08006B00>
 8011e78:	0005      	movs	r5, r0
 8011e7a:	f7f4 fe41 	bl	8006b00 <fn_08006B00>
 8011e7e:	1a2a      	subs	r2, r5, r0
 8011e80:	0292      	lsls	r2, r2, #10
 8011e82:	1912      	adds	r2, r2, r4
 8011e84:	2325      	movs	r3, #37	@ 0x25
 8011e86:	0031      	movs	r1, r6
 8011e88:	0038      	movs	r0, r7
 8011e8a:	f7fe ffaf 	bl	8010dec <fn_08010DEC>
 8011e8e:	2380      	movs	r3, #128	@ 0x80
 8011e90:	025b      	lsls	r3, r3, #9
 8011e92:	6443      	str	r3, [r0, #68]	@ 0x44
 8011e94:	0004      	movs	r4, r0
 8011e96:	f7f4 fe33 	bl	8006b00 <fn_08006B00>
 8011e9a:	2303      	movs	r3, #3
 8011e9c:	2256      	movs	r2, #86	@ 0x56
 8011e9e:	4003      	ands	r3, r0
 8011ea0:	5aa0      	ldrh	r0, [r4, r2]
 8011ea2:	1ac0      	subs	r0, r0, r3
 8011ea4:	1c03      	adds	r3, r0, #0
 8011ea6:	0400      	lsls	r0, r0, #16
 8011ea8:	1400      	asrs	r0, r0, #16
 8011eaa:	2800      	cmp	r0, #0
 8011eac:	dc00      	bgt.n	8011eb0 <fn_08011E6C+0x44>
 8011eae:	2301      	movs	r3, #1
 8011eb0:	2256      	movs	r2, #86	@ 0x56
 8011eb2:	52a3      	strh	r3, [r4, r2]
 8011eb4:	4b07      	ldr	r3, [pc, #28]	@ (8011ed4 <fn_08011E6C+0x68>)
 8011eb6:	6819      	ldr	r1, [r3, #0]
 8011eb8:	2380      	movs	r3, #128	@ 0x80
 8011eba:	4a07      	ldr	r2, [pc, #28]	@ (8011ed8 <fn_08011E6C+0x6c>)
 8011ebc:	588a      	ldr	r2, [r1, r2]
 8011ebe:	03db      	lsls	r3, r3, #15
 8011ec0:	429a      	cmp	r2, r3
 8011ec2:	d002      	beq.n	8011eca <fn_08011E6C+0x5e>
 8011ec4:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8011ec6:	bc01      	pop	{r0}
 8011ec8:	4700      	bx	r0
 8011eca:	215f      	movs	r1, #95	@ 0x5f
 8011ecc:	0020      	movs	r0, r4
 8011ece:	f7ff f99d 	bl	801120c <fn_0801120C>
 8011ed2:	e7f7      	b.n	8011ec4 <fn_08011E6C+0x58>
 8011ed4:	030064c4 	.word	0x030064c4	@ data_030064C4
 8011ed8:	00000904 	.word	0x00000904
