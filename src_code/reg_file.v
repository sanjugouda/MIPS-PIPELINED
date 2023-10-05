module RegisterFile(i_Clk,i_reset,i_ReadReg1,  i_ReadReg2, i_WriteReg, i_WriteData, i_RegWrite, 
							o_ReadData1, o_ReadData2 );


input [4:0] i_ReadReg1 ,i_ReadReg2 ,i_WriteReg;
input [31:0] i_WriteData;
input i_RegWrite ,i_Clk, i_reset;


output reg [31:0] o_ReadData1 ,o_ReadData2;

integer k;

reg [31:0] memory[0:31];

always @(i_ReadReg1, i_ReadReg2, i_reset)

begin
	if(i_reset)
	begin
		for(k=0;k<32;k=k+1)
		begin
			memory[k] = 32'd0;
		end
	end
	
	else
	begin
		
		o_ReadData1 = memory[i_ReadReg1];
		o_ReadData2 = memory[i_ReadReg2];
	end
	
end

always @(negedge i_Clk)
begin
	if (i_RegWrite == 1)
	begin
		 memory[i_WriteReg] <= i_WriteData;
	end
end

endmodule