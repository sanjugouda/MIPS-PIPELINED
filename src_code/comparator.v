module Comparator(i_a ,i_b ,o_equal);

input [31:0]  i_a;
input [31:0]  i_b;
output o_equal;

assign o_equal = (i_a == i_b) ? 1'b1 : 1'b0;

endmodule