`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2024 20:39:35
// Design Name: 
// Module Name: ALU
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


module ArithmeticLogicUnit(
    input wire [15:0] A,
    input wire [15:0] B,
    input wire [4:0] FunSel,
    input wire WF,
    output reg[15:0] ALUOut,
    input wire Clock,
    output reg[3:0] FlagsOut
    );
    reg C;
    reg O;
    reg T;
    
    always @(*) begin
        
        case(FunSel)
            5'b00000: ALUOut[7:0] = A[7:0];
            
            5'b00001: ALUOut[7:0] = B[7:0];
            
            
            5'b00010: ALUOut[7:0] = ~A[7:0];
            
            5'b00011: ALUOut[7:0] = ~B[7:0];
            
            5'b00100: begin {C,ALUOut[7:0]} = {1'b0,A[7:0]}+ {1'b0,B[7:0]} ;
            if(((A[7] == B[7]) & (A[7] == ALUOut[7]))| (A[7] == ~B[7])) begin
                O=1'b0;
            end
            else
                O=1'b1;
            end
            5'b00101: begin {C,ALUOut[7:0]} = {1'b0,A[7:0]} + {1'b0,B[7:0]} +FlagsOut[2];//CHECK
            //ALUOut = A+B+C;
            if(((A[7] == B[7]) & (A[7] == ALUOut[7])) | (A[7] == ~B[7])) begin
                O=1'b0;
            end
            else
                O=1'b1;
            end
            5'b00110: begin {C,ALUOut[7:0]} ={1'b0,A[7:0]} + {1'b0,~B[7:0]} + 1;
            if(((A[7] == ~B[7]) & (A[7] == ALUOut[7])) | (A[7] == B[7]) ) begin
                O=1'b0;
            end
            else
                O=1'b1;
            end
            
            5'b00111: begin ALUOut[7:0] = A[7:0] & B[7:0]; end
            5'b01000: begin ALUOut[7:0] = A[7:0] | B[7:0]; end
            5'b01001: begin ALUOut[7:0] = A[7:0] ^ B[7:0]; end
            5'b01010: begin ALUOut [7:0] = ~(A [7:0] & B [7:0]); end
            
            5'b01011: begin ALUOut[7:0] ={A[6:0],1'b0}; C = A[7]; end
            5'b01100: begin ALUOut[7:0] = {1'b0,A[7:1]}; C = A[0]; end
            5'b01101: ALUOut[7:0] ={A[7],A[7:1]};
            5'b01110: begin ALUOut[7:0] ={A[6:0],FlagsOut[2]}; C = A[7]; end
            5'b01111: begin ALUOut[7:0] ={FlagsOut[2],A[7:1]}; C = A[0]; end
            
            5'b10000: ALUOut = A;
            5'b10001: ALUOut = B;
            5'b10010: ALUOut = ~A;
            5'b10011: ALUOut = ~B;
            5'b10100: begin {C,ALUOut[15:0]} = {1'b0,A}+{1'b0,B};
            if(((A[15] == B[15]) & (A[15] == ALUOut[15])) | (A[15] == ~B[15])) begin
                O=1'b0;
            end
            else
                O=1'b1;
            end
            5'b10101: begin  {C,ALUOut[15:0]} = {1'b0,A}+{1'b0,B}+FlagsOut[2];//CHECK
            //ALUOut[15:0] = A+B+C;
            if(((A[15] == B[15]) & (A[15] == ALUOut[15])) | (A[15] == ~B[15])) begin
                O=1'b0;
            end
            else
                O=1'b1;
            end
            
            
            
            5'b10110: begin {C,ALUOut[15:0]} ={1'b0,A}+{1'b0,~B}+1;
            if(((A[15] == ~B[15]) & (A[15] == ALUOut[15])) | (A[15] == B[15])) begin
                O=1'b0;
            end
            else
                O=1'b1;
            end
            
            
            5'b10111: ALUOut = A&B;
            5'b11000: ALUOut = A | B;
            5'b11001: ALUOut = A ^ B;
            5'b11010: ALUOut = ~(A&B);
            
            
            5'b11011: begin ALUOut[15:0] ={A[14:0],1'b0}; C = A[15]; end
            5'b11100: begin ALUOut[15:0] = {1'b0,A[15:1]}; C = A[0]; end
            5'b11101: ALUOut[15:0] ={A[15],A[15:1]};
            5'b11110: begin ALUOut[15:0] ={A[14:0],FlagsOut[2]}; C = A[15]; end
            5'b11111: begin ALUOut[15:0] ={FlagsOut[2],A[15:1]}; C = A[0]; end
            
            
            
              
        endcase
        if(FunSel[5]==1'b0) begin
            ALUOut[15:8]={8'h00};
        end
        
        
        end
        always @(posedge Clock) begin
                    
                    if(WF)begin
                            if(ALUOut == 16'd0) begin
                                FlagsOut[3] = 1'b1;
                            end
                            else begin
                                FlagsOut[3] =1'b0;
                            end
                            FlagsOut[2]=C;
                           
                            FlagsOut[0]=O;
                            FlagsOut[1]=ALUOut[15];
                                
                        end
                end
    
endmodule
