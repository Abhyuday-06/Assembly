ORG 0000H
MOV P1, #00H
BACK: SETB P1.0 ; Setting value to high
	ACALL DELAY
	CLR P1.0 ; Setting value to low
	ACALL DELAY
	SJMP BACK
DELAY: MOV R2, #10   ; Creates a loop for 10 iterations(We're using 3 loops because the maximum value is 255 for an 8 bit register)
AGAIN1: MOV R3, #255 ; Creates a loop for 255 iterations(inside above loop). Using 255 decimal value or  0FFH in hexadecimal)
AGAIN: MOV R4, #255 ; Creates a loop for 255 iterations(inside above loop)
HERE: DJNZ R4, HERE 
	DJNZ R3, AGAIN
	DJNZ R2, AGAIN1
	RET
END
