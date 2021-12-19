
/*`timescale <time_unit>/<time_precision>*/
`timescale 1ns/1ns 


module half_adder_tb;

reg a_reg;
reg b_reg;
wire c_reg;
wire s_reg;

half_adder
DUV
(
	.a(a_reg),
	.b(b_reg),
	.c(c_reg),
	.s(s_reg)
);

initial begin
	#0 a_reg = 1;
	#0 b_reg = 0;
	#10 a_reg = 1;
	#0 b_reg = 1;
end


endmodule