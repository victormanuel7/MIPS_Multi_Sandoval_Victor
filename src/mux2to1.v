/* Multiplexor 4x1 with behavioral architecture */
module mux2to1#(parameter WIDTH=5)(I0, I1, Sel, Data_out);

   input [WIDTH-1:0] I0;
   input [WIDTH-1:0] I1;
   input Sel;
   output [WIDTH-1:0] Data_out;

assign Data_out=(Sel)? I1:I0;	
	
endmodule
