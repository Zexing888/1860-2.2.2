// Judge whether the Dividend is 0
@R1 
D=M // D = RAM[R1]
// If D = RAM[R1] = 0, jump to Dividend_0
@Dividend_0
D;JEQ

// Judge whether the divisor is 0
@R0
D=M // D = RAM[R0]
// If D = RAM[R0] = 0, jump to Division_fail
@Division_fail
D;JEQ

// Copy the value of R0 to R6, because the value of R0 is immutable
@R0
D=M // D = RAM[R0]
@R6
M=D // RAM[R6] = D = RAM{R0}

// Copy the value of R1 to R7, because the value of R1 is immutable
@R1
D=M
@R7
M=D

// Calculate the absolute value of R6 and put the value in R6. If R6 is originally positive, R8=0, If it is negative, R8=1.
@R6
D=M // D = RAM[R6]
@R8
M=0 // RAM[R8] = 0
@POSITIVE_X
D;JGE // If D = RAM[R6] >= 0, jump to POSITIVE_X
@R8
M=1 // RAM[R8] = 1
@R6
M=-M // RAM[R6] = The negative value of the original RAM[R6]
(POSITIVE_X)

// Calculate the absolute value of R7 and put the value in R7. If R7 is originally positive, R9=0, If it is negative, R9=1.
@R7
D=M // D = RAM[R7]
@R9
M=0 // RAM[R9] = 0
@POSITIVE_Y
D;JGE //If D = RAM[R7] >= 0, jump to POSITIVE_Y
@R9
M=1 // RAM[R9] = 1
@R7
M=-M // RAM[R7] = The negative value of the original RAM[R7]
(POSITIVE_Y)

// Judge whether RAM[R6] < RAM[R7]
@R6
D=M // D = RAM[R6]
@R7
D=D-M // D = RAM[R7]
@Division_fail
D;JLT // If D = RAM[R7] < 0, jump to Division_fail

// Copy the value of R6 to R5
@R6
D=M // D = RAM[R6]
@R5
M=D // RAM[R5] = D = RAM[R6]

// Set R4 and R2 to 0
@R4
M=0 // RAM[R4] = 0
@R2
M=0 // RAM[R2] = 0

// Main cycle:constantly use subtraction to calculate the quotient
(LOOP)
@R5
D=M // D = RAM[R5] 
@R7
D=D-M // D = RAM[R5] - RAM[R7]
@END_LOOP
D;JLT // If RAM[R5] < RAM[R7], jump out of the cycle

@R2
M=M+1 // quotient + 1
@R5
D=M // D = RAM[R5]
@R7
D=D-M // D = RAM[R5] - RAM[R7]
@R5
M=D // update the value of R5.
@LOOP
D;JMP // go back to the cycle

// Save the remainder
(END_LOOP)
@R5
D=M // D = RAM[R5]
@R3
M=D // RAM[R3] = RAM[R5]
@LAST
D;JMP

// When dividend is 0
(Dividend_0)
@R4
M=1 // RAM[R4] = 1
@END
D;JMP

//When Division = 0 or |X| < |Y|
(Division_fail)
@R2
M=0 //the quotient is set to 0
@R4
M=0 // the error mark is 0
@R0
D=M
@R3
M=D // The remainder is equal to the original value of the divisor 

//The symbol of the quotient
(LAST)
@R8
D=M // D = RAM[R8]
@R9
D=D-M // D = RAM[R8] - RAM[R9]
@SAME
D;JEQ // If RAM[R8] = RAM[R9],jump to SAME
@R2
M=-M // negate the quotient
@REMINDER
D;JMP

// The symbol of the remainder
(SAME)
(REMINDER)
@R8
D=M // D = RAM[R8]
@POSITIVE1
D;JGT // If X is positive, jump to POSITIVE1
@END
D;JMP

(POSITIVE1)
@R3
M=-M // negate the remainder

(END)
@END
D;JMP // The program ends