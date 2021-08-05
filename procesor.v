`include "def.v"

module procesor (	
						input clk,
						input reset,
						input [31:0] instruction,
						output reg [31:0] PC,
						output reg [31:0] out0
					  );
					  
reg [31:0] rf[0:127];
reg [31:0] memory[0:2047];

reg ZF;

initial begin
	$readmemh("/home/andreea/Aplicatii CID/procesor/memory.mem", memory, 0, 2047);
end

initial begin
	$readmemh("/home/andreea/Aplicatii CID/procesor/regs.mem", rf, 0, 127);
end

initial begin
    out0 <= 32'h0;
end


always @ (posedge clk)
	begin
		case(instruction[31:24])
			`LOAD : begin
							rf[instruction[23:16]] <= memory[instruction[15:0]];
							//$dispay("r=%d", rf[instruction[26:18]]);
					  end
//			`LOADC : begin
//							rf[instruction[26:18]] <= instruction[17:0];
//							$dispay("r=%d", rf[instruction[26:18]]);
//						end
			`STORE : begin
							memory[instruction[15:0]] <= rf[instruction[23:16]];  // STORE r0 0x...
							//$dispay("r=%d", rf[instruction[26:18]]);
						end

			`ADD : begin
						rf[instruction[23:16]] <= rf[instruction[15:8]] + rf[instruction[7:0]];
						//$dispay("r2=%d r1=%d r0=%d", rf[instruction[26:18]],rf[instruction[17:9]],rf[instruction[8:0]]);
					 end
			`SUB : begin
						rf[instruction[23:16]] <= rf[instruction[15:8]] - rf[instruction[7:0]];
						ZF <= rf[instruction[23:16]] == 0 ? 1'b1 : 1'b0;
						//$display("r2=%d r1=%d r0=%d ZF=%b", rf[instruction[26:18]],rf[instruction[17:9]],rf[instruction[8:0]],ZF);
					  end
			`MUL : begin
						rf[instruction[23:16]] <= rf[instruction[15:8]] * rf[instruction[7:0]];
						//$display("r2=%d r1=%d r0=%d", rf[instruction[26:18]],rf[instruction[17:9]],rf[instruction[8:0]]);
					 end
			`DIV : begin
						rf[instruction[23:16]] <= rf[instruction[15:8]] / rf[instruction[7:0]];
						//$display("r2=%d r1=%d r0=%d", rf[instruction[26:18]],rf[instruction[17:9]],rf[instruction[8:0]]);
					 end
			`AND : begin
						rf[instruction[23:16]] <= rf[instruction[15:8]] & rf[instruction[7:0]];
						//$display("r2=%d r1=%d r0=%d", rf[instruction[26:18]],rf[instruction[17:9]],rf[instruction[8:0]]);
					end
			`OR : begin
						rf[instruction[23:16]] <= rf[instruction[15:8]] | rf[instruction[7:0]];
						//$display("r2=%d r1=%d r0=%d", rf[instruction[26:18]],rf[instruction[17:9]],rf[instruction[8:0]]);
					end
			`XOR : begin
						rf[instruction[23:16]] <= rf[instruction[15:8]] ^ rf[instruction[7:0]];
						//$display("r2=%d r1=%d r0=%d", rf[instruction[26:18]],rf[instruction[17:9]],rf[instruction[8:0]]);
					end
			`RSHIFT : begin
							rf[instruction[23:16]] <= rf[instruction[15:8]] >> rf[instruction[7:0]];
							//$display("r2=%d r1=%d r0=%d", rf[instruction[26:18]],rf[instruction[17:9]],rf[instruction[8:0]]);
						end
			`LSHIFT : begin
							rf[instruction[23:16]] <= rf[instruction[15:8]] << rf[instruction[7:0]];
							//$display("r2=%d r1=%d r0=%d", rf[instruction[26:18]],rf[instruction[17:9]],rf[instruction[8:0]]);
						end
						
			`OUT : begin
						out0 <= rf[instruction[23:16]];
						//out <= rf[instruction[26:18]];
					 end
			`NOP: begin end
		endcase
		 
	end

always @ (posedge clk)
	begin
		if(reset == 0) begin
								PC <= 0;
								//$display("PC=%d",PC);
							end
		else if (instruction[31:24] == `JMP)begin
															PC <= instruction[23:0];
															//$display("PC=%d",PC);
														end
		else if (instruction[31:24] == `JMPE && ZF == 1)  begin
																				PC <= instruction[23:0];
																				//$display("PC=%d",PC);
																			end
		else if (instruction[31:24] == `JMPNE && ZF == 0)  begin
																				PC <= instruction[23:0];
																				//$display("PC=%d",PC);
																			end
		else if(instruction[31:24] == `HLT) begin
															PC <= PC;
															//$display("PC=%d",PC);
														end
		else begin
					PC <= PC + 1;
					//$display("PC=%d",PC);
					end
	end



					  
endmodule












