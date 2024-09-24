`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.09.2024 23:34:25
// Design Name: 
// Module Name: register_write
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


module register_write(
 
 input wire clk,
 input wire reset,
 input wire MemWrite,
 input wire MemRead,
 input wire [4:0] Address,
 input wire [31:0] write_data,
 output wire [31:0] read_data
    );
    
reg [31:0] Dmemory [0:31];  // 1D array of 32 size with each location storing 32 bit number

assign read_data = (MemRead) ? Dmemory[Address]: 32'h00000000;
integer k;

always @(posedge clk) begin

    if (reset ) begin
    
        for (k=0; k<32; k=k+1) begin
        
        Dmemory[k] =32'h00000000;
        
        end
    end else if (MemWrite) begin 
           Dmemory[Address] =write_data;
    end
end

endmodule
