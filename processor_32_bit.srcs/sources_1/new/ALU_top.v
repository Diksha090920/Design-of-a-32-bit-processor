`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.09.2024 00:12:29
// Design Name: 
// Module Name: ALU_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU_top(
input clk, reset
    );
wire [31:0] instruction_out, readData1,readData2 ;
wire [3:0] ALUControlTop;
wire [6:0] opcode;
wire [2:0] func3;
wire [6:0] func7;
wire [31:0] ALU_result;
wire Memwrite, RegWrite, MemRead;
wire [4:0] Rs1, Rs2, Rd;
wire [31:0] read_data;
 
 program_counter program_counter (
       .clk(),
       .reset(),
       .PC_in(),
       .PC_out()       
        );
 
 ALU_32  ALU_32 (
        
         .A(readData1),
         .B(readData2),
         .ALUControl_in(ALUControlTop), 
         .ALU_result(ALU_result),
         .zero()
            );
            
Control_unit Control_unit(
     .opcode(opcode),        // Opcode from the instruction
     .func3(func3),         // func3 from the instruction
     .ALUControl_out(ALUControlTop), // ALU control signal output
     .RegWrite(Memwrite),            // Register write enable
     .ALUSrc()               // ALU source select signal
);

Register_bank Register_bank(
    .clk(clk),
    .reset(reset) ,
    .RegWrite(RegWrite),
    .Rs1(Rs1),
    .Rs2(Rs2),
    .Rd(Rd),
    .Write_data(ALU_result), // the result that we will store "rd"
    .Read_data1(readData1),
    .Read_data2(readData2)
    );
  
instruction_decoder instruction_decoder(

        .reset(reset),             // Reset signal
        .instruction_out(instruction_out), // 32-bit instruction input        
         .opcode(opcode),     // Opcode field
         .rd(Rd),         // Destination register
         .func3(func3),      // Function code (3 bits)
         .rs1(Rs1),        // Source register 1
         .rs2(Rs2),        // Source register 2
         .func7(func7)       // Function code (7 bits)
    );

register_write register_write(

 .clk(clk),
 .reset(reset),
 .MemWrite(Memwrite),
 .MemRead(MemRead),
 .Address(Rd),
 .write_data(ALU_result),
 .read_data(read_data)
    );
    
 instruction_mem instruction_mem(
      .reset(reset),
      .read_address(),
      .instruction_out(instruction_out) // bring out the instruction from the memory 
        );
        
endmodule
