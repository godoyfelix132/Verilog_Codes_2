/*`timescale <time_unit>/<time_precision>*/
`timescale 1ns/1ns 


module multiplier_tb;

parameter N_BITS = 4;

reg [N_BITS-1 : 0]x_reg;
reg [N_BITS-1 : 0]y_reg;
wire [2*N_BITS-1 : 0]s_reg;

multiplier
DUV
(
	.x(x_reg),
	.y(y_reg),
	.s(s_reg) 
);

initial begin
	#0 x_reg = 8;
	#0 y_reg = 5;
	#10 x_reg = 6;
	#0 y_reg = 12;
	#10 x_reg = 15;
	#0 y_reg = 15;
	#10 x_reg = 12;
	#0 y_reg = 11;

end

endmodule
