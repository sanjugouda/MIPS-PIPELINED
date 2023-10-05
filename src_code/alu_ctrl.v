module ALUControl(i_ALUOp, i_funct, o_ALUControl);

input [3:0] i_ALUOp;
input [5:0] i_funct;
output [3:0] o_ALUControl;

assign o_ALUControl = 	((i_ALUOp == 4'b0000) ? 4'b0000:
								(i_ALUOp == 4'b0001) ? 4'b0001:
								(i_ALUOp == 4'b0011) ? 4'b0010:
								(i_ALUOp == 4'b0100) ? 4'b0011:
								(i_ALUOp == 4'b0101) ? 4'b1000:
								(i_ALUOp == 4'b0010) ? 
								
								((i_funct == 6'b100000) ? 4'b0000:
								(i_funct == 6'b100010) ? 4'b0001:
								(i_funct == 6'b100100) ? 4'b0010:
								(i_funct == 6'b100101) ? 4'b0011:
								(i_funct == 6'b100111) ? 4'b1001:
								(i_funct == 6'b101010) ? 4'b1000:
								(i_funct == 6'b000000) ? 4'b0100:
								(i_funct == 6'b000010) ? 4'b0101 : 4'bxxxx): 4'bxxxx);

endmodule