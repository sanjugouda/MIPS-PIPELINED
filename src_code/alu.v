module ALU(i_reset,i_data1, i_data2, i_ALUControl, i_shiftAmount, o_overFlow, o_zero, o_ALUResult);

input wire i_reset;
input wire signed [31:0] i_data1,i_data2;
input wire [3:0] i_ALUControl;
input wire [4:0] i_shiftAmount;
output reg o_overFlow, o_zero;
output reg signed [31:0] o_ALUResult;

wire [31:0] w_neg_data2;
assign w_neg_data2 = -i_data2;

parameter ADD = 4'b0000;
parameter SUB = 4'b0001;
parameter AND = 4'b0010;
parameter OR = 4'b0011;
parameter SHFT_L = 4'b0100;
parameter SHFT_R_L = 4'b0101;
parameter SHFT_R_A = 4'b0110;
parameter GREATER = 4'b0111;
parameter LESS = 4'b1000;
parameter NOR = 4'b1001;


always @(i_ALUControl, i_data1, i_data2,i_reset)
begin

if(i_reset)
o_zero = 1'b0;

else if(i_data1 == i_data2)
o_zero = 1'b1;

else
o_zero = 1'b0;

case(i_ALUControl)

ADD: 
	begin	
	
	o_ALUResult = i_data1 + i_data2;
	
	if(i_data1[31] == i_data2[31] && o_ALUResult[31] == ~i_data1[31])
	o_overFlow = 1'b1;
	
	else
	o_overFlow = 1'b0;
	
	end

SUB:
	begin
	
	o_ALUResult = i_data1 + w_neg_data2;
	
	if(i_data1[31] == w_neg_data2[31] && o_ALUResult[31] == ~i_data1[31])
	o_overFlow = 1'b1;
	
	else
	o_overFlow = 1'b0;
	
	end
	
AND:
	o_ALUResult = i_data1 & i_data2;

OR:
	o_ALUResult = i_data1 | i_data2;

SHFT_L:
	o_ALUResult = i_data1 << i_shiftAmount;

SHFT_R_L:
	o_ALUResult = i_data1 >> i_shiftAmount;

SHFT_R_A:
	o_ALUResult = i_data1 >>> i_shiftAmount;

GREATER:
	begin
	
	if(i_data1 > i_data2)
	o_ALUResult = 1;
	
	else
	o_ALUResult = 0;
	
	end

LESS:
	begin
	if(i_data1 < i_data2)
	o_ALUResult = 1;
	
	else
	o_ALUResult = 0;
	
	end

NOR:
	o_ALUResult = ~(i_data1 | i_data2);

endcase

end

endmodule