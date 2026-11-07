fn_03002660:
 3002660:	e1a03001 	mov	r3, r1
 3002664:	e0c10093 	smull	r0, r1, r3, r0
 3002668:	e1a00820 	lsr	r0, r0, #16
 300266c:	e1800801 	orr	r0, r0, r1, lsl #16
 3002670:	e12fff1e 	bx	lr
