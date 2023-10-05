module IF_ID_reg(i_clk, i_PCplus4, i_instrIn, i_no_change, i_IF_flush, o_instrOut, o_PCplus4Out);

input wire [31:0] i_instrIn,i_PCplus4;
input i_clk ,i_no_change,i_IF_flush;
output reg [31:0] o_instrOut, o_PCplus4Out;

always @(posedge i_clk)
 begin
	
	if (i_no_change==1'b0) 
	begin	
	
	o_PCplus4Out<=i_PCplus4;	 
	o_instrOut <= i_instrIn;
		 
	end
	
	else if (i_IF_flush==1'b1)
	begin
	
	o_PCplus4Out<=i_PCplus4; 
	o_instrOut<=32'b0;
	
	end
	
	
 end

endmodule