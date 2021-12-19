
/*`timescale <time_unit>/<time_precision>*/
`timescale 1ns/1ns 


module full_adder_tb;

reg a_reg;
reg b_reg;
reg cin_reg;
wire cout_reg;
wire s_reg;

full_adder
DUV
(
	.a(a_reg),
	.b(b_reg),
	.cin(cin_reg),
	.cout(cout_reg),
	.s(s_reg)
);

initial begin
	#0 a_reg = 1;
	#0 b_reg = 0;
	#0 cin_reg = 1;
	#10 a_reg = 1;
	#0 b_reg = 1;
	#0 cin_reg = 1;
	#10 a_reg = 1;
	#0 b_reg = 0;
	#0 cin_reg = 1;
	#10 a_reg = 0;
	#0 b_reg = 0;
	#0 cin_reg = 1;
end

endmodule
