module  Register_file2 #(parameter N=32)(
input clk,
input reset,
input Reg_Write_i,
input [4:0] Write_Register_i,
input [4:0] Read_Register_1_i,
input [4:0] Read_Register_2_i,
input [N-1:0] Write_Data_i,
output [N-1:0] Read_Data_1_o,
output [N-1:0] Read_Data_2_o,
output [2**5-1:0] one
);

wire [2**5-1:0] onehot_code;
wire [2**5-1:0] Q [31:0];

onehot #(.WIDTH(5)) decoder_onehot(.WR(Write_Register_i), .onehot(onehot_code));

genvar i;
generate
	for(i=0;i<=2**5-1; i = i + 1) begin: Counter
		Register #(.WIDTH(N)) Registros(.q(Q[i]), .clk(clk), .reset(reset), .d(Write_Data_i), 
		.enable(onehot_code[i] & Reg_Write_i));
	end
endgenerate

assign Read_Data_1_o = Q[Read_Register_1_i];
assign Read_Data_2_o = Q[Read_Register_2_i];
assign one=onehot_code;

endmodule
