
module PiplineMIPS();
//------------------------------------------------------------------------Variables------------------------------------------------------------------------------
//--------------------------------------------- **IF STAGE** -----------------------------------
//--------- Clk + PC + Ones + Zeroes --------
reg clk ;
wire [31:0]  pcOut;
wire [22:0] setZero23;
wire [29:0] setZero30;
wire [26:0] setZero27;
wire [5:0] setZero6;
wire [31:0] Ones;
//----------------- ALU_ADD s1-------------
wire signed [31:0] Result;
//----------------------mux3_1 s2--------------
wire [31:0] selData;
//------------------------IM s3--------------
wire [31:0] instruction;
//--------------- AND ---------------
wire AndGateOut;
//--------------------- IFID s4 --------------
wire [31:0] InstReg, PC_Plus4Reg;  
//--------------------------------------------- **ID STAGE** -----------------------------------
//------------------ RF s5 -------------
wire [31:0] rdData1;
wire [31:0] rdData2;
wire [31:0] aluAdd;
wire [31:0] extended;
//---------------shift left mod s8-------
wire [31:0] o1;
//---------------comparator----------------
wire result;
//---------------Control s10---------------
wire RegDst,RegWrite,ALUSrc,MemWrite,MemRead,MemToReg,PCSrc,Branch ,Jump,LUIctr,IDFlush,IFFlush,EXFlush;
wire [2:0] ALUOp;
//----------------mux2_1 s9---------
wire [31:0] selDataID;
//---------------IDEX s11-----------------
wire [1:0] WBreg; 
wire[1:0] Mreg; 
wire [4:0] EXreg; 
wire[4:0] RegRsreg,RegRtreg,RegRdreg; 
wire[31:0] DataAreg,DataBreg,imm_valuereg; 
wire IDFlushOut;
//--------------HazardControlUnit s12--------------------------
wire IDIFWrite , PCWrite , MuxSel;
//------------OR s13---------------------------------------
wire ORresult;
//-----------ALU_ADD s15-----------------------------------
wire [31:0] inCh00;
//--------------------------------------------- **EX STAGE** ----------------------------------------
//-----------------Mux2_1 s18 s19 --------------
wire [31:0] selDataWB,selDataMEM;
//-----------------mux2_1 s20------------------
wire [31:0] muxEx2_1 ;
//----------------mux3_1 s21 s22--------------------------
wire [31:0]muxA , muxB;
//--------------mux2_1 s23---------------------
wire [31:0]alu2_2out ;
//-----------------Alu s17----------------------------
wire [31:0] ResultAlu;
wire [4:0] ShiftAmount;
//----------------Forwarding---------------------------
wire [1:0]muxASel , muxBSel;
//----------------------------------------- **MEM STAGE** -------------------------------------------
//------------EX/MEM s25----------------------
wire [31:0] ALUreg;
wire [4:0] RegRDreg;
wire [31:0]WriteDataOut;
wire [1:0] EXMEMWBreg;
wire [1:0] EXMEMMreg;
//--------------dataMemory s26--------------
wire [31:0]readData;
//-------------------------------------- **WB STAGE** ----------------------------------------------
//--------------------------------MemWB s27------------------
wire [1:0]LastWBreg;
wire [31:0] Memreg,LastALUreg;
wire [4:0] LastRegRDreg;
//----------------mux2_1 s28-------------
wire [31:0] LastMux;
//-----------------------------------------------------------Assign-------------------------------------------------------------------------------------------
initial 
begin
clk <= 0 ;
end
assign setZero30 = 0;
assign setZero27 = 0;
assign setZero23 = 0;
assign setZero6 = 0;
assign Ones = 1;
always begin 
#5
clk <= ~ clk ;
end
//---------------------------------------------------------------Instances--------------------------------------------------------------------------------------
//--------------IF Stage ------------------------
pc s30(clk , PCWrite ,selData,pcOut);
ALU_ADD_4 s1(Result,pcOut,clk);
mux3_1 s2({AndGateOut,Jump},Result,{setZero6,InstReg[25:0]},inCh00,selData);
IM s3(pcOut, clk, instruction); 
IFID s4(IFFlush ,clk,IDIFWrite,Result,instruction,InstReg,PC_Plus4Reg);
andgate s14(Branch, result, AndGateOut);

