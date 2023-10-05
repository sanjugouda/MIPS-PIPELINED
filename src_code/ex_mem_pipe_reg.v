module EX_Mem_reg (i_clk,i_RegWrite, i_MemtoReg,i_MemWrite, 
						i_MemRead,i_ALUresult,i_writedata,i_writeReg,o_RegWriteOut, o_MemtoRegOut,o_MemWriteOut,
						o_MemReadOut,o_ALUresultOut,o_writedataOut,o_writeRegOut);
  
input i_clk;
input i_RegWrite, i_MemtoReg;
input i_MemWrite, i_MemRead; 
input [31:0] i_ALUresult,i_writedata;
input [4:0] i_writeReg;
output reg o_RegWriteOut, o_MemtoRegOut ,o_MemWriteOut, o_MemReadOut;
output reg [31:0] o_ALUresultOut,o_writedataOut;
output reg [4:0] o_writeRegOut;
  
always@(posedge i_clk)
begin
    o_RegWriteOut <= i_RegWrite;
    o_MemtoRegOut <= i_MemtoReg;
    o_MemWriteOut <= i_MemWrite;
    o_MemReadOut <= i_MemRead;
    o_ALUresultOut<=i_ALUresult;
    o_writedataOut<=i_writedata;
    o_writeRegOut<=i_writeReg;
      
end
  
endmodule