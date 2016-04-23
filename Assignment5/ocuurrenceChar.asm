;Name: Ahmed Aldhaheri
;Date: 3/9/2016
;Course: COSC221, Winter 2016
;Description: Counts the number of occurrences of a character in a string

	.ORIG	x3000
	LEA	R0, msg1		;load address of msg1 to R0
	PUTS				;display R0
	GETC				;ask for a character
	OUT				;display character chosen
	
	AND	R1, R1, #0		;clear R1
	ADD	R1, R1, R0		;save character in R1
	AND	R5, R5, #0		;clear R5
	ADD	R5, R5, R1		;save character in R5
	NOT	R1, R1			;R0 = -R1
	ADD	R1, R1, #1		;R0 = -R1 + 1
	LD	R0, NL			;load new line character to R0
	OUT
	
	LEA	R2, mesg		;R2 = address of mesg
	AND	R4, R4, #0		;clear R4, counter
	
loop	LDR	R3, R2, #0		;R3 = Content of R2
	BRz	done			;if null stop program
	ADD	R2, R2, #1		;increment R2 address by one to point at next address
	ADD	R3, R3, R1		;add R3 = R3 + R1, if character is same result will be zero
	BRz	count			;branch to again if zero
	BR	loop			;if not same branch to loop
			

count	ADD	R4, R4, #1
	BR	loop			;branch to decrement R2, length of string

done	AND	R0, R0, #0		;clear R0 for output
	LEA	R0, msg2		;display msg2
	PUTS
	
	AND	R0, R0, #0		;clear R0
	ADD	R0, R0, R5		;put character in R0
	OUT				;display character
	
	LEA	R0, msg3		;load msg3 to R0
	PUTS				;display msg3
	
	LEA	R0, mesg		;load sequence string to R0
	PUTS				;display string
	
	LEA	R0, msg4		;load msg4 to R0
	PUTS				;dipslay msg4

	LD	R0, posAsc		;load 48 to R0
	ADD	R0, R0, R4		;add counter and asci to R0 
	OUT
	
	HALT	
			
mesg	.STRINGZ	"'mississippi'"		
length	.FILL		x0009
posAsc	.FILL		x30
msg1	.STRINGZ	"Enter one character: "
msg2	.STRINGZ	"Number of occurrences of character '"
msg3	.STRINGZ	"' from the string "
msg4	.STRINGZ	" is: "
NL	.FILL		X000A
	.END

