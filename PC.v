
module pc (clk , pcWrite,pcInput,pcOut);
  input [31:0] pcInput;
  input clk,pcWrite;
  output reg [31:0] pcOut ;
        
  always @(posedge clk)
    begin
       if(pcWrite)
		 pcOut = pcInput ;
       else  pcOut = pcInput - 8;
	//$display(" pcOut = %d --pcInput: %d ",pcOut,pcInput);
    end
endmodule

/*module tbPC();
  reg [31:0] pcInput;
  reg clk,pcWrite;
  wire [31:0] pcOut;
initial
 begin
$monitor("%d",pcOut);
clk = 1;
pcInput = 0;
pcWrite = 1;
#5
clk = 0;
pcInput = pcInput + 4;
#5
clk = 1;
end
pc s1 (clk , pcWrite,pcInput,pcOut);
endmodule*/
