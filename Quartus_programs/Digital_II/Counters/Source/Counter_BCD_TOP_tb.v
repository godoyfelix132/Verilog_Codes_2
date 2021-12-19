/*`timescale <time_unit>/<time_precision>*/
`timescale 10ns/1ns //para una frecuencia de 50MHZ

module Counter_BCD_TOP_tb;

parameter NBITS = 4;

reg clk_FPGA_tb = 0;
reg reset_tb = 0;
reg enable_tb = 0;

wire [NBITS - 1:0] counter_u_tb;
wire [NBITS - 1:0] counter_d_tb;

Counter_BCD_TOP
DUV
(
	.clk(clk_FPGA_tb),
	.reset(reset_tb),
	.enable(enable_tb),
	
	.counter_u(counter_u_tb),
	.counter_d(counter_d_tb)
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
