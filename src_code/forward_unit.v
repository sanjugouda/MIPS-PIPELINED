module ForwardingUnit(i_EX_MemRegwrite,i_EX_MemWriteReg,i_Mem_WbRegwrite,
							 i_Mem_WbWriteReg,i_ID_Ex_Rs,i_ID_Ex_Rt,
							 o_upperMux_sel,o_lowerMux_sel, o_comparatorMux1Selector,o_comparatorMux2Selector);
  
input i_EX_MemRegwrite, i_Mem_WbRegwrite;
input [4:0] i_EX_MemWriteReg , i_Mem_WbWriteReg, i_ID_Ex_Rs, i_ID_Ex_Rt;
output reg [1:0] o_upperMux_sel, o_lowerMux_sel;
output reg [1:0] o_comparatorMux1Selector,o_comparatorMux2Selector; 

always@(*)

begin
if(i_EX_MemRegwrite && i_EX_MemWriteReg)  //forwarding from ALU to ALU & from ALU to ID stage
begin
 if (i_EX_MemWriteReg==i_ID_Ex_Rs)
	begin
	
	o_upperMux_sel=2'b10;
	o_comparatorMux1Selector=2'b01;
	end
 else //no forwarding
 begin
 o_upperMux_sel=2'b00;
 o_comparatorMux1Selector=2'b00;
 end
	
 if(i_EX_MemWriteReg==i_ID_Ex_Rt)
	  begin
	o_lowerMux_sel=2'b10;
	o_comparatorMux2Selector=2'b01;
	  end
 else //no forwarding
 begin
 o_lowerMux_sel=2'b00;
 o_comparatorMux2Selector=2'b00;
 end
	
end

else if (i_Mem_WbRegwrite && i_Mem_WbWriteReg) //forwarding from Mem stage to ALU & from Mem stage to ID stage including double data hazard
begin
 if ((i_Mem_WbWriteReg==i_ID_Ex_Rs) && (i_EX_MemWriteReg!=i_ID_Ex_Rs))
	begin
	o_upperMux_sel=2'b01;
	o_comparatorMux1Selector=2'b10;
	end
 else //no forwarding
 begin
 o_upperMux_sel=2'b00;
 o_comparatorMux1Selector=2'b00;
 end
	

	
 if((i_Mem_WbWriteReg==i_ID_Ex_Rt) && (i_EX_MemWriteReg!=i_ID_Ex_Rt) )
 begin
	o_lowerMux_sel=2'b01;
	o_comparatorMux2Selector=2'b10;
 end

 else //no forwarding
 begin
 o_lowerMux_sel=2'b00;
 o_comparatorMux2Selector=2'b00;
 end
 
end

else    //No forwarding
begin
				 o_upperMux_sel=2'b00;
				 o_lowerMux_sel=2'b00;
				 o_comparatorMux1Selector=2'b00;
				 o_comparatorMux2Selector=2'b00;

 
end
end

endmodule