module top(
				input clk,		
				input reset,
				output [31:0] out0
);


wire [31:0] w_pc;
wire [31:0] w_instr;
//wire [8:0] w__out;

prog_mem pm (
					.pc(w_pc),
					.clk(clk),
					.instr(w_instr)
);
procesor p (
				.clk(clk),
				.reset(reset),
				.instruction(w_instr),
				.PC(w_pc),
				.out0(out0)
				
);


//sevseg ss(
//				.in(w_out),
//				.out0(out0),
//				.out1(out1)
//);

endmodule
