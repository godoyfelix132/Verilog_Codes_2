module multiplier
#(
	parameter N_BITS = 4
)
(
	input [N_BITS-1 : 0]x,
	input [N_BITS-1 : 0]y,
	output [2*N_BITS-1 : 0]s 
);

wire [N_BITS*N_BITS-2 : 0]s1_wire;

adders_cell
adders_cell_1
(
	.x(x),
	.b({1'b0, x[N_BITS-1 : 1] & {N_BITS-1{y[0]}}}),
	.y(y[1]),
	.s(s1_wire[N_BITS:0])
); 

genvar i;
generate
	for(i=1; i< N_BITS-1; i = i + 1)begin: gen_adders_cell
		adders_cell
		adders_cell_i
		(
			.x(x),
			.b(s1_wire[((N_BITS+1)*(i)-1) : ((N_BITS+1)*(i-1)+1)]),
			.y(y[i+1]),
			.s(s1_wire[((N_BITS+1)*(i+1)-1) : ((N_BITS+1)*(i)) ])
		); 
	end
endgenerate

genvar Asig;

generate
for(Asig=1; Asig< N_BITS-1; Asig = Asig + 1) begin: Asig_Values
	assign s[Asig+1] = s1_wire[(N_BITS+1)*Asig];
end
endgenerate

assign s[0] = x[0] & y[0];
assign s[1] = s1_wire[0];
assign s[2*N_BITS-1:N_BITS] = s1_wire[N_BITS*N_BITS-2:(N_BITS*N_BITS-N_BITS)-1]; 

endmodule
