`include "def.v"

module PC ( 
	input [31:0] instruction,
	input reset,
	input clk,
	input ZF,
	output reg [31:0] PC
);



always @ (posedge clk)begin

	if(reset == 0) begin
	PC <= 0;
end
	else if (instruction[31:24] == `JMP)begin
	PC <= instruction[23:0];
end
	else if (instruction[31:24] == `JMPE && ZF == 1)  begin
	PC <= instruction[23:0];
end
	else if (instruction[31:24] == `JMPNE && ZF == 0)  begin
	PC <= instruction[23:0];
end
	else if(instruction[31:24] == `HLT) begin
	PC <= PC;
end
	else begin
	PC <= PC + 1;
end
end				  
endmodule
