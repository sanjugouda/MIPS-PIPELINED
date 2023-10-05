module Mux2x1_NBits(out, in1, in2, i_sel);

parameter LEN = 5; 

input [LEN-1:0] in1, in2;
input i_sel;

output [LEN-1:0] out;

assign out = 	(i_sel == 1'b0) ? in1 : (i_sel == 1'b1) ? in2 : LEN'bx;

endmodule