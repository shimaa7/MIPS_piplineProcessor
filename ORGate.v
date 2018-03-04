
module orGate(input reg1,input reg2,output reg result);
  always@ (*)  begin
    result = reg1 | reg2;
  end
endmodule