//------------ ID Stage ------------------------------
registerFile s5(LastWBreg[0], LastRegRDreg ,  LastMux, InstReg[25:21], rdData1  , InstReg[20:16], rdData2, clk);
comparator_sos s6(rdData1 ,rdData2,result);
SignExtender s7( clk, InstReg[15:0], extended );
sll s8(extended , o1);
mux2_1 s9(ORresult,{setZero23,MemToReg,RegWrite,MemWrite,MemRead,ALUSrc,ALUOp,RegDst},0,selDataID);
controlUnit s10(IDFlush,IFFlush,EXFlush,RegDst,RegWrite,ALUSrc,ALUOp,MemWrite,MemRead,MemToReg,PCSrc,Branch,Jump,LUIctr,clk,InstReg[31:26],InstReg[5:0]);
IDEX s11(clk,MuxSel,{selDataID[8],selDataID[7]},{selDataID[6],selDataID[5]},{selDataID[4],ALUOp[2],ALUOp[1],ALUOp[0],selDataID[0]},rdData1,rdData2,extended,InstReg[25:21],InstReg[20:16],InstReg[15:11],InstReg[10:6],IDFlushOut,WBreg,Mreg,EXreg,DataAreg,DataBreg,imm_valuereg,RegRsreg,RegRtreg,RegRdreg,ShiftAmount); 
HazardControlUnit s12(IDIFWrite,PCWrite,MuxSel,Mreg[0],RegRtreg,InstReg[20:16],InstReg[25:21],clk);
orGate s13(IDFlush,MuxSel,ORresult);  
ALU_ADD s15(inCh00,PC_Plus4Reg,o1,clk);

//-------------------EX Stage--------------------------------
AluModule s17(ResultAlu,Overflow,ShiftAmount,muxA,alu2_2out,{EXreg[3],EXreg[2],EXreg[1]});
mux2_1 s18( IDFlushOut,  {setZero30,WBreg[1],WBreg[0]}, 0, selDataWB); //ExFlush1
mux2_1 s19(IDFlushOut, {setZero30,Mreg[1],Mreg[0]} ,  0,  selDataMEM);//ExFlush2
mux2_1 s20( EXreg[0],  {setZero27,RegRtreg}, {setZero27,RegRdreg} , muxEx2_1 ); //RegisterDstSel
mux3_1 s21 (muxASel, DataAreg,  LastMux, ALUreg, muxA); //Alu1
mux3_1 s22 (muxBSel, DataBreg,  LastMux, ALUreg, muxB) ;//ALU2-1
mux2_1 s23 ( EXreg[4],  muxB,  imm_valuereg,  alu2_2out); //Alu2-2
forwardUnit s24(clk,RegRsreg,RegRtreg,RegRDreg,LastRegRDreg,EXMEMWBreg[0] ,LastWBreg[0] ,muxASel,muxBSel);

//-------------------MEM Stage----------------------
EXMEM s25(clk,{selDataWB[1],selDataWB[0]},{selDataMEM[1],selDataMEM[0]},ResultAlu,{muxEx2_1[4],muxEx2_1[3],muxEx2_1[2],muxEx2_1[1],muxEx2_1[0]},muxB,EXMEMMreg,EXMEMWBreg,ALUreg,RegRDreg,WriteDataOut);
dataMemory s26(ALUreg,WriteDataOut,readData,EXMEMMreg[1],EXMEMMreg[0],clk);

//--------------------WB Stage-----------------------------------
MEMWB s27(clk,{EXMEMWBreg[1],EXMEMWBreg[0]},readData,ALUreg,RegRDreg,LastWBreg,Memreg,LastALUreg,LastRegRDreg); 
mux2_1 s28(LastWBreg[1],Memreg,LastALUreg,LastMux);
endmodule
