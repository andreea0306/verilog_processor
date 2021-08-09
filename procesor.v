`include "def.v"

module procesor (	
	input clk,
	input [31:0] instruction,
	output reg [31:0] out0,
	output reg ZF, CF
);
					  
reg [31:0] rf[0:127];
reg [31:0] memory[0:2047];


initial begin
	$readmemh("/home/andreea/Aplicatii CID/procesor/memory.mem", memory, 0, 2047);
end

initial begin
	$readmemh("/home/andreea/Aplicatii CID/procesor/regs.mem", rf, 0, 127);
end

initial begin
    out0 <= 32'h0;
end


always @ (posedge clk)begin
	case(instruction[31:24])
	`LOAD : begin
	rf[instruction[23:16]] <= memory[instruction[15:0]];
end
	`STORE : begin
	memory[instruction[15:0]] <= rf[instruction[23:16]];  // STORE r0 0x...
end
	`ADD : begin
	{CF,rf[instruction[23:16]]} <= rf[instruction[15:8]] + rf[instruction[7:0]];
end
	`SUB : begin
	rf[instruction[23:16]] <= rf[instruction[15:8]] - rf[instruction[7:0]];
	ZF <= rf[instruction[23:16]] == 0 ? 1'b1 : 1'b0;
end
	`MUL : begin
	rf[instruction[23:16]] <= rf[instruction[15:8]] * rf[instruction[7:0]];
end
	`DIV : begin
	rf[instruction[23:16]] <= rf[instruction[15:8]] / rf[instruction[7:0]];
end
	`AND : begin
	rf[instruction[23:16]] <= rf[instruction[15:8]] & rf[instruction[7:0]];
end
	`OR : begin
	rf[instruction[23:16]] <= rf[instruction[15:8]] | rf[instruction[7:0]];
end
	`XOR : begin
	rf[instruction[23:16]] <= rf[instruction[15:8]] ^ rf[instruction[7:0]];
end
	`RSHIFT : begin
	rf[instruction[23:16]] <= rf[instruction[15:8]] >> rf[instruction[7:0]];
end
	`LSHIFT : begin
	rf[instruction[23:16]] <= rf[instruction[15:8]] << rf[instruction[7:0]];
end						
	`OUT : begin
	out0 <= rf[instruction[23:16]];
end
	`NOP: begin end
endcase
		 
end				  
endmodule












