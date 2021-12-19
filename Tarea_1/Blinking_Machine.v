/**************************************************************************************
*	Description
*		This is a Blinking Machine
*		1.0
*	Author:
*		Ing. Félix Godoy Martínez
*	Date:
*		08/03/21
***************************************************************************************/

module Blinking_Machine
(
	input clk,
	input reset,
	
	output out
);

localparam ON = 1'b0;
localparam OFF = 1'b1;


reg state;



reg [3:0] cicles;
reg out_reg;

always@(posedge clk or negedge reset) begin	
	if (reset == 1'b0)
	begin
		state <= ON;
		cicles <= 4'b0000;
	end
	else
	begin
		cicles <= cicles + 4'b0001;
		case(state)
			ON:
			if (cicles == 4'b0110)
				state <= OFF;
			else
				state <= ON;
			OFF:
			if (cicles == 4'b1010)
			begin
				state <= ON;
				cicles <= 4'b0000;
			end
			else
				state <= OFF;
			default: 
				state <= ON;
		endcase
	end
end

always @(*) begin
	case (state)
		ON:
		begin
			out_reg = 1;
		end
		OFF:
		begin
			out_reg = 0;
		end
		default: 
			out_reg = 0;
	endcase	
end

assign out = out_reg;

endmodule
