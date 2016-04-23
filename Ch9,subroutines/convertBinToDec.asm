;program to convert binary to decimal	
;4-4-2016 - COSC221	
	
	.ORIG	x3000
	
	LD	R2, counter
	LD	R4, max
	LD	R5, minusten	;-ENTER KEY
	AND	R3, R3, #0
	
	LEA	R0, prompt
	PUTS			;trap x22
	
input	
	GETC			;trapx20
	OUT			;trap21
	
	LD	R7, svnteen
	ADD	R7, R2, R7
	BRz	checkb
	
	LD	R7, space
	ADD	R7, R0, R7	;check to see if they entered a space
	BRz	input
	
	ADD	R1, R0, R5
	BRz	enter	

	ADD	R7, zero
	ADD	R7, R0, R7
	BRz	zerolabl	;move to the next binary and divdie current one by two
	
	LD	R7, one
	ADD	R7, R0, R7
	BRz	onelabl

enter
	ADD	R0, R3, #0
	BR	done

zerolabl
	ADD	R2, R2, #-1
	JSR	divby2
	BR	input

onelabl	
	ADD	R2, R2, #-1
	ADD	R3, R3, R4
	JSR	divby2
	BR 	input

checkb
	ADD	R2, R2, #-1
	LD	R7, b
	ADD	R7, R0, R7
	BRnp	invalid
	BR	input

invalid	
	OUT
	LEA	R0, errmsg
	PUTS		

	
	
done
	HALT

;subroutines

divby2
	AND	R0, R0, #0
	ADD	R1, R4, #0
	
loop	
	ADD	R1, R1, #-2
	BRn	skip
	ADD	R0, R1, #1
	BR	loop
	
skip	
	ADD	R4, R0, #0
	RET

zero	.FILL	#-48		;-0
one	.FILL	#-49		;-1
b	.FILL	#-98		;-b	
counter	.FILL	#17
prompt	.STRINGZ	"Enter binary number: "
errmsg	.STRINGZ	"Invalid number"
space	.FILL	#-32		;-space
max	.FILL	#32768		;maximum number they can have
svnteen	.FILL	#-17
minuten	.FILL	#-10

	.END