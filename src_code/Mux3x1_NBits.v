module Mux3x1_NBits(out, in1, in2, in3, i_sel);

parameter LEN = 32;

input [LEN-1:0] in1, in2, in3;
input [LEN-1:0] i_sel;

output [LEN-1:0]out;

assign out = (i_sel == 2'b00) ? in1 : (i_sel == 2'b01) ? in2 : (i_sel == 2'b10) ? in3 : LEN'bx;

endmodule