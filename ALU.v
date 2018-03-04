module AluModule(
       output reg signed [31:0] Result,
       output Overflow,
       input [4:0] ShiftAmount,
       input signed [31:0] Input1,Input2,
       input [2:0] AluOP);
//operations
always@(AluOP,Input1,Input2)
 begin
       case(AluOP)
		3'b010: begin // Add operation
		Result<=(Input1+Input2);
		end
		3'b110: begin // Sub operation
		Result<=(Input1-Input2);
		end
		3'b000: begin // And operation
		Result<=(Input1&Input2);
		end
		3'b001: begin // Or operation
		Result<=(Input1|Input2);
		end
		3'b011: begin // Shift Left operation Input1
		Result<=(Input2<<ShiftAmount);
		end
		3'b111: begin // Set Less Than
		Result<=(Input1<Input2)?1:0;
		end
	        default: begin
		Result <= Input1;
		end
       endcase
 end



//overflow
assign Overflow = (Input1[31]==~Input2[31]&&Result[31]==~Input1[31])?1'b1:1'b0;
endmodule

