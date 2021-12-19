/**************************************************************************************
*	Description
*		This is a secuential multiplier
*		1.0
*	Author:
*		Ing. Félix Godoy Martínez
*	Date:
*		10/03/21
***************************************************************************************/

module Sequential_Multiplier 
#(
	parameter WORD_LENGTH = 5
)
(
    input clk,
    input reset,
    input start,
    input [WORD_LENGTH-1 : 0] Multiplicand,
    input [WORD_LENGTH-1 : 0] Multiplier,

    output ready,
    output [2*WORD_LENGTH-1 : 0] Product
);
localparam max_cicles = {WORD_LENGTH{1'b1}};
localparam [WORD_LENGTH-1 : 0]negative_line = {WORD_LENGTH{1'b1}} - {WORD_LENGTH-1{1'b1}};
localparam [2*WORD_LENGTH-1 : 0] fill_negative = {2*WORD_LENGTH{1'b1}} - {WORD_LENGTH{1'b1}};
	 
reg flag;
reg [WORD_LENGTH:0]cicles;
 

reg [2*WORD_LENGTH-1 : 0] Multiplier_reg;
reg [2*WORD_LENGTH-1 : 0] Multiplicand_reg;

reg ready_reg;

reg [2*WORD_LENGTH-1 : 0]Product_reg;
reg [2*WORD_LENGTH-1 : 0]Product__temp_reg;

reg values_assigned_reg;



always @(posedge clk or negedge reset) 
begin
	
	if(reset == 1'b0)
	begin 
		//flow control
		flag <= 1'b0;
		cicles <= 1'b0;
		values_assigned_reg <= 0;
		//assign values 0
		Multiplicand_reg <= 0;
		Multiplier_reg <= 0;	
		Product__temp_reg <= 0;
		
		//output control
		ready_reg <= 1'b0;
		Product_reg <= 1'b0;	
	end
	else
	begin
		//assign values to work
		if(values_assigned_reg == 1'b0)
		begin
			if(Multiplicand > negative_line)
				Multiplicand_reg <= Multiplicand + fill_negative;
			else
				Multiplicand_reg <= Multiplicand;
				
			if(Multiplier > negative_line)
				Multiplier_reg <= Multiplier + fill_negative;
			else
				Multiplier_reg <= Multiplier;
		end
		// Begin the work cicle 
		if((start == 1'b0 && flag == 1'b0) || (start == 1'b1 && flag == 1'b1))
		begin
			//flow control
			values_assigned_reg = 1'b1;
			flag <= 1'b1;
			cicles <= cicles + 1'b1;
			//output control
			ready_reg <= 1'b0;
			Product_reg <= 1'b0;	
			//operatition
			if(Multiplier_reg & ({2*WORD_LENGTH{1'b0}} + 1'b1) )
			begin
				Product__temp_reg <= Product__temp_reg - (Multiplicand_reg);
			end
			Multiplicand_reg <= Multiplicand_reg << 1;
			Multiplier_reg <= Multiplier_reg >> 1;
		end
		

		if(cicles == max_cicles)
		begin
		  //flow control
		  flag <= 1'b0;
		  cicles <= 1'b0;
		  //output control
		  ready_reg <= 1'b1;
		  Product_reg <= Product__temp_reg;
		  //cleanig product
		  Product__temp_reg <= 1'b0;
		  values_assigned_reg = 1'b0;
		end

	end

end

assign Product = Product_reg;
assign ready = ~ready_reg; 

endmodule
