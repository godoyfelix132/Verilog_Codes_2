module Encoder 
( 
	input [7:0] sel, 
	input en,
	output [2:0] A,
	output GS,
	output EO
);  

reg [4:0]out_reg;
 
always @(sel, en)  
begin  
			if (en)								out_reg <= 5'b11111;
	else	if (sel == 8'b11111111)			out_reg <= 5'b11110;
	else	if (!sel[7]) out_reg <= 5'b00001; 
	else	if (!sel[6]) out_reg <= 5'b00101;
	else 	if (!sel[5]) out_reg <= 5'b01001;
	else 	if (!sel[4]) out_reg <= 5'b01101; 
	else 	if (!sel[3]) out_reg <= 5'b10001;  
	else 	if (!sel[2]) out_reg <= 5'b10101;  	
	else 	if (!sel[1]) out_reg <= 5'b11001; 
	else 	if (!sel[0]) out_reg <= 5'b11101; 
	else 	out_reg <= 5'bxxxxx; 
end  

assign A[2] = out_reg[4];
assign A[1] = out_reg[3];
assign A[0] = out_reg[2];
assign GS = out_reg[1];
assign EO = out_reg[0];

endmodule 