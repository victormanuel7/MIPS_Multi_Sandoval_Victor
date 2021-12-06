module ALU (y, a, b, c_in, select);		 // ARITHMETIC UNIT

parameter WIDTH = 3;

output 	[WIDTH: 0] 	y;
input		[WIDTH-1: 0]	a, b;
input					c_in;
input		[2: 0]	select;
reg		[WIDTH: 0]	y;

always @ (*)
begin
y= 32'b0;
case ({select, c_in})//Para FPGA usar ~c_in para Simulacion usar c_in
4'b000_0:	y = a;
4'b000_1:	y = a + 1'b1;
4'b001_0:	y = a + b;
4'b001_1:	y = a + b + 1'b1;
4'b010_0:	y = a + {1'b0,~b};
4'b010_1:	y = a + ({1'b0,~b}) + 1'b1;
4'b011_0:	y = {1'b0,a} - 1'b1;
4'b011_1:	y = b;
4'b100_0:	y = {1'b0,a & b};
4'b100_1:	y = {1'b0,a | b};
4'b101_0: 	y = {1'b0,a ^ b};
4'b101_1:	y = {1'b0,~a};
4'b110_0:	y = {1'b0,a << 1};
4'b110_1:	y = {1'b0,a >> 1};			// 16
4'b111_0:	y = 0;            // 24
default:		y = 4'b0;
endcase
end
endmodule
