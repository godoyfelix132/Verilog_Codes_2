/**************************************************************************************
*	Description
*		This is the tb for a sequential multiplier
*		1.0
*	Author:
*		Ing. Félix Godoy Martínez
*	Date:
*		14/07/20
***************************************************************************************/

/*`timescale <time_unit>/<time_precision>*/
`timescale 1ns/1ns 


module Sequential_Multiplier_tb;

parameter WORD_LENGTH = 5;

reg clk_tb = 0;
reg reset_tb = 0;

reg start_tb = 0;
reg load_tb = 0;
reg op_tb = 0;
reg [WORD_LENGTH-1 : 0] Data_tb;

wire ready_tb;
wire [2*WORD_LENGTH-1 : 0] Result_tb;
wire stored_tb;

Sequential_Multiplier
DUV
(
	.clk(clk_tb),
	.reset(reset_tb),
	.start(start_tb),
	.load(load_tb),
	.op(op_tb),
	.Data(Data_tb),
	
	.ready(ready_tb),
	.Result(Result_tb),
	.stored(stored_tb)
);

initial begin
	forever #10 clk_tb = !clk_tb;
end

initial begin
	#0	reset_tb = 1;
	#0 Data_tb = -13;
	#20 load_tb = 1;
	#40 load_tb = 0;
	#0 Data_tb = 11;
	#20 load_tb = 1;
	#20 load_tb = 0;
	#80 start_tb = 1;
	#20 start_tb = 0;
end 

endmodule
