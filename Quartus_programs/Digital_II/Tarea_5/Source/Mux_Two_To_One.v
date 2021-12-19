/**************************************************************************************
*	Description
*		This is a 2 to 1 multiplexer that can be parameterized in it's bit-width.
*		1.0
*	Author:
*		Ing. Félix Godoy Martínez
*	Date:
*		26/06/20
***************************************************************************************/

module Mux_Two_To_One
#(
	parameter N_BITS = 8
)
(
	// Input Ports
	input Selector,
	input [N_BITS-1 : 0] Data_0,
	input [N_BITS-1 : 0] Data_1,
	
	// Output Ports
	output [N_BITS-1 : 0] Mux_Output

);

reg [N_BITS-1 : 0]Mux_Output_reg = 0;

always @(*) 
begin
    if (Selector)
		Mux_Output_reg = Data_1;
	 else
		Mux_Output_reg = Data_0;
end

assign Mux_Output = Mux_Output_reg;
endmodule




