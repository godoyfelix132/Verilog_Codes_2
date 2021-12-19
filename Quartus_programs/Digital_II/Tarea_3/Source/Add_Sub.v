module Add_Sub
#(
    parameter WORD_LENGTH = 5
) 
(
	 input sel,
    input [WORD_LENGTH - 1 : 0]a,
    input [WORD_LENGTH - 1 : 0]b,
	 
    output [WORD_LENGTH - 1 : 0]sum    
);

reg [WORD_LENGTH-1 : 0]sum_reg = 0;

always @(*) 
begin
    if (sel)
		sum_reg = a - b;
	 else
		sum_reg = a + b;
end

assign sum = sum_reg;

endmodule
