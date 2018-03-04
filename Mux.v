module mux2_1(input selCh, input [31:0] inCh0, input [31:0] inCh1, output reg [31:0] selData = 0);
always@(inCh0,inCh1,selCh)
begin selData = selCh == 0 ? inCh0 :
			  selCh == 1 ? inCh1 : 0;
//$display("selCh %d inCh0 %d inCh1 %d selData %d",selCh,inCh0,inCh1,selData);
end
endmodule


module mux3_1(input [1:0]selCh, input [31:0] inCh0, input [31:0] inCh1,input [31:0] inCh2, output reg[31:0] selData = 0);
always@(inCh0,selCh)
 begin selData = selCh == 0 ? inCh0 :
			 selCh == 1 ? inCh1 : 
                         selCh == 2 ? inCh2 : 0;
//$display("mux : %d sel: %d 0: %d 1: %d 2: %d",selData ,selCh,inCh0,inCh1,inCh2);
end
endmodule
/*module tb();
reg [1:0]selCh;
 reg [31:0] inCh0;
 reg [31:0] inCh1;
reg [31:0] inCh2;
 wire [31:0] selData;
initial
begin
$monitor("%d",selData);
selCh = 1;
inCh0 = 11;
inCh2 = 12;
inCh1 = 13;
end
mux3_1 s1(selCh,inCh0,inCh1,inCh2,selData);
endmodule*/
