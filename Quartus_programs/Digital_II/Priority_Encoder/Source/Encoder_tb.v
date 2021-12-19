/**************************************************************************************
*	Description
*		This is a tb of an encoder
*		1.0
*	Author:
*		Ing. Félix Godoy Martínez
*	Date:
*		11/02/21
***************************************************************************************/

/*`timescale <time_unit>/<time_precision>*/
`timescale 1ns/1ps

module Encoder_tb;

reg 	[7:0] sel_tb; 
reg 	en_tb;
wire 	[2:0] A_tb;
wire 	GS_tb;
wire 	EO_tb;


Encoder
DUV
(
	// Input Ports
	.sel(sel_tb),
	.en(en_tb),

	// Output Ports
	.A(A_tb),
	.GS(GS_tb),
	.EO(EO_tb)
);

/*********************************************************/
initial begin
   #0 en_tb = 0;
	#10 sel_tb = 8'b11111111;
	#10 sel_tb = 8'b01111111;
	#10 sel_tb = 8'b10111111;
	#10 sel_tb = 8'b11011111;
	#10 sel_tb = 8'b11101111;
	#10 sel_tb = 8'b01111110;
	#10 sel_tb = 8'b01101111;
	#10 sel_tb = 8'b11111111;
	
end
/*********************************************************/

endmodule
