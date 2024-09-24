`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.08.2024 11:08:06
// Design Name: 
// Module Name: Register_bank
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


module Register_bank(
   input wire clk,
   input wire reset ,
   input wire RegWrite,
   input wire [4:0] Rs1,
   input wire [4:0] Rs2,
   input wire [4:0] Rd,
   input wire [31:0] Write_data, // the result that we will store "rd"
   output wire [31:0] Read_data1,
   output wire [31:0] Read_data2
    );
    
 reg [31:0] Registers [0:31];
 
 integer k;
 
 assign Read_data1= Registers[Rs1];
 assign Read_data2= Registers[Rs2];
 
 always @ (posedge clk) begin
 if (reset)begin
 
 for (k=0; k<32; k=k+1) begin
    Registers[k] <=32'h00000000;
    
 end
  end else if (RegWrite) begin
  
  Registers[Rd] =Write_data;
  end
 end
 
    
endmodule

