module MIPS_Multi_Cycle
#
(
parameter WIDTH=32
)
(
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
output [7:0] GPIO_o);

/*Senales de control*/

// Instanciacion registro 

// Instanciacion del sistema de memoria

wire [WIDTH-1:0] Instruction;

Memory_System Mem(.clk(clk), .Write_Data(RF_B), .Address_i(Adr), .Write_Enable_i(MemWrite), .Instruction_o(Instruction));

// Intsnaciacion del registro del sistema de memoria

wire [WIDTH-1:0] Ms_r;

Register #(.WIDTH(WIDTH)) R_MS (.clk(clk), .reset(reset), .d(Instruction), .enable(IRWrite), .q(Ms_r));

// Multiplexor Write Register - Register File

reg [5:0] Write_reg;

always @*
begin 
 if(RegDst) 
 Write_reg= Ms_r[15:11];
 else 
 Write_reg=Ms_r[20:16]; 
end

// Instanciacion del 

wire [WIDTH-1:0] SignImm;

Sign_Extend (.d(Ms_r[15:0]), .q(SignImm));

// Instanciacion del Register file

wire [WIDTH-1:0] Read_data_1;
wire [WIDTH-1:0] Read_data_2;

Register_file2 Reg_file(.clk(clk), .reset(reset), .Read_Data_1_o(Read_data_1), .Read_Data_2_o(Read_data_2),
								.Read_Register_1_i(Ms_r[25:21]), .Read_Register_2_i(Ms_r[20:16]),
								.Write_Register_i(Write_reg), .Reg_Write_i(RegWrite), .Write_Data_i(WData));

// Registros de valores de lectura del Register file

wire [WIDTH-1:0] RF_A;
wire [WIDTH-1:0] RF_B;

Register #(.WIDTH(WIDTH)) R_RF_A(.d(Read_data_1), .clk(clk), .reset(reset), .enable(1'b1), .q(RF_A));
Register #(.WIDTH(WIDTH)) R_RF_B(.d(Read_data_2), .clk(clk), .reset(reset), .enable(1'b1), .q(RF_B));

// Multiplexor A ALU

wire [WIDTH-1:0] PC;
reg [WIDTH-1:0] SrcA;

always @*
begin 
 if(ALUSrcA) 
 SrcA=RF_A;
 else 
 SrcA=PC; 
end

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

reg [WIDTH-1:0] Adr;

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

reg [WIDTH-1:0] WData;

always @*
begin 
 if(MomtoReg) 
 WData=data;
 else 
 WData=ALUOut; 
end

endmodule 
