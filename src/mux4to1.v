/* Multiplexor 4x1 with behavioral architecture */
module mux4to1(I0, I1, I2, I3, Sel, Data_out);

   input [31:0] I0;
   input [31:0] I1;
   input [31:0] I2;   
   input [31:0] I3;
   input [1:0] Sel;
   output [31:0] Data_out;
   reg [31:0] Data_out;

   // constant declaration
   parameter S0 = 2'b00;
   parameter S1 = 2'b01;
   parameter S2 = 2'b10;
   parameter S3 = 2'b11;

   always @ (*)
   begin
      case(Sel)
         S0: begin
            Data_out <= I0;
         end
         S1: begin
            Data_out <= I1;
         end
         S2: begin
            Data_out <= I2;
         end
         S3: begin
            Data_out <= I3;
         end
			endcase
   end
endmodule
// De lo que has aprendido, que mejora sugieres?
/* Realice la descripcion del MUX parametrizable
con arquitectura RTL */
/*module mux4to1
   #(parameter WIDTH=4)
   (input [WIDTH-1:0] I0,I1,I2,I3,
    input [1:0] Sel,
    output [WIDTH-1:0] Data_out);
//PARTE DECLARATORIA: Nets y variables
    wire [WIDTH-1:0] I [4];
//PARTE OPERATORIA
    assign I[0]=I0;
    assign I[1]=I1;
    assign I[2]=I2;
    assign I[3]=I3;
    assign Data_out =I[Sel];
   endmodule*/