@R1
D=M
@Divisor_0
D;JEQ

@R0
D=M
@Division_fail
D;JEQ

@R0
D=M
@R1
D=D-M
@Division_fail
D;JLT

@R0
D=M
@R5
M=D

@R4
M=0
@R2
M=0
(LOOP)
@R5
D=M
@R1
D=D-M
@END_LOOP
D;JLT
@R2
M=M+1
@R5
D=M
@R1
D=D-M
@R5
M=D
@LOOP
D;JMP


(END_LOOP)
@R5
D=M
@R3
M=D
@END
D;JMP

(Divisor_0)
@R4
M=1

(Division_fail)
@R2
M=0
@R4
M=0
@R0
D=M
@R3
M=D

(END)
@END
D;JMP