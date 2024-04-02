module reg_8bit
#(parameter WIDTH = 8)
(
	input		clk, clr, wr_en, rd_en,			// clr, wr_en, and rd_en are enable high
	input		[WIDTH - 1:0] bus_in,			// 8-bit input bus
	output		[WIDTH - 1:0] reg_out, bus_out  	// 8-bit output to ALU and bus
//	inout		[WIDTH - 1:0] bus			// 8-bit bidirectional bus (currently debugging)
);

reg [WIDTH - 1:0] mem_reg;

assign bus_out = (rd_en) ? mem_reg : 8'bz;			// Tri-state buffer to set high-impedance to bus_out if rd_en is low
assign reg_out = mem_reg;					// Drives mem_reg values to the reg_out net

always @ (posedge clk or posedge clr)				// Procedural block triggers on rising edge of clk or clr for asynchronous reset
begin
	if (clr) mem_reg <= 8'b0;
	else if (wr_en) mem_reg <= bus_in;
end
	
endmodule
