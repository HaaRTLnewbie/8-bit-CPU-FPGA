module seg_7
(
	input 		  clk,
	input		    [11:0] bcd,
	output reg 	[6:0] d0, d1, d2  	// Output registers to drive 3, 7-seg displays
);

localparam	ZERO	= 7'b1111110,
		        ONE	= 7'b0110000,
		        TWO	= 7'b1101101,
		        THREE	= 7'b1111001,
		        FOUR	= 7'b0110011,
		        FIVE	= 7'b1011011,
		        SIX	= 7'b1011111,
		        SEVEN	= 7'b1110000,
		        EIGHT	= 7'b1111111,
		        NINE	= 7'b1111011;

always @ (posedge clk)
begin
	case(bcd[3:0])
		4'd0	: d0 <= ZERO;
		4'd1	: d0 <= ONE;
		4'd2	: d0 <= TWO;
		4'd3	: d0 <= THREE;
		4'd4	: d0 <= FOUR;
		4'd5	: d0 <= FIVE;
		4'd6	: d0 <= SIX;
		4'd7	: d0 <= SEVEN;
		4'd8	: d0 <= EIGHT;
		4'd9	: d0 <= NINE;
		default	: d0 <= 7'bx;	
	endcase
	
	case(bcd[7:4])
		4'd0	: d1 <= ZERO;
		4'd1	: d1 <= ONE;
		4'd2	: d1 <= TWO;
		4'd3	: d1 <= THREE;
		4'd4	: d1 <= FOUR;
		4'd5	: d1 <= FIVE;
		4'd6	: d1 <= SIX;
		4'd7	: d1 <= SEVEN;
		4'd8	: d1 <= EIGHT;
		4'd9	: d1 <= NINE;
		default	: d1 <= 7'bx;	
	endcase
	
	case(bcd[11:8])
		4'd0	: d2 <= ZERO;
		4'd1	: d2 <= ONE;
		4'd2	: d2 <= TWO;
		4'd3	: d2 <= THREE;
		4'd4	: d2 <= FOUR;
		4'd5	: d2 <= FIVE;
		4'd6	: d2 <= SIX;
		4'd7	: d2 <= SEVEN;
		4'd8	: d2 <= EIGHT;
		4'd9	: d2 <= NINE;
		default	: d2 <= 7'bx;	
	endcase

end

endmodule
