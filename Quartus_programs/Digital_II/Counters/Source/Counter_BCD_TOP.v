module Counter_BCD_TOP
#(
	parameter MAXIMUM_VALUE = 4'h9,
	parameter NBITS = 4,
	parameter FRECUENCY = 10000000
)
(
	input clk,
	input reset,
	input enable,
	
	output[NBITS - 1:0] counter_u,
	output[NBITS - 1:0] counter_d
);

wire Output_clk_1Hz_wire;
wire Output_carry_wire;

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
#(
	.MAXIMUM_VALUE(MAXIMUM_VALUE),
	.NBITS(NBITS)
)
Counter_Units
(
	.clk(Output_clk_1Hz_wire),
	.reset(reset),
	.enable(enable),
	
	.carry(Output_carry_wire),
	.counter(counter_u)
);

Counter_binary
#(
	.MAXIMUM_VALUE(MAXIMUM_VALUE),
	.NBITS(NBITS)
)
Counter_Tens
(
	.clk(Output_clk_1Hz_wire),
	.reset(reset),
	.enable(Output_carry_wire),
	
	.counter(counter_d)
);

endmodule