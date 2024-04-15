// Control Unit still needs to be added //

module CPU_top
// module pin declarations //
(
	input   clk_in,
				  halt,
					clear,
					ram_tog,

	input 	[1:0] alu_sel,
	
	input		[3:0] addr_sel,
	
	input		[7:0] ram_val,
	
	output	[6:0] d0,
						    d1,
						    d2
);

// wire declarations //
wire  [7:0] bus,
					  regA2alu,
					  regB2alu;

wire  clock,
			alu_en,
			ram_wr,
			ram_rd,
			mar_en,
			address,
			reg_A_wr,
			reg_A_rd,
			reg_B_wr,
			reg_B_rd,
			PC_cnt_en,
			PC_out_en,
			seg7_en;

// module instantiations //
clock			  Clock_Ctrl	(.clk_in(clk_in), .clk_out(clock), .hlt(halt));
ALU				  ALU			    (.clk(clock), .bus(bus), .clr(clear), .en(alu_en), .sel(alu_sel), .reg_A(regA2alu), .reg_B(regB2alu));
RAM_8bit	  RAM			    (.clk(clock), .bus(bus), .prog_en(ram_tog), .wr_en(ram_wr), .rd_en(ram_rd), .sw(ram_val), .addr(address));
MAR_4bit	  MAR			    (.clk(clock), .bus(bus), .clr(clear), .prog_en(ram_tog), .reg_en(mar_en), .sw(addr_sel), .addr(address));
reg_8bit	  Reg_A			  (.clk(clock), .bus(bus), .clr(clear), .wr_en(reg_A_wr), .rd_en(reg_A_rd), .reg_out(regA2alu));
reg_8bit	  Reg_B			  (.clk(clock), .bus(bus), .clr(clear), .wr_en(reg_B_wr), .rd_en(reg_B_rd), .reg_out(regB2alu));
prg_cnt		  PC				  (.clk(clock), .bus(bus), .clr(clear), .cnt_en(PC_cnt_en), .out_en(PC_out_en));
bcd_seg_7	  Out_Logic	  (.clk(clock), .bus(bus), .en(seg7_en), .d0(d0), .d1(d1), .d2(d2));

endmodule
