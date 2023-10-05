module ID_EX_reg (i_clk,i_RegWrite, i_MemtoReg, i_MemWrite, i_MemRead,i_ALUSrc, i_ALUOp, 
					i_RegDst, i_PCplus4 ,i_ReadData1_in ,i_ReadData2_in,i_SignExtendResult_in,
					i_regAddresss_in ,o_PCplus4out ,o_ReadData1_out ,o_ReadData2_out ,i_SignExtendResult_out, 
					o_rsOut ,o_rtOut ,o_rdOut, o_RegWriteOut,o_MemtoRegOut,o_MemWriteOut, 
					o_MemReadOut,o_ALUSrcOut, o_ALUOpOut, o_RegDstOut);

input wire i_RegWrite, i_MemtoReg;
input wire i_MemWrite, i_MemRead; 
input wire i_ALUSrc, i_RegDst;
input wire [3:0] i_ALUOp;
input wire [31:0] i_PCplus4 ,i_ReadData1_in ,i_ReadData2_in ,i_SignExtendResult_in;
input wire [14:0] i_regAddresss_in;
input wire i_clk;



output reg o_RegWriteOut, o_MemtoRegOut;
output reg o_MemWriteOut, o_MemReadOut;
output reg o_ALUSrcOut, o_RegDstOut;
output reg [3:0] o_ALUOpOut;
output reg [31:0] o_PCplus4out ,o_ReadData1_out ,o_ReadData2_out ,i_SignExtendResult_out;
output reg [4:0] o_rsOut ,o_rtOut ,o_rdOut;


always @(posedge i_clk)
 begin
	o_PCplus4out <= i_PCplus4;
	o_ReadData1_out <= i_ReadData1_in;
	o_ReadData2_out <= i_ReadData2_in;
	i_SignExtendResult_out <= i_SignExtendResult_in;
	o_rsOut <= i_regAddresss_in[14:10];
	o_rtOut <= i_regAddresss_in[9:5];
	o_rdOut <= i_regAddresss_in[4:0];
	o_RegWriteOut <= i_RegWrite;
	o_MemtoRegOut <= i_MemtoReg;
	o_MemWriteOut <= i_MemWrite;
	o_MemReadOut <= i_MemRead;
	o_ALUSrcOut <= i_ALUSrc;
	o_ALUOpOut <= i_ALUOp;
	o_RegDstOut <= i_RegDst;
 end

endmodule