module bcd_conv									// BCD converter using double dabble algorithm
#(parameter W = 8)
(
	input 	clk,
		en,
	
	input	[W - 1:0]	bus_in,
	
	output 	reg [11:0]	bcd
);

integer i;

always @ (posedge clk)
if (en)
	begin
		bcd[W-1:0] <= bus_in;		 				// Writes bus values to bcd from RHS
		for (i=0; i<W; i=i+1)						// Iterate through each input bit
		begin								// If any BCD digit is >= 5, add three
			if (bcd[3:0] >= 5)	bcd[3:0]  <= bcd[3:0]  + 4'd3;	
			if (bcd[7:4] >= 5)	bcd[7:4]  <= bcd[7:4]  + 4'd3;
			if (bcd[11:8] >= 5)	bcd[11:8] <= bcd[11:8] + 4'd3;
		end
	end
	
endmodule
