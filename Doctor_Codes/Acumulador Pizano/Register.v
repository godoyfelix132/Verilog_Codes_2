 module Register 
#(
	parameter Word_Length = 8
)

(
	// Input Ports
	input clk,
	input reset,
	input enable,
	input [Word_Length-1:0] Data_Input,

	// Output Ports
	output [Word_Length-1:0] Data_Output
);

reg  [Word_Length-1:0] Data_reg;

always@(posedge clk or negedge reset) begin
	if(reset == 1'b0) 
		Data_reg <= 0;
	else 
	 if(enable)
		Data_reg <= Data_Input;
end

assign Data_Output = Data_reg;

endmodule
