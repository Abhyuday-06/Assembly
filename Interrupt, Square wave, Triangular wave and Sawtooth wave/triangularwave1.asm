; Triangular wave

ORG 0000H
AGAIN: MOV A, #00H
   L1: MOV P1, A
       INC A
	   CJNE A, #0FFH, L1
   L2: MOV P1, A
       DEC A
	   CJNE A, #00H, L2
	   SJMP AGAIN
	   END
