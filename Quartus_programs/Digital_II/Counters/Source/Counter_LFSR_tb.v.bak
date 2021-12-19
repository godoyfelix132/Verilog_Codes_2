/*`timescale <time_unit>/<time_precision>*/
`timescale 10ns/1ns //para una frecuencia de 50MHZ

module Counter_one_hot_tb;

reg clk_FPGA_tb = 1;
reg enable_tb;  
reg reset_tb=0;

wire [7:0] out_tb;

Counter_one_hot
DUV
(
	.enable(enable_tb),  
	.clk(clk_FPGA_tb),
	.reset(reset_tb),

	.out(out_tb)
);

initial begin
	forever #10 clk_FPGA_tb = !clk_FPGA_tb;
end

initial begin
	#0 reset_tb = 1;
	#100 reset_tb = 0;
	#10 reset_tb = 1;
end

initial begin
	#0 enable_tb = 1; 	
end

endmodule