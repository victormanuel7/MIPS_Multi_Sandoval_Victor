module MIPS_Multi_Cycle
#
(
parameter WIDTH=32
)
(
/*Senales de control*/
input clk,
input reset,
input RegDst,
input ALUSrcA,
input PCSrc,
input PCWrite,
input MemWrite,
input IorD,
input IRWrite,
input MomtoReg,
input RegWrite,
input [2:0] ALUControl,
input [1:0] ALUSrcB,

output [WIDTH-1:0] Simulacion,
output [WIDTH-1:0] out,
output [WIDTH-1:0] pcounter,
output [WIDTH-1:0] instr
//output [7:0] GPIO_o
);

wire [WIDTH-1:0] RF_A;
wire [WIDTH-1:0] RF_B;
reg [WIDTH-1:0] Adr;
reg [WIDTH-1:0] WData;

// Instanciacion registro 

// Instanciacion del sistema de memoria

wire [WIDTH-1:0] Instruction;

Memory_System Mem(.clk(clk), .Write_Data(RF_B), .Address_i(Adr), .Write_Enable_i(MemWrite), .Instruction_o(Instruction));

// Intsnaciacion del registro del sistema de memoria

wire [WIDTH-1:0] Ms_r;

Register #(.WIDTH(WIDTH)) R_MS (.clk(clk), .reset(reset), .d(Instruction), .enable(IRWrite), .q(Ms_r));

// Multiplexor Write Register - Register File

wire [4:0] Write_reg;

mux2to1 #(.WIDTH(5)) Mux_RF(.I0(Ms_r[20:16]), .I1(Ms_r[15:11]), .Sel(RegDst), .Data_out(Write_reg));

// Instanciacion del 

wire [WIDTH-1:0] SignImm;

Sign_Extend Sign_Ext(.d(Ms_r[15:0]), .q(SignImm));

// Instanciacion del Register file

wire [WIDTH-1:0] Read_data_1;
wire [WIDTH-1:0] Read_data_2;

Register_file2 Reg_file(.clk(clk), .reset(reset), .Read_Data_1_o(Read_data_1), .Read_Data_2_o(Read_data_2),
								.Read_Register_1_i(Ms_r[25:21]), .Read_Register_2_i(Ms_r[20:16]),
								.Write_Register_i(Write_reg), .Reg_Write_i(RegWrite), .Write_Data_i(WData));

// Registros de valores de lectura del Register file

Register #(.WIDTH(WIDTH)) R_RF_A(.d(Read_data_1), .clk(clk), .reset(reset), .enable(1'b1), .q(RF_A));
Register #(.WIDTH(WIDTH)) R_RF_B(.d(Read_data_2), .clk(clk), .reset(reset), .enable(1'b1), .q(RF_B));

// Multiplexor A ALU

wire [WIDTH-1:0] PC;
wire [WIDTH-1:0] SrcA;

mux2to1 #(.WIDTH(WIDTH)) Mux_A_PC(.I0(PC), .I1(RF_A), .Sel(ALUSrcA), .Data_out(SrcA));

// Instanciacion Multiplexor B ALU

wire [WIDTH-1:0] SrcB;

mux4to1 MUX_SrcB(.I0(RF_B), .I1(32'd4), .I2(SignImm), .I3(32'd0), .Sel(ALUSrcB), .Data_out(SrcB));

// Instanciacion ALU

wire [WIDTH:0] ALUResult;

ALU #(.WIDTH(WIDTH)) ALU_i (.y(ALUResult), .a(SrcA), .b(SrcB), .select(ALUControl));

// Instanciacion registro ALU

wire [WIDTH-1:0] ALUOut;

Register #(.WIDTH(WIDTH)) R_ALU(.d(ALUResult), .clk(clk), .reset(reset), .enable(1'b1), .q(ALUOut));

// Multiplexor 

reg [WIDTH-1:0] PC1;

always @*
begin 
 if(PCSrc) 
 PC1=ALUOut;
 else 
 PC1=ALUResult; 
end

// Registro PC

Register_PC #(.WIDTH(WIDTH)) R_pc(.d(PC1), .clk(clk), .reset(reset), .enable(PCWrite), .q(PC));

// Multiplexor 


always @*
begin 
 if(IorD) 
 Adr=ALUOut;
 else 
 Adr=PC; 
end

// Intsanciacion registro data

wire [WIDTH-1:0] data;

Register #(.WIDTH(WIDTH)) R_data(.d(Instruction), .clk(clk), .reset(reset), .enable(1'b1), .q(data));

// Multiplexor 


always @*
begin 
 if(MomtoReg) 
 WData=data;
 else 
 WData=ALUOut; 
end


assign pcounter=PC;
assign Simulacion = ALUResult;
assign instr=Ms_r;
assign out=ALUOut;

endmodule 
