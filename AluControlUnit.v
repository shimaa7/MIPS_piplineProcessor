
module ALU_CTRL( input [2:0] ALUop,
	output reg [3:0] ALUctl);

reg [3:0] r_op;
always @(*) begin	
	case(ALUop) //R-type opperations
			3'b100000:r_op<=3'b010; //add
			3'b100010:r_op<=3'b110; //sub
			6'b100100:r_op<=3'b000; //and
			6'b100101:r_op<=3'b001; //or
			6'b101010:r_op<=3'b111; //slt
		endcase
end
endmodule

/*module tb();
reg [1:0] op;
reg [5:0] func;
wire [3:0] ctl;
ALU_CTRL a1(op,func,ctl);
initial
begin
$monitor("output = %b",ctl);
op=0;
func=32;
#10
op=1;
func=3;
#10
op=2;
func=32;
#10
op=2;
func=34;
end


endmodule*/
