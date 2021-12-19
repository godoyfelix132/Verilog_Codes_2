module half_adder 
(
	input a,
	input b,
	output c,
	output s
);

assign s   = a ^ b;
assign c = a & b;  
 
endmodule
