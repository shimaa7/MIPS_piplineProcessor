module EXMEM(clock,WB,M,ALUOut,RegRD,WriteDataIn,Mreg,WBreg,ALUreg,RegRDreg,WriteDataOut); 
   input clock; 
   input  [1:0]WB; 
   input [1:0] M; 
   input [4:0] RegRD; 
   input [31:0] ALUOut,WriteDataIn; 
   output reg [1:0] WBreg; 
   output reg[1:0] Mreg; 
   output reg[31:0] ALUreg,WriteDataOut; 
   output reg[4:0] RegRDreg; 
    
    always@(posedge clock) 
    begin 
        WBreg <= WB; 
        Mreg <= M; 
        ALUreg <= ALUOut; 
        RegRDreg <= RegRD; 
        WriteDataOut <= WriteDataIn; 
    end 
 
endmodule 
