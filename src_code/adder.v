module Adder (o_res ,i_a, i_b);

input wire signed [31:0] i_a, i_b;
output wire [31:0] o_res;

assign o_res = i_a + i_b;

endmodule