; Transfer "YES" serially
; In each serial code, always use AutoReload mode
; To get the output: Go to View -> Serial Window -> UART #1
	ORG 00H
	MOV TMOD, #20H
	MOV TH1, #-3
	MOV SCON, #50H 
	SETB TR1
AGAIN: MOV A, # "Y"
	   ACALL TRANS; Used to check whether the data got transferred successfully
	   MOV A, #"E"
	   ACALL TRANS
	   MOV A, #"S"
	   ACALL TRANS
	   CLR TR1; To ensure that YES is not repeating 
TRANS: MOV SBUF, A; Serial buffer register. 'char' -> Accumulator -> SBUF
HERE:  JNB TI, HERE; TI = transfer interrupt. If the bits of the character got transferred correctly then TI -> 1. 
       CLR TI
	   RET
	END
