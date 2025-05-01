// Let RAM[R2] = 0, and use it to store the final sum
@R2
M=0

@R0 //D = RAM[R0]
D=M
@R3
M=D // use the RAM[R3] as the starting sddress of the data storage

@R1
D=M //D = RAM[R1], read the number of elements
@R4
M=D // RAM[R4] = RAM[R1], use it as counter

@R1
D=M // D = RAM[R1]
@END
D;JLE // if D <= 0, jump to END

// Start the loop and save the value to R2
(LOOP)
@R3
A=M // A = RAM[R3], gert the data address at the current position
D=M // D = the value at the current address
@R2
M=D+M // add the previous element value to R2

@R3
M=M+1 // RAM[R3] + 1, point to the next element
@R4
M=M-1 // the counter - 1
D=M // D = RAM[R4], the new counter
@LOOP
D;JGT // If the new counter > 0, jump to LOOP

(END)
@END
D;JMP // Jump to END