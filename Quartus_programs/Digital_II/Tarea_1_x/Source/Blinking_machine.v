/**************************************************************************************
*	Description
*		This is a Blinking Machine
*		1.0
*	Author:
*		Ing. Félix Godoy Martínez
*	Date:
*		08/03/21
***************************************************************************************/

module Blinking_machine
(
	input clk,
	input reset,
	
	output out
);

localparam ON = 0;
localparam OFF = 1;

reg [0:0]state;
reg [3:0] cicles;
reg out_reg;

always@(posedge clk or negedge reset)begin
	if (reset == 1'b0)
		cicles <= 4'b0000;
	else
	begin
		if (cicles == 4'b1010)
			cicles <= 4'b0000;
		else
			cicles <= cicles + 4'b0001;
	end
end


always@(posedge clk or negedge reset) begin	
	if (reset == 1'b0)
	begin
		state <= ON;
	end
	else
	begin
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
