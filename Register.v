`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2024 10:59:41
// Design Name: 
// Module Name: register
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


module Register(
    input wire [2:0] FunSel,
    input wire [15:0] I,
    input wire E,
    input wire Clock,
    output reg [15:0] Q
    );
    always @(posedge Clock) begin
      if (E) begin
        case (FunSel)
            3'b000: Q=Q-1; //Decrement
            3'b001: Q=Q+1; //Increment
            3'b010: Q=I;   //Load
            3'b011: Q= 16'h0000; //clear
            3'b100: Q= (16'h00ff & I); //celar high , write low
            3'b101: Q= (Q & 16'hff00) + (I & 16'h00ff); //same high,write low
            3'b110: Q= {I[7:0],Q[7:0]}; //Lower of I became high of Q, Lower Q untouched
            3'b111: Q= {{8{I[7]}},I[7:0]}; //sign extansion
            default: Q = 16'h0000; // Default case
            
        endcase
      end
    end
endmodule



