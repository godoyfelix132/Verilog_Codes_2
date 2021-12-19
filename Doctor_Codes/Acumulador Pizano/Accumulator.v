 ///*synthesis keep*/
module Accumulator
#(
	parameter Word_Length = 8

)

(
	input clk,
	input reset,
	input enable,
	input Read,
	input [Word_Length-1:0] Data_Input,
	
	output clk_PLL,
	output [Word_Length-1:0] Data_Output
	


);


wire [Word_Length-1:0] Adder;

wire [Word_Length-1:0] ACC;
wire Shot_logic;
wire clkInter;



Clock_Gen	Clock_Gen_inst (
	.inclk0 ( clk ),
	.c0 ( clkInter )
	);

	
//assign  clkInter = clk;

assign clk_PLL = clkInter;



 One_Shot
 ShotModule
(
	// Input Ports
	.clk(clkInter),
	.reset(reset),
	.Start(enable),

	// Output Ports
	.Shot(Shot_logic)
);


assign Adder =  ACC + Data_Input;


 Register 
#(
	.Word_Length(Word_Length)
)
Accumulator
(
	// Input Ports
	.clk(clkInter),
	.reset(reset),
	.enable(Shot_logic),
	.Data_Input(Adder),

	// Output Ports
	.Data_Output(ACC)
);



 Register 
#(
	.Word_Length(Word_Length)
)
OutputRegister
(
	// Input Ports
	.clk(clkInter),
	.reset(reset),
	.enable(Read),
	.Data_Input(ACC),

	// Output Ports
	.Data_Output(Data_Output)
);


endmodule






