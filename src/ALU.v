module ALU (y, a, b, select);		 // ARITHMETIC UNIT

parameter WIDTH = 3;

output 	[WIDTH: 0] 	y;
input		[WIDTH-1: 0]	a, b;
input		[2: 0]	select;
reg		[WIDTH: 0]	y;

always @ (*)
begin
y= 32'b0;
case (select)
3'b000:	y = a;
4'b001:	y = a + 1'b1;
3'b010:	y = a + b;
3'b011:	y = a + b + 1'b1;
3'b100:	y = a + {1'b0,~b};
3'b101:	y = a + ({1'b0,~b}) + 1'b1;
3'b110:	y = {1'b0,a} - 1'b1;
3'b111:	y = b;
endcase
end
endmodule
