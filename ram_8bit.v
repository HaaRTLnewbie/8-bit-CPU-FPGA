module ram_8bit												// RAM module that will store all instruction sequence to be read from
#(parameter WIDTH = 8)
(
	input		wr_en, rd_en, clk,
	input		[(WIDTH / 2) - 1:0]addr,					// Address select input from MAR
	inout		[WIDTH - 1:0]bus,								// 8-bit bidirectional wire to main bus
	output	[WIDTH - 1:0]mem_out
);

reg [WIDTH - 1:0] mem_reg [WIDTH / 2 - 0:1];			// Instantiating 8-bit wide memory with 16 addresses

assign bus = (rd_en) ? mem_reg[addr] : 8'bz;			// If read enable is high, reg values propogate to bus else bus is disconnected
assign mem_out = mem_reg[addr];

//Sequential combinational logic

always @ (posedge clk)										// Procedural block begins on posedge clk
		if (wr_en) mem_reg[addr] <= bus;					// If write enable is high, store bus values in reg
endmodule