module ALU_8bit
#(parameter WIDTH = 8)
(
input		clk, clr, en,
input		[2:0]fn,
input		[WIDTH - 1:0]reg_A, reg_B,
output	[WIDTH - 1:0]bus
);

reg [WIDTH - 1:0]mem_ALU;								// Defining a single 8-bit wide memory

assign bus = en ? mem_ALU : 8'bz;

always @ (posedge clk)
	begin
		case(fn)												// Case to select instruction to perform
			3'b000	:	mem_ALU = reg_A + reg_B;
			3'b001	:	mem_ALU = reg_A - reg_B;
			3'b010	: 	mem_ALU = reg_A * reg_B;
			3'b011	:	mem_ALU = reg_A / reg_B;
			3'b100	:	mem_ALU = reg_A & reg_B;
			3'b101	:	mem_ALU = reg_A | reg_B;
			3'b110	:	;
			3'b111	:	;
			default	:	;
		endcase
	end
endmodule