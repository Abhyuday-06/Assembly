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




; SECOND VERSION

ORG 000H
MOV R0, 30H ; the number of numbers to be compared are stored in location 30H and moved to R5 register
MOV A, @R0
MOV R2, A
DEC R2
INC R0
MOV B, @R0
INC R0
L1: MOV A, @R0
CJNE A, B, L2
JMP L2
L2: JC L3
MOV B, A
L3: INC R0
DJNZ R2, L1
MOV 50H, B
END
