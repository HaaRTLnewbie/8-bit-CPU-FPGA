module ALU8bit
#(parameter REG_WIDTH = 8)
(
input		clk, clr, en,
input		[2:0]fn,
input		[REG_WIDTH - 1:0]reg_A, reg_B,
output	[REG_WIDTH - 1:0]bus
);

reg [7:0]mem_ALU; // Defining a single 8-bit wide memory

assign bus = en ? mem_ALU : 8'bz;

always @ (posedge clk)
	begin
		case(fn)
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