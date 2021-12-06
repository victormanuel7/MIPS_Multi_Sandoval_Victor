module Memory_System
#
(
parameter DATA_WIDTH=32,
parameter MEMORY_DEPTH=64)
(
input Write_Enable_i,
input clk,
input [DATA_WIDTH-1:0] Write_Data,
input [DATA_WIDTH-1:0] Address_i,

output reg [DATA_WIDTH-1:0] Instruction_o
);

//Declare the ROM variable
reg [DATA_WIDTH-1:0] rom [MEMORY_DEPTH-1:0];

//Declare outputs ROM and RAM
reg [DATA_WIDTH-1:0] Instruction_o_rom;
reg [DATA_WIDTH-1:0] Instruction_o_ram;

initial
	begin
		$readmemh("C:/PROYECTOS/Data path/src/text.dat", rom);
	end
	always @ (Address_i)
	begin
		Instruction_o_rom = rom[(Address_i-32'h00400000)>>2];
	end


// Declare the RAM variable
reg [DATA_WIDTH-1:0] ram[MEMORY_DEPTH-1:0];

	
always @ (posedge clk)
begin
	// Write
	if (Write_Enable_i)
			ram[(Address_i-32'h10100000)>>2] = Write_Data;
			Instruction_o_ram = ram[(Address_i-32'h10100000)>>2];
	end


always @*
begin
if (Address_i >= 32'h10100000)
	Instruction_o <= Instruction_o_ram;
else
	Instruction_o <= Instruction_o_rom;
end

endmodule
