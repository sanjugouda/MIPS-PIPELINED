module DataMemory (i_clk,i_MemWrite,i_Memread,i_address,i_writeData,o_readData);


input i_MemWrite,i_Memread,i_clk;
input [31:0] i_address,i_writeData;
output reg [31:0] o_readData;
  
reg[31:0] memory [0:31];

always@(negedge i_clk) // writing in the first half of the cycle.
begin
   if(i_MemWrite==1)
      memory[i_address]<=i_writeData;
end
  
always@(i_address or i_Memread)
begin
  if(i_Memread==1)
     o_readData=memory[i_address];
end

endmodule