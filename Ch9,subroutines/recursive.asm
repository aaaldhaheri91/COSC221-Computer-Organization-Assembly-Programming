	.ORIG	x3000
	
	.EXTERNAL	SQRT	;AVALIALBE IN A LIBRARY
	
	LEA	R2, Stack
	AND	R0, R0, #0
	AND	R5, R5, #0
	LD	R3, ASCII	
	
	JSR	Fact
	ADD	R0, R0, R3
	OUT
	HALT

Fact	STR	R7, R2, #0	;STORE R7 IN THE STACK caller routine is storing
	ADD	R2, R2, #1	;increment the stack
	
	ADD	R0, R0, #1
	LD	R1, Counter

	ADD	R1, R1, #-1
	ADD	R5, R5, R1
	ST	R1, Counter
	BRz	finish		;when counter is zero return 
	
	JSR	Fact
	
finish	ADD	R2, R2, #-1	
	LDR	R7, R2, #0	;take R7 from the stack
	
	RET

Divide	
	ADD	R6, R7, #0
	ADD	R2, R2, #0
	BRz	ClearR2
	AND	R0, R0, #0
	NOT	R1, R4
	ADD	R1, R1, #1
loop
	ADD	R5, R5, R1
	BRn	skip
	ADD	R0, R0, #1
	BR	loop
ClearR2
	ADD	R0, R5, #0
skip
	ADD	R5, R5, R4
	LD	R3, FE
	NOT	R3, R3
	ADD	R3, R3, #1
	ADD	R0, R0, R3
	TRAP	x21
	ADD	R7, R6, #0
	RET

Stack	.BLKW	#10
Counter .FILL	#5
ASCII	.FILL	#48

	.END
