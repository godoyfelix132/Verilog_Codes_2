module Multiplier_divider_TOP
#(
    parameter WORD_LENGTH = 9
) 
(
    input clk,
    input reset,
	 
    input start,
	 input load,
	 input op,
    input [WORD_LENGTH-1 : 0] Data,
	 
    output ready,
    output [2*WORD_LENGTH-1 : 0] Result,
	 output stored
);

wire clkInter /*synthesis keep*/;

Clock_Gen	Clock_Gen_inst (
	.inclk0 ( clk ),
	.c0 ( clkInter )
	);


Sequential_Multiplier 
#(
    .WORD_LENGTH(WORD_LENGTH)
) 
Multiplier_divider
(
    .clk(clkInter),
    .reset(reset),	 
    .start(start),
	 .load(load),
	 .op(op),
    .Data(Data),
	 
    .ready(ready),
    .Result(Result),
	 .stored(stored)
);

endmodule
