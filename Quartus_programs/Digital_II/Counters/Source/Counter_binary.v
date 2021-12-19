module Counter_binary
#(
	parameter MAXIMUM_VALUE = 4'h9,
	parameter NBITS = 4
)

(
	input clk,
	input reset,
	input enable,
	output carry,
	output[NBITS - 1:0] counter
);

reg [NBITS-1 : 0] counter_reg;
reg t_reg = 0;
reg MaxValue_Bit = 0;

always@(posedge clk or negedge reset) begin
	if (reset == 1'b0)
		counter_reg <= {NBITS{1'b0}};
	else begin
		if(enable == 1'b1) begin				
			if(counter_reg == MAXIMUM_VALUE)
				
				counter_reg <= 0;
			else
				counter_reg <= counter_reg + 1'b1;
		end
	end
end

always@(counter_reg)begin
	if(counter_reg == MAXIMUM_VALUE)
		MaxValue_Bit = 1;
	else
		MaxValue_Bit = 0;
end

assign carry = MaxValue_Bit;
assign counter = counter_reg;

endmodule


