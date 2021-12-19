module Control
#(
    parameter WORD_LENGTH = 5
) 
(
	 input clk,
    input reset,
	 input One_Shot,
	 input Start,
	 input Op,
	 input Finish_div,
	 
    output Ready,
	 output Select_Data,
	 output Loaded_1,
	 output Loaded_2,
	 output Rst,
	 output Shift,
	 output Result_reg,
	 output Load_1,
	 output Load_2,
	 output Start_div
);

localparam max_cicles = {WORD_LENGTH{1'b1}};

localparam INIT = 0;
localparam LOAD_1 = 1;
localparam LOAD_2 =2;
localparam WAIT = 3;
localparam PROCESS_M = 4;
localparam PROCESS_D = 5;


reg [2:0] state = 0;

reg Ready_reg;
reg Select_Data_reg;
reg Loaded_1_reg;
reg Loaded_2_reg;
reg Rst_reg;
reg Shift_reg;
reg Result_reg_reg;
reg Load_1_reg;
reg Load_2_reg;
reg Start_div_reg;
reg [WORD_LENGTH-1:0]cicles;

always @(posedge clk or negedge reset) 
begin
    if (reset == 1'b0)
    state <= INIT;
    else
    begin
        case(state)
			  INIT:
			  begin
					cicles <= 1'b0;
					if (One_Shot == 1'b1)
						state <= LOAD_1;
					else
						state <= INIT;
			  end
			  
			  LOAD_1:
			  begin		
					if (One_Shot == 1'b1)
						state <= LOAD_2;
					else
						state <= LOAD_1;
				end
				
			  LOAD_2:
			  begin		
					if (Start == 1'b1)
						state <= WAIT;
					else
						state <= LOAD_2;
				end
				
			  WAIT:
			  begin		
					if (Op == 1'b0)
						state <= PROCESS_M;
					else
						state <= PROCESS_D;
			  end
			  
			  PROCESS_M:
			  begin
					cicles <= cicles + 1'b1;
					if (cicles == max_cicles)
						state <= INIT;		
					else
						state <= PROCESS_M;
			  end
			  
			  PROCESS_D:
			  begin
					cicles <= cicles + 1'b1;
					if (~Finish_div)
						state <= INIT;		
					else
						state <= PROCESS_D;
			  end
			  
			  default: 
					state <= INIT;
        
		  endcase
    end
end

always @(*) begin
    case(state)
        INIT:
        begin
				Ready_reg 			= 1'b1;
				Select_Data_reg 	= 1'b0;
				Loaded_1_reg 		= 1'b0;
				Loaded_2_reg	 	= 1'b0;
				Rst_reg 				= 1'b0;
				Shift_reg 			= 1'b0;
				Result_reg_reg		= 1'b0;	
				Load_1_reg 			= 1'b0;
				Load_2_reg 			= 1'b0;
				Start_div_reg		= 1'b0;
        end 
        LOAD_1:
        begin
				Ready_reg 			= 1'b0;
				Select_Data_reg 	= 1'b1;
				Loaded_1_reg 		= 1'b1;
				Loaded_2_reg	 	= 1'b0;
				Rst_reg 				= 1'b1;
				Shift_reg 			= 1'b0;
				Result_reg_reg		= 1'b0;
				Load_1_reg 			= 1'b1;
				Load_2_reg 			= 1'b0;
				Start_div_reg		= 1'b0;
			
        end
        LOAD_2:
        begin
				Ready_reg 			= 1'b0;
				Select_Data_reg 	= 1'b0;
				Loaded_1_reg 		= 1'b0;
				Loaded_2_reg	 	= 1'b1;
				Rst_reg 				= 1'b1;
				Shift_reg 			= 1'b0;
				Result_reg_reg		= 1'b0;
				Load_1_reg 			= 1'b0;
				Load_2_reg 			= 1'b1;
				Start_div_reg		= 1'b0;
        end
		  
		  WAIT:
        begin
				Ready_reg 			= 1'b0;
				Select_Data_reg 	= 1'b0;
				Loaded_1_reg 		= 1'b0;
				Loaded_2_reg	 	= 1'b1;
				Rst_reg 				= 1'b0;
				Shift_reg 			= 1'b0;
				Result_reg_reg		= 1'b0;
				Load_1_reg 			= 1'b0;
				Load_2_reg 			= 1'b1;
				Start_div_reg		= 1'b0;
        end
        
		  PROCESS_M:
        begin
				Ready_reg 			= 1'b0;
				Select_Data_reg 	= 1'b0;
				Loaded_1_reg 		= 1'b0;
				Loaded_2_reg	 	= 1'b0;
				Rst_reg 				= 1'b0;
				Shift_reg 			= 1'b1;
				Result_reg_reg		= 1'b1;
				Load_1_reg 			= 1'b0;
				Load_2_reg 			= 1'b0;
				Start_div_reg		= 1'b0;				
        end
		  PROCESS_D:
        begin
				Ready_reg 			= 1'b0;
				Select_Data_reg 	= 1'b0;
				Loaded_1_reg 		= 1'b0;
				Loaded_2_reg	 	= 1'b0;
				Rst_reg 				= 1'b0;
				Shift_reg 			= 1'b1;
				Result_reg_reg		= 1'b1;
				Load_1_reg 			= 1'b0;
				Load_2_reg 			= 1'b0;
				Start_div_reg		= 1'b1;				
        end
		  
    endcase
    
end

assign Ready = Ready_reg;
assign Select_Data = Select_Data_reg;
assign Loaded_1 = Loaded_1_reg;
assign Loaded_2 = Loaded_2_reg;
assign Rst = Rst_reg;
assign Shift = Shift_reg;
assign Result_reg = Result_reg_reg;
assign Load_1 = Load_1_reg;
assign Load_2 = Load_2_reg;
assign Start_div = Start_div_reg;

endmodule
