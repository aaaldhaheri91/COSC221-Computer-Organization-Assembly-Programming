	.ORIG	X3000
	LEA	R1, FIRST		;loading R1 with pointer to first string
	LEA	R2, SECOND		;loading R2 with pointer to second string
	AND 	R0, R0, #0

LOOP	LDR	R3, R1, #0		;load the character at the pointer
	LDR	R4, R2, #0		;load the character at the other pointer
	BRz	NEXT			;if no more characters, they are the same
	ADD	R1, R1, #1		;go to the next character	
	ADD	R2, R2, #1		;got to the next character
	
	NOT 	R4, R4			;get the 2' complement of the character
	ADD	R4, R4, #1
	
	ADD	R3, R3, R4		;compare by adding two characters
	BRz	LOOP			;if they are the same, go to loop
	
	AND 	R5, R5, #0		;false means they are different
	BRnzp	DONE

NEXT	AND 	R5, R5, #0
	ADD	R5, R5, #1		;true they are the same
	
DONE 	HALT

FIRST	.STRINGZ	"hELLO"
SECOND	.STRINGZ	"HELLO"

;FIRST	.FILL	X4000			;pointing the first string
;SECOND	.FILL	X4100			;pointing at the second string

	.END
