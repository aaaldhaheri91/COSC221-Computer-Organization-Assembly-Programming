;Assignment #7
;Ahmed Aldhaheri
;COSC221
;Description: Multiply two arrays and add them to each other.
;Due Date: 3/21/2016

	.ORIG	x3000
	
	LEA	R0, arr1		;R0 = first array
	LEA	R1, arr2		;R1 = second array
	LD	R6, negasc		;negasc
	AND	R5, R5, #0
	AND	R4, R4, #0
	
start	LDR	R2, R0, #0		;R2 load first array address
	LDR	R3, R1, #0		;R3 load second array address
	BRz	result
	JSR	multTwo	
	ADD	R1, R1, #1		;point to the next element in array2
	ADD	R0, R0, #1		;point to the next element in array1
	BRp	start

result	
	
	HALT

multTwo	AND	R5, R5, #0
	ADD	R2, R2, R6		;add -48
	ADD	R3, R3, R6		;add -48
	ADD	R5, R5, R2		;R5 = R2
	ADD	R3, R3, #-1		;decrement R3
	BRn	return			;if negative go to return
	BRz	assign			;if zero dont loop just add number to R4	
loop	ADD	R2, R2, R5		;multiplication
	ADD 	R3, R3, #-1		;decrement counter
	BRp	loop
assign	ADD	R4, R4, R2		;store product 
return	RET

msg	.STRINGz	"the sum of multiplication of '"
msg2	.STRINGz	"' and '"
msg3	.STRINGz	" is: " 
arr1	.STRINGz	"0123456789"		;array 2
arr2	.STRINGz	"9876543210"		;array2
posasc	.FILL		#48
negasc	.FILL		#-48

	.END