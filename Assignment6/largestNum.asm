;Ahmed Aldhaheri
;Course: COSC221, Winter 2016
;Description: Ask user for single-digit input and displays the largest

	.ORIG	x3000
	AND	R4, R4, #0		;clear R4
	LD	R2, negasc		;load -48 to R2
	LD	R3, posasc		;load 48 to R3
	
loop	LEA	R0, msg			;load address of msg into R0
	PUTS				;display msg
	GETC				;get digit entered	
	OUT				;display digit
	ADD	R0, R0, R2		;ADD -48 to R0 to check if digit zero was entered
	BRz	output			;check if digit is zero then stop program
	NOT	R0, R0			;make R0 negative
	ADD	R0, R0, #1		;make R0 2's complement
	ADD	R4, R1, R0		;R0 = R0 + R1
	BRn	assign			;if R0 is larger go to swap
	LD	R0, NL			;load new line to R0
	OUT				;display new line
	BR	loop			;go back to loop

assign	AND	R1, R1, #0		;clear R1
	NOT	R0, R0			;make R0 positive
	ADD	R0, R0, #1		;make R0 2's complement
	ADD	R1, R0, #0		;R1 = R0	
	LD	R0, NL		 	;load new line to R0
	OUT				;display new line
	BR	loop			;go back to loop

output	LD	R0, NL			;load new line to R0
	OUT				;display new line
	OUT				;display new line
	LEA	R0, msg2		;load address of msg2 to R0
	PUTS				;display msg2
	AND	R0, R0, #0		;clear R0
	ADD	R0, R1, #0		;make R0 = largest digit
	ADD	R0, R0, R3		;add 48 to R0 to display character number asci
	OUT				;display R0
	
	HALT	
msg	.STRINGZ 	"Enter a single-digit integer> "	;display entry message
msg2	.STRINGZ 	"The largest integer is> "		;display output message
NL	.FILL		#10					;new line
negasc	.FILL		#-48	
posasc	.FILL		#48				
	
	.END