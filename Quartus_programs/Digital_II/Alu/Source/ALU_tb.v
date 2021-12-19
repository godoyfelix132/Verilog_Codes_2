/*`timescale <time_unit>/<time_precision>*/
`timescale 10ns/1ns 

module ALU_tb;

parameter WORD_LENGTH = 4;

reg [WORD_LENGTH-1:0]A_tb;
reg [WORD_LENGTH-1:0]B_tb;
reg [3:0]Ctrl_tb;
reg shifter_tb;

wire Carry_tb;
wire [WORD_LENGTH-1:0] C_tb;

Alu
DUV
(
	.A(A_tb),
	.B(B_tb),
	.Ctrl(Ctrl_tb),
	.shifter(shifter_tb),
	
	.Carry(Carry_tb),
	.C(C_tb)
	
);

initial begin
	//Control 0000
	#0 A_tb = 4;
	#0 B_tb = 4;
	#0 Ctrl_tb = 0;
	#0 shifter_tb = 0;
	//Control 0001
	#10 A_tb = 7;
	#0 B_tb = 2;
	#0 Ctrl_tb = 1;
	#0 shifter_tb = 0;
	//Control 0010
	#10 A_tb = 4;
	#0 B_tb = 3;
	#0 Ctrl_tb = 2;
	#0 shifter_tb = 0;
	//Control 0011
	#10 A_tb = 8;
	#0 B_tb = 2;
	#0 Ctrl_tb = 3;
	#0 shifter_tb = 0;
	//Control 0100
	#10 A_tb = 2;
	#0 B_tb = 4;
	#0 Ctrl_tb = 4;
	#0 shifter_tb = 0;
	//Control 0101
	#10 A_tb = 5;
	#0 B_tb = 1;
	#0 Ctrl_tb = 5;
	#0 shifter_tb = 0;
	//Control 0110
	#10 A_tb = 5;
	#0 B_tb = 1;
	#0 Ctrl_tb = 6;
	#0 shifter_tb = 1;
	//Control 0111
	#10 A_tb = 5;
	#0 B_tb = 1;
	#0 Ctrl_tb = 7;
	#0 shifter_tb = 0;
	//Control 1000
	#10 A_tb = 5;
	#0 B_tb = 1;
	#0 Ctrl_tb = 8;
	#0 shifter_tb = 1;
	//Control 1001
	#10 A_tb = 7;
	#0 Ctrl_tb = 9;
	#0 shifter_tb = 0;
	//Control 1010
	#10 A_tb = 7;
	#0 Ctrl_tb = 10;
	#0 shifter_tb = 0;
	//Control 1011
	#10 A_tb = 7;
	#0 Ctrl_tb = 11;
	#0 shifter_tb = 0;
	//Control 1100
	#10 A_tb = 5;
	#0 B_tb = 4;
	#0 Ctrl_tb = 12;
	#0 shifter_tb = 0;
	//Control 1101
	#10 A_tb = 5;
	#0 B_tb = 4;
	#0 Ctrl_tb = 13;
	#0 shifter_tb = 0;
	//Control 1110
	#10 A_tb = 5;
	#0 B_tb = 4;
	#0 Ctrl_tb = 14;
	#0 shifter_tb = 0;
	//Control 1111
	#10 A_tb = 4;
	#0 B_tb = 8;
	#0 Ctrl_tb = 15;
	#0 shifter_tb = 0;
end

endmodule
