module IDEX(clock,Flush,WB,M,EX,DataA,DataB,imm_value,RegRs,RegRt,RegRd,ShiftAmount,FlushReg,WBreg,Mreg,EXreg,DataAreg,DataBreg,imm_valuereg,RegRsreg,RegRtreg,RegRdreg,ShiftAmountReg); 
    input clock; 
    input Flush;
    input  [1:0] WB; 
    input [1:0] M; 
    input [4:0] EX; 
    input [4:0] RegRs,RegRt,RegRd; 
    input [31:0] DataA,DataB,imm_value; 
    input [4:0] ShiftAmount;
    output reg [1:0] WBreg; 
    output reg [1:0] Mreg; 
    output reg [4:0] EXreg; 
    output reg[4:0] RegRsreg,RegRtreg,RegRdreg; 
    output reg[31:0] DataAreg,DataBreg,imm_valuereg; 
    output reg FlushReg;
    output reg [4:0] ShiftAmountReg = 0;
    always@(posedge clock) 
    begin 
        FlushReg <= Flush;
        WBreg <= WB; 
        Mreg <= M; 
        EXreg <= EX; 
        DataAreg <= DataA; 
        DataBreg <= DataB; 
        imm_valuereg <= imm_value; 
        RegRsreg <= RegRs; 
        RegRtreg <= RegRt; 
        RegRdreg <= RegRd; 
        ShiftAmountReg <= ShiftAmount;
    end 
     
endmodule 