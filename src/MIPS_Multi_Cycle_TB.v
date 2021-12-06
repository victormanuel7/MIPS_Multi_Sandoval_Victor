module MIPS_Multi_Cycle_TB();

reg clk;
reg reset;
reg RegDst;
reg ALUSrcA;
reg PCSrc;
reg PCWrite;
reg MemWrite;
reg IorD;
reg IRWrite;
reg MomtoReg;
reg RegWrite;
reg [2:0] ALUControl;
reg [1:0] ALUSrcB;

wire [32-1:0] Simulacion;
wire [32-1:0] pcounter;
wire [32-1:0] instr;
wire [32-1:0] out;


MIPS_Multi_Cycle UTT (
.clk(clk),
.reset(reset),
.RegDst(RegDst),
.ALUSrcA(ALUSrcA),
.PCSrc(PCSrc),
.PCWrite(PCWrite),
.MemWrite(MemWrite),
.IorD(IorD),
.IRWrite(IRWrite),
.MomtoReg(MomtoReg),
.RegWrite(RegWrite),
.ALUControl(ALUControl),
.ALUSrcB(ALUSrcB),

.Simulacion(Simulacion),
.pcounter(pcounter),
.instr(instr),
.out(out));

initial
    begin
		clk=1'b1;
		reset= 1'b1;
		
		#3 reset=1'b0;
		
//Primer instruccion addi t1,zero,3		
		#2 RegDst=1'bx;
			ALUSrcA=1'b0;
			PCSrc=1'b0;
			PCWrite=1'b1;
			MemWrite=1'b0;
			IorD=1'b0;
			IRWrite=1'b1;
			MomtoReg=1'bx;
			RegWrite=1'b0;
			ALUControl=3'b010;
			ALUSrcB=2'b01;
			
		#2 RegDst=1'bx;
			ALUSrcA=1'bx;
			PCSrc=1'bx;
			PCWrite=1'b0;
			MemWrite=1'b0;
			IorD=1'bx;
			IRWrite=1'b0;
			MomtoReg=1'bx;
			RegWrite=1'b0;
			ALUControl=3'bxxx;
			ALUSrcB=2'bxx;
			
		#2 RegDst=1'bx;
			ALUSrcA=1'b1;
			PCSrc=1'bx;
			PCWrite=1'bx;
			MemWrite=1'bx;
			IorD=1'bx;
			IRWrite=1'bx;
			MomtoReg=1'bx;
			RegWrite=1'bx;
			ALUControl=3'b010;
			ALUSrcB=2'b10;
			
		#2 RegDst=1'b0;
			ALUSrcA=1'b1;
			PCSrc=1'bx;
			PCWrite=1'bx;
			MemWrite=1'bx;
			IorD=1'bx;
			IRWrite=1'bx;
			MomtoReg=1'b0;
			RegWrite=1'b1;
			ALUControl=3'bxxx;
			ALUSrcB=2'bxx;

//Segunda instruccion addi t2,zero,7		
		#2 RegDst=1'bx;
			ALUSrcA=1'b0;
			PCSrc=1'b0;
			PCWrite=1'b1;
			MemWrite=1'b0;
			IorD=1'b0;
			IRWrite=1'b1;
			MomtoReg=1'bx;
			RegWrite=1'b0;
			ALUControl=3'b010;
			ALUSrcB=2'b01;
			
		#2 RegDst=1'bx;
			ALUSrcA=1'bx;
			PCSrc=1'bx;
			PCWrite=1'b0;
			MemWrite=1'b0;
			IorD=1'bx;
			IRWrite=1'b0;
			MomtoReg=1'bx;
			RegWrite=1'b0;
			ALUControl=3'bxxx;
			ALUSrcB=2'bxx;
			
		#2 RegDst=1'bx;
			ALUSrcA=1'b1;
			PCSrc=1'bx;
			PCWrite=1'bx;
			MemWrite=1'bx;
			IorD=1'bx;
			IRWrite=1'bx;
			MomtoReg=1'bx;
			RegWrite=1'bx;
			ALUControl=3'b010;
			ALUSrcB=2'b10;
			
		#2 RegDst=1'b0;
			ALUSrcA=1'bx;
			PCSrc=1'bx;
			PCWrite=1'bx;
			MemWrite=1'bx;
			IorD=1'bx;
			IRWrite=1'bx;
			MomtoReg=1'b0;
			RegWrite=1'b1;
			ALUControl=3'bxxx;
			ALUSrcB=2'bxx;
			
//Tercera instruccion addi t3,zero,1
		#2 RegDst=1'bx;
			ALUSrcA=1'b0;
			PCSrc=1'b0;
			PCWrite=1'b1;
			MemWrite=1'b0;
			IorD=1'b0;
			IRWrite=1'b1;
			MomtoReg=1'bx;
			RegWrite=1'b0;
			ALUControl=3'b010;
			ALUSrcB=2'b01;
			
		#2 RegDst=1'bx;
			ALUSrcA=1'bx;
			PCSrc=1'bx;
			PCWrite=1'b0;
			MemWrite=1'b0;
			IorD=1'bx;
			IRWrite=1'b0;
			MomtoReg=1'bx;
			RegWrite=1'b0;
			ALUControl=3'bxxx;
			ALUSrcB=2'bxx;
			
		#2 RegDst=1'bx;
			ALUSrcA=1'b1;
			PCSrc=1'bx;
			PCWrite=1'bx;
			MemWrite=1'bx;
			IorD=1'bx;
			IRWrite=1'bx;
			MomtoReg=1'bx;
			RegWrite=1'bx;
			ALUControl=3'b010;
			ALUSrcB=2'b10;
			
		#2 RegDst=1'b0;
			ALUSrcA=1'bx;
			PCSrc=1'bx;
			PCWrite=1'bx;
			MemWrite=1'bx;
			IorD=1'bx;
			IRWrite=1'bx;
			MomtoReg=1'b0;
			RegWrite=1'b1;
			ALUControl=3'bxxx;
			ALUSrcB=2'bxx;

