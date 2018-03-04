module IFID(flush,clock,IFIDWrite,PC_Plus4,Inst,InstReg,PC_Plus4Reg); 
    input [31:0] PC_Plus4,Inst; 
    input clock,IFIDWrite,flush; 
    output reg [31:0] InstReg = 0, PC_Plus4Reg = 0; 
     
    always@(posedge clock) 
    begin 
        if(flush) 
        begin 
           InstReg <= 0; 
           PC_Plus4Reg <=0; 
        end 
        else
        begin 
           InstReg <= Inst; 
           PC_Plus4Reg <= PC_Plus4; 
        end 
//$display("InstReg: %x , PC_Plus4Reg: %d ",InstReg,PC_Plus4Reg);
    end 
 
endmodule 

