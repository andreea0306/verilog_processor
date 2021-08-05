module sim();

reg clk, nrst;
wire [31:0] out;

top dut(clk, nrst, out);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin 
    nrst = 0;
    #10 nrst = 1;
    
    #1000 $stop();
end

endmodule