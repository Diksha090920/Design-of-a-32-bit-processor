`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.08.2024 09:13:19
// Design Name: 
// Module Name: program_counter
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


module program_counter(
   input wire clk,
   input wire reset,
   input wire [31:0] PC_in,
   output reg [31:0] PC_out
   
    );
always @(posedge clk) begin 
if (reset) begin
    PC_out <=32'h00000000;
end  else begin
PC_out <= PC_in;
end
end    

endmodule
