module andgate (aluResult, controlSign, result);
input aluResult, controlSign;
output reg result = 0;
always @(aluResult,controlSign)
begin
result <= aluResult & controlSign;
end
endmodule
