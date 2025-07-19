ORG 0000H
;Store the number of iterations(here, 5) in 40th location by typing in memory address
MOV R0, #40H 
MOV R1, #51H
MOV A, @R0 ; @ means to access the data at the R0 location. Direct transfer of data between registers in not possible. Therefore, Register -> Accumulator -> Register
MOV R2, A ; R2 is used as a counter here for 5 iterations
INC R0 ; Increment moves to the next address eg: 41, 42, 43.....
L1: MOV A, @R0 ; Data at R0 location is moved to accumulator. L1 is loop block
XCH A, @R1 ; Exchange of data between R1 and Accumulator(having R0's data) takes place
MOV @R0, A ; Move Accumulator's data to R0 location
INC R0; Increment R0
INC R1; Increment R1
DJNZ R2, L1 ; Does the decrement and checks if it's zero or not. DJNZ = Decrement and Jump, Not Zero?

END
