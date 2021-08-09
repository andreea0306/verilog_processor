module top(
	input clk,		
	input reset,
	output [31:0] out0
);


wire [31:0] w_pc;
wire [31:0] w_instr;
wire w_ZF, w_CF;

prog_mem pm (
	.pc(w_pc),
	.clk(clk),
	.instr(w_instr)
);
procesor p (
	.clk(clk),
	.instruction(w_instr),
	.ZF(w_ZF),
	.CF(w_CF),
	.out0(out0)
				
);

PC pc (
	.clk(clk),
	.reset(reset),
	.ZF(w_ZF),
	.instruction(w_instr),
	.PC(w_pc)
);
endmodule
