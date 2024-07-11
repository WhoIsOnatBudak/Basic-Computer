`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2024 16:23:45
// Design Name: 
// Module Name: ir_register
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


module InstructionRegister(
    input wire LH,
    input wire [7:0] I,
    input wire Write,
    input wire Clock,
    output reg[15:0] IROut
    );
    always @(posedge Clock) begin
        if(Write) begin
            case (LH)
                1'b1: IROut[15:8] = I; // High bit changed
                1'b0: IROut[7:0] = I;  //Low bit changed
                default IROut = IROut;
            endcase
        end
    end
endmodule
