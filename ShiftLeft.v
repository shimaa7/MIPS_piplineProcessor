module sll (input [31:0]in1, output reg [31:0] o1  = 0);
  always@(*) 
   begin
    o1<=(in1<<2);
  end 
endmodule
/*module sll_testbench;
  reg [31:0] in1;
  wire[31:0] o1;
  sll module1(.in1(in1),.o1(o1));
  initial begin 
    in1 = 1;
    #10
    $display(o1);
  end
endmodule*/
