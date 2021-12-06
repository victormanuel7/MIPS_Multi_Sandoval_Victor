
module onehot #(parameter WIDTH = 5) (
    input [WIDTH-1:0] WR,
    output [2**WIDTH-1:0] onehot
);

assign onehot[0]=1'b0;

    generate
        genvar i;
        for(i=1; i<=2**WIDTH-1; i=i+1) begin: gen_onehot
				assign onehot[i] = (WR == i);
        end
    endgenerate

endmodule
