`include "def.v"

module prog_mem (
	input [31:0] pc,
	input clk,
	output reg [31:0] instr

);

always @(posedge clk) begin
	 case(pc)
	 
    0: instr <= {`LOAD, `r0, 16'b0};
	 1: instr <= {`STORE, `r0, 16'h0001};
	 2: instr <= {`HLT, 24'b0};
	 
	 endcase
end

endmodule
