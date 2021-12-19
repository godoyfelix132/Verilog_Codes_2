/**************************************************************************************
*	Description
*		This is a 1 to 8 demultiplexer
*		1.0
*	Author:
*		Ing. Félix Godoy Martínez
*	Date:
*		11/02/21
***************************************************************************************/

module dmux(
	input		Data_in, 
   input 	[2:0]	sel,
   output	out_0,
   output	out_1,
   output	out_2,
   output	out_3,
	output	out_4,
   output	out_5,
   output	out_6,
   output	out_7
    );
  
	reg [7:0]out_reg;
	
	always @(Data_in or sel)
	begin
	  case (sel)
			3'b000 : begin
							out_reg[0] = Data_in;
							out_reg[1] = 0;
							out_reg[2] = 0;
							out_reg[3] = 0;
							out_reg[4] = 0;
							out_reg[5] = 0;
							out_reg[6] = 0;
							out_reg[7] = 0;
						 end
			3'b001 : begin
							out_reg[0] = 0;
							out_reg[1] = Data_in;
							out_reg[2] = 0;
							out_reg[3] = 0;
							out_reg[4] = 0;
							out_reg[5] = 0;
							out_reg[6] = 0;
							out_reg[7] = 0;
						 end
			3'b010 : begin
							out_reg[0] = 0;
							out_reg[1] = 0;
							out_reg[2] = Data_in;
							out_reg[3] = 0;
							out_reg[4] = 0;
							out_reg[5] = 0;
							out_reg[6] = 0;
							out_reg[7] = 0;
						 end
			3'b011 : begin
							out_reg[0] = 0;
							out_reg[1] = 0;
							out_reg[2] = 0;
							out_reg[3] = Data_in;
							out_reg[4] = 0;
							out_reg[5] = 0;
							out_reg[6] = 0;
							out_reg[7] = 0;
						 end
			3'b100 : begin
							out_reg[0] = 0;
							out_reg[1] = 0;
							out_reg[2] = 0;
							out_reg[3] = 0;
							out_reg[4] = Data_in;
							out_reg[5] = 0;
							out_reg[6] = 0;
							out_reg[7] = 0;
						 end
			3'b101 : begin
							out_reg[0] = 0;
							out_reg[1] = 0;
							out_reg[2] = 0;
							out_reg[3] = 0;
							out_reg[4] = 0;
							out_reg[5] = Data_in;
							out_reg[6] = 0;
							out_reg[7] = 0;
						 end
			3'b110 : begin
							out_reg[0] = 0;
							out_reg[1] = 0;
							out_reg[2] = 0;
							out_reg[3] = 0;
							out_reg[4] = 0;
							out_reg[5] = 0;
							out_reg[6] = Data_in;
							out_reg[7] = 0;
						 end
			3'b111 : begin
							out_reg[0] = 0;
							out_reg[1] = 0;
							out_reg[2] = 0;
							out_reg[3] = 0;
							out_reg[4] = 0;
							out_reg[5] = 0;
							out_reg[6] = 0;
							out_reg[7] = Data_in;
						 end
	  endcase
	end
 
assign out_0 = out_reg[0];
assign out_1 = out_reg[1];
assign out_2 = out_reg[2];
assign out_3 = out_reg[3];
assign out_4 = out_reg[4];
assign out_5 = out_reg[5];
assign out_6 = out_reg[6];
assign out_7 = out_reg[7];

    
endmodule
