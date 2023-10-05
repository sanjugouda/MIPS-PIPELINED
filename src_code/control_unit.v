module ControlUnit (i_opcode,i_reset,o_RegDst,o_branch,o_Memread,o_MemtoReg,
							o_ALUop,o_MemWrite,o_AluSrc,o_RegWrite);
  
  input [5:0] i_opcode;
  input i_reset;
  output reg o_RegDst,o_branch,o_Memread,o_MemtoReg,o_MemWrite,o_AluSrc,o_RegWrite;
  output reg [3:0] o_ALUop;
  
  
  parameter R_type=6'b000000;
  parameter lw=6'b100011;
  parameter sw=6'b101011;
  parameter beq=6'b000100;
  parameter addi = 6'b001000; 
  parameter andi = 6'b001100; 
  parameter ori = 6'b001101;
  parameter slti = 6'b001010;

  always@(i_opcode,i_reset)
    begin
	 
		if(i_reset)
		begin
			o_RegDst = 1'b0;
			o_branch = 1'b0;
			o_Memread = 1'b0;
			o_MemtoReg = 1'b0;
			o_ALUop = 4'b0000;
			o_MemWrite = 1'b0;
			o_AluSrc = 1'b0;
			o_RegWrite = 1'b0;
		end
		
      case (i_opcode)

        R_type:           

          begin
          o_RegDst=1 ;
          o_branch=0 ;
          o_Memread=0 ;
          o_MemtoReg=0 ;
          o_MemWrite=0 ;
          o_AluSrc=0 ;
          o_RegWrite=1 ;
          o_ALUop=4'b0010 ;
          end
          
          
        
        lw:           

          begin
          o_RegDst=0 ;
          o_branch=0 ;
          o_Memread=1 ;
          o_MemtoReg=1 ;
          o_MemWrite=0 ;
          o_AluSrc=1 ;
          o_RegWrite=1 ;
          o_ALUop=4'b0000 ;
          end
         
        
        sw:           

          begin
          //o_RegDst=1'bx ;
          o_branch=0 ;
          o_Memread=0 ;
          o_MemtoReg=0 ;
          o_MemWrite=1 ;
          o_AluSrc=1 ;
          o_RegWrite=0 ;
          o_ALUop=4'b0000 ;
          end
          
        beq:           

          begin
          //o_RegDst=1'bx ;
          o_branch= 1;
          o_Memread=0 ;
          o_MemtoReg=0 ;
          o_MemWrite=0 ;
          o_AluSrc=0 ;
          o_RegWrite=0 ;
          o_ALUop=4'b0001 ;
          end

	addi:           

          begin
          o_RegDst=0 ;
          o_branch=0 ;
          o_Memread=0 ;
          o_MemtoReg=0 ;
          o_MemWrite=0 ;
          o_AluSrc=1 ;
          o_RegWrite=1 ;
          o_ALUop=4'b0000 ;
          end

	andi:           

          begin
          o_RegDst=0 ;
          o_branch=0 ;
          o_Memread=0 ;
          o_MemtoReg=0 ;
          o_MemWrite=0 ;
          o_AluSrc=1 ;
          o_RegWrite=1 ;
          o_ALUop=4'b0011 ;
          end

	ori:           

          begin
          o_RegDst=0 ;
          o_branch=0 ;
          o_Memread=0 ;
          o_MemtoReg=0 ;
          o_MemWrite=0 ;
          o_AluSrc=1 ;
          o_RegWrite=1 ;
          o_ALUop=4'b0100 ;
          end

	slti:           

          begin
          o_RegDst=0 ;
          o_branch=0 ;
          o_Memread=0 ;
          o_MemtoReg=0 ;
          o_MemWrite=0 ;
          o_AluSrc=1 ;
          o_RegWrite=1 ;
          o_ALUop=4'b0101 ;
          end
			 
	default :
			 begin
			 o_RegDst = 1'b0;
			 o_branch = 1'b0;
			 o_Memread = 1'b0;
			 o_MemtoReg = 1'b0;
			 o_ALUop = 4'b0000;
			 o_MemWrite = 1'b0;
			 o_AluSrc = 1'b0;
			 o_RegWrite = 1'b0;
			 end
		
      endcase
      
    end
  
  
endmodule