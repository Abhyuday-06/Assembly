ORG 0000H
MOV R5, 30H ; the number of numbers to be compared are stored in location 30H and moved to R5 register
MOV R0, #40H
MOV A, @R0
DEC R5
W: INC R0
MOV 50H, @R0
CJNE A, 50H, L1 ; compare and jump, no equal
L1: SJMP L2 ; spot juml
MOV A, @R0
L2: DJNZ R5, L3
MOV 50H, A
