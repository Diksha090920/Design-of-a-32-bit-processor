`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.09.2024 19:45:37
// Design Name: 
// Module Name: Control_unit
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


module Control_unit(
    input wire [6:0] opcode,        // Opcode from the instruction
    input wire [2:0] func3,         // func3 from the instruction
    output reg [3:0] ALUControl_out, // ALU control signal output
    output reg RegWrite,            // Register write enable
    output reg ALUSrc               // ALU source select signal
);

always @(*) begin
    // Default values for control signals
    RegWrite = 0;
    ALUSrc = 0;
    ALUControl_out = 4'b0000;

    case (opcode)
        7'b0000001: begin // Assuming this opcode is for R-type instructions
            case (func3)
                3'b000: begin // ADD operation
                    ALUControl_out = 4'b0001; // ALU operation code for ADD
                    RegWrite = 1;             // Enable writing to the register
                    ALUSrc = 0;               // Use register file as ALU source
                end
                3'b001: begin // SUB operation
                    ALUControl_out = 4'b0010; // ALU operation code for SUB
                    RegWrite = 1;             // Enable writing to the register
                    ALUSrc = 0;               // Use register file as ALU source
                end
                // Add more cases if needed for other func3 values
                default: begin
                    ALUControl_out = 4'b0000; // Default no-operation
                    RegWrite = 0;
                    ALUSrc = 0;
                end
            endcase
        end
        // Add more cases for other opcodes if needed
        default: begin
            ALUControl_out = 4'b0000; // Default no-operation
            RegWrite = 0;
            ALUSrc = 0;
        end
        
           7'b0000011: begin // Assuming this opcode is for R-type instructions
                case (func3)
                    3'b000: begin // SLL operation
                        ALUControl_out = 4'b0011; // ALU operation code for SLL
                        RegWrite = 1;             // Enable writing to the register
                        ALUSrc = 0;               // Use register file as ALU source
                    end
                    3'b001: begin // SRL operation
                        ALUControl_out = 4'b0100; // ALU operation code for SRL
                        RegWrite = 1;             // Enable writing to the register
                        ALUSrc = 0;               // Use register file as ALU source
                    end
                     3'b010: begin // SRA operation
                                           ALUControl_out = 4'b0101; // ALU operation code for SRA
                                           RegWrite = 1;             // Enable writing to the register
                                           ALUSrc = 0;               // Use register file as ALU source
                                       end
                    // Add more cases if needed for other func3 values
                    default: begin
                        ALUControl_out = 4'b0000; // Default no-operation
                        RegWrite = 0;
                        ALUSrc = 0;
                    end
                endcase
            end
            // Add more cases for other opcodes if needed
           
               7'b0000111: begin // Assuming this opcode is for R-type instructions
                          case (func3)
                              3'b000: begin // SLL operation
                                 ALUControl_out = 4'b0110; // ALU operation code for SLT
                                 RegWrite = 1;             // Enable writing to the register
                                 ALUSrc = 0;               // Use register file as ALU source
                                 end
                              3'b001: begin // SRL operation
                                 ALUControl_out = 4'b0111; // ALU operation code for SLTU
                                 RegWrite = 1;             // Enable writing to the register
                                 ALUSrc = 0;               // Use register file as ALU source
                                 end
                                                     // Add more cases if needed for other func3 values
                            default: begin
                                    ALUControl_out = 4'b0000; // Default no-operation
                                    RegWrite = 0;
                                    ALUSrc = 0;
                                     end
                            endcase
                          end
            7'b0001111: begin // Assuming this opcode is for R-type instructions
                         case (func3)
                          3'b000: begin // SLL operation
                          ALUControl_out = 4'b1000; // ALU operation code for XOR
                          RegWrite = 1;             // Enable writing to the register
                          ALUSrc = 0;               // Use register file as ALU source
                          end
                          3'b001: begin // SRL operation
                          ALUControl_out = 4'b1001; // ALU operation code for OR
                          RegWrite = 1;             // Enable writing to the register
                          ALUSrc = 0;               // Use register file as ALU source
                          end
                          3'b010: begin // SRL operation
                          ALUControl_out = 4'b1010; // ALU operation code for AND
                          RegWrite = 1;             // Enable writing to the register
                          ALUSrc = 0;               // Use register file as ALU source
                          end
                                                                             // Add more cases if needed for other func3 values
                          default: begin
                          ALUControl_out = 4'b0000; // Default no-operation
                          RegWrite = 0;
                          ALUSrc = 0;
                          end
                      endcase
                   end
        endcase
end

endmodule
