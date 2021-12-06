module Sign_Extend

(input [15:0] d,
output [31:0] q);

assign q = d[15]? {{16{1'b1}},d} : {{16{1'b0}},d};

endmodule 