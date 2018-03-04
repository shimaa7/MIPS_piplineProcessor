module controlUnit(IDFlush,IFFlush,EXFlush,RegDst,RegWrite,ALUSrc,ALUOp,MemWrite,MemRead,MemToReg,PCSrc,Branch,Jump,LUIctr,clk,opCode,func);
output reg RegDst,RegWrite,ALUSrc,MemWrite,MemRead,MemToReg,PCSrc,Branch =0 ,Jump = 0 ,LUIctr,IDFlush = 0,IFFlush = 0,EXFlush = 0;
output reg [2:0] ALUOp;
input [5:0] opCode , func;
input clk; 
always @(opCode,func)
begin 
Branch = 0;
Jump = 0;
LUIctr = 0;
IDFlush = 0;
IFFlush = 0;
EXFlush = 0;
 case(opCode)
   0 : // R type
     begin
       case(func)
         32: //add
         begin
         RegDst = 1;
         RegWrite = 1;
         ALUSrc = 0;
         ALUOp = 2; 
         MemWrite = 0; 
         MemRead = 0; 
         MemToReg = 1;
         PCSrc = 0;
         end
         34: //sub
         begin
         RegDst = 1;
         RegWrite = 1;
         ALUSrc = 0;
         ALUOp = 6; 
         MemWrite = 0; 
         MemRead = 0; 
         MemToReg = 1;
         PCSrc = 0;
         end
         36: //and
         begin
         RegDst = 1;
         RegWrite = 1 ;
         ALUSrc = 0;
         ALUOp = 0; 
         MemWrite = 0; 
         MemRead = 0; 
         MemToReg = 1;
         PCSrc = 0;
         end
         37: //or
         begin
         RegDst = 1 ;
         RegWrite = 1;
         ALUSrc = 0;
         ALUOp = 1; 
         MemWrite = 0; 
         MemRead = 0; 
         MemToReg = 1;
         PCSrc = 0;
         end
         39: //nor --
         begin
         RegDst = 1;
         RegWrite = 1;
         ALUSrc = 0;
         ALUOp = 1; 
         MemWrite = 0; 
         MemRead = 0; 
         MemToReg = 1;
         PCSrc = 0;
         end
         42: //slt
         begin
         RegDst = 1;
         RegWrite = 1;
         ALUSrc = 0;
         ALUOp = 7; 
         MemWrite = 0; 
         MemRead = 0; 
         MemToReg = 1;
         PCSrc = 0;
         end
         0: //sll --
         begin
         RegDst = 0;
         RegWrite = 0;
         ALUSrc = 0;
         ALUOp = 3; 
         MemWrite = 0; 
         MemRead = 0; 
         MemToReg = 1;
         PCSrc = 0;
         end
         2: //srl --
         begin
         RegDst = 0;
         RegWrite = 0;
         ALUSrc = 0;
         ALUOp = 0; 
         MemWrite = 0; 
         MemRead = 0; 
         MemToReg = 1;
         PCSrc = 0;
         end	
         8: //jr --
         begin
         RegDst = 0;
         RegWrite = 0;
         ALUSrc = 0;
         ALUOp = 0; 
         MemWrite = 0; 
         MemRead = 0; 
         MemToReg = 1;
         PCSrc = 0;
         IDFlush = 1;
         IFFlush = 1;
         EXFlush = 1;
         end
       endcase
     end
   8 : //addi --
   begin
         RegDst = 0;
         RegWrite = 1;
         ALUSrc = 1;
         ALUOp = 2; 
         MemWrite = 0; 
         MemRead = 0; 
         MemToReg = 1;
         PCSrc = 0;
   end
   12 : //andi --
   begin
         RegDst = 0;
         RegWrite = 0;
         ALUSrc = 0;
         ALUOp = 0; 
         MemWrite = 0; 
         MemRead = 0; 
         MemToReg = 1;
         PCSrc = 0;
   end
   13 : //ori --
   begin
         RegDst = 0;
         RegWrite = 0;
         ALUSrc = 0;
         ALUOp = 1; 
         MemWrite = 0; 
         MemRead = 0; 
         MemToReg = 1;
         PCSrc = 0;
   end
   10 : //slti --
   begin
         RegDst = 0;
         RegWrite = 0;
         ALUSrc = 0;
         ALUOp = 0; 
         MemWrite = 0; 
         MemRead = 0; 
         MemToReg = 1;
         PCSrc = 0;
   end
   35 : //lw
   begin
         RegDst = 0;
         RegWrite = 1;
         ALUSrc = 1;
         ALUOp = 2; 
         MemWrite = 0; 
         MemRead = 1; 
         MemToReg = 0;
         PCSrc = 0;
   end
   43 : //sw
   begin
        // RegDst = ;
         RegWrite = 0;
         ALUSrc = 1;
         ALUOp = 2; 
         MemWrite = 0; 
         MemRead = 0; 
         MemToReg = 0;
         PCSrc = 0;
   end
   15 : //lui - lw upi
   begin
         RegDst = 0;
         RegWrite = 1;
        // ALUSrc = ;
       //  ALUOp = ; 
         MemWrite = 0; 
        // MemRead = ; 
         MemToReg = 0;
        // PCSrc = ;
         LUIctr = 1;
   end
   32 : //lb - lw byte --
   begin
         RegDst = 0;
         RegWrite = 0;
         ALUSrc = 0;
         ALUOp = 0; 
         MemWrite = 0; 
         MemRead = 0; 
         MemToReg = 0;
         PCSrc = 0;
   end
   40 : //sb - sw byte --
   begin
         RegDst = 0;
         RegWrite = 0;
         ALUSrc = 0;
         ALUOp = 0; 
         MemWrite = 0; 
         MemRead = 0; 
         MemToReg = 0;
         PCSrc = 0;
   end
   33 : //lh - lw half word --
   begin
         RegDst = 0;
         RegWrite = 0;
         ALUSrc = 0;
         ALUOp = 0; 
         MemWrite = 0; 
         MemRead = 0; 
         MemToReg = 0;
         PCSrc = 0;
   end
   41 : //sh - sw half word --
   begin
         RegDst = 0;
         RegWrite = 0;
         ALUSrc = 0;
         ALUOp = 0; 
         MemWrite = 0; 
         MemRead = 0; 
         MemToReg = 0;
         PCSrc = 0;
   end
   4 : //beq
   begin
        // RegDst = ;
         RegWrite = 0;
         ALUSrc = 0;
         ALUOp = 6; 
         MemWrite = 0; 
         MemRead = 0; 
        // MemToReg = ;
         PCSrc = 1;
         Branch = 1;
        // IDFlush = 1;
       //  IFFlush = 1;
       //  EXFlush = 1;
   end
   5 : //bnq --
   begin
         RegDst = 0;
         RegWrite = 0;
         ALUSrc = 0;
         ALUOp = 0; 
         MemWrite = 0; 
         MemRead = 0; 
         MemToReg = 1;
         PCSrc = 0;
       //  IDFlush = 1;
       //  IFFlush = 1;
       //  EXFlush = 1;
   end
   2 : //j
   begin
       //  RegDst = ;
         RegWrite = 0;
       //  ALUSrc = ;
       //  ALUOp = ; 
         MemWrite = 0; 
       //  MemRead = ; 
       //  MemToReg = ;
       //  PCSrc = ;
         Jump = 1;
       //  IDFlush = 1;
       //  IFFlush = 1;
      //   EXFlush = 1;
   end
 endcase
end

endmodule
/*module tb();
      wire RegDst ;
      wire RegWrite ;
      wire  ALUSrc ;
      wire  [2:0] ALUOp ; 
      wire   MemWrite ; 
      wire   MemRead ; 
      wire   MemToReg ;
      wire   PCSrc ;
wire Branch;
wire Jump ;
wire LUIctr ;
reg clk;
reg [5:0]opCode;
reg [5:0]func ;
initial 
begin 
$monitor("regDst = %d , regWrite = %d , AluSrc = %d , AluOp = %d ",RegDst,RegWrite,ALUSrc,ALUOp);
 func = 32;
 opCode = 0;
clk = 0;
#5
clk = ~ clk ;
end
controlUnit s1(RegDst,RegWrite,ALUSrc,ALUOp,MemWrite,MemRead,MemToReg,PCSrc,Branch,Jump,LUIctr,clk,opCode,func);
endmodule */