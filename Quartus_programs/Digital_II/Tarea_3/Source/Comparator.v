module Comparator
#(
    parameter WORD_LENGTH = 5
) 
(
	input [WORD_LENGTH - 1:0]a,
	input [WORD_LENGTH - 1:0]b,

	output reg c
);

always@(*) begin
	if(a>=b)
		c = 1'b1;
	else
		c = 1'b0;
end	

endmodule
