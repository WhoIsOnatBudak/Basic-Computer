`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2024 16:28:58
// Design Name: 
// Module Name: reg_system
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


module RegisterFile(
    input wire [15:0] I,
    input wire [2:0] OutASel,
    input wire [2:0] OutBSel,
    input wire [2:0] FunSel,
    input wire [3:0] RegSel,
    input wire [3:0] ScrSel,
    input wire Clock,
    
    output reg [15:0] OutA,
    output reg [15:0] OutB
    
);
    wire [15:0] R1_Out,R2_Out,R3_Out,R4_Out,S1_Out,S2_Out,S3_Out,S4_Out;
    always @(*) begin
        case (OutASel)
            3'b000: OutA = R1_Out;
            3'b001: OutA = R2_Out;
            3'b010: OutA = R3_Out;
            3'b011: OutA = R4_Out;
            3'b100: OutA = S1_Out;
            3'b101: OutA = S2_Out;
            3'b110: OutA = S3_Out;
            3'b111: OutA = S4_Out;
        endcase
        case (OutBSel)
            3'b000: OutB = R1_Out;
            3'b001: OutB = R2_Out;
            3'b010: OutB = R3_Out;
            3'b011: OutB = R4_Out;
            3'b100: OutB = S1_Out;
            3'b101: OutB = S2_Out;
            3'b110: OutB = S3_Out;
            3'b111: OutB = S4_Out;
        endcase
    end

    Register R1(.FunSel(FunSel),.E(~RegSel[3]),.I(I),.Q(R1_Out),.Clock(Clock));
    Register R2(.FunSel(FunSel),.E(~RegSel[2]),.I(I),.Q(R2_Out),.Clock(Clock));
    Register R3(.FunSel(FunSel),.E(~RegSel[1]),.I(I),.Q(R3_Out),.Clock(Clock));
    Register R4(.FunSel(FunSel),.E(~RegSel[0]),.I(I),.Q(R4_Out),.Clock(Clock)); 
    
    Register S1(.FunSel(FunSel),.E(~ScrSel[3]),.I(I),.Q(S1_Out),.Clock(Clock));
    Register S2(.FunSel(FunSel),.E(~ScrSel[2]),.I(I),.Q(S2_Out),.Clock(Clock));
    Register S3(.FunSel(FunSel),.E(~ScrSel[1]),.I(I),.Q(S3_Out),.Clock(Clock));
    Register S4(.FunSel(FunSel),.E(~ScrSel[0]),.I(I),.Q(S4_Out),.Clock(Clock));


endmodule
