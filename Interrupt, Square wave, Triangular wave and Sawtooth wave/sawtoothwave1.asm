; Sawtooth wave

ORG 0000H
AGAIN: MOV A, #00H
   L1: MOV P1, A
	   INC A
	   CJNE A, #0FFH, L1
	   CLR A
	   SJMP AGAIN
	   END
