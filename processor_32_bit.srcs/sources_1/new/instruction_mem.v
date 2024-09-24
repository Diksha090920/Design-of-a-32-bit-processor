`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.08.2024 09:18:45
// Design Name: 
// Module Name: instruction_mem
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


module instruction_mem(
  input wire reset,
  input wire [31:0] read_address,
  output wire [31:0] instruction_out // bring out the instruction from the memory 
    );
    
    reg [31:0] Memory [0:31];   // memory of size 32*32 
    assign instruction_out = Memory[read_address];
   
    // Asynchronous reset
    integer k;
   always @(posedge reset )
   begin 
   for (k=0 ; k<32 ;k=k+1) begin 
   Memory[k]<=32'h00000000;
   
   end
   end
endmodule
