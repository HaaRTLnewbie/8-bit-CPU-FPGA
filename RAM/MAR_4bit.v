module MAR_4bit
#(parameter WIDTH = 4)
(
	input	clk,
		clr,					// enable high
		prog_en,				// enable high
		reg_en,					// enable high
				
	input	[WIDTH - 1:0] sw,			// 4 input dip switch
	
	input	[WIDTH - 1:0] bus,			// 4-bit bus input
		
	output	[WIDTH - 1:0] addr			// 4-bit addr output to RAM module
);

reg [WIDTH - 1:0] mem_addr;

assign addr = (prog_en) ? sw : mem_addr;
	
always @ (posedge clk or posedge clr)			// Procedural block triggering on rising edge of clk or clr for asynchronous reset
begin
	if (clr) 		mem_addr <= 4'b0;
	else if (reg_en)	mem_addr <= bus;
end

endmodule
