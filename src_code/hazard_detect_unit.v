module HazardDetectionUnit(i_ID_ExMemRead,i_EX_MemMemRead,i_ID_Ex_Rt,i_IF_ID_Instr,
								o_no_change_pc,o_no_change_IF_ID,o_muxSelector);

input i_ID_ExMemRead,i_EX_MemMemRead;
input [4:0] i_ID_Ex_Rt;
input [31:0] i_IF_ID_Instr;
output reg o_no_change_pc, o_no_change_IF_ID, o_muxSelector;

parameter beqOPcode=6'b000100;

always@(*)
 begin
	if (i_ID_ExMemRead && (o_no_change_pc == 1'b0) && (o_no_change_IF_ID == 1'b0))
	  begin
		 if(i_ID_Ex_Rt==i_IF_ID_Instr[25:21] || i_ID_Ex_Rt==i_IF_ID_Instr[20:15] )
			begin
			  o_no_change_pc=1;
			  o_no_change_IF_ID=1;
			  o_muxSelector=1;
			end
	  end
	else if((i_IF_ID_Instr [31:26]==beqOPcode) && (o_no_change_pc == 1'b0) && (o_no_change_IF_ID == 1'b0))
	  begin
		 o_no_change_pc=1;
		 o_no_change_IF_ID=1;
		 o_muxSelector=1;
	  end
		 
	else
	  begin
		 o_no_change_pc=0;
		 o_no_change_IF_ID=0;
		 o_muxSelector=0;     
	  end    
	
 end


endmodule