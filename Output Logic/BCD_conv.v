module bcd_conv
#( parameter		W = 8)
(
	input        clk, en,
	input        [W-1:0] bus_in,
	output reg   [11:0] bcd
);

integer i, j;

always @ (posedge clk)
if (en)
	begin
		for (i = 0; i <= W+(W-4)/3; i = i + 1) bcd[i] <= 0;
		bcd[W-1:0] <= bus_in;
		for (i = 0; i <= W - 4; i = i + 1)
			for (j = 0; j <= i/3; j = j + 1)
				if (bcd[W-i+4*j -: 4] > 4)
					bcd[W-i+4*j -: 4] <= bcd[W-i+4*j -: 4] + 4'd3;
	end
	
endmodule
