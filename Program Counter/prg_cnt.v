module prg_cnt
#(parameter WIDTH = 4)
(
	input		clk,
				  clr,
				  cnt_en,
				  out_en,

	inout		[WIDTH - 1:0] bus
);

reg [WIDTH - 1:0] count;

assign bus = (out_en) ? count : 4'bz;

always @ (posedge clk)
begin
	if (!clr)		count <= 4'b0;
	else if (cnt_en)	count <= count + 1;
end

endmodule
