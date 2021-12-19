module Sequential_Divider #(parameter WORD_LENGTH = 5)
(
	////// Entradas //////
	input [WORD_LENGTH-1:0] Dividendo,
	input [WORD_LENGTH-1:0] Divisor,
	input clk,
	input reset,
	input start,

	output [WORD_LENGTH-1:0] Resultado,
	output ready
); 


reg [WORD_LENGTH-1:0] Q;
reg [WORD_LENGTH-1:0] M;
reg [WORD_LENGTH:0] A;
reg [2*WORD_LENGTH:0] temp;
reg [2:0] N = 3'b101;
reg ready_reg;


always @(posedge clk, negedge reset) begin
		if (reset == 0) begin
			Q = Dividendo;
			M = Divisor;
			A = 0;
			ready_reg = 0;
		end 
		else begin
			if(N != 0) begin
				temp = {A,Q};
				temp = temp << 1;
				Q = temp [WORD_LENGTH-1:0];
				A = temp [WORD_LENGTH*2:WORD_LENGTH];
				A = A - M;
				N = N-1;
				if(A & {1'b1,{(WORD_LENGTH-1){1'b0}}}) begin
					A = A+M;
				end else
					Q[0] = 1;
			end
			else begin
				ready_reg = 1;
			end
		end
end

assign Resultado = Q; 
assign ready = ready_reg;

endmodule
