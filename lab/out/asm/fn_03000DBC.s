fn_03000DBC:
 3000dbc:	e0802002 	add	r2, r0, r2
 3000dc0:	e5d03000 	ldrb	r3, [r0]
 3000dc4:	e1530001 	cmp	r3, r1
 3000dc8:	012fff1e 	bxeq	lr
 3000dcc:	e2800001 	add	r0, r0, #1
 3000dd0:	e1520000 	cmp	r2, r0
 3000dd4:	1afffff9 	bne	3000dc0 <fn_03000DBC+0x4>
 3000dd8:	e3a00000 	mov	r0, #0
 3000ddc:	e12fff1e 	bx	lr