//cuarta instruccion add t1,t1,t1
		#2 RegDst=1'bx;
			ALUSrcA=1'b0;
			PCSrc=1'b0;
			PCWrite=1'b1;
			MemWrite=1'b0;
			IorD=1'b0;
			IRWrite=1'b1;
			MomtoReg=1'bx;
			RegWrite=1'b0;
			ALUControl=3'b010;
			ALUSrcB=2'b01;
			
		#2 RegDst=1'bx;
			ALUSrcA=1'bx;
			PCSrc=1'bx;
			PCWrite=1'b0;
			MemWrite=1'b0;
			IorD=1'bx;
			IRWrite=1'b0;
			MomtoReg=1'bx;
			RegWrite=1'b0;
			ALUControl=3'bxxx;
			ALUSrcB=2'bxx;
			
		#2 RegDst=1'bx;
			ALUSrcA=1'b1;
			PCSrc=1'bx;
			PCWrite=1'bx;
			MemWrite=1'bx;
			IorD=1'bx;
			IRWrite=1'bx;
			MomtoReg=1'bx;
			RegWrite=1'bx;
			ALUControl=3'b010;
			ALUSrcB=2'b00;
			
		#2 RegDst=1'b1;
			ALUSrcA=1'bx;
			PCSrc=1'bx;
			PCWrite=1'bx;
			MemWrite=1'bx;
			IorD=1'bx;
			IRWrite=1'bx;
			MomtoReg=1'b0;
			RegWrite=1'b1;
			ALUControl=3'bxxx;
			ALUSrcB=2'bxx;
			
//quinta instruccion add t2,t2,t1
		#2 RegDst=1'bx;
			ALUSrcA=1'b0;
			PCSrc=1'b0;
			PCWrite=1'b1;
			MemWrite=1'b0;
			IorD=1'b0;
			IRWrite=1'b1;
			MomtoReg=1'bx;
			RegWrite=1'b0;
			ALUControl=3'b010;
			ALUSrcB=2'b01;
			
		#2 RegDst=1'bx;
			ALUSrcA=1'bx;
			PCSrc=1'bx;
			PCWrite=1'b0;
			MemWrite=1'b0;
			IorD=1'bx;
			IRWrite=1'b0;
			MomtoReg=1'bx;
			RegWrite=1'b0;
			ALUControl=3'bxxx;
			ALUSrcB=2'bxx;
			
		#2 RegDst=1'bx;
			ALUSrcA=1'b1;
			PCSrc=1'bx;
			PCWrite=1'bx;
			MemWrite=1'bx;
			IorD=1'bx;
			IRWrite=1'bx;
			MomtoReg=1'bx;
			RegWrite=1'bx;
			ALUControl=3'b010;
			ALUSrcB=2'b00;
			
		#2 RegDst=1'b1;
			ALUSrcA=1'bx;
			PCSrc=1'bx;
			PCWrite=1'bx;
			MemWrite=1'bx;
			IorD=1'bx;
			IRWrite=1'bx;
			MomtoReg=1'b0;
			RegWrite=1'b1;
			ALUControl=3'bxxx;
			ALUSrcB=2'bxx;
			
			//sexta instruccion add t3,t3,t1
		#2 RegDst=1'bx;
			ALUSrcA=1'b0;
			PCSrc=1'b0;
			PCWrite=1'b1;
			MemWrite=1'b0;
			IorD=1'b0;
			IRWrite=1'b1;
			MomtoReg=1'bx;
			RegWrite=1'b0;
			ALUControl=3'b010;
			ALUSrcB=2'b01;
			
		#2 RegDst=1'bx;
			ALUSrcA=1'bx;
			PCSrc=1'bx;
			PCWrite=1'b0;
			MemWrite=1'b0;
			IorD=1'bx;
			IRWrite=1'b0;
			MomtoReg=1'bx;
			RegWrite=1'b0;
			ALUControl=3'bxxx;
			ALUSrcB=2'bxx;
			
		#2 RegDst=1'bx;
			ALUSrcA=1'b1;
			PCSrc=1'bx;
			PCWrite=1'bx;
			MemWrite=1'bx;
			IorD=1'bx;
			IRWrite=1'bx;
			MomtoReg=1'bx;
			RegWrite=1'bx;
			ALUControl=3'b010;
			ALUSrcB=2'b00;
			
		#2 RegDst=1'b1;
			ALUSrcA=1'bx;
			PCSrc=1'bx;
			PCWrite=1'bx;
			MemWrite=1'bx;
			IorD=1'bx;
			IRWrite=1'bx;
			MomtoReg=1'b0;
			RegWrite=1'b1;
			ALUControl=3'bxxx;
			ALUSrcB=2'bxx;
		
    end

	 
always 
    begin
       #1 clk= ~clk;
    end

endmodule 