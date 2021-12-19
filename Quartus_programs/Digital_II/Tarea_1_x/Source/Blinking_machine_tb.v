/**************************************************************************************
*	Description
*		This is the tb for a Blinking machine
*		1.0
*	Author:
*		Ing. Félix Godoy Martínez
*	Date:
*		08/03/21
***************************************************************************************/

/*`timescale <time_unit>/<time_precision>*/
`timescale 1ns/1ns //para una frecuencia de 50MHZ
//`timescale 1ns/1ns

module Blinking_machine_tb;

reg clk_tb = 0;
reg reset_tb = 0;

wire out_tb;

Blinking_machine
DUV
(
	.clk(clk_tb),
	.reset(reset_tb),

	.out(out_tb)
);

initial begin
	forever #10 clk_tb = !clk_tb;
end

initial begin
	#0 reset_tb = 1;
end

endmodule
