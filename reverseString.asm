;revreses a string 

	.ORIG	X3000
	LEA	R0, FIRST		;load R0 with the first address of first
	ADD	R1, R0, #-1		;R1 = address of R0 - 1
	
LOOP	LDR	R3, R1, #1
	BRz	DONE1

	ADD	R1, R1, #1
	BR	LOOP
	
;	R0 == address of the first character
;	R1 == address of the last character	
;	R3 == IS COUNTER
;	R2 == THE SIZE OF THE STRING - 2
	
DONE1	NOT	R2, R0
	ADD	R2, R2, R1
	
LOOP2	ADD	R2, R2, #0
	BRn	DONE
	LDR	R3, R0, #0
	LDR	R4, R1, #0

	STR	R4, R1, #0
	STR	R3, R1, #0
	
	ADD	R0, R0, #1		;MOVE POINTER
	ADD	R1, R1, #-1

	ADD	R2, R2, #-2		;DECREASE BY 2
	BR	LOOP2

DONE	HALT

FIRST	.STRINGZ	"This is fun!!"
RESULT	.BLKW	#13

	.END