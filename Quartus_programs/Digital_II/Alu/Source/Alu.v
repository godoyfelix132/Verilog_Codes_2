module Alu
#(
    parameter WORD_LENGTH = 4
)
(
    input [WORD_LENGTH-1:0]A,
    input [WORD_LENGTH-1:0]B,
    input [3:0]Ctrl,
	 input shifter,

    output Carry,
    output [WORD_LENGTH-1:0] C
);

reg [WORD_LENGTH-1:0]mask = {WORD_LENGTH{1'b1}};
reg [WORD_LENGTH-1:0]c_reg;
reg carry_reg;
reg [WORD_LENGTH-1:0]c_temp_reg;
reg [WORD_LENGTH-1:0]A_temp;

always @(*) begin

	case (Ctrl)
	
	
	4'b0000: c_temp_reg = A + B;
	4'b0001: c_temp_reg = A - B;
	4'b0010: c_temp_reg = A * B;
	4'b0011: c_temp_reg = A / B;
	4'b0100: c_temp_reg = A % B;
	
	
	4'b0101: c_temp_reg = A>>B;
	4'b0110: 
	if(shifter==1'b1)
		c_temp_reg = ~(~A>>B);
	else
		c_temp_reg = A>>B;
	4'b0111: c_temp_reg = A<<B;
	4'b1000: 
	if(shifter==1'b1)
		c_temp_reg = ~(~A<<B);
	else
		c_temp_reg = A<<B;
		
	4'b1001: c_temp_reg = &A;
	4'b1010: c_temp_reg = |A;
	4'b1011: c_temp_reg = ^A;
	
	
	4'b1100: c_temp_reg = A & B;
	4'b1101: c_temp_reg = A | B;
	4'b1110: c_temp_reg = A ^ B; 
	
	4'b1111: begin 
		if(A>B)c_temp_reg = 0;
		else if (A<B)c_temp_reg = 1;
		else c_temp_reg = 2;
		end
	default: c_temp_reg = 0; 
	endcase

	if (A+B > mask)
	begin
		carry_reg = 1'b1;
	end
	else begin
		carry_reg = 1'b0;
	end
	
   c_reg = c_temp_reg[WORD_LENGTH-1:0];

end

assign C = c_reg;
assign Carry = carry_reg;    
	 
endmodule