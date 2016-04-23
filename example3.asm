		.orig x3000
		LD		R2, ONLY
		ADD 	R3, R2, R2
		
		LEA		R4, ONLY		;Will put the address of ONLY to R4
		STR		R3, R4, 1
		
		STI 	R3, ONLY



		HALT
ONLY	.FILL	X4000

		.END