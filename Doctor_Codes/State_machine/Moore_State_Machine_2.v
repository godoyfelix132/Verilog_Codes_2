 
module Moore_State_Machine_2
(
	// Input Ports
	input clk,
	input reset,
	input Start,
	input Frame,
	input Finish,
	input Full,
	input Empty,

	// Output Ports
	output Mux,
	output Read,
	output Write,
	output Ready	
);

localparam IDLE = 1;
localparam FRAME = 2;
localparam LOAD_CH1 = 3;
localparam LOAD_CH2 = 4;
localparam FINISH = 5;
localparam READ_FIFO = 7; 

reg [2:0] state; 

reg mux_reg;
reg read_reg;
reg write_reg;
reg ready_reg;
/*------------------------------------------------------------------------------------------*/
/*Asignacion de estado, proceso secuencial*/
always@(posedge clk, negedge reset) begin

	if(reset == 1'b0)
			state <= IDLE;
	else 
		case(state)
			
			IDLE:
				if(Start == 1'b1)
					state <= FRAME;
				else
					state <= IDLE;					
			FRAME:
				if (Frame == 1'b1)
					state <= LOAD_CH1;
				else 
					state <= LOAD_CH2;	
			LOAD_CH1:
				if(Full)
					state <= FINISH;
				else
					state <= LOAD_CH1;
			LOAD_CH2:
				if(Full)
					state <= FINISH;
				else
					state <= LOAD_CH2;	
			FINISH:
					state <= READ_FIFO;
					
			READ_FIFO:
				if (Empty == 1'b1)
					state <= IDLE;
				else 
					state <= READ_FIFO;
					
			default:
					state <= IDLE;

			endcase
end//end always
/*------------------------------------------------------------------------------------------*/
/*Asignación de salidas,proceso combintorio*/
always@(*) begin
	mux_reg = 1'b0;
	read_reg = 1'b0;
	write_reg = 1'b0;
	ready_reg = 1'b0;
	
	 case(state)
		IDLE: 
			begin
				ready_reg = 1'b1;
			end

		LOAD_CH1: 
			begin
				mux_reg = 1'b1;
				write_reg = 1'b1;
			end
		LOAD_CH2:
			begin
				write_reg = 1'b1;
			end

		READ_FIFO:
			begin
				read_reg = 1'b1;
			end
	default: 		
			begin
				mux_reg = 1'b0;
				read_reg = 1'b0;
				write_reg = 1'b0;
				ready_reg = 1'b0;
			end

	endcase
end

// Asingnación de salidas

assign Mux = mux_reg;
assign Read = read_reg;
assign Write = write_reg;
assign Ready = ready_reg;

endmodule
