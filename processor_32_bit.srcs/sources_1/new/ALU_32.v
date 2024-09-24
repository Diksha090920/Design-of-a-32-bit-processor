`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.09.2024 19:49:59
// Design Name: 
// Module Name: ALU_32
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


module ALU_32(

input wire [31:0] A,
input wire [31:0] B,
input wire [3:0] ALUControl_in, 
output reg [31:0] ALU_result,
output reg zero
    );
    
always @(*) begin    

   case(ALUControl_in)
      4'b0001:begin 
         ALU_result= A+B;
         end
      4'b0010:begin 
          ALU_result= A-B;
           end
      4'b0011:begin 
          ALU_result= A<<B;
           end
      4'b0100:begin 
          if ($signed(A)< $signed(B)) 
          ALU_result=1;
          else ALU_result=0;
           end
      4'b0100:begin 
           if (A<B) 
           ALU_result=1;
           else ALU_result=0;
           end
      4'b0101:begin 
           ALU_result= A^B;
           end
     4'b0101:begin 
           ALU_result= A^B;
           end
     4'b0110:begin 
           ALU_result= A>>B;
           end
     4'b0111:begin 
           ALU_result= A>>>B;
           end
     4'b1000:begin 
           ALU_result= A|B;
           end
     4'b1001:begin 
           ALU_result= A&B;
           end
           
      default :begin
         ALU_result=32'h00000000;
         end
   endcase
   zero = (ALU_result == 32'h00000000); // Zero flag
 end
    
endmodule
