module register_test;
	reg clear, write, read, clock;
	reg [7:0] bus_drive;
	wire [7:0] bus, reg_val;
		
	reg_8bit Reg_A(.clr(clear), .wr_en(write), .rd_en(read), .clk(clock), .bus(bus), .mem_out(reg_val));

	task exp_reg;
	input [7:0] exp_r;
	if (reg_val !== exp_r)
		begin
			$display("TEST FAILED");
			$display("reg_val should be %b", exp_r);
			$finish;
		end
	endtask
		
	task exp_bus;
	input [7:0] exp_b;
	if (bus !== exp_b)
		begin
			$display("TEST FAILED");
			$display("bus should be %b", exp_b);
			$finish;
		end
	endtask
	
	task disp;
			$display ("at time %0d: clear = %b | write = %b | read = %b | bus = %b | reg_val = %b", $time, clear, write, read, bus, reg_val);
	endtask
	
	assign bus = bus_drive;
	
	initial	clock = 0;
	always #5 clock = !clock;
	
	initial @ (negedge clock)
		begin
			clear = 1;	write = 1; read = 1; bus_drive = 8'b10001110; @ (negedge clock) begin disp; exp_bus(8'b00000000); 	exp_reg(8'b00000000);end
			clear = 1;	write = 0; read = 0; bus_drive = 8'b10001111; @ (negedge clock) begin disp; exp_bus(8'bzzzzzzzz); 	exp_reg(8'b00000000);end
			clear = 1;	write = 0; read = 1; bus_drive = 8'b10001111; @ (negedge clock) begin disp; exp_bus(8'b00000000); 	exp_reg(8'b00000000);end
			clear = 1;	write = 1; read = 0; bus_drive = 8'b10001111; @ (negedge clock) begin disp; exp_bus(8'bzzzzzzzz); 	exp_reg(8'b00000000);end
			clear = 0;	write = 1; read = 1; bus_drive = 8'b10001100; @ (negedge clock) begin disp; exp_bus(8'b10001100); 	exp_reg(8'b10001100);end
			clear = 0;	write = 1; read = 0; bus_drive = 8'b11001111; @ (negedge clock) begin disp; exp_bus(8'bzzzzzzzz); 	exp_reg(8'b11001111);end
			clear = 0;	write = 0; read = 1; bus_drive = 8'b10000011; @ (negedge clock) begin disp; exp_bus(8'b11001111);  exp_reg(8'b11001111);end
			clear = 0;	write = 0; read = 0; bus_drive = 8'b10011011; @ (negedge clock) begin disp; exp_bus(8'b11001111); 	exp_reg(8'b11001111);end
			$display ("TEST PASSED");
			$finish;
		end

endmodule