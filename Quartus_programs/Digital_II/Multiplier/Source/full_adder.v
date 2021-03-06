module full_adder 
(
	input a,
	input b,
	input cin,
	output cout,
	output s
);

wire c1_wire;
wire c2_wire;
wire s1_wire;

half_adder
half_adder_1
(
	.a(a),
	.b(b),
	.c(c1_wire),
	.s(s1_wire)
); 

half_adder
half_adder_2
(
	.a(s1_wire),
	.b(cin),
	.c(c2_wire),
	.s(s)
); 

assign cout = c2_wire | c1_wire;
 
endmodule
