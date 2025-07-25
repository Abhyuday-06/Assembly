; Generate a square wave using a timer

ORG 0000H
MOV TMOD, #01H ; Special function register- TMOD
AGAIN1: MOV P1, #0FFH ; We're working on the entire port(8 pins) that is why we use MOV. #OFFH(hexadecimal) sets all pins to 1
	ACALL DELAY
	MOV P1, #00H ; Sets all pins to 0. 
	ACALL DELAY
	SJMP AGAIN1
DELAY: MOV TL0, #00H ; Lower end of timer = TL0(8 bit left side)
	MOV TH0, #0EEH ; Higher end of timer = TH0(8 bit right side)
	SETB TR0 ; To start the timer
AGAIN: JNB TF0, AGAIN ; If TF0 becomes 0, it means timer has done its count operation
	CLR TR0
	CLR TF0
	RET 
END
