      ORG   0000H

      ; --- Setup ---
      MOV   R0, #30H      ; Point R0 to the address that holds the count.
      MOV   R5, @R0       ; Get the count from [30H] and store it in R5 (our counter).
      
      MOV   R0, #40H      ; Point R0 to the start of the number series at 40H.
      MOV   A, @R0        ; Load the first number into Accumulator A. Assume it's the largest for now.
      DEC   R5            ; Decrement the counter, as we've already loaded the first number.

      ; --- Loop to find the largest ---
AGAIN:
      INC   R0            ; Point to the next number in the series.
      MOV   B, @R0        ; Move the next number into register B for comparison.
      
      ; Now, compare A (current largest) with B (next number).
      ; We do this by subtracting B from A. A = A - B.
      ; If A < B, the Carry flag (CY) will be set to 1.
      ; Otherwise (if A >= B), the Carry flag will be 0.
      SUBB  A, B          ; A = A - B. This temporarily alters A and sets the Carry flag.
      JNC   NEXT_NUM      ; JUMP if NO CARRY. If CY=0, it means A was >= B, so A is still the largest.
                          ; If we jump, we skip the next instruction.
                          
      MOV   A, B          ; This line only runs if CY=1 (A < B). B is the new largest, so we update A.

NEXT_NUM:
      DJNZ  R5, AGAIN     ; Decrement counter R5. If it's not zero, loop back to AGAIN.

      ; --- Final Step ---
      MOV   50H, A        ; Store the final largest number (from A) into address 50H.

      END                 ; End of the program.




; SECOND VERSION

      ORG   0000H

; --- Setup Phase ---
      MOV   R0, #30H      ; Load the ADDRESS 30H into R0. R0 is now a pointer.
      MOV   A, @R0        ; Get the value at the address in R0 (the count) into A.
      MOV   R2, A         ; Copy the count from A into R2, which will be our loop counter.

      INC   R0            ; Point to the next memory address (31H), the start of the number series.
      MOV   B, @R0        ; Load the first number from the series into register B.
                          ; B will be used to hold the largest number found so far.
                          
      DEC   R2            ; Decrement the counter, since we have already loaded the first number.
                          ; The loop will run N-1 times.

; --- Comparison Loop ---
L1:   INC   R0            ; Point to the next number in the series.
      MOV   A, @R0        ; Load the next number into the Accumulator A.

      ; CJNE: Compare and Jump if Not Equal.
      ; This instruction compares A and B. If they are not equal, it jumps to L2.
      ; More importantly, it sets the Carry Flag (CY=1) if the value in A is LESS THAN the value in B.
      CJNE  A, B, L2

; --- Decision and Update Logic ---
L2:   ; JC: Jump if Carry.
      ; This checks the Carry Flag. If CY=1 (meaning A < B from the CJNE above),
      ; it jumps to L3, skipping the update because B is still the largest.
      JC    L3
      
      MOV   B, A          ; This line only runs if A >= B.
                          ; We update B with the new larger value from A.

L3:   ; DJNZ: Decrement and Jump if Not Zero.
      ; This instruction first decrements the counter register (R2).
      ; If R2 is not zero after decrementing, it jumps back to the L1 label to loop again.
      ; If R2 becomes zero, the loop ends, and the program continues to the next line.
      DJNZ  R2, L1

; --- Final Step ---
      MOV   50H, B        ; The loop is done. Store the final largest number from B into address 50H.

      END                 ; End of the program.
