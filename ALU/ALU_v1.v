module ALU_8bit
#(parameter WIDTH = 8)
(
input		clk, clr, en,										  //Clock, clear, and enable are 
input		[1:0] sel,											  //Select signal to choose operation to execute
input		[WIDTH - 1:0] reg_A, reg_B,			  //8-bit inputs directly from register A and B
inout		[WIDTH - 1:0] bus_io
);

localparam	ADD	=	2'b00,								  //Parameterising names for the opcodes
			    	SUB	=	2'b01,
			    	MLT	=	2'b10,
			    	DIV	=	2'b11;

reg [WIDTH - 1:0] ALU_reg;							  //Defining a single 8-bit wide memory

assign bus = en ? ALU_reg : 8'bz;				  //Only outputs register to the bus when enable is high

always @ (posedge clk)
	begin
    case(sel)												      //Case to select instruction
			ADD		:	ALU_reg = reg_A + reg_B;
			SUB		:	ALU_reg = reg_A - reg_B;
			MLT		: 	ALU_reg = reg_A * reg_B;
			DIV		:	ALU_reg = reg_A / reg_B;
		endcase													      //Default not required as all states are considered
	end
endmodule
