module reg_8bit
#(parameter WIDTH = 8)
(
	input		wr_en, rd_en, clk, clr,			// wr_en, rd_en, and clr are enable high
	input		[WIDTH - 1:0] bus_in,			// 8-bit input wire from main bus
  	output		[WIDTH - 1:0] mem_to_alu, bus_out  	// 8-bit output wires to main bus and ALU
//	inout		[WIDTH - 1:0] bus			// 8-bit bidirectional wire to bus (currently debugging)
);

reg [WIDTH - 1:0] mem_reg;	 				// Instantiating 8-bit wide memory

assign bus_out = (rd_en) ? mem_reg : 8'bz;			// If read enable is high, reg values propogate to bus else bus is disconnected
assign mem_to_alu = mem_reg;					// Drives reg values to the mem_out net

always @ (posedge clk or posedge clr)				// Procedural block begins on posedge clk or posedge clr
begin
  if (clr) mem_reg <= 8'b0;				        // Asynchronous reset when clr is high
	else if (wr_en) mem_reg <= bus_in;		        // If write enable is high, store bus values in reg
end
endmodule
