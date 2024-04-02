module MAR_4bit
#(parameter WIDTH = 4)
(
	input 	clk, clr, prog_en, reg_en,		// clr, prog_en, and reg_en are enable high
	input	[WIDTH - 1:0] sw, bus,			// 4 input dip switch and 4-bit bus input
	output	prog,					
	output	[WIDTH - 1:0] addr			// 4-bit addr output to RAM module
);

reg [WIDTH - 1:0] mem_addr;

	assign addr = (prog_en) ? sw : mem_addr;	// addr output depends on prog_en
assign prog = prog_en;					// prog_en propagates to RAM module through prog pin
	
	always @ (posedge clk or posedge clr)		// Always block triggering on rising clock edge or clr for asynchronous reset
begin
	if (clr) 		mem_addr <= 8'b0;
	else if (reg_en)	mem_addr <= bus;	// Writes bus value to mem_addr if reg_en is high
end

endmodule
