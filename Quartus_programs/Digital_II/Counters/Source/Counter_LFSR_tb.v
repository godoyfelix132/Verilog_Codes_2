/*`timescale <time_unit>/<time_precision>*/
`timescale 10ns/1ns //para una frecuencia de 50MHZ

module Counter_LSFR_tb;

reg clk_tb = 1;
wire [7:0] LFSR_tb;

Counter_LFSR
DUV
(
	.clk(clk_tb),

	.LFSR(LFSR_tb)
);

initial begin
	forever #10 clk_tb = !clk_tb;
end

endmodule