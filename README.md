# Design-of-a-32-bit-processor
Design of a 32-bit processor (Instruction decode (Instruction decoder +controller ) + Instruction execute (ALU) +register write (Register Bank ) which executer the following 10 instructions: ADD, SUB, SLL, SLT, SLTU, XOR, SRL, SRA, OR, AND)

The processor has the following modules:
1) A 32 bit register bank which will have 32 registers and each registers can store 32- bit data,
2) An instruction decoder module that will slice the 32-bit instructions into the corresponding fields opcode, func, and, rs1, rs2, and rd values.
3) A controller module that will generate a corresponding signal for the respective operations dpending func and opcode.
4) 32-bit ALU for processing the data in rs1 and rs2 registers.
5) Register write to store the result back into rd register in the register bank.
