module registerFile (input wrEnable, input [4:0] wrReg, input [31:0] wrData, input [4:0] rdReg1, output reg [31:0] rdData1 = 0, input [4:0] rdReg2, output reg [31:0] rdData2 = 0, input clk);

	reg [31:0] regFile [0:31];
initial 
begin
	regFile[0] <=0 ;regFile[1]<=1 ;regFile[2]<=2;regFile[3]<=3;
	regFile[4]<=4; regFile[5]<=5; regFile[6]<=6; regFile[7]<=7;
	regFile[8]<=8; regFile[9]<=9;regFile[10]<=10;regFile[11]<=11;
	regFile[12]<=12;regFile[13]<=13;regFile[14]<=14;regFile[15]<=15;
	regFile[16]<=16;regFile[17]<=17;regFile[18]<=18;regFile[19]<=19;
	regFile[20]<=20;regFile[21]<=21;regFile[22]<=22;regFile[23]<=23;
	regFile[24]<=24;regFile[25]<=25;regFile[26]<=26;regFile[27]<=27;
	regFile[28]<=28;regFile[29]<=29;regFile[30]<=30;regFile[31]<=31;
end
        always @ (*)
begin
	 rdData1 <= regFile[rdReg1];
	 rdData2 <= regFile[rdReg2];
end
	always @(negedge clk) begin if (wrEnable) begin regFile[wrReg] <= wrData; end end

endmodule
/*
module tbreg();
reg wrEnable;
 reg [4:0] wrReg;
 reg [31:0] wrData;
 reg [4:0] rdReg1;
 wire [31:0] rdData1;
 reg [4:0] rdReg2;
 wire [31:0] rdData2;
 reg clk ;
initial 
begin
 wrEnable = 0;
  wrReg = 0;
 wrData = 0;
 rdReg1 = 2;
  rdReg2 = 3;
  clk = 0;
end
always
 begin
 #5
$monitor("%d // %d" , rdData1 , rdData2);
clk = ~ clk ;
end
registerFile s1(wrEnable,wrReg,wrData,rdReg1,rdData1,rdReg2,rdData2,clk);
endmodule

/*module registerFile_tb();

	reg wrEnable;
	reg [4:0] wrReg;
	reg [31:0] wrData;
	reg [4:0] rdReg1;
	wire [31:0] rdData1;
	reg [4:0] rdReg2;
	wire [31:0] rdData2;
	reg clk;

	reg [5:0] index; // 6 bits so that it doesnt overflow in the following for loop.

	always begin #5 clk = ~clk; end

	initial begin

		// $monitor ("clk:%d en:%d wrReg:%d wrData:%d rdReg1:%d rdData1:%d rdReg2:%d rdData2:%d", clk, wrEnable, wrReg, wrData, rdReg1, rdData1, rdReg2, rdData2);

		clk = 0;

		wrEnable = 1;
		for (index = 0; index < 32; index = index + 1) begin #10 wrReg = index; wrData = index * 2; $display ("wrReg:%d wrData:%d", wrReg, wrData); end
		#10 wrEnable = 0; wrReg = 31; wrData = 93;

		#10 rdReg1 = 0; rdReg2 = 1; #2 $display ("rdReg1:%d rdData1:%d rdReg2:%d rdData2:%d", rdReg1, rdData1, rdReg2, rdData2);
		#10 rdReg1 = 2; rdReg2 = 3; #2 $display ("rdReg1:%d rdData1:%d rdReg2:%d rdData2:%d", rdReg1, rdData1, rdReg2, rdData2);
		#10 rdReg1 = 4; rdReg2 = 5; #2 $display ("rdReg1:%d rdData1:%d rdReg2:%d rdData2:%d", rdReg1, rdData1, rdReg2, rdData2);
		#10 rdReg1 = 6; rdReg2 = 7; #2 $display ("rdReg1:%d rdData1:%d rdReg2:%d rdData2:%d", rdReg1, rdData1, rdReg2, rdData2);
		#10 rdReg1 = 8; rdReg2 = 9; #2 $display ("rdReg1:%d rdData1:%d rdReg2:%d rdData2:%d", rdReg1, rdData1, rdReg2, rdData2);
		#10 rdReg1 = 10; rdReg2 = 11; #2 $display ("rdReg1:%d rdData1:%d rdReg2:%d rdData2:%d", rdReg1, rdData1, rdReg2, rdData2);
		#10 rdReg1 = 12; rdReg2 = 13; #2 $display ("rdReg1:%d rdData1:%d rdReg2:%d rdData2:%d", rdReg1, rdData1, rdReg2, rdData2);
		#10 rdReg1 = 14; rdReg2 = 15; #2 $display ("rdReg1:%d rdData1:%d rdReg2:%d rdData2:%d", rdReg1, rdData1, rdReg2, rdData2);
		#10 rdReg1 = 16; rdReg2 = 17; #2 $display ("rdReg1:%d rdData1:%d rdReg2:%d rdData2:%d", rdReg1, rdData1, rdReg2, rdData2);
		#10 rdReg1 = 18; rdReg2 = 19; #2 $display ("rdReg1:%d rdData1:%d rdReg2:%d rdData2:%d", rdReg1, rdData1, rdReg2, rdData2);
		#10 rdReg1 = 20; rdReg2 = 21; #2 $display ("rdReg1:%d rdData1:%d rdReg2:%d rdData2:%d", rdReg1, rdData1, rdReg2, rdData2);
		#10 rdReg1 = 22; rdReg2 = 23; #2 $display ("rdReg1:%d rdData1:%d rdReg2:%d rdData2:%d", rdReg1, rdData1, rdReg2, rdData2);
		#10 rdReg1 = 24; rdReg2 = 25; #2 $display ("rdReg1:%d rdData1:%d rdReg2:%d rdData2:%d", rdReg1, rdData1, rdReg2, rdData2);
		#10 rdReg1 = 26; rdReg2 = 27; #2 $display ("rdReg1:%d rdData1:%d rdReg2:%d rdData2:%d", rdReg1, rdData1, rdReg2, rdData2);
		#10 rdReg1 = 28; rdReg2 = 29; #2 $display ("rdReg1:%d rdData1:%d rdReg2:%d rdData2:%d", rdReg1, rdData1, rdReg2, rdData2);
		#10 rdReg1 = 30; rdReg2 = 31; #2 $display ("rdReg1:%d rdData1:%d rdReg2:%d rdData2:%d", rdReg1, rdData1, rdReg2, rdData2);

	end
endmodule*/
