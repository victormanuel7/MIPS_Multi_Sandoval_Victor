module Register#(parameter WIDTH = 5)(q, d, clk, reset, enable);

input [WIDTH-1:0] d;
input clk;
input enable;
input reset;
output reg [WIDTH-1:0]	q;


// Register with active-High clock & asynchronus reset & synchronus clock enable
always @ (posedge reset or posedge clk)
begin
	// Reset whenever the reset signal goes low, regardless of the clock
	// or the clock enable
	if (reset)
	begin
		q <= 0;
	end
	// If not resetting, and the clock signal is enabled on this register,
	// update the register output on the clock's rising edge
	else
	begin
		if (enable)
		begin
			q <= d;
		end
	end
end
endmodule
