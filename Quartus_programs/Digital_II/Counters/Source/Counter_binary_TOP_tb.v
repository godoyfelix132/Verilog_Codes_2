/*`timescale <time_unit>/<time_precision>*/
`timescale 10ns/1ns //para una frecuencia de 50MHZ

module Counter_binary_TOP_tb;

parameter NBITS = 4;

reg clk_FPGA_tb = 0;
reg reset_tb = 0;
reg enable_tb = 0;

wire carry_tb;
wire [NBITS - 1:0] counter_tb;

Counter_binary_TOP
DUV
(
	.clk(clk_FPGA_tb),
	.reset(reset_tb),
	.enable(enable_tb),
	.carry(carry_tb),
	.counter(counter_tb)
);

initial begin
	forever #10 clk_FPGA_tb = !clk_FPGA_tb;
end

initial begin
	#0 reset_tb = 1; 	
end

initial begin
	#0 enable_tb = 1; 	
end

endmodule
