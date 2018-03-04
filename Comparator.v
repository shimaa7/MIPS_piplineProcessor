module comparator_sos (input [31:0] reg1,input [31:0] reg2,output reg result = 0);
always@(*)
begin
 result <= !(reg1 ^ reg2);
end
endmodule

/*always@(*) 
begin 
if (reg1==reg2) 
	result=1;
else 
	result=0;
end

endmodule*/

/*module comparator_testbench();

reg signed [31:0] reg1;
reg signed [31:0] reg2;
wire signed [31:0] result;

comparator Instance1(.reg1(reg1),.reg2(reg2),.result(result));
initial begin
reg1 = 5;
reg2 = 5;
end

endmodule


*/

