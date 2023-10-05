module mips_32_pipelined_tb();

reg clk, reset;
mips_32_pipelined DUT(clk, reset);

always@(clk)
#10 clk <= ~clk;

initial
begin

clk <= 0;
reset <= 1;
#50
reset <= 0;


#300 $finish;
end

endmodule
