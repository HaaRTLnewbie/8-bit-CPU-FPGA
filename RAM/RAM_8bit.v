module RAM_8bit
#(parameter WIDTH = 8)
(
	input		clk,
			prog_en,				// enable high
			wr_en,					// enable high
			rd_en,					// enable high
											
	input		[WIDTH - 1:0]		sw,		// 8-bit input to store to RAM from switches
	
	input		[(WIDTH / 2) - 1:0]	addr,		// 4-bit address from MAR
	
	inout		[WIDTH - 1:0] 		bus		// 8-bit bidirectional bus
);

reg [WIDTH - 1:0] mem_reg [0:15];		     		// Defining 8-bit wide memory with 16 addresses

assign bus = (rd_en) ? mem_reg[addr] : 8'bz;			// Tri-state buffer to set high-impedance to bus if rd_en is low

always @ (posedge clk)
	if (wr_en)
		mem_reg[addr] <= (prog_en) ? sw : bus;		// Choice between bus and switches to write to memory address

endmodule
