`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2024 16:36:31
// Design Name: 
// Module Name: ARF
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


module AddressRegisterFile(
    input wire[15:0] I,
    input wire[1:0] OutCSel,
    input wire[1:0] OutDSel,
    input wire[2:0] FunSel,
    input wire[2:0] RegSel,
    input wire Clock,
    
    output reg[15:0] OutC,
    output reg[15:0] OutD
    );
    wire [15:0] PC_out,AR_out,SP_out;
    
    always @(*)begin
        case(OutCSel)
            2'b00: OutC = PC_out;
            2'b01: OutC = PC_out;
            2'b10: OutC = AR_out;
            2'b11: OutC = SP_out;
        endcase
    end
    always @(*)begin
            case(OutDSel)
                2'b00: OutD = PC_out;
                2'b01: OutD = PC_out;
                2'b10: OutD = AR_out;
                2'b11: OutD = SP_out;
            endcase
    end
    Register PC (.FunSel(FunSel),.Clock(Clock),.E(~RegSel[2]),.I(I),.Q(PC_out));
    Register AR (.FunSel(FunSel),.Clock(Clock),.E(~RegSel[1]),.I(I),.Q(AR_out));
    Register SP (.FunSel(FunSel),.Clock(Clock),.E(~RegSel[0]),.I(I),.Q(SP_out));

    
    
endmodule
