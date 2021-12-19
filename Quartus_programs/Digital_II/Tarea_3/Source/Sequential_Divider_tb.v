`timescale 1ns/1ns

module Sequential_Divider_tb #(parameter WORD_LENGTH = 5);

//////// Entradas ///////
reg clk = 0;
reg reset = 0;
reg [WORD_LENGTH-1:0] Dividendo = 15;
reg [WORD_LENGTH-1:0] Divisor = 5;
reg start = 0;
	
///// Salidas /////
wire [WORD_LENGTH-1:0] res;
wire ready;

////////Instancia del cirucito a probar /////
Sequential_Divider #(WORD_LENGTH) DUT
(
	.clk(clk),
	.reset(reset),
	.Dividendo(Dividendo),
	.Divisor(Divisor),
	.start(start),
	.Resultado(res),
	.ready(ready)
);


initial begin
	forever #10 clk = !clk;
end

/// Asignacion de valores a reset ///
initial begin
	#0 reset = 0;
	#10 reset = 1;
	#10 start = 1;
	#20 start = 0;
end

endmodule