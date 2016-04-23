;subroutines
	.ORIG 	x24A0
	JSR	saveReg			;saving registers
	LD	R1, num

	HALT	
	
saveReg	ST	 R1, num
	ADD	 R1, R1, #4						
	RET				;every subroutine must come back. return statement

num	.FILL	X0000	

	.END	