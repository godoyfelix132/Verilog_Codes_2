 
module Mealy_Sequence_Detector
(
	// Input Ports
	input clk,
	input rst,
	input x,

	// Output Ports
	output z	
);

localparam RESET = 0;
localparam GOT_1 = 1;
localparam GOT_10 = 2;
localparam GOT_101 = 3;


reg [1:0] state; 

reg z_b;

/**************************************************************************************/
always@(posedge clk, negedge rst) begin

	if(rst == 1'b0)
			state <= RESET;
	else 
	   case(state)
		
			RESET:
				if(x == 1'b1)
					state <= GOT_1;
				else
					state <= RESET;					
			GOT_1:
				if (x == 1'b1)
					state <= GOT_1;
				else 
					state <= GOT_10;	
			GOT_10:
				if(x == 1'b1)
					state <= GOT_101;
				else
					state <= RESET;
			GOT_101:
				if(x == 1'b1)
					state <= GOT_1;
				else
					state <= GOT_10;	
					
			default:
					state <= RESET;

			endcase
end//end always

/**************************************************************************************/

assign z = ( state == GOT_10 && x==1'b1 ) ? 1'b1 : 1'b0;



endmodule
