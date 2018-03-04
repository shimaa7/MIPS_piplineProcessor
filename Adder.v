
module ALU_ADD_4(
	output reg  [31:0] Result = 0 ,
	input [31:0] Input1,
	input clk);

always@(Input1)
 begin
	Result=(Input1+4);
	//$display(" input1 = %d --Result: %d ",Input1,Result);
 end
endmodule

module ALU_ADD(
	output reg signed [31:0] Result = 0,
	input signed [31:0] Input1,Input2,
	input clk);

always@(*)
 begin
	Result=(Input1+Input2);
 end
endmodule
/*module tbb();
 wire signed [31:0] Result;
	reg signed [31:0] Input1,Input2;
	reg clk;
initial 
begin
$monitor("%d",Result);
clk = 1;
Input1 = 0;
Input2 = 4;
end
ALU_ADD s2(Result,Input1,Input2,clk);
endmodule
*/