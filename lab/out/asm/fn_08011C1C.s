fn_08011C1C:
 8011c1c:	4b08      	ldr	r3, [pc, #32]	@ (8011c40 <fn_08011C1C+0x24>)
 8011c1e:	681a      	ldr	r2, [r3, #0]
 8011c20:	2394      	movs	r3, #148	@ 0x94
 8011c22:	5cd3      	ldrb	r3, [r2, r3]
 8011c24:	2b02      	cmp	r3, #2
 8011c26:	d009      	beq.n	8011c3c <fn_08011C1C+0x20>
 8011c28:	3840      	subs	r0, #64	@ 0x40
 8011c2a:	2819      	cmp	r0, #25
 8011c2c:	d806      	bhi.n	8011c3c <fn_08011C1C+0x20>
 8011c2e:	4b05      	ldr	r3, [pc, #20]	@ (8011c44 <fn_08011C1C+0x28>)
 8011c30:	40c3      	lsrs	r3, r0
 8011c32:	2001      	movs	r0, #1
 8011c34:	4018      	ands	r0, r3
 8011c36:	2301      	movs	r3, #1
 8011c38:	4058      	eors	r0, r3
 8011c3a:	e000      	b.n	8011c3e <fn_08011C1C+0x22>
 8011c3c:	2001      	movs	r0, #1
 8011c3e:	4770      	bx	lr
 8011c40:	030064c4 	.word	0x030064c4	@ data_030064C4
 8011c44:	031000bf 	.word	0x031000bf
