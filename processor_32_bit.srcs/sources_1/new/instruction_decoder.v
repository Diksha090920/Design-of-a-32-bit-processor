`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.09.2024 19:36:30
// Design Name: 
// Module Name: instruction_decoder
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


module instruction_decoder(
    input wire reset,             // Reset signal
    input wire [31:0] instruction_out, // 32-bit instruction input
    
    output wire [6:0] opcode,     // Opcode field
    output wire [4:0] rd,         // Destination register
    output wire [2:0] func3,      // Function code (3 bits)
    output wire [4:0] rs1,        // Source register 1
    output wire [4:0] rs2,        // Source register 2
    output wire [6:0] func7       // Function code (7 bits)
);

// Extract fields from the instruction using bit slicing
assign opcode = instruction_out[6:0];     // Bits 6:0
assign rd = instruction_out[11:7];        // Bits 11:7
assign func3 = instruction_out[14:12];    // Bits 14:12
assign rs1 = instruction_out[19:15];      // Bits 19:15
assign rs2 = instruction_out[24:20];      // Bits 24:20
assign func7 = instruction_out[31:25];    // Bits 31:25, even if they are always zero

endmodule

