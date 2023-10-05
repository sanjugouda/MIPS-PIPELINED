module Mem_Wb_reg(i_clk,i_RegWrite, i_MemtoReg,i_ALUresult,
					i_readData,i_writeReg,o_RegWriteOut,o_MemtoRegOut,o_i_readDataOut,o_ALUresultOut,o_ALUresult);

input i_clk;
input i_RegWrite, i_MemtoReg;
input [4:0] i_writeReg;
input [31:0] i_ALUresult, i_readData;
output reg o_RegWriteOut, o_MemtoRegOut;
output reg [31:0] o_i_readDataOut,o_ALUresultOut;
output reg [4:0] o_ALUresult;

always@(posedge i_clk)
begin
	o_RegWriteOut<=i_RegWrite;
	o_MemtoRegOut<=i_MemtoReg;
	o_i_readDataOut<=i_readData;
	o_ALUresultOut<=i_ALUresult;
	o_ALUresult<=i_writeReg;
	
end


endmodule