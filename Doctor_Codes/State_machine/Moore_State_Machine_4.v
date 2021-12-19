 
module Moore_State_Machine_4
(
	// Input Ports
	input clk,
	input reset,
	input SW0,
	input SW1,

	// Output Ports
	output R,
	output B,
	output G	
);

localparam RED = 0;
localparam BLUE = 1;
localparam GREEN = 2;
localparam NON_COLOR = 3;

reg [1:0] state; 

reg r_reg;
reg b_reg;
reg g_reg;

wire [1:0] SWs;
/*------------------------------------------------------------------------------------------*/

assign SWs = {SW1, SW0};


/*Asignacion de estado, proceso secuencial*/
always@(posedge clk, negedge reset) begin

	if(reset == 1'b0)
			state <= RED;
	else 
		case(state)
			
			RED:
				case(SWs)
					2'b00: state <= NON_COLOR;
					2'b01: state <= BLUE;
					2'b10: state <= RED;
					2'b11: state <= RED;
					default: state <= NON_COLOR;
				endcase
					
			BLUE:
				if ((SW1 ==0 && SW0 == 0) || (SW1 ==0 && SW0 == 1))
					state <= BLUE;
				else if((SW1 ==1 && SW0 == 0))
					state <= RED;	
				else if((SW1 ==1 && SW0 == 1))
					state <= RED;
				else
					state <= NON_COLOR;
			GREEN:
				case(SWs)
					2'b00: state <= GREEN;
					2'b01: state <= RED;
					2'b10: state <= BLUE;
					2'b11: state <= NON_COLOR;
					default: state <= GREEN;
				endcase
			NON_COLOR:
				case(SWs)
						2'b00: state <= NON_COLOR;
						2'b01: state <= NON_COLOR;
						2'b10: state <= BLUE;
						2'b11: state <= RED;
						default: state <= GREEN;
				endcase
			default:
					state <= RED;

			endcase
end//end always
/*------------------------------------------------------------------------------------------*/
/*Asignación de salidas,proceso combintorio*/
always@(*) begin
	r_reg = 1'b0;
	b_reg = 1'b0;
	g_reg = 1'b0;
	case(state)

		RED: 
			begin
			r_reg = 1'b1;
			end
		
		BLUE: 
			begin
			b_reg = 1'b1;
			end
		GREEN:
			begin
			g_reg = 1'b1;
			end

	default: 		
			begin
			r_reg = 1'b0;
			b_reg = 1'b0;
			g_reg = 1'b0;
			end

	endcase
end

// Asingnación de salidas

assign R = r_reg;
assign B = b_reg;
assign G = g_reg;

endmodule
