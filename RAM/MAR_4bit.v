module MAR_4bit
#(parameter WIDTH = 4)
(
	input 	clk, clr, prog_en, reg_en,		// clr, prog_en, and reg_en are enable high
	input	[WIDTH - 1:0] sw, bus,			// 4 input dip switch and 4-bit bus input
	output	prog,					
	output	[WIDTH - 1:0] addr			// 4-bit addr output to RAM module
);

reg [WIDTH - 1:0] mem_addr;

assign addr = (prog_en) ? sw : mem_addr;
assign prog = prog_en;					// Drives prog_en to the prog net to go to RAM module
	
	always @ (posedge clk or posedge clr)		// Procedural block triggering on rising edge of clk or clr for asynchronous reset
begin
	if (clr) 		mem_addr <= 8'b0;
	else if (reg_en)	mem_addr <= bus;
end

endmodule
