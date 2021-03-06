module adders_cell 
#(
	parameter N_BITS = 4
)
(
	input [N_BITS-1 : 0]x,
	input [N_BITS-1 : 0]b,
	input y,
	output [N_BITS : 0]s 
);

wire [N_BITS-1 : 0]c_wire;

half_adder
half_adder_1
(
	.a(y & x[0]),
	.b(b[0]),
	.c(c_wire[0]),
	.s(s[0])
); 

genvar i;
generate
	for(i=1; i< N_BITS; i = i + 1)begin: gen_adders_cell
	
		full_adder
		full_adder_i
		(
			.a(x[i] & y),
			.b(b[i]),
			.cin(c_wire[i-1]),
			.cout(c_wire[i]),
			.s(s[i])
		); 
	end
endgenerate

assign s[N_BITS] = c_wire[N_BITS-1];

endmodule

