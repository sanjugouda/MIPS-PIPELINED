module PC (i_nextPC ,i_reset ,i_clk, i_no_change_pc, o_outPC);

input wire [31:0] i_nextPC;
input i_reset , i_clk, i_no_change_pc;

output reg [31:0] o_outPC;



always @(posedge i_clk)
begin

  if (i_reset)
		begin
			o_outPC <= 32'hFFFFFFFC; // +0x4 will result into 0x0.
		end
		
  else if (i_no_change_pc==0) 
	  begin
			o_outPC <= i_nextPC;
	  end
	  
  else
	  begin
			o_outPC <= o_outPC;
	  end
	
end

endmodule