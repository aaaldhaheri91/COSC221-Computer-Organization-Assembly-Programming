	.ORIG	x3000
	LD	R1, EIGHT
	LD	R3, FIVE
	
	ADD	R0, R3, #0
	JSR	NEGATE
	ADD	R4, R1, R0
	HALT
	

NEGATE
	NOT	R0, R0
	ADD	R0, R0, #1
	RET

EIGHT	.FILL	#8
FIVE	.FILL	#5
	.END	