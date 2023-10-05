module InstructionMemory(i_clk,i_pc,o_readdata);

input i_clk;
input  [31:0] i_pc;

reg [31:0] Imemory [0:1023];

output reg [31:0] o_readdata;

initial 
begin
		$readmemh("test.txt",Imemory);
end


always @ (i_pc)
begin	 
	o_readdata <= Imemory[i_pc>>2]; // 32 bit addressable ,memory
end			
		
endmodule	