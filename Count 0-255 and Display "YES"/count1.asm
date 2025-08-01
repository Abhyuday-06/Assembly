; COUNT NUMBER FROM 0 TO 255 AND DISPLAY ON PORT 3.4
; Manually give clock by going to Port 3. Click on tick mark. When transition from 1 -> 0 then clock starts.  
	ORG 000H;
	MOV TMOD, #06H
	SETB P3.4
	MOV TL0, #00H; Not necessary to include this as we're using AutoReload mode. Value in Higher mode will go to lower mode
	MOV TH0, #00H
HERE: SETB TR0
BACK: MOV A, TL0
	  MOV P1, A
	JNB TF0, BACK; At 255 overflow happens and TF0 = 1
	CLR TR0; stop counter
	CLR TF0; clear overflow flag
	SJMP HERE
	END
