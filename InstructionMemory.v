
module IM(address, clk, instruction);

   input [31:0] address;
   input clk;
   output reg [31:0] instruction = 0 ;


   reg [31:0] mem [0:255];
   initial begin
          $readmemh("MIPStest.txt", mem);
   end
   always @(posedge clk,address) begin
          instruction<=mem[address[31:2]];
   end
endmodule
/*module ttbb();
  reg [31:0] address;
   reg clk;
    wire [31:0] instruction;
initial 
begin
$monitor("%x",instruction);
clk = 1;
address = 4;
end
IM s1(address, clk, instruction);
endmodule */