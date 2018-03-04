module HazardControlUnit(IDIFWrite,PCWrite,MuxSel,IDEXMEMRead,IDEXRegRt,IFIDRegRt,IFIDRegRs,clk);
input IDEXMEMRead ,clk;
input [4:0] IDEXRegRt,IFIDRegRt ,IFIDRegRs;
output reg IDIFWrite = 0 , PCWrite = 1 , MuxSel ;
always @(*)
begin
   IDIFWrite <= 1;
   MuxSel <= 0;
   PCWrite <= 1;
// condition to stall pipline for lw 
  if(IDEXMEMRead && ((IDEXRegRt == IFIDRegRt) || (IDEXRegRt == IFIDRegRs )) ) 
   begin
   MuxSel <=  1;
   PCWrite <= 0;
   IDIFWrite <= 0;
   end
end
endmodule
