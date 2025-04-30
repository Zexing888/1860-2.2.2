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
@R2
M=M+1
@R1
D=M
@R5
M=M-D
@R1
D=M
@R5
D=M-D
@END_LOOP
D;JLT
@LOOP
D;JMP

(END_LOOP)
@R5
D=M
@R3
M=D
@END
D;JMP

(Divison_fail)
@R2
M=0
@R4
M=1
@R0
D=M
@R3
M=D

(END)
@END
D;JMP