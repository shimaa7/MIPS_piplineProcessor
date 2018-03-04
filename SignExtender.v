module SignExtender( CLK, extend, extended );
  input wire signed[15:0] extend;
  input CLK;
  output reg signed[31:0] extended;

  always @(extend)
  begin
    extended[31:0] <= { {16{extend[15]}}, extend[15:0] };
//$display("extend: %d extended : %d ",extend,extended);
	end
endmodule

/*module tbsign();
reg signed[15:0] extend;
  reg CLK  ;
  wire signed[31:0] extended;
initial 
begin
$monitor("%b" ,extended);
extend = 30; 
CLK = 1;
end

SignExtender s1( CLK, extend, extended );
endmodule */