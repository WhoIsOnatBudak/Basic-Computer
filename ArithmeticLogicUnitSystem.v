`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2024 22:05:31
// Design Name: 
// Module Name: Combine
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


module ArithmeticLogicUnitSystem(
    input wire[2:0] RF_OutASel, RF_OutBSel, RF_FunSel,
    input wire[3:0] RF_RegSel, RF_ScrSel,
    input wire[4:0] ALU_FunSel,
    input wire ALU_WF, 
    input wire[1:0] ARF_OutCSel, ARF_OutDSel,
    input wire[2:0] ARF_FunSel, ARF_RegSel,
    input wire IR_LH, IR_Write, Mem_WR, Mem_CS,
    input wire[1:0] MuxASel, MuxBSel,
    input wire MuxCSel,
    input wire Clock,
    
    
    output wire[3:0]FlagsOut,
    output wire[15:0] IROut
    );
    
    
    
    
    
    wire[7:0] MemOut;
    //wire[15:0] IROut;
    reg[15:0] MuxAOut;
    wire[15:0] OutC;
    //wire[15:0] OutD;
    wire[15:0]OutA;
    wire[15:0]OutB;
    wire[15:0]ALUOut;
    wire[15:0]Address;
    reg[7:0]MuxCOut;
    reg[15:0]MuxBOut;
    
    InstructionRegister IR(.LH(IR_LH),.I(MemOut),.Write(IR_Write),.Clock(Clock),.IROut(IROut));
    
    always @(*) begin
        case(MuxASel)
            2'b00: MuxAOut = ALUOut;
            2'b01: MuxAOut = OutC;
            2'b10: MuxAOut = {8'h00,MemOut[7:0]};
            2'b11: MuxAOut = {8'h00,IROut[7:0]};   
        endcase
    end
    
    RegisterFile RF(.I(MuxAOut),.OutASel(RF_OutASel),.OutBSel(RF_OutBSel),.FunSel(RF_FunSel),.RegSel(RF_RegSel),.ScrSel(RF_ScrSel),.Clock(Clock),.OutA(OutA),.OutB(OutB));
    
    ArithmeticLogicUnit ALU(.A(OutA),.B(OutB),.FunSel(ALU_FunSel),.WF(ALU_WF),.Clock(Clock),.ALUOut(ALUOut),.FlagsOut(FlagsOut));
    
    always @(*) begin
        case(MuxCSel)
            1'b0 : MuxCOut = ALUOut[7:0];
            1'b0 : MuxCOut = ALUOut[15:8];
        endcase
    end
    
    always @(*) begin
            case(MuxBSel)
                2'b00: MuxBOut = ALUOut;
                2'b01: MuxBOut = OutC;
                2'b10: MuxBOut = {8'h00,MemOut[7:0]};
                2'b11: MuxBOut = {8'h00,IROut[7:0]};   
            endcase
     end
     
     AddressRegisterFile ARF(.I(MuxBOut),.OutCSel(ARF_OutCSel),.OutDSel(ARF_OutDSel),.FunSel(ARF_FunSel),.RegSel(ARF_RegSel),.Clock(Clock),.OutC(OutC),.OutD(Address));
     
     Memory MEM(.Address(Address),.CS(Mem_CS),.WR(Mem_WR),.Data(MuxCOut),.Clock(Clock),.MemOut(MemOut));
     

          
     
    
    
    
    
    
endmodule
