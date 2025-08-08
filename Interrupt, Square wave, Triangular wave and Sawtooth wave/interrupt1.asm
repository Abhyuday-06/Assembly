; write a program to set port 2 and increment the value of accumulator while the INT0 pin is connected to a switch which is normally high. Whenever it goes low it should blink port 1


ORG 000H
LJMP MAIN
ORG 0003H
MOV P1, #00H
MOV P1, #0FFH
RETI

MAIN: MOV IE, #81H
LOOP: MOV P2, #0FFH
	  ADD A, #01H
	  SJMP LOOP
	  END
