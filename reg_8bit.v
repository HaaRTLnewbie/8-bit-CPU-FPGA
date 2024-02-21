module reg_8bit									// Memory module that will store values between operations
#(parameter WIDTH = 8)
(
	input		wr_en, rd_en, clk, clr,			// wr_en, rd_en, and clr are enable high
	output	[WIDTH - 1:0]mem_out,			// 8-bit wire to ALU module
	inout		[WIDTH - 1:0]bus					// 8-bit bidirectional wire to main bus
);

reg [WIDTH - 1:0]mem_reg;	 					// Instantiating 8-bit wide memory called mem_reg

assign bus = (!rd_en) ? mem_reg : 8'bz;	// If read enable is high, reg values propogate to bus else bus is disconnected
assign mem_out = mem_reg;						// Drives reg values to the mem_out net

//Sequential combinational logic

always @ (posedge clk or posedge clr)		// Procedural block begins on posedge clk or posedge clr
	begin
		if (clr)	mem_reg <= 8'b0;				// Asynchronous reset when clr is high
		else if (!wr_en) mem_reg <= bus;		// If write enable is high, store bus values in reg
	end
endmodule