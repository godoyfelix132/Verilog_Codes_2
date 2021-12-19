module Counter_binary_TOP
#(
	parameter MAXIMUM_VALUE = 4'h9,
	parameter NBITS = 4,
	parameter FRECUENCY = 10000000
)
(
	input clk,
	input reset,
	input enable,
	
	output carry,
	output[NBITS - 1:0] counter
);

wire Output_clk_1Hz_wire;

Clock_Divider
#(
	.FRECUENCY(FRECUENCY)
)
Clk_1Hz
(
	.clk_FPGA(clk),
	.reset(reset),
	
	.Clock_Signal(Output_clk_1Hz_wire)
);

Counter_binary
Counter_binary_1
(
	.clk(Output_clk_1Hz_wire),
	.reset(reset),
	.enable(enable),
	
	.carry(carry),
	.counter(counter)
);

endmodule
