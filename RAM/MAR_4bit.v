module MAR_4bit
#(parameter WIDTH = 4)
(
	input 	clk, clr, prog_en, reg_en,
	input	[WIDTH - 1:0] sw, bus,
	output	prg,
	output	[WIDTH - 1:0] addr
);

reg [WIDTH - 1:0] mem_addr;

assign addr = (prog_en) ? sw : mem_addr;
assign prg = prog_en;

always @ (posedge clk)
begin
	if (clr) 		mem_addr <= 8'b0;
	else if (reg_en)	mem_addr <= bus;
end

endmodule
