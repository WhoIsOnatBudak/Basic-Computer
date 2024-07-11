`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2024 14:13:09
// Design Name: 
// Module Name: CPUSystem
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


module CPUSystem(
    input wire Clock,
    input wire[7:0] T,
    input wire Reset
    );
    reg[0:0] T1;
    reg[0:0] T2;
    reg[0:0] T3;
    reg[0:0] T4;
    reg[0:0] T5;
    reg[0:0] T6;
    reg[0:0] T7;
    reg[0:0] T0;
    reg[0:0] RT;
    
        reg[2:0] RF_OutASel;
        reg[2:0] RF_OutBSel;
        reg[2:0] RF_FunSel;
        reg[3:0] RF_RegSel;
        reg[3:0] RF_ScrSel;
        reg[4:0] ALU_FunSel;
        reg ALU_WF; 
        reg[1:0] ARF_OutCSel;
        reg[1:0] ARF_OutDSel;
        reg[2:0] ARF_FunSel;
        reg[2:0] ARF_RegSel;
        reg IR_LH;
        reg IR_Write;
        reg Mem_WR;
        reg Mem_CS;
        reg[1:0] MuxASel;
        reg[1:0] MuxBSel;
        reg MuxCSel;
        
        
        wire[15:0] IR_O;
        wire[3:0]FlagsOut;
        
        initial begin
            T0 = 1'b0; 
            ARF_RegSel = 3'b111;
            RF_RegSel = 4'b1111;
            RF_ScrSel = 4'b1111;
            _ALUSystem.ARF.SP.Q = 16'h00fd;
            _ALUSystem.ARF.PC.Q = 16'h0000;
            _ALUSystem.ARF.AR.Q = 16'h0000;
            _ALUSystem.RF.R1.Q = 16'h0009;
            _ALUSystem.RF.R2.Q = 16'h0000;
            _ALUSystem.RF.R3.Q = 16'h0000;
            _ALUSystem.RF.R4.Q = 16'h0000;
            _ALUSystem.RF.S1.Q = 16'h0000;
            _ALUSystem.RF.S2.Q = 16'h0000;
            _ALUSystem.RF.S3.Q = 16'h0000;
            _ALUSystem.RF.S4.Q = 16'h0000;
            _ALUSystem.ALU.ALUOut = 16'h0000;
            ALU_WF = 1'b0;
            RT = 1'b0; 
        end
    
    
    always @(posedge Clock) begin
    if(RT == 1'b0) begin
       if(T0 == 1'b1 || T == 8'h00 || ((T0 || T1 || T2 || T3 || T4 || T5 || T6 || T7) == 1'b0 )) begin
           T0 = 1'b0;
           T1 = 1'b1;
       end
       if(T1 == 1'b1) begin
           T1 = 1'b0;
           T2 = 1'b1;
       end
       if(T2 == 1'b1) begin
           T2 = 1'b0;
           T3 = 1'b1;
       end
       if(T3 == 1'b1) begin
           T3 = 1'b0;
           T4 = 1'b1;
       end
       if(T4 == 1'b1) begin
           T4 = 1'b0;
           T5 = 1'b1;
       end
       if(T5 == 1'b1) begin
           T5 = 1'b0;
           T6 = 1'b1;
       end
       if(T6 == 1'b1) begin
           T6 = 1'b0;
           T7 = 1'b1;
       end
    end
       if(RT == 1'b1) begin
           T0= 1'b1;
           T1= 1'b0;
           T2= 1'b0;
           T3= 1'b0;
           T4= 1'b0;
           T5= 1'b0;
           T6= 1'b0;
           T7= 1'b0;
           RT= 1'b0;
       end    
    end
    
    ArithmeticLogicUnitSystem _ALUSystem(.RF_OutASel(RF_OutASel),.RF_OutBSel(RF_OutBSel),.RF_FunSel(RF_FunSel),.RF_RegSel(RF_RegSel),.Clock(Clock),.RF_ScrSel(RF_ScrSel),.ALU_FunSel(ALU_FunSel),.ALU_WF(ALU_WF),.ARF_OutCSel(ARF_OutCSel),.ARF_OutDSel(ARF_OutDSel),.ARF_FunSel(ARF_FunSel),.ARF_RegSel(ARF_RegSel),.IR_LH(IR_LH),.IR_Write(IR_Write),.Mem_WR(Mem_WR),.Mem_CS(Mem_CS),.MuxASel(MuxASel),.MuxBSel(MuxBSel),.MuxCSel(MuxCSel),.FlagsOut(FlagsOut),.IROut(IR_O));
    
    always @(*) begin
       if(T0 == 1'b1 || T == 8'h00 || ((T0 || T1 || T2 || T3 || T4 || T5 || T6 || T7) == 1'b0 )) begin
           ALU_WF=1'b0;
           RF_RegSel = 4'b1111;
           RF_ScrSel = 4'b1111;
           ALU_WF = 1'b0;
           
           
           ARF_OutDSel = 2'b00;
           Mem_WR = 1'b0;
           Mem_CS = 1'b0;
           IR_LH = 1'b0;
           IR_Write = 1'b1;
           ARF_FunSel = 3'b001;
           ARF_RegSel = 3'b011;
           
       end
       if(T1 == 1'b1) begin
           ARF_OutDSel = 2'b00;
           Mem_WR = 1'b0;
           Mem_CS = 1'b0;
           IR_LH = 1'b1;
           IR_Write = 1'b1;
           ARF_FunSel = 3'b001;
           ARF_RegSel = 3'b011;
       end
       if(T2 == 1'b1) begin
           //ARF_RegSel = 3'b111; // Checkkkkkkkkkkkkkkkkkkkkk
           IR_Write = 1'b0;
       end
    end
    
    always @(*) begin
    
        //PC <- PC + Value
        if((T2 == 1'b1) && (IR_O[15:10] == 6'b000000)) begin
            ARF_RegSel = 3'b111;
        
            MuxASel = 2'b11;
            RF_FunSel = 3'b010;
            RF_ScrSel = 4'b0111;
            
        end
        if((T3 == 1'b1) && (IR_O[15:10] == 6'b000000)) begin
            MuxASel = 2'b01;
            ARF_OutCSel = 2'b00;
            RF_FunSel = 3'b010;
            RF_ScrSel = 4'b1011;
        end
        if((T4 == 1'b1) && (IR_O[15:10] == 6'b000000))begin
            RF_OutASel = 3'b100;
            RF_OutBSel = 3'b101;
            ALU_FunSel = 5'b10100;
            MuxBSel = 2'b00;
            ARF_RegSel = 3'b011;
            ARF_FunSel = 3'b010;
            RT=1'b1;
        end
        
        
        //IF Z=0 THEN PC ? PC + VALUE
        if((T2 == 1'b1) && (IR_O[15:10] == 6'b000001) && (FlagsOut[3] == 1'b0 )) begin
            ARF_RegSel = 3'b111;
        
            MuxASel = 2'b11;
            RF_FunSel = 3'b010;
            RF_ScrSel = 4'b0111;
            
        end
        if((T3 == 1'b1) && (IR_O[15:10] == 6'b000001) && (FlagsOut[3] == 1'b0 )) begin
            MuxASel = 2'b01;
            ARF_OutCSel = 2'b00;
            RF_FunSel = 3'b010;////////////////////////////////////////////////////////bak
            RF_ScrSel = 4'b1011;
        end
        if((T4 == 1'b1) && (IR_O[15:10] == 6'b000001) && (FlagsOut[3] == 1'b0 ))begin
            RF_OutASel = 3'b100;
            RF_OutBSel = 3'b101;
            ALU_FunSel = 5'b10100;
            MuxBSel = 2'b00;
            ARF_RegSel = 3'b011;
            ARF_FunSel = 3'b010;

        end
        
        
        //IF Z=1 THEN PC ? PC + VALUE
        if((T2 == 1'b1) && (IR_O[15:10] == 6'b000010) && (FlagsOut[3] == 1'b1 )) begin
            ARF_RegSel = 3'b111;
        
            MuxASel = 2'b11;
            RF_FunSel = 3'b010;
            RF_ScrSel = 4'b0111;
            
        end
        if((T3 == 1'b1) && (IR_O[15:10] == 6'b000010) && (FlagsOut[3] == 1'b1 )) begin
            MuxASel = 2'b01;
            ARF_OutCSel = 2'b00;
            RF_FunSel = 3'b010;
            RF_ScrSel = 4'b1011;
        end
        if((T4 == 1'b1) && (IR_O[15:10] == 6'b000010) && (FlagsOut[3] == 1'b1 ))begin
            RF_OutASel = 3'b100;
            RF_OutBSel = 3'b101;
            ALU_FunSel = 5'b10100;
            MuxBSel = 2'b00;
            ARF_RegSel = 3'b011;
            ARF_FunSel = 3'b010;
            RT=1'b1;
        end
        
        
        
        
        //SP ? SP + 1, Rx ? M[SP]
        if((T2 == 1'b1) && (IR_O[15:10] == 6'b000011)) begin
            ARF_FunSel = 3'b001;
            ARF_RegSel = 3'b110;
            ARF_OutDSel = 2'b11;
            MuxASel = 2'b10;
            RF_FunSel = 3'b101;
            Mem_WR = 1'b0;
            if(IR_O[9:8] == 2'b00) begin 
                RF_RegSel = 4'b0111;
            end
            if(IR_O[9:8] == 2'b01) begin
                RF_RegSel = 4'b1011;
            end
            if(IR_O[9:8] == 2'b10) begin
                RF_RegSel = 4'b1101;
            end
            if(IR_O[9:8] == 2'b11) begin
                RF_RegSel = 4'b1110;
            end
            
        end

        if((T3 == 1'b1) && (IR_O[15:10] == 6'b000011)) begin
            ARF_RegSel = 3'b110;
            ARF_OutDSel = 2'b11;
            MuxASel = 2'b10;
            RF_FunSel = 3'b110;
            Mem_WR = 1'b0;
            if(IR_O[9:8] == 2'b00) begin 
                RF_RegSel = 4'b0111;
            end
            if(IR_O[9:8] == 2'b01) begin
                RF_RegSel = 4'b1011;
            end
            if(IR_O[9:8] == 2'b10) begin
                RF_RegSel = 4'b1101;
            end
            if(IR_O[9:8] == 2'b11) begin
                RF_RegSel = 4'b1110;
            end
            RT = 1'b1;
            
        end
        
        //M[SP] ? Rx, SP ? SP – 1
        if((T2 == 1'b1) && (IR_O[15:10] == 6'b000100)) begin
            
        
        
            ARF_RegSel = 3'b110;
            ARF_FunSel = 3'b000;
            ARF_OutDSel = 2'b11;
            Mem_WR = 1'b1;
            MuxCSel = 1'b0;
            ALU_FunSel = 5'b10000;
            
            if(IR_O[9:8] == 2'b00) begin 
                RF_OutASel = 3'b000;
            end
            if(IR_O[9:8] == 2'b01) begin
                RF_OutASel = 3'b001;
            end
            if(IR_O[9:8] == 2'b10) begin
                RF_OutASel = 3'b010;
            end
            if(IR_O[9:8] == 2'b11) begin
                RF_OutASel = 3'b011;
            end
            RT= 1'b1;
        end

        if((T3 == 1'b1) && (IR_O[15:10] == 6'b000100)) begin
            
        
        
            ARF_RegSel = 3'b110;
            ARF_OutDSel = 2'b11;
            Mem_WR = 1'b1;
            MuxCSel = 1'b1;
            ALU_FunSel = 5'b10000;
            
            if(IR_O[9:8] == 2'b00) begin 
                RF_OutASel = 3'b000;
            end
            if(IR_O[9:8] == 2'b01) begin
                RF_OutASel = 3'b001;
            end
            if(IR_O[9:8] == 2'b10) begin
                RF_OutASel = 3'b010;
            end
            if(IR_O[9:8] == 2'b11) begin
                RF_OutASel = 3'b011;
            end
            RT= 1'b1;
        end

        
        
        
        
        
        
        //DSTREG ? SREG1 + 1
        if((T2 == 1'b1) && (IR_O[15:10] == 6'b000101))begin
            ALU_WF = IR_O[9];

            
            
            if(IR_O[5] == 1) begin 
                if(IR_O[8] == 1) begin MuxASel = 2'b00; ALU_FunSel = 5'b10000;
                    if(IR_O[5:3] == 3'b100) begin RF_OutASel = 3'b000; end
                    if(IR_O[5:3] == 3'b101) begin RF_OutASel = 3'b001; end
                    if(IR_O[5:3] == 3'b110) begin RF_OutASel = 3'b010; end
                    if(IR_O[5:3] == 3'b111) begin RF_OutASel = 3'b011; end
                    if(IR_O[8:6] == 3'b100) begin RF_RegSel = 4'b0111; end
                    if(IR_O[8:6] == 3'b101) begin RF_RegSel = 4'b1011; end
                    if(IR_O[8:6] == 3'b110) begin RF_RegSel = 4'b1101; end
                    if(IR_O[8:6] == 3'b111) begin RF_RegSel = 4'b1110; end
                    RF_FunSel = 3'b010; ARF_RegSel = 3'b111;
                end
                if(IR_O[8] == 0) begin MuxBSel = 2'b00; ALU_FunSel = 5'b10000;
                    if(IR_O[5:3] == 3'b100) begin RF_OutASel = 3'b000; end
                    if(IR_O[5:3] == 3'b101) begin RF_OutASel = 3'b001; end
                    if(IR_O[5:3] == 3'b110) begin RF_OutASel = 3'b010; end
                    if(IR_O[5:3] == 3'b111) begin RF_OutASel = 3'b011; end
                    if(IR_O[8:6] == 3'b000) begin ARF_RegSel = 3'b011; end
                    if(IR_O[8:6] == 3'b001) begin ARF_RegSel = 3'b011; end
                    if(IR_O[8:6] == 3'b010) begin ARF_RegSel = 3'b110; end
                    if(IR_O[8:6] == 3'b011) begin ARF_RegSel = 3'b101; end
                    ARF_FunSel = 3'b010; RF_RegSel =4'b1111;
                end
            end
            if(IR_O[5] == 0) begin 
                if(IR_O[8] == 0) begin MuxBSel = 2'b01;
                    if(IR_O[5:3] == 3'b000) begin ARF_OutCSel = 2'b00; end
                    if(IR_O[5:3] == 3'b001) begin ARF_OutCSel = 2'b00; end
                    if(IR_O[5:3] == 3'b010) begin ARF_OutCSel = 2'b11; end
                    if(IR_O[5:3] == 3'b011) begin ARF_OutCSel = 2'b10; end
                    if(IR_O[8:6] == 3'b000) begin ARF_RegSel = 3'b011; end
                    if(IR_O[8:6] == 3'b001) begin ARF_RegSel = 3'b011; end
                    if(IR_O[8:6] == 3'b010) begin ARF_RegSel = 3'b110; end
                    if(IR_O[8:6] == 3'b011) begin ARF_RegSel = 3'b101; end
                    ARF_FunSel = 3'b010;  RF_RegSel =4'b1111;  
                
                end
                
                if(IR_O[8] == 1) begin MuxBSel = 2'b01;
                    if(IR_O[5:3] == 3'b000) begin ARF_OutCSel = 2'b00; end
                    if(IR_O[5:3] == 3'b001) begin ARF_OutCSel = 2'b00; end
                    if(IR_O[5:3] == 3'b010) begin ARF_OutCSel = 2'b11; end
                    if(IR_O[5:3] == 3'b011) begin ARF_OutCSel = 2'b10; end
                    if(IR_O[8:6] == 3'b100) begin RF_RegSel = 4'b0111; end
                    if(IR_O[8:6] == 3'b101) begin RF_RegSel = 4'b1011; end
                    if(IR_O[8:6] == 3'b110) begin RF_RegSel = 4'b1101; end
                    if(IR_O[8:6] == 3'b111) begin RF_RegSel = 4'b1110; end
                    RF_FunSel = 3'b010; ARF_RegSel = 3'b111;
                end
            end     
            
            
            

        end
        
        
        
        if((T3 == 1'b1) && (IR_O[15:10] == 6'b000101))begin
        
        
            if(IR_O[8] == 1'b0) begin
            
                if(IR_O[8:6] == 3'b000)begin ARF_RegSel = 3'b011; end
                if(IR_O[8:6] == 3'b001)begin ARF_RegSel = 3'b011; end
                if(IR_O[8:6] == 3'b010)begin ARF_RegSel = 3'b110; end
                if(IR_O[8:6] == 3'b011)begin ARF_RegSel = 3'b101; end
                ARF_FunSel = 3'b001; RF_RegSel =4'b1111;
            end
        
            if(IR_O[8] == 1'b0) begin
            
                if(IR_O[8:6] == 3'b100)begin RF_RegSel = 4'b0111; end
                if(IR_O[8:6] == 3'b101)begin RF_RegSel = 4'b1011; end
                if(IR_O[8:6] == 3'b110)begin RF_RegSel = 4'b1101; end
                if(IR_O[8:6] == 3'b111)begin RF_RegSel = 4'b1110; end
                RF_FunSel = 3'b001; ARF_RegSel = 3'b111;
            end

            RT=1'b1;
        end


        ////DSTREG ? SREG1 - 1                                                                 baaaaaaaaaaaak
        if((T2 == 1'b1) && (IR_O[15:10] == 6'b000110))begin
            ALU_WF = IR_O[9];

            
            
            if(IR_O[5] == 1) begin 
                if(IR_O[8] == 1) begin MuxASel = 2'b00; ALU_FunSel = 5'b10000;
                    if(IR_O[5:3] == 3'b100) begin RF_OutASel = 3'b000; end
                    if(IR_O[5:3] == 3'b101) begin RF_OutASel = 3'b001; end
                    if(IR_O[5:3] == 3'b110) begin RF_OutASel = 3'b010; end
                    if(IR_O[5:3] == 3'b111) begin RF_OutASel = 3'b011; end
                    if(IR_O[8:6] == 3'b100) begin RF_RegSel = 4'b0111; end
                    if(IR_O[8:6] == 3'b101) begin RF_RegSel = 4'b1011; end
                    if(IR_O[8:6] == 3'b110) begin RF_RegSel = 4'b1101; end
                    if(IR_O[8:6] == 3'b111) begin RF_RegSel = 4'b1110; end
                    RF_FunSel = 3'b010; ARF_RegSel = 3'b111;
                end
                if(IR_O[8] == 0) begin MuxBSel = 2'b00; ALU_FunSel = 5'b10000;
                    if(IR_O[5:3] == 3'b100) begin RF_OutASel = 3'b000; end
                    if(IR_O[5:3] == 3'b101) begin RF_OutASel = 3'b001; end
                    if(IR_O[5:3] == 3'b110) begin RF_OutASel = 3'b010; end
                    if(IR_O[5:3] == 3'b111) begin RF_OutASel = 3'b011; end
                    if(IR_O[8:6] == 3'b000) begin ARF_RegSel = 3'b011; end
                    if(IR_O[8:6] == 3'b001) begin ARF_RegSel = 3'b011; end
                    if(IR_O[8:6] == 3'b010) begin ARF_RegSel = 3'b110; end
                    if(IR_O[8:6] == 3'b011) begin ARF_RegSel = 3'b101; end
                    ARF_FunSel = 3'b010; RF_RegSel =4'b1111;
                end
            end
            if(IR_O[5] == 0) begin 
                if(IR_O[8] == 0) begin MuxBSel = 2'b01;
                    if(IR_O[5:3] == 3'b000) begin ARF_OutCSel = 2'b00; end
                    if(IR_O[5:3] == 3'b001) begin ARF_OutCSel = 2'b00; end
                    if(IR_O[5:3] == 3'b010) begin ARF_OutCSel = 2'b11; end
                    if(IR_O[5:3] == 3'b011) begin ARF_OutCSel = 2'b10; end
                    if(IR_O[8:6] == 3'b000) begin ARF_RegSel = 3'b011; end
                    if(IR_O[8:6] == 3'b001) begin ARF_RegSel = 3'b011; end
                    if(IR_O[8:6] == 3'b010) begin ARF_RegSel = 3'b110; end
                    if(IR_O[8:6] == 3'b011) begin ARF_RegSel = 3'b101; end
                    ARF_FunSel = 3'b010;  RF_RegSel =4'b1111;  
                
                end
                
                if(IR_O[8] == 1) begin MuxBSel = 2'b01;
                    if(IR_O[5:3] == 3'b000) begin ARF_OutCSel = 2'b00; end
                    if(IR_O[5:3] == 3'b001) begin ARF_OutCSel = 2'b00; end
                    if(IR_O[5:3] == 3'b010) begin ARF_OutCSel = 2'b11; end
                    if(IR_O[5:3] == 3'b011) begin ARF_OutCSel = 2'b10; end
                    if(IR_O[8:6] == 3'b100) begin RF_RegSel = 4'b0111; end
                    if(IR_O[8:6] == 3'b101) begin RF_RegSel = 4'b1011; end
                    if(IR_O[8:6] == 3'b110) begin RF_RegSel = 4'b1101; end
                    if(IR_O[8:6] == 3'b111) begin RF_RegSel = 4'b1110; end
                    RF_FunSel = 3'b010; ARF_RegSel = 3'b111;
                end
            end     
            
            
            

        end
        
        if((T3 == 1'b1) && (IR_O[15:10] == 6'b000110))begin
        
        
        if(IR_O[8] == 1'b0) begin
        
            if(IR_O[8:6] == 3'b000)begin ARF_RegSel = 3'b011; end
            if(IR_O[8:6] == 3'b001)begin ARF_RegSel = 3'b011; end
            if(IR_O[8:6] == 3'b010)begin ARF_RegSel = 3'b110; end
            if(IR_O[8:6] == 3'b011)begin ARF_RegSel = 3'b101; end
            ARF_FunSel = 3'b000; RF_RegSel =4'b1111;
        end
        
        if(IR_O[8] == 1'b0) begin
        
            if(IR_O[8:6] == 3'b100)begin RF_RegSel = 4'b0111; end
            if(IR_O[8:6] == 3'b101)begin RF_RegSel = 4'b1011; end
            if(IR_O[8:6] == 3'b110)begin RF_RegSel = 4'b1101; end
            if(IR_O[8:6] == 3'b111)begin RF_RegSel = 4'b1110; end
            RF_FunSel = 3'b000; ARF_RegSel = 3'b111;
        end

            RT=1'b1;
        end


        

        
        //DSTREG ? LSL SREG1
        if((T2 == 1'b1) && (IR_O[15:10] == 6'b000111))begin
            ALU_WF = IR_O[9];
            ARF_RegSel = 3'b111;
            if(IR_O[5] == 1'b0) begin
            
                if(IR_O[5:3] == 3'b000)begin ARF_OutCSel = 2'b00; end
                if(IR_O[5:3] == 3'b001)begin ARF_OutCSel = 2'b00; end
                if(IR_O[5:3] == 3'b010)begin ARF_OutCSel = 2'b11; end
                if(IR_O[5:3] == 3'b011)begin ARF_OutCSel = 2'b10; end
                MuxASel = 2'b01;
                RF_FunSel = 3'b010;
                RF_ScrSel = 4'b0111;
            end
            if(IR_O[5] == 1'b1) begin
            
            
                if(IR_O[5:3] == 3'b100) begin RF_OutASel = 3'b000; end
                if(IR_O[5:3] == 3'b101) begin RF_OutASel = 3'b001; end
                if(IR_O[5:3] == 3'b110) begin RF_OutASel = 3'b010; end
                if(IR_O[5:3] == 3'b111) begin RF_OutASel = 3'b011; end
                
                ALU_FunSel = 5'b10000;
                MuxASel = 2'b00;
                RF_FunSel = 3'b010;
                RF_ScrSel = 4'b0111;
                
            end

        end
        
        if((T3 == 1'b1) && (IR_O[15:10] == 6'b000111)) begin
            RF_ScrSel = 4'b1111;
            RF_OutASel = 3'b100;
            ALU_FunSel = 5'b11011;
            
            if(IR_O[8] == 1'b0) begin
                MuxBSel =  2'b00;
                ARF_FunSel = 3'b010;
                if(IR_O[8:6] == 3'b000)begin ARF_RegSel = 3'b011; end
                if(IR_O[8:6] == 3'b001)begin ARF_RegSel = 3'b011; end
                if(IR_O[8:6] == 3'b010)begin ARF_RegSel = 3'b110; end
                if(IR_O[8:6] == 3'b011)begin ARF_RegSel = 3'b101; end
            end
            
            if(IR_O[8] == 1'b1) begin
                MuxASel = 2'b00;
                RF_FunSel = 3'b010;
                if(IR_O[8:6] == 3'b100)begin RF_RegSel = 4'b0111; end
                if(IR_O[8:6] == 3'b101)begin RF_RegSel = 4'b1011; end
                if(IR_O[8:6] == 3'b110)begin RF_RegSel = 4'b1101; end
                if(IR_O[8:6] == 3'b111)begin RF_RegSel = 4'b1110; end
            end
            
            RT=1'b1;
        end
        
        //DSTREG ? LSR SREG1
        if((T2 == 1'b1) && (IR_O[15:10] == 6'b001000))begin
            ALU_WF = IR_O[9];
            ARF_RegSel = 3'b111;
            if(IR_O[5] == 1'b0) begin
            
                if(IR_O[5:3] == 3'b000)begin ARF_OutCSel = 2'b00; end
                if(IR_O[5:3] == 3'b001)begin ARF_OutCSel = 2'b00; end
                if(IR_O[5:3] == 3'b010)begin ARF_OutCSel = 2'b11; end
                if(IR_O[5:3] == 3'b011)begin ARF_OutCSel = 2'b10; end
                MuxASel = 2'b01;
                RF_FunSel = 3'b010;
                RF_ScrSel = 4'b0111;
            end
            if(IR_O[5] == 1'b1) begin
            
            
                if(IR_O[5:3] == 3'b100) begin RF_OutASel = 3'b000; end
                if(IR_O[5:3] == 3'b101) begin RF_OutASel = 3'b001; end
                if(IR_O[5:3] == 3'b110) begin RF_OutASel = 3'b010; end
                if(IR_O[5:3] == 3'b111) begin RF_OutASel = 3'b011; end
                
                ALU_FunSel = 5'b10000;
                MuxASel = 2'b00;
                RF_FunSel = 3'b010;
                RF_ScrSel = 4'b0111;
                
            end

        end
        
        if((T3 == 1'b1) && (IR_O[15:10] == 6'b001000)) begin
            RF_ScrSel = 4'b1111;
            RF_OutASel = 3'b100;
            ALU_FunSel = 5'b11100;
            
            if(IR_O[8] == 1'b0) begin
                MuxBSel =  2'b00;
                ARF_FunSel = 3'b010;
                if(IR_O[8:6] == 3'b000)begin ARF_RegSel = 3'b011; end
                if(IR_O[8:6] == 3'b001)begin ARF_RegSel = 3'b011; end
                if(IR_O[8:6] == 3'b010)begin ARF_RegSel = 3'b110; end
                if(IR_O[8:6] == 3'b011)begin ARF_RegSel = 3'b101; end
            end
            
            if(IR_O[8] == 1'b1) begin
                MuxASel = 2'b00;
                RF_FunSel = 3'b010;
                if(IR_O[8:6] == 3'b100)begin RF_RegSel = 4'b0111; end
                if(IR_O[8:6] == 3'b101)begin RF_RegSel = 4'b1011; end
                if(IR_O[8:6] == 3'b110)begin RF_RegSel = 4'b1101; end
                if(IR_O[8:6] == 3'b111)begin RF_RegSel = 4'b1110; end
            end
            
            RT=1'b1;
        end
        
        
        //DSTREG ? ASR SREG1
        if((T2 == 1'b1) && (IR_O[15:10] == 6'b001001))begin
            ALU_WF = IR_O[9];
            ARF_RegSel = 3'b111;
            if(IR_O[5] == 1'b0) begin
            
                if(IR_O[5:3] == 3'b000)begin ARF_OutCSel = 2'b00; end
                if(IR_O[5:3] == 3'b001)begin ARF_OutCSel = 2'b00; end
                if(IR_O[5:3] == 3'b010)begin ARF_OutCSel = 2'b11; end
                if(IR_O[5:3] == 3'b011)begin ARF_OutCSel = 2'b10; end
                MuxASel = 2'b01;
                RF_FunSel = 3'b010;
                RF_ScrSel = 4'b0111;
            end
            if(IR_O[5] == 1'b1) begin
            
            
                if(IR_O[5:3] == 3'b100) begin RF_OutASel = 3'b000; end
                if(IR_O[5:3] == 3'b101) begin RF_OutASel = 3'b001; end
                if(IR_O[5:3] == 3'b110) begin RF_OutASel = 3'b010; end
                if(IR_O[5:3] == 3'b111) begin RF_OutASel = 3'b011; end
                
                ALU_FunSel = 5'b10000;
                MuxASel = 2'b00;
                RF_FunSel = 3'b010;
                RF_ScrSel = 4'b0111;
                
            end

        end
        
        if((T3 == 1'b1) && (IR_O[15:10] == 6'b001001)) begin
            RF_ScrSel = 4'b1111;
            RF_OutASel = 3'b100;
            ALU_FunSel = 5'b11101;
            
            if(IR_O[8] == 1'b0) begin
                MuxBSel =  2'b00;
                ARF_FunSel = 3'b010;
                if(IR_O[8:6] == 3'b000)begin ARF_RegSel = 3'b011; end
                if(IR_O[8:6] == 3'b001)begin ARF_RegSel = 3'b011; end
                if(IR_O[8:6] == 3'b010)begin ARF_RegSel = 3'b110; end
                if(IR_O[8:6] == 3'b011)begin ARF_RegSel = 3'b101; end
            end
            
            if(IR_O[8] == 1'b1) begin
                MuxASel = 2'b00;
                RF_FunSel = 3'b010;
                if(IR_O[8:6] == 3'b100)begin RF_RegSel = 4'b0111; end
                if(IR_O[8:6] == 3'b101)begin RF_RegSel = 4'b1011; end
                if(IR_O[8:6] == 3'b110)begin RF_RegSel = 4'b1101; end
                if(IR_O[8:6] == 3'b111)begin RF_RegSel = 4'b1110; end
            end
            
            RT=1'b1;
        end
        
        
        //DSTREG ? CSL SREG1
        if((T2 == 1'b1) && (IR_O[15:10] == 6'b001010))begin
            ALU_WF = IR_O[9];
            ARF_RegSel = 3'b111;
            if(IR_O[5] == 1'b0) begin
            
                if(IR_O[5:3] == 3'b000)begin ARF_OutCSel = 2'b00; end
                if(IR_O[5:3] == 3'b001)begin ARF_OutCSel = 2'b00; end
                if(IR_O[5:3] == 3'b010)begin ARF_OutCSel = 2'b11; end
                if(IR_O[5:3] == 3'b011)begin ARF_OutCSel = 2'b10; end
                MuxASel = 2'b01;
                RF_FunSel = 3'b010;
                RF_ScrSel = 4'b0111;
            end
            if(IR_O[5] == 1'b1) begin
            
            
                if(IR_O[5:3] == 3'b100) begin RF_OutASel = 3'b000; end
                if(IR_O[5:3] == 3'b101) begin RF_OutASel = 3'b001; end
                if(IR_O[5:3] == 3'b110) begin RF_OutASel = 3'b010; end
                if(IR_O[5:3] == 3'b111) begin RF_OutASel = 3'b011; end
                
                ALU_FunSel = 5'b10000;
                MuxASel = 2'b00;
                RF_FunSel = 3'b010;
                RF_ScrSel = 4'b0111;
                
            end

        end
        
        if((T3 == 1'b1) && (IR_O[15:10] == 6'b001010)) begin
            RF_ScrSel = 4'b1111;
            RF_OutASel = 3'b100;
            ALU_FunSel = 5'b11110;
            
            if(IR_O[8] == 1'b0) begin
                MuxBSel =  2'b00;
                ARF_FunSel = 3'b010;
                if(IR_O[8:6] == 3'b000)begin ARF_RegSel = 3'b011; end
                if(IR_O[8:6] == 3'b001)begin ARF_RegSel = 3'b011; end
                if(IR_O[8:6] == 3'b010)begin ARF_RegSel = 3'b110; end
                if(IR_O[8:6] == 3'b011)begin ARF_RegSel = 3'b101; end
            end
            
            if(IR_O[8] == 1'b1) begin
                MuxASel = 2'b00;
                RF_FunSel = 3'b010;
                if(IR_O[8:6] == 3'b100)begin RF_RegSel = 4'b0111; end
                if(IR_O[8:6] == 3'b101)begin RF_RegSel = 4'b1011; end
                if(IR_O[8:6] == 3'b110)begin RF_RegSel = 4'b1101; end
                if(IR_O[8:6] == 3'b111)begin RF_RegSel = 4'b1110; end
            end
            
            RT=1'b1;
        end
        
        //DSTREG ? CSR SREG1
        if((T2 == 1'b1) && (IR_O[15:10] == 6'b001011))begin
            ALU_WF = IR_O[9];
            ARF_RegSel = 3'b111;
            if(IR_O[5] == 1'b0) begin
            
                if(IR_O[5:3] == 3'b000)begin ARF_OutCSel = 2'b00; end
                if(IR_O[5:3] == 3'b001)begin ARF_OutCSel = 2'b00; end
                if(IR_O[5:3] == 3'b010)begin ARF_OutCSel = 2'b11; end
                if(IR_O[5:3] == 3'b011)begin ARF_OutCSel = 2'b10; end
                MuxASel = 2'b01;
                RF_FunSel = 3'b010;
                RF_ScrSel = 4'b0111;
            end
            if(IR_O[5] == 1'b1) begin
            
            
                if(IR_O[5:3] == 3'b100) begin RF_OutASel = 3'b000; end
                if(IR_O[5:3] == 3'b101) begin RF_OutASel = 3'b001; end
                if(IR_O[5:3] == 3'b110) begin RF_OutASel = 3'b010; end
                if(IR_O[5:3] == 3'b111) begin RF_OutASel = 3'b011; end
                
                ALU_FunSel = 5'b10000;
                MuxASel = 2'b00;
                RF_FunSel = 3'b010;
                RF_ScrSel = 4'b0111;
                
            end

        end
        
        if((T3 == 1'b1) && (IR_O[15:10] == 6'b001011)) begin
            RF_ScrSel = 4'b1111;
            RF_OutASel = 3'b100;
            ALU_FunSel = 5'b11111;
            
            if(IR_O[8] == 1'b0) begin
                MuxBSel =  2'b00;
                ARF_FunSel = 3'b010;
                if(IR_O[8:6] == 3'b000)begin ARF_RegSel = 3'b011; end
                if(IR_O[8:6] == 3'b001)begin ARF_RegSel = 3'b011; end
                if(IR_O[8:6] == 3'b010)begin ARF_RegSel = 3'b110; end
                if(IR_O[8:6] == 3'b011)begin ARF_RegSel = 3'b101; end
            end
            
            if(IR_O[8] == 1'b1) begin
                MuxASel = 2'b00;
                RF_FunSel = 3'b010;
                if(IR_O[8:6] == 3'b100)begin RF_RegSel = 4'b0111; end
                if(IR_O[8:6] == 3'b101)begin RF_RegSel = 4'b1011; end
                if(IR_O[8:6] == 3'b110)begin RF_RegSel = 4'b1101; end
                if(IR_O[8:6] == 3'b111)begin RF_RegSel = 4'b1110; end
            end
            
            RT=1'b1;
        end
        
        
        
        //DSTREG ? SREG1 AND SREG2
        if((T2 == 1'b1) && (IR_O[15:10] == 6'b001100))begin
            ALU_WF = IR_O[9];
            ARF_RegSel = 3'b111;
            if(IR_O[5] == 1'b0) begin
            
                if(IR_O[5:3] == 3'b000)begin ARF_OutCSel = 2'b00; end
                if(IR_O[5:3] == 3'b001)begin ARF_OutCSel = 2'b00; end
                if(IR_O[5:3] == 3'b010)begin ARF_OutCSel = 2'b11; end
                if(IR_O[5:3] == 3'b011)begin ARF_OutCSel = 2'b10; end
                MuxASel = 2'b01;
                RF_FunSel = 3'b010;
                RF_ScrSel = 4'b0111;
            end
            if(IR_O[5] == 1'b1) begin
            
            
                if(IR_O[5:3] == 3'b100) begin RF_OutASel = 3'b000; end
                if(IR_O[5:3] == 3'b101) begin RF_OutASel = 3'b001; end
                if(IR_O[5:3] == 3'b110) begin RF_OutASel = 3'b010; end
                if(IR_O[5:3] == 3'b111) begin RF_OutASel = 3'b011; end
                
                ALU_FunSel = 5'b10000;
                MuxASel = 2'b00;
                RF_FunSel = 3'b010;
                RF_ScrSel = 4'b0111;
                
            end

        end

        if((T3 == 1'b1) && (IR_O[15:10] == 6'b001100))begin
            ALU_WF = IR_O[9];
            if(IR_O[2] == 1'b0) begin
            
                if(IR_O[2:0] == 3'b000)begin ARF_OutCSel = 2'b00; end
                if(IR_O[2:0] == 3'b001)begin ARF_OutCSel = 2'b00; end
                if(IR_O[2:0] == 3'b010)begin ARF_OutCSel = 2'b11; end
                if(IR_O[2:0] == 3'b011)begin ARF_OutCSel = 2'b10; end
                MuxASel = 2'b01;
                RF_FunSel = 3'b010;
                RF_ScrSel = 4'b1011;
            end
            if(IR_O[2] == 1'b1) begin
            
            
                if(IR_O[2:0] == 3'b100) begin RF_OutASel = 3'b000; end
                if(IR_O[2:0] == 3'b101) begin RF_OutASel = 3'b001; end
                if(IR_O[2:0] == 3'b110) begin RF_OutASel = 3'b010; end
                if(IR_O[2:0] == 3'b111) begin RF_OutASel = 3'b011; end
                
                ALU_FunSel = 5'b10000;
                MuxASel = 2'b00;
                RF_FunSel = 3'b010;
                RF_ScrSel = 4'b1011;
                
            end

        end
        
        if((T4 == 1'b1) && (IR_O[15:10] == 6'b001100)) begin
            RF_ScrSel = 4'b1111;
            RF_OutASel = 3'b100;
            RF_OutBSel = 3'b101;
            ALU_FunSel = 5'b10111;
            
            if(IR_O[8] == 1'b0) begin
                MuxBSel =  2'b00;
                ARF_FunSel = 3'b010;
                if(IR_O[8:6] == 3'b000)begin ARF_RegSel = 3'b011; end
                if(IR_O[8:6] == 3'b001)begin ARF_RegSel = 3'b011; end
                if(IR_O[8:6] == 3'b010)begin ARF_RegSel = 3'b110; end
                if(IR_O[8:6] == 3'b011)begin ARF_RegSel = 3'b101; end
            end
            
            if(IR_O[8] == 1'b1) begin
                MuxASel = 2'b00;
                RF_FunSel = 3'b010;
                if(IR_O[8:6] == 3'b100)begin RF_RegSel = 4'b0111; end
                if(IR_O[8:6] == 3'b101)begin RF_RegSel = 4'b1011; end
                if(IR_O[8:6] == 3'b110)begin RF_RegSel = 4'b1101; end
                if(IR_O[8:6] == 3'b111)begin RF_RegSel = 4'b1110; end
            end
            
            RT=1'b1;
         end
         
         //DSTREG ? SREG1 OR SREG2
        if((T2 == 1'b1) && (IR_O[15:10] == 6'b001101))begin
             ALU_WF = IR_O[9];
             ARF_RegSel = 3'b111;
             if(IR_O[5] == 1'b0) begin
             
                 if(IR_O[5:3] == 3'b000)begin ARF_OutCSel = 2'b00; end
                 if(IR_O[5:3] == 3'b001)begin ARF_OutCSel = 2'b00; end
                 if(IR_O[5:3] == 3'b010)begin ARF_OutCSel = 2'b11; end
                 if(IR_O[5:3] == 3'b011)begin ARF_OutCSel = 2'b10; end
                 MuxASel = 2'b01;
                 RF_FunSel = 3'b010;
                 RF_ScrSel = 4'b0111;
             end
             if(IR_O[5] == 1'b1) begin
             
             
                 if(IR_O[5:3] == 3'b100) begin RF_OutASel = 3'b000; end
                 if(IR_O[5:3] == 3'b101) begin RF_OutASel = 3'b001; end
                 if(IR_O[5:3] == 3'b110) begin RF_OutASel = 3'b010; end
                 if(IR_O[5:3] == 3'b111) begin RF_OutASel = 3'b011; end
                 
                 ALU_FunSel = 5'b10000;
                 MuxASel = 2'b00;
                 RF_FunSel = 3'b010;
                 RF_ScrSel = 4'b0111;
                 
             end
 
         end
 
         if((T3 == 1'b1) && (IR_O[15:10] == 6'b001101))begin
             ALU_WF = IR_O[9];
             if(IR_O[2] == 1'b0) begin
             
                 if(IR_O[2:0] == 3'b000)begin ARF_OutCSel = 2'b00; end
                 if(IR_O[2:0] == 3'b001)begin ARF_OutCSel = 2'b00; end
                 if(IR_O[2:0] == 3'b010)begin ARF_OutCSel = 2'b11; end
                 if(IR_O[2:0] == 3'b011)begin ARF_OutCSel = 2'b10; end
                 MuxASel = 2'b01;
                 RF_FunSel = 3'b010;
                 RF_ScrSel = 4'b1011;
             end
             if(IR_O[2] == 1'b1) begin
             
             
                 if(IR_O[2:0] == 3'b100) begin RF_OutASel = 3'b000; end
                 if(IR_O[2:0] == 3'b101) begin RF_OutASel = 3'b001; end
                 if(IR_O[2:0] == 3'b110) begin RF_OutASel = 3'b010; end
                 if(IR_O[2:0] == 3'b111) begin RF_OutASel = 3'b011; end
                 
                 ALU_FunSel = 5'b10000;
                 MuxASel = 2'b00;
                 RF_FunSel = 3'b010;
                 RF_ScrSel = 4'b1011;
                 
             end
 
         end
         
         if((T4 == 1'b1) && (IR_O[15:10] == 6'b001101)) begin
             RF_ScrSel = 4'b1111;
             RF_OutASel = 3'b100;
             RF_OutBSel = 3'b101;
             ALU_FunSel = 5'b11000;
             
             if(IR_O[8] == 1'b0) begin
                 MuxBSel =  2'b00;
                 ARF_FunSel = 3'b010;
                 if(IR_O[8:6] == 3'b000)begin ARF_RegSel = 3'b011; end
                 if(IR_O[8:6] == 3'b001)begin ARF_RegSel = 3'b011; end
                 if(IR_O[8:6] == 3'b010)begin ARF_RegSel = 3'b110; end
                 if(IR_O[8:6] == 3'b011)begin ARF_RegSel = 3'b101; end
             end
             
             if(IR_O[8] == 1'b1) begin
                 MuxASel = 2'b00;
                 RF_FunSel = 3'b010;
                 if(IR_O[8:6] == 3'b100)begin RF_RegSel = 4'b0111; end
                 if(IR_O[8:6] == 3'b101)begin RF_RegSel = 4'b1011; end
                 if(IR_O[8:6] == 3'b110)begin RF_RegSel = 4'b1101; end
                 if(IR_O[8:6] == 3'b111)begin RF_RegSel = 4'b1110; end
             end
             
             RT=1'b1;
          end
          
          //DSTREG ? NOT SREG1
          if((T2 == 1'b1) && (IR_O[15:10] == 6'b001110))begin
              ALU_WF = IR_O[9];
              ARF_RegSel = 3'b111;
              if(IR_O[5] == 1'b0) begin
              
                  if(IR_O[5:3] == 3'b000)begin ARF_OutCSel = 2'b00; end
                  if(IR_O[5:3] == 3'b001)begin ARF_OutCSel = 2'b00; end
                  if(IR_O[5:3] == 3'b010)begin ARF_OutCSel = 2'b11; end
                  if(IR_O[5:3] == 3'b011)begin ARF_OutCSel = 2'b10; end
                  MuxASel = 2'b01;
                  RF_FunSel = 3'b010;
                  RF_ScrSel = 4'b0111;
              end
              if(IR_O[5] == 1'b1) begin
              
              
                  if(IR_O[5:3] == 3'b100) begin RF_OutASel = 3'b000; end
                  if(IR_O[5:3] == 3'b101) begin RF_OutASel = 3'b001; end
                  if(IR_O[5:3] == 3'b110) begin RF_OutASel = 3'b010; end
                  if(IR_O[5:3] == 3'b111) begin RF_OutASel = 3'b011; end
                  
                  ALU_FunSel = 5'b10000;
                  MuxASel = 2'b00;
                  RF_FunSel = 3'b010;
                  RF_ScrSel = 4'b0111;
                  
              end
  
          end
          
          if((T3 == 1'b1) && (IR_O[15:10] == 6'b001110)) begin
              RF_ScrSel = 4'b1111;
              RF_OutASel = 3'b100;
              ALU_FunSel = 5'b10010;
              
              if(IR_O[8] == 1'b0) begin
                  MuxBSel =  2'b00;
                  ARF_FunSel = 3'b010;
                  if(IR_O[8:6] == 3'b000)begin ARF_RegSel = 3'b011; end
                  if(IR_O[8:6] == 3'b001)begin ARF_RegSel = 3'b011; end
                  if(IR_O[8:6] == 3'b010)begin ARF_RegSel = 3'b110; end
                  if(IR_O[8:6] == 3'b011)begin ARF_RegSel = 3'b101; end
              end
              
              if(IR_O[8] == 1'b1) begin
                  MuxASel = 2'b00;
                  RF_FunSel = 3'b010;
                  if(IR_O[8:6] == 3'b100)begin RF_RegSel = 4'b0111; end
                  if(IR_O[8:6] == 3'b101)begin RF_RegSel = 4'b1011; end
                  if(IR_O[8:6] == 3'b110)begin RF_RegSel = 4'b1101; end
                  if(IR_O[8:6] == 3'b111)begin RF_RegSel = 4'b1110; end
              end
              
              RT=1'b1;
          end
          
          

        //DSTREG ? SREG1 XOR SREG2
        if((T2 == 1'b1) && (IR_O[15:10] == 6'b001111))begin
             ALU_WF = IR_O[9];
             ARF_RegSel = 3'b111;
             if(IR_O[5] == 1'b0) begin
             
                 if(IR_O[5:3] == 3'b000)begin ARF_OutCSel = 2'b00; end
                 if(IR_O[5:3] == 3'b001)begin ARF_OutCSel = 2'b00; end
                 if(IR_O[5:3] == 3'b010)begin ARF_OutCSel = 2'b11; end
                 if(IR_O[5:3] == 3'b011)begin ARF_OutCSel = 2'b10; end
                 MuxASel = 2'b01;
                 RF_FunSel = 3'b010;
                 RF_ScrSel = 4'b0111;
             end
             if(IR_O[5] == 1'b1) begin
             
             
                 if(IR_O[5:3] == 3'b100) begin RF_OutASel = 3'b000; end
                 if(IR_O[5:3] == 3'b101) begin RF_OutASel = 3'b001; end
                 if(IR_O[5:3] == 3'b110) begin RF_OutASel = 3'b010; end
                 if(IR_O[5:3] == 3'b111) begin RF_OutASel = 3'b011; end
                 
                 ALU_FunSel = 5'b10000;
                 MuxASel = 2'b00;
                 RF_FunSel = 3'b010;
                 RF_ScrSel = 4'b0111;
                 
             end
 
         end
 
         if((T3 == 1'b1) && (IR_O[15:10] == 6'b001111))begin
             ALU_WF = IR_O[9];
             if(IR_O[2] == 1'b0) begin
             
                 if(IR_O[2:0] == 3'b000)begin ARF_OutCSel = 2'b00; end
                 if(IR_O[2:0] == 3'b001)begin ARF_OutCSel = 2'b00; end
                 if(IR_O[2:0] == 3'b010)begin ARF_OutCSel = 2'b11; end
                 if(IR_O[2:0] == 3'b011)begin ARF_OutCSel = 2'b10; end
                 MuxASel = 2'b01;
                 RF_FunSel = 3'b010;
                 RF_ScrSel = 4'b1011;
             end
             if(IR_O[2] == 1'b1) begin
             
             
                 if(IR_O[2:0] == 3'b100) begin RF_OutASel = 3'b000; end
                 if(IR_O[2:0] == 3'b101) begin RF_OutASel = 3'b001; end
                 if(IR_O[2:0] == 3'b110) begin RF_OutASel = 3'b010; end
                 if(IR_O[2:0] == 3'b111) begin RF_OutASel = 3'b011; end
                 
                 ALU_FunSel = 5'b10000;
                 MuxASel = 2'b00;
                 RF_FunSel = 3'b010;
                 RF_ScrSel = 4'b1011;
                 
             end
 
         end
         
         if((T4 == 1'b1) && (IR_O[15:10] == 6'b001111)) begin
             RF_ScrSel = 4'b1111;
             RF_OutASel = 3'b100;
             RF_OutBSel = 3'b101;
             ALU_FunSel = 5'b11001;
             
             if(IR_O[8] == 1'b0) begin
                 MuxBSel =  2'b00;
                 ARF_FunSel = 3'b010;
                 if(IR_O[8:6] == 3'b000)begin ARF_RegSel = 3'b011; end
                 if(IR_O[8:6] == 3'b001)begin ARF_RegSel = 3'b011; end
                 if(IR_O[8:6] == 3'b010)begin ARF_RegSel = 3'b110; end
                 if(IR_O[8:6] == 3'b011)begin ARF_RegSel = 3'b101; end
             end
             
             if(IR_O[8] == 1'b1) begin
                 MuxASel = 2'b00;
                 RF_FunSel = 3'b010;
                 if(IR_O[8:6] == 3'b100)begin RF_RegSel = 4'b0111; end
                 if(IR_O[8:6] == 3'b101)begin RF_RegSel = 4'b1011; end
                 if(IR_O[8:6] == 3'b110)begin RF_RegSel = 4'b1101; end
                 if(IR_O[8:6] == 3'b111)begin RF_RegSel = 4'b1110; end
             end
             
             RT=1'b1;
          end
        
         //DSTREG ? SREG1 NAND SREG2
        if((T2 == 1'b1) && (IR_O[15:10] == 6'b010000))begin
              ALU_WF = IR_O[9];
              ARF_RegSel = 3'b111;
              if(IR_O[5] == 1'b0) begin
              
                  if(IR_O[5:3] == 3'b000)begin ARF_OutCSel = 2'b00; end
                  if(IR_O[5:3] == 3'b001)begin ARF_OutCSel = 2'b00; end
                  if(IR_O[5:3] == 3'b010)begin ARF_OutCSel = 2'b11; end
                  if(IR_O[5:3] == 3'b011)begin ARF_OutCSel = 2'b10; end
                  MuxASel = 2'b01;
                  RF_FunSel = 3'b010;
                  RF_ScrSel = 4'b0111;
              end
              if(IR_O[5] == 1'b1) begin
              
              
                  if(IR_O[5:3] == 3'b100) begin RF_OutASel = 3'b000; end
                  if(IR_O[5:3] == 3'b101) begin RF_OutASel = 3'b001; end
                  if(IR_O[5:3] == 3'b110) begin RF_OutASel = 3'b010; end
                  if(IR_O[5:3] == 3'b111) begin RF_OutASel = 3'b011; end
                  
                  ALU_FunSel = 5'b10000;
                  MuxASel = 2'b00;
                  RF_FunSel = 3'b010;
                  RF_ScrSel = 4'b0111;
                  
              end
  
          end
  
          if((T3 == 1'b1) && (IR_O[15:10] == 6'b010000))begin
              ALU_WF = IR_O[9];
              if(IR_O[2] == 1'b0) begin
              
                  if(IR_O[2:0] == 3'b000)begin ARF_OutCSel = 2'b00; end
                  if(IR_O[2:0] == 3'b001)begin ARF_OutCSel = 2'b00; end
                  if(IR_O[2:0] == 3'b010)begin ARF_OutCSel = 2'b11; end
                  if(IR_O[2:0] == 3'b011)begin ARF_OutCSel = 2'b10; end
                  MuxASel = 2'b01;
                  RF_FunSel = 3'b010;
                  RF_ScrSel = 4'b1011;
              end
              if(IR_O[2] == 1'b1) begin
              
              
                  if(IR_O[2:0] == 3'b100) begin RF_OutASel = 3'b000; end
                  if(IR_O[2:0] == 3'b101) begin RF_OutASel = 3'b001; end
                  if(IR_O[2:0] == 3'b110) begin RF_OutASel = 3'b010; end
                  if(IR_O[2:0] == 3'b111) begin RF_OutASel = 3'b011; end
                  
                  ALU_FunSel = 5'b10000;
                  MuxASel = 2'b00;
                  RF_FunSel = 3'b010;
                  RF_ScrSel = 4'b1011;
                  
              end
  
          end
          
          if((T4 == 1'b1) && (IR_O[15:10] == 6'b010000)) begin
              RF_ScrSel = 4'b1111;
              RF_OutASel = 3'b100;
              RF_OutBSel = 3'b101;
              ALU_FunSel = 5'b11010;
              
              if(IR_O[8] == 1'b0) begin
                  MuxBSel =  2'b00;
                  ARF_FunSel = 3'b010;
                  if(IR_O[8:6] == 3'b000)begin ARF_RegSel = 3'b011; end
                  if(IR_O[8:6] == 3'b001)begin ARF_RegSel = 3'b011; end
                  if(IR_O[8:6] == 3'b010)begin ARF_RegSel = 3'b110; end
                  if(IR_O[8:6] == 3'b011)begin ARF_RegSel = 3'b101; end
              end
              
              if(IR_O[8] == 1'b1) begin
                  MuxASel = 2'b00;
                  RF_FunSel = 3'b010;
                  if(IR_O[8:6] == 3'b100)begin RF_RegSel = 4'b0111; end
                  if(IR_O[8:6] == 3'b101)begin RF_RegSel = 4'b1011; end
                  if(IR_O[8:6] == 3'b110)begin RF_RegSel = 4'b1101; end
                  if(IR_O[8:6] == 3'b111)begin RF_RegSel = 4'b1110; end
              end
              
              RT=1'b1;
           end
           
           //DSTREG[15:8] ? IMMEDIATE (8-bit)
            if((T2 == 1'b1) && (IR_O[15:10] == 6'b010001))begin 
            if(IR_O[8]== 1'b1)begin 
                ARF_RegSel = 3'b111;
                MuxASel= 2'b11;
                RF_FunSel = 3'b110;
                if(IR_O[8:6] == 3'b100) begin RF_RegSel = 4'b0111; end
                if(IR_O[8:6] == 3'b101) begin RF_RegSel = 4'b1011; end
                if(IR_O[8:6] == 3'b110) begin RF_RegSel = 4'b1101; end
                if(IR_O[8:6] == 3'b111) begin RF_RegSel = 4'b0111; end
            end
            if(IR_O[8]== 1'b0)begin
                MuxBSel = 2'b11;
                ARF_FunSel = 3'b110;
                if(IR_O[8:6] == 3'b000) begin ARF_RegSel = 3'b011; end
                if(IR_O[8:6] == 3'b001) begin ARF_RegSel = 3'b011; end
                if(IR_O[8:6] == 3'b010) begin ARF_RegSel = 3'b110; end
                if(IR_O[8:6] == 3'b011) begin ARF_RegSel = 3'b101; end
            end
                   RT=1'b1;
            end
           
           
            //Rx ? M[AR] (AR is 16-bit register)
            if((T2 == 1'b1) && (IR_O[15:10] == 6'b010010)) begin
                ARF_RegSel = 3'b111;
                ARF_OutDSel = 2'b10;
                MuxASel = 2'b10;
                RF_FunSel = 3'b010;
                if(IR_O[9:8] == 2'b00) begin RF_RegSel = 4'b0111; end
                if(IR_O[9:8] == 2'b01) begin RF_RegSel = 4'b1011; end
                if(IR_O[9:8] == 2'b10) begin RF_RegSel = 4'b1101; end
                if(IR_O[9:8] == 2'b11) begin RF_RegSel = 4'b1110; end
                RT=1'b1;
            end
            
            
            //M[AR] ? Rx (AR is 16-bit register)
            if((T2 == 1'b1) && (IR_O[15:10] == 6'b010011))begin
                ARF_RegSel = 3'b111;
                ALU_FunSel = 5'b10000;
                MuxCSel = 1'b0;
                Mem_WR = 1'b1;
                ARF_OutDSel = 2'b10;
                if(IR_O[9:8] == 2'b00) begin RF_OutASel = 3'b000; end
                if(IR_O[9:8] == 2'b01) begin RF_OutASel = 3'b001; end
                if(IR_O[9:8] == 2'b10) begin RF_OutASel = 3'b010; end
                if(IR_O[9:8] == 2'b11) begin RF_OutASel = 3'b011; end
                RT=1'b1;
             
            end
            
            //DSTREG[7:0] ? IMMEDIATE (8-bit)
            if((T2 == 1'b1) && (IR_O[15:10] == 6'b010100))begin 
            if(IR_O[8]== 1'b1)begin 
                    ARF_RegSel = 3'b111;
                    MuxASel= 2'b11;
                    RF_FunSel = 3'b101;
                    if(IR_O[8:6] == 3'b100) begin RF_RegSel = 4'b0111; end
                    if(IR_O[8:6] == 3'b101) begin RF_RegSel = 4'b1011; end
                    if(IR_O[8:6] == 3'b110) begin RF_RegSel = 4'b1101; end
                    if(IR_O[8:6] == 3'b111) begin RF_RegSel = 4'b0111; end
            end
            if(IR_O[8]== 1'b0)begin
                    MuxBSel = 2'b11;
                    ARF_FunSel = 3'b101;
                    if(IR_O[8:6] == 3'b000) begin ARF_RegSel = 3'b011; end
                    if(IR_O[8:6] == 3'b001) begin ARF_RegSel = 3'b011; end
                    if(IR_O[8:6] == 3'b010) begin ARF_RegSel = 3'b110; end
                    if(IR_O[8:6] == 3'b011) begin ARF_RegSel = 3'b101; end
             end
             RT=1'b1;
             end
             
             //DSTREG ? SREG1 + SREG2
                if((T2 == 1'b1) && (IR_O[15:10] == 6'b010101))begin
                            ARF_RegSel = 3'b111;
                           ALU_WF = IR_O[9];
                           if(IR_O[5] == 1'b0) begin
                           
                               if(IR_O[5:3] == 3'b000)begin ARF_OutCSel = 2'b00; end
                               if(IR_O[5:3] == 3'b001)begin ARF_OutCSel = 2'b00; end
                               if(IR_O[5:3] == 3'b010)begin ARF_OutCSel = 2'b11; end
                               if(IR_O[5:3] == 3'b011)begin ARF_OutCSel = 2'b10; end
                               MuxASel = 2'b01;
                               RF_FunSel = 3'b010;
                               RF_ScrSel = 4'b0111;
                           end
                           if(IR_O[5] == 1'b1) begin
                           
                           
                               if(IR_O[5:3] == 3'b100) begin RF_OutASel = 3'b000; end
                               if(IR_O[5:3] == 3'b101) begin RF_OutASel = 3'b001; end
                               if(IR_O[5:3] == 3'b110) begin RF_OutASel = 3'b010; end
                               if(IR_O[5:3] == 3'b111) begin RF_OutASel = 3'b011; end
                               
                               ALU_FunSel = 5'b10000;
                               MuxASel = 2'b00;
                               RF_FunSel = 3'b010;
                               RF_ScrSel = 4'b0111;
                               
                           end
               
                       end
               
                       if((T3 == 1'b1) && (IR_O[15:10] == 6'b010101))begin
                           ALU_WF = IR_O[9];
                           if(IR_O[2] == 1'b0) begin
                           
                               if(IR_O[2:0] == 3'b000)begin ARF_OutCSel = 2'b00; end
                               if(IR_O[2:0] == 3'b001)begin ARF_OutCSel = 2'b00; end
                               if(IR_O[2:0] == 3'b010)begin ARF_OutCSel = 2'b11; end
                               if(IR_O[2:0] == 3'b011)begin ARF_OutCSel = 2'b10; end
                               MuxASel = 2'b01;
                               RF_FunSel = 3'b010;
                               RF_ScrSel = 4'b1011;
                           end
                           if(IR_O[2] == 1'b1) begin
                           
                           
                               if(IR_O[2:0] == 3'b100) begin RF_OutASel = 3'b000; end
                               if(IR_O[2:0] == 3'b101) begin RF_OutASel = 3'b001; end
                               if(IR_O[2:0] == 3'b110) begin RF_OutASel = 3'b010; end
                               if(IR_O[2:0] == 3'b111) begin RF_OutASel = 3'b011; end
                               
                               ALU_FunSel = 5'b10000;
                               MuxASel = 2'b00;
                               RF_FunSel = 3'b010;
                               RF_ScrSel = 4'b1011;
                               
                           end
               
                       end
                       
                       if((T4 == 1'b1) && (IR_O[15:10] == 6'b010101)) begin
                           RF_ScrSel = 4'b1111;
                           RF_OutASel = 3'b100;
                           RF_OutBSel = 3'b101;
                           ALU_FunSel = 5'b10100;
                           
                           if(IR_O[8] == 1'b0) begin
                               MuxBSel =  2'b00;
                               ARF_FunSel = 3'b010;
                               if(IR_O[8:6] == 3'b000)begin ARF_RegSel = 3'b011; end
                               if(IR_O[8:6] == 3'b001)begin ARF_RegSel = 3'b011; end
                               if(IR_O[8:6] == 3'b010)begin ARF_RegSel = 3'b110; end
                               if(IR_O[8:6] == 3'b011)begin ARF_RegSel = 3'b101; end
                           end
                           
                           if(IR_O[8] == 1'b1) begin
                               MuxASel = 2'b00;
                               RF_FunSel = 3'b010;
                               if(IR_O[8:6] == 3'b100)begin RF_RegSel = 4'b0111; end
                               if(IR_O[8:6] == 3'b101)begin RF_RegSel = 4'b1011; end
                               if(IR_O[8:6] == 3'b110)begin RF_RegSel = 4'b1101; end
                               if(IR_O[8:6] == 3'b111)begin RF_RegSel = 4'b1110; end
                           end
                           
                           RT=1'b1;
                        end
     
     
                //DSTREG ? SREG1 + SREG2 + CARRY
                if((T2 == 1'b1) && (IR_O[15:10] == 6'b010110))begin
                           ALU_WF = IR_O[9];
                           ARF_RegSel = 3'b111;
                           if(IR_O[5] == 1'b0) begin
                           
                               if(IR_O[5:3] == 3'b000)begin ARF_OutCSel = 2'b00; end
                               if(IR_O[5:3] == 3'b001)begin ARF_OutCSel = 2'b00; end
                               if(IR_O[5:3] == 3'b010)begin ARF_OutCSel = 2'b11; end
                               if(IR_O[5:3] == 3'b011)begin ARF_OutCSel = 2'b10; end
                               MuxASel = 2'b01;
                               RF_FunSel = 3'b010;
                               RF_ScrSel = 4'b0111;
                           end
                           if(IR_O[5] == 1'b1) begin
                           
                           
                               if(IR_O[5:3] == 3'b100) begin RF_OutASel = 3'b000; end
                               if(IR_O[5:3] == 3'b101) begin RF_OutASel = 3'b001; end
                               if(IR_O[5:3] == 3'b110) begin RF_OutASel = 3'b010; end
                               if(IR_O[5:3] == 3'b111) begin RF_OutASel = 3'b011; end
                               
                               ALU_FunSel = 5'b10000;
                               MuxASel = 2'b00;
                               RF_FunSel = 3'b010;
                               RF_ScrSel = 4'b0111;
                               
                           end
               
                       end
               
                       if((T3 == 1'b1) && (IR_O[15:10] == 6'b010110))begin
                           ALU_WF = IR_O[9];
                           if(IR_O[2] == 1'b0) begin
                           
                               if(IR_O[2:0] == 3'b000)begin ARF_OutCSel = 2'b00; end
                               if(IR_O[2:0] == 3'b001)begin ARF_OutCSel = 2'b00; end
                               if(IR_O[2:0] == 3'b010)begin ARF_OutCSel = 2'b11; end
                               if(IR_O[2:0] == 3'b011)begin ARF_OutCSel = 2'b10; end
                               MuxASel = 2'b01;
                               RF_FunSel = 3'b010;
                               RF_ScrSel = 4'b1011;
                           end
                           if(IR_O[2] == 1'b1) begin
                           
                           
                               if(IR_O[2:0] == 3'b100) begin RF_OutASel = 3'b000; end
                               if(IR_O[2:0] == 3'b101) begin RF_OutASel = 3'b001; end
                               if(IR_O[2:0] == 3'b110) begin RF_OutASel = 3'b010; end
                               if(IR_O[2:0] == 3'b111) begin RF_OutASel = 3'b011; end
                               
                               ALU_FunSel = 5'b10000;
                               MuxASel = 2'b00;
                               RF_FunSel = 3'b010;
                               RF_ScrSel = 4'b1011;
                               
                           end
               
                       end
                       
                       if((T4 == 1'b1) && (IR_O[15:10] == 6'b010110)) begin
                           RF_ScrSel = 4'b1111;
                           RF_OutASel = 3'b100;
                           RF_OutBSel = 3'b101;
                           ALU_FunSel = 5'b10101;
                           
                           if(IR_O[8] == 1'b0) begin
                               MuxBSel =  2'b00;
                               ARF_FunSel = 3'b010;
                               if(IR_O[8:6] == 3'b000)begin ARF_RegSel = 3'b011; end
                               if(IR_O[8:6] == 3'b001)begin ARF_RegSel = 3'b011; end
                               if(IR_O[8:6] == 3'b010)begin ARF_RegSel = 3'b110; end
                               if(IR_O[8:6] == 3'b011)begin ARF_RegSel = 3'b101; end
                           end
                           
                           if(IR_O[8] == 1'b1) begin
                               MuxASel = 2'b00;
                               RF_FunSel = 3'b010;
                               if(IR_O[8:6] == 3'b100)begin RF_RegSel = 4'b0111; end
                               if(IR_O[8:6] == 3'b101)begin RF_RegSel = 4'b1011; end
                               if(IR_O[8:6] == 3'b110)begin RF_RegSel = 4'b1101; end
                               if(IR_O[8:6] == 3'b111)begin RF_RegSel = 4'b1110; end
                           end
                           
                           RT=1'b1;
                        end
     


            //DSTREG ? SREG1 - SREG2
                                      if((T2 == 1'b1) && (IR_O[15:10] == 6'b010111))begin
                                       ALU_WF = IR_O[9];
                                       ARF_RegSel = 3'b111;
                                       if(IR_O[5] == 1'b0) begin
                                       
                                           if(IR_O[5:3] == 3'b000)begin ARF_OutCSel = 2'b00; end
                                           if(IR_O[5:3] == 3'b001)begin ARF_OutCSel = 2'b00; end
                                           if(IR_O[5:3] == 3'b010)begin ARF_OutCSel = 2'b11; end
                                           if(IR_O[5:3] == 3'b011)begin ARF_OutCSel = 2'b10; end
                                           MuxASel = 2'b01;
                                           RF_FunSel = 3'b010;
                                           RF_ScrSel = 4'b0111;
                                       end
                                       if(IR_O[5] == 1'b1) begin
                                       
                                       
                                           if(IR_O[5:3] == 3'b100) begin RF_OutASel = 3'b000; end
                                           if(IR_O[5:3] == 3'b101) begin RF_OutASel = 3'b001; end
                                           if(IR_O[5:3] == 3'b110) begin RF_OutASel = 3'b010; end
                                           if(IR_O[5:3] == 3'b111) begin RF_OutASel = 3'b011; end
                                           
                                           ALU_FunSel = 5'b10000;
                                           MuxASel = 2'b00;
                                           RF_FunSel = 3'b010;
                                           RF_ScrSel = 4'b0111;
                                           
                                       end
                           
                                   end
                           
                                   if((T3 == 1'b1) && (IR_O[15:10] == 6'b010111))begin
                                       ALU_WF = IR_O[9];
                                       if(IR_O[2] == 1'b0) begin
                                       
                                           if(IR_O[2:0] == 3'b000)begin ARF_OutCSel = 2'b00; end
                                           if(IR_O[2:0] == 3'b001)begin ARF_OutCSel = 2'b00; end
                                           if(IR_O[2:0] == 3'b010)begin ARF_OutCSel = 2'b11; end
                                           if(IR_O[2:0] == 3'b011)begin ARF_OutCSel = 2'b10; end
                                           MuxASel = 2'b01;
                                           RF_FunSel = 3'b010;
                                           RF_ScrSel = 4'b1011;
                                       end
                                       if(IR_O[2] == 1'b1) begin
                                       
                                       
                                           if(IR_O[2:0] == 3'b100) begin RF_OutASel = 3'b000; end
                                           if(IR_O[2:0] == 3'b101) begin RF_OutASel = 3'b001; end
                                           if(IR_O[2:0] == 3'b110) begin RF_OutASel = 3'b010; end
                                           if(IR_O[2:0] == 3'b111) begin RF_OutASel = 3'b011; end
                                           
                                           ALU_FunSel = 5'b10000;
                                           MuxASel = 2'b00;
                                           RF_FunSel = 3'b010;
                                           RF_ScrSel = 4'b1011;
                                           
                                       end
                           
                                   end
                                   
                                   if((T4 == 1'b1) && (IR_O[15:10] == 6'b010111)) begin
                                       RF_ScrSel = 4'b1111;
                                       RF_OutASel = 3'b100;
                                       RF_OutBSel = 3'b101;
                                       ALU_FunSel = 5'b10110;
                                       
                                       if(IR_O[8] == 1'b0) begin
                                           MuxBSel =  2'b00;
                                           ARF_FunSel = 3'b010;
                                           if(IR_O[8:6] == 3'b000)begin ARF_RegSel = 3'b011; end
                                           if(IR_O[8:6] == 3'b001)begin ARF_RegSel = 3'b011; end
                                           if(IR_O[8:6] == 3'b010)begin ARF_RegSel = 3'b110; end
                                           if(IR_O[8:6] == 3'b011)begin ARF_RegSel = 3'b101; end
                                       end
                                       
                                       if(IR_O[8] == 1'b1) begin
                                           MuxASel = 2'b00;
                                           RF_FunSel = 3'b010;
                                           if(IR_O[8:6] == 3'b100)begin RF_RegSel = 4'b0111; end
                                           if(IR_O[8:6] == 3'b101)begin RF_RegSel = 4'b1011; end
                                           if(IR_O[8:6] == 3'b110)begin RF_RegSel = 4'b1101; end
                                           if(IR_O[8:6] == 3'b111)begin RF_RegSel = 4'b1110; end
                                       end
                                       
                                       RT=1'b1;
                                    end       
                
                
                
                //DSTREG ? SREG1, Flags will change
                            if((T2 == 1'b1) && (IR_O[15:10] == 6'b011000))begin
                            ALU_WF = IR_O[9];
                            ARF_RegSel = 3'b111;
                
                            
                            
                            if(IR_O[5] == 1) begin 
                                if(IR_O[8] == 1) begin MuxASel = 2'b00; ALU_FunSel = 5'b10000;
                                    if(IR_O[5:3] == 3'b100) begin RF_OutASel = 3'b000; end
                                    if(IR_O[5:3] == 3'b101) begin RF_OutASel = 3'b001; end
                                    if(IR_O[5:3] == 3'b110) begin RF_OutASel = 3'b010; end
                                    if(IR_O[5:3] == 3'b111) begin RF_OutASel = 3'b011; end
                                    if(IR_O[8:6] == 3'b100) begin RF_RegSel = 4'b0111; end
                                    if(IR_O[8:6] == 3'b101) begin RF_RegSel = 4'b1011; end
                                    if(IR_O[8:6] == 3'b110) begin RF_RegSel = 4'b1101; end
                                    if(IR_O[8:6] == 3'b111) begin RF_RegSel = 4'b1110; end
                                    RF_FunSel = 3'b010; ARF_RegSel = 3'b111;
                                end
                                if(IR_O[8] == 0) begin MuxBSel = 2'b00; ALU_FunSel = 5'b10000;
                                    if(IR_O[5:3] == 3'b100) begin RF_OutASel = 3'b000; end
                                    if(IR_O[5:3] == 3'b101) begin RF_OutASel = 3'b001; end
                                    if(IR_O[5:3] == 3'b110) begin RF_OutASel = 3'b010; end
                                    if(IR_O[5:3] == 3'b111) begin RF_OutASel = 3'b011; end
                                    if(IR_O[8:6] == 3'b000) begin ARF_RegSel = 3'b011; end
                                    if(IR_O[8:6] == 3'b001) begin ARF_RegSel = 3'b011; end
                                    if(IR_O[8:6] == 3'b010) begin ARF_RegSel = 3'b110; end
                                    if(IR_O[8:6] == 3'b011) begin ARF_RegSel = 3'b101; end
                                    ARF_FunSel = 3'b010; RF_RegSel =4'b1111;
                                end
                            end
                            if(IR_O[5] == 0) begin 
                                if(IR_O[8] == 0) begin MuxBSel = 2'b01;
                                    if(IR_O[5:3] == 3'b000) begin ARF_OutCSel = 2'b00; end
                                    if(IR_O[5:3] == 3'b001) begin ARF_OutCSel = 2'b00; end
                                    if(IR_O[5:3] == 3'b010) begin ARF_OutCSel = 2'b11; end
                                    if(IR_O[5:3] == 3'b011) begin ARF_OutCSel = 2'b10; end
                                    if(IR_O[8:6] == 3'b000) begin ARF_RegSel = 3'b011; end
                                    if(IR_O[8:6] == 3'b001) begin ARF_RegSel = 3'b011; end
                                    if(IR_O[8:6] == 3'b010) begin ARF_RegSel = 3'b110; end
                                    if(IR_O[8:6] == 3'b011) begin ARF_RegSel = 3'b101; end
                                    ARF_FunSel = 3'b010;  RF_RegSel =4'b1111;  
                                
                                end
                                
                                if(IR_O[8] == 1) begin MuxBSel = 2'b01;
                                    if(IR_O[5:3] == 3'b000) begin ARF_OutCSel = 2'b00; end
                                    if(IR_O[5:3] == 3'b001) begin ARF_OutCSel = 2'b00; end
                                    if(IR_O[5:3] == 3'b010) begin ARF_OutCSel = 2'b11; end
                                    if(IR_O[5:3] == 3'b011) begin ARF_OutCSel = 2'b10; end
                                    if(IR_O[8:6] == 3'b100) begin RF_RegSel = 4'b0111; end
                                    if(IR_O[8:6] == 3'b101) begin RF_RegSel = 4'b1011; end
                                    if(IR_O[8:6] == 3'b110) begin RF_RegSel = 4'b1101; end
                                    if(IR_O[8:6] == 3'b111) begin RF_RegSel = 4'b1110; end
                                    RF_FunSel = 3'b010; ARF_RegSel = 3'b111;
                                end
                            end     
                            
                            
                            
                
                        end
                
         //DSTREG ? SREG1 + SREG2, Flags will change
                if((T2 == 1'b1) && (IR_O[15:10] == 6'b011001))begin
                      ALU_WF = IR_O[9];
                      ARF_RegSel = 3'b111;
                      if(IR_O[5] == 1'b0) begin
                      
                          if(IR_O[5:3] == 3'b000)begin ARF_OutCSel = 2'b00; end
                          if(IR_O[5:3] == 3'b001)begin ARF_OutCSel = 2'b00; end
                          if(IR_O[5:3] == 3'b010)begin ARF_OutCSel = 2'b11; end
                          if(IR_O[5:3] == 3'b011)begin ARF_OutCSel = 2'b10; end
                          MuxASel = 2'b01;
                          RF_FunSel = 3'b010;
                          RF_ScrSel = 4'b0111;
                      end
                      if(IR_O[5] == 1'b1) begin
                      
                      
                          if(IR_O[5:3] == 3'b100) begin RF_OutASel = 3'b000; end
                          if(IR_O[5:3] == 3'b101) begin RF_OutASel = 3'b001; end
                          if(IR_O[5:3] == 3'b110) begin RF_OutASel = 3'b010; end
                          if(IR_O[5:3] == 3'b111) begin RF_OutASel = 3'b011; end
                          
                          ALU_FunSel = 5'b10000;
                          MuxASel = 2'b00;
                          RF_FunSel = 3'b010;
                          RF_ScrSel = 4'b0111;
                          
                      end
          
                  end
          
                  if((T3 == 1'b1) && (IR_O[15:10] == 6'b011001))begin
                      ALU_WF = IR_O[9];
                      if(IR_O[2] == 1'b0) begin
                      
                          if(IR_O[2:0] == 3'b000)begin ARF_OutCSel = 2'b00; end
                          if(IR_O[2:0] == 3'b001)begin ARF_OutCSel = 2'b00; end
                          if(IR_O[2:0] == 3'b010)begin ARF_OutCSel = 2'b11; end
                          if(IR_O[2:0] == 3'b011)begin ARF_OutCSel = 2'b10; end
                          MuxASel = 2'b01;
                          RF_FunSel = 3'b010;
                          RF_ScrSel = 4'b1011;
                      end
                      if(IR_O[2] == 1'b1) begin
                      
                      
                          if(IR_O[2:0] == 3'b100) begin RF_OutASel = 3'b000; end
                          if(IR_O[2:0] == 3'b101) begin RF_OutASel = 3'b001; end
                          if(IR_O[2:0] == 3'b110) begin RF_OutASel = 3'b010; end
                          if(IR_O[2:0] == 3'b111) begin RF_OutASel = 3'b011; end
                          
                          ALU_FunSel = 5'b10000;
                          MuxASel = 2'b00;
                          RF_FunSel = 3'b010;
                          RF_ScrSel = 4'b1011;
                          
                      end
          
                  end
                  
                  if((T4 == 1'b1) && (IR_O[15:10] == 6'b011001)) begin
                      RF_ScrSel = 4'b1111;
                      RF_OutASel = 3'b100;
                      RF_OutBSel = 3'b101;
                      ALU_FunSel = 5'b10100;
                      
                      if(IR_O[8] == 1'b0) begin
                          MuxBSel =  2'b00;
                          ARF_FunSel = 3'b010;
                          if(IR_O[8:6] == 3'b000)begin ARF_RegSel = 3'b011; end
                          if(IR_O[8:6] == 3'b001)begin ARF_RegSel = 3'b011; end
                          if(IR_O[8:6] == 3'b010)begin ARF_RegSel = 3'b110; end
                          if(IR_O[8:6] == 3'b011)begin ARF_RegSel = 3'b101; end
                      end
                      
                      if(IR_O[8] == 1'b1) begin
                          MuxASel = 2'b00;
                          RF_FunSel = 3'b010;
                          if(IR_O[8:6] == 3'b100)begin RF_RegSel = 4'b0111; end
                          if(IR_O[8:6] == 3'b101)begin RF_RegSel = 4'b1011; end
                          if(IR_O[8:6] == 3'b110)begin RF_RegSel = 4'b1101; end
                          if(IR_O[8:6] == 3'b111)begin RF_RegSel = 4'b1110; end
                      end
                      
                      RT=1'b1;
                   end       
                
                
                //DSTREG ? SREG1 - SREG2, Flags will change
                                if((T2 == 1'b1) && (IR_O[15:10] == 6'b011010))begin
                                      ALU_WF = IR_O[9];
                                      ARF_RegSel = 3'b111;
                                      if(IR_O[5] == 1'b0) begin
                                      
                                          if(IR_O[5:3] == 3'b000)begin ARF_OutCSel = 2'b00; end
                                          if(IR_O[5:3] == 3'b001)begin ARF_OutCSel = 2'b00; end
                                          if(IR_O[5:3] == 3'b010)begin ARF_OutCSel = 2'b11; end
                                          if(IR_O[5:3] == 3'b011)begin ARF_OutCSel = 2'b10; end
                                          MuxASel = 2'b01;
                                          RF_FunSel = 3'b010;
                                          RF_ScrSel = 4'b0111;
                                      end
                                      if(IR_O[5] == 1'b1) begin
                                      
                                      
                                          if(IR_O[5:3] == 3'b100) begin RF_OutASel = 3'b000; end
                                          if(IR_O[5:3] == 3'b101) begin RF_OutASel = 3'b001; end
                                          if(IR_O[5:3] == 3'b110) begin RF_OutASel = 3'b010; end
                                          if(IR_O[5:3] == 3'b111) begin RF_OutASel = 3'b011; end
                                          
                                          ALU_FunSel = 5'b10000;
                                          MuxASel = 2'b00;
                                          RF_FunSel = 3'b010;
                                          RF_ScrSel = 4'b0111;
                                          
                                      end
                          
                                  end
                          
                                  if((T3 == 1'b1) && (IR_O[15:10] == 6'b011010))begin
                                      ALU_WF = IR_O[9];
                                      if(IR_O[2] == 1'b0) begin
                                      
                                          if(IR_O[2:0] == 3'b000)begin ARF_OutCSel = 2'b00; end
                                          if(IR_O[2:0] == 3'b001)begin ARF_OutCSel = 2'b00; end
                                          if(IR_O[2:0] == 3'b010)begin ARF_OutCSel = 2'b11; end
                                          if(IR_O[2:0] == 3'b011)begin ARF_OutCSel = 2'b10; end
                                          MuxASel = 2'b01;
                                          RF_FunSel = 3'b010;
                                          RF_ScrSel = 4'b1011;
                                      end
                                      if(IR_O[2] == 1'b1) begin
                                      
                                      
                                          if(IR_O[2:0] == 3'b100) begin RF_OutASel = 3'b000; end
                                          if(IR_O[2:0] == 3'b101) begin RF_OutASel = 3'b001; end
                                          if(IR_O[2:0] == 3'b110) begin RF_OutASel = 3'b010; end
                                          if(IR_O[2:0] == 3'b111) begin RF_OutASel = 3'b011; end
                                          
                                          ALU_FunSel = 5'b10000;
                                          MuxASel = 2'b00;
                                          RF_FunSel = 3'b010;
                                          RF_ScrSel = 4'b1011;
                                          
                                      end
                          
                                  end
                                  
                                  if((T4 == 1'b1) && (IR_O[15:10] == 6'b011010)) begin
                                      RF_ScrSel = 4'b1111;
                                      RF_OutASel = 3'b100;
                                      RF_OutBSel = 3'b101;
                                      ALU_FunSel = 5'b10110;
                                      
                                      if(IR_O[8] == 1'b0) begin
                                          MuxBSel =  2'b00;
                                          ARF_FunSel = 3'b010;
                                          if(IR_O[8:6] == 3'b000)begin ARF_RegSel = 3'b011; end
                                          if(IR_O[8:6] == 3'b001)begin ARF_RegSel = 3'b011; end
                                          if(IR_O[8:6] == 3'b010)begin ARF_RegSel = 3'b110; end
                                          if(IR_O[8:6] == 3'b011)begin ARF_RegSel = 3'b101; end
                                      end
                                      
                                      if(IR_O[8] == 1'b1) begin
                                          MuxASel = 2'b00;
                                          RF_FunSel = 3'b010;
                                          if(IR_O[8:6] == 3'b100)begin RF_RegSel = 4'b0111; end
                                          if(IR_O[8:6] == 3'b101)begin RF_RegSel = 4'b1011; end
                                          if(IR_O[8:6] == 3'b110)begin RF_RegSel = 4'b1101; end
                                          if(IR_O[8:6] == 3'b111)begin RF_RegSel = 4'b1110; end
                                      end
                                      
                                      RT=1'b1;
                                   end              
     
            
            //DSTREG ? SREG1 AND SREG2, Flags will change
                    if((T2 == 1'b1) && (IR_O[15:10] == 6'b011011))begin
                         ALU_WF = IR_O[9];
                         ARF_RegSel = 3'b111;
                         if(IR_O[5] == 1'b0) begin
                         
                             if(IR_O[5:3] == 3'b000)begin ARF_OutCSel = 2'b00; end
                             if(IR_O[5:3] == 3'b001)begin ARF_OutCSel = 2'b00; end
                             if(IR_O[5:3] == 3'b010)begin ARF_OutCSel = 2'b11; end
                             if(IR_O[5:3] == 3'b011)begin ARF_OutCSel = 2'b10; end
                             MuxASel = 2'b01;
                             RF_FunSel = 3'b010;
                             RF_ScrSel = 4'b0111;
                         end
                         if(IR_O[5] == 1'b1) begin
                         
                         
                             if(IR_O[5:3] == 3'b100) begin RF_OutASel = 3'b000; end
                             if(IR_O[5:3] == 3'b101) begin RF_OutASel = 3'b001; end
                             if(IR_O[5:3] == 3'b110) begin RF_OutASel = 3'b010; end
                             if(IR_O[5:3] == 3'b111) begin RF_OutASel = 3'b011; end
                             
                             ALU_FunSel = 5'b10000;
                             MuxASel = 2'b00;
                             RF_FunSel = 3'b010;
                             RF_ScrSel = 4'b0111;
                             
                         end
             
                     end
             
                     if((T3 == 1'b1) && (IR_O[15:10] == 6'b011011))begin
                         ALU_WF = IR_O[9];
                         if(IR_O[2] == 1'b0) begin
                         
                             if(IR_O[2:0] == 3'b000)begin ARF_OutCSel = 2'b00; end
                             if(IR_O[2:0] == 3'b001)begin ARF_OutCSel = 2'b00; end
                             if(IR_O[2:0] == 3'b010)begin ARF_OutCSel = 2'b11; end
                             if(IR_O[2:0] == 3'b011)begin ARF_OutCSel = 2'b10; end
                             MuxASel = 2'b01;
                             RF_FunSel = 3'b010;
                             RF_ScrSel = 4'b1011;
                         end
                         if(IR_O[2] == 1'b1) begin
                         
                         
                             if(IR_O[2:0] == 3'b100) begin RF_OutASel = 3'b000; end
                             if(IR_O[2:0] == 3'b101) begin RF_OutASel = 3'b001; end
                             if(IR_O[2:0] == 3'b110) begin RF_OutASel = 3'b010; end
                             if(IR_O[2:0] == 3'b111) begin RF_OutASel = 3'b011; end
                             
                             ALU_FunSel = 5'b10000;
                             MuxASel = 2'b00;
                             RF_FunSel = 3'b010;
                             RF_ScrSel = 4'b1011;
                             
                         end
             
                     end
                     
                     if((T4 == 1'b1) && (IR_O[15:10] == 6'b011011)) begin
                         RF_ScrSel = 4'b1111;
                         RF_OutASel = 3'b100;
                         RF_OutBSel = 3'b101;
                         ALU_FunSel = 5'b10111;
                         
                         if(IR_O[8] == 1'b0) begin
                             MuxBSel =  2'b00;
                             ARF_FunSel = 3'b010;
                             if(IR_O[8:6] == 3'b000)begin ARF_RegSel = 3'b011; end
                             if(IR_O[8:6] == 3'b001)begin ARF_RegSel = 3'b011; end
                             if(IR_O[8:6] == 3'b010)begin ARF_RegSel = 3'b110; end
                             if(IR_O[8:6] == 3'b011)begin ARF_RegSel = 3'b101; end
                         end
                         
                         if(IR_O[8] == 1'b1) begin
                             MuxASel = 2'b00;
                             RF_FunSel = 3'b010;
                             if(IR_O[8:6] == 3'b100)begin RF_RegSel = 4'b0111; end
                             if(IR_O[8:6] == 3'b101)begin RF_RegSel = 4'b1011; end
                             if(IR_O[8:6] == 3'b110)begin RF_RegSel = 4'b1101; end
                             if(IR_O[8:6] == 3'b111)begin RF_RegSel = 4'b1110; end
                         end
                         
                         RT=1'b1;
                      end    
     
     //DSTREG ? SREG1 OR SREG2, Flags will change
        if((T2 == 1'b1) && (IR_O[15:10] == 6'b011100))begin
          ALU_WF = IR_O[9];
          ARF_RegSel = 3'b111;
          if(IR_O[5] == 1'b0) begin
          
              if(IR_O[5:3] == 3'b000)begin ARF_OutCSel = 2'b00; end
              if(IR_O[5:3] == 3'b001)begin ARF_OutCSel = 2'b00; end
              if(IR_O[5:3] == 3'b010)begin ARF_OutCSel = 2'b11; end
              if(IR_O[5:3] == 3'b011)begin ARF_OutCSel = 2'b10; end
              MuxASel = 2'b01;
              RF_FunSel = 3'b010;
              RF_ScrSel = 4'b0111;
          end
          if(IR_O[5] == 1'b1) begin
          
          
              if(IR_O[5:3] == 3'b100) begin RF_OutASel = 3'b000; end
              if(IR_O[5:3] == 3'b101) begin RF_OutASel = 3'b001; end
              if(IR_O[5:3] == 3'b110) begin RF_OutASel = 3'b010; end
              if(IR_O[5:3] == 3'b111) begin RF_OutASel = 3'b011; end
              
              ALU_FunSel = 5'b10000;
              MuxASel = 2'b00;
              RF_FunSel = 3'b010;
              RF_ScrSel = 4'b0111;
              
          end

      end

      if((T3 == 1'b1) && (IR_O[15:10] == 6'b011100))begin
          ALU_WF = IR_O[9];
          if(IR_O[2] == 1'b0) begin
          
              if(IR_O[2:0] == 3'b000)begin ARF_OutCSel = 2'b00; end
              if(IR_O[2:0] == 3'b001)begin ARF_OutCSel = 2'b00; end
              if(IR_O[2:0] == 3'b010)begin ARF_OutCSel = 2'b11; end
              if(IR_O[2:0] == 3'b011)begin ARF_OutCSel = 2'b10; end
              MuxASel = 2'b01;
              RF_FunSel = 3'b010;
              RF_ScrSel = 4'b1011;
          end
          if(IR_O[2] == 1'b1) begin
          
          
              if(IR_O[2:0] == 3'b100) begin RF_OutASel = 3'b000; end
              if(IR_O[2:0] == 3'b101) begin RF_OutASel = 3'b001; end
              if(IR_O[2:0] == 3'b110) begin RF_OutASel = 3'b010; end
              if(IR_O[2:0] == 3'b111) begin RF_OutASel = 3'b011; end
              
              ALU_FunSel = 5'b10000;
              MuxASel = 2'b00;
              RF_FunSel = 3'b010;
              RF_ScrSel = 4'b1011;
              
          end

      end
      
      if((T4 == 1'b1) && (IR_O[15:10] == 6'b011100)) begin
          RF_ScrSel = 4'b1111;
          RF_OutASel = 3'b100;
          RF_OutBSel = 3'b101;
          ALU_FunSel = 5'b11000;
          
          if(IR_O[8] == 1'b0) begin
              MuxBSel =  2'b00;
              ARF_FunSel = 3'b010;
              if(IR_O[8:6] == 3'b000)begin ARF_RegSel = 3'b011; end
              if(IR_O[8:6] == 3'b001)begin ARF_RegSel = 3'b011; end
              if(IR_O[8:6] == 3'b010)begin ARF_RegSel = 3'b110; end
              if(IR_O[8:6] == 3'b011)begin ARF_RegSel = 3'b101; end
          end
          
          if(IR_O[8] == 1'b1) begin
              MuxASel = 2'b00;
              RF_FunSel = 3'b010;
              if(IR_O[8:6] == 3'b100)begin RF_RegSel = 4'b0111; end
              if(IR_O[8:6] == 3'b101)begin RF_RegSel = 4'b1011; end
              if(IR_O[8:6] == 3'b110)begin RF_RegSel = 4'b1101; end
              if(IR_O[8:6] == 3'b111)begin RF_RegSel = 4'b1110; end
          end
          
          RT=1'b1;
       end
       
       
       
       
       //DSTREG ? SREG1 XOR SREG2, Flags will change
        if((T2 == 1'b1) && (IR_O[15:10] == 6'b011101))begin
         ALU_WF = IR_O[9];
         ARF_RegSel = 3'b111;
         if(IR_O[5] == 1'b0) begin
         
             if(IR_O[5:3] == 3'b000)begin ARF_OutCSel = 2'b00; end
             if(IR_O[5:3] == 3'b001)begin ARF_OutCSel = 2'b00; end
             if(IR_O[5:3] == 3'b010)begin ARF_OutCSel = 2'b11; end
             if(IR_O[5:3] == 3'b011)begin ARF_OutCSel = 2'b10; end
             MuxASel = 2'b01;
             RF_FunSel = 3'b010;
             RF_ScrSel = 4'b0111;
         end
         if(IR_O[5] == 1'b1) begin
         
         
             if(IR_O[5:3] == 3'b100) begin RF_OutASel = 3'b000; end
             if(IR_O[5:3] == 3'b101) begin RF_OutASel = 3'b001; end
             if(IR_O[5:3] == 3'b110) begin RF_OutASel = 3'b010; end
             if(IR_O[5:3] == 3'b111) begin RF_OutASel = 3'b011; end
             
             ALU_FunSel = 5'b10000;
             MuxASel = 2'b00;
             RF_FunSel = 3'b010;
             RF_ScrSel = 4'b0111;
             
         end

     end

     if((T3 == 1'b1) && (IR_O[15:10] == 6'b011101))begin
         ALU_WF = IR_O[9];
         if(IR_O[2] == 1'b0) begin
         
             if(IR_O[2:0] == 3'b000)begin ARF_OutCSel = 2'b00; end
             if(IR_O[2:0] == 3'b001)begin ARF_OutCSel = 2'b00; end
             if(IR_O[2:0] == 3'b010)begin ARF_OutCSel = 2'b11; end
             if(IR_O[2:0] == 3'b011)begin ARF_OutCSel = 2'b10; end
             MuxASel = 2'b01;
             RF_FunSel = 3'b010;
             RF_ScrSel = 4'b1011;
         end
         if(IR_O[2] == 1'b1) begin
         
         
             if(IR_O[2:0] == 3'b100) begin RF_OutASel = 3'b000; end
             if(IR_O[2:0] == 3'b101) begin RF_OutASel = 3'b001; end
             if(IR_O[2:0] == 3'b110) begin RF_OutASel = 3'b010; end
             if(IR_O[2:0] == 3'b111) begin RF_OutASel = 3'b011; end
             
             ALU_FunSel = 5'b10000;
             MuxASel = 2'b00;
             RF_FunSel = 3'b010;
             RF_ScrSel = 4'b1011;
             
         end

     end
     
     if((T4 == 1'b1) && (IR_O[15:10] == 6'b011101)) begin
         RF_ScrSel = 4'b1111;
         RF_OutASel = 3'b100;
         RF_OutBSel = 3'b101;
         ALU_FunSel = 5'b11001;
         
         if(IR_O[8] == 1'b0) begin
             MuxBSel =  2'b00;
             ARF_FunSel = 3'b010;
             if(IR_O[8:6] == 3'b000)begin ARF_RegSel = 3'b011; end
             if(IR_O[8:6] == 3'b001)begin ARF_RegSel = 3'b011; end
             if(IR_O[8:6] == 3'b010)begin ARF_RegSel = 3'b110; end
             if(IR_O[8:6] == 3'b011)begin ARF_RegSel = 3'b101; end
         end
         
         if(IR_O[8] == 1'b1) begin
             MuxASel = 2'b00;
             RF_FunSel = 3'b010;
             if(IR_O[8:6] == 3'b100)begin RF_RegSel = 4'b0111; end
             if(IR_O[8:6] == 3'b101)begin RF_RegSel = 4'b1011; end
             if(IR_O[8:6] == 3'b110)begin RF_RegSel = 4'b1101; end
             if(IR_O[8:6] == 3'b111)begin RF_RegSel = 4'b1110; end
         end
         
         RT=1'b1;
      end
      
      //M[SP] ? PC, PC ? Rx
     if((T2 == 1'b1) && (IR_O[15:10] == 6'b011110))begin
     ARF_OutCSel = 2'b00;
     MuxASel = 2'b01;
     RF_FunSel = 3'b010;
     RF_ScrSel = 4'b0111;
     
     
     if(IR_O[9:8] == 2'b00) begin RF_OutASel = 3'b000; end
     if(IR_O[9:8] == 2'b01) begin RF_OutASel = 3'b001; end
     if(IR_O[9:8] == 2'b10) begin  RF_OutASel = 3'b010; end
     if(IR_O[9:8] == 2'b11) begin RF_OutASel = 3'b011; end
     
     
     ALU_FunSel = 5'b10000;
     MuxBSel = 2'b00;
     ARF_FunSel = 3'b010;
     ARF_RegSel = 3'b011;
     
     
     end
     
     if((T3 == 1'b1) && (IR_O[15:10] == 6'b011110))begin
        RF_OutASel = 3'b100;
        ALU_FunSel = 5'b10000;
        MuxCSel = 1'b0;
        ARF_OutDSel = 2'b11;
        ARF_FunSel = 3'b000;
        ARF_RegSel = 3'b110;
     end
     if((T4 == 1'b1) && (IR_O[15:10] == 6'b011110))begin
             RF_OutASel = 3'b100;
             ALU_FunSel = 5'b10000;
             MuxCSel = 1'b1;
             ARF_OutDSel = 2'b11;
             ARF_RegSel = 3'b111;
      end
     
     //PC ? M[SP]
     if((T2 == 1'b1) && (IR_O[15:10] == 6'b011111))begin
     ARF_OutDSel = 2'b11;   
     MuxBSel= 2'b10;
     ARF_FunSel = 3'b010;
     ARF_RegSel = 3'b011;
     
     RT=1'b1;
     end
     
     
     //Rx ? VALUE (VALUE defined in ADDRESS bits)
     if((T2 == 1'b1) && (IR_O[15:10] == 6'b100000))begin
     ARF_RegSel = 3'b111;
     MuxASel= 2'b11;
     RF_FunSel = 3'b010;
     if(IR_O[9:8] == 2'b00) begin RF_RegSel = 4'b0111; end
     if(IR_O[9:8] == 2'b01) begin RF_RegSel = 4'b1011; end
     if(IR_O[9:8] == 2'b10) begin RF_RegSel = 4'b1101; end
     if(IR_O[9:8] == 2'b11) begin RF_RegSel = 4'b1110; end
     
     RT=1'b1;
     end
     
     
     //M[AR+OFFSET] ? Rx (AR is 16-bit register) (OFFSET defined in ADDRESS bits)
     if((T2 == 1'b1) && (IR_O[15:10] == 6'b100001))begin
     ARF_RegSel = 3'b111;
     MuxASel = 2'b01;
     ARF_OutCSel = 2'b10;
     RF_FunSel = 3'b010;
     RF_ScrSel = 4'b0111;
     end
     
     if((T3 == 1'b1) && (IR_O[15:10] == 6'b100001))begin
            
          MuxASel = 2'b11;
          RF_FunSel = 3'b010;
          RF_ScrSel = 4'b1011;
     end
        
     if((T4 == 1'b1) && (IR_O[15:10] == 6'b100001))begin
        RF_OutASel = 3'b100;
        RF_OutASel = 3'b101;
        ALU_FunSel = 5'b10100;
        MuxBSel = 2'b00;
        ARF_FunSel = 3'b010;
        ARF_RegSel = 3'b101;
     end
     
     if((T5 == 1'b1) && (IR_O[15:10] == 6'b100001))begin 
     
     ARF_RegSel= 3'b111;
     ARF_OutDSel = 2'b10;
     Mem_WR=1'b1;
     ALU_FunSel = 5'b10000;
     MuxCSel=1'b0;
     if(IR_O[9:8] == 2'b00 )begin RF_OutASel = 3'b000; end
     if(IR_O[9:8] == 2'b01 )begin RF_OutASel = 3'b001; end
     if(IR_O[9:8] == 2'b10 )begin RF_OutASel = 3'b010; end
     if(IR_O[9:8] == 2'b11 )begin RF_OutASel = 3'b011; end     
     end
     
     
     
     
     
     
     
     
     
     
     
     
     
     end


    
endmodule
