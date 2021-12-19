/*`timescale <time_unit>/<time_precision>*/
`timescale 10ns/1ns //para una frecuencia de 50MHZ

module Counter_gray_tb;

parameter N_BITS = 5;

reg clk_tb = 1;
reg reset_tb = 0;
reg enable_tb = 0;

wire [N_BITS - 1:0] gray_count_tb;

Counter_gray 
#(
	.WIDTH(N_BITS)
) 
DUT
(
	.clk(clk_tb),
	.reset(reset_tb),
	.enable(enable_tb),
	.gray_count(gray_count_tb)
);

initial begin
	forever #10 clk_tb = !clk_tb;
end

initial begin
	#0 reset_tb = 1;
	#10 reset_tb = 0; 	
end

initial begin
	#0 enable_tb = 1; 	
end

endmodule
